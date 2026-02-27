params ["_unit"];

if (!isServer) exitWith {};
if (isNull _unit) exitWith {};

private _rangedMax = 50;

private _canCast = {
    params ["_caster", "_spellId", "_cost", "_domain", "_cooldownSeconds"];

    private _ritualVar = switch (_domain) do {
        case "greek": { "ritualStatusZeus" };
        case "wanderer": { "ritualStatusWanderer" };
        default { "ritualStatusPig" };
    };

    if ((_caster getVariable [_ritualVar, 0]) < _cost) exitWith { false };

    private _globalUntil = _caster getVariable ["LB_magicGlobalCooldownUntil", 0];
    if (time < _globalUntil) exitWith { false };

    private _spellCooldowns = _caster getVariable ["LB_magicSpellCooldowns", createHashMap];
    private _spellUntil = _spellCooldowns getOrDefault [_spellId, 0];
    if (time < _spellUntil) exitWith { false };

    _spellCooldowns set [_spellId, time + _cooldownSeconds];
    _caster setVariable ["LB_magicSpellCooldowns", _spellCooldowns, false];
    _caster setVariable ["LB_magicGlobalCooldownUntil", time + 2, false];

    true
};

while {alive _unit} do {
    private _discipline = _unit getVariable ["LB_magicDiscipline", ""];
    if !(_discipline in ["pig", "greek", "wanderer"]) exitWith {};

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
            private _ritual = (_unit getVariable ["ritualStatusZeus", 0]) min 120;
            _unit setVariable ["ritualStatusZeus", (_ritual + 0.5) min 120, true];

            if ((damage _unit) > 0.45 && {[_unit, "greek_heal", 15, "greek", 20] call _canCast}) then {
                [_unit, 15] spawn FN_healSelf;
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
            private _ritual = (_unit getVariable ["ritualStatusPig", 0]) min 120;
            _unit setVariable ["ritualStatusPig", (_ritual + 0.5) min 120, true];

			if (!isNull _targetEnemy && {_unit distance _targetEnemy <= _rangedMax} && {[_unit, "pig_wisdom", 35, "pig", 14] call _canCast}) then {
                [_unit, 35, _targetEnemy, _rangedMax] spawn FN_pigWisdom_AI;
            };
			
            if (!isNull _targetEnemy && {_unit distance _targetEnemy <= _rangedMax} && {[_unit, "pig_fireball", 17, "pig", 10] call _canCast}) then {
                [_unit, 17, _targetEnemy, _rangedMax] spawn FN_pigFireball_AI;
            };
        };

        case "wanderer": {
            private _ritual = (_unit getVariable ["ritualStatusWanderer", 0]) min 120;
            _unit setVariable ["ritualStatusWanderer", (_ritual + 0.5) min 120, true];

            if (!isNull _targetEnemy && {_unit distance _targetEnemy <= _rangedMax} && {[_unit, "wanderer_banish", 10, "wanderer", 12] call _canCast}) then {
                [_unit, 10, _targetEnemy, _rangedMax] spawn FN_banishUnit_AI;
            };
        };
    };

    sleep 2;
};