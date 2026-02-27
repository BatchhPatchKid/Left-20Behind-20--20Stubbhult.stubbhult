params ["_caster", "_sub"];

if (isNull _caster || {!alive _caster}) exitWith {};
if ((_caster getVariable ["LB_magicDiscipline", ""]) != "greek") exitWith {};

private _players = allPlayers select {alive _x};
if (_players isEqualTo []) exitWith {};

private _nearestPlayer = _players#0;
private _bestDistance = _caster distance _nearestPlayer;

{
    private _d = _caster distance _x;
    if (_d < _bestDistance) then {
        _nearestPlayer = _x;
        _bestDistance = _d;
    };
} forEach _players;

private _center = getPosATL _nearestPlayer;
private _teleportPos = [_center, 0, 50, 5, 0, 0.6, 0] call BIS_fnc_findSafePos;

[_caster, "STAR_WARS_FORCE_CHOKE_victim"] remoteExec ["switchMove", 0, true];
sleep 1;
_caster setPos _teleportPos;
[_caster, ""] remoteExec ["switchMove", 0, true];