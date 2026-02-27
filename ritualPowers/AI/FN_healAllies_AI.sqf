params ["_caster", ["_radius", 25], ["_sub", 0]];

if (isNull _caster || {!alive _caster}) exitWith {};
if ((_caster getVariable ["LB_magicDiscipline", ""]) != "greek") exitWith {};
if ((_caster getVariable ["ritualStatusZeus", 0]) - _sub < 0) exitWith {};

private _allies = (_caster nearEntities ["Man", _radius]) select {
	alive _x &&
	{((side _x) getFriend (side _caster)) >= 0.6}
};

if (_allies isEqualTo []) exitWith {};

[_caster, "STAR_WARS_FIGHT_POWERS_OTHER_HEAL"] remoteExec ["switchMove", 0, true];

sleep 3;

{
	_x setDamage 0;
	[objNull, _x] call ace_medical_treatment_fnc_fullHeal;
} forEach _allies;

[_caster, ""] remoteExec ["switchMove", 0, true];

if (_sub > 0) then {
	_caster setVariable ["ritualStatusZeus", (_caster getVariable ["ritualStatusZeus", 0]) - _sub, true];
};