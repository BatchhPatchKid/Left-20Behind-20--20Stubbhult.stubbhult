params ["_mutantType", "_pos", "_triggerRadius", "_maxUnits"];

if (_maxUnits == 0) then {
	switch (_mutantType) do {
		case "Abom": { _maxUnits = floor (random 2) + 1; };
		case "Mind": { _maxUnits = round (random [1, 3, 4]); };
		case "Rake": { _maxUnits = round (random [2, 4, 6]); };
		case "Shadow": { _maxUnits = round (random [1, 2, 3]); };
		case "Skull": { _maxUnits = round (random [4, 8, 15]); };
		case "Snatch": { _maxUnits = round (random [1, 2, 3]); };
		case "Tank": { _maxUnits = selectRandom [1, 1, 1, 1, 1, 1, 1, 2]; };
		case "Hellspawn": { _maxUnits = 1; };
		case "Goliath": { _maxUnits = 1; };
		case "Vamp": { _maxUnits = round (random [2, 3, 5]); };
		case "Various": { _maxUnits = round (random [4, 8, 12]); };
		case "Wend": { _maxUnits = round (random [2, 4, 5]); };
		case "Statue": { _maxUnits = 1; };
		default { _maxUnits = 1; };
	};
};

switch (_mutantType) do {
	case "411": {
		[_pos, _triggerRadius, _maxUnits, "DSA_411", [0]] call (missionNamespace getVariable "FN_spawnMutantCommon");
	};
	case "Abom": {
		[_pos, _triggerRadius, _maxUnits, "DSA_Abomination", [0]] call (missionNamespace getVariable "FN_spawnMutantCommon");
	};
	case "Mind": {
		[_pos, _triggerRadius, _maxUnits, "DSA_Mindflayer", [0], 10, (_triggerRadius / 4), 3, 0.01] call (missionNamespace getVariable "FN_spawnMutantCommon");
	};
	case "Rake": {
		[_pos, _triggerRadius, _maxUnits, "DSA_Rake", [0], 10, (_triggerRadius / 4), 3, 0.5] call (missionNamespace getVariable "FN_spawnMutantCommon");
	};
	case "Shadow": {
		[_pos, _triggerRadius, _maxUnits, "DSA_Shadowman", [0], 10, (_triggerRadius / 4), 3, 0.5] call (missionNamespace getVariable "FN_spawnMutantCommon");
	};
	case "Skull": {
		[_pos, _triggerRadius, _maxUnits, "WBK_SpecialZombie_Corrupted_3", [0]] call (missionNamespace getVariable "FN_spawnMutantCommon");

		private _factionArray = ["Bandit", .75, "DT", .50, "NH", .50, "PF", .35, "ALF", .10, "WO", .10, "RC", .15, "TRB", .10, "US", .03, "RU", .03, "PMC", .10, "ROA", .10];
		private _factionSelected = selectRandomWeighted _factionArray;
		[_factionSelected, (round random 3) + 3, _pos, "Squad", independent, "I_Survivor_F"] call (missionNamespace getVariable "FN_spawnAI");
	};
	case "Snatch": {
		[_pos, _triggerRadius, _maxUnits, "DSA_Snatcher", [0], 10, (_triggerRadius / 4), 3, 0.5] call (missionNamespace getVariable "FN_spawnMutantCommon");
	};
	case "Tank": {
		private _factionArray = ["mutantFactionWeights"] call (missionNamespace getVariable "FN_arrayReturn");
		private _factionSelected = selectRandomWeighted _factionArray;
		[_factionSelected, (round random 10) + 6, _pos, "Squad", 50, independent, "I_Survivor_F"] call (missionNamespace getVariable "FN_spawnAI");
		
		[4] spawn BIS_fnc_earthquake;
		[_pos, _triggerRadius, _maxUnits, "WBK_SpecialZombie_Smasher_3", [2, 2], 10, (_triggerRadius / 4), 3, 0, true] call (missionNamespace getVariable "FN_spawnMutantCommon");
	};
	case "Hellspawn": {
		private _factionArray = ["mutantFactionWeights"] call (missionNamespace getVariable "FN_arrayReturn");
		private _factionSelected = selectRandomWeighted _factionArray;
		[_factionSelected, (round random 10) + 6, _pos, "Squad", independent, "I_Survivor_F"] call (missionNamespace getVariable "FN_spawnAI");

		playSound3D [getMissionPath "sounds\blowout_siren_2.ogg", player, false, _pos, 5, 1, 0];
		sleep 5;
		[4] spawn BIS_fnc_earthquake;
		[_pos, _triggerRadius, _maxUnits, "WBK_SpecialZombie_Smasher_Hellbeast_3", [2, 2, 2], 10, 50, 3, 0.5, true] call (missionNamespace getVariable "FN_spawnMutantCommon");
	};
	case "Goliath": {
		private _factionArray = ["TRB", .25, "US", .10, "RU", .10, "PMC", .20, "ROA", .20];
		private _factionSelected = selectRandomWeighted _factionArray;
		[_factionSelected, (round random 20) + 10, _pos, "Squad", independent, "I_Survivor_F"] call (missionNamespace getVariable "FN_spawnAI");

		private _safePos1 = [_pos, 100, 500, 10, 0, 20, 0, [], []] call BIS_fnc_findSafePos;
		private _safePos2 = [_pos, 100, 500, 10, 0, 20, 0, [], []] call BIS_fnc_findSafePos;
		private _safePos3 = [_pos, 100, 500, 10, 0, 20, 0, [], []] call BIS_fnc_findSafePos;

		playSound3D [getMissionPath "sounds\blowout_siren_2.ogg", player, false, _safePos1, 5, 1, 0];
		sleep 5;
		playSound3D [getMissionPath "sounds\blowout_siren_2.ogg", player, false, _safePos2, 5, 1, 0];
		sleep 5;
		playSound3D [getMissionPath "sounds\blowout_siren_2.ogg", player, false, _safePos3, 5, 1, 0];
		[4] spawn BIS_fnc_earthquake;

		[_pos, _triggerRadius, _maxUnits, "WBK_Goliaph_3", [2, 2, 2, 2, 2], 10, 50, 3, 0, true] call (missionNamespace getVariable "FN_spawnMutantCommon");
	};
	case "Vamp": {
		[_pos, _triggerRadius, _maxUnits, "DSA_Vampire", [0]] call (missionNamespace getVariable "FN_spawnMutantCommon");
	};
	case "Various": {
		private _type = ["DSA_411", .01, "DSA_Mindflayer", .01, "DSA_Rake", .05, "DSA_Shadowman", .05, "DSA_Snatcher", .15, "DSA_Wendigo", .1, "Zombie_Special_OPFOR_Boomer", .05, "Zombie_Special_OPFOR_Leaper_1", .5, "Zombie_Special_OPFOR_Leaper_2", .5, "Zombie_Special_OPFOR_Screamer", .05];
		[_pos, _triggerRadius, _maxUnits, _type, [2, 2], 20] call (missionNamespace getVariable "FN_spawnMutantCommon");
	};
	case "Wend": {
		[_pos, _triggerRadius, _maxUnits, "DSA_Wendigo", [1], 10, (_triggerRadius - 50)] call (missionNamespace getVariable "FN_spawnMutantCommon");
	};
	case "Statue": {
		playSound3D [getMissionPath "sounds\blowout_siren_2.ogg", player, false, _pos, 5, 1, 0];
		[4] spawn BIS_fnc_earthquake;
		[_pos, _triggerRadius, _maxUnits, "DSA_ActiveIdol", [2], 10, (_triggerRadius / 4), 3, 0.01] call (missionNamespace getVariable "FN_spawnMutantCommon");
	};
	default {
		[_pos, _triggerRadius, _maxUnits, "DSA_411", [0]] call (missionNamespace getVariable "FN_spawnMutantCommon");
	};
};