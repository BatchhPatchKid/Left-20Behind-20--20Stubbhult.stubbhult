params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

private _taskId = "LBMQ_Task_003";
private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
private _isTaskActive = _player getVariable ["LBMQ_task003Active", false];

if !("LBMQ_Task_002" in _completedTasks) exitWith {};
if (_taskId in _completedTasks) exitWith {};
if (_isTaskActive) exitWith {};

_player setVariable ["LBMQ_currentTask", _taskId, true];
_player setVariable ["LBMQ_task003Active", true, true];

private _alreadySpawned = missionNamespace getVariable ["LBMQ_task003ObjectsSpawned", false];
if (!_alreadySpawned) then {
    private _spawnScript = preprocessFileLineNumbers "MainQuest\functions\003\ObjectsToSpawn.sqf";
    call compile _spawnScript;
    missionNamespace setVariable ["LBMQ_task003ObjectsSpawned", true, true];
};

private _taskDestination = [];
private _headDoctor = missionNamespace getVariable ["LBMQ_task003HeadDoctor", objNull];
if (!isNull _headDoctor) then {
    _taskDestination = getPosATL _headDoctor;
};

private _taskData = [
    _taskId,
    "Bring Medicine Crate to SU Medical Tent",
    "Now that you have obtained the medical crate from the US Army, bring it back to the Survivor's Union Contractor's Office. However, it may be a good idea not to take the medicine offered by the scientist - just a hunch.",
    _taskDestination
];

[_taskData] remoteExecCall ["LBMQ_fnc_createTask003Local", _player];
[_player] call (missionNamespace getVariable "LBMQ_fnc_registerTask003ScientistActionServer");

[] remoteExecCall ["LBMQ_fnc_playTask003RadioIntroLocal", _player];