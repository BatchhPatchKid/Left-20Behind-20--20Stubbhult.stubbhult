params ["_faction","_numUnits","_triggerRadius","_pos","_zombieRvg","_typeOfLocationArea","_sfGroup",["_spawnScale",1]];

// Default location‐type tag if none passed
if (isNil "_sfGroup") then {
    _sfGroup = -1;
};

	switch (_faction) do { //Going throuigh each mutant factions as well as zombie faction
	case "411": {
		[_faction, _pos, _triggerRadius, _numUnits, _spawnScale] spawn (missionNamespace getVariable "FN_spawnMutantType");
	};
	case "Abom": {
		[_faction, _pos, _triggerRadius, _numUnits, _spawnScale] spawn (missionNamespace getVariable "FN_spawnMutantType");
	};
	case "Mind": {
		[_faction, _pos, _triggerRadius, _numUnits, _spawnScale] spawn (missionNamespace getVariable "FN_spawnMutantType");
	};
	case "Rake": {
		[_faction, _pos, _triggerRadius, _numUnits, _spawnScale] spawn (missionNamespace getVariable "FN_spawnMutantType");
	};
	case "Shadow": {
		[_faction, _pos, _triggerRadius, _numUnits, _spawnScale] spawn (missionNamespace getVariable "FN_spawnMutantType");
	};
	case "Skull": {
		[_faction, _pos, _triggerRadius, _numUnits, _spawnScale] spawn (missionNamespace getVariable "FN_spawnMutantType");
	};
	case "Snatch": {
		[_faction, _pos, _triggerRadius, _numUnits, _spawnScale] spawn (missionNamespace getVariable "FN_spawnMutantType");
	};
	case "Tank": {
		[_faction, _pos, _triggerRadius, _numUnits, _spawnScale] spawn (missionNamespace getVariable "FN_spawnMutantType");
	};
	case "Hellspawn": {
		[_faction, _pos, _triggerRadius, _numUnits, _spawnScale] spawn (missionNamespace getVariable "FN_spawnMutantType");
	};
	case "Goliath": {
		[_faction, _pos, _triggerRadius, _numUnits, _spawnScale] spawn (missionNamespace getVariable "FN_spawnMutantType");
	};
	case "Vamp": {
		[_faction, _pos, _triggerRadius, _numUnits, _spawnScale] spawn (missionNamespace getVariable "FN_spawnMutantType");
	};
	case "Various": {
		[_faction, _pos, _triggerRadius, _numUnits, _spawnScale] spawn (missionNamespace getVariable "FN_spawnMutantType");
	};
	case "Wend": {
		[_faction, _pos, _triggerRadius, _numUnits, _spawnScale] spawn (missionNamespace getVariable "FN_spawnMutantType");
	};
	case "Statue": {
		[_faction, _pos, _triggerRadius, _numUnits, _spawnScale] spawn (missionNamespace getVariable "FN_spawnMutantType");
	};
	case "Bloater": {
		[_pos, _numUnits, 5, (_triggerRadius / 3), _faction, false, _triggerRadius, _spawnScale] call (missionNamespace getVariable "FN_ZTriggerSpawner");
	};
	case "Leaper": {
		[_pos, _numUnits, 5, (_triggerRadius / 3), _faction, false, _triggerRadius, _spawnScale] call (missionNamespace getVariable "FN_ZTriggerSpawner");
	};
	case "Screamer": {
		[_pos, _numUnits, 5, (_triggerRadius / 3), _faction, false, _triggerRadius, _spawnScale] call (missionNamespace getVariable "FN_ZTriggerSpawner");
	};
	case "demon": {
		[_pos, _numUnits, 5, (_triggerRadius / 3), _faction, false, _triggerRadius, _spawnScale] call (missionNamespace getVariable "FN_ZTriggerSpawner");
	};
	case "mutants": {
		[_pos, _numUnits, 5, (_triggerRadius / 3), _faction, false, _triggerRadius, _spawnScale] call (missionNamespace getVariable "FN_ZTriggerSpawner");
	};
	case "Zombie": {
		[([_pos, 10, 30, 250] call FN_findSafePosition), _numUnits, 5, (_triggerRadius / 2), _faction, _zombieRvg, _triggerRadius, _spawnScale] call (missionNamespace getVariable "FN_ZTriggerSpawner");																														  
	};
	default { // Default is survivors
		if (random 1 > 0.15) then {
			// Ambient Zombie Horde
			if (isServer) then {
				[_pos, 0, 50, (_triggerRadius-150), "sparseZombies", _zombieRvg, _triggerRadius] call (missionNamespace getVariable "FN_ZTriggerSpawner");
			};
		};
	
		if (isServer) then {
			[_faction, _numUnits, _pos, _typeOfLocationArea, _sfGroup] call (missionNamespace getVariable "FN_spawnAI");
		};
	};
};