params [
	"_pos",
	"_triggerRadius",
	"_maxUnits",
	"_unitTypes",
	"_lootLevels",
	["_safePosMin", 10],
	["_safePosMax", -1],
	["_safePosWaterMode", 3],
	["_spawnSleep", 0],
	["_addNegativeRating", false]
];

if (_safePosMax < 0) then {
	_safePosMax = _triggerRadius / 4;
};

{
	[_pos, _x] call (missionNamespace getVariable "FN_lootSpawner");
} forEach _lootLevels;

for "_i" from 1 to _maxUnits do {
	private _unitType = if (_unitTypes isEqualType "") then {
		_unitTypes
	} else {
		if ((count _unitTypes) <= 1) then {
			_unitTypes # 0
		} else {
			if ((_unitTypes # 1) isEqualType 0) then {
				selectRandomWeighted _unitTypes
			} else {
				selectRandom _unitTypes
			};
		};
	};
	
	private _horde = createGroup east;
	private _spawnPos = [_pos, _safePosMin, _safePosMax, _safePosWaterMode, 0, 20, 0, [], []] call BIS_fnc_findSafePos;
	private _hordeUnit = _horde createUnit [_unitType, _spawnPos, [], 1, "NONE"];
	_hordeUnit setSpeaker "NoVoice";
	_hordeUnit disableConversation true;

	if (_addNegativeRating) then {
		_hordeUnit addRating -10001;
	};

	if (_spawnSleep > 0) then {
		sleep _spawnSleep;
	};
	
	[_horde, [], []] call (missionNamespace getVariable "FN_enableDynamicSim");
};