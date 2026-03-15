params ["_mode", ["_payload", objNull]];

private _taskId = "LBMQ_Task_004";
private _campPos = [9564.38, 4302.65, 0];
private _shamblerSpawnPos = [9572.71, 4662.25, 0];

switch (_mode) do {
    case "tryStart": {
        private _player = _payload;
        if (isNull _player || {!isPlayer _player}) exitWith {};

        private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
        if !("LBMQ_Task_003" in _completedTasks) exitWith {};
        if ((_taskId in _completedTasks) || {_player getVariable ["LBMQ_task004Active", false]}) exitWith {};

        if (isServer) exitWith { ["start", _player] call (missionNamespace getVariable "LBMQ_fnc_task004Main"); };
        if (_player != player) exitWith {};

        ["start", _player] remoteExecCall ["LBMQ_fnc_task004Main", 2];
    };

    case "start": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
        private _isTaskActive = _player getVariable ["LBMQ_task004Active", false];
        if !("LBMQ_Task_003" in _completedTasks) exitWith {};
        if ((_taskId in _completedTasks) || {_isTaskActive}) exitWith {};

        _player setVariable ["LBMQ_currentTask", _taskId, true];
        _player setVariable ["LBMQ_task004Active", true, true];

        if !(missionNamespace getVariable ["LBMQ_task004ObjectsSpawned", false]) then {
            call compile preprocessFileLineNumbers "MainQuest\functions\004\ObjectsToSpawn.sqf";
            missionNamespace setVariable ["LBMQ_task004ObjectsSpawned", true, true];
        };

        ["LBMQ_task004CampFlag", _campPos, _campPos] call (missionNamespace getVariable "LBMQ_fnc_createTaskFlag");

        private _taskData = [
            _taskId,
            "Locate the Missing Survivor's Union Patrol",
            "Locate the missing Survivor's Union patrol in the forest south of Boalt around grid 094227. Dispatch lost contact at roughly 23:30 yesterday.",
            objNull,
            "search"
        ];

        ["createLocal", _taskData] remoteExecCall ["LBMQ_fnc_task004Main", _player];
        ["spawnDeadPatrol", objNull] call (missionNamespace getVariable "LBMQ_fnc_task004Main");
        ["registerCampTrigger", _player] call (missionNamespace getVariable "LBMQ_fnc_task004Main");
    };

    case "spawnDeadPatrol": {
        if (!isServer) exitWith {};
        if (missionNamespace getVariable ["LBMQ_task004PatrolSpawned", false]) exitWith {};

        missionNamespace setVariable ["LBMQ_task004PatrolSpawned", true, true];

        private _equipFn = missionNamespace getVariable ["FN_equipAI", {}];
        private _spawnPos = [9559.2, 4303.4, 0];
        private _suGroup = createGroup west;
        private _patrolUnits = [];

        for "_i" from 1 to 4 do {
            private _unit = _suGroup createUnit ["B_Soldier_F", _spawnPos, [], 4, "FORM"];
            ["SU", _unit, false, false, false] call _equipFn;
            _unit setDamage 1;
            _patrolUnits pushBack _unit;
        };

        missionNamespace setVariable ["LBMQ_task004PatrolUnits", _patrolUnits, true];
    };

    case "registerCampTrigger": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _existing = missionNamespace getVariable ["LBMQ_task004CampTrigger", objNull];
        if (!isNull _existing) exitWith {};

        private _trigger = createTrigger ["EmptyDetector", _campPos, true];
        _trigger setTriggerArea [5, 5, 0, false];
        _trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];
        _trigger setVariable ["LBMQ_task004Owner", _player, true];
        _trigger setTriggerStatements [
            "this",
            "private _owner = thisTrigger getVariable ['LBMQ_task004Owner', objNull]; if (!isNull _owner) then { ['onCampReached', _owner] remoteExecCall ['LBMQ_fnc_task004Main', 2]; };",
            ""
        ];

        missionNamespace setVariable ["LBMQ_task004CampTrigger", _trigger, true];
    };

    case "onCampReached": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _isTaskActive = _player getVariable ["LBMQ_task004Active", false];
        private _currentTask = _player getVariable ["LBMQ_currentTask", ""];
        if (!_isTaskActive || {!(_currentTask isEqualTo _taskId)} || {_player distance2D _campPos > 5}) exitWith {};

        ["complete", _player] call (missionNamespace getVariable "LBMQ_fnc_task004Main");
    };

    case "complete": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
        private _isTaskActive = _player getVariable ["LBMQ_task004Active", false];
        private _currentTask = _player getVariable ["LBMQ_currentTask", ""];
        if (!_isTaskActive || {!(_currentTask isEqualTo _taskId)} || {_taskId in _completedTasks}) exitWith {};

        _completedTasks pushBackUnique _taskId;
        _player setVariable ["LBMQ_completedTasks", _completedTasks, true];
        _player setVariable ["LBMQ_task004Active", false, true];

        private _flag = missionNamespace getVariable ["LBMQ_task004CampFlag", objNull];
        if (!isNull _flag) then {
            deleteVehicle _flag;
            missionNamespace setVariable ["LBMQ_task004CampFlag", objNull, true];
        };

        private _trigger = missionNamespace getVariable ["LBMQ_task004CampTrigger", objNull];
        if (!isNull _trigger) then {
            deleteVehicle _trigger;
            missionNamespace setVariable ["LBMQ_task004CampTrigger", objNull, true];
        };

        [_taskId, "SUCCEEDED"] remoteExecCall ["LBMQ_fnc_updateTaskLocal", _player];
        ["playRadioDebriefLocal", objNull] remoteExecCall ["LBMQ_fnc_task004Main", _player];
        ["spawnShamblerAttack", objNull] call (missionNamespace getVariable "LBMQ_fnc_task004Main");

        if !(missionNamespace getVariable ["LBMQ_task004Task005Queued", false]) then {
            missionNamespace setVariable ["LBMQ_task004Task005Queued", true, true];
            [_player] spawn {
                params ["_taskOwner"];
                sleep 1;

                if (isNil { missionNamespace getVariable "LBMQ_fnc_task005Main" }) exitWith {
                    _taskOwner setVariable ["LBMQ_currentTask", "LBMQ_Task_005", true];
                };

                ["tryStart", _taskOwner] call (missionNamespace getVariable "LBMQ_fnc_task005Main");
            };
        };
    };

    case "spawnShamblerAttack": {
        if (!isServer) exitWith {};
        if (missionNamespace getVariable ["LBMQ_task004ShamblersSpawned", false]) exitWith {};

        missionNamespace setVariable ["LBMQ_task004ShamblersSpawned", true, true];

        private _shamblers = [];

        for "_i" from 1 to 5 do {
            private _group = createGroup east;
            private _unit = _group createUnit ["Zombie_O_Shambler_FIA", _shamblerSpawnPos, [], 6, "FORM"];

            _group setBehaviour "AWARE";
            _group setCombatMode "RED";
            _group setSpeedMode "FULL";

            private _attackWp = _group addWaypoint [_campPos, 0];
            _attackWp setWaypointType "MOVE";
            _attackWp setWaypointBehaviour "AWARE";
            _attackWp setWaypointCombatMode "RED";

            _shamblers pushBack _unit;
        };

        missionNamespace setVariable ["LBMQ_task004ShamblerUnits", _shamblers, true];
    };

    case "createLocal": {
        [_payload] call (missionNamespace getVariable "LBMQ_fnc_taskCreateLocal");
    };

    case "playRadioDebriefLocal": {
        [] spawn {
            uiSleep 1;

            private _radioSource = player;
            if (isNull _radioSource) exitWith {};

            // Audio framework only for now; dialogue audio files are not implemented yet.
            // [_radioSource, ["LBMQ_task004_radio_01", 100, 1]] remoteExecCall ["say3D", clientOwner];

            systemChat "Player: Dispatch, this is survivor Summers. I have found the SU patrol. It was ambushed by a DT encampment - or maybe the SU patrol attacked the DT camp? It’s hard to tell, but either way, they died to DT.";
            uiSleep 3;
            systemChat "Dispatch: Understood Summers, thank you for the report. What of the DT camp?";
            uiSleep 2;
            systemChat "Player: Eliminated them all, or at least most of them.";
            uiSleep 2;
            systemChat "Dispatch: Understood, good copy. About the information to get into contact with PMC Group Alpha, Boonie Boys caught wind of this and asked for you to speak with them directly. Supposedly they know how, so speak with them. Good working with you Summers. Dispatch out.";
        };
    };
};