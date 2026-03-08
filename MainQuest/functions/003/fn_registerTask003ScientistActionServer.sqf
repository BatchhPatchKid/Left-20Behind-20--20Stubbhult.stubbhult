params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

private _scientist = missionNamespace getVariable ["LBMQ_task002Scientist", objNull];
if (isNull _scientist) exitWith {};

private _existingActionId = missionNamespace getVariable ["LBMQ_task002ScientistTalkActionId", -1];
if (_existingActionId >= 0) exitWith {};

private _actionId = _scientist addAction [
    "Talk to Scientist",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_caller] remoteExecCall ["LBMQ_fnc_onTask002ScientistTalkedServer", 2];
    },
    nil,
    1.5,
    true,
    true,
    "",
    "_this distance _target < 4"
];

missionNamespace setVariable ["LBMQ_task002ScientistTalkActionId", _actionId, true];