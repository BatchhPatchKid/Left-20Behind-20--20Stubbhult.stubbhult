params ["_caster", "_sub", "_target", ["_maxRange", 100]];

if (isNull _caster || {isNull _target}) exitWith {};
if (!alive _caster || {!alive _target}) exitWith {};
if ((_caster distance _target) > _maxRange) exitWith {};
if ((_caster getVariable ["LB_magicDiscipline", ""]) != "pig") exitWith {};
if ((_caster getVariable ["ritualStatusPig", 0]) - _sub < 0) exitWith {};

[_caster, "starWars_lightsaber_style1_attack_push"] remoteExec ["switchMove", 0, true];
sleep 0.25;

private _posASL = [0,0,0];

if (isPlayer _target) then {
	private _targetPosATL = getPosATL _target;
	private _dir = random 360;
	private _dist = sqrt (random 1) * 10;
	private _randomPosATL = [
		(_targetPosATL select 0) + (sin _dir) * _dist,
		(_targetPosATL select 1) + (cos _dir) * _dist,
		0
	];
	_posASL = AGLToASL _randomPosATL;
} else {
	_posASL = getPosASL _target;
};

private _centerPos = ASLToAGL _posASL;

private _ied = createMine ["IEDUrbanSmall_F", [0, 0, 0], [], 0];
_ied setPosASL _posASL;

private _victims = _centerPos nearEntities ["Man", 3];
{
	if (alive _x && {!isPlayer _x}) then {
		[_x, 1] remoteExecCall ["setDamage", owner _x];
	};
} forEach _victims;

_ied setDamage 1;

sleep 0.5;
[_caster, ""] remoteExec ["switchMove", 0, true];

_caster setVariable ["ritualStatusPig", (_caster getVariable ["ritualStatusPig", 0]) - _sub, true];