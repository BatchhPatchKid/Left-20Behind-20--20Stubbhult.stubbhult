params ["_caster", ["_sub", 0], ["_class", "Zombie_Special_OPFOR_Leaper_1"], ["_radius", 12]];

if (isNull _caster || {!alive _caster}) exitWith {};
if ((_caster getVariable ["LB_magicDiscipline", ""]) != "wanderer") exitWith {};

private _a = random 360;
private _r = 3 + random (_radius max 3);
private _spawnPos = _caster modelToWorld [_r * sin _a, _r * cos _a, 0];
_spawnPos set [2, 0];

private _tmpGrp = createGroup (side _caster);
private _summon = _tmpGrp createUnit [_class, _spawnPos, [], 0, "FORM"];

[_caster, "flamethrower_burning_3"] remoteExec ["switchMove", 0, true];

if (!isNull _summon) then {
    [_summon] joinSilent (group _caster);
    _summon setRandomLip false;
    _summon setSpeaker "NoVoice";
};

deleteGroup _tmpGrp;

sleep 3.5;

[_caster, ""] remoteExec ["switchMove", 0, true];