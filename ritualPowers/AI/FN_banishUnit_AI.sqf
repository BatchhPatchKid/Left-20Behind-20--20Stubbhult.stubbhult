params ["_caster", "_sub", "_target", ["_maxRange", 100]];

if (isNull _caster || {isNull _target}) exitWith {};
if (!alive _caster || {!alive _target}) exitWith {};
if ((_caster distance _target) > _maxRange) exitWith {};
if ((_caster getVariable ["LB_magicDiscipline", ""]) != "wanderer") exitWith {};
if ((_caster getVariable ["ritualStatusWanderer", 0]) - _sub < 0) exitWith {};

private _randomPos = selectRandom [
    [5144.04,9540.92,0],
    [5047.83,7809.36,0],
    [7911.3,7703.83,0],
    [11548.7,7594.06,0],
    [11251.4,931.885,0]
];

[_caster, "starWars_lightsaber_style1_attack_push"] remoteExec ["switchMove", 0, true];
sleep 0.4;

private _startScale = 50;
private _endScale = 0.05;
private _steps = 75;

private _banishSphere = createVehicle ["Sign_Sphere10cm_F", getPosATL _target, [], 0, "CAN_COLLIDE"];
_banishSphere setObjectMaterialGlobal [0, "\A3\Data_F\default.rvmat"];
_banishSphere setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,1)"];
_banishSphere setPosATL (getPosATL _target);
_banishSphere setObjectScale _startScale;

sleep 0.25;

for "_i" from 1 to _steps do {
	if (isNull _banishSphere) exitWith {};
	private _nextScale = _startScale - ((_startScale - _endScale) * (_i / _steps));
	_banishSphere setObjectScale (_nextScale max _endScale);
	
	if (_i == 2) then {
		if (isPlayer _target) then {
			private _pos = _randomPos;
			_target setPos _pos;
		} else {
			deleteVehicle _target;
		};
	};
  
  sleep 0.02;
};

deleteVehicle _banishSphere;

[_caster, ""] remoteExec ["switchMove", 0, true];
_caster setVariable ["ritualStatusWanderer", (_caster getVariable ["ritualStatusWanderer", 0]) - _sub, true];