params ["_crate", "_player"];

if (isNull _crate) exitWith {false};
if (isNull _player) exitWith {false};
if (!isPlayer _player) exitWith {false};

private _faction = _crate getVariable ["LB_TraderFaction", ""];
if (_faction == "") exitWith {false};

private _relationByFaction = createHashMapFromArray [
    ["BB", "BB_Relation"],
    ["SU", "SU_Relation"],
    ["PF", "PF_Relation"],
    ["ALF", "ALF_Relation"],
    ["WO", "WO_Relation"],
    ["RU", "RU_Relation"],
    ["US", "US_Relation"],
    ["NH", "NH_Relation"],
    ["TRB", "TRB_Relation"],
    ["RC", "RC_Relation"],
    ["DT", "DT_Relation"],
    ["ROA", "ROA_Relation"],
    ["PMC", "PMC_Relation"],
    ["Bandit", "Bandit_Relation"],
    ["Renegade", "Renegade_Relation"]
];

private _relationVar = _relationByFaction getOrDefault [_faction, ""];
if (_relationVar == "") exitWith {false};

private _forced = _player getVariable ["LB_PermanentFriendlyFactions", []];
if !(_forced isEqualType []) exitWith {false};

(_relationVar in _forced) && {_player getVariable [_relationVar, false]}