params ["_player", "_taskSelection"];

if (isNull _player || {!isPlayer _player}) exitWith {};

if (!isServer) exitWith {
    [_player, _taskSelection] remoteExecCall ["LBMQ_fnc_mainQuestDebugAssign", 2];
};

private _supportedTasks = ["Task001", "Task002", "Task003", "Task004"];
if !(_taskSelection in _supportedTasks) exitWith {};

private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];

{
    _completedTasks = _completedTasks - [_x];
} forEach ["LBMQ_Task_001", "LBMQ_Task_002", "LBMQ_Task_003", "LBMQ_Task_004"];

switch (_taskSelection) do {
    case "Task002": {
        _completedTasks pushBackUnique "LBMQ_Task_001";
    };
    case "Task003": {
        _completedTasks pushBackUnique "LBMQ_Task_001";
        _completedTasks pushBackUnique "LBMQ_Task_002";
    };
    case "Task004": {
        _completedTasks pushBackUnique "LBMQ_Task_001";
        _completedTasks pushBackUnique "LBMQ_Task_002";
        _completedTasks pushBackUnique "LBMQ_Task_003";
    };
};

_player setVariable ["LBMQ_completedTasks", _completedTasks, true];
_player setVariable ["LBMQ_task001Active", false, true];
_player setVariable ["LBMQ_task002Active", false, true];
_player setVariable ["LBMQ_task003Active", false, true];
_player setVariable ["LBMQ_task004Active", false, true];
_player setVariable ["LBMQ_currentTask", "", true];

private _officeTrigger = _player getVariable ["LBMQ_task001OfficeTrigger", objNull];
if (!isNull _officeTrigger) then {
    deleteVehicle _officeTrigger;
    _player setVariable ["LBMQ_task001OfficeTrigger", objNull, false];
};

private _task002Flag = missionNamespace getVariable ["LBMQ_task002ProtectionFlag", objNull];
if (!isNull _task002Flag && {_taskSelection != "Task002"}) then {
    deleteVehicle _task002Flag;
    missionNamespace setVariable ["LBMQ_task002ProtectionFlag", objNull, true];
};


private _task004Flag = missionNamespace getVariable ["LBMQ_task004CampFlag", objNull];
if (!isNull _task004Flag && {_taskSelection != "Task004"}) then {
    deleteVehicle _task004Flag;
    missionNamespace setVariable ["LBMQ_task004CampFlag", objNull, true];
};

private _task004Trigger = missionNamespace getVariable ["LBMQ_task004CampTrigger", objNull];
if (!isNull _task004Trigger && {_taskSelection != "Task004"}) then {
    deleteVehicle _task004Trigger;
    missionNamespace setVariable ["LBMQ_task004CampTrigger", objNull, true];
};

{
    [_x, "CANCELED"] remoteExecCall ["LBMQ_fnc_updateTaskLocal", _player];
} forEach ["LBMQ_Task_001", "LBMQ_Task_002", "LBMQ_Task_003", "LBMQ_Task_004"];

switch (_taskSelection) do {
    case "Task001": {
        ["start", _player] call (missionNamespace getVariable "LBMQ_fnc_task001Main");
    };
    case "Task002": {
        ["start", _player] call (missionNamespace getVariable "LBMQ_fnc_task002Main");
    };
    case "Task003": {
        ["start", _player] call (missionNamespace getVariable "LBMQ_fnc_task003Main");
    };
    case "Task004": {
        ["start", _player] call (missionNamespace getVariable "LBMQ_fnc_task004Main");
    };
};