params ["_taskId", "_state"];

if (_taskId isEqualTo "") exitWith {};
if (_state isEqualTo "") exitWith {};

[_taskId, _state, true] call BIS_fnc_taskSetState;