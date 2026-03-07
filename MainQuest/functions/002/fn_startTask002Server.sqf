params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

_player setVariable ["LBMQ_currentTask", "LBMQ_Task_002", true];

// Placeholder: Task 2 flow will be implemented in a follow-up quest stage.