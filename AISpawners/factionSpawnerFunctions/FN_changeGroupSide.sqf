/*
File: AISpawners/factionSpawnerFunctions/FN_changeGroupSide.sqf
Purpose: Controls AI spawning, behavior setup, and faction encounter logic.
Style: Uses 4-space indentation and descriptive snake_case variable names.
*/

params ["_grpToChange", "_sideToChangeTo"];

private _newGrp = createGroup _sideToChangeTo;

{
    [_x] joinSilent _newGrp;
} forEach units _grpToChange;

[_newGrp] spawn {
    params ["_newGrp"];
    {
        sleep 0.5;
        _x setCaptive false;
        _x addRating -10000;
    } forEach units _newGrp;
};

_newGrp