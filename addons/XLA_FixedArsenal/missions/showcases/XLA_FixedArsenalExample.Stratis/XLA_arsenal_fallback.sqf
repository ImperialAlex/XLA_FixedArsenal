// Author: Alexander [3CB]
// Version Date: 14/5/15

// The box should have "this execVM <scriptname>" in it's init field.
_box = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

_weaponsWhitelist = [

    // PISTOLS
    "hgun_Pistol_heavy_02_F",
    "hgun_Rook40_F",
    "hgun_Pistol_Signal_F", 
        

    // LAUNCHERS
    "launch_RPG32_F",
    "launch_I_Titan_short_F",
    "launch_O_Titan_short_F",
    

    // RIFLES
    "arifle_Katiba_C_F",
    "arifle_Katiba_F",
    "arifle_Katiba_GL_F",
   
    "arifle_Mk20_F",
    "arifle_Mk20_plain_F",
    "arifle_Mk20C_F",
    "arifle_Mk20C_plain_F",
    "arifle_Mk20_GL_F",
    "arifle_Mk20_GL_plain_F",      
    "arifle_TRG20_F",
    "arifle_TRG21_F",
    "arifle_TRG21_GL_F",

    //MISC
    "binocular"
   
];

_itemsWhitelist = [

    "optic_Nightstalker",
    "optic_tws",
	"optic_tws_mg",		
    "H_Bandanna_blu",
    "H_Bandanna_surfer",
    "H_Bandanna_surfer_blk",
    "H_Bandanna_surfer_grn",
    "H_Booniehat_dgtl",
    "H_Cap_blu",
    "H_Cap_blk_Raven", //AAF!
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
    "Laserdesignator_03",
    "Laserdesignator_02",
    "ItemRadio",
    "H_MilCap_blue",
    "H_MilCap_dgtl",
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
    "V_HarnessO_brn",
    "V_HarnessO_gry",
    "V_HarnessOGL_brn",
    "V_HarnessOGL_gry",
    "V_HarnessOSpec_brn",
    "V_HarnessOSpec_gry",
    "V_I_G_resistanceLeader_F",      
    "V_PlateCarrierIA2_dgtl",
    "V_PlateCarrierIAGL_dgtl",
    "V_PlateCarrierIAGL_oli",
    "V_Press_F",
    "V_RebreatherIA",
    "V_RebreatherIR"        
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
    "STKR_MLode"
];



// Check if @XLA_FixedArsenal is loaded
 if !(isnil "XLA_fnc_addVirtualItemCargo") then {

     // TFAR UNIQUE TO GENERIC
    _forceReplace = [];
    _forceReplace resize 1998;
    for [{_i=0}, {_i<999}, {_i=_i+1}] do
    {
        _forceReplace set [_i,["tf_anprc152_" + (str (_i+1)), "tf_anprc152"]]; 
        _forceReplace set [_i+999,["tf_rf7800str_" + (str (_i+1)), "tf_rf7800str"]];            
    };

    // !! USE NON-GLOBAL COMMANDS!
    [_box, _itemsWhitelist,false,false] call XLA_fnc_addVirtualItemCargo;        
    [_box, _weaponsWhitelist,false,false] call XLA_fnc_addVirtualWeaponCargo;         
    [_box, _backpackWhitelist,false,false] call XLA_fnc_addVirtualBackpackCargo; 
    [_box, ["%ALL"],false,false] call XLA_fnc_addVirtualMagazineCargo;  

    // NOT SURE IF THIS IS STILL POSSIBLE TO USE? WILL NEED TO TEST ON SERVER          
    _addActionText = "<t color='#45B6EA'>Open Armoury (XLA)";
    ["AmmoboxInit",[_box,false,{true},_addActionText,false,_forceReplace]] spawn XLA_fnc_arsenal;
} else {

    // do the same, just with vanilla
    // these will automatically add the "Arsenal" action
    [_box, _itemsWhitelist,false] call bis_fnc_addVirtualItemCargo;        
    [_box, _weaponsWhitelist,false] call bis_fnc_addVirtualWeaponCargo;         
    [_box, _backpackWhitelist,false] call bis_fnc_addVirtualBackpackCargo; 
    [_box, ["%ALL"],false] call bis_fnc_addVirtualMagazineCargo;

};