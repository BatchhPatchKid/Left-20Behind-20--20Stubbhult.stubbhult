params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
if !("LBMQ_Task_001" in _completedTasks) exitWith {};
if ((_player getVariable ["LBMQ_currentTask", ""]) isEqualTo "LBMQ_Task_002") exitWith {};

[_player] call (missionNamespace getVariable "LBMQ_fnc_tryStartTask002ForPlayer");