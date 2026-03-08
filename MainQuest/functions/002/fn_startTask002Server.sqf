params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

private _taskId = "LBMQ_Task_002";
private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
private _isTaskActive = _player getVariable ["LBMQ_task002Active", false];

if (_taskId in _completedTasks) exitWith {};
if (_isTaskActive) exitWith {};

_player setVariable ["LBMQ_completedTasks", _completedTasks, true];
_player setVariable ["LBMQ_currentTask", _taskId, true];
_player setVariable ["LBMQ_task002Active", true, true];

private _alreadySpawned = missionNamespace getVariable ["LBMQ_task002ObjectsSpawned", false];
if (!_alreadySpawned) then {
    private _spawnScript = preprocessFileLineNumbers "MainQuest\functions\002\ObjectsToSpawn.sqf";
    call compile _spawnScript;

    missionNamespace setVariable ["LBMQ_task002ObjectsSpawned", true, true];

    private _flagClass = "FlagPole_F";
    private _existingFlag = missionNamespace getVariable ["LBMQ_task002ProtectionFlag", objNull];

    if (isNull _existingFlag) then {
        private _flagAnchor = missionNamespace getVariable ["LBMQ_task002CampCenter", objNull];
        private _flagPos = [0, 0, 0];

        if (!isNull _flagAnchor) then {
            _flagPos = getPosATL _flagAnchor;
        };

        if (_flagPos isEqualTo [0, 0, 0]) then {
            _flagPos = [11926.9, 2821.33, 0];
        };

        private _flag = createVehicle [_flagClass, _flagPos, [], 0, "CAN_COLLIDE"];
        _flag setPosATL _flagPos;
        _flag setVariable ["LBMQ_task002Flag", true, true];

        missionNamespace setVariable ["LBMQ_task002ProtectionFlag", _flag, true];
    };
};

private _taskDestination = [];
private _scientist = missionNamespace getVariable ["LBMQ_task002Scientist", objNull];
if (!isNull _scientist) then {
    _taskDestination = getPosATL _scientist;
} else {
    private _campCenter = missionNamespace getVariable ["LBMQ_task002CampCenter", objNull];
    if (!isNull _campCenter) then {
        _taskDestination = getPosATL _campCenter;
    };
};

private _taskData = [
    _taskId,
    "Retrieve Medical Supplies from Scientist",
    "Travel to the camp and speak with the scientist in the middle. After the conversation, the medical crate is assumed to be secured.",
    _taskDestination
];

[_taskData] remoteExecCall ["LBMQ_fnc_createTask002Local", _player];
[_player] call (missionNamespace getVariable "LBMQ_fnc_registerTask002ScientistActionServer");