params ["_caster", ["_sub", 0], ["_class", "Zombie_Special_OPFOR_Leaper_1"], ["_radius", 12], ["_searchRadius", 300]];

if (isNull _caster || {!alive _caster}) exitWith {};
if ((_caster getVariable ["LB_magicDiscipline", ""]) != "wanderer") exitWith {};

private _a = random 360;
private _r = 3 + random (_radius max 3);
private _spawnPos = _caster modelToWorld [_r * sin _a, _r * cos _a, 0];
_spawnPos set [2, 0];

private _finalGrp = createGroup [side _caster, true];
private _tmpGrp = createGroup [east, true];
private _summon = _tmpGrp createUnit [_class, _spawnPos, [], 0, "FORM"];

[_caster, "flamethrower_burning_3"] remoteExec ["switchMove", 0, true];

if (!isNull _summon) then {
    [_summon] joinSilent _finalGrp;

    if ((count units _tmpGrp) == 0) then {
        deleteGroup _tmpGrp;
    };

    _summon setRandomLip false;
    _summon setSpeaker "NoVoice";

    private _hostiles = (_summon nearEntities ["Man", _searchRadius]) select {
        alive _x &&
        {_x != _caster} &&
        {_x != _summon} &&
        {!captive _x} &&
        {((side _caster) getFriend (side _x)) < 0.6}
    };

    if !(_hostiles isEqualTo []) then {
        private _nearestHostile = _hostiles # 0;
        private _nearestDist = _summon distance _nearestHostile;

        {
            private _d = _summon distance _x;
            if (_d < _nearestDist) then {
                _nearestHostile = _x;
                _nearestDist = _d;
            };
        } forEach _hostiles;

        _finalGrp reveal [_nearestHostile, 4];
        _finalGrp setBehaviour "COMBAT";
        _finalGrp setCombatMode "RED";
        _finalGrp setSpeedMode "FULL";

        private _wp = _finalGrp addWaypoint [getPosATL _nearestHostile, 0];
        _wp setWaypointType "SAD";
        _wp setWaypointBehaviour "COMBAT";
        _wp setWaypointCombatMode "RED";
        _wp setWaypointSpeed "FULL";

        _summon doMove (getPosATL _nearestHostile);
    };
};

sleep 3.5;

[_caster, ""] remoteExec ["switchMove", 0, true];