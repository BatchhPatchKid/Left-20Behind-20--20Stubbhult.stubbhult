params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

[_player] call (missionNamespace getVariable "LBMQ_fnc_completeTask003Server");