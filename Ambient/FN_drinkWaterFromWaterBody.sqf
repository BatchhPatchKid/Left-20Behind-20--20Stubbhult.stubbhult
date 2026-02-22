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

// 1. Adjust hydration
_player setVariable ["hydrationLevel", 100, true];

// 2. Apply radiation
private _arr = (itemsWithMagazines _player) select { _x == "rvg_geiger" };
private _currentRad = _player getVariable ["Rad", 0];
private _radAmount = 30;
_player setVariable ["Rad", _currentRad + _radAmount, true];
if ((_radAmount > 0) and ((count _arr) > 0)) then {
	[_player, ["rvg_geiger_1", 100, 1]] remoteExec ["say3D"];
};

// 3. Show feedback
hint format ["You drank from a body of water"];

// 4. Play drink animation
switch (stance _player) do {
	case "STAND": { _player playMove "ace_field_rations_drinkStand"; };
	case "CROUCH": { _player playMove "ace_field_rations_drinkCrouch"; };
	case "PRONE": { _player playMove "ace_field_rations_drinkProne"; };
};

// 5. Clear hints after a bit
0 spawn {
	sleep 3;
	hintSilent "";
};

// 6. Update drink actions
[_player] call FN_updateDrinkActions;