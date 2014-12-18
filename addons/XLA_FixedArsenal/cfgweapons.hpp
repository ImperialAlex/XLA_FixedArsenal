#define ALL_SIDE side = -2;
#define CIV_SIDE side = 3;
#define EAST_SIDE side = 0;
#define INDEP_SIDE side = 2;
#define NONE_SIDE side = -1;
#define WEST_SIDE side = 1;

class CfgWeapons {

	class Default; 
	class Rifle_Base_F;

	class arifle_Katiba_Base_F: Rifle_Base_F { EAST_SIDE };
	class arifle_MX_Base_F: Rifle_Base_F { WEST_SIDE };	
	class SDAR_base_F: Rifle_Base_F { ALL_SIDE };
	class Tavor_base_F: Rifle_Base_F { INDEP_SIDE };
	class mk20_base_F: Rifle_Base_F { INDEP_SIDE };
	class SMG_01_Base: Rifle_Base_F { WEST_SIDE};
	class SMG_02_base_F: Rifle_Base_F {WEST_SIDE};
	class pdw2000_base_F: Rifle_Base_F {INDEP_SIDE};

	class Rifle_Long_Base_F;

	class EBR_base_F: Rifle_Long_Base_F {ALL_SIDE};
	class GM6_base_F: Rifle_Long_Base_F {EAST_SIDE};
	class LRR_base_F: Rifle_Long_Base_F {WEST_SIDE};
	class LMG_Mk200_F: Rifle_Long_Base_F {INDEP_SIDE};
	class LMG_Zafir_F: Rifle_Long_Base_F {EAST_SIDE};
	class DMR_01_base_F: Rifle_Long_Base_F {EAST_SIDE};

	class Pistol_Base_F;
	class hgun_P07_F : Pistol_Base_F {WEST_SIDE};
	class hgun_Rook40_F: Pistol_Base_F {EAST_SIDE};
	class hgun_ACPC2_F: Pistol_Base_F {INDEP_SIDE};
	class hgun_Pistol_heavy_01_F: Pistol_Base_F {WEST_SIDE};
	class hgun_Pistol_heavy_02_F: Pistol_Base_F {EAST_SIDE};

	class Launcher_Base_F;
	class launch_NLAW_F: Launcher_Base_F {ALL_SIDE};
	class launch_RPG32_F: Launcher_Base_F {EAST_SIDE};
	class launch_B_Titan_F: Launcher_Base_F {WEST_SIDE};
	class launch_I_Titan_F: Launcher_Base_F {INDEP_SIDE};
	class launch_O_Titan_F: Launcher_Base_F {EAST_SIDE};

	class launch_Titan_short_base;
	class launch_B_Titan_short_F: launch_Titan_short_base {WEST_SIDE};
	class launch_I_Titan_short_F: launch_Titan_short_base {INDEP_SIDE};
	class launch_O_Titan_short_F: launch_Titan_short_base {EAST_SIDE};

	class DetectorCore;
	class MineDetector: DetectorCore {ALL_SIDE};

	class Binocular: Default {ALL_SIDE};
	class Rangefinder: Binocular {ALL_SIDE};
	class LaserDesignator: Binocular {ALL_SIDE};
	class NVGoggles:Binocular {WEST_SIDE};
	class NVGoggles_OPFOR:NVGoggles {EAST_SIDE};
	class NVGoggles_INDEP:NVGoggles {INDEP_SIDE};

	class ItemCore;
	class ItemCompass: ItemCore {ALL_SIDE};
	class ItemGPS: ItemCore {ALL_SIDE};
	class ItemRadio: ItemCore {ALL_SIDE};
	class ItemMap: ItemCore {ALL_SIDE};
	class ItemWatch: ItemCore {ALL_SIDE};
	class FirstAidKit: ItemCore {ALL_SIDE};
	class MediKit: ItemCore {ALL_SIDE};
	class ToolKit: ItemCore {ALL_SIDE};	

	class muzzle_snds_H {ALL_SIDE};
	//Same as ammo/mags: because of gun-specific arsenal, give everything to everybody.

	class UavTerminal_base;
	class B_UavTerminal : UavTerminal_base {WEST_SIDE};
	class I_UavTerminal : UavTerminal_base {INDEP_SIDE};
	class O_UavTerminal : UavTerminal_base {EAST_SIDE};

	//OPTICS:
	 class optic_Arco: ItemCore { ALL_SIDE };
	 class optic_Hamr: ItemCore { ALL_SIDE };
	 class optic_Aco: ItemCore { ALL_SIDE };
	 class optic_ACO_grn: ItemCore { ALL_SIDE };
	 class optic_Aco_smg: ItemCore { ALL_SIDE };
	 class optic_ACO_grn_smg: ItemCore { ALL_SIDE };
	 class optic_Holosight: ItemCore { ALL_SIDE };
	 class optic_Holosight_smg: ItemCore { ALL_SIDE };
	 class optic_SOS: ItemCore { ALL_SIDE };
	 class optic_MRCO: ItemCore { ALL_SIDE };
	 class optic_DMS: ItemCore { ALL_SIDE };
	 class optic_Yorris: ItemCore { ALL_SIDE };
	 class optic_MRD: ItemCore { ALL_SIDE };
	 class optic_LRPS: ItemCore { ALL_SIDE };
	 class optic_NVS: ItemCore { ALL_SIDE };
	 class optic_Nightstalker: ItemCore { ALL_SIDE };
	 class optic_tws: ItemCore { ALL_SIDE };
	 class optic_tws_mg: ItemCore { ALL_SIDE };

	 // Attachments
	 class acc_flashlight: ItemCore { ALL_SIDE };
	 class acc_pointer_IR: ItemCore { ALL_SIDE };


	 //Vests
	class Vest_NoCamo_Base;
	class V_Rangemaster_belt: Vest_NoCamo_Base {ALL_SIDE};
	class V_PlateCarrier1_rgr: Vest_NoCamo_Base {WEST_SIDE};
	class V_PlateCarrier3_rgr: Vest_NoCamo_Base {WEST_SIDE};
	class V_PlateCarrierGL_rgr: Vest_NoCamo_Base {WEST_SIDE};
	class V_PlateCarrierSpec_rgr: Vest_NoCamo_Base {WEST_SIDE};

	class V_TacVestIR_blk: Vest_NoCamo_Base {ALL_SIDE};

	class V_PlateCarrierIA1_dgtl: Vest_NoCamo_Base {INDEP_SIDE};

	class V_HarnessO_brn: Vest_NoCamo_Base {EAST_SIDE};
	class V_HarnessOGL_brn: Vest_NoCamo_Base {EAST_SIDE};

	class Vest_Camo_Base;
	class V_BandollierB_khk: Vest_Camo_Base {EAST_SIDE};
	class V_Chestrig_khk: Vest_Camo_Base {EAST_SIDE};

	class V_TacVest_khk: Vest_Camo_Base {ALL_SIDE};

	class V_Rebreather: Vest_Camo_Base {WEST_SIDE};
	class V_RebreatherIR: V_Rebreather {EAST_SIDE};
	class V_RebreatherIA: V_Rebreather {INDEP_SIDE};

	class V_PlateCarrier1_blk: Vest_Camo_Base {WEST_SIDE};

	class V_Chestrig_oli: Vest_Camo_Base {INDEP_SIDE};

	class V_TacVest_camo: Vest_Camo_Base {ALL_SIDE};

	class V_TacVest_blk_POLICE: Vest_Camo_Base {CIV_SIDE};

	class V_TacVestCamo_khk: Vest_Camo_Base {ALL_SIDE};

};

class CfgMagazines {
 	class Default { ALL_SIDE };
 	// All magazines are available to all sides since the arsenal only offers gun-specific ammo
};

class CfgAmmos {
	class Default { ALL_SIDE };
 	// All magazines are available to all sides since the arsenal only offers gun-specific ammo
};