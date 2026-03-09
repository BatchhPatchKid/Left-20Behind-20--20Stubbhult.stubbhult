params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

private _taskId = "LBMQ_Task_003";
private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
private _isTaskActive = _player getVariable ["LBMQ_task003Active", false];
private _currentTask = _player getVariable ["LBMQ_currentTask", ""];

if (!_isTaskActive) exitWith {};
if !(_currentTask isEqualTo _taskId) exitWith {};
if (_taskId in _completedTasks) exitWith {};

_completedTasks pushBackUnique _taskId;
_player setVariable ["LBMQ_completedTasks", _completedTasks, true];
_player setVariable ["LBMQ_task003Active", false, true];

[_taskId, "SUCCEEDED"] remoteExecCall ["LBMQ_fnc_updateTaskLocal", _player];
[] remoteExecCall ["LBMQ_fnc_playTask003DialogueLocal", _player];

[_player] spawn {
    params ["_taskOwner"];

    sleep 21;

    if (!isNull _taskOwner && {isPlayer _taskOwner}) then {
        [] remoteExecCall ["LBMQ_fnc_playTask003BanditWarningLocal", _taskOwner];
    };

    sleep 2;
    [] call (missionNamespace getVariable "LBMQ_fnc_spawnTask003BanditAttackServer");
};