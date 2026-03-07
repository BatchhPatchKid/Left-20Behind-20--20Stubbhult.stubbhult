params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

_player setVariable ["LBMQ_currentTask", "LBMQ_Task_002", true];

private _alreadySpawned = missionNamespace getVariable ["LBMQ_task002ObjectsSpawned", false];
if (_alreadySpawned) exitWith {};

private _objectsDataRaw = preprocessFileLineNumbers "MainQuest\functions\002\ObjectsToSpawn.txt";
private _objectsDataLines = _objectsDataRaw splitString toString [10, 13];
private _objectClasses = [];
private _expectClassName = false;

{
    private _line = trim _x;

    if (_expectClassName) then {
        if !(_line isEqualTo "") then {
            _objectClasses pushBack _line;
            _expectClassName = false;
        };
    };

    if (_line isEqualTo "CLASS:") then {
        _expectClassName = true;
    };
} forEach _objectsDataLines;

if (_objectClasses isEqualTo []) exitWith {};

private _spawnAnchor = getPosATL _player;
private _spawnDirection = getDir _player;
private _forwardOffset = 25;
private _anchorX = (_spawnAnchor select 0) + ((sin _spawnDirection) * _forwardOffset);
private _anchorY = (_spawnAnchor select 1) + ((cos _spawnDirection) * _forwardOffset);
private _anchorZ = _spawnAnchor select 2;
private _gridAnchor = [_anchorX, _anchorY, _anchorZ];

private _spawnedObjects = [];
private _spacing = 8;
private _spawnCount = count _objectClasses;
private _gridColumns = ceil (sqrt _spawnCount);

{
    private _index = _forEachIndex;
    private _className = _x;

    if (isClass (configFile >> "CfgVehicles" >> _className)) then {
        private _row = floor (_index / _gridColumns);
        private _column = _index mod _gridColumns;
        private _offsetX = _column * _spacing;
        private _offsetY = _row * _spacing;

        private _spawnPos = [
            (_gridAnchor select 0) + _offsetX,
            (_gridAnchor select 1) + _offsetY,
            (_gridAnchor select 2)
        ];

        private _obj = createVehicle [_className, _spawnPos, [], 0, "CAN_COLLIDE"];
        _obj setDir _spawnDirection;
        _spawnedObjects pushBack _obj;
    };
} forEach _objectClasses;

if !(_spawnedObjects isEqualTo []) then {
    missionNamespace setVariable ["LBMQ_task002SpawnedObjects", _spawnedObjects, true];
    missionNamespace setVariable ["LBMQ_task002ObjectsSpawned", true, true];
};