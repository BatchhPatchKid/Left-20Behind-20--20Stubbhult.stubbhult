params ["_container", "_caller", "_actionId", "_arguments"];
_itemsPlayer = itemsWithMagazines _container;

private _cost = _arguments select 1;
private _money = _caller getVariable ["LB_money", 0];

if (_money < _cost) exitWith {
	hintSilent "Sorry, not enough money to purchase item";
	sleep 3;
	hintSilent "";
};

_caller setVariable ["LB_money", _money - _cost, true];

backpackSelection = ["backpack"] call (missionNamespace getVariable "FN_arrayReturn");
backpackSelectionRare = ["backpackExpensive"] call (missionNamespace getVariable "FN_arrayReturn");

if ((_arguments select 0) in backpackSelection or (_arguments select 0) in backpackSelectionRare) then {
	[_container, _caller, _actionId, _arguments, 2, 0] execVM "Economy System\functions\FN_ammoBoxCheck.sqf";
} else {
	if (_caller canAddItemToBackpack (_arguments select 0)) then {
		_caller addItemToBackpack (_arguments select 0);
		_index = 0;
		hintSilent format ["The item has been put in your bag %1. Thank you for doing busines with us.", (name _caller)];
		sleep 3;
		hintSilent "";
	} else {
		[_container, _caller, _actionId, _arguments, 0, 0] execVM "Economy System\functions\FN_ammoBoxCheck.sqf";
	};
};