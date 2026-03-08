params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

private _headDoctor = missionNamespace getVariable ["LBMQ_task003HeadDoctor", objNull];
if (isNull _headDoctor) exitWith {};

private _existingActionId = missionNamespace getVariable ["LBMQ_task003DoctorTalkActionId", -1];
if (_existingActionId >= 0) exitWith {};

private _actionId = _headDoctor addAction [
    "Talk to Head Doctor",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_caller] remoteExecCall ["LBMQ_fnc_onTask003ScientistTalkedServer", 2];
    },
    nil,
    1.5,
    true,
    true,
    "",
    "_this distance _target < 4"
];

missionNamespace setVariable ["LBMQ_task003DoctorTalkActionId", _actionId, true];