params ["_container", "_caller", "_actionId", "_arguments"];
private _faction = _arguments select 0;
private _reward = _arguments select 1;

if (isNull (currentTask _caller)) then {
    hintSilent format ["A bounty has been placed on a faction leader. Eliminate them for a reward, %1", name _caller];

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
	
    private _minDist = 700;
    private _maxDist = 2500;

    private _pos = [getPos _caller,_minDist,_maxDist,10,0,20,0] call _fn_findSafePosInBounds;
    if ((_pos distance2D [0,0,0]) <= 1 || {!([_pos] call _fn_inBounds)}) exitWith {
        hintSilent "No valid in-bounds location was found for this contract. Try again from a different area.";
    };

    private _posMarker = [_pos,0,300,0,0,20,0] call _fn_findSafePosInBounds;
    if ((_posMarker distance2D [0,0,0]) <= 1 || {!([_posMarker] call _fn_inBounds)}) then { _posMarker = _pos; };

    private _flag = "Flag_Red_F" createVehicle _pos;

    private _numUnits = ceil (random 7) + 6;
    [_faction,_numUnits,_pos,"Camp",0,RESISTANCE,"I_G_Survivor_F"] call (missionNamespace getVariable "FN_spawnAI");

    private _unitSkillsArray = [_faction,_pos] call FN_getFactionSkills;
    private _side = RESISTANCE;
    private _unit = "I_G_Survivor_F";

    private _group = createGroup [_side,true];

    private _sfOverride = false;

    private _target = _group createUnit [_unit,_pos,[],15,"NONE"];
    [_faction,_target,false,true,_sfOverride] call (missionNamespace getVariable "FN_equipAI");
    [_target,_unitSkillsArray select 2,_unitSkillsArray select 3,_unitSkillsArray select 4,_unitSkillsArray select 5,_unitSkillsArray select 6,_unitSkillsArray select 7,_unitSkillsArray select 8,_unitSkillsArray select 9] call FN_setUnitSkills;

    private _taskId = str (random 100);

    [_caller,_taskId,[format ["Eliminate the target to earn $%1. The group is held up within 300 meters of the marker. Faction: %2",_reward,_faction],"Eliminate the Stationary Target"],_posMarker,"ASSIGNED",0,true,"kill",false] call BIS_fnc_taskCreate;

    _target setVariable ["LB_taskId",_taskId];
    _target setVariable ["LB_container",_container];
    _target setVariable ["LB_actionId",_actionId];
    _target setVariable ["LB_caller",_caller];
    _target setVariable ["LB_flag",_flag];
    _target setVariable ["LB_reward",_reward];

    _target addEventHandler ["Killed",{
        params ["_unit","_killer","_instigator","_useEffects"];
        private _taskId = _unit getVariable ["LB_taskId",""];
        private _caller = _unit getVariable ["LB_caller",objNull];
        private _flag = _unit getVariable ["LB_flag",objNull];
        private _reward = _unit getVariable ["LB_reward",0];

        [_taskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
        [_taskId,true] call BIS_fnc_deleteTask;
        hintSilent "Task has been completed, receive your reward at the contractor's office";

        if (!isNull _caller) then {
            [_caller,_reward] remoteExec ["LB_fnc_addMoneyServer",2];
            hintSilent format ["$%2 has been added to your account, %1. Good work out there.",name _caller,_reward];
        };

        if (!isNull _flag) then { deleteVehicle _flag; };
    }];

    _target addEventHandler ["Deleted",{
        params ["_entity"];
        private _taskId = _entity getVariable ["LB_taskId",""];
        private _flag = _entity getVariable ["LB_flag",objNull];

        [_taskId,"CANCELED"] call BIS_fnc_taskSetState;
        [_taskId,true] call BIS_fnc_deleteTask;
        hintSilent "We have lost the position of the target. Thus, the contract has been canceled.";

        if (!isNull _flag) then { deleteVehicle _flag; };
    }];

    _caller addEventHandler ["Killed",{
        params ["_unit","_killer","_instigator","_useEffects"];
        private _targets = allUnits select {(_x getVariable ["LB_caller",objNull]) isEqualTo _unit};
        {
            private _taskId = _x getVariable ["LB_taskId",""];
            private _flag = _x getVariable ["LB_flag",objNull];
            [_taskId,"CANCELED"] call BIS_fnc_taskSetState;
            [_taskId,true] call BIS_fnc_deleteTask;
            if (!isNull _flag) then { deleteVehicle _flag; };
        } forEach _targets;

        hintSilent "We have lost the position of the target. Thus, the contract has been canceled.";
    }];
	
    [_taskId,_flag] spawn {
        params ["_taskId","_flag"];
        while {true} do {
            uiSleep 60;
            if (isNull _flag) exitWith {};
            if (!([_taskId] call BIS_fnc_taskExists)) exitWith { [_flag] remoteExec ["deleteVehicle",2]; };
        };
    };
} else {
    hintSilent "Sorry, but it seems you already have a task assigned. Finish that one before accepting another.";
};