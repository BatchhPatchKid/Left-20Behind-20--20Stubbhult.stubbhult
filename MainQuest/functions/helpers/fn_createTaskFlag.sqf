params ["_missionVarName", ["_centerPosition", []], ["_fallbackPosition", []]];

if (_missionVarName isEqualTo "") exitWith { objNull };

private _existingFlag = missionNamespace getVariable [_missionVarName, objNull];
if (!isNull _existingFlag) exitWith { _existingFlag };

private _spawnCenter = _centerPosition;
if (_spawnCenter isEqualTo []) then {
    _spawnCenter = _fallbackPosition;
};
if (_spawnCenter isEqualTo []) exitWith { objNull };

private _safePos = [_spawnCenter, 0, 15, 3, 0, 20, 0] call BIS_fnc_findSafePos;
if ((_safePos distance2D [0, 0, 0]) <= 1) then {
    _safePos = _spawnCenter;
};

private _flag = createVehicle ["Flag_Red_F", _safePos, [], 0, "CAN_COLLIDE"];
missionNamespace setVariable [_missionVarName, _flag, true];
_flag