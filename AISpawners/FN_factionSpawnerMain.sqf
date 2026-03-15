/*
File: AISpawners/FN_factionSpawnerMain.sqf
Purpose: Controls AI spawning, behavior setup, and faction encounter logic.
Style: Uses 4-space indentation and descriptive snake_case variable names.
*/

/*
    FN_factionSpawnerMain.sqf
    Master script handling AI faction spawns when triggers activate.
    ----------------------------------------------------------------------------
    Flow:
      1. Gather parameters and defaults
      2. Helper lambdas
      3. Early exit if players are too close or rock already exists
         - If rock exists and is a mutant zone, apply effects to players in range
      4. Create rock marker and capture reference
      5. Determine zombie "Rvg" mode
      6. Spawn ambient vehicles and renegade groups
      7. Resolve faction type and identity early
      8. Spawn the resolved faction through its dedicated spawner
*/

// -----------------------------------------------------------------------------
// 1. PARAMETERS & INITIALIZATION
// -----------------------------------------------------------------------------
params ["_faction", "_numUnits", "_trigger", "_typeOfLocationArea", "_sfGroup"];

if (!isServer) exitWith {};

// Trigger position and radius
private _pos = getPos _trigger;
private _triggerRadius = (triggerArea _trigger) select 0;


// Entire spawner runs only on the server. Clients exit immediately to avoid
// unnecessary calculations. Mutant visual effects are executed on clients via
// remote calls within FN_factionSelector.


// Default location-type tag if none passed
if (isNil "_typeOfLocationArea") then {
    _typeOfLocationArea = "Rnd";
};

// Default sfGroup if none passed
if (isNil "_sfGroup") then {
    _sfGroup = -1;
};

// -----------------------------------------------------------------------------
// 2. HELPER LAMBDAS
// -----------------------------------------------------------------------------

// Check if any player is within (radius - 100) meters of the trigger
private _playersTooClose = {
    params ["_trg", "_rad"];
    private _tooClose = false;
    {
        if ((getPos _x) distance (getPos _trg) < (_rad - 100)) exitWith {
            _tooClose = true;
        };
    } forEach allPlayers;
    _tooClose
};

// Check whether a rock marker already exists within 10m of the trigger
private _triggerUsed = {
    params ["_trg"];
    (count nearestObjects [_trg, ["Land_Cliff_stone_small_F"], 10] != 0)
};

// Create a rock at the trigger position and return the object reference
private _spawnMarker = {
    params ["_trg"];
    "Land_Cliff_stone_small_F" createVehicle (getPos _trg);
};

// Occasionally spawn small renegade groups near the trigger
private _spawnRenegades = {
    params ["_p", "_r", "_side"];
    for "_i" from 1 to (floor (random 3)) do {
        private _renegadePos = [_p, (_r / 4), (_r / 3), 3] call (missionNamespace getVariable "FN_findSafePosition");
        [_renegadePos, 50, _r, _side] call (missionNamespace getVariable "FN_renegadeSpawner");
    };
};

// Spawn a standard wandering zombie group and then call selector
private _spawnZombieGroup = {
    params ["_num", "_rad", "_pos", "_rvg", "_area", ["_sfGroup", -1], ["_spawnScale", 1]];
    private _zombiePos = [_pos, 20, 45, 3] call (missionNamespace getVariable "FN_findSafePosition");

    [_pos, 10, "zombie", "Zombie", _area] call (missionNamespace getVariable "FN_mapMarkerLocationMain");

    if (random 1 > 0.75) then {
        [_pos, ""] call (missionNamespace getVariable "FN_spawnHuntingFaction");
    } else {
        if (random 1 > 0.75) then {
            [_pos, ""] call (missionNamespace getVariable "FN_spawnWanderingFaction");
        };
    };

    ["Zombie", _num, _rad, _zombiePos, _rvg, _area, _sfGroup, _spawnScale] call (missionNamespace getVariable "FN_factionSelector");
};

// Spawn a survivor group; uses _fac if provided, otherwise picks randomly
private _spawnSurvivorGroup = {
    params ["_num", "_rad", "_pos", "_rvg", "_area", ["_fac", ""], ["_sfGroup", -1], ["_spawnScale", 1]];

    private _survivorFactions = ["_survivorFactions"] call (missionNamespace getVariable "FN_arrayReturn");

    private _factionSelected = if (_fac != "") then { _fac } else {
        [_survivorFactions, ""] call (missionNamespace getVariable "FN_selectFaction")
    };

    [_pos, 10, "survivor", _factionSelected, _area] call (missionNamespace getVariable "FN_mapMarkerLocationMain");

    if (random 1 > 0.75) then {
        [_pos, _factionSelected] call (missionNamespace getVariable "FN_spawnHuntingFaction");
    } else {
        if (random 1 > 0.75) then {
            [_pos, _factionSelected] call (missionNamespace getVariable "FN_spawnWanderingFaction");
        };
    };

    [_factionSelected, _num, _rad, _pos, _rvg, _area, _sfGroup, _spawnScale] call (missionNamespace getVariable "FN_factionSelector");
};

// Spawn a mutant group; uses _fac if provided, otherwise picks randomly.
// Applies mutant effects to all players already in range on first spawn,
// and stores the faction on the rock for future re-entry detections.
private _spawnMutantGroup = {
    params ["_num", "_rad", "_pos", "_rvg", "_area", ["_fac", ""], ["_sfGroup", -1], ["_rock", objNull], ["_spawnScale", 1]];

    private _mutantWeights = ["_mutantWeights"] call (missionNamespace getVariable "FN_arrayReturn");

    private _factionSelected = if (_fac != "") then { _fac } else { selectRandomWeighted _mutantWeights };

    private _mutantPos = [_pos, 25, 75, 3] call (missionNamespace getVariable "FN_findSafePosition");

    [_pos, 10, "mutant", _factionSelected, _area] call (missionNamespace getVariable "FN_mapMarkerLocationMain");

    // Store faction on the rock for re-entry detection — use passed reference
    // to avoid a fragile nearestObjects search after terrain placement drift
    if (!isNull _rock) then {
        _rock setVariable ["mutantFaction", _factionSelected, true];
    };

    // Apply effects to any players already inside the zone at first spawn
    private _inRange = allPlayers select {
        (getPos _x) distance _pos < (_rad + 100)
    };
    { [_factionSelected] remoteExec ["FN_mutantEffects", owner _x]; } forEach _inRange;

    [_factionSelected, _num, _rad, _mutantPos, _rvg, _area, _sfGroup, _spawnScale] call (missionNamespace getVariable "FN_factionSelector");
};

// -----------------------------------------------------------------------------
// 3. EARLY EXIT CHECKS
// -----------------------------------------------------------------------------

// Exit if any player is too close
if ([_trigger, _triggerRadius] call _playersTooClose) exitWith {};

// If rock already exists, check if this is a mutant zone and apply effects
if ([_trigger] call _triggerUsed) exitWith {
    private _rock = (nearestObjects [_trigger, ["Land_Cliff_stone_small_F"], 10]) select 0;
    private _mutantFaction = _rock getVariable ["mutantFaction", ""];
    if (_mutantFaction != "") then {
        private _inRange = allPlayers select {
            (getPos _x) distance (getPos _trigger) < (_triggerRadius + 100)
        };
        { [_mutantFaction] remoteExec ["FN_mutantEffects", owner _x]; } forEach _inRange;
    };
};

// -----------------------------------------------------------------------------
// 4. CREATE ROCK MARKER AND CAPTURE REFERENCE
// -----------------------------------------------------------------------------

// Capture the rock object directly to avoid a secondary nearestObjects search
private _rock = [_trigger] call _spawnMarker;

// -----------------------------------------------------------------------------
// 5. DETERMINE ZOMBIE "RVG" MODE
// -----------------------------------------------------------------------------

// false overnight or 15% random; true daytime majority
private _zombieRvg = if (daytime < 4 || daytime > 20 || random 1 > 0.85) then {
    false
} else {
    true
};

// -----------------------------------------------------------------------------
// 6. AMBIENT
// -----------------------------------------------------------------------------

[_pos, _triggerRadius] call (missionNamespace getVariable "FN_ambientVeh");

// -----------------------------------------------------------------------------
// 7. EARLY FACTION RESOLUTION
// -----------------------------------------------------------------------------

private _factionType = "";
private _resolvedFaction = "";
private _spawnScale = 1;

if (_faction == "Rnd") then {
    private _dice = random 1;
    _factionType = switch (true) do {
        case (_dice >= 0.05 && _dice < 0.30):  { "survivor" };
        case (_dice >= 0.30 && _dice <= 0.95): { "zombie"   };
        default                                { "mutant"   };
    };
} else {
    private _mutantArray = ["mutantArray"] call (missionNamespace getVariable "FN_arrayReturn");
    _factionType = switch (true) do {
        case (_faction in _mutantArray): { "mutant"   };
        case (_faction == "Zombie"):     { "zombie"   };
        default                          { "survivor" };
    };
    _resolvedFaction = _faction;
};

// Random locations that force "spec-ops" behavior should increase hostile
// non-human density as compensation when the random faction is not human.
if (_faction == "Rnd" && {_sfGroup == 100}) then {
    _spawnScale = switch (_factionType) do {
        case "zombie": { 1.35 };
        case "mutant": { 1.20 };
        default { 1 };
    };
};

// -----------------------------------------------------------------------------
// 8. MAIN FACTION SPAWN ROUTINE
// -----------------------------------------------------------------------------

switch (_factionType) do {
    case "zombie": {
        [_numUnits, _triggerRadius, _pos, _zombieRvg, _typeOfLocationArea, _sfGroup, _spawnScale] call _spawnZombieGroup;
    };
    case "survivor": {
        [_numUnits, _triggerRadius, _pos, _zombieRvg, _typeOfLocationArea, _resolvedFaction, _sfGroup, _spawnScale] call _spawnSurvivorGroup;
    };
    case "mutant": {
        [_numUnits, _triggerRadius, _pos, _zombieRvg, _typeOfLocationArea, _resolvedFaction, _sfGroup, _rock, _spawnScale] call _spawnMutantGroup;
    };
};