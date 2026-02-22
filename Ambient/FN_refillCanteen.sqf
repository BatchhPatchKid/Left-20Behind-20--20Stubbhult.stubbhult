/*
   FN_refillCanteen.sqf (optimized)
*/
params ["_player"];

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

sleep 3;

[_player,""] remoteExec ["switchMove",0,true];