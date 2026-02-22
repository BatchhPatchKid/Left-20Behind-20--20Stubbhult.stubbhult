// Deprecated script
params ["_container","_caller","_actionId","_arguments"];

/* Load and validate sell pairs */
private _pairs = call compile preprocessFileLineNumbers "Economy System\functions\FN_sellPairs.sqf";
if (!(_pairs isEqualType []) || {((count _pairs) mod 2) != 0}) exitWith {
  hintSilent "SellPairs table is invalid (not a flat pair list).";
};

/* Build price map */
private _priceMap = createHashMap;
for "_i" from 0 to ((count _pairs) - 2) step 2 do {
  private _k = _pairs select _i;
  private _v = _pairs select (_i + 1);

  if (_k isEqualType "") then {
    private _p = 0;
    if (_v isEqualType 0) then {_p = _v;};
    if (_v isEqualType "") then {_p = parseNumber _v;};
    if (_p > 0) then {_priceMap set [_k,_p];};
  };
};

private _currency = "rvg_money";
private _moneyPayedBack = 0;
{
  private _cls = _x;

  if (_cls != _currency) then {
    private _price = _priceMap getOrDefault [_cls,0];
    if (_price <= 0) then {_price = 1;};

    _caller removeItemFromBackpack _cls;
    _moneyPayedBack = _moneyPayedBack + _price;
  };
} forEach (backpackItems _caller);

/* Payout multiplier */
_moneyPayedBack = _moneyPayedBack * 3;

/* Pay into PLAYER inventory (any slot). If full, use your overflow handler */
for "_i" from 1 to _moneyPayedBack do {
  if (_caller canAdd _currency) then {
    _caller addItem _currency;
  } else {
    [_container,_caller,_actionId,_currency,1,(_moneyPayedBack-_i)+1] execVM "Economy System\functions\FN_ammoBoxCheck.sqf";
    break;
  };
};