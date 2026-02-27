params ["_caster", "_sub", "_target", ["_maxRange", 50]];

if (isNull _caster || {isNull _target}) exitWith {};
if (!alive _caster || {!alive _target}) exitWith {};
if ((_caster distance _target) > _maxRange) exitWith {};
if ((_caster getVariable ["LB_magicDiscipline", ""]) != "pig") exitWith {};

private _targets = (_caster nearEntities ["Man", 12]) select {
	alive _x &&
	{_x != _caster} &&
	{!captive _x} &&
	{((side _caster) getFriend (side _x)) < 0.6}
};

if (_targets isEqualTo []) then {
	private _fallbackTargets = (_caster nearEntities ["Man", 50]) select {
		alive _x &&
		{_x != _caster} &&
		{!isPlayer _x} &&
		{!captive _x} &&
		{((side _caster) getFriend (side _x)) < 0.6}
	};

	if (_fallbackTargets isEqualTo []) exitWith {};

	_targets = [selectRandom _fallbackTargets];
};

[_caster, "STAR_WARS_FIGHT_POWERS_WAVE"] remoteExec ["switchMove", 0, true];
sleep 2.0;
[_caster, ""] remoteExec ["switchMove", 0, true];

{
	[_x, "flamethrower_burning_3"] remoteExec ["switchMove", 0, true];
} forEach _targets;

sleep 3.5;

{
	if (isPlayer _x) then {
		[_x, ""] remoteExec ["switchMove", 0, true];
		[_x, true, 4, true] call ace_medical_fnc_setUnconscious;
	} else {
		[_x, true, 10, true] call ace_medical_fnc_setUnconscious;
		_x setRandomLip false;
		_x setSpeaker "NoVoice";
	};
} forEach _targets;