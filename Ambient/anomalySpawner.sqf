if (side player != civilian) then {
	private _minDist = 50;
	private _maxDist = 200;
	private _anomTracker = 0;
	private _maxAnomGroups = 1;
	private _maxAnom = 3;
	_anomSelection = ["meat", .25, "elec", .75, "spring", .45, "burn", .30];

	null = [_maxAnomGroups, _minDist, _maxDist, _anomTracker, _maxAnom, _anomSelection] spawn {
		params ["_maxAnomGroups", "_minDist", "_maxDist", "_anomTracker", "_maxAnom", "_anomSelection"];
		private _anomSpawnedObjectTracker = [];
		private _anomSelected = "";
		private _anom = "";
		while {true} do {
	  
			// Checking if player alive
			while {alive player} do {
				if (!(vehicle player isKindOf "Helicopter")) then { //Jets check

					// Checking if limit reached
					if (_anomTracker < _maxAnomGroups) then {

						// Spawning anomalies
						for "_i" from 1 to _maxAnom do {
							//selecting position
							private _posATL = [getPos player, _minDist, _maxDist, 3, 0, 20, 0] call BIS_fnc_findSafePos;
							private _zASL = getTerrainHeightASL [(_posATL select 0), (_posATL select 1)]; // gets the terrain height above sea level at (x,y)
							private _posASL = [(_posATL select 0), (_posATL select 1), _zASL];
							_anomSelected = _anomSelection call BIS_fnc_selectRandomWeighted;
							
							if (_anomSelected == "meat") then {
								_anom = [_posASL] call diwako_anomalies_main_fnc_createMeatgrinder;
							};
							if (_anomSelected == "elec") then {
								_anom = [_posASL] call diwako_anomalies_main_fnc_createElectra;
							};
							if (_anomSelected == "spring") then {
								_anom = [_posASL] call diwako_anomalies_main_fnc_createSpringboard;
							};
							if (_anomSelected == "burn") then {
								_anom = [_posASL] call diwako_anomalies_main_fnc_createBurner;
							};
								
							_anomSpawnedObjectTracker = _anomSpawnedObjectTracker + [_anom];
							_anomTracker = _anomTracker + 1;
							sleep 2;
						};
						sleep 2;
					};
					sleep 2;
				};
				
				if (count _anomSpawnedObjectTracker > 0) then {
					private _despawnDistance = _minDist + _maxDist;
					private _headlessClients = entities "HeadlessClient_F";
					private _humanPlayers = allPlayers - _headlessClients; //All players that aren't headless clients
					{
						private _anomPos = getPos _x;
						private _isNearPlayer = (_humanPlayers findIf {_x distance2D _anomPos <= _despawnDistance}) != -1;

						if (!_isNearPlayer) then {
							[_x] call diwako_anomalies_main_fnc_deleteAnomalies;
							_anomSpawnedObjectTracker = _anomSpawnedObjectTracker - [_x]; 
							_anomTracker = _anomTracker - 1; 
						};
						sleep .5;
					} forEach +_anomSpawnedObjectTracker;
					
					sleep 2;
				};
				sleep 30;
			};
			sleep 30;
			
			{
				[_x] call diwako_anomalies_main_fnc_deleteAnomalies;
				_anomSpawnedObjectTracker = _anomSpawnedObjectTracker - [_x];
				_anomTracker = _anomTracker - 1; 
			} forEach _anomSpawnedObjectTracker;
		};
	};
};