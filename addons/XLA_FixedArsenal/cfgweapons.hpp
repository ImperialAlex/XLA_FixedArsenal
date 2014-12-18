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

	// Uniforms
	class U_B_CombatUniform_mcam { WEST_SIDE };
	class U_B_CombatUniform_mcam_tshirt { WEST_SIDE };
	class U_B_CombatUniform_mcam_vest { WEST_SIDE };
	class U_B_GhillieSuit { WEST_SIDE };
	class U_B_HeliPilotCoveralls { WEST_SIDE };
	class U_B_Wetsuit { WEST_SIDE };

	class U_B_CombatUniform_mcam_worn { WEST_SIDE };
	class U_B_CombatUniform_wdl { WEST_SIDE };
	class U_B_CombatUniform_wdl_tshirt { WEST_SIDE };
	class U_B_CombatUniform_wdl_vest { WEST_SIDE };
	class U_B_CombatUniform_sgg { WEST_SIDE };
	class U_B_CombatUniform_sgg_tshirt { WEST_SIDE };
	class U_B_CombatUniform_sgg_vest { WEST_SIDE };
	class U_B_SpecopsUniform_sgg { WEST_SIDE };
	class U_B_PilotCoveralls { WEST_SIDE };
	class U_B_survival_uniform { WEST_SIDE };
	class U_B_CTRG_1 { WEST_SIDE };
	class U_B_CTRG_2 { WEST_SIDE };
	class U_B_CTRG_3 { WEST_SIDE };

	class U_O_CombatUniform_ocamo { EAST_SIDE };
	class U_O_GhillieSuit { EAST_SIDE };
	class U_O_PilotCoveralls { EAST_SIDE };
	class U_O_Wetsuit { EAST_SIDE };

	class U_O_CombatUniform_oucamo { EAST_SIDE };
	class U_O_SpecopsUniform_ocamo { EAST_SIDE };
	class U_O_SpecopsUniform_blk { EAST_SIDE };
	class U_O_OfficerUniform_ocamo { EAST_SIDE };

	class U_I_CombatUniform { INDEP_SIDE };
	class U_I_CombatUniform_tshirt { INDEP_SIDE };
	class U_I_CombatUniform_shortsleeve { INDEP_SIDE };
	class U_I_pilotCoveralls { INDEP_SIDE };
	class U_I_HeliPilotCoveralls { INDEP_SIDE };
	class U_I_GhillieSuit { INDEP_SIDE };
	class U_I_OfficerUniform { INDEP_SIDE };
	class U_I_Wetsuit { INDEP_SIDE };

	class U_IG_Guerilla1_1 { INDEP_SIDE };
	class U_IG_Guerilla2_1 { INDEP_SIDE };
	class U_IG_Guerilla2_2 { INDEP_SIDE };
	class U_IG_Guerilla2_3 { INDEP_SIDE };
	class U_IG_Guerilla3_1 { INDEP_SIDE };
	class U_IG_Guerilla3_2 { INDEP_SIDE };
	class U_IG_leader { INDEP_SIDE };
	class U_I_G_Story_Protagonist_F { INDEP_SIDE };
	class U_I_G_resistanceLeader_F { INDEP_SIDE };

	class U_BG_Guerilla1_1 { WEST_SIDE };
	class U_BG_Guerilla2_1 { WEST_SIDE };
	class U_BG_Guerilla2_2 { WEST_SIDE };
	class U_BG_Guerilla2_3 { WEST_SIDE };
	class U_BG_Guerilla3_1 { WEST_SIDE };
	class U_BG_Guerilla3_2 { WEST_SIDE };
	class U_BG_leader { WEST_SIDE };


	class U_OG_Guerilla1_1 { EAST_SIDE };
	class U_OG_Guerilla2_1 { EAST_SIDE };
	class U_OG_Guerilla2_2 { EAST_SIDE };
	class U_OG_Guerilla2_3 { EAST_SIDE };
	class U_OG_Guerilla3_1 { EAST_SIDE };
	class U_OG_Guerilla3_2 { EAST_SIDE };
	class U_OG_leader { EAST_SIDE };


	class U_C_Poloshirt_blue { CIV_SIDE };
	class U_C_Poloshirt_burgundy { CIV_SIDE };
	class U_C_Poloshirt_stripped { CIV_SIDE };
	class U_C_Poloshirt_tricolour { CIV_SIDE };

	class U_C_Poloshirt_salmon { CIV_SIDE };
	class U_C_Poloshirt_redwhite { CIV_SIDE };
	class U_C_Commoner1_1 { CIV_SIDE };
	class U_C_Commoner1_2 { CIV_SIDE };
	class U_C_Commoner1_3 { CIV_SIDE };
	class U_Rangemaster { CIV_SIDE };
	class U_Competitor { CIV_SIDE };
	class U_NikosBody { CIV_SIDE };
	class U_MillerBody { CIV_SIDE };
	class U_KerryBody { CIV_SIDE };
	class U_OrestesBody { CIV_SIDE };
	class U_AttisBody { CIV_SIDE };
	class U_AntigonaBody { CIV_SIDE };
	class U_IG_Menelaos { CIV_SIDE };
	class U_C_Novak { CIV_SIDE };
	class U_OI_Scientist { CIV_SIDE };
	class U_C_Poor_1 { CIV_SIDE };
	class U_C_Poor_2 { CIV_SIDE };
	class U_C_Scavenger_1 { CIV_SIDE };
	class U_C_Scavenger_2 { CIV_SIDE };
	class U_C_Farmer { CIV_SIDE };
	class U_C_Fisherman { CIV_SIDE };
	class U_C_WorkerOveralls { CIV_SIDE };
	class U_C_FishermanOveralls { CIV_SIDE };
	class U_C_WorkerCoveralls { CIV_SIDE };
	class U_C_HunterBody_grn { CIV_SIDE };
	class U_C_HunterBody_brn { CIV_SIDE };
	class U_C_Commoner2_1 { CIV_SIDE };
	class U_C_Commoner2_2 { CIV_SIDE };
	class U_C_Commoner2_3 { CIV_SIDE };
	class U_C_PriestBody { CIV_SIDE };
	class U_C_Poor_shorts_1 { CIV_SIDE };
	class U_C_Poor_shorts_2 { CIV_SIDE };
	class U_C_Commoner_shorts { CIV_SIDE };
	class U_C_ShirtSurfer_shorts { CIV_SIDE };
	class U_C_TeeSurfer_shorts_1 { CIV_SIDE };
	class U_C_TeeSurfer_shorts_2 { CIV_SIDE };

	class H_HelmetB { WEST_SIDE };
	class H_Beret_blk { ALL_SIDE };
	class H_Booniehat_khk { ALL_SIDE };
	class H_Cap_red: H_HelmetB { CIV_SIDE };
	class H_Bandanna_surfer : H_HelmetB {CIV_SIDE };
	class H_Bandanna_mcamo : H_Bandanna_surfer { WEST_SIDE };

	class H_Bandanna_surfer_blk : H_Bandanna_surfer { CIV_SIDE };
	class H_Bandanna_surfer_grn : H_Bandanna_surfer { CIV_SIDE };
	class H_Beret_02 : H_Beret_blk { WEST_SIDE };
	class H_Beret_blk_POLICE : H_Beret_blk { CIV_SIDE };
	class H_Beret_grn_SF : H_Beret_blk { WEST_SIDE };
	class H_Beret_ocamo : H_Beret_blk { EAST_SIDE };
	class H_Booniehat_dgtl : H_Booniehat_khk { INDEP_SIDE };
	class H_Booniehat_mcamo : H_Booniehat_khk { WEST_SIDE };
	class H_Cap_blk_Raven : H_Cap_red { INDEP_SIDE };
	class H_Cap_brn_SPECOPS : H_Cap_red { EAST_SIDE };
	class H_Cap_khaki_specops_UK : H_Cap_red { WEST_SIDE };
	class H_Cap_police : H_Cap_red { CIV_SIDE };
	class H_Cap_press : H_Cap_red { CIV_SIDE };
	class H_Cap_surfer : H_Cap_red { CIV_SIDE };
	class H_Cap_tan_specops_US : H_Cap_red { WEST_SIDE };
	class H_Cap_usblack : H_Cap_red { WEST_SIDE };
	class H_CrewHelmetHeli_B : H_HelmetB { WEST_SIDE };
	class H_CrewHelmetHeli_I : H_CrewHelmetHeli_B { INDEP_SIDE };
	class H_CrewHelmetHeli_O : H_CrewHelmetHeli_B { EAST_SIDE };
	class H_Helmet_Kerry : H_HelmetB { WEST_SIDE };
	class H_HelmetB_black : H_HelmetB { WEST_SIDE };
	class H_HelmetB_camo : H_HelmetB { WEST_SIDE };
	class H_HelmetB_desert : H_HelmetB { WEST_SIDE };
	class H_HelmetB_grass : H_HelmetB { WEST_SIDE };
	class H_HelmetB_light : H_HelmetB { WEST_SIDE };
	class H_HelmetB_paint : H_HelmetB { WEST_SIDE };
	class H_HelmetB_plain_mcamo : H_HelmetB { WEST_SIDE };
	class H_HelmetB_sand : H_HelmetB { WEST_SIDE };
	class H_HelmetB_snakeskin : H_HelmetB { WEST_SIDE };
	class H_HelmetCrew_B : H_HelmetB { WEST_SIDE };
	class H_HelmetCrew_I : H_HelmetCrew_B { INDEP_SIDE };
	class H_HelmetCrew_O : H_HelmetCrew_B { EAST_SIDE };
	class H_HelmetIA : H_HelmetB { INDEP_SIDE };
	class H_HelmetO_ocamo : H_HelmetB { EAST_SIDE };
	class H_MilCap_oucamo { EAST_SIDE };
	class H_MilCap_ocamo : H_HelmetB { EAST_SIDE };
	class H_MilCap_dgtl : H_MilCap_oucamo { INDEP_SIDE };
	class H_MilCap_mcamo : H_MilCap_ocamo { WEST_SIDE };

	class H_PilotHelmetFighter_B : H_HelmetB { WEST_SIDE };
	class H_PilotHelmetFighter_I : H_PilotHelmetFighter_B { INDEP_SIDE };
	class H_PilotHelmetFighter_O : H_PilotHelmetFighter_B { EAST_SIDE };
	class H_PilotHelmetHeli_B : H_HelmetB { WEST_SIDE };
	class H_PilotHelmetHeli_I : H_PilotHelmetHeli_B { INDEP_SIDE };
	class H_PilotHelmetHeli_O : H_PilotHelmetHeli_B { EAST_SIDE };
	class H_RacingHelmet_1_F : H_HelmetB_camo { CIV_SIDE };
	class H_StrawHat : H_HelmetB { CIV_SIDE };

};

class CfgMagazines {
 	class Default { ALL_SIDE };
 	// All magazines are available to all sides since the arsenal only offers gun-specific ammo
};

class CfgAmmos {
	class Default { ALL_SIDE };
 	// All magazines are available to all sides since the arsenal only offers gun-specific ammo
};

class CfgGlasses {
	class None { ALL_SIDE };
	class G_Spectacles: None { CIV_SIDE };
	class G_Spectacles_Tinted: None { CIV_SIDE };
	class G_Combat: None { ALL_SIDE };
	class G_Lowprofile: None { ALL_SIDE };
	class G_Shades_Black: None { ALL_SIDE };
	class G_Shades_Green: None { ALL_SIDE };
	class G_Shades_Red: None { CIV_SIDE };
	class G_Squares: None { CIV_SIDE };
	class G_Squares_Tinted: None { CIV_SIDE };
	class G_Sport_BlackWhite: None { CIV_SIDE };
	class G_Sport_Blackyellow: None { CIV_SIDE };
	class G_Sport_Greenblack: None { CIV_SIDE };
	class G_Sport_Checkered: None { CIV_SIDE };
	class G_Sport_Red: None { CIV_SIDE };
	class G_Tactical_Black: None { ALL_SIDE };
	class G_Aviator: None { ALL_SIDE };
	class G_Lady_Mirror: None { CIV_SIDE };
	class G_Lady_Dark: None { CIV_SIDE };
	class G_Lady_Red: None { CIV_SIDE };
	class G_Lady_Blue: None { CIV_SIDE };
	class G_Diving { ALL_SIDE };
	class G_B_Diving: G_Diving { WEST_SIDE };
	class G_O_Diving: G_Diving { EAST_SIDE };
	class G_I_Diving: G_Diving { INDEP_SIDE };
	class G_Goggles_VR: None { ALL_SIDE };
	class G_Balaclava_blk: None { ALL_SIDE };
	class G_Balaclava_oli: G_Balaclava_blk { ALL_SIDE };
	class G_Balaclava_combat: G_Balaclava_blk { ALL_SIDE };
	class G_Balaclava_lowprofile: G_Balaclava_blk { ALL_SIDE };
	class G_Bandanna_blk: G_Balaclava_blk { ALL_SIDE };
	class G_Bandanna_oli: G_Bandanna_blk { ALL_SIDE };
	class G_Bandanna_khk: G_Bandanna_blk { ALL_SIDE };
	class G_Bandanna_tan: G_Bandanna_blk { ALL_SIDE };
	class G_Bandanna_beast: G_Bandanna_blk { ALL_SIDE };
	class G_Bandanna_shades: G_Bandanna_blk { ALL_SIDE };
	class G_Bandanna_sport: G_Bandanna_blk { ALL_SIDE };
	class G_Bandanna_aviator: G_Bandanna_blk { ALL_SIDE };
	class G_Shades_Blue: None { ALL_SIDE };
	class G_Sport_Blackred: None { CIV_SIDE };
	class G_Tactical_Clear: None { ALL_SIDE };
};