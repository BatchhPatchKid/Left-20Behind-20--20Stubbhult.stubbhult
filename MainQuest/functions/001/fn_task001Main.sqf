params ["_mode", ["_payload", objNull]];

private _taskId = "LBMQ_Task_001";

private _resolveTask001RepresentativePosition = {
    private _representative = missionNamespace getVariable ["LBMQ_task001Representative", objNull];
    if (!isNull _representative) exitWith { getPosATL _representative };

    private _officeAnchor = missionNamespace getVariable ["LBMQ_task001OfficeAnchor", objNull];
    private _traderObj = if (!isNil "suTrader") then { suTrader } else { objNull };
    private _destination = [[_officeAnchor, _traderObj], "LBMQ_Task001_Representative"] call (missionNamespace getVariable "LBMQ_fnc_resolveTaskDestination");

    if (_destination isEqualTo []) then {
        _destination = [[_officeAnchor, _traderObj], "LBMQ_Task001_Office"] call (missionNamespace getVariable "LBMQ_fnc_resolveTaskDestination");
    };

    if (_destination isEqualTo []) then {
        _destination = missionNamespace getVariable ["LBMQ_task001RepresentativeSpawnPos", []];
    };

    _destination
};

switch (_mode) do {
    case "tryStart": {
        private _player = if (_payload isEqualType objNull) then { _payload } else { objNull };
        if (isNull _player || {!isPlayer _player}) exitWith {};

        if (isServer) exitWith {
             ["start", _player] call (missionNamespace getVariable "LBMQ_fnc_task001Main");
        };

        if (_player != player) exitWith {};
        ["start", _player] remoteExecCall ["LBMQ_fnc_task001Main", 2];
    };

    case "start": {
        private _player = if (_payload isEqualType objNull) then { _payload } else { objNull };
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
        private _isTaskActive = _player getVariable ["LBMQ_task001Active", false];
        if (_taskId in _completedTasks || {_isTaskActive}) exitWith {};

        _player setVariable ["LBMQ_completedTasks", _completedTasks, true];
        _player setVariable ["LBMQ_currentTask", _taskId, true];
        _player setVariable ["LBMQ_task001Active", true, true];

        if !(missionNamespace getVariable ["LBMQ_task001ObjectsSpawned", false]) then {
            call compile preprocessFileLineNumbers "MainQuest\functions\001\ObjectsToSpawn.sqf";
            missionNamespace setVariable ["LBMQ_task001ObjectsSpawned", true, true];
        };

        private _taskDestination = call _resolveTask001RepresentativePosition;
        private _representative = missionNamespace getVariable ["LBMQ_task001Representative", objNull];
        private _campCenter = missionNamespace getVariable ["LBMQ_task001CampCenter", objNull];

        private _fallbackFlagPos = if (!isNull _representative) then {
            getPosATL _representative
        } else {
            if (!isNull _campCenter) then { getPosATL _campCenter } else { [10880.8, 3800.54, 0] }
        };

        if (_taskDestination isEqualTo []) then {
            _taskDestination = _fallbackFlagPos;
        };

        ["LBMQ_task001RedFlag", _taskDestination, _fallbackFlagPos] call (missionNamespace getVariable "LBMQ_fnc_createTaskFlag");

        private _taskData = [
            _taskId,
            "Talk to Survivor's Union Representative",
            "Speak with a Survivor’s Union representative to possibly establish contact with PMC Group Alpha, and explain your situation to them.",
            _taskDestination,
            ""
        ];

        ["createLocal", _taskData] remoteExecCall ["LBMQ_fnc_task001Main", _player];
        ["registerRepresentativeAction", _player] call (missionNamespace getVariable "LBMQ_fnc_task001Main");
    };

    case "registerRepresentativeAction": {
        private _player = if (_payload isEqualType objNull) then { _payload } else { objNull };
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _representative = missionNamespace getVariable ["LBMQ_task001Representative", objNull];
        if (isNull _representative) exitWith {};

        private _existingActionId = missionNamespace getVariable ["LBMQ_task001RepresentativeTalkActionId", -1];
        if (_existingActionId >= 0) exitWith {};

        private _actionId = _representative addAction [
            "Speak with SU Representative",
            {
                params ["_target", "_caller", "_actionId", "_arguments"];
                ["onRepresentativeTalked", _caller] remoteExecCall ["LBMQ_fnc_task001Main", 2];
            },
            nil,
            1.5,
            true,
            true,
            "",
            "_this distance _target < 4"
        ];

        missionNamespace setVariable ["LBMQ_task001RepresentativeTalkActionId", _actionId, true];
    };

    case "onRepresentativeTalked": {
        private _player = if (_payload isEqualType objNull) then { _payload } else { objNull };
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _isTaskActive = _player getVariable ["LBMQ_task001Active", false];
        private _currentTask = _player getVariable ["LBMQ_currentTask", ""];
        private _representative = missionNamespace getVariable ["LBMQ_task001Representative", objNull];

        if (!_isTaskActive || {!(_currentTask isEqualTo _taskId)} || {isNull _representative} || {_player distance _representative > 6}) exitWith {};

        ["complete", _player] call (missionNamespace getVariable "LBMQ_fnc_task001Main");
    };

    case "complete": {
        private _player = if (_payload isEqualType objNull) then { _payload } else { objNull };
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
        private _isTaskActive = _player getVariable ["LBMQ_task001Active", false];
        private _currentTask = _player getVariable ["LBMQ_currentTask", ""];

        if (!_isTaskActive || {!(_currentTask isEqualTo _taskId)} || {_taskId in _completedTasks}) exitWith {};

        _completedTasks pushBackUnique _taskId;
        _player setVariable ["LBMQ_completedTasks", _completedTasks, true];
        _player setVariable ["LBMQ_task001Active", false, true];

        private _representative = missionNamespace getVariable ["LBMQ_task001Representative", objNull];
        private _talkActionId = missionNamespace getVariable ["LBMQ_task001RepresentativeTalkActionId", -1];
        if (!isNull _representative && {_talkActionId >= 0}) then {
            _representative removeAction _talkActionId;
            missionNamespace setVariable ["LBMQ_task001RepresentativeTalkActionId", -1, true];
        };

        private _task001FlagToDelete = missionNamespace getVariable ["LBMQ_task001RedFlag", objNull];
        if (!isNull _task001FlagToDelete) then {
            deleteVehicle _task001FlagToDelete;
            missionNamespace setVariable ["LBMQ_task001RedFlag", objNull, true];
        };

        [_taskId, "SUCCEEDED"] remoteExecCall ["LBMQ_fnc_updateTaskLocal", _player];
        ["playDialogueLocal", objNull] remoteExecCall ["LBMQ_fnc_task001Main", _player];
    };

    case "onDialogueFinished": {
        private _player = if (_payload isEqualType objNull) then { _payload } else { objNull };
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
        if !(_taskId in _completedTasks) exitWith {};
        if ((_player getVariable ["LBMQ_currentTask", ""]) isEqualTo "LBMQ_Task_002") exitWith {};

        ["tryStart", _player] call (missionNamespace getVariable "LBMQ_fnc_task002Main");
    };

    case "createLocal": {
        [_payload] call (missionNamespace getVariable "LBMQ_fnc_taskCreateLocal");
    };

    case "playDialogueLocal": {
        private _traderSource = missionNamespace getVariable ["LBMQ_task001Representative", objNull];
        if (isNull _traderSource) then {
            _traderSource = if (!isNil "suTrader" && {!isNull suTrader}) then { suTrader } else { missionNamespace getVariable ["LBMQ_task001OfficeAnchor", objNull] };
        };

        private _lines = [
            ["Player", "Hello Contractor, I need to establish contact with PMC Group Alpha asap, can you assist with this?", 0, 3],
            ["Trader", "Bro what? Who just barges in a Contractor Office demanding something like that? You want me to get the president on the phone while I’m at it? No, I can’t do that. Not at least for free.", 1, 12],
            ["Player", "Okay, what is your price then?", 0, 3],
            ["Trader", "Don’t know yet, nobody around this area has asked that before, and I figure something like that is fairly hard, so for now, I do have something you can do while I talk to the higher ups. Go grab the weekly crate of medicine the US Army provides to my faction. Do that, and we’ll have an asking price for ya.", 2, 0]
        ];

        [_lines, ["LBMQ_task001_trader_01", "LBMQ_task001_trader_02"], _traderSource, {
            ["onDialogueFinished", player] remoteExecCall ["LBMQ_fnc_task001Main", 2];
        }] spawn (missionNamespace getVariable "LBMQ_fnc_playDialogueLocal");
    };
};