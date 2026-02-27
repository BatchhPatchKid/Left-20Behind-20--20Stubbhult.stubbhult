params ["_unit"];

// AI magic decisions are authoritative on the server to keep cooldown/resource state in one place.
if (!isServer) exitWith {};
if (isNull _unit) exitWith {};

// Maximum range the AI considers for offensive targeting.
private _rangedMax = 50;

// Minimum delay between any two AI spell casts, regardless of faction/spell.
private _globalCastCooldown = 6;

// Shared gate for all spell casts:
// 1) validate ritual resource,
// 2) validate global + per-spell cooldowns,
// 3) reserve ritual cost and start cooldowns.
private _canCast = {
    params ["_caster", "_spellId", "_cost", "_domain", "_cooldownSeconds"];

    private _ritualVar = switch (_domain) do {
        case "greek": { "ritualStatusZeus" };
        case "wanderer": { "ritualStatusWanderer" };
        default { "ritualStatusPig" };
    };

    private _currentRitual = _caster getVariable [_ritualVar, 0];
    if (_currentRitual < _cost) exitWith { false };

    private _globalUntil = _caster getVariable ["LB_magicGlobalCooldownUntil", 0];
    if (time < _globalUntil) exitWith { false };

    private _spellCooldowns = _caster getVariable ["LB_magicSpellCooldowns", createHashMap];
    private _spellUntil = _spellCooldowns getOrDefault [_spellId, 0];
    if (time < _spellUntil) exitWith { false };

    // Resource spending now happens in the brain so each spell script can focus on effect logic.
    _caster setVariable [_ritualVar, (_currentRitual - _cost) max 0, true];

    _spellCooldowns set [_spellId, time + _cooldownSeconds];
    _caster setVariable ["LB_magicSpellCooldowns", _spellCooldowns, false];
    _caster setVariable ["LB_magicGlobalCooldownUntil", time + _globalCastCooldown, false];

    true
};

while {alive _unit} do {
    // Discipline selects which spell package and ritual pool this AI is allowed to use.
    private _discipline = _unit getVariable ["LB_magicDiscipline", ""];
    if !(_discipline in ["pig", "greek", "wanderer"]) exitWith {};

    // Acquire nearby hostile human targets.
    private _enemyMen = (getPosATL _unit) nearEntities ["Man", _rangedMax];
    _enemyMen = _enemyMen select {
        alive _x &&
        {_x != _unit} &&
        {!captive _x} &&
        {((side _unit) getFriend (side _x)) < 0.6}
    };

    private _targetEnemy = if (_enemyMen isEqualTo []) then { objNull } else { _enemyMen#0 };

    switch (_discipline) do {
        case "greek": {
            // Passive ritual regeneration per tick (capped).
            private _ritual = (_unit getVariable ["ritualStatusZeus", 0]) min 120;
            _unit setVariable ["ritualStatusZeus", (_ritual + 1.5) min 120, true];

            if ((damage _unit) > 0.45 && {[_unit, "greek_heal", 15, "greek", 20] call _canCast}) then {
                // Cost already spent in _canCast.
                [_unit, 0] spawn FN_healSelf;
            };

			if ([_unit, "greek_heal_allies", 0, "greek", 30] call _canCast) then {
                [_unit, 25, 0] spawn FN_healAllies_AI;
            };

		   if (!isNull _targetEnemy && {_unit distance _targetEnemy <= _rangedMax} && {[_unit, "greek_bolt", 20, "greek", 10] call _canCast}) then {
                [_unit, 20, _targetEnemy, _rangedMax] spawn FN_zeusBolt_AI;
            };

            if ((count _enemyMen) > 3 && {[_unit, "greek_teleport", 15, "greek", 45] call _canCast}) then {
                [_unit, 15] spawn FN_teleportToPlayerSafePos_AI;
            };
        };

        case "pig": {
            // Passive ritual regeneration per tick (capped).
            private _ritual = (_unit getVariable ["ritualStatusPig", 0]) min 120;
            _unit setVariable ["ritualStatusPig", (_ritual + 2) min 120, true];

			if (!isNull _targetEnemy && {_unit distance _targetEnemy <= _rangedMax} && {[_unit, "pig_wisdom", 35, "pig", 14] call _canCast}) then {
                [_unit, 35, _targetEnemy, _rangedMax] spawn FN_pigWisdom_AI;
            };
			
            if (!isNull _targetEnemy && {_unit distance _targetEnemy <= _rangedMax} && {[_unit, "pig_fireball", 17, "pig", 10] call _canCast}) then {
                [_unit, 17, _targetEnemy, _rangedMax] spawn FN_pigFireball_AI;
            };
        };

        case "wanderer": {
            // Passive ritual regeneration per tick (capped).
            private _ritual = (_unit getVariable ["ritualStatusWanderer", 0]) min 120;
            _unit setVariable ["ritualStatusWanderer", (_ritual + 1.7) min 120, true];
			
			if ((count _enemyMen) > 0 && {[_unit, "wanderer_summon_leaper", 25, "wanderer", 30] call _canCast}) then {
                [_unit, 25, "Zombie_Special_OPFOR_Leaper_1", 14] spawn FN_summonLeaper_AI;
            };
			
			if (!isNull _targetEnemy && {_unit distance _targetEnemy <= _rangedMax} && {[_unit, "wanderer_darkness", 16, "wanderer", 18] call _canCast}) then {
                [_unit, 16, _targetEnemy, _rangedMax] spawn FN_darknessCursor_AI;
            };
			
            if (!isNull _targetEnemy && {_unit distance _targetEnemy <= _rangedMax} && {[_unit, "wanderer_banish", 10, "wanderer", 12] call _canCast}) then {
                [_unit, 10, _targetEnemy, _rangedMax] spawn FN_banishUnit_AI;
            };
        };
    };

    // Decision tick interval.
    sleep 5;
};