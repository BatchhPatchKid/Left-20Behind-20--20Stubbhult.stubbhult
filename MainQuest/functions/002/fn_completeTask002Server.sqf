params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

private _taskId = "LBMQ_Task_002";
private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
private _isTaskActive = _player getVariable ["LBMQ_task002Active", false];
private _currentTask = _player getVariable ["LBMQ_currentTask", ""];

if (!_isTaskActive) exitWith {};
if !(_currentTask isEqualTo _taskId) exitWith {};
if (_taskId in _completedTasks) exitWith {};

_completedTasks pushBackUnique _taskId;
_player setVariable ["LBMQ_completedTasks", _completedTasks, true];
_player setVariable ["LBMQ_task002Active", false, true];

private _flag = missionNamespace getVariable ["LBMQ_task002ProtectionFlag", objNull];
if (!isNull _flag) then {
    deleteVehicle _flag;
    missionNamespace setVariable ["LBMQ_task002ProtectionFlag", objNull, true];
};

[_taskId, "SUCCEEDED"] remoteExecCall ["LBMQ_fnc_updateTaskLocal", _player];
[] remoteExecCall ["LBMQ_fnc_playTask002DialogueLocal", _player];