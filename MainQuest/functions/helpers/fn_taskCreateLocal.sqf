params ["_taskData"];

private _taskId = _taskData param [0, ""];
if (_taskId isEqualTo "") exitWith {};

private _title = _taskData param [1, "Task"];
private _description = _taskData param [2, ""];
private _destination = _taskData param [3, objNull];
private _taskType = _taskData param [4, ""];

private _destinationArg = objNull;

if (_destination isEqualType objNull) then {
    if (!isNull _destination) then { _destinationArg = _destination; };
} else {
    if (_destination isEqualType []) then {
        if ((count _destination) >= 2) then { _destinationArg = _destination; };
    } else {
        if (_destination isEqualType "") then {
            if (_destination != "") then { _destinationArg = _destination; };
        };
    };
};

[
    player,
    _taskId,
    [_description, _title, _title],
    _destinationArg,
    "ASSIGNED",
    1,
    true,
    _taskType,
    false
] call BIS_fnc_taskCreate;

[_taskId, true] call BIS_fnc_taskSetCurrent;