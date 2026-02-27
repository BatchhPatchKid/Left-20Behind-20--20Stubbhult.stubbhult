params ["_player", "_sub"];

if ((_player getVariable ["ritualStatusWanderer",0])-_sub < 0 ) exitWith { ["You do not hold enough ritual power to cast this spell"] remoteExec ["hint", _player]; };

LB_fnc_lookUnit = {
  params ["_player", ["_maxRange",3000]];
  private _u = cursorTarget;
  if (isNull _u || {!(_u isKindOf "Man")}) then {
    private _p0 = positionCameraToWorld [0,0,0];
    private _p1 = positionCameraToWorld [0,0,_maxRange];
    private _hits = lineIntersectsSurfaces [AGLToASL _p0, AGLToASL _p1, _player, vehicle _player, true, 1, "VIEW", "FIRE"];
    if (_hits isNotEqualTo []) then { _u = _hits#0#2 };
  };
  if (!isNull _u && { _u isKindOf "Man" }) exitWith { _u };
  objNull
};

private _randomPos = selectRandom [
    [5144.04,9540.92,0],
    [5047.83,7809.36,0],
    [7911.3,7703.83,0],
    [11548.7,7594.06,0],
    [11251.4,931.885,0]
];

// usage (client):
private _targetUnit = [_player, 3000] call LB_fnc_lookUnit;

if (isNull _targetUnit) exitWith { ["No unit was found for the ritual to commence upon"] remoteExec ["hint", _player]; };

[_player, "starWars_lightsaber_style1_attack_push"] remoteExec ["switchMove", 0, true];

sleep 0.5;

private _startScale = 50;
private _endScale = 0.05;
private _steps = 75;

private _banishSphere = createVehicle ["Sign_Sphere10cm_F", getPosATL _targetUnit, [], 0, "CAN_COLLIDE"];
_banishSphere setObjectMaterialGlobal [0, "\A3\Data_F\default.rvmat"];
_banishSphere setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,1)"];
_banishSphere setPosATL (getPosATL _targetUnit);
_banishSphere setObjectScale _startScale;

sleep 0.25;

for "_i" from 1 to _steps do {
	if (isNull _banishSphere) exitWith {};
	private _nextScale = _startScale - ((_startScale - _endScale) * (_i / _steps));
	_banishSphere setObjectScale (_nextScale max _endScale);
	
	if (_i == 2) then {
		if (isPlayer _targetUnit) then {
			private _pos = [_randomPos, 100, 800, 5, 0, 0.6, 0] call BIS_fnc_findSafePos;
			_targetUnit setPos _pos;
		} else {
			deleteVehicle _targetUnit;
		};
	};
  
  sleep 0.02;
};

deleteVehicle _banishSphere;

[_player, ""] remoteExec ["switchMove", 0, true];

_player setVariable ["ritualStatusWanderer", (_player getVariable ["ritualStatusWanderer",0]) - _sub, true];


[_player] spawn FN_updateRitualActions;