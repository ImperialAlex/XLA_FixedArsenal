#define NO_SIDE -1
#define EAST_SIDE 0
#define WEST_SIDE 1
#define INDEP_SIDE 2
#define CIV_SIDE 3
#define NEUTRAL_SIDE 4
#define ENEMY_SIDE 5
#define FRIENDLY_SIDE 6
#define LOGIC_SIDE 7

//	The following are some whitelists for common mods.
//	 They do not necessarily include all items from a mod, but they are a handy starting point.

// -------------------------------------------------------------------
// 		@3CB_BAF_UNITS
// -------------------------------------------------------------------
_3CB_uniforms = [
	"UK3CB_BAF_Uniform_MTP",
	"UK3CB_BAF_Uniform_MTP_ShortSleeve",
	"UK3CB_BAF_Uniform_HeliPilot_RN"
];
_3CB_vests = [
	"STKR_Osprey_R",
	"STKR_Osprey_G",
	"STKR_Osprey_SL",
	"STKR_Osprey_MG"	
];
_3CB_helmets = [
	"UK3CB_BAF_Helmet_HeliPilot_RN",
	"STKR_MK7",
	"STKR_MK7_Scrim",
	"STKR_MK7_ScrimB"			
];
_3CB_backpacks = [
	"STKR_PackCom",
	"STKR_PackCom_A",
	"STKR_PackCom_B",
	"STKR_Predator",
	"STKR_Predator_A",
	"STKR_Predator_AT",
	"STKR_PredatorBow",
	"STKR_PredatorBow_A",
	"STKR_PredatorBow_B",
	"STKR_MLode",
	"STKR_MLode_A",
	"STKR_MLode_Med",
	"STKR_MLode_GPMG",
	"STKR_MLode_ENG",
	"STKR_MLode_EXP",
	"STKR_MLode_LMG",
	"UK3CB_Kitbag_mcamo",
	"UK3CB_Kitbag_mcamo_LMG",
	"UK3CB_Kitbag_mcamo_EXP",
	"UK3CB_Carryall_mcamo",
	"UK3CB_Carryall_mcamo_MAT"		
];
_3CB_guns = [
	"STKR_HMNVS",
	"UK3CB_CUP_lmg_L110A1_ACOG"
];


// -------------------------------------------------------------------
// 		AGM Grenades
// -------------------------------------------------------------------
_agm_grenades_Magazines = [
	"AGM_HandFlare_White",
	"AGM_HandFlare_Red",
	"AGM_HandFlare_Green",
	"AGM_HandFlare_Yellow",
	"AGM_M84",
	"3Rnd_UGL_FlareGreen_F", //Do we need this? Seems like vanilla
	"6Rnd_GreenSignal_F",
	"6Rnd_RedSignal_F"
];
_agm_grenades_Weapons = [
	"AGM_HandFlare_WhiteMuzzle",
	"AGM_HandFlare_RedMuzzle",
	"AGM_HandFlare_GreenMuzzle",
	"AGM_HandFlare_YellowMuzzle",
	"AGM_M84Muzzle"
];

// -------------------------------------------------------------------
// 		AGM Attach
// -------------------------------------------------------------------
_agm_attach_Weapons = [
	"AGM_IR_Strobe_Item"
];
_agm_attach_Magazines = [
	"B_IR_Grenade",
	"Chemlight_green"
];

// -------------------------------------------------------------------
// 		AGM Ballistics
// -------------------------------------------------------------------
_agm_ballistics_Magazines = [
	"AGM_30Rnd_65x39_caseless_mag_Tracer_Dim",
	"AGM_30Rnd_65x39_caseless_mag_SD",
	"AGM_30Rnd_65x39_caseless_mag_AP",
	"AGM_30Rnd_65x39_caseless_green_mag_Tracer_Dim",
	"AGM_30Rnd_65x39_caseless_green_mag_SD",
	"AGM_30Rnd_65x39_caseless_green_mag_AP",
	"AGM_30Rnd_556x45_Stanag_Tracer_Dim",
	"AGM_30Rnd_556x45_Stanag_SD",
	"AGM_30Rnd_556x45_Stanag_AP",
	"AGM_20Rnd_762x51_Mag_Tracer",
	"AGM_20Rnd_762x51_Mag_Tracer_Dim",
	"AGM_20Rnd_762x51_Mag_SD",
	"AGM_20Rnd_762x51_Mag_AP"
];
_agm_ballistics_attachments = [
	"AGM_muzzle_mzls_H",
	"AGM_muzzle_mzls_B",
	"AGM_muzzle_mzls_L",
	"AGM_muzzle_mzls_smg_01",
	"AGM_muzzle_mzls_smg_02"
];

// -------------------------------------------------------------------
// 		AGM Disposable (Launchers)
// -------------------------------------------------------------------
	//This is a design choice - do we want people saving spent tubes?
_agm_disposable_Weapons = [
	"AGM_launch_NLAW_Used_F"
];
_agm_disposable_Magazines = [
	"AGM_UsedTube_F"
];

// -------------------------------------------------------------------
// 		AGM Explosives
// -------------------------------------------------------------------
_agm_explosives_Weapons = [
	"AGM_Clacker",
	"AGM_M26_Clacker",
	"AGM_DefusalKit",
	"AGM_DeadManSwitch"
];
_agm_explosives_Magazines = [
	"ATMine_Range_Mag",
	"APERSBoundingMine_Range_Mag",
	"APERSMine_Range_Mag",
	"APERSTripMine_Wire_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"SatchelCharge_Remote_Mag",
	"DemoCharge_Remote_Mag",
	"SLAMDirectionalMine_Wire_Mag"
];

// -------------------------------------------------------------------
// 		AGM Hearing (Earbuds)
// -------------------------------------------------------------------
_agm_hearing_Weapons = [
	"AGM_EarBuds"
];

// -------------------------------------------------------------------
// 		AGM Interaction (Handcuffs)
// -------------------------------------------------------------------
_agm_interaction_Weapons = [
	"AGM_CableTie"
];

// -------------------------------------------------------------------
// 		AGM Logistics (UAV Batteries)
// -------------------------------------------------------------------
_agm_logistics_Weapons = [
	"AGM_UAVBattery"
];

// -------------------------------------------------------------------
// 		AGM Map (Maptool)
// -------------------------------------------------------------------
_agm_map_Weapons = [
	"AGM_MapTools"
];

// -------------------------------------------------------------------
// 		AGM Medical
// -------------------------------------------------------------------
_agm_medical_Weapons = [
	"AGM_Bandage",
	"AGM_Morphine",
	"AGM_Epipen",
	"AGM_Bloodbag"
];

// -------------------------------------------------------------------
// 		AGM Overheating (Spare Barrels)
// -------------------------------------------------------------------
_agm_overheating_Weapons = [
	"AGM_SpareBarrel"
];

// -------------------------------------------------------------------
// 		AGM Parachute (Altimeter)
// -------------------------------------------------------------------
_agm_parachute_Weapons = [
	"AGM_Altimeter"
];

// -------------------------------------------------------------------
// 		AGM Vector 
// -------------------------------------------------------------------
_agm_vector_Weapons = [
	"AGM_Vector",
	"AGM_Item_Vector"
];

// -------------------------------------------------------------------
// 		AGM Wind (Kestrel) 
// -------------------------------------------------------------------
_agm_wind_Weapons = [
	"AGM_ItemKestrel"
];


// -------------------------------------------------------------------
// 		@beretpack2
// -------------------------------------------------------------------
_BeretPackHeadgear = [
	"B_P_Beret",
	"B_P_BeretOff",
	"B_P_Beretpwrr",
	"B_P_Beretramc",
	"B_P_Beretramcoff",
	"B_P_BeretRct",
	"B_P_Beretrlc"
];


// -------------------------------------------------------------------
// 		@CUP (selected items only)
// -------------------------------------------------------------------
_CupGuns = [
	"CUP_sgun_AA12",
	"CUP_srifle_AS50_SBPMII",
	"CUP_srifle_AS50_AMPAS13c2",
	"CUP_srifle_AWM_des_SBPMII",
	"CUP_srifle_AWM_wdl_SBPMII",
	"CUP_hgun_Colt1911",
	"CUP_srifle_DMR_LeupoldMk4",
	"CUP_smg_EVO_MRad_Flashlight",
	"CUP_smg_EVO_MRad_Flashlight_Snds",
	"CUP_arifle_FNFAL",
	"CUP_arifle_FNFAL_ANPVS4",
	// "CUP_arifle_G36A",
	// "CUP_arifle_G36A_camo",
	// "CUP_arifle_G36K",
	// "CUP_arifle_G36K_camo",
	// "CUP_arifle_G36C",
	// "CUP_arifle_G36C_camo",
	// "CUP_arifle_MG36",
	// "CUP_arifle_MG36_camo",
	// "CUP_arifle_G36C_holo_snds",
	// "CUP_arifle_G36C_camo_holo_snds",
	"CUP_hgun_glock17_flashlight",
	"CUP_glaunch_M32",
	//"CUP_glaunch_M79",
	//"CUP_glaunch_Mk13",
	"CUP_launch_Javelin",
	"CUP_lmg_L7A2",
	"CUP_arifle_L85A2_Holo_laser",
	"CUP_arifle_L85A2_GL_Holo_laser",
	"CUP_arifle_L85A2_SUSAT_Laser",
	"CUP_arifle_L85A2_CWS_Laser",
	"CUP_arifle_L85A2_ACOG_Laser",
	"CUP_arifle_L85A2_GL_ACOG_Laser",
	"CUP_arifle_L86A2_ACOG",
	"CUP_lmg_L110A1_Aim_Laser",
	"CUP_hgun_M9",
	"CUP_hgun_M9_snds",
	"CUP_srifle_M15_Aim",
	"CUP_arifle_M16A2",
	"CUP_arifle_M16A2_GL",
	"CUP_arifle_M16A4_Aim_Laser",
	"CUP_arifle_M16A4_ACOG_Laser",
	"CUP_arifle_M16A4_GL",
	"CUP_arifle_M16A4_GL_ACOG_Laser",
	"CUP_arifle_M4A1",
	"CUP_arifle_M4A1_camo",
	"CUP_arifle_M4A1_camo_Aim",
	"CUP_arifle_M4A3_desert_Aim_Flashlight",
	"CUP_arifle_M4A3_desert_GL_ACOG_Laser",
	"CUP_arifle_M4A1_Aim",
	"CUP_arifle_M4A1_camo_AIM_snds",
	"CUP_arifle_M4A1_GL_Holo_Flashlight",
	"CUP_arifle_M4A1_GL_ACOG_Flashlight",
	"CUP_arifle_M4A1_camo_GL_Holo_Flashlight",
	"CUP_arifle_M4A1_camo_GL_Holo_Flashlight_Snds",
	"CUP_srifle_Mk12SPR_LeupoldM3LR",
	"CUP_srifle_M24_wdl_LeupoldMk4LRT",
	"CUP_srifle_M24_des_LeupoldMk4LRT",
	"CUP_srifle_M40A3",
	"CUP_launch_M47",
	"CUP_lmg_M60A4",
	"CUP_srifle_M107_LeupoldVX3",
	"CUP_srifle_M107_ANPAS13c2",
	"CUP_srifle_M110_ANPAS13c2",
	"CUP_srifle_M110_ANPVS10",
	"CUP_launch_M136",
	"CUP_sgun_M1014",
	"CUP_launch_MAAWS_Scope",
	"CUP_smg_MP5SD6",
	"CUP_smg_MP5A5",
	"CUP_launch_NLAW",
	// "CUP_arifle_Mk16_CQC",
	// "CUP_arifle_Mk16_CQC_FG_Aim_Laser_snds",
	// "CUP_arifle_Mk16_CQC_SFG_Holo",
	// "CUP_arifle_Mk16_STD_EGLM_ACOG_Laser",
	// "CUP_arifle_Mk16_STD_EGLM_ANPAS13c1_Laser_mfsup",
	// "CUP_arifle_Mk16_STD_FG_Holo_Laser",
	// "CUP_arifle_Mk16_STD_FG_LeupoldMk4CQT_Laser",
	// "CUP_arifle_Mk17_CQC_SFG_Aim_mfsup",
	// "CUP_arifle_Mk17_STD_FG_Aim_Laser_snds",
	// "CUP_arifle_Mk20_SB11420_snds",
	// "CUP_arifle_Mk17_STD_EGL_ElcanSpecter_Laser",
	// "CUP_arifle_Mk17_STD_FG_ANPAS13c1_Laser_Snds",
	"CUP_smg_EVO",
	"CUP_launch_FIM92Stinger",
	"CUP_hgun_Glock17",
	"CUP_hgun_glock17_flashlight_snds",
	"CUP_hgun_glock17_snds",
	"CUP_srifle_M110",
	"CUP_srifle_M14",
	"CUP_srifle_M24_des",
	"CUP_srifle_M24_wdl",
	"CUP_srifle_M24_ghillie",
	"CUP_launch_MAAWS",
	"CUP_launch_Mk153Mod0",
	"CUP_srifle_AS50",
	"CUP_srifle_AWM_des",
	"CUP_srifle_AWM_wdl",
	"CUP_hgun_Colt1911_snds",
	"CUP_lmg_L110A1",
	"CUP_arifle_L85A2",
	"CUP_arifle_L85A2_GL",
	"CUP_arifle_L86A2",
	"CUP_srifle_M107_Base",
	"CUP_arifle_M16A4_Base",
	"CUP_arifle_M16A4GL",
	"CUP_arifle_M4A1_BUIS_GL",
	"CUP_arifle_M4A1_BUIS_camo_GL",
	"CUP_arifle_M4A1_BUIS_desert_GL",
	"CUP_arifle_M4A1_black",
	"CUP_arifle_M4A1_desert",
	"CUP_srifle_Mk12SPR",
	// "CUP_arifle_Mk16_CQC_FG",
	// "CUP_arifle_Mk16_CQC_EGLM",
	// "CUP_arifle_Mk16_STD",
	// "CUP_arifle_Mk16_STD_FG",
	// "CUP_arifle_Mk16_STD_SFG",
	// "CUP_arifle_Mk16_STD_EGLM",
	// "CUP_arifle_Mk16_SV",
	// "CUP_arifle_Mk16_CQC_EGLM_Holo_Laser_mfsup",
	// "CUP_arifle_Mk17_CQC",
	// "CUP_arifle_Mk17_CQC_FG",
	// "CUP_arifle_Mk17_CQC_SFG",
	// "CUP_arifle_Mk17_CQC_EGLM",
	// "CUP_arifle_Mk17_STD",
	// "CUP_arifle_Mk17_STD_FG",
	// "CUP_arifle_Mk17_STD_SFG",
	// "CUP_arifle_Mk17_STD_EGLM",
	// "CUP_arifle_Mk20",
	// "CUP_arifle_Mk20_LeupoldMk4MRT"
	"XLA_dummy"
];

// -------------------------------------------------------------------
// 		@task_force_radio
// -------------------------------------------------------------------
_tfarItems = [
	//Rifleman radios
	"tf_rf7800str",
	"tf_anprc152",			//NATO
	//"tf_pnr1000a",		//CSAT
	//"tf_anprc154",		//AAF
	"tf_microdagr"			//Used to program Rifleman Radios
];
// TFAR Backpacks are already handled by @XLA_FixedArsenal itself

// Note that only adding the generic radios solves issues with 
// radios being 'shared' when saved and then loaded from the arsenal

// -------------------------------------------------------------------
// 		Blacklists -- exclude certain things that "slip through the cracks"
// -------------------------------------------------------------------

		_blacklistMagazine = [
			"mas_PG7V", "mas_PG7L", "mas_PG7VR", "mas_OG7", "mas_TBG7V", "mas_PG18", "mas_Metis", "mas_Metis_HE", "mas_LAW", "mas_M136", "mas_M136_HE", "mas_MAAWS", "mas_MAAWS_HE", "mas_SMAW", "mas_SMAW_HE", "mas_SMAW_NE", "mas_NLAW", "mas_NLAW_HE", "mas_TitanS", "mas_TitanS_HE", "mas_Stinger", "mas_Strela", "Sting_mas_AA_F", "RPG32_mas_AA_F", "30Rnd_mas_556x45_Stanag", "30Rnd_mas_556x45_T_Stanag", "200Rnd_mas_556x45_Stanag", "200Rnd_mas_556x45_T_Stanag", "100Rnd_mas_762x51_Stanag", "100Rnd_mas_762x51_T_Stanag", "100Rnd_mas_762x54_mag", "100Rnd_mas_762x54_T_mag", "100Rnd_mas_762x39_mag", "100Rnd_mas_762x39_T_mag", "30Rnd_mas_545x39_mag", "30Rnd_mas_545x39_T_mag", "100Rnd_mas_545x39_mag", "100Rnd_mas_545x39_T_mag", "20Rnd_mas_762x51_Stanag", "20Rnd_mas_762x51_T_Stanag", "5Rnd_mas_762x51_Stanag", "5Rnd_mas_762x51_T_Stanag", "10Rnd_mas_338_Stanag", "10Rnd_mas_338_T_Stanag", "30Rnd_mas_762x39_mag", "30Rnd_mas_762x39_T_mag", "10Rnd_mas_762x54_mag", "10Rnd_mas_762x54_T_mag", "5Rnd_mas_127x99_Stanag", "5Rnd_mas_127x99_dem_Stanag", "5Rnd_mas_127x99_T_Stanag", "5Rnd_mas_127x108_mag", "5Rnd_mas_127x108_dem_mag", "5Rnd_mas_127x108_T_mag", "30Rnd_mas_9x21_Stanag", "30Rnd_mas_9x21d_Stanag", "12Rnd_mas_45acp_Mag", "10Rnd_mas_45acp_Mag", "8Rnd_mas_45acp_Mag", "15Rnd_mas_9x21_Mag", "17Rnd_mas_9x21_Mag", "13Rnd_mas_9x21_Mag", "8Rnd_mas_9x18_mag", "7Rnd_mas_12Gauge_Slug", "7Rnd_mas_12Gauge_Pellets", "10Rnd_mas_12Gauge_Slug", "10Rnd_mas_12Gauge_Pellets", "64Rnd_mas_9x18_mag", "20Rnd_mas_765x17_Mag", "25Rnd_mas_9x19_Mag", "40Rnd_mas_46x30_Mag", "2Rnd_mas_Missile_AA_03_F", "4Rnd_mas_Missile_AGM_01_F", "2Rnd_mas_r_Missile_AA_03_F", "4Rnd_mas_r_Missile_AGM_01_F", "20Rnd_mas_Rocket_03_HE_F", "20Rnd_mas_Rocket_03_AP_F", "2Rnd_mas_Bomb_03_F", "2Rnd_mas_r_Bomb_03_F", "24Rnd_mas_PG_missiles", "12Rnd_mas_PG_HE_missiles","12Rnd_mas_PG_missiles",
			"XLA_Dummy"
		];

		_blacklistGuns = [
			"ibr_igla",
					// massis specops weapons
			"mas_launch_NLAW_F",
			"arifle_mas_fal", "arifle_mas_fal_h", "arifle_mas_fal_a", "arifle_mas_fal_m203", "arifle_mas_fal_m203_h", "arifle_mas_fal_m203_a",
			"arifle_mas_l119", "arifle_mas_l119_t", "arifle_mas_l119_ti", "arifle_mas_l119_h", "arifle_mas_l119_a", "arifle_mas_l119_e", "arifle_mas_l119_sd", "arifle_mas_l119c", "arifle_mas_l119c_t", "arifle_mas_l119c_ti", "arifle_mas_l119c_h", "arifle_mas_l119c_a", "arifle_mas_l119c_e", "arifle_mas_l119c_sd", "arifle_mas_l119_gl", "arifle_mas_l119_gl_t", "arifle_mas_l119_gl_ti", "arifle_mas_l119_gl_h", "arifle_mas_l119_gl_a", "arifle_mas_l119_gl_e", "arifle_mas_l119_gl_sd", "arifle_mas_l119_m203", "arifle_mas_l119_m203_t", "arifle_mas_l119_m203_ti", "arifle_mas_l119_m203_h", "arifle_mas_l119_m203_a", "arifle_mas_l119_m203_e", "arifle_mas_l119_m203_sd", "arifle_mas_l119_v", "arifle_mas_l119_v_t", "arifle_mas_l119_v_ti", "arifle_mas_l119_v_h", "arifle_mas_l119_v_a", "arifle_mas_l119_v_e", "arifle_mas_l119_v_sd", "arifle_mas_l119c_v", "arifle_mas_l119c_v_t", "arifle_mas_l119c_v_ti", "arifle_mas_l119c_v_h", "arifle_mas_l119c_v_a", "arifle_mas_l119c_v_e", "arifle_mas_l119c_v_sd", "arifle_mas_l119_gl_v", "arifle_mas_l119_gl_v_t", "arifle_mas_l119_gl_v_ti", "arifle_mas_l119_gl_v_h", "arifle_mas_l119_gl_v_a", "arifle_mas_l119_gl_v_e", "arifle_mas_l119_gl_v_sd", "arifle_mas_l119_m203_v", "arifle_mas_l119_m203_v_t", "arifle_mas_l119_m203_v_ti", "arifle_mas_l119_m203_v_h", "arifle_mas_l119_m203_v_a", "arifle_mas_l119_m203_v_e", "arifle_mas_l119_m203_v_sd", "arifle_mas_l119_d", "arifle_mas_l119_d_t", "arifle_mas_l119_d_ti", "arifle_mas_l119_d_h", "arifle_mas_l119_d_a", "arifle_mas_l119_d_e", "arifle_mas_l119_d_sd", "arifle_mas_l119c_d", "arifle_mas_l119c_d_t", "arifle_mas_l119c_d_ti", "arifle_mas_l119c_d_h", "arifle_mas_l119c_d_a", "arifle_mas_l119c_d_e", "arifle_mas_l119c_d_sd", "arifle_mas_l119_gl_d", "arifle_mas_l119_gl_d_t", "arifle_mas_l119_gl_d_ti", "arifle_mas_l119_gl_d_h", "arifle_mas_l119_gl_d_a", "arifle_mas_l119_gl_d_e", "arifle_mas_l119_gl_d_sd", "arifle_mas_l119_m203_d", "arifle_mas_l119_m203_d_t", "arifle_mas_l119_m203_d_ti", "arifle_mas_l119_m203_d_h", "arifle_mas_l119_m203_d_a", "arifle_mas_l119_m203_d_e", "arifle_mas_l119_m203_d_sd",
			"srifle_mas_svd", "srifle_mas_svd_h", "srifle_mas_svd_sd", "srifle_mas_svd_l","LMG_mas_m72_F", //these are for some reason WEST_SIDE
			"arifle_mas_hk416", "arifle_mas_hk416_t", "arifle_mas_hk416_h", "arifle_mas_hk416_a", "arifle_mas_hk416_e", "arifle_mas_hk416_sd", "arifle_mas_hk416_gl", "arifle_mas_hk416_gl_t", "arifle_mas_hk416_gl_h", "arifle_mas_hk416_gl_a", "arifle_mas_hk416_gl_e", "arifle_mas_hk416_gl_sd", "arifle_mas_hk416_m203", "arifle_mas_hk416_m203_t", "arifle_mas_hk416_m203_h", "arifle_mas_hk416_m203_a", "arifle_mas_hk416_m203_e", "arifle_mas_hk416_m203_sd", "arifle_mas_hk416_v", "arifle_mas_hk416_v_t", "arifle_mas_hk416_v_h", "arifle_mas_hk416_v_a", "arifle_mas_hk416_v_e", "arifle_mas_hk416_v_sd", "arifle_mas_hk416_gl_v", "arifle_mas_hk416_gl_v_t", "arifle_mas_hk416_gl_v_h", "arifle_mas_hk416_gl_v_a", "arifle_mas_hk416_gl_v_e", "arifle_mas_hk416_gl_v_sd", "arifle_mas_hk416_m203_v", "arifle_mas_hk416_m203_v_t", "arifle_mas_hk416_m203_v_h", "arifle_mas_hk416_m203_v_a", "arifle_mas_hk416_m203_v_e", "arifle_mas_hk416_m203_v_sd", "arifle_mas_hk416_d", "arifle_mas_hk416_d_t", "arifle_mas_hk416_d_h", "arifle_mas_hk416_d_a", "arifle_mas_hk416_d_e", "arifle_mas_hk416_d_sd", "arifle_mas_hk416_gl_d", "arifle_mas_hk416_gl_d_t", "arifle_mas_hk416_gl_d_h", "arifle_mas_hk416_gl_d_a", "arifle_mas_hk416_gl_d_e", "arifle_mas_hk416_gl_d_sd", "arifle_mas_hk416_m203_d", "arifle_mas_hk416_m203_d_t", "arifle_mas_hk416_m203_d_h", "arifle_mas_hk416_m203_d_a", "arifle_mas_hk416_m203_d_e", "arifle_mas_hk416_m203_d_sd", "arifle_mas_hk416c", "arifle_mas_hk416c_h", "arifle_mas_hk416c_e", "arifle_mas_hk416c_sd", "arifle_mas_hk416_m203c", "arifle_mas_hk416_m203c_h", "arifle_mas_hk416_m203c_e", "arifle_mas_hk416_m203c_sd", "arifle_mas_hk416c_v", "arifle_mas_hk416c_v_h", "arifle_mas_hk416c_v_e", "arifle_mas_hk416c_v_sd", "arifle_mas_hk416_m203c_v", "arifle_mas_hk416_m203c_v_h", "arifle_mas_hk416_m203c_v_e", "arifle_mas_hk416_m203c_v_sd", "arifle_mas_hk416c_d", "arifle_mas_hk416c_d_h", "arifle_mas_hk416c_d_e", "arifle_mas_hk416c_d_sd", "arifle_mas_hk416_m203c_d", "arifle_mas_hk416_m203c_d_h", "arifle_mas_hk416_m203c_d_e", "arifle_mas_hk416_m203c_d_sd", "arifle_mas_hk417c", "arifle_mas_hk417c_h", "arifle_mas_hk417c_e", "arifle_mas_hk417c_sd", "arifle_mas_hk417_m203c", "arifle_mas_hk417_m203c_h", "arifle_mas_hk417_m203c_e", "arifle_mas_hk417_m203c_sd", "arifle_mas_hk417c_v", "arifle_mas_hk417c_v_h", "arifle_mas_hk417c_v_e", "arifle_mas_hk417c_v_sd", "arifle_mas_hk417_m203c_v", "arifle_mas_hk417_m203c_v_h", "arifle_mas_hk417_m203c_v_e", "arifle_mas_hk417_m203c_v_sd", "arifle_mas_hk417c_d", "arifle_mas_hk417c_d_h", "arifle_mas_hk417c_d_e", "arifle_mas_hk417c_d_sd",
			"arifle_mas_hk417c", "arifle_mas_hk417c_h", "arifle_mas_hk417c_e", "arifle_mas_hk417c_sd", "arifle_mas_hk417_m203c",  "arifle_mas_hk417_m203c_h",  "arifle_mas_hk417_m203c_e", "arifle_mas_hk417_m203c_sd", "arifle_mas_hk417c_v",  "arifle_mas_hk417c_v_h",  "arifle_mas_hk417c_v_e", "arifle_mas_hk417c_v_sd", "arifle_mas_hk417_m203c_v",  "arifle_mas_hk417_m203c_v_h",  "arifle_mas_hk417_m203c_v_e", "arifle_mas_hk417_m203c_v_sd", "arifle_mas_hk417c_d",  "arifle_mas_hk417c_d_h",  "arifle_mas_hk417c_d_e", "arifle_mas_hk417c_d_sd", "arifle_mas_hk417_m203c_d",  "arifle_mas_hk417_m203c_d_h", "arifle_mas_hk417_m203c_d_e", "arifle_mas_hk417_m203c_d_sd",
			"arifle_mas_m4", "arifle_mas_m4_t", "arifle_mas_m4_ti", "arifle_mas_m4_h", "arifle_mas_m4_a", "arifle_mas_m4_e", "arifle_mas_m4_sd", "arifle_mas_m4_gl", "arifle_mas_m4_gl_t", "arifle_mas_m4_gl_ti", "arifle_mas_m4_gl_h", "arifle_mas_m4_gl_a", "arifle_mas_m4_gl_e", "arifle_mas_m4_gl_sd", "arifle_mas_m4_m203", "arifle_mas_m4_m203_t", "arifle_mas_m4_m203_ti", "arifle_mas_m4_m203_h", "arifle_mas_m4_m203_a", "arifle_mas_m4_m203_e", "arifle_mas_m4_m203_sd", "arifle_mas_m4_v", "arifle_mas_m4_v_t", "arifle_mas_m4_v_ti", "arifle_mas_m4_v_h", "arifle_mas_m4_v_a", "arifle_mas_m4_v_e", "arifle_mas_m4_v_sd", "arifle_mas_m4_gl_v", "arifle_mas_m4_gl_v_t", "arifle_mas_m4_gl_v_ti", "arifle_mas_m4_gl_v_h", "arifle_mas_m4_gl_v_a", "arifle_mas_m4_gl_v_e", "arifle_mas_m4_gl_v_sd", "arifle_mas_m4_m203_v", "arifle_mas_m4_m203_v_t", "arifle_mas_m4_m203_v_ti", "arifle_mas_m4_m203_v_h", "arifle_mas_m4_m203_v_a", "arifle_mas_m4_m203_v_e", "arifle_mas_m4_m203_v_sd", "arifle_mas_m4_d", "arifle_mas_m4_d_t", "arifle_mas_m4_d_ti", "arifle_mas_m4_d_h", "arifle_mas_m4_d_a", "arifle_mas_m4_d_e", "arifle_mas_m4_d_sd", "arifle_mas_m4_gl_d", "arifle_mas_m4_gl_d_t", "arifle_mas_m4_gl_d_ti", "arifle_mas_m4_gl_d_h", "arifle_mas_m4_gl_d_a", "arifle_mas_m4_gl_d_e", "arifle_mas_m4_gl_d_sd", "arifle_mas_m4_m203_d", "arifle_mas_m4_m203_d_t", "arifle_mas_m4_m203_d_ti", "arifle_mas_m4_m203_d_h", "arifle_mas_m4_m203_d_a", "arifle_mas_m4_m203_d_e", "arifle_mas_m4_m203_d_sd", "arifle_mas_m4vlt", "arifle_mas_m4vlt_h", "arifle_mas_m4vlt_t", "arifle_mas_m4vlt_e", "arifle_mas_m4vlt_sd", "arifle_mas_m4c", "arifle_mas_m4c_h", "arifle_mas_m4c_e", "arifle_mas_m4c_sd", "arifle_mas_m4_m203c", "arifle_mas_m4_m203c_h", "arifle_mas_m4_m203c_e", "arifle_mas_m4_m203c_sd", "arifle_mas_m4c_v", "arifle_mas_m4c_v_h", "arifle_mas_m4c_v_e", "arifle_mas_m4c_v_sd", "arifle_mas_m4_m203c_v", "arifle_mas_m4_m203c_v_h", "arifle_mas_m4_m203c_v_e", "arifle_mas_m4_m203c_v_sd", "arifle_mas_m4c_d", "arifle_mas_m4c_d_h", "arifle_mas_m4c_d_e", "arifle_mas_m4c_d_sd", "arifle_mas_m4_m203c_d", "arifle_mas_m4_m203c_d_h", "arifle_mas_m4_m203c_d_e", "arifle_mas_m4_m203c_d_sd", "arifle_mas_m16", "arifle_mas_m16_t", "arifle_mas_m16_g", "arifle_mas_m16_a", "arifle_mas_m16_e", "arifle_mas_m16_sd", "arifle_mas_m16_gl", "arifle_mas_m16_gl_t", "arifle_mas_m16_gl_g", "arifle_mas_m16_gl_a", "arifle_mas_m16_gl_e", "arifle_mas_m16_gl_sd",
			"arifle_mas_g36c", "arifle_mas_g36c_h", "arifle_mas_g36c_a", "arifle_mas_g36c_e", "arifle_mas_g36c_sd",
			"arifle_mas_mk16", "arifle_mas_mk16_h", "arifle_mas_mk16_e", "arifle_mas_mk16_sd", "arifle_mas_mk16_gl", "arifle_mas_mk16_gl_h", "arifle_mas_mk16_gl_e", "arifle_mas_mk16_gl_sd", "arifle_mas_mk16_l", "arifle_mas_mk16_l_h", "arifle_mas_mk16_l_e", "arifle_mas_mk16_l_sd", "arifle_mas_mk16_l_gl", "arifle_mas_mk16_l_gl_h", "arifle_mas_mk16_l_gl_e", "arifle_mas_mk16_l_gl_sd",
			"arifle_mas_mk17", "arifle_mas_mk17_h", "arifle_mas_mk17_e", "arifle_mas_mk17_sd", "arifle_mas_mk17_gl", "arifle_mas_mk17_gl_h", "arifle_mas_mk17_gl_e", "arifle_mas_mk17_gl_sd",
			"arifle_mas_arx", "arifle_mas_arx_h", "arifle_mas_arx_e", "arifle_mas_arx_a", "arifle_mas_arx_sd", "arifle_mas_arx_gl", "arifle_mas_arx_gl_h", "arifle_mas_arx_gl_e", "arifle_mas_arx_gl_a", "arifle_mas_arx_gl_sd", "arifle_mas_arx_l", "arifle_mas_arx_l_h", "arifle_mas_arx_l_e", "arifle_mas_arx_l_a", "arifle_mas_arx_l_sd", "arifle_mas_arx_l_gl", "arifle_mas_arx_l_gl_h", "arifle_mas_arx_l_gl_e", "arifle_mas_arx_l_gl_a", "arifle_mas_arx_l_gl_sd",
			"arifle_mas_g3", "arifle_mas_g3_h", "arifle_mas_g3_a", "arifle_mas_g3_m203", "arifle_mas_g3_m203_h", "arifle_mas_g3_m203_a", "arifle_mas_g3s", "arifle_mas_g3s_h", "arifle_mas_g3s_a", "arifle_mas_g3s_m203", "arifle_mas_g3s_m203_h", "arifle_mas_g3s_m203_a",
			"arifle_mas_lee", "arifle_mas_lee_l",
			"srifle_mas_m107", "srifle_mas_m107_h", "srifle_mas_m107_sd", "srifle_mas_m107_v", "srifle_mas_m107_v_h", "srifle_mas_m107_v_sd", "srifle_mas_m107_d", "srifle_mas_m107_d_h", "srifle_mas_m107_d_sd",
			"srifle_mas_hk417", "srifle_mas_hk417_h", "srifle_mas_hk417_sd", "srifle_mas_hk417_v", "srifle_mas_hk417_v_h", "srifle_mas_hk417_v_sd", "srifle_mas_hk417_d", "srifle_mas_hk417_d_h", "srifle_mas_hk417_d_sd", "srifle_mas_sr25", "srifle_mas_sr25_h", "srifle_mas_sr25_sd", "srifle_mas_sr25_v", "srifle_mas_sr25_v_h", "srifle_mas_sr25_v_sd", "srifle_mas_sr25_d", "srifle_mas_sr25_d_h", "srifle_mas_sr25_d_sd", "srifle_mas_ebr", "srifle_mas_ebr_a", "srifle_mas_ebr_t", "srifle_mas_ebr_h", "srifle_mas_ebr_sd", "srifle_mas_mk17s", "srifle_mas_mk17s_h", "srifle_mas_mk17s_sd", "srifle_mas_m110", "srifle_mas_m110_h", "srifle_mas_m110_sd",
			"srifle_mas_m91", "srifle_mas_m91_l",
			"arifle_mas_m14", "arifle_mas_m14_h", "arifle_mas_m14_a", "arifle_mas_m14_l",
			"srifle_mas_m24", "srifle_mas_m24_h", "srifle_mas_m24_v", "srifle_mas_m24_v_h", "srifle_mas_m24_d", "srifle_mas_m24_d_h",
			"srifle_mas_lrr", "srifle_mas_lrr_h", "srifle_mas_lrr_sd",
			"arifle_mas_mp5", "arifle_mas_mp5_a", "arifle_mas_mp5_e", "arifle_mas_mp5_sd", "arifle_mas_mp5_v", "arifle_mas_mp5_v_a", "arifle_mas_mp5_v_e", "arifle_mas_mp5_v_sd", "arifle_mas_mp5_d", "arifle_mas_mp5_d_a", "arifle_mas_mp5_d_e", "arifle_mas_mp5_d_sd", "arifle_mas_mp5sd", "arifle_mas_mp5sd_a", "arifle_mas_mp5sd_e", "arifle_mas_mp5sd_ds",
			"hgun_mas_mp7_F", "hgun_mas_mp7_F_a", "hgun_mas_mp7_F_sd",
			"hgun_mas_mp7p_F", "hgun_mas_mp7p_F_e", "hgun_mas_mp7p_F_sd",
			"hgun_mas_m9_F", "hgun_mas_bhp_F", "hgun_mas_glock_F", "hgun_mas_m9_F_sd", "hgun_mas_bhp_F_sd", "hgun_mas_glock_F_sd",
			"hgun_mas_acp_F", "hgun_mas_acp_F_sd", "hgun_mas_usp_F", "hgun_mas_usp_l_F", "hgun_mas_glocksf_F", "hgun_mas_glocksf_F_sd", "hgun_mas_usp_F_sd", "hgun_mas_usp_l_F_sd",

			// broken CUP launcher
			"CUP_launch_NLAW",
			"XLA_Dummy"
		];

		_blacklistItems = [
			// F18
			"JS_JC_FA18_PilotCoveralls", //looks exactly the same as normal pilot uniform
			// african conflict stuff:
			"U_mas_afr_B_uniform", "U_mas_afr_B_uniform_s", "U_mas_afr_B_contract1", "U_mas_afr_B_contract2","U_mas_afr_B_contract3", "U_mas_afr_B_contract4", "U_mas_afr_B_pilot", "U_mas_afr_I_uniform", "U_mas_afr_I_uniformo1", "U_mas_afr_I_uniformo2", "U_mas_afr_I_uniform_s", "U_mas_afr_O_uniform1", "U_mas_afr_O_uniform2", "U_mas_afr_O_uniform3", "U_mas_afr_O_uniformo1", "U_mas_afr_O_uniform4", "U_mas_afr_O_uniform5", "U_mas_afr_O_uniform6", "U_mas_afr_O_uniform7", "U_mas_afr_O_uniform8", "U_mas_afr_O_uniformR", "U_mas_afr_O_rebel1", "U_mas_afr_O_rebel2", "U_mas_afr_O_rebel3", "U_mas_afr_O_rebel4", "U_mas_afr_O_rebel5", "U_mas_afr_O_rebel6", "U_mas_afr_O_rebel7", "U_mas_afr_O_rebel8", "U_mas_afr_O_rebel9", "U_mas_afr_O_rebel10", "U_mas_afr_C_Civil1", "U_mas_afr_C_Civil2", "U_mas_afr_C_Civil3", "U_mas_afr_C_Civil4", "U_mas_afr_C_Civil5", "U_mas_afr_C_Civil6", "U_mas_afr_C_Civil7", "U_mas_afr_C_Civil8", "U_mas_afr_C_Civil9", "U_mas_afr_C_Civil10",
			"V_mas_afr_BandollierB_rgr", "V_mas_afr_BandollierO_rgr", "V_mas_afr_Rangemaster_belt", "V_mas_afr_BandollierB_blk", "V_mas_afr_PlateCarrier1_rgr", "V_mas_afr_ChestrigB_rgr_g", "V_mas_afr_ChestrigB_rgr", "V_mas_afr_TacVest_b", "V_mas_afr_TacVest_i", "V_mas_afr_TacVest_o", "V_mas_afr_PlateCarrierIA1_B",
			"H_mas_afr_PilotHelmetHeli_B", "H_mas_afr_PilotHelmetHeli_I", "H_mas_afr_CrewHelmetHeli_B", "H_mas_afr_HelmetCrew_B", "H_mas_afr_HelmetB", "H_mas_afr_HelmetI", "H_mas_afr_HelmetO", "H_mas_afr_Cap_headphones", "H_mas_afr_Cap_headphones_d", "H_mas_afr_Cap", "H_mas_afr_Cap_onu", "H_mas_afr_Bandana_h", "H_mas_afr_Bandana", "H_mas_afr_c1", "H_mas_afr_c2", "H_mas_afr_c3", "H_mas_afr_c4", "H_mas_afr_MilCap_b", "H_mas_afr_MilCap_bs", "H_mas_afr_MilCap_i", "H_mas_afr_MilCap_is", "H_mas_afr_MilCap_o", "H_mas_afr_MilCap_os", "H_mas_afr_Booniehat_b", "H_mas_afr_Booniehat_b2", "H_mas_afr_Booniehat_o", "H_mas_afr_Booniehat_o2", "H_mas_afr_Booniehat_i", "H_mas_afr_Booniehat_i2", "H_mas_afr_Booniehat_c", "H_mas_afr_Booniehat_c2", "H_mas_afr_beret_b", "H_mas_afr_beret_bs", "H_mas_afr_beret_i", "H_mas_afr_beret_is", "H_mas_afr_beret_o", "H_mas_afr_pro_ht", "H_mas_afr_helmet_ht", "H_mas_afr_headset_b", "H_mas_afr_helmet_ops_sf", "H_mas_afr_helmet_ops_sf_g", "H_mas_afr_helmet_ops_sf_gog", "H_mas_afr_helmet_ops_sf_gog_g", "H_mas_afr_helmet_ops_sf_h", "H_mas_afr_helmet_ops_sf_h_g", "H_mas_afr_HelmetCrew_O",
			// rhs gear
			"rhs_uniform_flora","rhs_uniform_vdv_flora","rhs_uniform_flora_patchless","rhs_uniform_vdv_mflora","rhs_uniform_mflora_patchless","rhs_uniform_msv_emr","rhs_uniform_vdv_emr","rhs_uniform_emr_patchless","rhs_uniform_df15",
			// massis specops
			"G_mas_wpn_gog", "G_mas_wpn_gog_d", "G_mas_wpn_gog_m", "G_mas_wpn_gog_md", "G_mas_wpn_gog_g", "G_mas_wpn_gog_gd", "G_mas_wpn_mask", "G_mas_wpn_mask_b", "G_mas_wpn_wrap", "G_mas_wpn_wrap_f", "G_mas_wpn_wrap_t", "G_mas_wpn_wrap_b", "G_mas_wpn_wrap_c", "G_mas_wpn_wrap_g", "G_mas_wpn_wrap_gog", "G_mas_wpn_wrap_gog_f", "G_mas_wpn_wrap_gog_t", "G_mas_wpn_wrap_gog_b", "G_mas_wpn_wrap_gog_c", "G_mas_wpn_wrap_gog_g", "G_mas_wpn_wrap_mask", "G_mas_wpn_wrap_mask_t", "G_mas_wpn_wrap_mask_f", "G_mas_wpn_wrap_mask_b", "G_mas_wpn_wrap_mask_c", "G_mas_wpn_wrap_mask_g", "G_mas_wpn_bala", "G_mas_wpn_bala_b", "G_mas_wpn_bala_t", "G_mas_wpn_bala_gog", "G_mas_wpn_bala_gog_b", "G_mas_wpn_bala_gog_t", "G_mas_wpn_bala_mask", "G_mas_wpn_bala_mask_b", "G_mas_wpn_bala_mask_t", "G_mas_wpn_shemag", "G_mas_wpn_shemag_r", "G_mas_wpn_shemag_w", "G_mas_wpn_shemag_gog", "G_mas_wpn_shemag_mask",
			"NVGoggles_mas_h", "Rangefinder_mas_h", "Laserdesignator_mas_h",
			"muzzle_mas_snds_L", "muzzle_mas_snds_LM", "muzzle_mas_snds_C", "muzzle_mas_snds_MP5SD6", "muzzle_mas_snds_M", "muzzle_mas_snds_Mc", "muzzle_mas_snds_MP7", "muzzle_mas_snds_AK", "muzzle_mas_snds_SM", "muzzle_mas_snds_SMc", "muzzle_mas_snds_SH", "muzzle_mas_snds_SHc", "muzzle_mas_snds_SV", "muzzle_mas_snds_SVc", "muzzle_mas_snds_SVD", "muzzle_mas_snds_KSVK", "optic_mas_DMS", "optic_mas_DMS_c", "optic_mas_Holosight_blk", "optic_mas_Holosight_camo", "optic_mas_Arco_blk", "optic_mas_Arco_camo", "optic_mas_Hamr_camo", "optic_mas_Aco_camo", "optic_mas_ACO_grn_camo", "optic_mas_MRCO_camo", "optic_mas_zeiss", "optic_mas_zeiss_c", "optic_mas_zeiss_eo", "optic_mas_zeiss_eo_c", "optic_mas_acog", "optic_mas_acog_c", "optic_mas_acog_eo", "optic_mas_acog_eo_c", "optic_mas_acog_rd", "optic_mas_acog_rd_c", "optic_mas_handle", "optic_mas_aim", "optic_mas_aim_c", "optic_mas_PSO", "optic_mas_PSO_c", "optic_mas_PSO_eo", "optic_mas_PSO_eo_c", "optic_mas_PSO_nv", "optic_mas_PSO_nv_c", "optic_mas_PSO_nv_eo", "optic_mas_PSO_nv_eo_c", "optic_mas_PSO_day", "optic_mas_PSO_nv_day", "optic_mas_term", "optic_mas_MRD", "optic_mas_LRPS", "optic_mas_kobra", "optic_mas_kobra_c", "optic_mas_nspu", "optic_mas_goshawk",
			"acc_mas_flash_gun", "acc_mas_pointer_gun_IR", "acc_mas_pointer_IR", "acc_mas_pointer_IR_b", "acc_mas_pointer_IR_top", "acc_mas_pointer_IR_top_b", "acc_mas_pointer_IR2", "acc_mas_pointer_IR2_top", "acc_mas_pointer_IR2c", "acc_mas_pointer_IR2c_top",

			"XLA_Dummy"
		];

		_blacklistBackpacks = [
			"B_mas_AssaultPack_mul", "B_mas_Kitbag_mul", "B_mas_Bergen_mul", "B_mas_AssaultPack_mul_ammo", "B_mas_AssaultPack_mul_ammo_MG", "B_mas_AssaultPack_mul_Medic", "B_mas_AssaultPack_mul_AA", "B_mas_AssaultPack_mul_AT", "B_mas_AssaultPack_mul_AT4", "B_mas_AssaultPack_mul_m72", "B_mas_AssaultPack_mul_MAAWS", "B_mas_AssaultPack_mul_SMAW", "B_mas_AssaultPack_mul_ATM", "B_mas_AssaultPack_mul_Repair", "B_mas_Bergen_mul_Exp", "B_mas_AssaultPack_des", "B_mas_Kitbag_des", "B_mas_Bergen_des", "B_mas_AssaultPack_des_Medic", "B_mas_AssaultPack_des_AA", "B_mas_AssaultPack_des_AT", "B_mas_AssaultPack_des_AT4", "B_mas_AssaultPack_des_m72", "B_mas_AssaultPack_des_MAAWS", "B_mas_AssaultPack_des_SMAW", "B_mas_AssaultPack_des_ATM", "B_mas_AssaultPack_des_Repair", "B_mas_Bergen_des_Exp", "B_mas_AssaultPack_black", "B_mas_Kitbag_black", "B_mas_Bergen_black", "B_mas_AssaultPack_black_Medic", "B_mas_AssaultPack_black_AA", "B_mas_AssaultPack_black_AT", "B_mas_AssaultPack_black_AT4", "B_mas_AssaultPack_black_m72", "B_mas_AssaultPack_black_MAAWS", "B_mas_AssaultPack_black_SMAW", "B_mas_AssaultPack_black_ATM", "B_mas_AssaultPack_black_Repair", "B_mas_Bergen_black_Exp", "B_mas_AssaultPack_wint", "B_mas_Kitbag_wint", "B_mas_Bergen_wint", "B_mas_AssaultPack_wint_Medic", "B_mas_AssaultPack_wint_AA", "B_mas_AssaultPack_wint_AT", "B_mas_AssaultPack_wint_AT4", "B_mas_AssaultPack_wint_m72", "B_mas_AssaultPack_wint_MAAWS", "B_mas_AssaultPack_wint_SMAW", "B_mas_AssaultPack_wint_ATM", "B_mas_AssaultPack_wint_Repair", "B_mas_Bergen_wint_Exp", "B_mas_AssaultPack_rng", "B_mas_Kitbag_rng", "B_mas_Bergen_rng", "B_mas_AssaultPack_rng_Medic", "B_mas_AssaultPack_rng_AA", "B_mas_AssaultPack_rng_AT", "B_mas_AssaultPack_rng_AT4", "B_mas_AssaultPack_rng_m72", "B_mas_AssaultPack_rng_MAAWS", "B_mas_AssaultPack_rng_SMAW", "B_mas_AssaultPack_rng_ATM", "B_mas_AssaultPack_rng_Repair", "B_mas_Bergen_rng_Exp", "O_mas_Bergen_flo", "O_mas_Bergen_flo_ammo_MG", "O_mas_Bergen_flo_AAT", "O_mas_Bergen_flo_AAA", "O_mas_Bergen_flo_ammo", "O_mas_AssaultPack_flo_Medic", "O_mas_AssaultPack_flo_AA", "O_mas_AssaultPack_flo_AT", "O_mas_AssaultPack_flo_RPG7", "O_mas_AssaultPack_flo_RPG18", "O_mas_AssaultPack_flo_met", "O_mas_AssaultPack_flo_ATM", "O_mas_AssaultPack_flo_Repair", "O_mas_Bergen_flo_Exp", "O_mas_Bergen_blk", "O_mas_AssaultPack_blk_Medic", "O_mas_AssaultPack_blk_AA", "O_mas_AssaultPack_blk_AT", "O_mas_AssaultPack_blk_RPG7", "O_mas_AssaultPack_blk_RPG18", "O_mas_AssaultPack_blk_met", "O_mas_AssaultPack_blk_ATM", "O_mas_AssaultPack_blk_Repair", "O_mas_Bergen_blk_Exp", "O_mas_Bergen_rtan", "O_mas_Bergen_rtan_ammo_MG", "O_mas_Bergen_rtan_AAT", "O_mas_Bergen_rtan_AAA", "O_mas_Bergen_rtan_ammo", "O_mas_AssaultPack_rtan_Medic", "O_mas_AssaultPack_rtan_AA", "O_mas_AssaultPack_rtan_AT", "O_mas_AssaultPack_rtan_RPG7", "O_mas_AssaultPack_rtan_RPG18", "O_mas_AssaultPack_rtan_met", "O_mas_AssaultPack_rtan_ATM", "O_mas_AssaultPack_rtan_Repair", "O_mas_Bergen_rtan_Exp",
			"CUP_B_CivPack_WDL",
			"CUP_B_AssaultPack_ARAmmo",
			"CUP_B_AssaultPack_ATAmmo",
			"CUP_B_AssaultPack_FAC",
			"CUP_B_AssaultPack_HAAAmmo",
			"CUP_B_AssaultPack_HATAmmo",
			"CUP_B_AssaultPack_LRRAmmo",
			"CUP_B_AssaultPack_MGAmmo",
			"CUP_B_AssaultPack_RifleAmmo",
			"CUP_B_AssaultPack_Special",
			"CUP_B_AssaultPack_ACU",
			"CUP_B_AssaultPack_ACU_Explosives",
			"CUP_B_AssaultPack_ACU_MG",
			"CUP_B_ACRPara_m95_Ammo",
			"CUP_B_ACRPara_m95_AmmoMG",
			"CUP_B_ACRPara_m95",
			"CUP_B_Backpack_RPG",
			"CUP_B_ACRPara_m95_Specops",
			"CUP_B_ACRScout_m95",
			"CUP_B_ACRScout_m95_M4",
			"CUP_B_ACRScout_m95_Sa58",
			"CUP_B_Backpack_SpecOps",
			"CUP_B_AlicePack_Khaki_AmmoMG",
		//	"CUP_B_AlicePack_Khaki",
			"CUP_B_AlicePack_Khaki_Explosives",
			"CUP_B_CivPack_WDL",
			"CUP_B_CivPack_WDL_RPK",
			"CUP_B_RPG_Backpack",
			"CUP_B_AlicePack_Khaki_Ammo",
			"CUP_B_CivPack_WDL_Ammo",
			"CUP_B_AlicePack_Khaki_AmmoAK47",
			"CUP_B_AlicePack_Khaki_AmmoAK74",
			"CUP_B_AssaultPack_ACU_Ammo",
			"CUP_B_AssaultPack_ACU_AmmoSAW",
			"CUP_B_AssaultPack_ACU_AT",
		//	"CUP_B_AssaultPack_ACU",
			"CUP_B_AssaultPack_ACU_Explosives",
			"CUP_B_USPack_Coyote_AmmoMG",
			"CUP_B_USPack_Coyote_AT",
		//	"CUP_B_USPack_Coyote",
			"CUP_B_USPack_Coyote_Specops",
			"CUP_B_AssaultPack_Coyote_Ammo",
		//	"CUP_B_AssaultPack_Coyote",
		//	"CUP_B_AssaultPack_Coyote_Specops",
		//	"CUP_B_UAVTerminal_Black",
	//		"CUP_B_AssaultPack_Coyote",
			"CUP_B_StaticX_cbr",
			"CUP_B_StaticY_cbr",
			"B_SUD_RPG",
			"B_SUD_RD54",
			"B_SUD_CG",
			//"rhs_assault_umbts",
			"rhs_assault_umbts_engineer",
			"rhs_assault_umbts_medic",
			"rhs_assault_umbts_demo",
			"rhs_sidor",
			"rhs_sidorMG",
			"rhs_rpg",
			"rhs_rpg_empty",
			"ibr_backpack_rpg",
			"ibr_backpack_aa",
			"CUP_B_RPGPack_Khaki",
			"B_AssaultPack_ocamo",
			"B_Respawn_TentDome_F",
			"B_Respawn_TentA_F",
			"IS_Bag_AT",
			"IR_Bag_AT",
			"KR_Bag_AT",
			"IS_Bag_S",
			"IR_Bag_S",
			"RHS_NSV_Gun_Bag",
			"RHS_NSV_Tripod_Bag",
			"XLA_Dummy"
		];



// -------------------------------------------------------------------
// 		Combine lists
// -------------------------------------------------------------------

_availableGuns 				= [];
_availableMagazines 	= [];
_availableAttachments = [];
_availableItems 			= [];
_availableUniforms 		= _3CB_uniforms;
_availableVests 			= [];
_availableHeadgear 		= _3CB_helmets;
_availableGoggles  		= [];
_availableBackpacks 	= [];

_availableAttachments = _availableAttachments 
+ _agm_ballistics_attachments;

_availableItems = _availableItems 
+ _tfarItems;

_availableMagazines = _availableMagazines 
+ _agm_grenades_Magazines;
+ _agm_attach_Magazines
+ _agm_ballistics_Magazines;
+ _agm_disposable_Magazines;
+ _agm_explosives_Magazines;

_availableGuns = _availableGuns 
+ _agm_grenades_Weapons
+ _agm_attach_Weapons
+ _agm_disposable_Weapons
+ _agm_explosives_Weapons
+ _agm_hearing_Weapons
+ _agm_interaction_Weapons
+ _agm_logistics_Weapons
+ _agm_map_Weapons
+ _agm_medical_Weapons
+ _agm_overheating_Weapons
+ _agm_parachute_Weapons
+ _agm_vector_Weapons
+ _agm_wind_Weapons
+ _CupGuns;


if (isServer) then {

	// Grab the parameter that was passed in. 
	// The box should have "this execVM <scriptname>" in it's init field.
	_box = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

	// Check if @XLA_FixedArsenal is loaded
	 if (isnil "XLA_fnc_addVirtualItemCargo") then {

	 	hint "@XLA_FixedArsenal not found.";

	} else {	

		[_box, _availableBackpacks,true,false] call XLA_fnc_addVirtualBackpackCargo;
		[_box, (_availableGuns + _availableMagazines + _availableAttachments +_availableItems + _availableUniforms + _availableVests + _availableGoggles + _availableHeadgear),true,false] call  XLA_fnc_addVirtualItemCargo;
		[_box, _availableMagazines,true,false] call XLA_fnc_addVirtualMagazineCargo;
		[_box, (_availableGuns),true,false] call XLA_fnc_addVirtualWeaponCargo;	
		[_box, [WEST_SIDE,FRIENDLY_SIDE],true,false] call XLA_fnc_addVirtualSideCargo;

		[_box, _blacklistGuns ,true,false] call XLA_fnc_addVirtualWeaponBlacklist;
		[_box, _blacklistItems, true,false] call XLA_fnc_addVirtualItemBlacklist;
 		[_box, _blacklistBackpacks, true,false] call XLA_fnc_addVirtualBackpackBlacklist;

		// Start the arsenal on it
		_addActionText = "<t color='#45B6EA'>Open Armoury (CUSTOM)";
		["AmmoboxInit",[_box,false,{true},_addActionText,false]] spawn XLA_fnc_arsenal;



	};
};
