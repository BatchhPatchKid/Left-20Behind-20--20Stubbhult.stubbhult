params ["_container"];

if (isNull _container) exitWith {};

private _existingActions = _container getVariable ["LB_traderActionIds", []];
{
    _container removeAction _x;
} forEach _existingActions;
_container setVariable ["LB_traderActionIds", []];

if (isNull (unitBackpack _container)) then {
    _container addBackpack "B_Carryall_cbr";
};
clearAllItemsFromBackpack _container;

private _actionIds = [];

// Tasks
_actionIds pushBack (_container addAction ["ACCESS TASK CATALOGUE", "Economy System\\traderTasks.sqf", [], 1.5, true, false, "", "true", 3]);

// Purchasing
_actionIds pushBack (_container addAction ["--------------PURCHASING MENU--------------", {}, [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS CLOTHING CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_clothing.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS CHEST RIG CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_chestRig.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS BACKPACK CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_backPack.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS PRIMARY WEAPON CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_primary.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS SIDEARM CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_sidearms.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS LAUNCHER CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_launchers.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS AMMO CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_mags.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS OPTIC CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_optics.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS RAIL ATTACHMENT CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_rail.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS MUZZLE ATTACHMENT CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_muzzle.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS UNDERRAIL ATTACHMENT CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_UNDERRAIL.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS GRENADES CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_GRENADES.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS EXPLOSIVES CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_EXPLOSIVE.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS NVG CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_NVG.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS BINO CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_BINO.sqf", [], 1.5, true, false, "", "true", 3]);
_actionIds pushBack (_container addAction ["ACCESS MISC. CATALOGUE", "Economy System\\functions\\actionFunctions\\FN_MISC.sqf", [], 1.5, true, false, "", "true", 3]);

// Reset Menu
_actionIds pushBack (_container addAction ["RESET CATALOGUES", "Economy System\\functions\\actionFunctions\\FN_ResetMenu.sqf", [], 1.5, true, false, "", "true", 3]);

_container setVariable ["LB_traderActionIds", _actionIds];