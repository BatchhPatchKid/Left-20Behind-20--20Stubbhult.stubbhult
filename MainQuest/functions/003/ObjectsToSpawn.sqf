_group0 = createGroup [west, true];
_group1 = createGroup [west, true];
_group2 = createGroup [west, true];
_group3 = createGroup [west, true];
_group4 = createGroup [west, true];
_group5 = createGroup [west, true];
_group6 = createGroup [west, true];
_group7 = createGroup [west, true];
_group8 = createGroup [west, true];

_object0 = _group0 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object0 setPosASL [10985.3,4025.53,21.4535];
_object0 setDir 333.647;
_object0 setRank "PRIVATE";
_object0 setSkill 0.75;
_object0 setUnitPos "Auto";
['_object0_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["sgun_HunterShotgun_01_F","","","",["2Rnd_12Gauge_Pellets",2],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_blk_cyp",[["WBK_HeadLampItem_Double",1],["2Rnd_12Gauge_Pellets",1,2]]],["rhs_6sh92",[["2Rnd_12Gauge_Pellets",1,2]]],["rvg_legstrappack_4",[["rvg_plasticBottle",1,1],["rvg_matches",1,10]]],"H_Bandanna_cbr","G_AirPurifyingRespirator_02_black_F",[],["","","","ItemCompass","",""]],[["ace_arsenal_voice","Male11ENG"],["ace_arsenal_face","GreekHead_A3_08"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object0_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object0]] call BIS_fnc_addStackedEventHandler;


_object1 = _group0 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object1 setPosASL [10979,4038.97,21.8161];
_object1 setDir 358.954;
_object1 setRank "PRIVATE";
_object1 setSkill 0.75;
_object1 setUnitPos "Auto";
_group0 selectLeader _object1;
['_object1_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["sgun_HunterShotgun_01_sawedoff_F","","","",["2Rnd_12Gauge_Pellets",2],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_wht_fpk",[["WBK_HeadLampItem_Double",1],["2Rnd_12Gauge_Pellets",1,2]]],["rvg_legstrapbag_4",[["ACE_fieldDressing",5],["rvg_money",2,1],["2Rnd_12Gauge_Pellets",1,2]]],["rvg_legstrappack_3",[["rvg_spiritEmpty",1,1],["rvg_money",1,1]]],"H_Cap_khaki_specops_UK","G_AirPurifyingRespirator_01_F",[],["","","","ItemCompass","",""]],[["ace_arsenal_voice","Male03ENG"],["ace_arsenal_face","GreekHead_A3_03"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object1_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object1]] call BIS_fnc_addStackedEventHandler;


_object2 = _group0 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object2 setPosASL [10986.1,4035.73,22.1637];
_object2 setDir 345.733;
_object2 setRank "PRIVATE";
_object2 setSkill 0.75;
_object2 setUnitPos "Auto";
['_object2_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhs_weap_aks74u","rhs_acc_pgs64_74u","","",["rhs_30Rnd_545x39_7N6M_AK",30],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_wht_stk",[["WBK_HeadLampItem_Double",1]]],["rvg_legstrapbag_2",[["rvg_money",4,1],["rhs_30Rnd_545x39_7N6M_AK",7,30]]],["B_LegStrapBag_olive_F",[["rvg_guttingKnife",1,1]]],"H_Cap_usblack","G_AirPurifyingRespirator_02_sand_F",[],["ItemMap","","","","",""]],[["ace_arsenal_voice","Male01ENG"],["ace_arsenal_face","GreekHead_A3_06"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object2_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object2]] call BIS_fnc_addStackedEventHandler;


_object3 = createVehicle ["Campfire_burning_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object3 setVectorDirAndUp [[9.68947e-05,0.999999,0.00166105],[0.0582343,-0.00166387,0.998302]];
_object3 setPosASL [11066.9,4031.98,19.0682];


_object4 = createVehicle ["CamoNet_BLUFOR_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object4 setVectorDirAndUp [[9.68947e-05,0.999999,0.00166105],[0.0582343,-0.00166387,0.998302]];
_object4 setPosASL [11067,4031.99,19.068];


_object5 = createVehicle ["rvg_dome_tent_gry", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object5 setVectorDirAndUp [[0.921314,0.385177,-0.0531014],[0.0582343,-0.00166388,0.998302]];
_object5 setPosASL [11068.1,4029.79,18.9972];

clearItemCargoGlobal _object5;
clearWeaponCargoGlobal _object5;
clearMagazineCargoGlobal _object5;
clearBackpackCargoGlobal _object5;

{_object5 addMagazineCargoGlobal _x} forEach [["rvg_purificationTablets",2],["rvg_canteenEmpty",1],["rvg_beans",1]];


_object6 = createVehicle ["Land_WoodenTable_02_large_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object6 setVectorDirAndUp [[-0.217319,-0.976034,0.0114124],[0.0598923,-0.00166371,0.998204]];
_object6 setPosASL [11061.7,4030.78,19.3802];


_object7 = createVehicle ["Land_Map_altis_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object7 setVectorDirAndUp [[0.467106,0.884201,0],[0,0,1]];
_object7 setPosASL [11061.9,4031.58,20.3551];


_object8 = _group1 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object8 setPosASL [11072.9,4031.49,18.7177];
_object8 setDir 48.4611;
_object8 setRank "PRIVATE";
_object8 setSkill 0.75;
_object8 setUnitPos "Auto";
_group1 selectLeader _object8;
['_object8_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhs_weap_m16a4_carryhandle","","acc_flashlight","rhsusf_acc_RM05",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_oli_bet",[["WBK_HeadLampItem_Double",1]]],["FRITH_ruin_vestia_ghm",[["rvg_money",4,1],["rhs_mag_30Rnd_556x45_M855A1_Stanag",7,30]]],["B_Kitbag_mcamo",[["ACE_plasmaIV_500",1],["rvg_spirit",1,1],["rvg_milk",1,1],["rvg_purificationTablets",1,6]]],"rhsusf_ach_helmet_headset_ucp","G_AirPurifyingRespirator_02_olive_F",[],["ItemMap","","TFAR_anprc154","ItemCompass","ItemWatch",""]],[["ace_arsenal_voice","Male04ENG"],["ace_arsenal_face","GreekHead_A3_08"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object8_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object8]] call BIS_fnc_addStackedEventHandler;


_object9 = _group2 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object9 setPosASL [11075.7,4019.13,18.5356];
_object9 setDir 56.0012;
_object9 setRank "PRIVATE";
_object9 setSkill 0.75;
_object9 setUnitPos "Auto";
['_object9_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["SMG_03C_black","","","",["50Rnd_570x28_SMG_03",50],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_wht_fpk",[["WBK_HeadLampItem_Double",1]]],["rvg_rangemaster_2",[["50Rnd_570x28_SMG_03",4,50]]],["rvg_legstrappack_4",[["ACE_bodyBag",1],["rvg_flare",1,1],["50Rnd_570x28_SMG_03",1,50]]],"H_Watchcap_cbr","G_RegulatorMask_F",[],["","","TFAR_anprc154","","",""]],[["ace_arsenal_voice","Male05ENG"],["ace_arsenal_face","GreekHead_A3_01"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object9_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object9]] call BIS_fnc_addStackedEventHandler;


_object10 = _group2 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object10 setPosASL [11072.7,4026.3,18.7236];
_object10 setDir 54.5393;
_object10 setRank "PRIVATE";
_object10 setSkill 0.75;
_object10 setUnitPos "Auto";
['_object10_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhs_weap_M590_8RD","","","",["rhsusf_8Rnd_00Buck",8],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_blk_boy",[["WBK_HeadLampItem_Double",1]]],["rvg_rangemaster_4",[["rhsusf_8Rnd_00Buck",3,8]]],["rvg_assault",[["rvg_flare",1,1],["rvg_tire",1,1]]],"H_Cap_blk_Raven","G_AirPurifyingRespirator_02_olive_F",[],["ItemMap","","","","",""]],[["ace_arsenal_voice","Male03ENG"],["ace_arsenal_face","Ioannou"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object10_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object10]] call BIS_fnc_addStackedEventHandler;


_object11 = _group2 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object11 setPosASL [11077.5,4026.8,18.4416];
_object11 setDir 356.342;
_object11 setRank "PRIVATE";
_object11 setSkill 0.75;
_object11 setUnitPos "Auto";
_group2 selectLeader _object11;
['_object11_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhs_weap_M590_8RD","","","",["rhsusf_8Rnd_00Buck",8],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_wht_stk",[["WBK_HeadLampItem_Double",1]]],["rvg_rangemaster_2",[["ACE_fieldDressing",2],["rvg_money",3,1],["rhsusf_8Rnd_00Buck",2,8]]],["rvg_legstrappack_4",[["RyanZombiesAntiVirusCure_Item",1],["rvg_spirit",1,1],["rvg_notepad",1,1],["rvg_purificationTablets",1,6]]],"H_Cap_blk","G_RegulatorMask_F",[],["ItemMap","","","","",""]],[["ace_arsenal_voice","Male11ENG"],["ace_arsenal_face","GreekHead_A3_02"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object11_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object11]] call BIS_fnc_addStackedEventHandler;


_object12 = _group2 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object12 setPosASL [11075.6,4021.29,18.5487];
_object12 setDir 125.194;
_object12 setRank "PRIVATE";
_object12 setSkill 0.75;
_object12 setUnitPos "Auto";
['_object12_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhs_weap_aks74u","rhs_acc_pgs64_74u","","",["rhs_30Rnd_545x39_7N6M_AK",30],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_wht_stk",[["WBK_HeadLampItem_Double",1]]],["rvg_legstrapbag_1",[["rhs_30Rnd_545x39_7N6M_AK",5,30]]],["rvg_legstrappack_2",[["ACE_plasmaIV_500",1],["rvg_spiritEmpty",1,1]]],"H_Bandanna_sand","Mask_M40",[],["","","","ItemCompass","",""]],[["ace_arsenal_voice","Male05ENG"],["ace_arsenal_face","GreekHead_A3_09"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object12_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object12]] call BIS_fnc_addStackedEventHandler;


_object13 = _group3 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object13 setPosASL [11070.4,4011,18.8376];
_object13 setDir 273.744;
_object13 setRank "PRIVATE";
_object13 setSkill 0.75;
_object13 setUnitPos "Auto";
['_object13_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhs_weap_ak74n","rhs_acc_dtk1983","","",["rhs_30Rnd_545x39_7N6M_AK",30],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_blk_drj",[["WBK_HeadLampItem_Double",1]]],["rvg_legstrapbag_1",[["rvg_money",5,1],["rhs_30Rnd_545x39_7N6M_AK",6,30]]],["rvg_legstrappack_1",[["rvg_purificationTablets",1,6]]],"rvg_bandage_3","Mask_M50",[],["","","TFAR_anprc152","","",""]],[["ace_arsenal_voice","Male03ENG"],["ace_arsenal_face","GreekHead_A3_09"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object13_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object13]] call BIS_fnc_addStackedEventHandler;


_object14 = _group3 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object14 setPosASL [11065.3,4007.12,19.1357];
_object14 setDir 245.029;
_object14 setRank "PRIVATE";
_object14 setSkill 0.75;
_object14 setUnitPos "Auto";
_group3 selectLeader _object14;
['_object14_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["SMG_03C_black","","","",["50Rnd_570x28_SMG_03",50],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_wht_fpk",[["WBK_HeadLampItem_Double",1]]],["rvg_rangemaster_4",[["50Rnd_570x28_SMG_03",1,50]]],["rvg_legstrappack_1",[["rvg_flare",1,1],["rvg_money",1,1],["rvg_docFolder",1,1]]],"rhs_beanie_green","Mask_M40",[],["","","","","",""]],[["ace_arsenal_voice","Male08ENG"],["ace_arsenal_face","GreekHead_A3_03"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object14_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object14]] call BIS_fnc_addStackedEventHandler;


_object15 = createVehicle ["Land_Mound01_8m_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object15 setVectorDirAndUp [[0.0491253,-0.998782,-0.00453032],[0.0582343,-0.00166387,0.998302]];
_object15 setPosASL [11066.7,4035.38,19.084];


_object16 = createVehicle ["rvg_dome_tent_gry", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object16 setVectorDirAndUp [[-0.862364,0.503699,0.0511441],[0.0582343,-0.00166387,0.998302]];
_object16 setPosASL [11068.3,4034.19,18.9872];

clearItemCargoGlobal _object16;
clearWeaponCargoGlobal _object16;
clearMagazineCargoGlobal _object16;
clearBackpackCargoGlobal _object16;

{_object16 addMagazineCargoGlobal _x} forEach [["rvg_purificationTablets",2],["rvg_canteenEmpty",1],["rvg_beans",1]];


_object17 = createVehicle ["Land_WoodPile_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object17 setVectorDirAndUp [[-0.643301,-0.764703,0.0373236],[0.0598923,-0.00166371,0.998204]];
_object17 setPosASL [11062.3,4033.58,19.3365];


_object18 = _group1 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object18 setPosASL [11064.9,4032.01,19.1898];
_object18 setDir 93.4611;
_object18 setRank "PRIVATE";
_object18 setSkill 0.75;
_object18 setUnitPos "Middle";
['_object18_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhs_weap_m16a4_carryhandle_M203","","acc_flashlight","rhsusf_acc_RX01_NoFilter_tan",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],["UGL_FlareWhite_F",1],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_blk_boy",[["WBK_HeadLampItem_Double",1]]],["FRITH_ruin_vestia_lite_ghm",[["rvg_money",1,1],["rhs_mag_30Rnd_556x45_M855A1_Stanag",4,30]]],["rvg_legstrappack_4",[["ACE_splint",1],["rvg_spirit",1,1],["rvg_beans",1,1],["1Rnd_HE_Grenade_shell",3,1]]],"rhsusf_ach_helmet_ucp_alt","G_AirPurifyingRespirator_02_olive_F",[],["ItemMap","","TFAR_anprc154","ItemCompass","ItemWatch",""]],[["ace_arsenal_voice","Male01ENG"],["ace_arsenal_face","GreekHead_A3_06"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object18_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object18]] call BIS_fnc_addStackedEventHandler;


_object19 = _group4 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object19 setPosASL [11086.6,4037.35,17.9151];
_object19 setDir 114.462;
_object19 setRank "PRIVATE";
_object19 setSkill 0.75;
_object19 setUnitPos "Auto";
_group4 selectLeader _object19;
['_object19_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhsusf_weap_MP7A2","","acc_flashlight","",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_cry",[["WBK_HeadLampItem_Double",1]]],["rhs_vydra_3m",[["rhsusf_mag_40Rnd_46x30_FMJ",8,40]]],["rvg_legstrappack_3",[["HandGrenade",1,1],["rvg_beansEmpty",1,1],["rvg_matches",1,10]]],"H_Bandanna_sand","G_AirPurifyingRespirator_01_F",[],["","","TFAR_fadak","","ItemWatch",""]],[["ace_arsenal_voice","Male06ENG"],["ace_arsenal_face","GreekHead_A3_05"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object19_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object19]] call BIS_fnc_addStackedEventHandler;


_object20 = _group5 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object20 setPosASL [11087.1,4034.39,17.8778];
_object20 setDir 91.682;
_object20 setRank "PRIVATE";
_object20 setSkill 0.75;
_object20 setUnitPos "Auto";
_group5 selectLeader _object20;
['_object20_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhs_weap_M590_8RD","","","",["rhsusf_8Rnd_00Buck",8],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_wht_zap",[["WBK_HeadLampItem_Double",1]]],["rvg_rangemaster_3",[["ACE_fieldDressing",3],["rhsusf_8Rnd_00Buck",2,8]]],["rvg_legstrappack_4",[["ACE_bloodIV_250",1],["rvg_bacon",1,1]]],"rvg_bandage_3","G_AirPurifyingRespirator_02_sand_F",[],["","","TFAR_pnr1000a","","ItemWatch",""]],[["ace_arsenal_voice","Male08ENG"],["ace_arsenal_face","Ioannou"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object20_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object20]] call BIS_fnc_addStackedEventHandler;


_object21 = createVehicle ["Land_MedicalTent_01_white_generic_open_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object21 setVectorDirAndUp [[-0.971157,-0.231708,0.0562647],[0.0582343,-0.00166387,0.998302]];
_object21 setPosASL [11092.3,4037.17,17.5817];


_object22 = _group6 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object22 setPosASL [11096.8,4038.34,17.3116];
_object22 setDir 271.386;
_object22 setRank "PRIVATE";
_object22 setSkill 0.75;
_object22 setUnitPos "Auto";
_group6 selectLeader _object22;
['_object22_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhs_weap_M590_5RD","","","",["rhsusf_5Rnd_00Buck",5],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_wht",[["WBK_HeadLampItem_Double",1],["rhsusf_5Rnd_00Buck",1,5]]],["rvg_rangemaster_2",[["rhsusf_5Rnd_00Buck",4,5]]],["rvg_legstrappack_2",[["rvg_matches",1,10]]],"rhs_beanie","G_AirPurifyingRespirator_01_F",[],["","","","","",""]],[["ace_arsenal_voice","Male08ENG"],["ace_arsenal_face","GreekHead_A3_02"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object22_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object22]] call BIS_fnc_addStackedEventHandler;


_object23 = createVehicle ["Land_CampingTable_white_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object23 setVectorDirAndUp [[-0.95645,-0.286602,0.0553465],[0.0582624,-0.00164923,0.9983]];
_object23 setPosASL [11092.9,4037.47,17.5417];


_object24 = _group7 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object24 setPosASL [11093.4,4036.12,17.5117];
_object24 setDir 343.25;
_object24 setRank "PRIVATE";
_object24 setSkill 0.75;
_object24 setUnitPos "Auto";
_group7 selectLeader _object24;
['_object24_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["sgun_HunterShotgun_01_sawedoff_F","","","",["2Rnd_12Gauge_Pellets",2],[],""],[],[],["U_FRITH_RUIN_SDR_Tshirt_wht_zap",[["WBK_HeadLampItem_Double",1],["2Rnd_12Gauge_Pellets",1,2]]],["rvg_rangemaster_1",[["2Rnd_12Gauge_Pellets",3,2]]],["rvg_legstrappack_2",[["rvg_canOpener",1,1],["rvg_matches",1,10]]],"H_HeadBandage_bloody_F","G_AirPurifyingRespirator_02_sand_F",[],["","","","","",""]],[["ace_arsenal_voice","Male01ENG"],["ace_arsenal_face","GreekHead_A3_09"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object24_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object24]] call BIS_fnc_addStackedEventHandler;


_object25 = _group8 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object25 setPosASL [11093.9,4037.84,17.486];
_object25 setDir 226.88;
_object25 setRank "PRIVATE";
_object25 setSkill 0.75;
_object25 setUnitPos "Auto";
_group8 selectLeader _object25;
['_object25_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhs_weap_M590_8RD","","","",["rhsusf_8Rnd_00Buck",8],[],""],[],[],["U_C_Uniform_Scientist_01_F",[["WBK_HeadLampItem_Double",1]]],["rvg_rangemaster_4",[["rhsusf_8Rnd_00Buck",5,8]]],["rvg_legstrappack_2",[["rhsusf_8Rnd_00Buck",1,8],["rvg_bacon",1,1],["rvg_plasticBottle",1,1]]],"H_Cap_Lyfe","G_AirPurifyingRespirator_01_F",[],["","","","","",""]],[["ace_arsenal_voice","Male03ENG"],["ace_arsenal_face","GreekHead_A3_03"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object25_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object25]] call BIS_fnc_addStackedEventHandler;



_group0 setFormation "WEDGE";
_group0 setBehaviour "AWARE";
_group0 setCombatMode "YELLOW";
_group0 setSpeedMode "FULL";

_waypoint = [_group0, 0];
_waypoint setWaypointPosition [[11040.9,4061.98,21.7297], -1];
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
_waypoint setWaypointPosition [[11033.2,4115.88,20.9069], -1];
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
_waypoint setWaypointPosition [[11140.2,4098.46,13.8614], -1];
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
_waypoint setWaypointPosition [[11137.3,4012.42,15.1608], -1];
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
_waypoint setWaypointPosition [[11031.9,3983.11,20.8776], -1];
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
_waypoint setWaypointPosition [[10980,4068.93,23.9444], -1];
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
_waypoint setWaypointPosition [[10997.5,4093.41,24.7046], -1];
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

_group0 setCurrentWaypoint [_group0, 5];

_group1 setFormation "WEDGE";
_group1 setBehaviour "AWARE";
_group1 setCombatMode "YELLOW";
_group1 setSpeedMode "NORMAL";

_waypoint = [_group1, 0];
_waypoint setWaypointPosition [[0,0,0], -1];
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

_group1 setCurrentWaypoint [_group1, 1];

_group2 setFormation "WEDGE";
_group2 setBehaviour "AWARE";
_group2 setCombatMode "YELLOW";
_group2 setSpeedMode "FULL";

_waypoint = [_group2, 0];
_waypoint setWaypointPosition [[0,0,0], -1];
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

_waypoint = _group2 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[11049.5,4045.39,20.6078], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_waypoint = _group2 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[11077.2,4024.3,18.457], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_waypoint = _group2 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[11079.4,4030.45,18.3288], -1];
_waypoint setWaypointType "CYCLE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_group2 setCurrentWaypoint [_group2, 1];

_group3 setFormation "WEDGE";
_group3 setBehaviour "AWARE";
_group3 setCombatMode "YELLOW";
_group3 setSpeedMode "FULL";

_waypoint = [_group3, 0];
_waypoint setWaypointPosition [[11081.4,4058.55,17.9636], -1];
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

_waypoint = _group3 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[11109.5,4060.78,15.7059], -1];
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

_waypoint = _group3 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[11113.5,4027.87,15.6218], -1];
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

_waypoint = _group3 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[11043.6,4002.54,20.2705], -1];
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

_waypoint = _group3 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[11020.3,4063.77,22.8579], -1];
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

_waypoint = _group3 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[11087.3,4069.97,17.1793], -1];
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

_group3 setCurrentWaypoint [_group3, 3];

_group4 setFormation "WEDGE";
_group4 setBehaviour "AWARE";
_group4 setCombatMode "YELLOW";
_group4 setSpeedMode "NORMAL";

_waypoint = [_group4, 0];
_waypoint setWaypointPosition [[11047.5,4036.03,20.9646], -1];
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

_group5 setFormation "WEDGE";
_group5 setBehaviour "AWARE";
_group5 setCombatMode "YELLOW";
_group5 setSpeedMode "NORMAL";

_waypoint = [_group5, 0];
_waypoint setWaypointPosition [[11043.6,4040.23,21.3664], -1];
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

_group5 setCurrentWaypoint [_group5, 1];

_group6 setFormation "WEDGE";
_group6 setBehaviour "AWARE";
_group6 setCombatMode "YELLOW";
_group6 setSpeedMode "NORMAL";

_waypoint = [_group6, 0];
_waypoint setWaypointPosition [[11044.6,4040.4,21.3693], -1];
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

_group6 setCurrentWaypoint [_group6, 1];

_group7 setFormation "WEDGE";
_group7 setBehaviour "COMBAT";
_group7 setCombatMode "YELLOW";
_group7 setSpeedMode "NORMAL";

_waypoint = [_group7, 0];
_waypoint setWaypointPosition [[11093.4,4036.12,17.4916], -1];
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

_group7 setCurrentWaypoint [_group7, 1];

_group8 setFormation "WEDGE";
_group8 setBehaviour "AWARE";
_group8 setCombatMode "YELLOW";
_group8 setSpeedMode "NORMAL";

_waypoint = [_group8, 0];
_waypoint setWaypointPosition [[11093.8,4037.82,17.4913], -1];
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


_group8 setCurrentWaypoint [_group8, 1];
private _medicalUnits = [
    _object0,_object1,_object2,_object8,_object9,_object10,_object11,_object12,_object13,_object14,_object18,_object19,_object20,_object22,_object24,_object25
];

private _medicalCenter = _object4;
private _headDoctor = _object25;

missionNamespace setVariable ["LBMQ_task003CampCenter", _medicalCenter, true];
missionNamespace setVariable ["LBMQ_task003HeadDoctor", _headDoctor, true];
missionNamespace setVariable ["LBMQ_task003CampUnits", _medicalUnits, true];