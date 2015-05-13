
#define NO_SIDE XLA_arsenal_side = -1;
#define EAST_SIDE XLA_arsenal_side = 0;
#define WEST_SIDE XLA_arsenal_side = 1;
#define INDEP_SIDE XLA_arsenal_side = 2;
#define CIV_SIDE XLA_arsenal_side = 3;
#define NEUTRAL_SIDE XLA_arsenal_side = 4;
#define ENEMY_SIDE XLA_arsenal_side = 5;
#define FRIENDLY_SIDE XLA_arsenal_side = 6;
#define LOGIC_SIDE XLA_arsenal_side = 7;


class CfgWeapons {

    class Default;

    /* PRIMARY WEAPONS */
    class RifleCore: Default {NO_SIDE};

    class Rifle_Base_F;
    class arifle_Katiba_Base_F: Rifle_Base_F { EAST_SIDE };
    class arifle_MX_Base_F: Rifle_Base_F { WEST_SIDE }; 
    class SDAR_base_F: Rifle_Base_F { FRIENDLY_SIDE };
    class Tavor_base_F: Rifle_Base_F { INDEP_SIDE };
    class mk20_base_F: Rifle_Base_F { INDEP_SIDE };
    class SMG_01_Base: Rifle_Base_F { WEST_SIDE};
    class SMG_02_base_F: Rifle_Base_F {WEST_SIDE};
    class pdw2000_base_F: Rifle_Base_F {INDEP_SIDE};

    class Rifle_Long_Base_F;
    class EBR_base_F: Rifle_Long_Base_F {FRIENDLY_SIDE};
    class GM6_base_F: Rifle_Long_Base_F {EAST_SIDE};
    class LRR_base_F: Rifle_Long_Base_F {WEST_SIDE};
    class LMG_Mk200_F: Rifle_Long_Base_F {INDEP_SIDE};
    class LMG_Zafir_F: Rifle_Long_Base_F {EAST_SIDE};
    class DMR_01_base_F: Rifle_Long_Base_F {EAST_SIDE};
    class DMR_02_base_F: Rifle_Long_Base_F {WEST_SIDE};
    class DMR_03_base_F: Rifle_Long_Base_F {WEST_SIDE};
    class DMR_04_base_F: Rifle_Long_Base_F {EAST_SIDE};
    class DMR_05_base_F: Rifle_Long_Base_F {EAST_SIDE};
    class DMR_06_base_F: Rifle_Long_Base_F {INDEP_SIDE};
    class MMG_01_base_F: Rifle_Long_Base_F {EAST_SIDE};
    class MMG_02_base_F: Rifle_Long_Base_F {WEST_SIDE};

    /* HANDGUNS */
    class PistolCore: Default {NO_SIDE};

    class Pistol_Base_F;
    class hgun_P07_F : Pistol_Base_F {WEST_SIDE};
    class hgun_Rook40_F: Pistol_Base_F {EAST_SIDE};
    class hgun_ACPC2_F: Pistol_Base_F {INDEP_SIDE};
    class hgun_Pistol_heavy_01_F: Pistol_Base_F {WEST_SIDE};
    class hgun_Pistol_heavy_02_F: Pistol_Base_F {EAST_SIDE};


    /* SECONDARY WEAPONS */
    class LauncherCore: Default {NO_SIDE};

    class Launcher_Base_F;
    class launch_NLAW_F: Launcher_Base_F {FRIENDLY_SIDE};
    class launch_RPG32_F: Launcher_Base_F {EAST_SIDE};

    class launch_Titan_base;
    class launch_B_Titan_F: launch_Titan_base {WEST_SIDE};
    class launch_I_Titan_F: launch_Titan_base {INDEP_SIDE};
    class launch_O_Titan_F: launch_Titan_base {EAST_SIDE};

    class launch_Titan_short_base;
    class launch_B_Titan_short_F: launch_Titan_short_base {WEST_SIDE};
    class launch_I_Titan_short_F: launch_Titan_short_base {INDEP_SIDE};
    class launch_O_Titan_short_F: launch_Titan_short_base {EAST_SIDE};

    /* ITEMS */
    class ItemCore: Default {FRIENDLY_SIDE};
    class Binocular: Default {FRIENDLY_SIDE};   
    class NVGoggles: Binocular {WEST_SIDE};
    class NVGoggles_OPFOR: NVGoggles {EAST_SIDE};
    class NVGoggles_INDEP: NVGoggles {INDEP_SIDE};
    class Laserdesignator: Binocular {WEST_SIDE};
    class Laserdesignator_02: Laserdesignator {INDEP_SIDE};
    class Laserdesignator_03: Laserdesignator {EAST_SIDE};
    class UavTerminal_base;
    class B_UavTerminal : UavTerminal_base {WEST_SIDE};
    class I_UavTerminal : UavTerminal_base {INDEP_SIDE};
    class O_UavTerminal : UavTerminal_base {EAST_SIDE};

    /* VESTS */
    class Vest_NoCamo_Base: ItemCore {NO_SIDE};
    class Vest_Camo_Base: ItemCore {NO_SIDE};

    class V_BandollierB_khk: Vest_Camo_Base {EAST_SIDE};
    class V_Chestrig_khk: Vest_Camo_Base {EAST_SIDE};
    class V_Chestrig_oli: Vest_Camo_Base {INDEP_SIDE};
    class V_HarnessO_brn: Vest_NoCamo_Base {EAST_SIDE};
    class V_HarnessOGL_brn: Vest_NoCamo_Base {EAST_SIDE};
    class V_PlateCarrier1_blk: Vest_Camo_Base {WEST_SIDE};
    class V_PlateCarrier1_rgr: Vest_NoCamo_Base {WEST_SIDE};
    class V_PlateCarrier3_rgr: Vest_NoCamo_Base {WEST_SIDE};
    class V_PlateCarrierGL_rgr: Vest_NoCamo_Base {WEST_SIDE};
    class V_PlateCarrierIA1_dgtl: Vest_NoCamo_Base {INDEP_SIDE};
    class V_PlateCarrierSpec_rgr: Vest_NoCamo_Base {WEST_SIDE};
    class V_Press_F: Vest_Camo_Base { CIV_SIDE };
    class V_Rangemaster_belt: Vest_NoCamo_Base {FRIENDLY_SIDE};
    class V_RebreatherB: Vest_Camo_Base { WEST_SIDE };
    class V_RebreatherIA: V_RebreatherB {INDEP_SIDE};
    class V_RebreatherIR: V_RebreatherB {EAST_SIDE};
    class V_TacVest_blk_POLICE: Vest_Camo_Base {CIV_SIDE};
    class V_TacVest_camo: Vest_Camo_Base {FRIENDLY_SIDE};
    class V_TacVest_khk: Vest_Camo_Base {FRIENDLY_SIDE};
    class V_TacVestCamo_khk: Vest_Camo_Base {FRIENDLY_SIDE};
    class V_TacVestIR_blk: Vest_NoCamo_Base {FRIENDLY_SIDE};

    // Uniforms
    class Uniform_Base: ItemCore {NO_SIDE};
    class U_AntigonaBody: Uniform_Base { CIV_SIDE };
    class U_AttisBody: Uniform_Base { CIV_SIDE };
    class U_B_CombatUniform_mcam: Uniform_Base { WEST_SIDE };
    class U_B_CombatUniform_mcam_tshirt: Uniform_Base { WEST_SIDE };
    class U_B_CombatUniform_mcam_vest: Uniform_Base { WEST_SIDE };
    class U_B_CombatUniform_mcam_worn: Uniform_Base { WEST_SIDE };
    class U_B_CombatUniform_sgg: Uniform_Base { WEST_SIDE };
    class U_B_CombatUniform_sgg_tshirt: Uniform_Base { WEST_SIDE };
    class U_B_CombatUniform_sgg_vest: Uniform_Base { WEST_SIDE };
    class U_B_CombatUniform_wdl: Uniform_Base { WEST_SIDE };
    class U_B_CombatUniform_wdl_tshirt: Uniform_Base { WEST_SIDE };
    class U_B_CombatUniform_wdl_vest: Uniform_Base { WEST_SIDE };
    class U_B_CTRG_1: Uniform_Base { WEST_SIDE };
    class U_B_CTRG_2: Uniform_Base { WEST_SIDE };
    class U_B_CTRG_3: Uniform_Base { WEST_SIDE };
    class U_B_FullGhillie_ard : Uniform_Base { WEST_SIDE };
    class U_B_FullGhillie_lsh : Uniform_Base { WEST_SIDE };
    class U_B_FullGhillie_sard : Uniform_Base { WEST_SIDE };
    class U_B_GhillieSuit: Uniform_Base { WEST_SIDE };
    class U_B_HeliPilotCoveralls: Uniform_Base { WEST_SIDE };
    class U_B_PilotCoveralls: Uniform_Base { WEST_SIDE };
    class U_B_Protagonist_VR : Uniform_Base {NO_SIDE};
    class U_B_Soldier_VR : Uniform_Base {NO_SIDE};
    class U_B_SpecopsUniform_sgg: Uniform_Base { WEST_SIDE };
    class U_B_survival_uniform: Uniform_Base { WEST_SIDE };
    class U_B_Wetsuit: Uniform_Base { WEST_SIDE };
    class U_BG_Guerilla1_1: Uniform_Base { WEST_SIDE };
    class U_BG_Guerilla2_1: Uniform_Base { WEST_SIDE };
    class U_BG_Guerilla2_2: Uniform_Base { WEST_SIDE };
    class U_BG_Guerilla2_3: Uniform_Base { WEST_SIDE };
    class U_BG_Guerilla3_1: Uniform_Base { WEST_SIDE };
    class U_BG_Guerilla3_2: Uniform_Base { WEST_SIDE };
    class U_BG_Guerrilla_6_1: Uniform_Base { WEST_SIDE };
    class U_BG_leader: Uniform_Base { WEST_SIDE };
    class U_C_Commoner1_1: Uniform_Base { CIV_SIDE };
    class U_C_Commoner1_2: Uniform_Base { CIV_SIDE };
    class U_C_Commoner1_3: Uniform_Base { CIV_SIDE };
    class U_C_Commoner2_1: Uniform_Base { CIV_SIDE };
    class U_C_Commoner2_2: Uniform_Base { CIV_SIDE };
    class U_C_Commoner2_3: Uniform_Base { CIV_SIDE };
    class U_C_Commoner_shorts: Uniform_Base { CIV_SIDE };
    class U_C_Driver_1 : Uniform_Base { CIV_SIDE };
    class U_C_Driver_1_black : Uniform_Base { CIV_SIDE };
    class U_C_Driver_1_blue : Uniform_Base { CIV_SIDE };
    class U_C_Driver_1_green : Uniform_Base { CIV_SIDE };
    class U_C_Driver_1_orange : Uniform_Base { CIV_SIDE };
    class U_C_Driver_1_red : Uniform_Base { CIV_SIDE };
    class U_C_Driver_1_white : Uniform_Base { CIV_SIDE };
    class U_C_Driver_1_yellow : Uniform_Base { CIV_SIDE };
    class U_C_Driver_2 : Uniform_Base { CIV_SIDE };
    class U_C_Driver_3 : Uniform_Base { CIV_SIDE };
    class U_C_Driver_4 : Uniform_Base { CIV_SIDE };
    class U_C_Farmer: Uniform_Base { CIV_SIDE };
    class U_C_Fisherman: Uniform_Base { CIV_SIDE };
    class U_C_FishermanOveralls: Uniform_Base { CIV_SIDE };
    class U_C_HunterBody_brn: Uniform_Base { CIV_SIDE };
    class U_C_HunterBody_grn: Uniform_Base { CIV_SIDE };
    class U_C_Journalist: Uniform_Base { CIV_SIDE };
    class U_C_Novak: Uniform_Base { CIV_SIDE };
    class U_C_Poloshirt_blue: Uniform_Base { CIV_SIDE };
    class U_C_Poloshirt_burgundy: Uniform_Base { CIV_SIDE };
    class U_C_Poloshirt_redwhite: Uniform_Base { CIV_SIDE };
    class U_C_Poloshirt_salmon: Uniform_Base { CIV_SIDE };
    class U_C_Poloshirt_stripped: Uniform_Base { CIV_SIDE };
    class U_C_Poloshirt_tricolour: Uniform_Base { CIV_SIDE };
    class U_C_Poor_1: Uniform_Base { CIV_SIDE };
    class U_C_Poor_2: Uniform_Base { CIV_SIDE };
    class U_C_Poor_shorts_1: Uniform_Base { CIV_SIDE };
    class U_C_Poor_shorts_2: Uniform_Base { CIV_SIDE };
    class U_C_PriestBody: Uniform_Base { CIV_SIDE };
    class U_C_Scavenger_1: Uniform_Base { CIV_SIDE };
    class U_C_Scavenger_2: Uniform_Base { CIV_SIDE };
    class U_C_Scientist: Uniform_Base { CIV_SIDE };
    class U_C_ShirtSurfer_shorts: Uniform_Base { CIV_SIDE };
    class U_C_Soldier_VR : Uniform_Base { NO_SIDE };
    class U_C_TeeSurfer_shorts_1: Uniform_Base { CIV_SIDE };
    class U_C_TeeSurfer_shorts_2: Uniform_Base { CIV_SIDE };
    class U_C_WorkerCoveralls: Uniform_Base { CIV_SIDE };
    class U_C_WorkerOveralls: Uniform_Base { CIV_SIDE };
    class U_Competitor: Uniform_Base { CIV_SIDE };
    class U_I_CombatUniform: Uniform_Base { INDEP_SIDE };
    class U_I_CombatUniform_shortsleeve: Uniform_Base { INDEP_SIDE };
    class U_I_CombatUniform_tshirt: Uniform_Base { INDEP_SIDE };
    class U_I_FullGhillie_ard : Uniform_Base { INDEP_SIDE };
    class U_I_FullGhillie_lsh : Uniform_Base { INDEP_SIDE };
    class U_I_FullGhillie_sard : Uniform_Base { INDEP_SIDE };
    class U_I_G_resistanceLeader_F: Uniform_Base { INDEP_SIDE };
    class U_I_G_Story_Protagonist_F: Uniform_Base { INDEP_SIDE };
    class U_I_GhillieSuit: Uniform_Base { INDEP_SIDE };
    class U_I_HeliPilotCoveralls: Uniform_Base { INDEP_SIDE };
    class U_I_OfficerUniform: Uniform_Base { INDEP_SIDE };
    class U_I_pilotCoveralls: Uniform_Base { INDEP_SIDE };
    class U_I_Protagonist_VR : Uniform_Base { INDEP_SIDE };
    class U_I_Soldier_VR : Uniform_Base { INDEP_SIDE };
    class U_I_Wetsuit: Uniform_Base { INDEP_SIDE };
    class U_IG_Guerilla1_1: Uniform_Base { INDEP_SIDE };
    class U_IG_Guerilla2_1: Uniform_Base { INDEP_SIDE };
    class U_IG_Guerilla2_2: Uniform_Base { INDEP_SIDE };
    class U_IG_Guerilla2_3: Uniform_Base { INDEP_SIDE };
    class U_IG_Guerilla3_1: Uniform_Base { INDEP_SIDE };
    class U_IG_Guerilla3_2: Uniform_Base { INDEP_SIDE };
    class U_IG_Guerrilla_6_1: Uniform_Base { INDEP_SIDE};
    class U_IG_leader: Uniform_Base { INDEP_SIDE };
    class U_IG_Menelaos: Uniform_Base { CIV_SIDE };
    class U_KerryBody: Uniform_Base { CIV_SIDE };
    class U_Marshal: Uniform_Base { CIV_SIDE };
    class U_MillerBody: Uniform_Base { CIV_SIDE };
    class U_NikosAgedBody : Uniform_Base { CIV_SIDE };
    class U_NikosBody: Uniform_Base { CIV_SIDE };
    class U_O_CombatUniform_ocamo: Uniform_Base { EAST_SIDE };
    class U_O_CombatUniform_oucamo: Uniform_Base { EAST_SIDE };
    class U_O_FullGhillie_ard : Uniform_Base { EAST_SIDE };
    class U_O_FullGhillie_lsh : Uniform_Base { EAST_SIDE };
    class U_O_FullGhillie_sard : Uniform_Base { EAST_SIDE };
    class U_O_GhillieSuit: Uniform_Base { EAST_SIDE };
    class U_O_OfficerUniform_ocamo: Uniform_Base { EAST_SIDE };
    class U_O_PilotCoveralls: Uniform_Base { EAST_SIDE };
    class U_O_Protagonist_VR : Uniform_Base { NO_SIDE };
    class U_O_Soldier_VR : Uniform_Base { NO_SIDE };
    class U_O_SpecopsUniform_blk: Uniform_Base { EAST_SIDE };
    class U_O_SpecopsUniform_ocamo: Uniform_Base { EAST_SIDE };
    class U_O_Wetsuit: Uniform_Base { EAST_SIDE };
    class U_OG_Guerilla1_1: Uniform_Base { EAST_SIDE };
    class U_OG_Guerilla2_1: Uniform_Base { EAST_SIDE };
    class U_OG_Guerilla2_2: Uniform_Base { EAST_SIDE };
    class U_OG_Guerilla2_3: Uniform_Base { EAST_SIDE };
    class U_OG_Guerilla3_1: Uniform_Base { EAST_SIDE };
    class U_OG_Guerilla3_2: Uniform_Base { EAST_SIDE };
    class U_OG_Guerrilla_6_1: Uniform_Base { EAST_SIDE };
    class U_OG_leader: Uniform_Base { EAST_SIDE };
    class U_OI_Scientist: Uniform_Base { CIV_SIDE };
    class U_OrestesBody: Uniform_Base { CIV_SIDE };
    class U_Rangemaster: Uniform_Base { CIV_SIDE };

    /* HATS & HELMETS */

    // This is the base class of all helmets. Sadly it's also a real helmet
    // There is extra handling for this class in the side-check of the condition
    class H_HelmetB: ItemCore { NO_SIDE };

    class H_Bandanna_surfer: H_HelmetB {CIV_SIDE };
    class H_Bandanna_camo: H_Bandanna_surfer { FRIENDLY_SIDE };
    class H_Bandanna_cbr: H_Bandanna_surfer { FRIENDLY_SIDE };
    class H_Bandanna_gry: H_Bandanna_surfer { FRIENDLY_SIDE };
    class H_Bandanna_khk: H_Bandanna_surfer { FRIENDLY_SIDE };
    class H_Bandanna_mcamo: H_Bandanna_surfer { WEST_SIDE };
    class H_Bandanna_sand: H_Bandanna_surfer { FRIENDLY_SIDE };
    class H_Bandanna_sgg: H_Bandanna_surfer { FRIENDLY_SIDE };

    class H_BandMask_blk: H_HelmetB { FRIENDLY_SIDE };
    
    class H_Beret_blk: H_HelmetB { FRIENDLY_SIDE };
    class H_Beret_02: H_Beret_blk { WEST_SIDE };    
    class H_Beret_blk_POLICE: H_Beret_blk { CIV_SIDE};
    class H_Beret_ocamo: H_Beret_blk { EAST_SIDE };

    class H_Booniehat_khk: H_HelmetB { FRIENDLY_SIDE };
    class H_Booniehat_dgtl: H_Booniehat_khk { INDEP_SIDE };
    class H_Booniehat_indp: H_Booniehat_khk { INDEP_SIDE }; 
    class H_Booniehat_mcamo: H_Booniehat_khk { WEST_SIDE };

    class H_Cap_red: H_HelmetB { CIV_SIDE };
    class H_Cap_blk: H_Cap_red { FRIENDLY_SIDE };
    class H_Cap_blk_Raven: H_Cap_red { INDEP_SIDE };
    class H_Cap_brn_SPECOPS: H_Cap_red { EAST_SIDE };   
    class H_Cap_grn: H_Cap_red { FRIENDLY_SIDE };
    class H_Cap_khaki_specops_UK: H_Cap_red { WEST_SIDE};
    class H_Cap_oli: H_Cap_red { FRIENDLY_SIDE };   
    class H_Cap_tan: H_Cap_red { FRIENDLY_SIDE };
    class H_Cap_tan_specops_US: H_Cap_red { WEST_SIDE };
    class H_Cap_usblack: H_Cap_red { WEST_SIDE };

    class H_Cap_headphones: H_HelmetB { FRIENDLY_SIDE };

    class H_CrewHelmetHeli_B: H_HelmetB { WEST_SIDE };
    class H_CrewHelmetHeli_I: H_CrewHelmetHeli_B { INDEP_SIDE };
    class H_CrewHelmetHeli_O: H_CrewHelmetHeli_B { EAST_SIDE };

    class H_Hat_blue: H_HelmetB { CIV_SIDE };

    class H_Helmet_Kerry: H_HelmetB { WEST_SIDE };
    class H_HelmetB_black: H_HelmetB { WEST_SIDE };
    class H_HelmetB_camo: H_HelmetB { WEST_SIDE };
    class H_HelmetB_desert: H_HelmetB { WEST_SIDE };
    class H_HelmetB_grass: H_HelmetB { WEST_SIDE };
    class H_HelmetB_light: H_HelmetB { WEST_SIDE };
    class H_HelmetB_paint: H_HelmetB { WEST_SIDE };
    class H_HelmetB_plain_mcamo: H_HelmetB { WEST_SIDE };
    class H_HelmetB_sand: H_HelmetB { WEST_SIDE };
    class H_HelmetB_snakeskin: H_HelmetB { WEST_SIDE };

    class H_HelmetCrew_B: H_HelmetB { WEST_SIDE };
    class H_HelmetCrew_I: H_HelmetCrew_B { INDEP_SIDE };
    class H_HelmetCrew_O: H_HelmetCrew_B { EAST_SIDE };

    class H_HelmetIA: H_HelmetB { INDEP_SIDE };

    class H_HelmetO_ocamo: H_HelmetB { EAST_SIDE };

    class H_MilCap_ocamo : H_HelmetB { EAST_SIDE };
    class H_MilCap_oucamo : H_MilCap_ocamo { EAST_SIDE };
    class H_MilCap_blue: H_MilCap_ocamo { CIV_SIDE };
    class H_MilCap_dgtl: H_MilCap_oucamo { INDEP_SIDE };
    class H_MilCap_gry: H_MilCap_ocamo { FRIENDLY_SIDE };
    class H_MilCap_mcamo: H_MilCap_ocamo { WEST_SIDE };

    class H_PilotHelmetFighter_B: H_HelmetB { WEST_SIDE };
    class H_PilotHelmetFighter_I: H_PilotHelmetFighter_B { INDEP_SIDE };
    class H_PilotHelmetFighter_O: H_PilotHelmetFighter_B { EAST_SIDE };

    class H_PilotHelmetHeli_B: H_HelmetB { WEST_SIDE };
    class H_PilotHelmetHeli_I: H_PilotHelmetHeli_B { INDEP_SIDE };
    class H_PilotHelmetHeli_O: H_PilotHelmetHeli_B { EAST_SIDE };

    class H_RacingHelmet_1_F: H_HelmetB_camo { CIV_SIDE };

    class H_Shemag_khk: H_HelmetB { FRIENDLY_SIDE };
    class H_ShemagOpen_khk: H_HelmetB { FRIENDLY_SIDE };
    class H_StrawHat: H_HelmetB { CIV_SIDE };
    class H_TurbanO_blk: H_HelmetB { FRIENDLY_SIDE };
    class H_Watchcap_blk: H_HelmetB { FRIENDLY_SIDE };

};

class CfgMagazines {
    // All magazines are available to all sides since the arsenal only offers gun-specific ammo
    // Exceptions: Grenades that are obviously faction specific.
    class Default;
    class CA_Magazine: Default { FRIENDLY_SIDE};
    class B_IR_Grenade: CA_Magazine { WEST_SIDE };
    class I_IR_Grenade: B_IR_Grenade { INDEP_SIDE };
    class O_IR_Grenade: B_IR_Grenade { EAST_SIDE }; 
};


class CfgGlasses {
    class None;
    class G_Spectacles: None { CIV_SIDE };
    class G_Spectacles_Tinted: None { CIV_SIDE };
    class G_Combat: None { FRIENDLY_SIDE };
    class G_Lowprofile: None { FRIENDLY_SIDE };
    class G_Shades_Black: None { FRIENDLY_SIDE };
    class G_Shades_Green: None { FRIENDLY_SIDE };
    class G_Shades_Red: None { CIV_SIDE };
    class G_Squares: None { CIV_SIDE };
    class G_Squares_Tinted: None { CIV_SIDE };
    class G_Sport_BlackWhite: None { CIV_SIDE };
    class G_Sport_Blackyellow: None { CIV_SIDE };
    class G_Sport_Greenblack: None { CIV_SIDE };
    class G_Sport_Checkered: None { CIV_SIDE };
    class G_Sport_Red: None { CIV_SIDE };
    class G_Tactical_Black: None { FRIENDLY_SIDE };
    class G_Aviator: None { FRIENDLY_SIDE };
    class G_Lady_Mirror: None { CIV_SIDE };
    class G_Lady_Dark: None { CIV_SIDE };
    class G_Lady_Red: None { CIV_SIDE };
    class G_Lady_Blue: None { CIV_SIDE };
    class G_Diving { FRIENDLY_SIDE };
    class G_B_Diving: G_Diving { WEST_SIDE };
    class G_O_Diving: G_Diving { EAST_SIDE };
    class G_I_Diving: G_Diving { INDEP_SIDE };
    class G_Goggles_VR: None { FRIENDLY_SIDE };
    class G_Goggles_clear : None { FRIENDLY_SIDE };
    class G_Balaclava_blk: None { FRIENDLY_SIDE };
    class G_Balaclava_oli: G_Balaclava_blk { FRIENDLY_SIDE };
    class G_Balaclava_combat: G_Balaclava_blk { FRIENDLY_SIDE };
    class G_Balaclava_lowprofile: G_Balaclava_blk { FRIENDLY_SIDE };
    class G_Bandanna_blk: G_Balaclava_blk { FRIENDLY_SIDE };
    class G_Bandanna_oli: G_Bandanna_blk { FRIENDLY_SIDE };
    class G_Bandanna_khk: G_Bandanna_blk { FRIENDLY_SIDE };
    class G_Bandanna_tan: G_Bandanna_blk { FRIENDLY_SIDE };
    class G_Bandanna_beast: G_Bandanna_blk { FRIENDLY_SIDE };
    class G_Bandanna_shades: G_Bandanna_blk { FRIENDLY_SIDE };
    class G_Bandanna_sport: G_Bandanna_blk { FRIENDLY_SIDE };
    class G_Bandanna_aviator: G_Bandanna_blk { FRIENDLY_SIDE };
    class G_Shades_Blue: None { FRIENDLY_SIDE };
    class G_Sport_Blackred: None { CIV_SIDE };
    class G_Tactical_Clear: None { FRIENDLY_SIDE };
};


class CfgVehicles {
    // static-weapon related backpacks have factions set,
    // so we only need to set the 'cargo' backpacks.
    class ReammoBox;
    class Bag_Base: ReammoBox { NO_SIDE };

    class B_AssaultPack_Base: Bag_Base { FRIENDLY_SIDE };
    class B_AssaultPack_dgtl: B_AssaultPack_Base { INDEP_SIDE };
    class B_AssaultPack_mcamo: B_AssaultPack_Base { WEST_SIDE };

    class B_Bergen_Base: Bag_Base { FRIENDLY_SIDE };
    class B_Bergen_mcamo: B_Bergen_Base { WEST_SIDE };

    class B_Carryall_Base: Bag_Base { FRIENDLY_SIDE };
    class B_Carryall_mcamo: B_Carryall_Base { WEST_SIDE };
    class B_Carryall_ocamo: B_Carryall_Base { EAST_SIDE };
    class B_Carryall_oucamo: B_Carryall_Base { EAST_SIDE };

    class B_FieldPack_Base: Bag_Base { EAST_SIDE };

    class B_HuntingBackpack : Bag_Base { CIV_SIDE };

    class B_Kitbag_Base: Bag_Base { FRIENDLY_SIDE };
    class B_Kitbag_mcamo: B_Kitbag_Base { WEST_SIDE };

    class B_OutdoorPack_Base: Bag_Base { CIV_SIDE };

    class B_Parachute: Bag_Base { FRIENDLY_SIDE };

    class B_TacticalPack_Base: Bag_Base { FRIENDLY_SIDE };
    class B_TacticalPack_mcamo : B_TacticalPack_Base { WEST_SIDE };
    class B_TacticalPack_ocamo : B_AssaultPack_Base { EAST_SIDE };

    class Weapon_Bag_Base;
    class B_UAV_01_backpack_F: Weapon_Bag_Base { WEST_SIDE };
    class I_UAV_01_backpack_F: B_UAV_01_backpack_F { INDEP_SIDE };
    class O_UAV_01_backpack_F: B_UAV_01_backpack_F { EAST_SIDE };

    class B_HMG_01_support_F: Bag_Base { WEST_SIDE };
    class O_HMG_01_support_F: B_HMG_01_support_F { EAST_SIDE };
    class I_HMG_01_support_F: B_HMG_01_support_F { INDEP_SIDE };

    class B_HMG_01_support_high_F: B_HMG_01_support_F { WEST_SIDE };
    class O_HMG_01_support_high_F: B_HMG_01_support_high_F { EAST_SIDE };
    class I_HMG_01_support_high_F: B_HMG_01_support_high_F { INDEP_SIDE };

    class B_HMG_01_weapon_F: Weapon_Bag_Base { WEST_SIDE };
    class O_HMG_01_weapon_F: B_HMG_01_weapon_F { EAST_SIDE };
    class I_HMG_01_weapon_F: B_HMG_01_weapon_F { INDEP_SIDE };

    class B_HMG_01_A_weapon_F: B_HMG_01_weapon_F { WEST_SIDE };
    class O_HMG_01_A_weapon_F: B_HMG_01_A_weapon_F { EAST_SIDE };
    class I_HMG_01_A_weapon_F: B_HMG_01_A_weapon_F { INDEP_SIDE };

    class B_GMG_01_weapon_F: B_HMG_01_weapon_F { WEST_SIDE };
    class O_GMG_01_weapon_F: B_GMG_01_weapon_F { EAST_SIDE };
    class I_GMG_01_weapon_F: B_GMG_01_weapon_F { INDEP_SIDE };

    class B_GMG_01_A_weapon_F: B_HMG_01_weapon_F { WEST_SIDE };
    class O_GMG_01_A_weapon_F: B_GMG_01_A_weapon_F { EAST_SIDE };
    class I_GMG_01_A_weapon_F: B_GMG_01_A_weapon_F { INDEP_SIDE };

    class B_HMG_01_high_weapon_F: B_HMG_01_weapon_F { WEST_SIDE };
    class O_HMG_01_high_weapon_F: B_HMG_01_high_weapon_F { EAST_SIDE };
    class I_HMG_01_high_weapon_F: B_HMG_01_high_weapon_F { INDEP_SIDE };

    class B_GMG_01_high_weapon_F: B_HMG_01_high_weapon_F { WEST_SIDE };
    class O_GMG_01_high_weapon_F: B_GMG_01_high_weapon_F { EAST_SIDE };
    class I_GMG_01_high_weapon_F: B_GMG_01_high_weapon_F { INDEP_SIDE };

    class Mortar_01_base_F;
    class B_Mortar_01_F: Mortar_01_base_F { WEST_SIDE };
    class O_Mortar_01_F: Mortar_01_base_F { EAST_SIDE };
    class I_Mortar_01_F: Mortar_01_base_F { INDEP_SIDE };

    class I_G_Mortar_01_F: Mortar_01_base_F { WEST_SIDE };
    class B_G_Mortar_01_F: I_G_Mortar_01_F { EAST_SIDE };
    class O_G_Mortar_01_F: I_G_Mortar_01_F { INDEP_SIDE };

    class B_Mortar_01_support_F: Bag_Base { WEST_SIDE };
    class O_Mortar_01_support_F: B_Mortar_01_support_F { EAST_SIDE };
    class I_Mortar_01_support_F: B_Mortar_01_support_F { INDEP_SIDE };

    class B_Mortar_01_weapon_F: Weapon_Bag_Base { WEST_SIDE };
    class O_Mortar_01_weapon_F: B_Mortar_01_weapon_F { EAST_SIDE };
    class I_Mortar_01_weapon_F: B_Mortar_01_weapon_F { INDEP_SIDE };

    class Static_Designator_01_base_F;
    class B_Static_Designator_01_F: Static_Designator_01_base_F { WEST_SIDE };
    class B_Static_Designator_01_weapon_F: Weapon_Bag_Base { WEST_SIDE };

    class Static_Designator_02_base_F;
    class O_Static_Designator_02_F: Static_Designator_02_base_F { EAST_SIDE };
    class O_Static_Designator_02_weapon_F: Weapon_Bag_Base { EAST_SIDE };

    class AA_01_base_F;
    class B_static_AA_F: AA_01_base_F { WEST_SIDE };
    class O_static_AA_F: AA_01_base_F { EAST_SIDE };
    class I_static_AA_F: AA_01_base_F { INDEP_SIDE };

    class B_AA_01_weapon_F: Weapon_Bag_Base { WEST_SIDE };
    class O_AA_01_weapon_F: Weapon_Bag_Base { EAST_SIDE };
    class I_AA_01_weapon_F: Weapon_Bag_Base { INDEP_SIDE };

    class AT_01_base_F;
    class B_static_AT_F: AT_01_base_F { WEST_SIDE };
    class O_static_AT_F: AT_01_base_F { EAST_SIDE };
    class I_static_AT_F: AT_01_base_F { INDEP_SIDE };

    class B_AT_01_weapon_F: Weapon_Bag_Base { WEST_SIDE };
    class O_AT_01_weapon_F: Weapon_Bag_Base { EAST_SIDE };
    class I_AT_01_weapon_F: Weapon_Bag_Base { INDEP_SIDE };

    /*  

    // -------------------------------------------------------------------
    //  TFAR Radios (Backpacks)
    //  These are safe to include since they inherit from Bag_Base (scope=1)
    // -------------------------------------------------------------------

    class TFAR_Bag_Base: Bag_Base { NO_SIDE };
    class tf_rt1523g: TFAR_Bag_Base { WEST_SIDE };
    class tf_rt1523g_big: tf_rt1523g { WEST_SIDE };
    class tf_rt1523g_black: tf_rt1523g { WEST_SIDE };
    class tf_rt1523g_fabric: tf_rt1523g { WEST_SIDE };
    class tf_rt1523g_green: tf_rt1523g { WEST_SIDE };
    class tf_rt1523g_rhs: tf_rt1523g { WEST_SIDE };
    class tf_rt1523g_sage: tf_rt1523g { WEST_SIDE };
    class tf_anarc210: TFAR_Bag_Base { WEST_SIDE };

    class tf_anprc155: TFAR_Bag_Base { INDEP_SIDE };
    class tf_anprc155_coyote: tf_anprc155 { INDEP_SIDE  };
    class tf_anarc164: TFAR_Bag_Base { INDEP_SIDE };

    class tf_mr3000: TFAR_Bag_Base { EAST_SIDE };
    class tf_mr3000_multicam: tf_mr3000 { EAST_SIDE };
    class tf_mr3000_rhs : tf_mr3000 { EAST_SIDE };
    class tf_mr6000l: TFAR_Bag_Base { EAST_SIDE };

    */

};