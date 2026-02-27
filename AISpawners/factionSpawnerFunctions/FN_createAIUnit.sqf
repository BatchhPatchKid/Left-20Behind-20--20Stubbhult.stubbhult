/*
File: AISpawners/factionSpawnerFunctions/FN_createAIUnit.sqf
Purpose: Controls AI spawning, behavior setup, and faction encounter logic.
Style: Uses 4-space indentation and descriptive snake_case variable names.
*/

params ["_group", "_unitType", "_pos", "_faction", "_sfOverride", "_creepGroup"];

// Create the unit
private _unit = _group createUnit [_unitType, _pos, [], 1, "NONE"];

// Set unit skills
private _unitSkillsArray = [_faction, _pos] call FN_getFactionSkills;
[_unit, _unitSkillsArray select 2, _unitSkillsArray select 3, _unitSkillsArray select 4, _unitSkillsArray select 5, _unitSkillsArray select 6, _unitSkillsArray select 7, _unitSkillsArray select 8, _unitSkillsArray select 9] call FN_setUnitSkills;

// Set unit position (crouching if required)
if (_creepGroup) then {
    _unit setUnitPos "MIDDLE";
};

// Optional magic-user initialization by faction.
// For now, a unit has a 50% chance to become a magic user.
private _factionToDiscipline = createHashMapFromArray [
    ["DT", "greek"],
    ["PF", "pig"],
    ["RC", "wanderer"]
];

private _discipline = _factionToDiscipline getOrDefault [_faction, ""];
private _magicChance = missionNamespace getVariable ["LB_magicUserChance", 0.5];

if (_discipline != "" && {(random 1) < _magicChance}) then {
	[_faction, _unit] call (missionNamespace getVariable "FN_equipAIMagicUser");
    [_unit, _discipline] spawn (missionNamespace getVariable "FN_magicAIInit");
} else {
	// not magic unit
	[_faction, _unit, false, false, _sfOverride] call (missionNamespace getVariable "FN_equipAI");
};

// Return the created unit
_unit