params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

private _taskId = "LBMQ_Task_002";
private _isTaskActive = _player getVariable ["LBMQ_task002Active", false];
private _currentTask = _player getVariable ["LBMQ_currentTask", ""];
private _scientist = missionNamespace getVariable ["LBMQ_task002Scientist", objNull];

if (!_isTaskActive) exitWith {};
if !(_currentTask isEqualTo _taskId) exitWith {};
if (isNull _scientist) exitWith {};
if (_player distance _scientist > 6) exitWith {};

[] remoteExecCall ["LBMQ_fnc_playTask002DialogueLocal", _player];
[_player] call (missionNamespace getVariable "LBMQ_fnc_completeTask002Server");