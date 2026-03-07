params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

private _taskId = "LBMQ_Task_001";
private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
private _isTaskActive = _player getVariable ["LBMQ_task001Active", false];
private _currentTask = _player getVariable ["LBMQ_currentTask", ""];

if (!_isTaskActive) exitWith {};
if !(_currentTask isEqualTo _taskId) exitWith {};
if (_taskId in _completedTasks) exitWith {};

_completedTasks pushBackUnique _taskId;
_player setVariable ["LBMQ_completedTasks", _completedTasks, true];
_player setVariable ["LBMQ_task001Active", false, true];

private _officeTrigger = _player getVariable ["LBMQ_task001OfficeTrigger", objNull];
if (!isNull _officeTrigger) then {
    deleteVehicle _officeTrigger;
    _player setVariable ["LBMQ_task001OfficeTrigger", objNull, false];
};

[_taskId, "SUCCEEDED"] remoteExecCall ["LBMQ_fnc_updateTaskLocal", _player];
[] remoteExecCall ["LBMQ_fnc_playTask001DialogueLocal", _player];