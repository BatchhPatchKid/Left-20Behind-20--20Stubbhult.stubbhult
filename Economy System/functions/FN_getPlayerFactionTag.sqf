params ["_unit"];

private _factionVars = [
    "US_Relation",
    "PF_Relation",
    "RU_Relation",
    "SU_Relation",
    "WO_Relation",
    "RC_Relation",
    "BB_Relation",
    "NH_Relation",
    "DT_Relation",
    "ROA_Relation",
    "PMC_Relation",
    "TRB_Relation",
    "Bandit_Relation",
    "ALF_Relation"
];

private _faction = "";
{
    if (_unit getVariable [_x, false]) exitWith {
        _faction = _x;
    };
} forEach _factionVars;

if (_faction isEqualTo "") exitWith {""};

( _faction splitString "_" ) select 0