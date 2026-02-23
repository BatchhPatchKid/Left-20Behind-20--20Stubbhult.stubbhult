/*
File: AISpawners/FN_enableDynamicSim.sqf
Purpose: Controls AI spawning, behavior setup, and faction encounter logic.
Style: Uses 4-space indentation and descriptive snake_case variable names.
*/

params ["_grp", "_vehicles", "_extraUnits"];
{
    _x enableDynamicSimulation true;
} forEach (_extraUnits + units _grp);
{ _x enableDynamicSimulation true; } forEach _vehicles;
_grp enableDynamicSimulation true;