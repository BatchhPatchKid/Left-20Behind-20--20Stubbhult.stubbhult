params ["_container", "_caller", "_actionId"];
private _economyTaskId = _caller getVariable ["LB_economyTaskId", ""];

if (_economyTaskId isEqualTo "") then {
	hintSilent "You didn't have an tasks assigned...";
} else {
	[_economyTaskId,"CANCELED"] call BIS_fnc_taskSetState;
	[_economyTaskId, true] call BIS_fnc_deleteTask;
	_caller setVariable ["LB_economyTaskId", "", true];
	hintSilent "Task has been successfully canceled - Warning, the targets could still at large, so do if you encounter them and eliminate them, you will not receive a reward as you canceled the task";
};