params ["_traderFaction", "_playerFaction"];

if (_traderFaction isEqualTo "" || _playerFaction isEqualTo "") exitWith {false};

private _hostilityMap = createHashMapFromArray [
    ["US", ["RU", "TRB", "PMC", "ALF"]],
    ["PF", ["BB", "DT", "SU", "RC"]],
    ["RU", ["US", "PMC", "ALF"]],
    ["SU", ["RC", "PF", "Bandit"]],
    ["WO", ["TRB", "ROA", "NH"]],
    ["RC", ["PF", "DT", "SU"]],
    ["BB", ["PF", "Bandit"]],
    ["NH", ["WO"]],
    ["DT", ["RC", "PF"]],
    ["ROA", ["WO", "ALF"]],
    ["PMC", ["US", "RU"]],
    ["TRB", ["US", "WO"]],
    ["Bandit", ["SU", "BB"]],
    ["ALF", ["US", "RU", "ROA"]]
];

private _hatedFactions = _hostilityMap getOrDefault [_traderFaction, []];
_playerFaction in _hatedFactions