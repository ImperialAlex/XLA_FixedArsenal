// Author: Alexander [3CB]
// Version Date: 21/5/15

// The box should have "this execVM <scriptname>" in it's init field.
_box = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

if (isServer) then {

    _magazinesBlacklist = [

        "30Rnd_mas_556x45_Stanag",
        "30Rnd_mas_556x45_T_Stanag",
        "30Rnd_556x45_Stanag_Tracer_Yellow", //OPFOR TRACERS
        "30Rnd_556x45_Stanag_Tracer_Green", //OPFOR TRACERS
        "20Rnd_mas_762x51_Stanag", 
        "20Rnd_mas_762x51_T_Stanag",
        "AGM_30Rnd_556x45_Stanag_SD",
        "AGM_30Rnd_556x45_Stanag_AP",
        "AGM_30Rnd_556x45_Stanag_Tracer_Dim",
        "CUP_30Rnd_556x45_G36",
        "CUP_30Rnd_TE1_Red_Tracer_556x45_G36",
        "CUP_30Rnd_TE1_Green_Tracer_556x45_G36",
        "CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36",
        "CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag",
        "CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag",
        "CUP_200Rnd_TE4_Green_Tracer_556x45_M249",
        "CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249",
        "CUP_100Rnd_TE4_Green_Tracer_556x45_M249",
        "CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249",
        "CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1",
        "CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1",
        "CUP_200Rnd_TE4_Yellow_Tracer_556x45_L110A1",
        "CUP_30Rnd_556x45_Stanag",
        "CUP_20Rnd_556x45_Stanag",
        "CUP_1Rnd_HE_M203",
        "CUP_1Rnd_HEDP_M203",
        "CUP_FlareWhite_M203",
        "CUP_FlareGreen_M203",
        "CUP_FlareRed_M203",
        "CUP_FlareYellow_M203",
        "CUP_1Rnd_Smoke_M203",
        "CUP_1Rnd_SmokeRed_M203",
        "CUP_1Rnd_SmokeGreen_M203",
        "CUP_1Rnd_SmokeYellow_M203",
        "CUP_30Rnd_9x19_EVO",
        "CUP_6Rnd_HE_M203",
        "CUP_6Rnd_FlareWhite_M203",
        "CUP_6Rnd_FlareGreen_M203",
        "CUP_6Rnd_FlareRed_M203",
        "CUP_6Rnd_FlareYellow_M203",
        "CUP_6Rnd_Smoke_M203",
        "CUP_6Rnd_SmokeRed_M203",
        "CUP_6Rnd_SmokeGreen_M203",
        "CUP_6Rnd_SmokeYellow_M203",
        "CUP_HandGrenade_RGD5",
        "CUP_HandGrenade_RGO",
        "O_IR_Grenade",
        "I_IR_Grenade",
        "rhs_mag_rgd5",
        "rhs_mag_rdg2_white",
        "rhs_mag_rdg2_black",
        "rhs_mag_nspd",
        "rhs_mag_nspn_yellow",
        "rhs_mag_nspn_red",
        "rhs_mag_nspn_green",
        "rhs_mag_fakel",
        "rhs_mag_fakels",
        "rhs_mag_zarya2",
        "rhs_mag_plamyam",
        "CUP_PipeBomb_M",
        "CUP_TimeBomb_M",
        "CUP_IED_V1_M",
        "CUP_IED_V2_M",
        "CUP_IED_V3_M",
        "CUP_IED_V4_M",        
        "IEDUrbanSmall_Remote_Mag",
        "IEDLandSmall_Remote_Mag",
        "rhs_mine_pmn2_mag",
        "rhs_mine_tm62m_mag",
        
        // @leights_opfor
        "100Rnd_LOP_762x54_mag",
        "100Rnd_LOP_762x54_T_mag",
        "30Rnd_LOP_762x39_mag",
        "30Rnd_LOP_762x39_T_mag",
        "10Rnd_LOP_762x54_mag",
        "10Rnd_LOP_762x54_T_mag"
    ];

    _weaponsBlacklist = [

        // PISTOLS
        "hgun_Pistol_heavy_02_F",
        "hgun_Rook40_F",
        "hgun_Pistol_Signal_F",
        "hgun_mas_grach_F",
        "hgun_mas_mak_F",
        "hgun_mas_sa61_F",
        "hgun_mas_uzi_F",
        "rhs_weap_pya",
        "rhs_weap_rsp30_white",
        "rhs_weap_rsp30_red",
        "rhs_weap_rsp30_green",
        "rhs_weap_makarov_pmm",
        "CUP_hgun_Compact",
        "CUP_hgun_Duty",
        "CUP_hgun_Makarov",
        "CUP_hgun_MicroUzi",
        "CUP_hgun_PB6P9",
        "CUP_hgun_Phantom",
        "CUP_hgun_TaurusTracker455",
        "CUP_hgun_TaurusTracker455_gold",
        "CUP_hgun_SA61",
        "hgun_mas_mp7_F",
        "hgun_mas_m9_F",

        // LAUNCHERS
        "launch_SUD_METIS",
        "launch_RPG32_F",
        "launch_I_Titan_short_F",
        "launch_O_Titan_short_F",
        "ibr_igla",
        "ibr_rpg7v",
        "mas_launch_RPG7_F",
        "mas_launch_RPG18_F",
        "mas_launch_LAW_F", // reloadable :(
        "mas_launch_M136_F",
        "mas_launch_Strela_F",
        "mas_launch_Metis_F",
        "mas_launch_TitanS_F",
        "launch_SUD_RPG7V",
        "launch_sud_igla",
        "rhs_weap_rpg26",
        "rhs_weap_rshg2",
        "rhs_weap_rpg7",
        "rhs_weap_igla",
        "CUP_launch_Igla",       
        "CUP_launch_Metis",
        "CUP_launch_NLAW", // reloadable :(
        "CUP_launch_RPG18",
        "CUP_launch_RPG7V",        
        "CUP_launch_FIM92Stinger", // broken, doesn't lock
        "CUP_launch_9K32Strela",

        // RIFLES
        "arifle_Katiba_C_F",
        "arifle_Katiba_F",
        "arifle_Katiba_GL_F",
        "arifle_mas_ak12_sf",
        "arifle_mas_ak12_sf_gl",
        "arifle_mas_ak74",
        "arifle_mas_ak74_gl",
        "arifle_mas_ak_74m",
        "arifle_mas_ak_74m_c",
        "arifle_mas_ak_74m_gl",
        "arifle_mas_ak_74m_gl_c",
        "arifle_mas_ak_74m_sf",
        "arifle_mas_ak_74m_sf_c",
        "arifle_mas_ak_74m_sf_gl",
        "arifle_mas_ak_74m_sf_gl_c",
        "arifle_mas_akm",
        "arifle_mas_akm_gl",
        "arifle_mas_akms",
        "arifle_mas_akms_c",
        "arifle_mas_akms_gl",
        "arifle_mas_akms_gl_c",
        "arifle_mas_aks74",
        "arifle_mas_aks74_gl",
        "arifle_mas_aks74u",
        "arifle_mas_aks74u_c",
        "arifle_mas_aks_74_sf",
        "arifle_mas_aks_74_sf_gl",
        "arifle_mas_bizon",
        "arifle_mas_m70",
        "arifle_mas_m70_gl",
        "arifle_mas_m70ab",
        "arifle_mas_m70ab_gl",
        "arifle_mas_saiga",
        "arifle_Mk20_F",
        "arifle_Mk20_plain_F",
        "arifle_Mk20C_F",
        "arifle_Mk20C_plain_F",
        "arifle_Mk20_GL_F",
        "arifle_Mk20_GL_plain_F",
        "arifle_SUD_AK74",
        "arifle_SUD_AK74_GL",
        "arifle_SUD_AKS74U",
        "arifle_TRG20_F",
        "arifle_TRG21_F",
        "arifle_TRG21_GL_F",
        "asdg_LMG_Mk200_F",
        "asdg_LMG_Zafir_F",
        "CUP_arifle_AK107",
        "CUP_arifle_AK107_GL",
        "CUP_arifle_AK74",
        "CUP_arifle_AK74_GL",
        "CUP_arifle_AK74_GL_kobra",
        "CUP_arifle_AK74M",
        "CUP_arifle_AKM",
        "CUP_arifle_AKS",
        "CUP_arifle_AKS74",
        "CUP_arifle_AKS74U",
        "CUP_arifle_AKS_Gold",
        "CUP_arifle_CZ805_A1",
        "CUP_arifle_CZ805_A2",
        "CUP_arifle_CZ805_B",
        "CUP_arifle_CZ805_B_GL",
        "CUP_arifle_CZ805_GL",
        "CUP_arifle_RPK74",
        "CUP_arifle_Sa58P",
        "CUP_arifle_Sa58P_des",
        "CUP_arifle_Sa58P_v2",
        "CUP_arifle_Sa58RIS1",
        "CUP_arifle_Sa58RIS1_des",
        "CUP_arifle_Sa58RIS2",
        "CUP_arifle_Sa58RIS2_camo",
        "CUP_arifle_Sa58RIS2_gl",
        "CUP_arifle_Sa58V",
        "CUP_arifle_Sa58V_camo",
        "CUP_lmg_Pecheneg",
        "CUP_lmg_PKM",
        "CUP_lmg_UK59",
        "CUP_sgun_Saiga12K",
        "CUP_smg_bizon",
        "CUP_srifle_CZ550",
        "CUP_srifle_CZ750",
        "CUP_srifle_ksvk",
        "CUP_srifle_SVD",
        "CUP_srifle_SVD_des",
        "CUP_srifle_SVD_des_ghillie_pso",
        "CUP_srifle_SVD_wdl_ghillie",
        "CUP_srifle_VSSVintorez",
        "hgun_PDW2000_F",
        "hlc_rifle_aek971",
        "hlc_rifle_aek971worn",
        "hlc_rifle_ak12",
        "hlc_rifle_ak12GL",
        "hlc_rifle_ak47",
        "hlc_rifle_ak74",
        "hlc_rifle_ak74_dirty",
        "hlc_rifle_akm",
        "hlc_rifle_akmgl",
        "hlc_rifle_aks74",
        "hlc_rifle_aks74_GL",
        "hlc_rifle_aks74u",
        "hlc_rifle_aku12",
        "hlc_rifle_rpk",
        "hlc_rifle_RPK12",
        "hlc_rifle_rpk74n",
        "hlc_rifle_saiga12k",
        "ibr_akm",
        "ibr_akm_carbine",
        "ibr_akm_carbine_gl",
        "ibr_akm_gl",
        "ibr_rpk",
        "ibr_svd",
        "LMG_SUD_PK",
        "nsw_er7a",
        "nsw_er7s",
        "rhs_weap_ak103",
        "rhs_weap_ak103_1",
        "rhs_weap_ak103_2",
        "rhs_weap_ak103_npz",
        "rhs_weap_ak74m",
        "rhs_weap_ak74m_2mag",
        "rhs_weap_ak74m_2mag_camo",
        "rhs_weap_ak74m_2mag_npz",
        "rhs_weap_ak74m_camo",
        "rhs_weap_ak74m_camo_folded",
        "rhs_weap_ak74m_camo_npz",
        "rhs_weap_ak74m_desert",
        "rhs_weap_ak74m_desert_folded",
        "rhs_weap_ak74m_desert_npz",
        "rhs_weap_ak74m_folded",
        "rhs_weap_ak74m_gp25",
        "rhs_weap_ak74m_gp25_npz",
        "rhs_weap_ak74m_npz",
        "rhs_weap_ak74m_plummag",
        "rhs_weap_ak74m_plummag_folded",
        "rhs_weap_ak74m_plummag_npz",
        "rhs_weap_akm",
        "rhs_weap_akm_gp25",
        "rhs_weap_akms",
        "rhs_weap_akms_gp25",
        "rhs_weap_pkm",
        "rhs_weap_pkp",
        "rhs_weap_svd",
        "rhs_weap_svdp",
        "rhs_weap_svdp_npz",
        "rhs_weap_svdp_wd",
        "rhs_weap_svdp_wd_npz",
        "rhs_weap_svds",
        "rhs_weap_svds_npz",
        "srifle_DMR_05_hex_F",
        "srifle_GM6_camo_F",
        "srifle_GM6_F",
        "srifle_mas_ksvk",
        "srifle_mas_ksvk_c",
        "srifle_mas_m91",
        "srifle_mas_svd",

        // FROM TESTING
        "CUP_lmg_L110A1",
        "CUP_lmg_L7A2",
        "CUP_arifle_L85A2",
        "CUP_arifle_L85A2_GL",
        "CUP_arifle_L86A2",
        "launch_SUD_M47",
        "STKR_L129A1",
        "STKR_L129A1_Bipod",
        "STKR_L129A1_HG",
        "STKR_L129A1_HG_Bipod",
        "CUP_arifle_FNFAL",
        "arifle_mas_fal",
        "arifle_mas_fal_m203",
        "CUP_srifle_AWM_des",
        "CUP_srifle_AWM_wdl",
        "hgun_mas_mp7p_F",
        "nsw_er7s",
        "nsw_er7a",
     
        // MISC
        "SUD_Binocular", //broken!
        
        // @leights_opfor Rifles
        "LOP_Rifle_SVD",
        "LOP_Rifle_SVD_PSO",
        "LOP_Rifle_AKM",
        "LOP_Rifle_AKMS",
        "LOP_Rifle_AKMS_GL",
        "LOP_Rifle_AKM_GL",
        "LOP_Rifle_PKM",
        "LOP_optic_pso",
        "LOP_optic_pso_nv"
    ];

    _itemsBlacklist = [
        "crew_uniform",
        "CUP_optic_AN_PAS_13c1",
        "CUP_optic_AN_PAS_13c2",
        "CUP_optic_CWS",
        "H_Bandanna_blu",
        "H_Bandanna_surfer",
        "H_Bandanna_surfer_blk",
        "H_Bandanna_surfer_grn",
        "H_Booniehat_dgtl",
        "H_Cap_blk_Raven", //AAF!
        "H_Cap_blu",
        "H_Cap_brn_SPECOPS", //CSAT!
        "H_Cap_marshal",
        "H_Cap_press",
        "H_Cap_red",
        "H_Cap_surfer",
        "H_CrewHelmetHeli_I",
        "H_CrewHelmetHeli_O",        
        "H_Hat_blue",
        "H_Hat_brown",
        "H_Hat_camo",
        "H_Hat_checker",
        "H_Hat_grey",
        "H_Hat_tan",
        "H_HelmetCrew_I",
        "H_HelmetCrew_O",
        "H_HelmetIA",
        "H_HelmetLeaderO_ocamo",
        "H_HelmetLeaderO_oucamo",
        "H_HelmetO_ocamo",
        "H_HelmetO_oucamo",
        "H_HelmetSpecO_blk",
        "H_HelmetSpecO_ocamo",       
        "H_mas_afr_Bandana",
        "H_mas_afr_Bandana_h",       
        "H_mas_afr_beret_i",
        "H_mas_afr_beret_is",
        "H_mas_afr_beret_o",
        "H_mas_afr_Booniehat_c",
        "H_mas_afr_Booniehat_c2",
        "H_mas_afr_Booniehat_i",
        "H_mas_afr_Booniehat_i2",
        "H_mas_afr_Booniehat_o",
        "H_mas_afr_Booniehat_o2",
        "H_mas_afr_c1",
        "H_mas_afr_c2",
        "H_mas_afr_c3",
        "H_mas_afr_c4",
        "H_mas_afr_Cap",
        "H_mas_afr_Cap_headphones",
        "H_mas_afr_Cap_headphones_d",
        "H_mas_afr_Cap_onu",
        "H_mas_afr_helmet_ht",
        "H_mas_afr_helmet_ops_sf",
        "H_mas_afr_helmet_ops_sf_g",
        "H_mas_afr_helmet_ops_sf_gog",
        "H_mas_afr_helmet_ops_sf_gog_g",
        "H_mas_afr_helmet_ops_sf_h",
        "H_mas_afr_helmet_ops_sf_h_g",
        "H_mas_afr_HelmetCrew_O",
        "H_mas_afr_HelmetI",
        "H_mas_afr_HelmetO",
        "H_mas_afr_MilCap_i",
        "H_mas_afr_MilCap_is",
        "H_mas_afr_MilCap_o",
        "H_mas_afr_MilCap_os",
        "H_mas_afr_PilotHelmetHeli_I",
        "H_mas_afr_pro_ht",
        "H_mas_afr_revcapheadset_b",
        "H_MilCap_afr_officer",
        "H_MilCap_blue",
        "H_MilCap_dgtl",
        "H_MilCap_ocamo",
        "H_PilotHelmetFighter_I",
        "H_PilotHelmetFighter_O",
        "H_PilotHelmetHeli_I",
        "H_PilotHelmetHeli_O",
        "H_RacingHelmet_1_black_F",
        "H_RacingHelmet_1_blue_F",
        "H_RacingHelmet_1_F",
        "H_RacingHelmet_1_green_F",
        "H_RacingHelmet_1_orange_F",
        "H_RacingHelmet_1_red_F",
        "H_RacingHelmet_1_white_F",
        "H_RacingHelmet_1_yellow_F",
        "H_RacingHelmet_2_F",
        "H_RacingHelmet_3_F",
        "H_RacingHelmet_4_F",
        "H_StrawHat",
        "H_StrawHat_dark",
        "H_sud_ussr_crew_helmet",
        "H_sud_ussr_helmet01",
        "H_sud_ussr_pilot_helmet",
        "I_UavTerminal",
        "ibr_afr_army_uniform",
        "ibr_afr_army_uniform_90s",
        "ibr_afr_cop_uniform",
        "ibr_afr_helmet",
        "ibr_afr_helmet_90s",
        "ibr_mol_army_uniform",
        "ibr_mol_helmet",
        "ibr_mol_redberet",
        "Iraq_helmet",
        "Iraq_uniform",
        "iraq_vest",
        "is_casual",
        "is_casual2",
        "IS_desert",
        "IS_jacket",
        "IS_jacket2",
        "is_jungle",
        "is_urban",
        "IS_vest",
        "IS_vest2",
        "ISOF_helmet",
        "ISOF_uniform",
        "ItemALiVEPhoneOld",
        "ItemRadio",
        "JS_JC_FA18_PilotCoveralls",
        "KR_barret",
        "KR_helmetA",
        "KR_helmetZ",
        "kr_uniformA",
        "kr_uniformZ",
        "kr_uniformZ2",
        "kr_vest",
        "Laserdesignator_02",
        "Laserdesignator_03",
        "LOP_H_PASGTHelmet_BLU",
        "LOP_H_PASGTHelmet_OLV",
        "LOP_H_PASGTHelmet_TAN",
        "LOP_H_Shemag_ISIS",
        "LOP_H_SSh68Helmet_BLK",
        "LOP_H_SSh68Helmet_OLV",
        "LOP_U_AA_Fatigue_01",
        "LOP_U_AA_Fatigue_01_slv",
        "LOP_U_Afg_civ_01",
        "LOP_U_Afg_civ_02",
        "LOP_U_Afg_civ_03",
        "LOP_U_Afg_civ_04",
        "LOP_U_AFR_Fatigue_01",
        "LOP_U_AFR_Fatigue_02",
        "LOP_U_AFR_Fatigue_03",
        "LOP_U_AFR_Fatigue_04",
        "LOP_U_AFR_Fatigue_04_slv",
        "LOP_U_AP_Fatigue_01",
        "LOP_U_AP_Fatigue_01_slv",
        "LOP_U_CDF_Fatigue_01",
        "LOP_U_CDF_Fatigue_01_slv",
        "LOP_U_ChDKZ_Bardak",
        "LOP_U_ChDKZ_Fatigue_01",
        "LOP_U_ChDKZ_Fatigue_02",
        "LOP_U_ChDKZ_Fatigue_03",
        "LOP_U_ChDKZ_Fatigue_04",
        "LOP_U_ChDKZ_Lopotev",
        "LOP_U_Civ_01",
        "LOP_U_Civ_01S",
        "LOP_U_Civ_02",
        "LOP_U_Civ_02S",
        "LOP_U_Civ_03",
        "LOP_U_Civ_03S",
        "LOP_U_Civ_04",
        "LOP_U_Civ_04S",
        "LOP_U_Civ_05",
        "LOP_U_Civ_05S",
        "LOP_U_Civ_06",
        "LOP_U_Civ_06S",
        "LOP_U_IA_Fatigue_01",
        "LOP_U_IA_Fatigue_01_slv",
        "LOP_U_IA_Fatigue_02",
        "LOP_U_IA_Fatigue_02_slv",
        "LOP_U_IT_Fatigue_01",
        "LOP_U_IT_Fatigue_02",
        "LOP_U_IT_Fatigue_03",
        "LOP_U_IT_Fatigue_04",
        "LOP_U_IT_Fatigue_05",
        "LOP_U_Mil_01",
        "LOP_U_Mil_02",
        "LOP_U_Mil_03",
        "LOP_U_Mil_04",
        "LOP_U_RACS_Fatigue_01",
        "LOP_U_RACS_Fatigue_01_slv",
        "LOP_U_SLA_Fatigue_01",
        "LOP_U_SLA_Fatigue_01_slv",
        "LOP_U_UA_Fatigue_01",
        "LOP_U_UA_Fatigue_02",
        "LOP_U_UA_Fatigue_03",
        "LOP_U_UA_Fatigue_04",
        "LOP_U_US_Fatigue_01",
        "LOP_U_US_Fatigue_01_slv",
        "LOP_U_US_Fatigue_02",
        "LOP_U_US_Fatigue_02_slv",
        "LOP_U_US_Fatigue_03",
        "LOP_U_US_Fatigue_03_slv",
        "LOP_V_Carrier_BLK" 
        "LOP_V_Carrier_BLU",
        "LOP_V_Carrier_OLV",
        "LOP_V_Carrier_TAN",
        "O_UavTerminal",
        "optic_Nightstalker",
        "optic_tws",
        "optic_tws_mg",
        "pilot_helmet",
        "pilot_uniform",
        "police_uniform",
        "rhs_6b13",
        "rhs_6b13_6sh92",
        "rhs_6b13_6sh92_headset_mapcase",
        "rhs_6b13_6sh92_radio",
        "rhs_6b13_6sh92_vog",
        "rhs_6b13_crewofficer",
        "rhs_6b13_EMR",
        "rhs_6b13_Flora",
        "rhs_6b13_Flora_6sh92",
        "rhs_6b13_Flora_6sh92_headset_mapcase",
        "rhs_6b13_Flora_6sh92_radio",
        "rhs_6b13_Flora_6sh92_vog",
        "rhs_6b13_Flora_crewofficer",
        "rhs_6b23",
        "rhs_6b23_6sh92",
        "rhs_6b23_6sh92_headset",
        "rhs_6b23_6sh92_headset_mapcase",
        "rhs_6b23_6sh92_radio",
        "rhs_6b23_6sh92_vog",
        "rhs_6b23_6sh92_vog_headset",
        "rhs_6b23_crew",
        "rhs_6b23_crewofficer",
        "rhs_6b23_digi",
        "rhs_6b23_digi_6sh92",
        "rhs_6b23_digi_6sh92_headset",
        "rhs_6b23_digi_6sh92_headset_mapcase",
        "rhs_6b23_digi_6sh92_radio",
        "rhs_6b23_digi_6sh92_vog",
        "rhs_6b23_digi_6sh92_vog_headset",
        "rhs_6b23_digi_crew",
        "rhs_6b23_digi_crewofficer",
        "rhs_6b23_digi_engineer",
        "rhs_6b23_digi_medic",
        "rhs_6b23_digi_rifleman",
        "rhs_6b23_digi_sniper",
        "rhs_6b23_engineer",
        "rhs_6b23_medic",
        "rhs_6b23_ML",
        "rhs_6b23_ML_6sh92",
        "rhs_6b23_ML_6sh92_headset",
        "rhs_6b23_ML_6sh92_headset_mapcase",
        "rhs_6b23_ML_6sh92_radio",
        "rhs_6b23_ML_6sh92_vog",
        "rhs_6b23_ML_6sh92_vog_headset",
        "rhs_6b23_ML_crew",
        "rhs_6b23_ML_crewofficer",
        "rhs_6b23_ML_engineer",
        "rhs_6b23_ML_medic",
        "rhs_6b23_ML_rifleman",
        "rhs_6b23_ML_sniper",
        "rhs_6b23_rifleman",
        "rhs_6b23_sniper",
        "rhs_6b26",
        "rhs_6b26_bala",
        "rhs_6b26_bala_green",
        "rhs_6b26_ess",
        "rhs_6b26_ess_bala",
        "rhs_6b26_ess_bala_green",
        "rhs_6b26_ess_green",
        "rhs_6b26_green",
        "rhs_6b27m",
        "rhs_6b27m_bala",
        "rhs_6b27m_digi",
        "rhs_6b27m_digi_bala",
        "rhs_6b27m_digi_ess",
        "rhs_6b27m_digi_ess_bala",
        "rhs_6b27m_ess",
        "rhs_6b27m_ess_bala",
        "rhs_6b27m_green",
        "rhs_6b27m_green_bala",
        "rhs_6b27m_green_ess",
        "rhs_6b27m_green_ess_bala",
        "rhs_6b27m_ml",
        "rhs_6b27m_ml_bala",
        "rhs_6b27m_ml_ess",
        "rhs_6b27m_ML_ess_bala",
        "rhs_6b28",
        "rhs_6b28_bala",
        "rhs_6b28_ess",
        "rhs_6b28_ess_bala",
        "rhs_6b28_flora",
        "rhs_6b28_flora_bala",
        "rhs_6b28_flora_ess",
        "rhs_6b28_flora_ess_bala",
        "rhs_6b28_green",
        "rhs_6b28_green_bala",
        "rhs_6b28_green_ess",
        "rhs_6b28_green_ess_bala",
        "rhs_6sh46",
        "rhs_6sh92",
        "rhs_6sh92_digi",
        "rhs_6sh92_digi_headset",
        "rhs_6sh92_digi_radio",
        "rhs_6sh92_digi_vog",
        "rhs_6sh92_digi_vog_headset",
        "rhs_6sh92_headset",
        "rhs_6sh92_radio",
        "rhs_6sh92_vog",
        "rhs_6sh92_vog_headset",
        "rhs_beanie",
        "rhs_beanie_green",
        "rhs_Booniehat_digi",
        "rhs_Booniehat_flora",
        "rhs_fieldcap",
        "rhs_fieldcap_digi",
        "rhs_fieldcap_helm",
        "rhs_fieldcap_helm_digi",
        "rhs_fieldcap_helm_ml",
        "rhs_fieldcap_ml",
        "rhs_gssh18",
        "rhs_tsh4",
        "rhs_tsh4_bala",
        "rhs_tsh4_ess",
        "rhs_tsh4_ess_bala",
        "rhs_uniform_df15",
        "rhs_uniform_emr_patchless",
        "rhs_uniform_flora",
        "rhs_uniform_flora_patchless",
        "rhs_uniform_flora_patchless_alt",
        "rhs_uniform_m88_patchless",
        "rhs_uniform_mflora_patchless",
        "rhs_uniform_msv_emr",
        "rhs_uniform_vdv_emr",
        "rhs_uniform_vdv_flora",
        "rhs_uniform_vdv_mflora",
        "rhs_vest_commander",
        "rhs_vydra_3m",
        "rhs_zsh7a",
        "rhs_zsh7a_mike",
        "STKR_UBACS",
        "STKR_UBACS_GLV",
        "STKR_UBACS_KNEE",
        "STKR_UBACS_ROLL",
        "SWAT_helmet",
        "SWAT_uniform",
        "tf_anprc148jem",
        "tf_anprc154",
        "tf_fadak",
        "tf_pnr1000a", 
        "U_B_Protagonist_VR",
        "U_BG_Guerilla1_1",
        "U_BG_Leader",
        "U_C_Driver_1",
        "U_C_Driver_1_black",
        "U_C_Driver_1_blue",
        "U_C_Driver_1_green",
        "U_C_Driver_1_orange",
        "U_C_Driver_1_red",
        "U_C_Driver_1_white",
        "U_C_Driver_1_yellow",
        "U_C_Driver_2",
        "U_C_Driver_3",
        "U_C_Driver_4",
        "U_C_HunterBody_grn",
        "U_C_Journalist",
        "U_C_Poloshirt_blue",
        "U_C_Poloshirt_burgundy",
        "U_C_Poloshirt_redwhite",
        "U_C_Poloshirt_salmon",
        "U_C_Poloshirt_stripped",
        "U_C_Poloshirt_tricolour",
        "U_C_Poor_1",
        "U_C_Scientist",
        "U_C_WorkerCoveralls",
        "U_Competitor",      
        "U_I_CombatUniform",
        "U_I_CombatUniform_shortsleeve",
        "U_I_FullGhillie_ard",
        "U_I_FullGhillie_lsh",
        "U_I_FullGhillie_sard",
        "U_I_G_resistanceLeader_F",
        "U_I_G_Story_Protagonist_F",
        "U_I_GhillieSuit",
        "U_I_HeliPilotCoveralls",
        "U_I_OfficerUniform",
        "U_I_pilotCoveralls",
        "U_I_Protagonist_VR",
        "U_I_Wetsuit",
        "U_Marshal",      
        "U_mas_afr_C_civil1",
        "U_mas_afr_C_civil10",
        "U_mas_afr_C_civil2",
        "U_mas_afr_C_civil3",
        "U_mas_afr_C_civil4",
        "U_mas_afr_C_civil5",
        "U_mas_afr_C_civil6",
        "U_mas_afr_C_civil7",
        "U_mas_afr_C_civil8",
        "U_mas_afr_C_civil9",
        "U_mas_afr_I_uniform",
        "U_mas_afr_I_uniform_s",
        "U_mas_afr_I_uniformo1",
        "U_mas_afr_I_uniformo2",
        "U_mas_afr_O_rebel1",
        "U_mas_afr_O_rebel10",
        "U_mas_afr_O_rebel2",
        "U_mas_afr_O_rebel3",
        "U_mas_afr_O_rebel4",
        "U_mas_afr_O_rebel5",
        "U_mas_afr_O_rebel6",
        "U_mas_afr_O_rebel7",
        "U_mas_afr_O_rebel8",
        "U_mas_afr_O_rebel9",
        "U_mas_afr_O_uniform1",
        "U_mas_afr_O_uniform2",
        "U_mas_afr_O_uniform3",
        "U_mas_afr_O_uniform4",
        "U_mas_afr_O_uniform5",
        "U_mas_afr_O_uniform6",
        "U_mas_afr_O_uniform7",
        "U_mas_afr_O_uniform8",
        "U_mas_afr_O_uniformo1",
        "U_mas_afr_O_uniformR",
        "U_O_CombatUniform_ocamo",
        "U_O_CombatUniform_oucamo",
        "U_O_FullGhillie_ard",
        "U_O_FullGhillie_lsh",
        "U_O_FullGhillie_sard",
        "U_O_GhillieSuit",
        "U_O_OfficerUniform_ocamo",
        "U_O_PilotCoveralls",
        "U_O_Protagonist_VR",
        "U_O_SpecopsUniform_ocamo",
        "U_O_Wetsuit",
        "U_OrestesBody",
        "U_Rangemaster",
        "U_SUD_USSR_Pilot_Suit",
        "U_SUD_USSR_Uniform01",
        "V_ALiVE_Suicide_Vest",    
        "V_HarnessO_brn",
        "V_HarnessO_gry",
        "V_HarnessOGL_brn",
        "V_HarnessOGL_gry",
        "V_HarnessOSpec_brn",
        "V_HarnessOSpec_gry",
        "V_I_G_resistanceLeader_F",       
        "V_mas_afr_BandollierO_rgr",       
        "V_mas_afr_TacVest_i",
        "V_mas_afr_TacVest_o",
        "V_PlateCarrierIA2_dgtl",
        "V_PlateCarrierIAGL_dgtl",
        "V_PlateCarrierIAGL_oli",
        "V_Press_F",
        "V_RebreatherIA",
        "V_RebreatherIR",
        "V_sud_ussr_vest01",
        "V_sud_ussr_vest02",
        "V_sud_ussr_vest03",
        "V_sud_ussr_vest04",
        "V_sud_ussr_vest05",       
    ];

    _backpackWhitelist = [
        "B_AssaultPack_khk",
        "B_AssaultPack_rgr",
        "B_AssaultPack_sgg",
        "B_AssaultPack_blk",
        "B_AssaultPack_cbr",
        "B_AssaultPack_mcamo",
        "B_Kitbag_rgr",
        "B_Kitbag_mcamo",
        "B_Kitbag_sgg",
        "B_Kitbag_cbr",
        "B_TacticalPack_rgr",
        "B_TacticalPack_mcamo",
        "B_TacticalPack_blk",
        "B_TacticalPack_oli",
        "B_Carryall_mcamo",
        "B_Carryall_khk",
        "B_Carryall_cbr",
        "B_Parachute",       
        "B_Carryall_oli",
        "B_AssaultPack_Kerry",
        "B_mas_AssaultPack_mul",
        "B_mas_Kitbag_mul",
        "B_mas_AssaultPack_des",
        "B_mas_Kitbag_des",
        "B_mas_AssaultPack_black",
        "B_mas_Kitbag_black",
        "B_mas_AssaultPack_wint",
        "B_mas_Kitbag_wint",
        "B_mas_AssaultPack_rng",
        "B_mas_Kitbag_rng",
        "tf_anarc210",
        "tf_rt1523g",
        "tf_rt1523g_bwmod",
        "tf_rt1523g_rhs",
        "tf_rt1523g_big",
        "tf_rt1523g_big_bwmod",
        "tf_rt1523g_big_bwmod_tropen",
        "tf_rt1523g_big_rhs",
        "tf_rt1523g_sage",
        "tf_rt1523g_green",
        "tf_rt1523g_fabric",
        "tf_rt1523g_black",        
        "B_UAV_01_backpack_F",
        "B_HMG_01_support_F",
        "B_HMG_01_support_high_F",
        "B_HMG_01_weapon_F",
        "B_HMG_01_A_weapon_F",
        "B_GMG_01_weapon_F",
        "B_GMG_01_A_weapon_F",
        "B_HMG_01_high_weapon_F",
        "B_HMG_01_A_high_weapon_F",
        "B_GMG_01_high_weapon_F",
        "B_GMG_01_A_high_weapon_F",
        "B_Mortar_01_support_F",
        "B_Mortar_01_weapon_F",
        "B_Static_Designator_01_weapon_F",        
        "B_SUD_RD54",
        "B_SUD_ALICE",       
        "B_AA_01_weapon_F",
        "B_AT_01_weapon_F",
        "AGM_NonSteerableParachute",
        "CUP_B_USPack_Coyote",
        "CUP_B_USPack_Black",
        "CUP_B_ACRPara_m95",
        "CUP_B_ACRScout_m95",
        "CUP_B_CivPack_WDL",
        "CUP_B_AlicePack_Khaki",
        "CUP_B_AssaultPack_ACU",
        "CUP_B_AssaultPack_Coyote",
        "CUP_B_AssaultPack_Black",
        "CUP_B_MedicPack_ACU",
        "CUP_B_UAVTerminal_Black",
        "CUP_B_Bergen_BAF",
        "STKR_PackCom",
        "STKR_Predator",
        "STKR_PredatorBow",
        "STKR_MLode",
        
        // @rhs_usf3
        "rhsusf_assault_eagleaiii_coy",
        "rhsusf_assault_eagleaiii_ocp",
        //"B_rhsusf_B_BACKPACK",   // removed because when the Raven UAV is flying, all camera's get the sound eg. arsenal, zeus
        "rhsusf_assault_eagleaiii_ucp",
        "rhsusf_falconii"
    ];

    // TFAR UNIQUE TO GENERIC
    _forceReplace = [];
    _forceReplace resize 1998;
    for [{_i=0}, {_i<999}, {_i=_i+1}] do
    {
        _forceReplace set [_i,["tf_anprc152_" + (str (_i+1)), "tf_anprc152"]]; 
        _forceReplace set [_i+999,["tf_rf7800str_" + (str (_i+1)), "tf_rf7800str"]];            
    };

    // Check if @XLA_FixedArsenal is loaded
     if !(isnil "XLA_fnc_addVirtualItemCargo") then {
        [_box, ["%ALL"] ,true,false] call XLA_fnc_addVirtualItemCargo; 
        [_box, _itemsBlacklist, true,false] call XLA_fnc_addVirtualItemBlacklist;
        [_box, ["%ALL"],true,false] call XLA_fnc_addVirtualWeaponCargo; 
        [_box, _weaponsBlacklist,true,false] call XLA_fnc_addVirtualWeaponBlacklist;
        [_box, _backpackWhitelist,true,false] call XLA_fnc_addVirtualBackpackCargo; 
        [_box, ["%ALL"],true,false] call XLA_fnc_addVirtualMagazineCargo;
        [_box,_magazinesBlacklist,true,false] call XLA_fnc_addVirtualMagazineBlacklist;        
        _addActionText = "<t color='#45B6EA'>Open Armoury [3CB]";
        ["AmmoboxInit",[_box,false,{true},_addActionText,false,_forceReplace]] spawn XLA_fnc_arsenal;
    };
};