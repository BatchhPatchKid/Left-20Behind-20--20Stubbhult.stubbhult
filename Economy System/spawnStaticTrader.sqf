params ["_faction", "_trigger"];

if (!isServer) exitWith {};

[_faction, _trigger] spawn {
	params ["_faction", "_trigger"];

	private _relationVar = switch (_faction) do {
		case "Bandit": {"Bandit_Relation"};
		case "Renegade": {"Renegade_Relation"};
		default {format ["%1_Relation", _faction]};
	};

	private _saveCrateCargo = {
		params ["_crate"];
		[
			getWeaponCargo _crate,
			getMagazineCargo _crate,
			getItemCargo _crate,
			getBackpackCargo _crate
		]
	};

	private _restoreCrateCargo = {
		params ["_crate", "_cargoSnapshot"];
		if (_cargoSnapshot isEqualType [] && {count _cargoSnapshot == 4}) then {
			clearWeaponCargoGlobal _crate;
			clearMagazineCargoGlobal _crate;
			clearItemCargoGlobal _crate;
			clearBackpackCargoGlobal _crate;

			private _weaponCargo = _cargoSnapshot select 0;
			private _magazineCargo = _cargoSnapshot select 1;
			private _itemCargo = _cargoSnapshot select 2;
			private _backpackCargo = _cargoSnapshot select 3;

			{
				_crate addWeaponCargoGlobal [_x, (_weaponCargo select 1) select _forEachIndex];
			} forEach (_weaponCargo select 0);

			{
				_crate addMagazineCargoGlobal [_x, (_magazineCargo select 1) select _forEachIndex];
			} forEach (_magazineCargo select 0);

			{
				_crate addItemCargoGlobal [_x, (_itemCargo select 1) select _forEachIndex];
			} forEach (_itemCargo select 0);

			{
				_crate addBackpackCargoGlobal [_x, (_backpackCargo select 1) select _forEachIndex];
			} forEach (_backpackCargo select 0);
		};
	};

	private _applyHostileCrateActions = {
		params ["_crate"];
		removeAllActions _crate;
		_crate addAction ["Trader crate access denied (hostile faction)", {}, [], 1.5, true, false, "", "true", 3];
	};

	private _applyFriendlyCrateActions = {
		params ["_crate"];
		removeAllActions _crate;
		[_crate] call (missionNamespace getVariable "FN_economySystemCrate");
	};

	private _spawnCrate = {
		params [
			"_trigger",
			["_cargoSnapshot", [], [[]]],
			["_isHostileMode", false, [false]]
		];
		private _crateClass = _trigger getVariable ["LB_staticTraderCrateClass", "Box_NATO_Equip_F"];
		private _spawnPos = getPosATL _trigger;
		private _crate = createVehicle [_crateClass, _spawnPos, [], 0, "NONE"];
		_crate setPosATL _spawnPos;
		_crate allowDamage false;

		if (_isHostileMode) then {
			[_crate] call _applyHostileCrateActions;
		} else {
			[_crate] call _applyFriendlyCrateActions;
		};

		if ((count _cargoSnapshot) == 4) then {
			[_crate, _cargoSnapshot] call _restoreCrateCargo;
		};
		_crate
	};

	private _spawnPos = getPos _trigger;
	private _grpTrader = createGroup WEST;
	private _trader = _grpTrader createUnit ["B_G_Survivor_F", _spawnPos, [], 1, "NONE"];
	[_faction, _trader, false, true, false] call (missionNamespace getVariable "FN_equipAI");
	_trader disableAI "ANIM";
	removeBackpackGlobal _trader;
	[_trader] execVM "Economy System\economySystem.sqf";

	private _wp1 = _grpTrader addWaypoint [_spawnPos, 0];
	_wp1 setWaypointType "HOLD";
	_grpTrader enableGunLights "ForceOn";

	private _initialCargo = _trigger getVariable ["LB_staticTraderCrateCargo", []];
	private _crate = [_trigger, _initialCargo, false] call _spawnCrate;
	private _isHostileMode = false;

	_trader addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator"];
		if (isPlayer _killer) then {
			_killer setVariable ["SU_Relation",false,true];
			_killer setVariable ["BB_Relation",false,true];
			_killer setVariable ["PF_Relation",false,true];
			_killer setVariable ["ALF_Relation",false,true];
			_killer setVariable ["WO_Relation",false,true];
			_killer setVariable ["RU_Relation",false,true];
			_killer setVariable ["US_Relation",false,true];
			_killer setVariable ["NH_Relation",false,true];
			_killer setVariable ["TRB_Relation",false,true];
			_killer setVariable ["RC_Relation",false,true];
			_killer setVariable ["DT_Relation",false,true];
			_killer setVariable ["ROA_Relation",false,true];
			_killer setVariable ["PMC_Relation",false,true];
			_killer setVariable ["Bandit_Relation",false,true];
			_killer setVariable ["Renegade_Relation",true,true];

			hintSilent parseText format ["<t size='1.25' color='#ff0000'> *ATTENTION*<br/><br/></t><t>Trader has been killed by %1. %1 is now a renegade.</t>", (name _killer)];

			{
				if (_x inArea [_killer, 100, 100, 0, false]) then {
					_x allowDamage true;
				};
			} forEach allPlayers;

			private _units = nearestObjects [_unit, ["CAManBase"], 100];
			private _aiUnits = [];

			{
				if (!isPlayer _x && alive _x) then {
					_aiUnits pushBack _x;
				};
			} forEach _units;

			if (count _aiUnits != 0) then {
				private _grpBetray = _aiUnits joinSilent createGroup independent;
				private _wp1 = _grpBetray addWaypoint [(getPos _killer), 0];
				_wp1 setWaypointType "MOVE";
			};
		};
	}];

	while {true} do {
		private _playersInRadius = allPlayers select {alive _x && {_x distance2D _spawnPos <= 50}};

		if ((count _playersInRadius) == 0) then {
			if (!isNull _crate) then {
				private _cargoSnapshot = [_crate] call _saveCrateCargo;
				_trigger setVariable ["LB_staticTraderCrateCargo", _cargoSnapshot, true];
				deleteVehicle _crate;
				_crate = [_trigger, _cargoSnapshot, false] call _spawnCrate;
				_isHostileMode = false;
			};
			deleteVehicle _trader;
			break;
		};

		private _hostilePresent = false;
		{
			if (!isNil "FN_factionClothingCheck") then {
				[_x] call FN_factionClothingCheck;
			};
			if !(_x getVariable [_relationVar, false]) exitWith {
				_hostilePresent = true;
			};
		} forEach _playersInRadius;

		if (_hostilePresent != _isHostileMode && {!isNull _crate}) then {
			if (_hostilePresent) then {
				[_crate] call _applyHostileCrateActions;
			} else {
				[_crate] call _applyFriendlyCrateActions;
			};
			_isHostileMode = _hostilePresent;
		};

		sleep 2;
	};
};