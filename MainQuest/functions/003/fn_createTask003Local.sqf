params ["_taskData"];

private _taskId = _taskData param [0, "LBMQ_Task_003"];
private _title = _taskData param [1, "Bring Medicine Crate to SU Medical Tent"];
private _description = _taskData param [2, "Now that you have obtained the medical crate from the US Army, bring it back to the Survivor's Union Contractor's Office. However, it may be a good idea not to take the medicine offered by the scientist - just a hunch."];
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
    "run",
    false
] call BIS_fnc_taskCreate;

[_taskId, true] call BIS_fnc_taskSetCurrent;