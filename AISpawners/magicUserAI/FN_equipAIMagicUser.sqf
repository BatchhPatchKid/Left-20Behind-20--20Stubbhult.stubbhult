params ["_faction","_unit"];

// Make the unit a master at everything
_unit setSkill 1;
_unit setSkill ["aimingAccuracy", 1];
_unit setSkill ["aimingShake", 1];
_unit setSkill ["aimingSpeed", 1];
_unit setSkill ["spotDistance", 1];
_unit setSkill ["spotTime", 1];
_unit setSkill ["courage", 1];
_unit setSkill ["reloadSpeed", 1];
_unit setSkill ["commanding", 1];
_unit setSkill ["general", 1];

private _loadout = [];

switch _faction do {
	case "PF": {
		_loadout = [
			["CUP_arifle_AKM_Early","rhs_acc_pbs1","","",["rhs_75Rnd_762x39mm_tracer",75],[],""],
			[],
			[],
			["CUP_O_TKI_Khet_Partug_08",[]],
			["FRITH_ruin_vestiaGL_nja",[["rhs_75Rnd_762x39mm_tracer",2,75]]],
			[],
			"Human_Face_Mask",
			"G_Balaclava_Scarecrow_01",
			[],
			["","","","","",""]
		];
	};

	case "DT": {
		_loadout = [
			["srifle_EBR_F","muzzle_snds_B","","optic_DMS_weathered_Kir_F",["20Rnd_762x51_Mag",20],[],"rhsusf_acc_harris_bipod"],
			[],
			[],
			["CUP_O_TKI_Khet_Partug_01",[]],
			["V_PlateCarrier2_blk",[["CUP_20Rnd_TE1_Green_Tracer_762x51_DMR",10,20]]],
			[],
			"H_ShemagOpen_khk",
			"G_Blindfold_01_white_F",
			[],
			["","","","","",""]
		];
	};

	case "RC": {
		_loadout = [
			["CUP_arifle_L85A2_G","CUP_muzzle_snds_L85","","CUP_optic_Eotech553_Black",["rhs_mag_100Rnd_556x45_M855A1_cmag_mixed",100],[],""],
			[],
			[],
			["CUP_O_TKI_Khet_Partug_04",[]],
			["CUP_V_B_Armatus_BB_Black",[["CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag_ar15",8,100]]],
			[],
			"H_Beret_02",
			"G_Balaclava_Skull1",
			[],
			["","","","","",""]
		];
	};
};

if (_loadout isEqualTo []) exitWith {};

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

// Equip the priest
_unit setUnitLoadout _loadout;
reload _unit;

private _artifact = selectRandomWeighted [
	"LB_ArtifactWeak", 75,
	"LB_ArtifactAverage", 20,
	"LB_ArtifactStrong", 5
];

_unit addItem _artifact;