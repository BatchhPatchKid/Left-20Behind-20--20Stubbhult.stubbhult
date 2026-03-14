params ["_container", "_caller", "_actionId"];

if ((_caller getVariable ["LB_economyTaskId", ""]) == "") then {
    hintSilent format ["The following group has had a bounty put on their leader. Eliminate them for a reward, %1", name _caller];

    private _fn_inBounds = {
        params ["_p"];
        private _ws = worldSize;
        private _x = _p # 0;
        private _y = _p # 1;
        (_x >= 0) && (_y >= 0) && (_x <= _ws) && (_y <= _ws)
    };

    private _fn_findSafePosInBounds = {
        params ["_center","_minDist","_maxDist","_objDist",["_waterMode",0],["_maxGrad",20],["_shoreMode",0],["_maxAttempts",40]];
        private _p = [0,0,0];
        for "_i" from 1 to _maxAttempts do {
            _p = [_center,_minDist,_maxDist,_objDist,_waterMode,_maxGrad,_shoreMode] call BIS_fnc_findSafePos;
            if ((_p distance2D [0,0,0]) > 1 && {[_p] call _fn_inBounds}) exitWith {};
        };
        _p
    };

    private _factionArray = ["taskFactionWeights"] call (missionNamespace getVariable "FN_arrayReturn");
    private _faction = _factionArray call BIS_fnc_selectRandomWeighted;
    private _minDist = 750;
    private _maxDist = 1500;
    private _pos = [getPos _caller,_minDist,_maxDist,5,0,20,0] call _fn_findSafePosInBounds;

    if ((_pos distance2D [0,0,0]) <= 1 || {!([_pos] call _fn_inBounds)}) exitWith {
        hintSilent "No valid in-bounds location was found for this contract. Try again from a different area.";
    };

    private _stoneSaver = "Land_BluntStone_01" createVehicle _pos;

    private _unitSkillsArray = [_faction,_pos] call FN_getFactionSkills;
    private _side = RESISTANCE;
    private _unit = "I_G_Survivor_F";

    private _sfOverride = false;
    private _sfProb = 0;
    if (random 1 < _sfProb) then { _sfOverride = true; };

    private _meleeChance = [_faction] call (missionNamespace getVariable "FN_meleeChance");

    private _groupBandit = createGroup [_side,true];

    private _newAI = _groupBandit createUnit [_unit,_pos,[],15,"NONE"];
    [_faction,_newAI,false,true,_sfOverride] call (missionNamespace getVariable "FN_equipAI");
    [_newAI,_unitSkillsArray select 2,_unitSkillsArray select 3,_unitSkillsArray select 4,_unitSkillsArray select 5,_unitSkillsArray select 6,_unitSkillsArray select 7,_unitSkillsArray select 8,_unitSkillsArray select 9] call FN_setUnitSkills;

    private _maxBandits = ceil (random 5) + 4;
    for "_i" from 0 to _maxBandits do {
        if (random 1 > _meleeChance) then {
            private _banditUnit = _groupBandit createUnit [_unit,_pos,[],15,"NONE"];
            [_faction,_banditUnit,false,true,_sfOverride] call (missionNamespace getVariable "FN_equipAI");
            [_banditUnit,_unitSkillsArray select 2,_unitSkillsArray select 3,_unitSkillsArray select 4,_unitSkillsArray select 5,_unitSkillsArray select 6,_unitSkillsArray select 7,_unitSkillsArray select 8,_unitSkillsArray select 9] call FN_setUnitSkills;
        } else {
            private _grpTemp = createGroup east;
            private _meleePos = [_pos,0,10,3,0,20,0] call _fn_findSafePosInBounds;
            if ((_meleePos distance2D [0,0,0]) <= 1 || {!([_meleePos] call _fn_inBounds)}) then { _meleePos = _pos; };
            private _banditUnit = _grpTemp createUnit ["O_soldier_Melee_RUSH",_meleePos,[],1,"NONE"];
            [_faction,_banditUnit,true,false,false] call (missionNamespace getVariable "FN_equipAI");
            [_banditUnit,_unitSkillsArray select 2,_unitSkillsArray select 3,_unitSkillsArray select 4,_unitSkillsArray select 5,_unitSkillsArray select 6,_unitSkillsArray select 7,_unitSkillsArray select 8,_unitSkillsArray select 9] call FN_setUnitSkills;
        };
        sleep 0.01;
    };

    private _waypointPos = [_pos,150,300,3,0,20,0] call _fn_findSafePosInBounds;
    if ((_waypointPos distance2D [0,0,0]) <= 1 || {!([_waypointPos] call _fn_inBounds)}) then { _waypointPos = _pos; };
    private _wp1 = _groupBandit addWaypoint [_waypointPos,0];
    _wp1 setWaypointType "MOVE";

    _waypointPos = [_pos,100,300,3,0,20,0] call _fn_findSafePosInBounds;
    if ((_waypointPos distance2D [0,0,0]) <= 1 || {!([_waypointPos] call _fn_inBounds)}) then { _waypointPos = _pos; };
    private _wp2 = _groupBandit addWaypoint [_waypointPos,1];
    _wp2 setWaypointType "MOVE";

    _waypointPos = [_pos,50,300,3,0,20,0] call _fn_findSafePosInBounds;
    if ((_waypointPos distance2D [0,0,0]) <= 1 || {!([_waypointPos] call _fn_inBounds)}) then { _waypointPos = _pos; };
    private _wp3 = _groupBandit addWaypoint [_waypointPos,2];
    _wp3 setWaypointType "MOVE";

    _waypointPos = [_pos,100,300,3,0,20,0] call _fn_findSafePosInBounds;
    if ((_waypointPos distance2D [0,0,0]) <= 1 || {!([_waypointPos] call _fn_inBounds)}) then { _waypointPos = _pos; };
    private _wp4 = _groupBandit addWaypoint [_waypointPos,3];
    _wp4 setWaypointType "CYCLE";

    sleep 3;
    hintSilent "";

    private _rndTaskID = format ["LB_ECO_%1_%2_%3", getPlayerUID _caller, round (serverTime * 1000), floor (random 1000000)];

    [_caller,_rndTaskID,[format ["Eliminate the target. The target will be within 300 meters of the mark on your map. It does not matter if you or someone else kills him, just make sure the job gets done. The faction the target is a part of is %1",_faction],"Eliminate the Wandering Target"],_pos,"ASSIGNED",0,true,"kill",false] call BIS_fnc_taskCreate;
    _caller setVariable ["LB_economyTaskId", _rndTaskID, true];

    _newAI setVariable ["LB_taskId",_rndTaskID];
    _newAI setVariable ["LB_container",_container];
    _newAI setVariable ["LB_actionId",_actionId];
    _newAI setVariable ["LB_caller",_caller];
    _newAI setVariable ["LB_stoneSaver",_stoneSaver];

    _newAI addEventHandler ["Killed",{
        params ["_unit","_killer","_instigator","_useEffects"];
        private _taskId = _unit getVariable ["LB_taskId",""];
        private _caller = _unit getVariable ["LB_caller",objNull];
        private _stoneSaver = _unit getVariable ["LB_stoneSaver",objNull];

        [_taskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
        [_taskId,true] call BIS_fnc_deleteTask;
        hintSilent "Task has been completed, receive your reward at the contractor's office";

        private _reward = 150;
        if (!isNull _caller) then {
            [_caller,_reward] remoteExec ["LB_fnc_addMoneyServer",2];
            if ((_caller getVariable ["LB_economyTaskId", ""]) == _taskId) then {
                _caller setVariable ["LB_economyTaskId", "", true];
            };
            hintSilent format ["$%2 has been added to your account, %1. Good work out there.",name _caller,_reward];
        };

        [] spawn { uiSleep 5; hintSilent ""; };
        if (!isNull _stoneSaver) then { deleteVehicle _stoneSaver; };
    }];

    _newAI addEventHandler ["Deleted",{
        params ["_entity"];
        private _taskId = _entity getVariable ["LB_taskId",""];
        private _stoneSaver = _entity getVariable ["LB_stoneSaver",objNull];
        [_taskId,"CANCELED"] call BIS_fnc_taskSetState;
        [_taskId,true] call BIS_fnc_deleteTask;
        private _caller = _entity getVariable ["LB_caller",objNull];
        if (!isNull _caller) then {
            if ((_caller getVariable ["LB_economyTaskId", ""]) == _taskId) then {
                _caller setVariable ["LB_economyTaskId", "", true];
            };
        };
        hintSilent "We have lost the position of the target. Thus, the contract has been canceled.";
        [] spawn { uiSleep 5; hintSilent ""; };
        if (!isNull _stoneSaver) then { deleteVehicle _stoneSaver; };
    }];

    _caller addEventHandler ["Killed",{
        params ["_unit","_killer","_instigator","_useEffects"];
        private _targets = allUnits select {(_x getVariable ["LB_caller",objNull]) isEqualTo _unit};
        {
            private _taskId = _x getVariable ["LB_taskId",""];
            private _stoneSaver = _x getVariable ["LB_stoneSaver",objNull];
            [_taskId,"CANCELED"] call BIS_fnc_taskSetState;
            [_taskId,true] call BIS_fnc_deleteTask;
            if ((_unit getVariable ["LB_economyTaskId", ""]) == _taskId) then {
                _unit setVariable ["LB_economyTaskId", "", true];
            };
            if (!isNull _stoneSaver) then { deleteVehicle _stoneSaver; };
        } forEach _targets;
        hintSilent "We have lost the position of the target. Thus, the contract has been canceled.";
        [] spawn { uiSleep 5; hintSilent ""; };
    }];
} else {
    hintSilent "Sorry, but it seems you already have an economy task assigned. Finish that one before accepting another.";
};