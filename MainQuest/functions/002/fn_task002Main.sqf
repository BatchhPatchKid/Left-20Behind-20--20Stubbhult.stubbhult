params ["_mode", ["_payload", objNull]];

private _taskId = "LBMQ_Task_002";

switch (_mode) do {
    case "tryStart": {
        private _player = _payload;
        if (isNull _player || {!isPlayer _player}) exitWith {};

        if (isServer) exitWith {
            ["start", _player] call (missionNamespace getVariable "LBMQ_fnc_task002Main");
        };

        if (_player != player) exitWith {};
        ["start", _player] remoteExecCall ["LBMQ_fnc_task002Main", 2];
    };

    case "start": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
        private _isTaskActive = _player getVariable ["LBMQ_task002Active", false];
        if (_taskId in _completedTasks || {_isTaskActive}) exitWith {};

        _player setVariable ["LBMQ_completedTasks", _completedTasks, true];
        _player setVariable ["LBMQ_currentTask", _taskId, true];
        _player setVariable ["LBMQ_task002Active", true, true];

        if !(missionNamespace getVariable ["LBMQ_task002ObjectsSpawned", false]) then {
            call compile preprocessFileLineNumbers "MainQuest\functions\002\ObjectsToSpawn.sqf";
            missionNamespace setVariable ["LBMQ_task002ObjectsSpawned", true, true];

            private _existingFlag = missionNamespace getVariable ["LBMQ_task002ProtectionFlag", objNull];
            if (isNull _existingFlag) then {
                private _flagAnchor = missionNamespace getVariable ["LBMQ_task002CampCenter", objNull];
                private _flagPos = if (!isNull _flagAnchor) then { getPosATL _flagAnchor } else { [11926.9, 2821.33, 0] };

                private _flag = createVehicle ["Flag_Red_F", _flagPos, [], 0, "CAN_COLLIDE"];
                _flag setPos ([_flagPos, 5, 15, 3, 0, 20, 0] call BIS_fnc_findSafePos);
                _flag setVariable ["LBMQ_task002Flag", true, true];
                missionNamespace setVariable ["LBMQ_task002ProtectionFlag", _flag, true];
            };
        };

        private _scientist = missionNamespace getVariable ["LBMQ_task002Scientist", objNull];
        private _campCenter = missionNamespace getVariable ["LBMQ_task002CampCenter", objNull];
        private _taskDestination = [[_scientist, _campCenter], ""] call (missionNamespace getVariable "LBMQ_fnc_resolveTaskDestination");

        private _taskData = [
            _taskId,
            "Retrieve Medical Supplies from Scientist",
            "Travel to the camp and speak with the scientist in the middle. After the conversation, the medical crate is assumed to be secured.",
            _taskDestination,
            ""
        ];

        ["createLocal", _taskData] remoteExecCall ["LBMQ_fnc_task002Main", _player];
        ["registerScientistAction", _player] call (missionNamespace getVariable "LBMQ_fnc_task002Main");
    };

    case "registerScientistAction": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _scientist = missionNamespace getVariable ["LBMQ_task002Scientist", objNull];
        if (isNull _scientist) exitWith {};

        private _existingActionId = missionNamespace getVariable ["LBMQ_task002ScientistTalkActionId", -1];
        if (_existingActionId >= 0) exitWith {};

        private _actionId = _scientist addAction [
            "Talk to Scientist",
            {
                params ["_target", "_caller", "_actionId", "_arguments"];
                ["onScientistTalked", _caller] remoteExecCall ["LBMQ_fnc_task002Main", 2];
            },
            nil,
            1.5,
            true,
            true,
            "",
            "_this distance _target < 4"
        ];

        missionNamespace setVariable ["LBMQ_task002ScientistTalkActionId", _actionId, true];
    };

    case "onScientistTalked": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _isTaskActive = _player getVariable ["LBMQ_task002Active", false];
        private _currentTask = _player getVariable ["LBMQ_currentTask", ""];
        private _scientist = missionNamespace getVariable ["LBMQ_task002Scientist", objNull];

        if (!_isTaskActive || {!(_currentTask isEqualTo _taskId)} || {isNull _scientist} || {_player distance _scientist > 6}) exitWith {};

        ["complete", _player] call (missionNamespace getVariable "LBMQ_fnc_task002Main");
    };

    case "complete": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
        private _isTaskActive = _player getVariable ["LBMQ_task002Active", false];
        private _currentTask = _player getVariable ["LBMQ_currentTask", ""];
        if (!_isTaskActive || {!(_currentTask isEqualTo _taskId)} || {_taskId in _completedTasks}) exitWith {};

        _completedTasks pushBackUnique _taskId;
        _player setVariable ["LBMQ_completedTasks", _completedTasks, true];
        _player setVariable ["LBMQ_task002Active", false, true];

        private _flag = missionNamespace getVariable ["LBMQ_task002ProtectionFlag", objNull];
        if (!isNull _flag) then {
            deleteVehicle _flag;
            missionNamespace setVariable ["LBMQ_task002ProtectionFlag", objNull, true];
        };

        [_taskId, "SUCCEEDED"] remoteExecCall ["LBMQ_fnc_updateTaskLocal", _player];
        ["playDialogueLocal", objNull] remoteExecCall ["LBMQ_fnc_task002Main", _player];

        [_player] spawn {
            params ["_taskOwner"];
            sleep 40;
            if (isNull _taskOwner || {!isPlayer _taskOwner}) exitWith {};
            ["tryStart", _taskOwner] call (missionNamespace getVariable "LBMQ_fnc_task003Main");
        };
    };

    case "createLocal": {
        [_payload] call (missionNamespace getVariable "LBMQ_fnc_taskCreateLocal");
    };

    case "playDialogueLocal": {
        private _lines = [
            ["Player", "Good afternoon soldier, I was sent here by the Survivor’s Union to pick up the medical supply crate", 0, 5],
            ["Scientist", "Good, we were expecting you 15 minutes ago. No matter, at least you’re here now. How’s the Union doing? Any new illness breakouts in the area recently?", 0, 8],
            ["Player", "I don’t know. I just got here, so I’m not sure of the state of Survivor’s Union at the moment.", 0, 5],
            ["Scientist", "I see, if that’s the case, when you get back to the Survivor’s Union Contractor’s Office, make sure you take a vial of this drug. It’ll keep you healthy from the outbreak.", 0, 8],
            ["Player", "I thought there wasn’t a cure for the virus yet?", 0, 4],
            ["Scientist", "Just trust me, you’ll want to take the medicine. Now go, before the medicine goes bad out in this weather", 0, 6]
        ];

        [_lines, [], objNull, {}] spawn (missionNamespace getVariable "LBMQ_fnc_playDialogueLocal");
    };
};