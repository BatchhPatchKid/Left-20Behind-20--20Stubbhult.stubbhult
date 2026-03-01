params ["_trader"];

if (isNull _trader) exitWith {};

private _actionIds = _trader getVariable ["LB_traderActionIds", []];
{
    _trader removeAction _x;
} forEach _actionIds;

_trader setVariable ["LB_traderActionIds", []];
clearAllItemsFromBackpack _trader;