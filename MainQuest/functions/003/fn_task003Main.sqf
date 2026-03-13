params ["_mode", ["_payload", objNull]];

private _taskId = "LBMQ_Task_003";

switch (_mode) do {
    case "tryStart": {
        private _player = _payload;
        if (isNull _player || {!isPlayer _player}) exitWith {};

        private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
        if !("LBMQ_Task_002" in _completedTasks) exitWith {};
        if (("LBMQ_Task_003" in _completedTasks) || {_player getVariable ["LBMQ_task003Active", false]}) exitWith {};

        if (isServer) exitWith { ["start", _player] call (missionNamespace getVariable "LBMQ_fnc_task003Main"); };
        if (_player != player) exitWith {};

        ["start", _player] remoteExecCall ["LBMQ_fnc_task003Main", 2];
    };

    case "start": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
        private _isTaskActive = _player getVariable ["LBMQ_task003Active", false];
        if !("LBMQ_Task_002" in _completedTasks) exitWith {};
        if (_taskId in _completedTasks || {_isTaskActive}) exitWith {};

        _player setVariable ["LBMQ_currentTask", _taskId, true];
        _player setVariable ["LBMQ_task003Active", true, true];

        if !(missionNamespace getVariable ["LBMQ_task003ObjectsSpawned", false]) then {
            call compile preprocessFileLineNumbers "MainQuest\functions\003\ObjectsToSpawn.sqf";
            missionNamespace setVariable ["LBMQ_task003ObjectsSpawned", true, true];
        };

        private _headDoctor = missionNamespace getVariable ["LBMQ_task003HeadDoctor", objNull];
        private _taskDestination = [[_headDoctor], ""] call (missionNamespace getVariable "LBMQ_fnc_resolveTaskDestination");
		
		if (_taskDestination isEqualTo []) then {
            _taskDestination = [11090, 4038, 0];
        };

        ["LBMQ_task003MedicalFlag", _taskDestination, [11090, 4038, 0]] call (missionNamespace getVariable "LBMQ_fnc_createTaskFlag");
		
        private _taskData = [
            _taskId,
            "Bring Medicine Crate to SU Medical Tent",
            "Now that you have obtained the medical crate from the US Army, bring it back to the Survivor's Union Contractor's Office. However, it may be a good idea not to take the medicine offered by the scientist - just a hunch.",
            _taskDestination,
            "run"
        ];

        ["createLocal", _taskData] remoteExecCall ["LBMQ_fnc_task003Main", _player];
        ["registerDoctorAction", _player] call (missionNamespace getVariable "LBMQ_fnc_task003Main");
        ["playRadioIntroLocal", objNull] remoteExecCall ["LBMQ_fnc_task003Main", _player];
    };

    case "registerDoctorAction": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _headDoctor = missionNamespace getVariable ["LBMQ_task003HeadDoctor", objNull];
        if (isNull _headDoctor) exitWith {};

        private _existingActionId = missionNamespace getVariable ["LBMQ_task003DoctorTalkActionId", -1];
        if (_existingActionId >= 0) exitWith {};

        private _actionId = _headDoctor addAction [
            "Talk to Head Doctor",
            {
                params ["_target", "_caller", "_actionId", "_arguments"];
                ["onDoctorTalked", _caller] remoteExecCall ["LBMQ_fnc_task003Main", 2];
            },
            nil,
            1.5,
            true,
            true,
            "",
            "_this distance _target < 4"
        ];

        missionNamespace setVariable ["LBMQ_task003DoctorTalkActionId", _actionId, true];
    };

    case "onDoctorTalked": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _isTaskActive = _player getVariable ["LBMQ_task003Active", false];
        private _currentTask = _player getVariable ["LBMQ_currentTask", ""];
        private _headDoctor = missionNamespace getVariable ["LBMQ_task003HeadDoctor", objNull];

        if (!_isTaskActive || {!(_currentTask isEqualTo _taskId)} || {isNull _headDoctor} || {_player distance _headDoctor > 6}) exitWith {};
        ["complete", _player] call (missionNamespace getVariable "LBMQ_fnc_task003Main");
    };

    case "complete": {
        private _player = _payload;
        if (!isServer || {isNull _player} || {!isPlayer _player}) exitWith {};

        private _completedTasks = _player getVariable ["LBMQ_completedTasks", []];
        private _isTaskActive = _player getVariable ["LBMQ_task003Active", false];
        private _currentTask = _player getVariable ["LBMQ_currentTask", ""];
        if (!_isTaskActive || {!(_currentTask isEqualTo _taskId)} || {_taskId in _completedTasks}) exitWith {};

        _completedTasks pushBackUnique _taskId;
        _player setVariable ["LBMQ_completedTasks", _completedTasks, true];
        _player setVariable ["LBMQ_task003Active", false, true];

        private _flag = missionNamespace getVariable ["LBMQ_task003MedicalFlag", objNull];
        if (!isNull _flag) then {
            deleteVehicle _flag;
            missionNamespace setVariable ["LBMQ_task003MedicalFlag", objNull, true];
        };

        [_taskId, "SUCCEEDED"] remoteExecCall ["LBMQ_fnc_updateTaskLocal", _player];
        ["playDialogueLocal", objNull] remoteExecCall ["LBMQ_fnc_task003Main", _player];

        [_player] spawn {
            params ["_taskOwner"];
            sleep 21;

            if (!isNull _taskOwner && {isPlayer _taskOwner}) then {
                ["playBanditWarningLocal", objNull] remoteExecCall ["LBMQ_fnc_task003Main", _taskOwner];
            };

            sleep 2;
            ["spawnBanditAttack", objNull] call (missionNamespace getVariable "LBMQ_fnc_task003Main");
        };
    };

    case "spawnBanditAttack": {
        if (!isServer) exitWith {};

        if (missionNamespace getVariable ["LBMQ_task003BanditAttackSpawned", false]) exitWith {};
        missionNamespace setVariable ["LBMQ_task003BanditAttackSpawned", true, true];

        private _headDoctor = missionNamespace getVariable ["LBMQ_task003HeadDoctor", objNull];
        private _targetPos = if (!isNull _headDoctor) then { getPosATL _headDoctor } else { [11090, 4038, 0] };

        private _banditUnits = [];
        private _equipFn = missionNamespace getVariable ["FN_equipAI", {}];

        private _fixedSpawnPos = [11013.6,4232.51,0];

		{
			private _group = createGroup independent;

			for "_i" from 1 to 7 do {
				private _unit = _group createUnit ["I_G_Survivor_F", _fixedSpawnPos, [], 10, "FORM"];
				["Bandit", _unit, false, false, false] call _equipFn;

				_unit setSkill 0.6;
				_unit setCombatMode "RED";
				_unit setBehaviour "AWARE";
				_banditUnits pushBack _unit;
			};

			_group setFormation "WEDGE";
			_group setSpeedMode "FULL";
			_group setBehaviour "COMBAT";
			_group setCombatMode "RED";

			private _attackWp = _group addWaypoint [_targetPos, 0];
			_attackWp setWaypointType "SAD";
			_attackWp setWaypointBehaviour "COMBAT";
			_attackWp setWaypointCombatMode "RED";
		} forEach [0];
		
        missionNamespace setVariable ["LBMQ_task003BanditAttackUnits", _banditUnits, true];
    };

    case "createLocal": {
        [_payload] call (missionNamespace getVariable "LBMQ_fnc_taskCreateLocal");
    };

    case "playDialogueLocal": {
        private _lines = [
            ["Player", "Here's the medicine I was tasked to bring you.", 0, 4],
            ["Scientist", "Very good, very good. I was informed about you by leadership. They want you to investigate a missing Survivor's Union Patrol west of here. I have all the details on this piece of paper.", 0, 9],
            ["Scientist", "Well Survivor, if you would, please help us take out those bandits. It would be greatly appreciated.", 0, 7]
        ];

        private _headDoctor = missionNamespace getVariable ["LBMQ_task003HeadDoctor", objNull];

        [_lines, ["LBMQ_task003_trader_01", "LBMQ_task003_trader_02"], _headDoctor, {}] spawn (missionNamespace getVariable "LBMQ_fnc_playDialogueLocal");
    };

    case "playRadioIntroLocal": {
        [] spawn {
            uiSleep 1;

            private _radioSource = player;
            if (isNull _radioSource) exitWith {};

            [_radioSource, ["LBMQ_task003_radio_01", 100, 1]] remoteExecCall ["say3D", clientOwner];
            systemChat "SU: Survivor, this is Dispatch, go ahead and bring the medical crate to coordinates 110224. A temporary medical tent was raised in that area. Dispatch out.";
        };
    };

    case "playBanditWarningLocal": {
        [] spawn {
            uiSleep 1;

            private _radioSource = player;
            if (isNull _radioSource) exitWith {};

            [_radioSource, ["LBMQ_task003_radio_02", 100, 1]] remoteExecCall ["say3D", clientOwner];
            systemChat "Dispatch: All units around coordinates 110224, be advised, we've gotten reports of a large bandit group heading to your location. Be prepared for a fight. Dispatch out.";
        };
    };
};