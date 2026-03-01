// MoneySystem\moneyInit.sqf

// 1) Define functions on every machine (so remoteExec targets can resolve them)
missionNamespace setVariable ["LB_fnc_initPlayerMoney",compileFinal {
    params ["_unit","_startingMoney"];
    if (isNull _unit) exitWith {};
    if (!isPlayer _unit) exitWith {};
    if (isNil "_startingMoney") then {_startingMoney=0;};
    if (!(_startingMoney isEqualType 0)) then {_startingMoney=0;};
    if (isNil {_unit getVariable "LB_money"}) then {
        _unit setVariable ["LB_money",_startingMoney,true];
    };
}];

missionNamespace setVariable ["LB_fnc_addMoneyServer",compileFinal {
    params ["_unit","_delta"];
    if (isNull _unit) exitWith {};
    if (!isPlayer _unit) exitWith {};
    if !(_delta isEqualType 0) exitWith {};
    private _cur=_unit getVariable ["LB_money",0];
    _unit setVariable ["LB_money",_cur+_delta,true];
}];

missionNamespace setVariable ["LB_fnc_setMoneyServer",compileFinal {
    params ["_unit","_value"];
    if (isNull _unit) exitWith {};
    if (!isPlayer _unit) exitWith {};
    if !(_value isEqualType 0) exitWith {};
    _unit setVariable ["LB_money",_value,true];
}];

// Convert physical rvg_money (magazines) into LB_money 1:1, remove notes
missionNamespace setVariable ["LB_fnc_convertRvgMoneyPlayerServer",compileFinal {
    params ["_unit"];
    if (isNull _unit) exitWith {0};
    if (!isPlayer _unit) exitWith {0};
    private _cnt={_x=="rvg_money"} count magazines _unit;
    if (_cnt>0) then {
        for "_i" from 1 to _cnt do {_unit removeItem "rvg_money";};
        private _cur=_unit getVariable ["LB_money",0];
        _unit setVariable ["LB_money",_cur+_cnt,true];
    };
    _cnt
}];

// Spend helper: returns true if spent, false if insufficient
missionNamespace setVariable ["LB_fnc_trySpendServer",compileFinal {
    params ["_unit","_cost"];
    if (isNull _unit) exitWith {false};
    if (!isPlayer _unit) exitWith {false};
    if !(_cost isEqualType 0) exitWith {false};
    private _cur=_unit getVariable ["LB_money",0];
    if (_cur<_cost) exitWith {false};
    _unit setVariable ["LB_money",_cur-_cost,true];
    true
}];

// Server-side: purchase item to crate if funds available
missionNamespace setVariable ["LB_fnc_tryPurchaseItemCrateServer",compileFinal {
    params ["_crate","_buyer","_class","_cost"];
    if (isNull _crate) exitWith {};
    if (isNull _buyer) exitWith {};
    if (!isPlayer _buyer) exitWith {};
    if !(_class isEqualType "") exitWith {};
    if !(_cost isEqualType 0) exitWith {};

    [_buyer] call (missionNamespace getVariable "LB_fnc_convertRvgMoneyPlayerServer");

    private _ok=[_buyer,_cost] call (missionNamespace getVariable "LB_fnc_trySpendServer");
    if (!_ok) exitWith {
        ["Sorry, not enough money to purchase item"] remoteExec ["hintSilent",_buyer];
        sleep 3;
        [""] remoteExec ["hintSilent",_buyer];
    };

    private _bpSel=["backpack"] call (missionNamespace getVariable "FN_arrayReturn");
    private _bpSelRare=["backpackExpensive"] call (missionNamespace getVariable "FN_arrayReturn");

    if (_class in _bpSel || {_class in _bpSelRare}) then {
        _crate addBackpackCargoGlobal [_class,1];
    } else {
        _crate addItemCargoGlobal [_class,1];
    };

    ["item successfully purchased"] remoteExec ["hintSilent",_buyer];
    sleep 3;
    [""] remoteExec ["hintSilent",_buyer];
}];

// Server-side: purchase compatible magazine to crate if funds available
missionNamespace setVariable ["LB_fnc_tryPurchaseMagCrateServer",compileFinal {
    params ["_crate","_buyer","_slot","_cost"];
    if (isNull _crate) exitWith {};
    if (isNull _buyer) exitWith {};
    if (!isPlayer _buyer) exitWith {};
    if !(_slot isEqualType 0) exitWith {};
    if !(_cost isEqualType 0) exitWith {};

    [_buyer] call (missionNamespace getVariable "LB_fnc_convertRvgMoneyPlayerServer");

    private _ok=[_buyer,_cost] call (missionNamespace getVariable "LB_fnc_trySpendServer");
    if (!_ok) exitWith {
        ["Sorry, not enough money to purchase item"] remoteExec ["hintSilent",_buyer];
        sleep 3;
        [""] remoteExec ["hintSilent",_buyer];
    };

    private _w="";
    if (_slot==0) then {_w=primaryWeapon _buyer;};
    if (_slot==1) then {_w=secondaryWeapon _buyer;};
    if (_slot==2) then {_w=handgunWeapon _buyer;};

    if (_w=="") exitWith {
        ["Sorry, but no weapon was found for that slot."] remoteExec ["hintSilent",_buyer];
        sleep 3;
        [""] remoteExec ["hintSilent",_buyer];
    };

    private _mags=compatibleMagazines _w;
    if (count _mags==0) exitWith {
        ["Sorry, but we weren't able to find any magazines in stock for that weapon."] remoteExec ["hintSilent",_buyer];
        sleep 3;
        [""] remoteExec ["hintSilent",_buyer];
    };

    _crate addMagazineCargoGlobal [(_mags select 0),1];
    ["magazine successfully purchased"] remoteExec ["hintSilent",_buyer];
    sleep 3;
    [""] remoteExec ["hintSilent",_buyer];
}];

// Server-side: purchase vehicle spawn if funds available
missionNamespace setVariable ["LB_fnc_tryPurchaseVehicleCrateServer",compileFinal {
    params ["_crate","_buyer","_class","_cost"];
    if (isNull _crate) exitWith {};
    if (isNull _buyer) exitWith {};
    if (!isPlayer _buyer) exitWith {};
    if !(_class isEqualType "") exitWith {};
    if !(_cost isEqualType 0) exitWith {};

    [_buyer] call (missionNamespace getVariable "LB_fnc_convertRvgMoneyPlayerServer");

    private _ok=[_buyer,_cost] call (missionNamespace getVariable "LB_fnc_trySpendServer");
    if (!_ok) exitWith {
        ["Sorry, not enough money to purchase vehicle"] remoteExec ["hintSilent",_buyer];
        sleep 3;
        [""] remoteExec ["hintSilent",_buyer];
    };

    private _spawnPos = _crate modelToWorld [6,0,0];
    private _safePos = _spawnPos findEmptyPosition [3,30,_class];
    if ((count _safePos) == 0) then {
        _safePos = _spawnPos;
    };

    private _vehicle = createVehicle [_class,_safePos,[],0,"NONE"];
    _vehicle setDir (getDir _crate);
    _vehicle setPosATL _safePos;

    clearItemCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearWeaponCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;

    _vehicle setDamage 0;
    _vehicle setFuel 1;
    _vehicle setVehicleAmmo 1;
    _vehicle lock 0;

    ["vehicle successfully purchased"] remoteExec ["hintSilent",_buyer];
    sleep 3;
    [""] remoteExec ["hintSilent",_buyer];
}];

// Server-side: purchase utility/faction services from economy crates
missionNamespace setVariable ["LB_fnc_tryPurchaseServiceCrateServer",compileFinal {
    params ["_crate","_buyer","_serviceType","_cost"];
    if (isNull _crate) exitWith {};
    if (isNull _buyer) exitWith {};
    if (!isPlayer _buyer) exitWith {};
    if !(_serviceType isEqualType "") exitWith {};
    if !(_cost isEqualType 0) exitWith {};

    [_buyer] call (missionNamespace getVariable "LB_fnc_convertRvgMoneyPlayerServer");

    private _ok=[_buyer,_cost] call (missionNamespace getVariable "LB_fnc_trySpendServer");
    if (!_ok) exitWith {
        ["Sorry, not enough money for that service"] remoteExec ["hintSilent",_buyer];
        sleep 3;
        [""] remoteExec ["hintSilent",_buyer];
    };

    private _faction = _crate getVariable ["LB_TraderFaction", ""];
    if (_faction == "") then {
        _faction = [group _crate, ""] call (missionNamespace getVariable "LB_FacReg_Get");
    };
    private _relationByFaction = createHashMapFromArray [
        ["BB", "BB_Relation"],
        ["SU", "SU_Relation"],
        ["PF", "PF_Relation"],
        ["ALF", "ALF_Relation"],
        ["WO", "WO_Relation"],
        ["RU", "RU_Relation"],
        ["US", "US_Relation"],
        ["NH", "NH_Relation"],
        ["TRB", "TRB_Relation"],
        ["RC", "RC_Relation"],
        ["DT", "DT_Relation"],
        ["ROA", "ROA_Relation"],
        ["PMC", "PMC_Relation"],
        ["Bandit", "Bandit_Relation"]
    ];

    private _spawnEscort = {
        params ["_unit","_escortFaction","_isSpecOps"];
        private _grp = group _unit;
        private _spawnCenter = getPosATL _unit;

        for "_i" from 1 to 4 do {
            private _offset = [
                (_spawnCenter select 0) + (random 6) - 3,
                (_spawnCenter select 1) + (random 6) - 3,
                0
            ];
            private _ai = _grp createUnit ["B_G_Survivor_F", _offset, [], 0, "NONE"];
            [_escortFaction, _ai, false, true, _isSpecOps] call (missionNamespace getVariable "FN_equipAI");
            _ai setSkill ["courage", 1];
            _ai setSkill ["commanding", 1];
        };
    };

    switch (_serviceType) do {
        case "repair_vehicles_30m": {
            {
                _x setDamage 0;
                _x setFuel 1;
                _x setVehicleAmmo 1;
            } forEach ((getPosATL _buyer) nearEntities [["LandVehicle","Air","Ship"], 30]);
            ["All nearby vehicles repaired, refueled, and rearmed."] remoteExec ["hintSilent",_buyer];
        };

        case "heal_units_30m": {
            {
                _x setDamage 0;
            } forEach ((getPosATL _buyer) nearEntities [["CAManBase"], 30]);
            ["All nearby units healed."] remoteExec ["hintSilent",_buyer];
        };

        case "clear_renegade": {
            _buyer setVariable ["Renegade_Relation", false, true];
            ["Your renegade status has been removed."] remoteExec ["hintSilent",_buyer];
        };

        case "perm_friendly_trader_faction": {
            private _relationVar = _relationByFaction getOrDefault [_faction, ""];
            if (_relationVar == "") exitWith {
                [_buyer,_cost] call (missionNamespace getVariable "LB_fnc_addMoneyServer");
                ["Unable to determine this trader's faction for permanent-friendly service."] remoteExec ["hintSilent",_buyer];
            };

            private _forced = _buyer getVariable ["LB_PermanentFriendlyFactions", []];
            if !(_forced isEqualType []) then { _forced = []; };
            if !(_relationVar in _forced) then {
                _forced pushBack _relationVar;
            };
            _buyer setVariable ["LB_PermanentFriendlyFactions", _forced, true];
            _buyer setVariable [_relationVar, true, true];
            _buyer setVariable ["Renegade_Relation", false, true];
            [format ["You are now permanently friendly with %1.", _faction]] remoteExec ["hintSilent",_buyer];
        };

        case "escort_fireteam": {
            if (_faction == "") exitWith {
                [_buyer,_cost] call (missionNamespace getVariable "LB_fnc_addMoneyServer");
                ["Unable to determine this trader's faction for escort services."] remoteExec ["hintSilent",_buyer];
            };
            [_buyer, _faction, false] call _spawnEscort;
            [format ["A %1 fireteam has joined your group.", _faction]] remoteExec ["hintSilent",_buyer];
        };

        case "escort_specops_fireteam": {
            if (_faction == "") exitWith {
                [_buyer,_cost] call (missionNamespace getVariable "LB_fnc_addMoneyServer");
                ["Unable to determine this trader's faction for escort services."] remoteExec ["hintSilent",_buyer];
            };
            [_buyer, _faction, true] call _spawnEscort;
            [format ["A %1 spec ops fireteam has joined your group.", _faction]] remoteExec ["hintSilent",_buyer];
        };

        default {
            [_buyer,_cost] call (missionNamespace getVariable "LB_fnc_addMoneyServer");
            ["Unknown service requested. Purchase refunded."] remoteExec ["hintSilent",_buyer];
        };
    };

    sleep 3;
    [""] remoteExec ["hintSilent",_buyer];
}];

// 2) Server-only: initialize players and handle respawn transfer
if (isServer) then {
    missionNamespace setVariable ["LB_startingMoney",0];

    private _fn_initAll={
        private _startingMoney=missionNamespace getVariable ["LB_startingMoney",0];
        {
            [_x,_startingMoney] call (missionNamespace getVariable "LB_fnc_initPlayerMoney");
        } forEach allPlayers;
    };

    [] call _fn_initAll;

    addMissionEventHandler ["PlayerConnected",{
        params ["_id","_uid","_name","_jip","_ownerId"];
        [_uid] spawn {
            params ["_uid"];
            private _unit=objNull;
            waitUntil {
                uiSleep 0.2;
                _unit=(allPlayers select {getPlayerUID _x==_uid}) param [0,objNull];
                !isNull _unit
            };
            private _startingMoney=missionNamespace getVariable ["LB_startingMoney",0];
            [_unit,_startingMoney] call (missionNamespace getVariable "LB_fnc_initPlayerMoney");
        };
    }];

    addMissionEventHandler ["EntityRespawned",{
		params ["_newUnit","_oldUnit"];
		if (!isPlayer _newUnit) exitWith {};
		private _startingMoney=missionNamespace getVariable ["LB_startingMoney",0];
		_newUnit setVariable ["LB_money",_startingMoney,true];
	}];
};

// 3) Client-only: optional local hook
if (hasInterface) then {
    [] spawn {waitUntil {!isNull player};};
};