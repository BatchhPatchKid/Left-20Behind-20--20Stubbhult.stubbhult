_group0 = createGroup [west, true];
_group1 = createGroup [west, true];
_group2 = createGroup [west, true];

_object0 = createVehicle ["Land_CampingTable_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object0 setVectorDirAndUp [[-0.961475,-0.274891,1.54878e-06],[-0.000110443,0.000391927,1]];
_object0 setPosASL [10865.1,3782.1,17.4366];


_object1 = createVehicle ["Flag_Red_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object1 setVectorDirAndUp [[0.192385,0.980998,0.0251052],[-0.104424,-0.0049724,0.99452]];
_object1 setPosASL [10869.7,3774.91,17.2986];


_object2 = _group0 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object2 setPosASL [10864.8,3783.77,17.4409];
_object2 setDir 139.875;
_object2 setRank "PRIVATE";
_object2 setSkill 0.75;
_object2 setUnitPos "Auto";
_group0 selectLeader _object2;
['_object2_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["SMG_03C_black","","","",["50Rnd_570x28_SMG_03",50],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_oli_bet",[["WBK_HeadLampItem_Double",1]]],["rhs_chicom",[["50Rnd_570x28_SMG_03",2,50]]],["rvg_legstrappack_2",[["rvg_frantaEmpty",1,1]]],"H_Cap_Orange_IDAP_F","G_AirPurifyingRespirator_01_F",[],["","","","","ItemWatch",""]],[["ace_arsenal_voice","Male12ENG"],["ace_arsenal_face","GreekHead_A3_01"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object2_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object2]] call BIS_fnc_addStackedEventHandler;


_object3 = _group1 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object3 setPosASL [10851.8,3760.98,15.0231];
_object3 setDir 164.325;
_object3 setRank "PRIVATE";
_object3 setSkill 0.75;
_object3 setUnitPos "Auto";
['_object3_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhs_weap_M590_8RD","","","",["rhsusf_8Rnd_00Buck",8],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_cry",[["WBK_HeadLampItem_Double",1]]],["rvg_rangemaster_4",[["ACE_fieldDressing",2],["rvg_money",5,1],["rhsusf_8Rnd_00Buck",5,8]]],["rvg_assault",[["rhsusf_8Rnd_00Buck",1,8],["rvg_canOpener",1,1],["rvg_canteenEmpty",1,1]]],"H_Bandanna_surfer_grn","G_RegulatorMask_F",[],["","","TFAR_rf7800str","","",""]],[["ace_arsenal_voice","Male08ENG"],["ace_arsenal_face","Ioannou"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object3_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object3]] call BIS_fnc_addStackedEventHandler;


_object4 = _group2 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object4 setPosASL [10865.9,3782.22,17.4417];
_object4 setDir 296.824;
_object4 setRank "PRIVATE";
_object4 setSkill 0.75;
_object4 setUnitPos "Auto";
_group2 selectLeader _object4;
['_object4_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["SMG_02_F","","acc_flashlight","",["30Rnd_9x21_Mag_SMG_02",30],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_wht_fpk",[["WBK_HeadLampItem_Double",1]]],["rvg_legstrapbag_4",[["30Rnd_9x21_Mag_SMG_02",4,30]]],["rvg_legstrappack_4",[["rvg_purificationTablets",1,6]]],"H_Watchcap_khk","G_AirPurifyingRespirator_02_olive_F",[],["","","TFAR_anprc154","","",""]],[["ace_arsenal_voice","Male02ENG"],["ace_arsenal_face","GreekHead_A3_08"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object4_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object4]] call BIS_fnc_addStackedEventHandler;


_object5 = _group1 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object5 setPosASL [10851.8,3758.2,14.9629];
_object5 setDir 85.621;
_object5 setRank "PRIVATE";
_object5 setSkill 0.75;
_object5 setUnitPos "Auto";
['_object5_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["hgun_PDW2000_F","","","",["30Rnd_9x21_Mag",30],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_blk_drj",[["WBK_HeadLampItem_Double",1]]],["rvg_legstrapbag_2",[["30Rnd_9x21_Mag",3,30]]],["rvg_legstrappack_2",[["rvg_plasticBottleEmpty",2,1]]],"H_HeadBandage_stained_F","Mask_M40_OD",[],["ItemMap","","","","",""]],[["ace_arsenal_voice","Male10ENG"],["ace_arsenal_face","GreekHead_A3_07"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object5_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object5]] call BIS_fnc_addStackedEventHandler;


_object6 = _group1 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object6 setPosASL [10868.8,3758.36,16.4131];
_object6 setDir 73.8385;
_object6 setRank "PRIVATE";
_object6 setSkill 0.75;
_object6 setUnitPos "Auto";
_group1 selectLeader _object6;
['_object6_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhsusf_weap_MP7A2","","acc_flashlight","",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_blk_drj",[["WBK_HeadLampItem_Double",1]]],["rvg_legstrapbag_4",[["rhsusf_mag_40Rnd_46x30_FMJ",5,40]]],["rvg_legstrappack_1",[["rvg_matches",1,10],["rvg_canteenEmpty",1,1]]],"H_ShemagOpen_tan","G_RegulatorMask_F",[],["","","","ItemCompass","",""]],[["ace_arsenal_voice","Male07ENG"],["ace_arsenal_face","GreekHead_A3_06"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object6_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object6]] call BIS_fnc_addStackedEventHandler;


_object7 = createVehicle ["Item_Laptop_Unfolded", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object7 setVectorDirAndUp [[-0.618668,-0.782457,-0.0707835],[-0.0929169,-0.0165923,0.995536]];
_object7 setPosASL [10865.1,3781.64,18.2515];

clearItemCargoGlobal _object7;
clearWeaponCargoGlobal _object7;
clearMagazineCargoGlobal _object7;
clearBackpackCargoGlobal _object7;

{_object7 addMagazineCargoGlobal _x} forEach [["Laptop_Unfolded",1]];



_group0 setFormation "WEDGE";
_group0 setBehaviour "AWARE";
_group0 setCombatMode "YELLOW";
_group0 setSpeedMode "NORMAL";

_waypoint = [_group0, 0];
_waypoint setWaypointPosition [[10829,3788.74,15.5479], -1];
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

_group0 setCurrentWaypoint [_group0, 1];

_group1 setFormation "COLUMN";
_group1 setBehaviour "SAFE";
_group1 setCombatMode "YELLOW";
_group1 setSpeedMode "LIMITED";

_waypoint = [_group1, 0];
_waypoint setWaypointPosition [[10845.7,3787.65,16.0079], -1];
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
_waypoint setWaypointPosition [[10849.1,3757.14,14.949], -1];
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
_waypoint setWaypointPosition [[10875.5,3763.69,17.2646], -1];
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
_waypoint setWaypointPosition [[10863.8,3796.2,17.0526], -1];
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
_waypoint setWaypointPosition [[10845.7,3787.65,16.0079], -1];
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

_group1 setCurrentWaypoint [_group1, 2];

_group2 setFormation "WEDGE";
_group2 setBehaviour "AWARE";
_group2 setCombatMode "YELLOW";
_group2 setSpeedMode "NORMAL";

_waypoint = [_group2, 0];
_waypoint setWaypointPosition [[10825.2,3788.19,15.3672], -1];
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

missionNamespace setVariable ["LBMQ_task001Representative", _object2, true];
missionNamespace setVariable ["LBMQ_task001CampCenter", _object0, true];
missionNamespace setVariable ["LBMQ_task001RedFlag", _object1, true];
missionNamespace setVariable ["LBMQ_task001CampUnits", [_object2, _object3, _object4, _object5, _object6], true];