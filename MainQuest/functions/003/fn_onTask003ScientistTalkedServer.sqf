params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

private _taskId = "LBMQ_Task_003";
private _isTaskActive = _player getVariable ["LBMQ_task003Active", false];
private _currentTask = _player getVariable ["LBMQ_currentTask", ""];
private _headDoctor = missionNamespace getVariable ["LBMQ_task003HeadDoctor", objNull];

if (!_isTaskActive) exitWith {};
if !(_currentTask isEqualTo _taskId) exitWith {};
if (isNull _headDoctor) exitWith {};
if (_player distance _headDoctor > 6) exitWith {};

[_player] call (missionNamespace getVariable "LBMQ_fnc_completeTask003Server");