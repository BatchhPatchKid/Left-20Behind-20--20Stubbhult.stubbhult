params ["_caster", "_sub", "_target", ["_maxRange", 100]];

if (isNull _caster || {isNull _target}) exitWith {};
if (!alive _caster || {!alive _target}) exitWith {};
if (_caster isEqualTo _target) exitWith {};
if ((_caster distance _target) > _maxRange) exitWith {};
if ((_caster distance _target) < 12) exitWith {};
if ((_caster getVariable ["LB_magicDiscipline", ""]) != "greek") exitWith {};
if ((_caster getVariable ["ritualStatusZeus", 0]) - _sub < 0) exitWith {};

[_caster, "starWars_lightsaber_style1_attack_push"] remoteExec ["switchMove", 0, true];
sleep 0.5;

private _posASL = [0,0,0];

if (isPlayer _target) then {
	private _targetPosAGL = ASLToAGL (getPosASL _target);
	private _dir = random 360;
	private _dist = sqrt (random 1) * 5;
	private _randomPosAGL = [
		(_targetPosAGL select 0) + (sin _dir) * _dist,
		(_targetPosAGL select 1) + (cos _dir) * _dist,
		0
	];
	_posASL = AGLToASL _randomPosAGL;
} else {
	_posASL = getPosASL _target;
};

private _m = "Land_HelipadEmpty_F" createVehicle [0,0,0];
_m setPosASL _posASL;

// spawn the lightning effect
[_m, nil, true] remoteExec ["BIS_fnc_moduleLightning", 0];

// kill nearby AI around the strike point
private _victims = _m nearEntities ["Man", 3];
{
    if (alive _x && {!isPlayer _x}) then {
        [_x, 1] remoteExecCall ["setDamage", owner _x];
    } else {
		[_x, true, 3, true] call ace_medical_fnc_setUnconscious;
	};
} forEach _victims;

// leave the marker alive long enough for the effect to play
sleep 1;

deleteVehicle _m;
[_caster, ""] remoteExec ["switchMove", 0, true];

_caster setVariable ["ritualStatusZeus", (_caster getVariable ["ritualStatusZeus", 0]) - _sub, true];