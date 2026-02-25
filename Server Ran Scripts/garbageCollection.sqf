// This script is responsible for garbage collection, cleaning up dead units, vehicles, and world objects
// It runs periodically to maintain server performance and prevent lag due to excessive objects in the world
// It also allows for manual execution via a Zeus action if needed
// The script checks for headless clients and ensures garbage collection is only performed when players are present
// It uses batched, capped passes to avoid long scheduler stalls and crash-prone spikes

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
    params ["_phase", "_flags", "_missionStones", "_gcClasses"];

    private _startedAt = diag_tickTime;

    private _headlessClients = entities "HeadlessClient_F";
    private _players = allPlayers - _headlessClients;

    if (_players isEqualTo []) exitWith { [_phase, 0, 0, diag_tickTime - _startedAt] };

    private _distStone = 500;
    private _distFlag = 150;
    private _distPlayer = 3000;

    private _distStoneSqr = _distStone * _distStone;
    private _distFlagSqr = _distFlag * _distFlag;
    private _distPlayerSqr = _distPlayer * _distPlayer;

    private _maxDeletesPerCycle = 150;
    private _yieldEvery = 75;

    private _checked = 0;
    private _deleted = 0;

    switch (_phase) do {
        // Phase 0: units (limited to active radius around players)
        case 0: {
            private _units = allUnits select { !isNull _x && { alive _x } && { !(_x in _players) } };
            private _airVehicles = vehicles select { _x isKindOf "Air" };

            {
                if (_deleted >= _maxDeletesPerCycle) exitWith {};
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
        };

        // Phase 1: dead bodies
        case 1: {
            private _dead = allDead;

            {
                if (_deleted >= _maxDeletesPerCycle) exitWith {};
                if (isNull _x) then { continue; };
                if (alive _x) then { continue; };

                _checked = _checked + 1;
                if ([_x, _players, _flags, _missionStones, _distPlayerSqr, _distFlagSqr, _distStoneSqr] call _fn_isProtected) then { continue; };

                deleteVehicle _x;
                _deleted = _deleted + 1;

                if ((_checked % _yieldEvery) isEqualTo 0) then { sleep 0.001; };
            } forEach _dead;
        };

        // Phase 2: class-based mission objects
        case 2: {
            private _gcObjects = [];
            {
                _gcObjects append allMissionObjects _x;
            } forEach _gcClasses;

            {
                if (_deleted >= _maxDeletesPerCycle) exitWith {};
                if (isNull _x) then { continue; };

                _checked = _checked + 1;
                if ([_x, _players, _flags, _missionStones, _distPlayerSqr, _distFlagSqr, _distStoneSqr] call _fn_isProtected) then { continue; };

                deleteVehicle _x;
                _deleted = _deleted + 1;

                if ((_checked % _yieldEvery) isEqualTo 0) then { sleep 0.001; };
            } forEach _gcObjects;
        };

        // Phase 3: vehicles
        default {
            private _vehiclesNear = vehicles select { _x isKindOf "LandVehicle" || { _x isKindOf "Ship" } };

            {
                if (_deleted >= _maxDeletesPerCycle) exitWith {};
                if (isNull _x) then { continue; };

                _checked = _checked + 1;
                if ([_x, _players, _flags, _missionStones, _distPlayerSqr, _distFlagSqr, _distStoneSqr] call _fn_isProtected) then { continue; };

                deleteVehicle _x;
                _deleted = _deleted + 1;

                if ((_checked % _yieldEvery) isEqualTo 0) then { sleep 0.001; };
            } forEach _vehiclesNear;
        };
    };

    private _nextPhase = (_phase + 1) mod 4;
    [_nextPhase, _checked, _deleted, diag_tickTime - _startedAt]
};

params ["_zeusAction"];
if (_zeusAction) then {
    private _gcClasses = ["_gcClasses"] call (missionNamespace getVariable "FN_arrayReturn");
    private _flags = allMissionObjects "Flag_Red_F";
    private _missionStones = allMissionObjects "Land_BluntStone_01";
    private _phase = 0;

    for "_i" from 1 to 4 do {
        private _result = [_phase, _flags, _missionStones, _gcClasses] call _FN_garbageCollector;
        _phase = _result select 0;
    };

    hintSilent "Garbage collection executed.";
} else {
    private _phase = 0;
    private _flags = [];
    private _missionStones = [];
    private _gcClasses = ["_gcClasses"] call (missionNamespace getVariable "FN_arrayReturn");
    private _cacheRefreshAt = -1;
    private _cacheRefreshInterval = 600;

    while { true } do {
        sleep 360;

        // waiting until there are players connected and alive
        waitUntil { count (allPlayers select { alive _x }) > 0 };

        private _now = time;
        if (_cacheRefreshAt < 0 || { (_now - _cacheRefreshAt) > _cacheRefreshInterval }) then {
            _flags = allMissionObjects "Flag_Red_F";
            _missionStones = allMissionObjects "Land_BluntStone_01";
            _cacheRefreshAt = _now;
        };

        private _result = [_phase, _flags, _missionStones, _gcClasses] call _FN_garbageCollector;
        _phase = _result select 0;

        diag_log format [
            "[LB][GC] phase=%1 checked=%2 deleted=%3 duration=%4s players=%5",
            (_phase + 3) mod 4,
            _result select 1,
            _result select 2,
            (_result select 3),
            count allPlayers
        ];

        [] call (missionNamespace getVariable "LB_FacReg_Prune"); // removes any AI that are dead from the chatter system array
    };
};