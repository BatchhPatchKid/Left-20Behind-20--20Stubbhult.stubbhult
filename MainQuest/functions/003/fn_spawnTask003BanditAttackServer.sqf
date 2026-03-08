if (!isServer) exitWith {};

private _alreadySpawned = missionNamespace getVariable ["LBMQ_task003BanditAttackSpawned", false];
if (_alreadySpawned) exitWith {};
missionNamespace setVariable ["LBMQ_task003BanditAttackSpawned", true, true];

private _headDoctor = missionNamespace getVariable ["LBMQ_task003HeadDoctor", objNull];
private _targetPos = if (!isNull _headDoctor) then { getPosATL _headDoctor } else { [11090, 4038, 0] };

private _spawnPositions = [
    [_targetPos select 0 + 180, _targetPos select 1 + 45, 0],
    [_targetPos select 0 + 190, _targetPos select 1 - 35, 0],
    [_targetPos select 0 + 165, _targetPos select 1 + 5, 0]
];

private _banditUnits = [];
private _equipFn = missionNamespace getVariable ["FN_equipAI", {}];

{
    private _group = createGroup [east, true];

    for "_i" from 1 to 4 do {
        private _unit = _group createUnit ["O_G_Survivor_F", _x, [], 10, "FORM"];

        ["Bandit", _unit, false, false, false] call _equipFn;

        _unit setSkill 0.6;
        _unit setCombatMode "RED";
        _unit setBehaviour "AWARE";
        _banditUnits pushBack _unit;
    };

    _group setFormation "WEDGE";
    _group setSpeedMode "FULL";
    _group setBehaviour "COMBAT";
    _group setCombatMode "RED";

    private _attackWp = _group addWaypoint [_targetPos, 0];
    _attackWp setWaypointType "SAD";
    _attackWp setWaypointBehaviour "COMBAT";
    _attackWp setWaypointCombatMode "RED";
} forEach _spawnPositions;

missionNamespace setVariable ["LBMQ_task003BanditAttackUnits", _banditUnits, true];