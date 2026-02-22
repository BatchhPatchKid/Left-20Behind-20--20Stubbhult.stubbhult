/*
   FN_drinkWaterFromWaterBody.sqf
*/
params ["_player"];

private _pos = getPosASL _player;
private _radius = 5;
private _samples = 8;

private _found = false;
if (surfaceIsWater _pos) then {
	_found = true;
} else {
	for "_i" from 0 to (_samples - 1) do {
		private _a = (_i * 360) / _samples;
		private _p = _pos vectorAdd [
			(sin _a) * _radius,
			(cos _a) * _radius,
			0
		];
		if (surfaceIsWater _p) exitWith {_found = true;};
	};
};

if (!_found) exitWith {
	["You are not near a body of water that is drinkable from"] remoteExec ["hintSilent", _player];
	false
};

private _swaps = [
	["rvg_canteenEmpty","rvg_canteen"],
	["ACE_Canteen_Empty","rvg_canteen"],
	["rvg_plasticBottleEmpty","rvg_plasticBottle"],
	["ACE_WaterBottle_Empty","rvg_plasticBottle"]
];

private _didRefill = false;

{
	private _empty = _x select 0;
	private _full = _x select 1;

	if ([_player,_empty] call BIS_fnc_hasItem) then {
		_player removeItem _empty;
		_player addItem _full;
		_didRefill = true;
	};
} forEach _swaps;

if (!_didRefill) exitWith {
	["You don't have an empty water container to refill"] remoteExec ["hintSilent", _player];
};

["Your water containers have been refilled"] remoteExec ["hintSilent", _player];
[_player,"AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic"] remoteExec ["switchMove",0,true];

0 spawn {
	sleep 3;
	hintSilent "";
};

[_player,""] remoteExec ["switchMove",0,true];