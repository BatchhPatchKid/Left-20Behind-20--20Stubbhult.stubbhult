params ["_container", "_caller", "_actionId", "_arguments"];

if ((_caller getVariable ["LB_economyTaskId", ""]) isEqualTo "") then {
    private _eligiblePlayers = [];
    private _minDistance = 1000;

    {
        if ((_caller distance _x) > _minDistance && {_x != _caller}) then {
            _eligiblePlayers pushBack _x;
        };
    } forEach playableUnits;

    if ((count _eligiblePlayers) <= 0) then {
        hintSilent "Sorry, but we couldn't find any eligible players for the task. Make sure one or more players are at least 1km away";
    } else {
        _rndTaskID = format ["LB_ECO_%1_%2_%3", getPlayerUID _caller, round (serverTime * 1000), floor (random 1000000)];
        _playerSelected = selectRandom _eligiblePlayers;

        [_caller, _rndTaskID,
            [format ["Eliminate %1 to earn $200. It does not matter if you or someone else kills him, just make sure the job gets done. You have 1 hour to complete this task.", name _playerSelected],
            "Eliminate the Player"],
            objNull, "ASSIGNED", 0, true, "kill", false
        ] call BIS_fnc_taskCreate;
        _caller setVariable ["LB_economyTaskId", _rndTaskID, true];

        _playerSelected setVariable ["LB_taskId", _rndTaskID];
        _playerSelected setVariable ["LB_container", _container];
        _playerSelected setVariable ["LB_actionId", _actionId];
        _playerSelected setVariable ["LB_caller", _caller];

        _playerSelected addEventHandler ["Killed", {
            params ["_unit", "_killer", "_instigator", "_useEffects"];
            private _taskId = _unit getVariable ["LB_taskId", ""];
            private _caller = _unit getVariable ["LB_caller", objNull];

            [_taskId, "SUCCEEDED"] call BIS_fnc_taskSetState;
            [_taskId, true] call BIS_fnc_deleteTask;
            hintSilent "Task has been completed, receive your reward at the contractor's office";

            private _reward = 200;
            if (!isNull _caller) then {
                [_caller, _reward] remoteExec ["LB_fnc_addMoneyServer", 2];
                _caller setVariable ["LB_economyTaskId", "", true];
                hintSilent format ["$%2 has been added to your account, %1. Good work out there.", name _caller, _reward];
            };

            uiSleep 5;
            hintSilent "";
        }];

        _playerSelected addEventHandler ["Deleted", {
            params ["_entity"];
            private _taskId = _entity getVariable ["LB_taskId", ""];
            [_taskId, "CANCELED"] call BIS_fnc_taskSetState;
            [_taskId, true] call BIS_fnc_deleteTask;
            private _caller = _entity getVariable ["LB_caller", objNull];
            if (!isNull _caller) then { _caller setVariable ["LB_economyTaskId", "", true]; };
            hintSilent "We have lost the position of the target. Thus, the contract has been canceled.";
            uiSleep 5;
            hintSilent "";
        }];

        _caller addEventHandler ["Killed", {
            params ["_unit", "_killer", "_instigator", "_useEffects"];
            private _tasks = allUnits select {(_x getVariable ["LB_caller", objNull]) isEqualTo _unit};
            {
                private _taskId = _x getVariable ["LB_taskId", ""];
                [_taskId, "CANCELED"] call BIS_fnc_taskSetState;
                [_taskId, true] call BIS_fnc_deleteTask;
                _unit setVariable ["LB_economyTaskId", "", true];
            } forEach _tasks;
            hintSilent "We have lost the position of the target. Thus, the contract has been canceled.";
            uiSleep 5;
            hintSilent "";
        }];

        [] spawn {
            params ["_playerSelected"];
        };

        [_playerSelected, _rndTaskID] spawn {
            params ["_target", "_taskId"];
            uiSleep 3600;
            if ([_taskId] call BIS_fnc_taskExists) then {
                [_taskId, "FAILED"] call BIS_fnc_taskSetState;
                [_taskId, true] call BIS_fnc_deleteTask;
                private _caller = _target getVariable ["LB_caller", objNull];
                if (!isNull _caller) then { _caller setVariable ["LB_economyTaskId", "", true]; };
                hintSilent "You have exhausted the 60 minutes time limit; thus, the task has been deemed a failure";
                uiSleep 5;
                hintSilent "";
            };
        };
    };
} else {
    hintSilent "Sorry, but it seems you already have an economy task assigned. Finish that one before accepting another.";
};