_group0 = createGroup [independent, true];
_group1 = createGroup [independent, true];
_group2 = createGroup [independent, true];
_group3 = createGroup [independent, true];
_group4 = createGroup [independent, true];

_object0 = _group0 createUnit ["I_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object0 setPosASL [9513.75,4288.65,37.4423];
_object0 setDir 180.108;
_object0 setRank "PRIVATE";
_object0 setSkill 0.75;
_object0 setUnitPos "Auto";
_group0 selectLeader _object0;
['_object0_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[[],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_FRITH_RUIN_SDR_Tshirt_wht",[["WBK_LampItem_Blue",1],["16Rnd_9x21_Mag",1,17]]],["rvg_legstrapbag_3",[["ACE_fieldDressing",3],["16Rnd_9x21_Mag",1,17]]],["rvg_legstrappack_1",[["ACE_personalAidKit",1],["rvg_purificationTablets",1,6],["rvg_bacon",1,1]]],"H_Bandanna_blu","rhsusf_shemagh2_white",[],["","","","","",""]],[["ace_arsenal_voice","Male06GRE"],["ace_arsenal_face","Ioannou"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object0_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object0]] call BIS_fnc_addStackedEventHandler;


_object1 = _group1 createUnit ["I_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object1 setPosASL [9548.02,4299.13,40.0737];
_object1 setDir 357.775;
_object1 setRank "PRIVATE";
_object1 setSkill 0.75;
_object1 setUnitPos "Auto";
_group1 selectLeader _object1;
['_object1_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[[],[],["hgun_ACPC2_F","","acc_flashlight_pistol","",["9Rnd_45ACP_Mag",8],[],""],["rvg_hoodie_blue",[["WBK_LampItem_Blue",1],["9Rnd_45ACP_Mag",5,8]]],["rvg_legstrapbag_4",[]],["rvg_legstrappack_3",[["rvg_frantaEmpty",1,1]]],"H_MilCap_blue","G_Respirator_white_F",[],["","","","","ItemWatch",""]],[["ace_arsenal_voice","Male03GRE"],["ace_arsenal_face","GreekHead_A3_09"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object1_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object1]] call BIS_fnc_addStackedEventHandler;


_object2 = _group1 createUnit ["I_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object2 setPosASL [9548.75,4285.97,38.4469];
_object2 setDir 36.8044;
_object2 setRank "PRIVATE";
_object2 setSkill 0.75;
_object2 setUnitPos "Auto";
['_object2_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["SMG_03C_black","","","",["50Rnd_570x28_SMG_03",47],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_wht_stk",[["WBK_LampItem_Blue",1]]],["rvg_legstrapbag_3",[["50Rnd_570x28_SMG_03",6,50]]],["rvg_legstrappack_4",[["rvg_canOpener",1,1]]],"H_Cap_blu","rhsusf_shemagh_white",[],["","","rhs_radio_R169P1","","",""]],[["ace_arsenal_voice","Male04GRE"],["ace_arsenal_face","Mavros"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object2_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object2]] call BIS_fnc_addStackedEventHandler;


_object3 = createVehicle ["Land_Sacks_heap_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object3 setVectorDirAndUp [[-0.701334,-0.70427,-0.110154],[-0.0612747,-0.0943964,0.993647]];
_object3 setPosASL [9555.98,4303.07,40.7519];


_object4 = createVehicle ["Land_CratesShabby_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object4 setVectorDirAndUp [[-0.261667,-0.95918,-0.107258],[-0.0612747,-0.0943964,0.993647]];
_object4 setPosASL [9554.54,4303.54,40.7132];


_object5 = createVehicle ["Land_WoodenBox_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object5 setVectorDirAndUp [[0.997744,0.0215746,0.0635803],[-0.061279,-0.0943643,0.99365]];
_object5 setPosASL [9555.12,4305.55,40.9299];


_object6 = createVehicle ["Land_WoodenBox_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object6 setVectorDirAndUp [[0.770482,-0.637328,-0.0130308],[-0.0612579,-0.0943724,0.99365]];
_object6 setPosASL [9556.56,4306.21,41.0815];


_object7 = createVehicle ["Land_HelipadEmpty_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object7 setVectorDirAndUp [[-0.00581006,0.995535,0.0942175],[-0.0612747,-0.0943964,0.993647]];
_object7 setPosASL [9555.98,4303.07,41.0823];


_object8 = createVehicle ["Land_Sleeping_bag_brown_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object8 setVectorDirAndUp [[-0.463354,0.883898,0.0634636],[-0.0628627,-0.10422,0.992566]];
_object8 setPosASL [9565.51,4299.88,41.0343];


_object9 = createVehicle ["Land_Sleeping_bag_brown_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object9 setVectorDirAndUp [[0.847419,-0.530924,0.000407508],[-0.0596249,-0.0944059,0.993747]];
_object9 setPosASL [9561.29,4304.4,41.2002];


_object10 = createVehicle ["Land_Sleeping_bag_brown_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object10 setVectorDirAndUp [[-0.942837,0.332477,-0.0227685],[-0.0595863,-0.100966,0.993104]];
_object10 setPosASL [9567.54,4301.43,41.2686];


_object11 = createVehicle ["Land_Campfire_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object11 setVectorDirAndUp [[-0.706613,-0.699004,-0.109967],[-0.0596155,-0.0960467,0.99359]];
_object11 setPosASL [9564.38,4302.65,41.2182];


_object12 = createVehicle ["Land_Canteen_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object12 setVectorDirAndUp [[-0.874219,-0.47569,-0.0972663],[-0.0592666,-0.0942826,0.99378]];
_object12 setPosASL [9561.54,4302.62,41.0431];


_object13 = createVehicle ["Land_Sleeping_bag_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object13 setVectorDirAndUp [[0.928162,0.360238,0.0935148],[-0.0595661,-0.104241,0.992767]];
_object13 setPosASL [9560.7,4301.9,40.9759];


_object14 = createVehicle ["Land_Sleeping_bag_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object14 setVectorDirAndUp [[0.106241,-0.990333,-0.0891804],[-0.0612651,-0.0960371,0.993491]];
_object14 setPosASL [9563.96,4306.12,41.4803];


_object15 = createVehicle ["Land_Sleeping_bag_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object15 setVectorDirAndUp [[0.329354,0.936789,0.118124],[-0.0595661,-0.104241,0.992767]];
_object15 setPosASL [9562.63,4299.77,40.8773];


_object16 = createVehicle ["Land_BagFence_Short_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object16 setVectorDirAndUp [[-0.336132,-0.935912,-0.105278],[-0.0530278,-0.0927983,0.994272]];
_object16 setPosASL [9574,4302.03,41.7107];


_object17 = createVehicle ["Land_BagFence_Short_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object17 setVectorDirAndUp [[-0.283133,-0.952249,-0.114272],[-0.0612351,-0.100956,0.993005]];
_object17 setPosASL [9572.94,4298.49,41.3206];


_object18 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object18 setVectorDirAndUp [[-0.882908,-0.460821,-0.0900984],[-0.0530278,-0.0927989,0.994272]];
_object18 setPosASL [9575.63,4300.78,41.7081];


_object19 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object19 setVectorDirAndUp [[-0.528019,0.847702,0.0509581],[-0.0530278,-0.0927989,0.994272]];
_object19 setPosASL [9575.02,4298.54,41.4195];


_object20 = createVehicle ["B_G_Offroad_01_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object20 setVectorDirAndUp [[-0.519475,0.853006,0.0502674],[-0.105843,-0.122609,0.986795]];
_object20 setPosASL [9569.97,4293.72,40.5746];
{_object20 setHitIndex [_forEachIndex, _x, false]} forEach [1,0,0,0,0,0.358775,0.599165,1,1,0,0,0,0,0,0,0,0,0,0,0,0.107874,0,0.107874,0,0.107874,0];
[_object20, ["Guerilla_10",1], ["HideDoor1",0,"HideDoor2",0,"HideDoor3",1,"HideBackpacks",1,"HideBumper1",1,"HideBumper2",1,"HideConstruction",1,"hidePolice",1,"HideServices",1,"BeaconsStart",0,"BeaconsServicesStart",0], true] call BIS_fnc_initVehicle;

clearItemCargoGlobal _object20;
clearWeaponCargoGlobal _object20;
clearMagazineCargoGlobal _object20;
clearBackpackCargoGlobal _object20;


{_object20 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object20;
{_object20 addMagazineTurret _x} forEach [];
_object21 = createVehicle ["Land_PainKillers_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object21 setVectorDirAndUp [[-0.371446,-0.9219,-0.110126],[-0.0596887,-0.0946555,0.993719]];
_object21 setPosASL [9561.59,4302.35,41.019];


_object22 = createVehicle ["Land_Matches_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object22 setVectorDirAndUp [[-0.371416,-0.921198,-0.115945],[-0.0596161,-0.100959,0.993103]];
_object22 setPosASL [9564.68,4301.69,41.1396];


_object23 = _group2 createUnit ["I_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object23 setPosASL [9564.22,4305.62,41.523];
_object23 setDir 199.946;
_object23 setRank "PRIVATE";
_object23 setSkill 0.75;
_object23 setUnitPos "Auto";
_group2 selectLeader _object23;
['_object23_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[[],[],["hgun_Rook40_F","","","",["16Rnd_9x21_Mag",16],[],""],["U_FRITH_RUIN_SDR_Tshirt_oli_bet",[["WBK_LampItem_Blue",1],["16Rnd_9x21_Mag",1,17]]],["rvg_legstrapbag_4",[["16Rnd_9x21_Mag",1,17]]],["rvg_legstrappack_1",[["rvg_canteenPurified",1,1],["rvg_beansEmpty",1,1],["rvg_baconEmpty",1,1]]],"H_MilCap_blue","G_Blindfold_01_white_F",[],["","","","","",""]],[["ace_arsenal_voice","Male06GRE"],["ace_arsenal_face","GreekHead_A3_03"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object23_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object23]] call BIS_fnc_addStackedEventHandler;


_object24 = createVehicle ["Box_FIA_Wps_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object24 setVectorDirAndUp [[0.0148311,0.995198,0.096754],[-0.0596095,-0.0957125,0.993623]];
_object24 setPosASL [9558.71,4307.22,41.3241];
_object24 setDamage 0.00423463;

clearItemCargoGlobal _object24;
clearWeaponCargoGlobal _object24;
clearMagazineCargoGlobal _object24;
clearBackpackCargoGlobal _object24;

{_object24 addItemCargoGlobal _x} forEach [["V_Rangemaster_belt",1],["H_Cap_grn",1],["rvg_bandage_3",1],["ACE_bloodIV_500",1]];
{_object24 addWeaponCargoGlobal _x} forEach [["rhs_weap_M590_8RD",1]];
{_object24 addMagazineCargoGlobal _x} forEach [["rhsusf_8Rnd_00Buck",5],["rvg_franta",1],["rvg_milk",1],["MiniGrenade",1],["rvg_matches",1],["rvg_frantaEmpty",1]];


_object25 = _group1 createUnit ["I_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object25 setPosASL [9573.7,4319.67,43.2226];
_object25 setDir 165.859;
_object25 setRank "PRIVATE";
_object25 setSkill 0.75;
_object25 setUnitPos "Auto";
['_object25_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[[],[],["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_FRITH_RUIN_SDR_Tshirt_wht",[["WBK_LampItem_Blue",1],["16Rnd_9x21_Mag",1,17]]],["rvg_legstrapbag_1",[["16Rnd_9x21_Mag",3,17]]],["rvg_legstrappack_1",[["rvg_canisterFuel",1,20]]],"H_Bandanna_blu","NeckTight_WhiteO",[],["ItemMap","","rhs_radio_R169P1","","",""]],[["ace_arsenal_voice","Male02GRE"],["ace_arsenal_face","GreekHead_A3_02"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object25_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object25]] call BIS_fnc_addStackedEventHandler;


_object26 = _group3 createUnit ["I_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object26 setPosASL [9557.38,4304.69,40.9884];
_object26 setDir 158.872;
_object26 setRank "PRIVATE";
_object26 setSkill 0.75;
_object26 setUnitPos "Auto";
_group3 selectLeader _object26;
['_object26_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[[],[],["hgun_ACPC2_F","","acc_flashlight_pistol","",["9Rnd_45ACP_Mag",7],[],""],["U_FRITH_RUIN_SDR_Tshirt_wht_fpk",[["WBK_LampItem_Blue",1],["9Rnd_45ACP_Mag",1,8]]],["rvg_rangemaster_1",[["ACE_fieldDressing",1],["9Rnd_45ACP_Mag",1,8]]],["rvg_legstrappack_4",[["rvg_frantaEmpty",1,1]]],"H_Bandanna_blu","NeckTight_WhiteCLR",[],["","","","","",""]],[["ace_arsenal_voice","Male01GRE"],["ace_arsenal_face","Ioannou"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object26_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object26]] call BIS_fnc_addStackedEventHandler;


_object27 = _group4 createUnit ["I_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object27 setPosASL [9574.46,4299.84,41.5281];
_object27 setDir 205.774;
_object27 setRank "PRIVATE";
_object27 setSkill 0.75;
_object27 setUnitPos "Auto";
_group4 selectLeader _object27;
['_object27_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["SMG_02_F","","acc_flashlight","",["30Rnd_9x21_Mag_SMG_02",15],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_wht_fpk",[["WBK_LampItem_Blue",1]]],["V_HarnessO_gry",[["30Rnd_9x21_Mag_SMG_02",6,30]]],["rvg_legstrappack_3",[["rvg_matches",1,10]]],"H_MilCap_blue","LCG_Shemagh_White",[],["","","rhsusf_radio_anprc152","","ItemWatch",""]],[["ace_arsenal_voice","Male05GRE"],["ace_arsenal_face","GreekHead_A3_09"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object27_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object27]] call BIS_fnc_addStackedEventHandler;


_object28 = _group0 createUnit ["I_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object28 setPosASL [9553.19,4315.33,41.7515];
_object28 setDir 113.22;
_object28 setRank "PRIVATE";
_object28 setSkill 0.75;
_object28 setUnitPos "Auto";
['_object28_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[[],[],["hgun_ACPC2_F","","acc_flashlight_pistol","",["9Rnd_45ACP_Mag",8],[],""],["U_FRITH_RUIN_TSH_blk_drj",[["WBK_LampItem_Blue",1],["9Rnd_45ACP_Mag",1,8]]],["rhs_6sh117_nco",[["9Rnd_45ACP_Mag",2,8]]],["rvg_legstrappack_4",[["rvg_franta",1,1],["rvg_frantaEmpty",1,1]]],"H_Bandanna_blu","PU_shemagh_WhiteO",[],["ItemMap","","","","",""]],[["ace_arsenal_voice","Male01GRE"],["ace_arsenal_face","GreekHead_A3_06"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object28_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object28]] call BIS_fnc_addStackedEventHandler;



_group0 setFormation "WEDGE";
_group0 setBehaviour "AWARE";
_group0 setCombatMode "YELLOW";
_group0 setSpeedMode "LIMITED";

_waypoint = [_group0, 0];
_waypoint setWaypointPosition [[9551.81,4318.78,42.0138], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_waypoint = _group0 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[9510.89,4326.43,40.3223], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_waypoint = _group0 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[9510.83,4279.27,36.0621], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_waypoint = _group0 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[9554.3,4259.48,35.2262], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_waypoint = _group0 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[9606.59,4275.98,41.497], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_waypoint = _group0 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[9567.69,4333.5,44.0321], -1];
_waypoint setWaypointType "CYCLE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_group0 setCurrentWaypoint [_group0, 2];

_group1 setFormation "WEDGE";
_group1 setBehaviour "AWARE";
_group1 setCombatMode "YELLOW";
_group1 setSpeedMode "LIMITED";

_waypoint = [_group1, 0];
_waypoint setWaypointPosition [[9568.97,4323.43,43.4564], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_waypoint = _group1 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[9584.13,4293.79,41.5242], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_waypoint = _group1 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[9567.46,4283.04,39.06], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_waypoint = _group1 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[9547.62,4293.89,39.4593], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_waypoint = _group1 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[9547.47,4312.28,41.3687], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_waypoint = _group1 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[9568.97,4323.43,43.4564], -1];
_waypoint setWaypointType "CYCLE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_group1 setCurrentWaypoint [_group1, 4];

_group2 setFormation "WEDGE";
_group2 setBehaviour "AWARE";
_group2 setCombatMode "YELLOW";
_group2 setSpeedMode "NORMAL";

_waypoint = [_group2, 0];
_waypoint setWaypointPosition [[9561.36,4311.54,41.8856], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_group2 setCurrentWaypoint [_group2, 1];

_group3 setFormation "WEDGE";
_group3 setBehaviour "AWARE";
_group3 setCombatMode "YELLOW";
_group3 setSpeedMode "NORMAL";

_waypoint = [_group3, 0];
_waypoint setWaypointPosition [[9565.95,4317.81,42.7537], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_group3 setCurrentWaypoint [_group3, 1];

_group4 setFormation "WEDGE";
_group4 setBehaviour "AWARE";
_group4 setCombatMode "YELLOW";
_group4 setSpeedMode "NORMAL";

_waypoint = [_group4, 0];
_waypoint setWaypointPosition [[9566.09,4313.69,42.3703], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_group4 setCurrentWaypoint [_group4, 1];


