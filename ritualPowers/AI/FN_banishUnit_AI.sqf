params ["_caster", "_sub", "_target", ["_maxRange", 100]];

if (isNull _caster || {isNull _target}) exitWith {};
if (!alive _caster || {!alive _target}) exitWith {};
if ((_caster distance _target) > _maxRange) exitWith {};
if ((_caster getVariable ["LB_magicDiscipline", ""]) != "wanderer") exitWith {};
if ((_caster getVariable ["ritualStatusWanderer", 0]) - _sub < 0) exitWith {};

[_caster, "starWars_lightsaber_style1_attack_push"] remoteExec ["switchMove", 0, true];
sleep 0.4;

if (isPlayer _target) then {
    private _pos = [getPosATL _target, 10, 30, 5, 0, 0.6, 0] call BIS_fnc_findSafePos;
    _target setPos _pos;
} else {
    deleteVehicle _target;
};

[_caster, ""] remoteExec ["switchMove", 0, true];
_caster setVariable ["ritualStatusWanderer", (_caster getVariable ["ritualStatusWanderer", 0]) - _sub, true];