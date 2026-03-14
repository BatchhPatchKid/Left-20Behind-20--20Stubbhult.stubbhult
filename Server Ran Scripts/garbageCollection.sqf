// This script is responsible for garbage collection, cleaning up dead units, vehicles, and world objects
// It runs periodically to maintain server performance and prevent lag due to excessive objects in the world
// It also allows for manual execution via a Zeus action if needed
// The script checks for headless clients and ensures garbage collection is only performed when players are present
// It uses batched checks with small yields to avoid long scheduler stalls

private _fn_isNearAny = {
    params ["_object", "_objects", "_distanceSqrThreshold"];
    if (_objects isEqualTo []) exitWith { false };

    private _near = false;
    {
        if (!isNull _x && { _object distanceSqr _x <= _distanceSqrThreshold }) exitWith { _near = true; };
    } forEach _objects;
    _near
};

private _fn_isProtected = {
    params ["_object", "_players", "_flags", "_missionStones", "_distPlayerSqr", "_distFlagSqr", "_distStoneSqr"];

    if (isNull _object) exitWith { true };
    if ([_object, _missionStones, _distStoneSqr] call _fn_isNearAny) exitWith { true };
    if ([_object, _flags, _distFlagSqr] call _fn_isNearAny) exitWith { true };
    if ([_object, _players, _distPlayerSqr] call _fn_isNearAny) exitWith { true };

    false
};


private _FN_garbageCollector = {
    params ["_flags", "_missionStones", "_gcClasses"];

    private _startedAt = diag_tickTime;

    private _headlessClients = entities "HeadlessClient_F";
    private _players = allPlayers - _headlessClients;

    if (_players isEqualTo []) exitWith { [0, 0, diag_tickTime - _startedAt] };

    private _distStone = 500;
    private _distFlag = 150;
    private _distPlayer = 3000;

    private _distStoneSqr = _distStone * _distStone;
    private _distFlagSqr = _distFlag * _distFlag;
    private _distPlayerSqr = _distPlayer * _distPlayer;

    private _yieldEvery = 75;

    private _checked = 0;
    private _deleted = 0;

    // Units (limited to active radius around players)
    private _units = allUnits select { !isNull _x && { alive _x } && { !(_x in _players) } };
    private _airVehicles = vehicles select { _x isKindOf "Air" };

    {
        if (isNull _x) then { continue; };
        if (_x in _players) then { continue; };
        if (!alive _x) then { continue; };

        _checked = _checked + 1;
        if ([_x, _players, _flags, _missionStones, _distPlayerSqr, _distFlagSqr, _distStoneSqr] call _fn_isProtected) then { continue; };
        private _unit = _x;
        if (_airVehicles findIf { !isNull _x && { _x distanceSqr _unit <= 25 } } != -1) then { continue; };

        deleteVehicle _x;
        _deleted = _deleted + 1;

        if ((_checked % _yieldEvery) isEqualTo 0) then { sleep 0.001; };
    } forEach _units;

    // Dead bodies
    private _dead = allDead;

    {
        if (isNull _x) then { continue; };
        if (alive _x) then { continue; };

        _checked = _checked + 1;
        if ([_x, _players, _flags, _missionStones, _distPlayerSqr, _distFlagSqr, _distStoneSqr] call _fn_isProtected) then { continue; };

        deleteVehicle _x;
        _deleted = _deleted + 1;

        if ((_checked % _yieldEvery) isEqualTo 0) then { sleep 0.001; };
    } forEach _dead;

    // Class-based mission objects
    private _gcObjects = [];
    {
        _gcObjects append allMissionObjects _x;
    } forEach _gcClasses;

    {
        if (isNull _x) then { continue; };

        _checked = _checked + 1;
        if ([_x, _players, _flags, _missionStones, _distPlayerSqr, _distFlagSqr, _distStoneSqr] call _fn_isProtected) then { continue; };

        deleteVehicle _x;
        _deleted = _deleted + 1;

        if ((_checked % _yieldEvery) isEqualTo 0) then { sleep 0.001; };
    } forEach _gcObjects;

    // Vehicles
    private _vehiclesNear = vehicles select { _x isKindOf "LandVehicle" || { _x isKindOf "Ship" } };

    {
        if (isNull _x) then { continue; };

        _checked = _checked + 1;
        if ([_x, _players, _flags, _missionStones, _distPlayerSqr, _distFlagSqr, _distStoneSqr] call _fn_isProtected) then { continue; };

        deleteVehicle _x;
        _deleted = _deleted + 1;

        if ((_checked % _yieldEvery) isEqualTo 0) then { sleep 0.001; };
    } forEach _vehiclesNear;

    [_checked, _deleted, diag_tickTime - _startedAt]
};

params ["_zeusAction"];
if (_zeusAction) then {
    private _gcClasses = ["_gcClasses"] call (missionNamespace getVariable "FN_arrayReturn");
    private _flags = allMissionObjects "Flag_Red_F";
    private _missionStones = allMissionObjects "Land_BluntStone_01";
    [_flags, _missionStones, _gcClasses] call _FN_garbageCollector;

    hintSilent "Garbage collection executed.";
} else {
    private _flags = [];
    private _missionStones = [];
    private _gcClasses = ["_gcClasses"] call (missionNamespace getVariable "FN_arrayReturn");
    private _cacheRefreshAt = -1;
    private _cacheRefreshInterval = 600;

    while { true } do {
        sleep 300;

        // waiting until there are players connected and alive
        waitUntil { count (allPlayers select { alive _x }) > 0 };

        private _now = time;
        if (_cacheRefreshAt < 0 || { (_now - _cacheRefreshAt) > _cacheRefreshInterval }) then {
            _flags = allMissionObjects "Flag_Red_F";
            _missionStones = allMissionObjects "Land_BluntStone_01";
            _cacheRefreshAt = _now;
        };

        private _result = [_flags, _missionStones, _gcClasses] call _FN_garbageCollector;

        diag_log format [
            "[LB][GC] checked=%1 deleted=%2 duration=%3s players=%4",
            _result select 0,
            _result select 1,
            (_result select 2),
            count allPlayers
        ];

        [] call (missionNamespace getVariable "LB_FacReg_Prune"); // removes any AI that are dead from the chatter system array
    };
};