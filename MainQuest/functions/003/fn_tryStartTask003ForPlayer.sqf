params ["_player"];

if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
if !("LBMQ_Task_002" in _completedTasks) exitWith {};
if (("LBMQ_Task_003" in _completedTasks) || {(_player getVariable ["LBMQ_task003Active", false])}) exitWith {};

if (isServer) exitWith {
    [_player] call (missionNamespace getVariable "LBMQ_fnc_startTask003Server");
};

if (_player != player) exitWith {};

[_player] remoteExecCall ["LBMQ_fnc_startTask003Server", 2];