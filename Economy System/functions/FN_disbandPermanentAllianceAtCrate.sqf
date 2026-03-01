params ["_target", "_caller", "_actionId", "_args"];

if (isNull _target) exitWith {};
if (isNull _caller) exitWith {};
if (!isPlayer _caller) exitWith {};

[_target, _caller] remoteExec ["LB_fnc_disbandPermanentAllianceAtCrateServer", 2];