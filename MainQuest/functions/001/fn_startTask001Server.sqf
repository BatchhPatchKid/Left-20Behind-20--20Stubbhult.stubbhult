params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

private _taskId = "LBMQ_Task_001";
private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
private _isTaskActive = _player getVariable ["LBMQ_task001Active", false];

if (_taskId in _completedTasks) exitWith {};
if (_isTaskActive) exitWith {};

_player setVariable ["LBMQ_completedTasks", _completedTasks, true];
_player setVariable ["LBMQ_currentTask", _taskId, true];
_player setVariable ["LBMQ_task001Active", true, true];

private _taskDestination = [];
private _officeAnchor = missionNamespace getVariable ["LBMQ_task001OfficeAnchor", objNull];
if (!isNull _officeAnchor) then {
    _taskDestination = getPosATL _officeAnchor;
} else {
    if (!isNil "suTrader" && {!isNull suTrader}) then {
        _taskDestination = getPosATL suTrader;
    } else {
        if ((getMarkerColor "LBMQ_Task001_Office") != "") then {
            _taskDestination = markerPos "LBMQ_Task001_Office";
        };
    };
};

private _taskData = [
    _taskId,
    "Speak with Survivor's Union Contractor",
    "Speak with the Survivor’s Union contractor to possibly establish contact with PMC Group Alpha, and explain your situation to them.",
    _taskDestination
];

[_taskData] remoteExecCall ["LBMQ_fnc_createTask001Local", _player];
[_player] call (missionNamespace getVariable "LBMQ_fnc_registerTask001OfficeTriggerServer");