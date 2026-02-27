params ["_faction","_unit"];

private _headgear = "";
private _facewear = "";
private _uniform = "";
private _vest = "";

switch _faction do {
	case "DT": {
		_headgear = "H_ShemagOpen_khk";
		_facewear = "G_Blindfold_01_white_F";
		_uniform = "CUP_O_TKI_Khet_Partug_03";
	};
	case "PF": {
		_headgear = "Human_Face_Mask";
		_facewear = "G_Balaclava_Scarecrow_01";
		_uniform = "CUP_O_TKI_Khet_Partug_08";
		_vest = "FRITH_ruin_vestiaGL_nja";
	};
	case "RC": {
		_headgear = "H_Beret_blk";
		_facewear = "G_Balaclava_Skull1";
		_uniform = "CUP_O_TKI_Khet_Partug_04";
		_vest = "CUP_V_PMC_CIRAS_Black_Empty";
	};
};

_unit addHeadgear _headgear;
_unit addGoggles _facewear;
_unit forceAddUniform _uniform;
_unit addVest _vest;