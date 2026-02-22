params ["_container", "_caller", "_actionId", "_arguments"];

private _cost = _arguments select 1;
private _money = _caller getVariable ["LB_money", 0];

if (_money < _cost) exitWith {
	hintSilent "Sorry, not enough money to purchase item";
	sleep 3;
	hintSilent "";
};

_primaryWeapon = primaryWeapon _caller;
_secondaryWeapon = secondaryWeapon _caller;
_handgunWeapon = handgunWeapon _caller;

_reminder = true;

if (!("" == _primaryWeapon) AND (_arguments select 0) == 0) then {
	_reminder = false;
	_magazines = compatibleMagazines _primaryWeapon;
	if (count _magazines != 0) then {
		if (_container canAddItemToBackpack (_magazines select 0)) then {
			_caller setVariable ["LB_money", _money - _cost, true];
			if (_caller canAddItemToBackpack (_magazines select 0)) then {
				_caller addItemToBackpack (_magazines select 0);
				hintSilent format ["Your primary magazine was successfully purchased. The magazine is in your bag %1.",(name _caller)];
			} else {
				[_container, _caller, _actionId, (_magazines select 0), 3, 0] execVM "Economy System\functions\FN_ammoBoxCheck.sqf";
			};
		};
	} else {
		hintSilent "Sorry, but we weren't able to find any magazines in stock for that weapon.";
	};
};

if (!("" == _secondaryWeapon) AND (_arguments select 0) == 1) then {
	_reminder = false;
	_magazines = compatibleMagazines _secondaryWeapon;
	if (count _magazines != 0) then {
		if (_container canAddItemToBackpack (_magazines select 0)) then {
			_caller setVariable ["LB_money", _money - _cost, true];
			if (_caller canAddItemToBackpack (_magazines select 0)) then {
				_caller addItemToBackpack (_magazines select 0);
				hintSilent format ["Your launchers rocket was successfully purchased. The magazine is in your bag %1.",(name _caller)];
			} else {
				[_container, _caller, _actionId, (_magazines select 0), 3, 0] execVM "Economy System\functions\FN_ammoBoxCheck.sqf";
			};
		};
	} else {
		hintSilent "Sorry, but we weren't able to find any magazines in stock for that weapon.";
	};
};

if (!("" == _handgunWeapon) AND (_arguments select 0) == 2) then {
	_reminder = false;
	_magazines = compatibleMagazines _handgunWeapon;
	if (count _magazines != 0) then {
		if (_container canAddItemToBackpack (_magazines select 0)) then {
			_caller setVariable ["LB_money", _money - _cost, true];
			if (_caller canAddItemToBackpack (_magazines select 0)) then {
				_caller addItemToBackpack (_magazines select 0);
				hintSilent format ["Your handguns magazine was successfully purchased. The magazine is in your bag %1.",(name _caller)];
			} else {
				[_container, _caller, _actionId, (_magazines select 0), 3, 0] execVM "Economy System\functions\FN_ammoBoxCheck.sqf";
			};
		};
	} else {
		hintSilent "Sorry, but we weren't able to find any magazines in stock for that weapon.";
	};
};

if (_reminder) then {
	hintSilent "Sorry, but we weren't able to find a magazine to supply you with. Ensure that you have the weapon equipped if you want to buy a magazine for it.";
};