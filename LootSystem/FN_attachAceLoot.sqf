/*
  Client-only. Scans for helpers and attaches ACE actions.
  Fixes:
    - Late clients can still attach actions after state flips to 4/5
    - Garbage search becomes permanently spent (interactionPoint=6 replicated) so JIP cannot re-add
    - Uses per-client local flags to prevent duplicate action adds
    - Removes redundant removeAction call
*/
if (!hasInterface) exitWith {};

// Loot location action
private _aceActionLoot = [
    "ace_garbage_search",
    "Search the garbage pile",
    "",
    {
        params ["_target","_player","_params"];

        // Server-side work
        [_player] remoteExec ["LB_fnc_spawnLootGround",2];

        // Permanently mark as spent for everyone (and JIP)
        _target setVariable ["interactionPoint",6,true];

        // Remove the action globally (covers local too)
        [_target,0,["ACE_MainActions","ace_garbage_search"]] remoteExec ["ace_interact_menu_fnc_removeActionFromObject",0,true];
    },
    // Available only when interactable and not spent
    { (_target getVariable ["interactionPoint",-1]) isEqualTo 4 },
    nil,
    3
] call ace_interact_menu_fnc_createAction;

// Refill water container action
private _aceActionRefill = [
    "ace_water_refill",
    "Refill Water Source",
    "",
    {
        params ["_target","_player","_params"];
        [_player] remoteExec ["LB_fnc_refillCanteen",2];
    },
    { (_target getVariable ["interactionPoint",-1]) isEqualTo 5 },
    nil,
    3
] call ace_interact_menu_fnc_createAction;

// Drink water action
private _aceActionDrink = [
    "ace_water_drink",
    "Drink From Water Source",
    "",
    {
        params ["_target","_player","_params"];
        [_player] remoteExec ["LB_fnc_drinkFromWaterSource",2];
    },
    { (_target getVariable ["interactionPoint",-1]) isEqualTo 5 },
    nil,
    3
] call ace_interact_menu_fnc_createAction;

// Attach ACE action to helpers in range
private _attach = {
    params ["_h"];

    private _ip = _h getVariable ["interactionPoint",-1];

    // Garbage: attach for both initial(0) and armed(4) state, but never if spent(6)
    if ((_ip in [0,4]) && !(_h getVariable ["lb_lootActionAdded",false])) then {
        [_h,0,["ACE_MainActions"],_aceActionLoot] call ace_interact_menu_fnc_addActionToObject;
        _h setVariable ["lb_lootActionAdded",true,false]; // local per client

        // Only the first client that sees 0 should arm it; late clients seeing 4 do nothing
        if (_ip isEqualTo 0) then {
            _h setVariable ["interactionPoint",4,true];
        };
    };

    // If it's spent, make sure local add flag doesn't prevent future helpers reuse (optional safety)
    if (_ip isEqualTo 6) then {
        // Nothing to add, loot is permanently disabled
    };

    // Water: attach for both initial(1) and armed(5) state
    if ((_ip in [1,5]) && !(_h getVariable ["lb_waterActionsAdded",false])) then {
        [_h,0,["ACE_MainActions"],_aceActionRefill] call ace_interact_menu_fnc_addActionToObject;
        [_h,0,["ACE_MainActions"],_aceActionDrink] call ace_interact_menu_fnc_addActionToObject;
        _h setVariable ["lb_waterActionsAdded",true,false]; // local per client

        if (_ip isEqualTo 1) then {
            _h setVariable ["interactionPoint",5,true];
        };
    };
};

while {true} do {
    private _helpers = nearestObjects [player,["Land_HelipadEmpty_F"],300];
    { [_x] call _attach; uiSleep 0.01; } forEach _helpers;
    uiSleep 15;
};