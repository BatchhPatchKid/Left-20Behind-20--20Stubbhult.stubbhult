params ["_faction", "_trigger"];

if (isServer) then {
	[_faction, _trigger] spawn {
        params ["_faction", "_trigger"];

        private _grpTrader = createGroup WEST;
        [_grpTrader, _faction] call (missionNamespace getVariable "LB_FacReg_Set");

        private _trader = _grpTrader createUnit ["B_G_Survivor_F", (getPos _trigger), [], 1, "NONE"];
        [_faction, _trader, false, true, false] call (missionNamespace getVariable "FN_equipAI");
        _trader disableAI "ANIM";
        removeBackpackGlobal _trader;
        _trader setVariable ["LB_traderFaction", _faction, true];

        private _refreshTraderAccessForPlayer = missionNamespace getVariable "FN_refreshTraderAccessForPlayer";

        {
            if (_x inArea _trigger) then {
                [_trader, _faction, _x] call _refreshTraderAccessForPlayer;
            };
        } forEach allPlayers;

        private _entryEH = addMissionEventHandler ["EntityEnteredArea", {
            params ["_entity", "_area"];

            if (!isPlayer _entity) exitWith {};
            if (!(_area isEqualTo _trigger)) exitWith {};
            if (isNull _trader || !alive _trader) exitWith {};

            [_trader, _faction, _entity] call _refreshTraderAccessForPlayer;
        }];

        private _exitEH = addMissionEventHandler ["EntityLeftArea", {
            params ["_entity", "_area"];

            if (!isPlayer _entity) exitWith {};
            if (!(_area isEqualTo _trigger)) exitWith {};
            if (isNull _trader) exitWith {};

            [_trader] remoteExec ["FN_removeTraderActionsLocal", _entity];
        }];

        private _wp1 = _grpTrader addWaypoint [(getPos _trigger), 0];
        _wp1 setWaypointType "HOLD";
        _grpTrader enableGunLights "ForceOn";

        _trader addEventHandler ["Killed", {
            params ["_unit", "_killer", "_instigator"];
            if (isPlayer _killer) then {
                _killer setVariable ["SU_Relation", false, true];
                _killer setVariable ["BB_Relation", false, true];
                _killer setVariable ["PF_Relation", false, true];
                _killer setVariable ["ALF_Relation", false, true];
                _killer setVariable ["WO_Relation", false, true];
                _killer setVariable ["RU_Relation", false, true];
                _killer setVariable ["US_Relation", false, true];
                _killer setVariable ["NH_Relation", false, true];
                _killer setVariable ["TRB_Relation", false, true];
                _killer setVariable ["RC_Relation", false, true];
                _killer setVariable ["DT_Relation", false, true];
                _killer setVariable ["ROA_Relation", false, true];
                _killer setVariable ["PMC_Relation", false, true];
                _killer setVariable ["Bandit_Relation", false, true];
                _killer setVariable ["Renegade_Relation", true, true];

                hintSilent parseText format ["<t size='1.25' color='#ff0000'> *ATTENTION*<br/><br/></t><t>Trader has been killed by %1. %1 is now a renegade.</t>", (name _killer)];

                {
                    if (_x inArea [_killer, 100, 100, 0, false]) then {
                        _x allowDamage true;
                    };
                } forEach allPlayers;

                private _units = nearestObjects [player, ["CAManBase"], 100];
                private _aiUnits = [];

                {
                    if (!isPlayer _x && alive _x) then {
                        _aiUnits pushBack _x;
                    };
                } forEach _units;

                if (count _aiUnits != 0) then {
                    private _grpBetray = _aiUnits joinSilent createGroup independent;
                    private _wpBetray = _grpBetray addWaypoint [(getPos _killer), 0];
                    _wpBetray setWaypointType "MOVE";
                };
            };
        }];

        while {true} do {
            private _playerInside = false;
            {
                if (_x inArea _trigger) then {
                    _playerInside = true;
                };
                sleep 0.01;
            } forEach allPlayers;

            if (!_playerInside) then {
                removeMissionEventHandler ["EntityEnteredArea", _entryEH];
                removeMissionEventHandler ["EntityLeftArea", _exitEH];
                deleteVehicle _trader;
                break;
            };

            sleep 5;
        };
    };
};