params ["_mode", ["_payload", objNull]];

private _taskId = "LBMQ_Task_001";

switch (_mode) do {
    case "tryStart": {
        private _player = _payload;
        if (isNull _player || {!isPlayer _player}) exitWith {};

        if (isServer) exitWith {
            ["start", _player] call (missionNamespace getVariable "LBMQ_fnc_task001Main");
        };

        if (_player != player) exitWith {};
        ["start", _player] remoteExecCall ["LBMQ_fnc_task001Main", 2];
    };

    case "start": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
        private _isTaskActive = _player getVariable ["LBMQ_task001Active", false];
        if (_taskId in _completedTasks || {_isTaskActive}) exitWith {};

        _player setVariable ["LBMQ_completedTasks", _completedTasks, true];
        _player setVariable ["LBMQ_currentTask", _taskId, true];
        _player setVariable ["LBMQ_task001Active", true, true];

        private _officeAnchor = missionNamespace getVariable ["LBMQ_task001OfficeAnchor", objNull];
        private _traderObj = if (!isNil "suTrader") then { suTrader } else { objNull };
        private _taskDestination = [[_officeAnchor, _traderObj], "LBMQ_Task001_Office"] call (missionNamespace getVariable "LBMQ_fnc_resolveTaskDestination");

        private _taskData = [
            _taskId,
            "Speak with Survivor's Union Contractor",
            "Speak with the Survivor’s Union contractor to possibly establish contact with PMC Group Alpha, and explain your situation to them.",
            _taskDestination,
            ""
        ];

        ["createLocal", _taskData] remoteExecCall ["LBMQ_fnc_task001Main", _player];
        ["registerTrigger", _player] call (missionNamespace getVariable "LBMQ_fnc_task001Main");
    };

    case "registerTrigger": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _existingTrigger = _player getVariable ["LBMQ_task001OfficeTrigger", objNull];
        if (!isNull _existingTrigger) then { deleteVehicle _existingTrigger; };

        private _officeAnchor = missionNamespace getVariable ["LBMQ_task001OfficeAnchor", objNull];
        private _traderObj = if (!isNil "suTrader") then { suTrader } else { objNull };
        private _officePos = [[_officeAnchor, _traderObj], "LBMQ_Task001_Office"] call (missionNamespace getVariable "LBMQ_fnc_resolveTaskDestination");
        if (_officePos isEqualTo []) exitWith {};

        private _trigger = createTrigger ["EmptyDetector", _officePos, false];
        _trigger setVariable ["LBMQ_owner", _player, false];
        _trigger setTriggerArea [6, 6, 0, false, 3];
        _trigger setTriggerActivation ["ANYPLAYER", "PRESENT", false];
        _trigger setTriggerTimeout [0, 0, 0, false];

        private _onCondition = "private _owner = thisTrigger getVariable ['LBMQ_owner', objNull]; !isNull _owner && {alive _owner} && {_owner inArea thisTrigger}";
        private _onActivation = "private _owner = thisTrigger getVariable ['LBMQ_owner', objNull]; if (!isNull _owner) then { ['complete', _owner] call (missionNamespace getVariable 'LBMQ_fnc_task001Main'); };";
        _trigger setTriggerStatements [_onCondition, _onActivation, ""];

        _player setVariable ["LBMQ_task001OfficeTrigger", _trigger, false];
    };

    case "complete": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
        private _isTaskActive = _player getVariable ["LBMQ_task001Active", false];
        private _currentTask = _player getVariable ["LBMQ_currentTask", ""];

        if (!_isTaskActive || {!(_currentTask isEqualTo _taskId)} || {_taskId in _completedTasks}) exitWith {};

        _completedTasks pushBackUnique _taskId;
        _player setVariable ["LBMQ_completedTasks", _completedTasks, true];
        _player setVariable ["LBMQ_task001Active", false, true];

        private _officeTrigger = _player getVariable ["LBMQ_task001OfficeTrigger", objNull];
        if (!isNull _officeTrigger) then {
            deleteVehicle _officeTrigger;
            _player setVariable ["LBMQ_task001OfficeTrigger", objNull, false];
        };

        [_taskId, "SUCCEEDED"] remoteExecCall ["LBMQ_fnc_updateTaskLocal", _player];
        ["playDialogueLocal", objNull] remoteExecCall ["LBMQ_fnc_task001Main", _player];
    };

    case "onDialogueFinished": {
        private _player = _payload;
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
        private _traderSource = if (!isNil "suTrader" && {!isNull suTrader}) then { suTrader } else { missionNamespace getVariable ["LBMQ_task001OfficeAnchor", objNull] };

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