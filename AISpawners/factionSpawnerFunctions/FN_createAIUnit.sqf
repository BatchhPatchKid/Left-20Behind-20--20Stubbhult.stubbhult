/*
File: AISpawners/factionSpawnerFunctions/FN_createAIUnit.sqf
Purpose: Controls AI spawning, behavior setup, and faction encounter logic.
Style: Uses 4-space indentation and descriptive snake_case variable names.
*/

params ["_group", "_unitType", "_pos", "_faction", "_sfOverride", "_creepGroup"];

// Create the unit
private _unit = _group createUnit [_unitType, _pos, [], 1, "NONE"];

// Equip the unit
[_faction, _unit, false, false, _sfOverride] call (missionNamespace getVariable "FN_equipAI");

// Set unit skills
private _unitSkillsArray = [_faction, _pos] call FN_getFactionSkills;
[_unit, _unitSkillsArray select 2, _unitSkillsArray select 3, _unitSkillsArray select 4, _unitSkillsArray select 5, _unitSkillsArray select 6, _unitSkillsArray select 7, _unitSkillsArray select 8, _unitSkillsArray select 9] call FN_setUnitSkills;

// Set unit position (crouching if required)
if (_creepGroup) then {
    _unit setUnitPos "MIDDLE";
};

// Optional magic-user initialization by class mapping.
// Configure from mission init with:
//   LB_magicUserClasses = ["Class_A", "Class_B"];
//   LB_magicUserClassDiscipline = createHashMapFromArray [["Class_A","greek"],["Class_B","pig"]];
private _magicClasses = missionNamespace getVariable ["LB_magicUserClasses", []];
if (_unitType in _magicClasses) then {
    private _disciplineMap = missionNamespace getVariable ["LB_magicUserClassDiscipline", createHashMap];
    private _discipline = toLower (_disciplineMap getOrDefault [_unitType, ""]);
    [_unit, _discipline] spawn (missionNamespace getVariable "FN_magicAIInit");
};

// Return the created unit
_unit