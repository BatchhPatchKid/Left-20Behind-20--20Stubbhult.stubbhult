params ["_taskData"];

private _taskId = _taskData param [0, "LBMQ_Task_002"];
private _title = _taskData param [1, "Retrieve Medical Supplies from Scientist"];
private _description = _taskData param [2, "Travel to the camp and speak with the scientist in the middle. After the conversation, the medical crate is assumed to be secured."];
private _destination = _taskData param [3, objNull];

private _destinationArg = objNull;

if (_destination isEqualType objNull) then {
    if (!isNull _destination) then {
        _destinationArg = _destination;
    };
} else {
    if (_destination isEqualType []) then {
        if ((count _destination) >= 2) then {
            _destinationArg = _destination;
        };
    } else {
        if (_destination isEqualType "") then {
            if (_destination != "") then {
                _destinationArg = _destination;
            };
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
    "",
    false
] call BIS_fnc_taskCreate;

[_taskId, true] call BIS_fnc_taskSetCurrent;