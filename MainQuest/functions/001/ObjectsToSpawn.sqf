_group0 = createGroup [west, true];
_group1 = createGroup [west, true];
_group2 = createGroup [west, true];
_group3 = createGroup [west, true];
_group4 = createGroup [west, true];
_group5 = createGroup [west, true];
_group6 = createGroup [west, true];
_group7 = createGroup [west, true];
_group8 = createGroup [west, true];

_object0 = createVehicle ["Land_Razorwire_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object0 setVectorDirAndUp [[0.647352,0.75928,0.0666502],[-0.0945721,-0.00663679,0.990994]];
_object0 setPosASL [10869.7,3783.34,17.4926];


_object1 = createVehicle ["Land_Razorwire_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object1 setVectorDirAndUp [[0.949589,0.302286,0.0831156],[-0.0813821,-0.0182692,0.996481]];
_object1 setPosASL [10865.4,3789.85,17.0673];


_object2 = createVehicle ["Land_Razorwire_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object2 setVectorDirAndUp [[-0.691898,0.721989,-0.00326486],[0.0216547,0.0249863,0.998296]];
_object2 setPosASL [10892.3,3782.93,17.598];


_object3 = createVehicle ["Land_CanisterPlastic_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object3 setVectorDirAndUp [[0.977815,0.202961,0.0518202],[-0.0533939,0.00228205,0.998571]];
_object3 setPosASL [10876,3790.86,17.8486];


_object4 = createVehicle ["Land_CanisterPlastic_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object4 setVectorDirAndUp [[-0.483208,-0.875166,-0.0243813],[-0.0532834,0.00160011,0.998578]];
_object4 setPosASL [10875.7,3791.38,17.8296];


_object5 = createVehicle ["Land_CanisterPlastic_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object5 setVectorDirAndUp [[0.996063,-0.0886464,-0.000624386],[0.000514923,-0.00125769,0.999999]];
_object5 setPosASL [10882.8,3781.39,17.9078];


_object6 = createVehicle ["Land_TinContainer_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object6 setVectorDirAndUp [[-0.974443,-0.00382316,-0.224604],[-0.224635,0.01305,0.974356]];
_object6 setPosASL [10876.4,3790.89,17.8634];


_object7 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object7 setVectorDirAndUp [[0.0438719,0.998915,-0.0312833],[0.0149967,0.0149967,0.999325]];
_object7 setPosASL [10881.1,3779.5,17.9359];


_object8 = createVehicle ["Land_Sleeping_bag_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object8 setVectorDirAndUp [[-0.67705,0.735783,0.0150149],[0.036639,0.0133232,0.99924]];
_object8 setPosASL [10881.2,3791.06,17.8548];


_object9 = createVehicle ["Land_Sleeping_bag_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object9 setVectorDirAndUp [[-0.0382498,0.999268,-0.000708925],[0.0249921,0.00166586,0.999686]];
_object9 setPosASL [10878.9,3790.07,17.9576];


_object10 = _group0 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object10 setPosASL [10880.5,3780.41,17.9426];
_object10 setDir 330.641;
_object10 setRank "PRIVATE";
_object10 setSkill 0.75;
_object10 setUnitPos "Auto";
_group0 selectLeader _object10;
['_object10_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["arifle_Mk20C_F","","acc_flashlight","",["30Rnd_556x45_Stanag",30],[],""],[],[],["U_FRITH_RUIN_cofftan",[["WBK_HeadLampItem_Double",1],["30Rnd_556x45_Stanag",1,30]]],["rvg_bandolier_4",[["ACE_fieldDressing",1],["rvg_money",3,1],["30Rnd_556x45_Stanag",4,30]]],["rvg_legstrappack_4",[["ACE_bloodIV",1],["rvg_milk",1,1],["rvg_baconEmpty",1,1]]],"rhsusf_patrolcap_ocp","G_AirPurifyingRespirator_02_sand_F",[],["","","","","",""]],[["ace_arsenal_voice","Male02ENG"],["ace_arsenal_face","GreekHead_A3_02"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object10_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object10]] call BIS_fnc_addStackedEventHandler;


_object11 = _group1 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object11 setPosASL [10878.8,3791.43,17.931];
_object11 setDir 28.8506;
_object11 setRank "PRIVATE";
_object11 setSkill 0.75;
_object11 setUnitPos "Auto";
_group1 selectLeader _object11;
['_object11_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["CUP_smg_MP7_desert","","acc_flashlight","",["CUP_40Rnd_46x30_MP7",40],[],""],[],[],["U_FRITH_RUIN_cofftan",[["WBK_HeadLampItem_Double",1]]],["rvg_legstrapbag_4",[["ACE_fieldDressing",2],["CUP_40Rnd_46x30_MP7",5,40]]],["rvg_legstrappack_4",[["ACE_bloodIV_500",1],["rvg_Boar_Meat_Cooked",1,1],["rvg_notepad",1,1]]],"H_Watchcap_khk","Mask_M50",[],["","","","","ItemWatch",""]],[["ace_arsenal_voice","Male06ENG"],["ace_arsenal_face","GreekHead_A3_06"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object11_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object11]] call BIS_fnc_addStackedEventHandler;


_object12 = createVehicle ["Land_FMradio_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object12 setVectorDirAndUp [[0.143276,-0.989651,0.00793513],[0.0366493,0.0133179,0.999239]];
_object12 setPosASL [10879.8,3790.84,17.8985];


_object13 = createVehicle ["Land_BagFence_Short_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object13 setVectorDirAndUp [[-0.704992,0.709168,0.00821118],[0.0149983,0.00333302,0.999635]];
_object13 setPosASL [10883.1,3780.35,17.8909];


_object14 = createVehicle ["Land_BagFence_Short_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object14 setVectorDirAndUp [[-0.698667,-0.715331,0.0128637],[0.0149983,0.00333302,0.999816]];
_object14 setPosASL [10879.2,3780.57,17.9705];


_object15 = createVehicle ["Land_Basket_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object15 setVectorDirAndUp [[0.678392,-0.73407,-0.0304384],[0.0681721,0.0216423,0.997439]];
_object15 setPosASL [10892.2,3798.31,17.1948];


_object16 = createVehicle ["Land_Garbage_square5_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object16 setVectorDirAndUp [[-0.163194,-0.986594,0.00762816],[0,0,1]];
_object16 setPosASL [10880,3794.26,17.8728];


_object17 = createVehicle ["Land_Sacks_heap_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object17 setVectorDirAndUp [[0.997515,-0.054677,0.0444326],[-0.044953,-0.00832449,0.998954]];
_object17 setPosASL [10875.5,3799.9,17.8462];


_object18 = createVehicle ["Land_WoodPile_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object18 setVectorDirAndUp [[-0.989755,0.135153,0.0460363],[0.0482729,0.0133166,0.998745]];
_object18 setPosASL [10882.5,3795.2,17.7533];


_object19 = createVehicle ["Land_CampingTable_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object19 setVectorDirAndUp [[-0.0669552,-0.997744,0.00490789],[0.0482755,0.00167364,0.998833]];
_object19 setPosASL [10880.6,3799.46,17.8117];


_object20 = createVehicle ["Land_HelipadEmpty_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object20 setVectorDirAndUp [[-0.000374224,0.999965,0.00831608],[-0.044953,-0.00832449,0.998954]];
_object20 setPosASL [10875.5,3799.9,18.1783];


_object21 = createVehicle ["Land_Sleeping_bag_brown_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object21 setVectorDirAndUp [[-0.979411,0.198717,0.0355807],[0.0366422,0.00166558,0.999327]];
_object21 setPosASL [10882.7,3793.23,17.7966];


_object22 = createVehicle ["Land_Campfire_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object22 setVectorDirAndUp [[-0.497711,-0.867119,0.0395812],[0.0366422,0.00166558,0.998154]];
_object22 setPosASL [10878.9,3793.85,17.8162];


_object23 = createVehicle ["Land_TentDome_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object23 setVectorDirAndUp [[-0.980618,0.188048,0.0550089],[0.0582305,0.011646,0.998235]];
_object23 setPosASL [10882.9,3801.31,17.6673];


_object24 = createVehicle ["Land_TentDome_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object24 setVectorDirAndUp [[-0.997485,-0.0518699,0.0482984],[0.0482771,0.00166476,0.998833]];
_object24 setPosASL [10878.7,3801.91,17.9005];


_object25 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object25 setVectorDirAndUp [[-0.974039,0.217772,0.125561],[0.0681584,0.0216114,0.992161]];
_object25 setPosASL [10893.4,3799.15,17.0053];


_object26 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object26 setVectorDirAndUp [[0.913541,-0.402673,0.114845],[-0.0714692,-0.019945,0.991722]];
_object26 setPosASL [10866.6,3801.47,17.2538];


_object27 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object27 setVectorDirAndUp [[0.48695,0.871861,0.104663],[-0.0714692,-0.019945,0.991723]];
_object27 setPosASL [10867.2,3799.27,17.3854];


_object28 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object28 setVectorDirAndUp [[-0.272114,-0.961457,0.080584],[0.0681584,0.0216114,0.992187]];
_object28 setPosASL [10892.2,3801.19,17.1788];


_object29 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object29 setVectorDirAndUp [[-0.342767,-0.938991,-0.0568053],[-0.05989,-0.00831796,0.994507]];
_object29 setPosASL [10868.7,3802.33,17.4651];


_object30 = createVehicle ["Land_CampingChair_V1_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object30 setVectorDirAndUp [[-0.982599,0.180317,-0.0445473],[-0.044984,0.0016688,0.998986]];
_object30 setPosASL [10876.4,3794.2,17.8789];


_object31 = createVehicle ["Land_CampingChair_V1_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object31 setVectorDirAndUp [[-0.230547,0.973037,0.00682478],[0.0366709,0.00167946,0.999326]];
_object31 setPosASL [10878.5,3796.46,17.9286];


_object32 = _group2 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object32 setPosASL [10880.1,3795.91,17.8682];
_object32 setDir 199.743;
_object32 setRank "PRIVATE";
_object32 setSkill 0.75;
_object32 setUnitPos "Auto";
_group2 selectLeader _object32;
['_object32_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["sgun_HunterShotgun_01_sawedoff_F","","","",["2Rnd_12Gauge_Pellets",2],[],""],[],[],["U_FRITH_RUIN_coffgrn",[["WBK_HeadLampItem_Double",1],["2Rnd_12Gauge_Pellets",1,2]]],["rvg_bandolier_3",[["2Rnd_12Gauge_Pellets",6,2]]],["B_TacticalPack_oli",[["rvg_bacon",1,1]]],"H_Cap_tan_specops_US","G_AirPurifyingRespirator_02_olive_F",[],["","","TFAR_pnr1000a","","",""]],[["ace_arsenal_voice","Male05ENG"],["ace_arsenal_face","GreekHead_A3_02"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object32_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object32]] call BIS_fnc_addStackedEventHandler;


_object33 = _group3 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object33 setPosASL [10892.1,3799.56,17.1771];
_object33 setDir 64.4489;
_object33 setRank "PRIVATE";
_object33 setSkill 0.75;
_object33 setUnitPos "Auto";
_group3 selectLeader _object33;
['_object33_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhsusf_weap_MP7A2_winter","","acc_flashlight","",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],[],[],["U_FRITH_RUIN_cofftan",[["WBK_HeadLampItem_Double",1]]],["V_Chestrig_rgr",[["rvg_money",4,1],["rhsusf_mag_40Rnd_46x30_FMJ",4,40]]],["B_AssaultPack_cbr",[["rvg_purificationTablets",1,6]]],"H_Cap_Lyfe","G_RegulatorMask_F",[],["ItemMap","","","","",""]],[["ace_arsenal_voice","Male05ENG"],["ace_arsenal_face","Mavros"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object33_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object33]] call BIS_fnc_addStackedEventHandler;


_object34 = _group4 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object34 setPosASL [10880.8,3800.54,17.7993];
_object34 setDir 205.086;
_object34 setRank "PRIVATE";
_object34 setSkill 0.75;
_object34 setUnitPos "Auto";
_group4 selectLeader _object34;
['_object34_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["CUP_smg_MP5A5_Rail_VFG","CUP_muzzle_snds_MP5","rhsusf_acc_wmx_bk","CUP_optic_CompM4",["CUP_30Rnd_9x19_MP5",30],[],""],[],[],["U_FRITH_RUIN_coffdpm",[["WBK_HeadLampItem_Double",1]]],["rhsusf_iotv_ucp",[["rvg_money",3,1],["CUP_30Rnd_9x19_MP5",1,30]]],["rvg_legstrappack_2",[["FirstAidKit",1],["rvg_spiritEmpty",1,1],["rvg_beansEmpty",1,1]]],"H_MilCap_gry","G_AirPurifyingRespirator_02_black_F",[],["","","TFAR_fadak","","ItemWatch",""]],[["ace_arsenal_voice","Male04ENG"],["ace_arsenal_face","GreekHead_A3_08"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object34_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object34]] call BIS_fnc_addStackedEventHandler;


_object35 = _group5 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object35 setPosASL [10877.3,3793.62,17.9151];
_object35 setDir 86.7564;
_object35 setRank "PRIVATE";
_object35 setSkill 0.75;
_object35 setUnitPos "Auto";
_group5 selectLeader _object35;
['_object35_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["CUP_smg_MP7_desert","","acc_flashlight","",["CUP_40Rnd_46x30_MP7",40],[],""],[],[],["U_FRITH_RUIN_coffgrn",[["WBK_HeadLampItem_Double",1]]],["rvg_rangemaster_4",[["CUP_40Rnd_46x30_MP7",5,40]]],["B_TacticalPack_blk",[["rvg_purificationTablets",1,6],["rvg_canteenEmpty",1,1]]],"CUP_H_RUS_Cap_ATACSFG","G_AirPurifyingRespirator_02_olive_F",[],["","","TFAR_rf7800str","ItemCompass","",""]],[["ace_arsenal_voice","Male05ENG"],["ace_arsenal_face","GreekHead_A3_07"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object35_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object35]] call BIS_fnc_addStackedEventHandler;


_object36 = _group6 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object36 setPosASL [10881.2,3793.33,17.8334];
_object36 setDir 334.204;
_object36 setRank "PRIVATE";
_object36 setSkill 0.75;
_object36 setUnitPos "Auto";
_group6 selectLeader _object36;
['_object36_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["CUP_arifle_Fort222","","acc_flashlight","",["CUP_30Rnd_545x39_Fort224_M",30],[],""],[],[],["U_FRITH_RUIN_coffdpm",[["WBK_HeadLampItem_Double",1],["CUP_30Rnd_545x39_Fort224_M",1,30]]],["rvg_bandolier_3",[["ACE_fieldDressing",1],["CUP_30Rnd_545x39_Fort224_M",1,30]]],["rvg_legstrappack_1",[["rvg_bacon",1,1]]],"H_Cap_police","G_RegulatorMask_F",[],["","","","","ItemWatch",""]],[["ace_arsenal_voice","Male11ENG"],["ace_arsenal_face","GreekHead_A3_04"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object36_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object36]] call BIS_fnc_addStackedEventHandler;


_object37 = _group7 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object37 setPosASL [10867.6,3800.65,17.4105];
_object37 setDir 257.602;
_object37 setRank "PRIVATE";
_object37 setSkill 0.75;
_object37 setUnitPos "Auto";
_group7 selectLeader _object37;
['_object37_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhsusf_weap_MP7A2","","acc_flashlight","rhsusf_acc_mrds",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],[],[],["U_FRITH_RUIN_coffdpm",[["WBK_HeadLampItem_Double",1]]],["rvg_legstrapbag_4",[["rhsusf_mag_40Rnd_46x30_FMJ",3,40]]],["rvg_legstrappack_3",[["ACE_salineIV",1],["rvg_plasticBottle",1,1],["rvg_rustyCanEmpty",1,1]]],"H_Watchcap_blk","Mask_M40",[],["","","","","ItemWatch",""]],[["ace_arsenal_voice","Male11ENG"],["ace_arsenal_face","Mavros"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object37_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object37]] call BIS_fnc_addStackedEventHandler;


_object38 = createVehicle ["Land_CerealsBox_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object38 setVectorDirAndUp [[0.312526,-0.949909,-0.000492266],[0.0681481,0.0219043,0.997435]];
_object38 setPosASL [10891.2,3800.65,17.2108];


_object39 = createVehicle ["Item_Laptop_Unfolded", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object39 setVectorDirAndUp [[0.29854,-0.954311,-0.0128389],[0.0482771,0.00166476,0.998833]];
_object39 setPosASL [10881.1,3799.43,18.6028];

clearItemCargoGlobal _object39;
clearWeaponCargoGlobal _object39;
clearMagazineCargoGlobal _object39;
clearBackpackCargoGlobal _object39;

{_object39 addMagazineCargoGlobal _x} forEach [["Laptop_Unfolded",1]];


_object40 = _group8 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object40 setPosASL [10893.6,3839.79,16.9008];
_object40 setDir 76.3674;
_object40 setRank "PRIVATE";
_object40 setSkill 0.75;
_object40 setUnitPos "Auto";
_group8 selectLeader _object40;
['_object40_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhsusf_weap_MP7A2_winter","","acc_flashlight","",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],[],[],["U_FRITH_RUIN_coffgrn",[["WBK_HeadLampItem_Double",1]]],["rvg_rangemaster_1",[["ACE_fieldDressing",1],["rhsusf_mag_40Rnd_46x30_FMJ",4,40]]],["rvg_legstrappack_4",[["rvg_matches",1,10],["rvg_canteenEmpty",1,1]]],"H_Cap_Lyfe","G_RegulatorMask_F",[],["","","","","",""]],[["ace_arsenal_voice","Male06ENG"],["ace_arsenal_face","GreekHead_A3_01"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object40_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object40]] call BIS_fnc_addStackedEventHandler;


_object41 = _group8 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object41 setPosASL [10875.9,3834.88,18.1486];
_object41 setDir 45.0364;
_object41 setRank "PRIVATE";
_object41 setSkill 0.75;
_object41 setUnitPos "Auto";
['_object41_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["rhs_weap_m16a4","","acc_flashlight","rhsusf_acc_eotech_xps3",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],""],[],[],["U_FRITH_RUIN_coffdpm",[["WBK_HeadLampItem_Double",1]]],["rhsusf_iotv_ucp_Squadleader",[["ACE_fieldDressing",4],["rvg_money",4,1],["rhs_mag_30Rnd_556x45_M855A1_Stanag",2,30]]],["B_AssaultPack_cbr",[["ACE_plasmaIV",1],["rvg_spirit",1,1],["rvg_Sheep_Meat_Cooked",1,1],["rvg_matches",1,10]]],"rhsusf_ach_helmet_headset_ucp_alt","Mask_M40_OD",[],["ItemMap","DSA_Detector","rhs_radio_R169P1","ItemCompass","ItemWatch",""]],[["ace_arsenal_voice","Male04ENG"],["ace_arsenal_face","Ioannou"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object41_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object41]] call BIS_fnc_addStackedEventHandler;


_object42 = _group8 createUnit ["B_G_Survivor_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object42 setPosASL [10868.7,3828.73,18.3387];
_object42 setDir 89.3373;
_object42 setRank "PRIVATE";
_object42 setSkill 0.75;
_object42 setUnitPos "Auto";
['_object42_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    [_unit, [[["sgun_HunterShotgun_01_F","","","",["2Rnd_12Gauge_Pellets",2],[],""],[],[],["U_FRITH_RUIN_coffdpm",[["WBK_HeadLampItem_Double",1],["2Rnd_12Gauge_Pellets",1,2]]],["rvg_rangemaster_1",[["ACE_fieldDressing",5],["2Rnd_12Gauge_Pellets",4,2]]],["rvg_legstrappack_3",[["rvg_beansEmpty",1,1]]],"H_Cap_Lyfe","G_AirPurifyingRespirator_02_olive_F",[],["","","","","",""]],[["ace_arsenal_voice","Male11ENG"],["ace_arsenal_face","GreekHead_A3_02"]]]] call CBA_fnc_setLoadout;
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object42_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object42]] call BIS_fnc_addStackedEventHandler;


_object43 = createVehicle ["Land_Razorwire_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object43 setVectorDirAndUp [[-0.966756,0.252316,0.0410611],[0.0532152,0.0399114,0.995218]];
_object43 setPosASL [10896.2,3789.67,17.171];



_group0 setFormation "WEDGE";
_group0 setBehaviour "AWARE";
_group0 setCombatMode "YELLOW";
_group0 setSpeedMode "NORMAL";

_waypoint = [_group0, 0];
_waypoint setWaypointPosition [[10856.1,3744.16,14.6261], -1];
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

_group1 setFormation "WEDGE";
_group1 setBehaviour "AWARE";
_group1 setCombatMode "YELLOW";
_group1 setSpeedMode "NORMAL";

_waypoint = [_group1, 0];
_waypoint setWaypointPosition [[10851.3,3756.67,14.9338], -1];
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
_group2 setSpeedMode "NORMAL";

_waypoint = [_group2, 0];
_waypoint setWaypointPosition [[10842.6,3748.21,14.2519], -1];
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
_waypoint setWaypointPosition [[10854.7,3745.98,14.668], -1];
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
_waypoint setWaypointPosition [[10845.9,3753.69,14.8669], -1];
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
_group5 setBehaviour "CARELESS";
_group5 setCombatMode "YELLOW";
_group5 setSpeedMode "NORMAL";

_waypoint = [_group5, 0];
_waypoint setWaypointPosition [[10853.4,3750.76,14.7911], -1];
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
_waypoint setWaypointPosition [[10864.3,3745.22,15.4195], -1];
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
_group7 setBehaviour "AWARE";
_group7 setCombatMode "YELLOW";
_group7 setSpeedMode "NORMAL";

_waypoint = [_group7, 0];
_waypoint setWaypointPosition [[10839.6,3745.4,13.9611], -1];
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

_group8 setFormation "COLUMN";
_group8 setBehaviour "SAFE";
_group8 setCombatMode "YELLOW";
_group8 setSpeedMode "LIMITED";

_waypoint = [_group8, 0];
_waypoint setWaypointPosition [[10858.6,3813.88,17.631], -1];
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

_waypoint = _group8 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[10910.9,3832.3,15.4542], -1];
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

_waypoint = _group8 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[10905.6,3768.24,17.9674], -1];
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

_waypoint = _group8 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[10875.2,3769.64,17.5672], -1];
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

_waypoint = _group8 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[10855.6,3757.91,15.1231], -1];
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

_waypoint = _group8 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[10850.3,3788.78,16.0141], -1];
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

_waypoint = _group8 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[10862.2,3796.68,16.952], -1];
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

_waypoint = _group8 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[10859.9,3810.44,17.4081], -1];
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

_waypoint = _group8 addWaypoint [[0, 0, 0], -1];
_waypoint setWaypointPosition [[10858.6,3813.88,17.631], -1];
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

_group8 setCurrentWaypoint [_group8, 1];

missionNamespace setVariable ["LBMQ_task001Representative", _object34, true];
missionNamespace setVariable ["LBMQ_task001CampCenter", _object0, true];
missionNamespace setVariable ["LBMQ_task001RedFlag", _object1, true];
missionNamespace setVariable ["LBMQ_task001CampUnits", [_object2, _object3, _object4, _object5, _object6], true];