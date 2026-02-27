params ["_caster", "_sub", "_target", ["_maxRange", 100]];

if (isNull _caster || {isNull _target}) exitWith {};
if (!alive _caster || {!alive _target}) exitWith {};
if ((_caster distance _target) > _maxRange) exitWith {};
if ((_caster getVariable ["LB_magicDiscipline", ""]) != "greek") exitWith {};
if ((_caster getVariable ["ritualStatusZeus", 0]) - _sub < 0) exitWith {};

[_caster, "starWars_lightsaber_style1_attack_push"] remoteExec ["switchMove", 0, true];
sleep 0.5;

private _posASL = getPosASL _target;
private _m = "Land_HelipadEmpty_F" createVehicle (ASLToAGL _posASL);
_m setPosASL _posASL;
[_m, nil, true] remoteExec ["BIS_fnc_moduleLightning", 0];

private _victims = _m nearEntities ["Man", 6];
{
    if (typeOf _x == "O_soldier_Melee_RUSH") then {
        [_x, 1] remoteExec ["setDamage", 2];
    };
} forEach _victims;

deleteVehicle _m;
[_caster, ""] remoteExec ["switchMove", 0, true];

_caster setVariable ["ritualStatusZeus", (_caster getVariable ["ritualStatusZeus", 0]) - _sub, true];