/*
File: AISpawners/factionSpawnerFunctions/FN_createAIUnit.sqf
Purpose: Controls AI spawning, behavior setup, and faction encounter logic.
Style: Uses 4-space indentation and descriptive snake_case variable names.
*/

params ["_group", "_unitType", "_pos", "_faction", "_sfOverride", "_creepGroup"];

private _factionToDiscipline = createHashMapFromArray [
    ["DT", "greek"],
    ["PF", "pig"],
    ["RC", "wanderer"]
];

private _discipline = _factionToDiscipline getOrDefault [_faction, ""];
private _magicChance = missionNamespace getVariable ["LB_magicUserChance", 0.5];
private _meleeChance = [_faction] call FN_meleeChance;

private _isMagicUser = _discipline != "" && {(random 1) < _magicChance};
private _isSpecOps = false;
private _isMelee = false;

if (!_isMagicUser) then {
    if (_sfOverride isEqualType true) then {
        _isSpecOps = _sfOverride;
    } else {
        if (_sfOverride isEqualType 0) then {
            if (_sfOverride == 100) then {
                _isSpecOps = true;
            } else {
                if (_sfOverride > 0) then {
                    _isSpecOps = (random _sfOverride) < 1;
                };
            };
        };
    };

    if (!_isSpecOps && {(random 1) < _meleeChance}) then {
        _isMelee = true;
    };
};

private _spawnUnitType = if (_isMelee) then { "O_soldier_Melee_RUSH" } else { _unitType };
private _unit = _group createUnit [_spawnUnitType, _pos, [], 1, "NONE"];

private _unitSkillsArray = [_faction, _pos] call FN_getFactionSkills;
[_unit, _unitSkillsArray select 2, _unitSkillsArray select 3, _unitSkillsArray select 4, _unitSkillsArray select 5, _unitSkillsArray select 6, _unitSkillsArray select 7, _unitSkillsArray select 8, _unitSkillsArray select 9] call FN_setUnitSkills;

if (_creepGroup) then {
    _unit setUnitPos "MIDDLE";
};

if (_isMagicUser) then {
    [_faction, _unit] call (missionNamespace getVariable "FN_equipAIMagicUser");
    [_unit, _discipline] spawn (missionNamespace getVariable "FN_magicAIInit");
} else {
    [_faction, _unit, _isMelee, false, _isSpecOps] call (missionNamespace getVariable "FN_equipAI");
};

_unit