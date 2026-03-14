params ["_container","_caller","_actionId","_arguments"];

if ((_caller getVariable ["LB_economyTaskId", ""]) == "") then {

	private _fn_inBounds = {
		params ["_p"];
		private _ws = worldSize;
		private _x = _p # 0;
		private _y = _p # 1;
		(_x >= 0) && (_y >= 0) && (_x <= _ws) && (_y <= _ws)
	};

	private _fn_findSafePosInBounds = {
		params ["_center","_minDist","_maxDist",["_maxAttempts",40]];
		private _p = [0,0,0];
		for "_i" from 1 to _maxAttempts do {
			_p = [_center,_minDist,_maxDist,5,0,20,0] call BIS_fnc_findSafePos;
			if ((_p distance2D [0,0,0]) > 1 && {[_p] call _fn_inBounds}) exitWith {};
		};
		_p
	};

	private _mutantSpec = _arguments select 0;
	private _reward = _arguments select 1;
	private _amountToSpawn = _arguments select 2;

	private _mutantType = "";
	if ((typeName _mutantSpec) isEqualTo "ARRAY") then {
		_mutantType = selectRandom _mutantSpec;
	} else {
		_mutantType = _mutantSpec;
	};

	hintSilent format ["The mutant horde has a bounty put on them. Eliminate all %2 for a reward, %1",(name _caller),_amountToSpawn];

	_minDist = 1000;
	_maxDist = 2500;
	_pos = [getPos _caller,_minDist,_maxDist] call _fn_findSafePosInBounds;

	if ((_pos distance2D [0,0,0]) <= 1 || {!([_pos] call _fn_inBounds)}) exitWith {
		hintSilent "No valid in-bounds location was found for this contract. Try again from a different area.";
	};

	// keeps everything within 500 meters from despawning
	_stoneSaver = "Land_BluntStone_01" createVehicle _pos;
	_totemSaver = "Land_PalmTotem_01_F" createVehicle _pos;

	private _aiGroup = [];
	private _horde = createGroup east;
	for "_i" from 1 to _amountToSpawn do {
		private _spawnPos = [_pos,5,50] call _fn_findSafePosInBounds;
		if ((_spawnPos distance2D [0,0,0]) <= 1 || {!([_spawnPos] call _fn_inBounds)}) then {_spawnPos = _pos;};
		private _hordeUnit = _horde createUnit [_mutantType,_spawnPos,[],20,"NONE"];
		_aiGroup pushBack _hordeUnit;
	};

	private _wpPos0 = [_pos,200,400] call _fn_findSafePosInBounds;
	if ((_wpPos0 distance2D [0,0,0]) <= 1 || {!([_wpPos0] call _fn_inBounds)}) then {_wpPos0 = _pos;};
	_waypoint1 = _horde addWaypoint [_wpPos0,0];
	_waypoint1 setWaypointType "MOVE";
	_waypoint1 setWaypointBehaviour "COMBAT";

	_rndTaskID = format ["LB_ECO_%1_%2_%3", getPlayerUID _caller, round (serverTime * 1000), floor (random 1000000)];

	[
		_caller,
		_rndTaskID,
		[
			format ["Eliminate all %1 mutants to earn $%2. The mutants will be within 500 meters of the objective marker. It does not matter if you or someone else kills him, just make sure the job gets done.",_amountToSpawn,_reward],
			"Eliminate the Mutants",
			""
		],
		_pos,
		"ASSIGNED",
		0,
		true,
		"kill",
		false
	 ] call BIS_fnc_taskCreate;
	_caller setVariable ["LB_economyTaskId", _rndTaskID, true];

	sleep 5;

	private _allDead = false;

	while {!_allDead} do {

		if ((_caller getVariable ["LB_economyTaskId", ""]) != _rndTaskID) exitWith {
			deleteVehicle _stoneSaver;
			deleteVehicle _totemSaver;
		};

		_allDead = true;
		{
			if (!isNull _x && alive _x) exitWith {_allDead = false;};
		} forEach _aiGroup;

		_allNull = true;
		{
			if (!isNull _x) exitWith {_allNull = false;};
		} forEach _aiGroup;

		if (_allDead) exitWith {

			if (_allNull) then {

				[_rndTaskID,"CANCELED"] call BIS_fnc_taskSetState;
				[_rndTaskID,true] call BIS_fnc_deleteTask;
				_caller setVariable ["LB_economyTaskId", "", true];
				hintSilent "We have lost the postion of the targets. Thus, the contract has been canceled.";
				sleep 5;
				hintSilent "";

			} else {

				[_rndTaskID,"SUCCEEDED"] call BIS_fnc_taskSetState;
				[_rndTaskID,true] call BIS_fnc_deleteTask;
				_caller setVariable ["LB_economyTaskId", "", true];

				// New money logic: credit player balance on the server (1 reward = 1 money unit)
				[_caller,_reward] remoteExec ["LB_fnc_addMoneyServer",2];

				hintSilent "Task has been completed, receive your reward at the contractor's office";
				sleep 0.5;
				hintSilent format ["$%2 has been added to your account, %1. Good work out there.",(name _caller),_reward];

				sleep 5;
				hintSilent "";
			};
		};

		if (not alive _caller) exitWith {
			[_rndTaskID,"CANCELED"] call BIS_fnc_taskSetState;
			[_rndTaskID,true] call BIS_fnc_deleteTask;
			_caller setVariable ["LB_economyTaskId", "", true];
			hintSilent "We have lost the postion of the targets. Thus, the contract has been canceled.";
		};

		sleep 10;

		private _closestPlayer = objNull;
		private _minDistance = 99999;

		{
			private _distance = (_aiGroup select 0) distance _x;
			if (_distance < _minDistance) then {
				_minDistance = _distance;
				_closestPlayer = _x;
			};
		} forEach allPlayers;

		for "_i" from 0 to (count waypoints _horde - 1) do {
			deleteWaypoint [_horde,0];
		};

		if (_closestPlayer distance (_aiGroup select 0) < 300) then {
			_waypoint4 = _horde addWaypoint [(getPos _closestPlayer),0];
			_waypoint4 setWaypointType "MOVE";
			_waypoint4 setWaypointBehaviour "COMBAT";
		} else {
			private _wpPos1 = [_pos,200,400] call _fn_findSafePosInBounds;
			if ((_wpPos1 distance2D [0,0,0]) <= 1 || {!([_wpPos1] call _fn_inBounds)}) then {_wpPos1 = _pos;};
			_waypoint1 = _horde addWaypoint [_wpPos1,0];
			_waypoint1 setWaypointType "MOVE";
			_waypoint1 setWaypointBehaviour "COMBAT";
		};
	};

	deleteVehicle _stoneSaver;
	deleteVehicle _totemSaver;

} else {
	hintSilent "Sorry, but it seems you already have an economy task assigned. Finish that one before accepting another.";
};