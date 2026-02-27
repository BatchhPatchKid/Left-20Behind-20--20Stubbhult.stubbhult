params ["_unit", ["_discipline", ""]];

if (!isServer) exitWith {};
if (isNull _unit || {!alive _unit}) exitWith {};
if (isPlayer _unit) exitWith {};
if (_unit getVariable ["LB_magicAIInitialized", false]) exitWith {};

if (_discipline isEqualTo "") then {
    _discipline = toLower (_unit getVariable ["LB_magicDiscipline", ""]);
};

if !(_discipline in ["pig", "greek", "wanderer"]) then {
    _discipline = selectRandom ["pig", "greek", "wanderer"];
};

_unit setVariable ["LB_magicAIInitialized", true, true];
_unit setVariable ["LB_magicDiscipline", _discipline, true];

_unit setVariable ["ritualStatusPig", if (_discipline isEqualTo "pig") then {60} else {0}, false];
_unit setVariable ["ritualStatusZeus", if (_discipline isEqualTo "greek") then {60} else {0}, false];
_unit setVariable ["ritualStatusWanderer", if (_discipline isEqualTo "wanderer") then {60} else {0}, false];

_unit setVariable ["LB_magicGlobalCooldownUntil", 0, false];
_unit setVariable ["LB_magicSpellCooldowns", createHashMap, false];

[_unit] spawn (missionNamespace getVariable "FN_magicAIBrain");