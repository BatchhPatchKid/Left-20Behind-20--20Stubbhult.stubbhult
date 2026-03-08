params ["_player"];

if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

if (isServer) exitWith {
    [_player] call (missionNamespace getVariable "LBMQ_fnc_startTask002Server");
};

if (_player != player) exitWith {};

[_player] remoteExecCall ["LBMQ_fnc_startTask002Server", 2];