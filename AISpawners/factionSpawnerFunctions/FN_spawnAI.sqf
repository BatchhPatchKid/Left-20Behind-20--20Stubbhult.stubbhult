params ["_faction","_numUnits","_pos","_typeOfLocationArea","_sfGroup","_side","_unit"];

// Backward-compat: some callers still pass [.., _side, _unit] without _sfGroup.
if ((_sfGroup isEqualType west) && {(_side isEqualType "")} && {isNil "_unit"}) then {
    _unit = _side;
    _side = _sfGroup;
    _sfGroup = -1;
};


//example usage for patrols: ["SU",7,getPos player,"Squad",0,WEST,B_Soldier_F] call (missionNamespace getVariable "FN_spawnAI");
//private _args=["SU",7,getPos player,"Squad",0,WEST,"B_Soldier_F"];

//if (isServer) then {
//    _args call (missionNamespace getVariable "FN_spawnAI");
//} else {
//    _args remoteExecCall ["FN_spawnAI",2];
//};

if (!(_sfGroup isEqualType 0)) then {
    _sfGroup = -1;
};

// Normalize _side if it sometimes arrives as a STRING
if (_side isEqualType "") then {
	private _s = toUpper _side;
	_side = switch (_s) do {
		case "WEST";
		case "BLUFOR": { WEST };

		case "EAST";
		case "OPFOR": { EAST };

		case "INDEPENDENT";
		case "GUER";
		case "RESISTANCE": { independent };

		case "CIVILIAN";
		case "CIV": { civilian };

		default { independent };
	};
};

// If it's still not a side for any reason, force default
if !(_side isEqualType WEST) then { _side = independent; };

//////////////////////////////////////////////////////////////////////////////
// FUNCTION DECLARATIONS
//////////////////////////////////////////////////////////////////////////////

FN_createGroup = {
    params ["_side","_faction"];

	// Group creation line (your existing line follows)
	private _grp = createGroup _side;
    [_grp,_faction] call (missionNamespace getVariable "LB_FacReg_Set");
    _grp
};

FN_setWaypoints = {
    params ["_pos","_minDis","_maxDis","_grp"];
    _posWP = [_pos,_minDis,_maxDis,3,0,20,0] call BIS_fnc_findSafePos;
    _waypoint1 = _grp addWaypoint [_posWP,2];
    _waypoint1 setWaypointType "MOVE";
    _waypoint1 setWaypointSpeed "FULL";
    _waypoint1 setWaypointBehaviour "AWARE";
    _posWP = [_pos,_minDis,_maxDis,3,0,20,0] call BIS_fnc_findSafePos;
    _waypoint2 = _grp addWaypoint [_posWP,2];
    _waypoint2 setWaypointType "MOVE";
    _waypoint2 setWaypointSpeed "FULL";
    _waypoint2 setWaypointBehaviour "AWARE";
    _posWP = [_pos,_minDis,_maxDis,3,0,20,0] call BIS_fnc_findSafePos;
    _waypoint3 = _grp addWaypoint [_posWP,2];
    _waypoint3 setWaypointType "CYCLE";
    _waypoint3 setWaypointSpeed "FULL";
    _waypoint3 setWaypointBehaviour "AWARE";
    _grp setCurrentWaypoint _waypoint1;
};

FN_carPatrol = {
    params ["_vehArray","_numOfUnits"];
    if (round random [0,2,5] >= 2) then {
        private _isSpecOpsGroup = [_sfGroup] call _fn_isSF;
        private _spawnMeleeGroup = false;

        _veh = (_vehArray call BIS_fnc_selectRandomWeighted) createVehicle ([_pos,5,50,10,0,20,0,[],[]] call BIS_fnc_findSafePos);
        clearWeaponCargoGlobal _veh;
        clearMagazineCargoGlobal _veh;
        clearItemCargoGlobal _veh;
        _grpVeh = createGroup _side;

        for "_i" from 1 to _numOfUnits do {
           private _spawnPos = [_pos,0,10,3,0,20,0,[],[]] call BIS_fnc_findSafePos;
           [_grpVeh,_unit,_spawnPos,_faction,_isSpecOpsGroup,false,_spawnMeleeGroup] call (missionNamespace getVariable "FN_createAIUnit");
        };

        {_x moveInAny _veh} forEach units _grpVeh;

        _veh setHitPointDamage ["HitL",0];
        _veh setHitPointDamage ["HitR",0];
        _veh setFuel (random [.03,.1,.3]);
        {
            _veh setHitPointDamage [_x,(random [.2,.45,.75])];
        } forEach ["hitengine","hithull","hitfuel","hitfueltank","hitengine1","hitglass1","hitglass10","hitglass3","hitlfwheel","hitlglass","hitlf2wheel","hitgear"];

        _veh setLightBrightness 10;
        _veh setLightDayLight true;

        [_pos,50,150,_grpVeh] call FN_setWaypoints;
        [_grpVeh,[_veh],[]] call (missionNamespace getVariable "FN_enableDynamicSim");
    };
    [_grp,[],[]] call (missionNamespace getVariable "FN_enableDynamicSim");
};

FN_lootSpawnByFaction = {
    params ["_pos","_faction","_side"];
    if (_side != WEST) then {
        switch (_faction) do {
            case "US";
            case "RU": { [_pos,2] call (missionNamespace getVariable "FN_lootSpawner"); };
            case "TRB";
            case "PMC";
            case "ROA";
            case "ALF": { [_pos,1] call (missionNamespace getVariable "FN_lootSpawner"); };
            default { [_pos,0] call (missionNamespace getVariable "FN_lootSpawner"); };
        };
    };
};

FN_spawnFortifications = {
    params ["_turret"];

    private _sfOverride = [_sfGroup] call _fn_isSF;

    _turretPos = [_pos,15,40,10,0,20,0,[],[]] call BIS_fnc_findSafePos;

    _roundSandBag = createVehicle ["Land_BagFence_01_round_green_F",[0,0,0],[],0,"CAN_COLLIDE"];
    _roundSandBag allowDamage false;
    _roundSandBag setVectorDirAndUp [[0,1,0],(vectorUp _roundSandBag)];
    _roundSandBag setPosATL [_turretPos select 0,_turretPos select 1,0];

    _longBagLeft = createVehicle ["Land_BagFence_01_long_green_F",[0,0,0],[],0,"CAN_COLLIDE"];
    _longBagLeft allowDamage false;
    _longBagLeft setVectorDirAndUp [[-.923,-.336,0],(vectorUp _longBagLeft)];
    _longBagLeft setPosATL [(_turretPos select 0)-1.9,(_turretPos select 1)+1.8,0];

    _longBagRight = createVehicle ["Land_BagFence_01_long_green_F",[0,0,0],[],0,"CAN_COLLIDE"];
    _longBagRight allowDamage false;
    _longBagRight setVectorDirAndUp [[-.897,.406,0],(vectorUp _longBagRight)];
    _longBagRight setPosATL [(_turretPos select 0)+1.9,(_turretPos select 1)+1.8,0];

    _turretSelected = createVehicle [(_turret call BIS_fnc_selectRandomWeighted),[0,0,0],[],0,"CAN_COLLIDE"];
    _turretSelected allowDamage false;
    _turretSelected setVectorDirAndUp [[0,-1,0],(vectorUp _turretSelected)];
    _turretSelected setPosATL [(_turretPos select 0),(_turretPos select 1)+2,0];

    _grpTurret = createGroup _side;
    _grpTurret setBehaviour "AWARE";
    _newAI_Turret = _grpTurret createUnit [_unit,_pos,[],1,"NONE"];
    [_faction,_newAI_Turret,false,false,_sfOverride] call (missionNamespace getVariable "FN_equipAI");
    [_newAI_Turret,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] call (missionNamespace getVariable "FN_setUnitSkills");
    _newAI_Turret moveInAny _turretSelected;

    _newAIBodyguard = _grpTurret createUnit [_unit,_pos,[],1,"NONE"];
    [_faction,_newAIBodyguard,false,true,_sfOverride] call (missionNamespace getVariable "FN_equipAI");
    [_newAIBodyguard,_aim,_aimSpeed,_spot,_courage,_aimShake,_command,_spotDist,_reload] call (missionNamespace getVariable "FN_setUnitSkills");
    _newAIBodyguard setVectorDirAndUp [[1,1,0],(vectorUp _newAIBodyguard)];
    _newAIBodyguard setPosATL [(_turretPos select 0)+3,(_turretPos select 1)+2.5,0];
    [_grpTurret,[_turretSelected],[_newAIBodyguard,_newAI_Turret]] call (missionNamespace getVariable "FN_enableDynamicSim");
};

FN_spawnGroups = {
    params ["_pos","_numUnits","_faction","_grp","_amountInGroup","_stopSpawnOverride"];

    if (isNil "_stopSpawnOverride") then { _stopSpawnOverride = false; };
    if (_amountInGroup <= 0) then { _amountInGroup = selectRandom [2,4,6]; };

    private _stopAISpawn = false;
	private _isSpecOpsGroup = [_sfGroup] call _fn_isSF;
    private _meleeChance = [_faction] call (missionNamespace getVariable "FN_meleeChance");
    private _spawnMeleeGroup = (!_isSpecOpsGroup) && {(random 1) < _meleeChance};

    private _buildings = nearestObjects [_pos,["House","Land_Building"],50];
    private _insidePoints = [];
    if (count _buildings != 0) then {
        private _building = selectRandom _buildings;
        _insidePoints = [_building] call BIS_fnc_buildingPositions;
        if (count _insidePoints == 0) then {
            _insidePoints = [[_pos,20,45,3] call (missionNamespace getVariable "FN_findSafePosition")];
        };
    } else {
        _insidePoints = [[_pos,20,45,3] call (missionNamespace getVariable "FN_findSafePosition")];
    };

    for "_i" from 1 to _amountInGroup do {
        private _spawnPos = selectRandom _insidePoints;
        private _nearbyAI = count (allUnits select {(_x isKindOf "CAManBase") && (side _x == side _grp) && (_x distance _spawnPos <= 300)});
        if (_nearbyAI >= _numUnits && !_stopSpawnOverride) exitWith { _stopAISpawn = true; };
        [_grp,_unit,_spawnPos,_faction,_isSpecOpsGroup,false,_spawnMeleeGroup] call (missionNamespace getVariable "FN_createAIUnit");
    };

    _stopAISpawn
};

FN_spawnGroupsBld = {
    params ["_pos","_numUnits","_faction","_grp","_amountInGroup","_stopSpawnOverride"];

    if (isNil "_stopSpawnOverride") then { _stopSpawnOverride = false; };
    if (_amountInGroup <= 0) then { _amountInGroup = selectRandom [2,4,6]; };

    private _stopAISpawn = false;
	private _isSpecOpsGroup = [_sfGroup] call _fn_isSF;
    private _meleeChance = [_faction] call (missionNamespace getVariable "FN_meleeChance");
    private _spawnMeleeGroup = (!_isSpecOpsGroup) && {(random 1) < _meleeChance};

    private _buildings = nearestObjects [_pos,["House","Land_Building"],50];
    if (count _buildings == 0) exitWith { _stopAISpawn };

    private _areaPairs = [];
    {
        private _bb = boundingBoxReal _x;
        private _dx = ((_bb select 1) select 0) - ((_bb select 0) select 0);
        private _dy = ((_bb select 1) select 1) - ((_bb select 0) select 1);
        private _area = abs (_dx * _dy);
        _areaPairs pushBack [_area,_x];
    } forEach _buildings;

    _areaPairs sort false;

    private _sortedBuildings = [];
    { _sortedBuildings pushBack (_x select 1); } forEach _areaPairs;

    private _building = _sortedBuildings select 0;
    private _insidePoints = [_building] call BIS_fnc_buildingPositions;

    if (count _insidePoints == 0) exitWith { _stopAISpawn };

    for "_i" from 1 to _amountInGroup do {
        private _spawnPos = selectRandom _insidePoints;
        _numAI = allUnits select { _x isKindOf "CAManBase" && side _grp == side _x && side _x != civilian && {_x distance (_spawnPos) <= 300} };
        if (count _numAI >= _numUnits && !_stopSpawnOverride) exitWith { _stopAISpawn = true; };

        _newAI = [_grp,_unit,_spawnPos,_faction,_isSpecOpsGroup,false,_spawnMeleeGroup] call (missionNamespace getVariable "FN_createAIUnit");

        _newAI disableAI "PATH";

        if ((_i mod 2) == 1) then {
            createVehicle ["Land_Camping_Light_F",(_newAI modelToWorld [1,0,0]),[],0,"NONE"];
        };
    };

    _stopAISpawn
};

//////////////////////////////////////////////////////////////////////////////
// FUNCTION DECLARATIONS ---- END
//////////////////////////////////////////////////////////////////////////////

if (_typeOfLocationArea == "Rnd" OR _typeOfLocationArea == "") then {
    _typeOfLocationArea = ["Building",.65,"Patrol",.65,"Camp",.45,"Trucks",.15] call BIS_fnc_selectRandomWeighted;
};

private _arrayReturn = missionNamespace getVariable "FN_arrayReturn";
_vehArray = ["defaultVeh"] call _arrayReturn;

// default
_buildingMain = "CamoNet_BLUFOR_open_F";
_turret = ["I_G_HMG_02_high_F",.80,"I_G_Mortar_01_F",.10,"I_E_Static_AT_F",.03];
_turretProb = .05;

private _unitSkillsArray = [_faction,_pos] call (missionNamespace getVariable "FN_getFactionSkills");

if (isNil "_side") then {
    _side = _unitSkillsArray select 0;
    _unit = _unitSkillsArray select 1;
};

if (_sfGroup == -1) then { _sfGroup = _unitSkillsArray select 10; };
if (!(_sfGroup isEqualType 0)) then { _sfGroup = -1; };

_fn_isSF = {
    params ["_g"];
    if (!(_g isEqualType 0)) exitWith { false };
    if (_g == 100) exitWith { true };
    if (_g <= 0) exitWith { false };
    (random _g) < 1
};

_aim = _unitSkillsArray select 2;
_aimSpeed = _unitSkillsArray select 3;
_spot = _unitSkillsArray select 4;
_courage = _unitSkillsArray select 5;
_aimShake = _unitSkillsArray select 6;
_command = _unitSkillsArray select 7;
_spotDist = _unitSkillsArray select 8;
_reload = _unitSkillsArray select 9;

private _weightedDefault = [4,4,4,5,5,5,6,7,8];

switch (_faction) do {
    case "Bandit": { if (_numUnits == 0) then { _numUnits = (selectRandom _weightedDefault); }; };
    case "BB": { if (_numUnits == 0) then { _numUnits = (selectRandom _weightedDefault); }; };
    case "DT": { if (_numUnits == 0) then { _numUnits = (selectRandom _weightedDefault); }; _buildingMain = "Land_cargo_addon02_V1_F"; };
    case "NH": { if (_numUnits == 0) then { _numUnits = (selectRandom _weightedDefault); }; };
    case "PF": { _weightedDefault = [6,6,6,7,7,7,8,9]; if (_numUnits == 0) then { _numUnits = (selectRandom _weightedDefault); }; _buildingMain = "Land_cargo_addon02_V1_F"; };
    case "RC": { if (_numUnits == 0) then { _numUnits = (selectRandom _weightedDefault); }; };
    case "TRB": { _turretProb = 0.25; _buildingMain = "CamoNet_OPFOR_open_F"; _vehArray = ["TRBVeh"] call _arrayReturn; if (_numUnits == 0) then { _numUnits = (selectRandom _weightedDefault); }; };
    case "US": { _weightedDefault = [6,6,6,7,7,7,8,9]; _turretProb = 0.55; _turret = ["I_E_GMG_01_high_F",0.55,"I_E_HMG_01_high_F",0.75,"I_E_Static_AT_F",0.35,"I_E_Mortar_01_F",0.85]; _vehArray = ["USVeh"] call _arrayReturn; if (_numUnits == 0) then { _numUnits = (selectRandom _weightedDefault); }; };
    case "SU": { if (_numUnits == 0) then { _numUnits = (selectRandom _weightedDefault); }; _buildingMain = "CamoNet_BLUFOR_F"; };
    case "RU": { _weightedDefault = [6,6,6,7,7,7,8,9]; _turretProb = 0.55; _turret = ["I_E_GMG_01_high_F",0.55,"I_E_HMG_01_high_F",0.75,"I_E_Static_AT_F",0.15,"I_E_Mortar_01_F",0.35]; _buildingMain = "CamoNet_wdl_open_F"; _vehArray = ["RUVeh"] call _arrayReturn; if (_numUnits == 0) then { _numUnits = (selectRandom _weightedDefault); }; };
    case "WO": { _turretProb = 0.25; _vehArray = ["WOVeh"] call _arrayReturn; if (_numUnits == 0) then { _numUnits = (selectRandom _weightedDefault); }; _buildingMain = "CamoNet_OPFOR_open_F"; };
    default { _turretProb = 0.35; _turret = ["I_E_GMG_01_high_F",0.25,"I_E_HMG_01_high_F",0.75,"I_E_Static_AT_F",0.15,"I_E_Mortar_01_F",0.35]; _buildingMain = "CamoNet_OPFOR_open_F"; _vehArray = [_faction + "Veh"] call _arrayReturn; if (_numUnits == 0) then { _numUnits = (selectRandom _weightedDefault); }; };
};

_allUnits = _pos nearEntities ["Man",750];
_players = _allUnits select {isPlayer _x};
_numPlayers = count _players;
if (_numPlayers != 1) then {
    _numUnits = _numUnits + _numPlayers;
};

if (_sfGroup == 100) then {
	_numUnits = ceil(_numUnits * 1.25);
};

private _stopAISpawn = false;

switch (_typeOfLocationArea) do {
    case "Camp": {
        [_faction,_buildingMain,_pos,_sfGroup] call (missionNamespace getVariable "FN_fortificationsMain");

        _grpCAMP = [_side,_faction] call FN_createGroup;
        [_pos,10,25,_grpCAMP] call FN_setWaypoints;
        _stopAISpawn = [_pos,_numUnits,_faction,_grpCAMP,4,true] call FN_spawnGroups;
        _grpCAMP enableGunLights "ForceOn";

        _grpBLD1 = [_side,_faction] call FN_createGroup;
        _stopAISpawn = [_pos,_numUnits,_faction,_grpBLD1,(ceil(random 3)),true] call FN_spawnGroupsBld;
        _grpBLD1 enableGunLights "ForceOn";

        _grp1 = [_side,_faction] call FN_createGroup;
        [_pos,30,60,_grp1] call FN_setWaypoints;
        if (!_stopAISpawn) then { _stopAISpawn = [_pos,_numUnits,_faction,_grp1,2] call FN_spawnGroups; };
        _grp1 enableGunLights "ForceOn";

        _grp1 = [_side,_faction] call FN_createGroup;
        [_pos,30,60,_grp1] call FN_setWaypoints;
        if (!_stopAISpawn) then { _stopAISpawn = [_pos,_numUnits,_faction,_grp1,_numUnits] call FN_spawnGroups; };
        _grp1 enableGunLights "ForceOn";

        if (_turretProb > random 1) then {
            [_turret] call FN_spawnFortifications;
        };
    };

    case "Patrol": {
        [_faction,_pos,_buildingMain,0, _sfGroup] call (missionNamespace getVariable "FN_fortificationsAux");

        _grpCAMP = [_side,_faction] call FN_createGroup;
        [_pos,10,25,_grpCAMP] call FN_setWaypoints;
        _posSpawn = [_pos,10,25,3,0,20,0] call BIS_fnc_findSafePos;
        [_posSpawn,_numUnits,_faction,_grpCAMP,(floor(random 2)+2),true] call FN_spawnGroups;
        _grpCAMP enableGunLights "ForceOn";

        _grp1 = [_side,_faction] call FN_createGroup;
        [_pos,100,200,_grp1] call FN_setWaypoints;
        _posSpawn = [_pos,30,60,3,0,20,0] call BIS_fnc_findSafePos;
        [_posSpawn,_numUnits,_faction,_grp1,2,true] call FN_spawnGroups;
        _grp1 enableGunLights "ForceOn";

        _grp2 = [_side,_faction] call FN_createGroup;
        [_pos,100,200,_grp2] call FN_setWaypoints;
        _posSpawn = [_pos,100,200,3,0,20,0] call BIS_fnc_findSafePos;
        _stopAISpawn = [_posSpawn,_numUnits,_faction,_grp2,2,true] call FN_spawnGroups;
        _grp2 enableGunLights "ForceOn";

        _grp3 = [_side,_faction] call FN_createGroup;
        [_pos,100,200,_grp3] call FN_setWaypoints;
        _posSpawn = [_pos,100,200,3,0,20,0] call BIS_fnc_findSafePos;
        [_posSpawn,_numUnits,_faction,_grp3,2,true] call FN_spawnGroups;
        _grp3 enableGunLights "ForceOn";

        private _i = 0;
        while {!_stopAISpawn} do {
            private _grp = [_side,_faction] call FN_createGroup;
            [_pos,250,500,_grp] call FN_setWaypoints;
            private _posSpawn = [_pos,150,200,3,0,20,0] call BIS_fnc_findSafePos;
            _stopAISpawn = [_posSpawn,_numUnits,_faction,_grp,(floor(random 2)+2)] call FN_spawnGroups;
            _grp enableGunLights "ForceOn";
        };
    };

    case "Building": {
        _grpBLD1 = [_side,_faction] call FN_createGroup;
        _stopAISpawn = [_pos,_numUnits,_faction,_grpBLD1,(ceil(random 3)),true] call FN_spawnGroupsBld;
        _grpBLD1 enableGunLights "ForceOn";

        _grpBLD2 = [_side,_faction] call FN_createGroup;
        _stopAISpawn = [_pos,_numUnits,_faction,_grpBLD2,(ceil(random 3)),true] call FN_spawnGroupsBld;
        _grpBLD2 enableGunLights "ForceOn";

        _grp1 = [_side,_faction] call FN_createGroup;
        [_pos,20,50,_grp1] call FN_setWaypoints;
        if (!_stopAISpawn) then { _stopAISpawn = [_pos,_numUnits,_faction,_grp1,2,true] call FN_spawnGroups; };
        _grp1 enableGunLights "ForceOn";

        _grp2 = [_side,_faction] call FN_createGroup;
        [_pos,20,50,_grp2] call FN_setWaypoints;
        if (!_stopAISpawn) then { _stopAISpawn = [_pos,_numUnits,_faction,_grp2,_numUnits] call FN_spawnGroups; };
        _grp2 enableGunLights "ForceOn";
    };

    case "Trucks": {
        _index = 0;

        _grpCAMP = [_side,_faction] call FN_createGroup;
        [_pos,10,25,_grpCAMP] call FN_setWaypoints;
        if (!_stopAISpawn) then { _stopAISpawn = [_pos,_numUnits,_faction,_grpCAMP,4,true] call FN_spawnGroups; };
        _grpCAMP enableGunLights "ForceOn";

        _grp1 = [_side,_faction] call FN_createGroup;
        [_pos,100,350,_grp1] call FN_setWaypoints;
        if (!_stopAISpawn) then { _stopAISpawn = [_pos,_numUnits,_faction,_grp1,4,true] call FN_spawnGroups; };
        _grp1 enableGunLights "ForceOn";

        _grp2 = [_side,_faction] call FN_createGroup;
        [_pos,100,350,_grp2] call FN_setWaypoints;
        if (!_stopAISpawn) then { _stopAISpawn = [_pos,_numUnits,_faction,_grp2,_numUnits] call FN_spawnGroups; };
        _grp2 enableGunLights "ForceOn";

        while { _index < (round(random 2)+2) } do {
            _index = _index + 1;
            [_vehArray,(round(random 3)+3)] call FN_carPatrol;
        };
    };

    case "Squad": {
        _grp1 = [_side,_faction] call FN_createGroup;
        [_pos,_numUnits,_faction,_grp1,_numUnits] call FN_spawnGroups;
        _grp1 enableGunLights "ForceOn";
    };
};

[_pos,_faction,_side] call FN_lootSpawnByFaction;
