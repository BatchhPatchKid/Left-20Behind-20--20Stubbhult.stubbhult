params ["_caster", "_sub", "_target", ["_maxRange", 100]];

if (isNull _caster || {isNull _target}) exitWith {};
if (!alive _caster || {!alive _target}) exitWith {};
if ((_caster distance _target) > _maxRange) exitWith {};
if ((_caster getVariable ["LB_magicDiscipline", ""]) != "wanderer") exitWith {};

private _targetPosATL = getPosATL _target;

[_caster, "starWars_lightsaber_style1_attack_push"] remoteExec ["switchMove", 0, true];
sleep 0.25;

private _startATL = getPosATL _caster;
_startATL set [2, (_startATL select 2) + 1.5];

private _orb = createVehicle ["Sign_Sphere10cm_F", _startATL, [], 0, "CAN_COLLIDE"];
_orb setObjectMaterialGlobal [0, "\A3\Data_F\default.rvmat"];
_orb setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,1)"];
_orb setObjectScale 2.0;

sleep 1.05;
[_caster, ""] remoteExec ["switchMove", 0, true];

private _speed = 200;
private _dt = 0.05;
private _eps2D = 1;
private _deadline = time + 20;

while {alive _orb && {time < _deadline}} do {
    private _p = getPosATL _orb;
    private _dx = (_targetPosATL select 0) - (_p select 0);
    private _dy = (_targetPosATL select 1) - (_p select 1);
    private _dist2D = sqrt (_dx * _dx + _dy * _dy);

    if (_dist2D <= _eps2D) exitWith { _orb setPosATL [_targetPosATL select 0, _targetPosATL select 1, ((_p select 2) max 0.5)] };

    private _step = (_speed * _dt) min _dist2D;
    if (_dist2D > 0) then {
        private _ux = _dx / _dist2D;
        private _uy = _dy / _dist2D;
        _orb setPosATL [
            (_p select 0) + _ux * _step,
            (_p select 1) + _uy * _step,
            (_p select 2) max 0.5
        ];
    };

    sleep _dt;
};

_orb setPosATL [_targetPosATL select 0, _targetPosATL select 1, (_targetPosATL select 2) max 0.5];

private _scale = getObjectScale _orb;
for "_i" from 1 to 30 do {
    _scale = _scale * 1.12;
    _orb setObjectScale _scale;
    sleep 0.02;
};

private _victims = _orb nearEntities ["Man", 7];

{
	[_x, "flamethrower_burning_3"] remoteExec ["switchMove", 0, true];
} forEach _victims;

sleep 2;

{
	if (alive _x && {!isPlayer _x}) then {
		[_x, 1] remoteExecCall ["setDamage", owner _x];
	} else {
		if (isPlayer _x) then {
			[_x, true, 4, true] call ace_medical_fnc_setUnconscious;
		};
	}; 
	
	if (((side _caster) getFriend (side _x)) > 0.6 && {!captive _x}) then {
        _caster addRating -500000;
    };
} forEach _victims;

deleteVehicle _orb;