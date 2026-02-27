/*
    Debug console usage:
    ["RC", getPosATL player, 3, civilian, "B_Survivor_F"] call (missionNamespace getVariable "FN_spawnPriestsDebug");
*/

params [
    ["_faction", "SU", [""]],
    ["_position", [0, 0, 0], [[]]],
    ["_priestCount", 1, [0]],
    ["_side", west, [sideUnknown]],
    ["_unitType", "B_Survivor_F", [""]]
];

if (!isServer) exitWith {
    _this remoteExecCall ["FN_spawnPriestsDebug", 2];
};

private _spawnPos = if (_position isEqualType objNull) then { getPosATL _position } else { +_position };
if ((count _spawnPos) < 3) then {
    _spawnPos set [2, 0];
};

private _count = (round _priestCount) max 1;
private _group = createGroup [_side, true];
private _spawnedPriests = [];

private _factionToDiscipline = createHashMapFromArray [
    ["DT", "greek"],
    ["PF", "pig"],
    ["RC", "wanderer"]
];
private _discipline = _factionToDiscipline getOrDefault [toUpper _faction, "wanderer"];

for "_i" from 1 to _count do {
    private _radius = random 2.5;
    private _direction = random 360;
    private _unitPos = [
        (_spawnPos select 0) + (_radius * sin _direction),
        (_spawnPos select 1) + (_radius * cos _direction),
        _spawnPos select 2
    ];

    private _priest = _group createUnit [_unitType, _unitPos, [], 0, "NONE"];
    _priest setVariable ["LB_isPriest", true, true];
    _priest setVariable ["LB_priestFaction", _faction, true];

    [_faction, _priest] call (missionNamespace getVariable "FN_equipAIMagicUser");
    [_priest, _discipline] spawn (missionNamespace getVariable "FN_magicAIInit");

    _spawnedPriests pushBack _priest;
};

_spawnedPriests