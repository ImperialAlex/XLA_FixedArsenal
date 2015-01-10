if (isServer) then {

// The following are some whitelists for common mods.
	// They do not necessarily include all items from a mod, but they are a handy starting point.


	// -------------------------------------------------------------------
	// 		@acre2
	// -------------------------------------------------------------------
	_acreItems = [
		"ACRE_PRC148",
		"ACRE_PRC343",
		"XLA_Null"				//Leave this here, avoids comma issues
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
		"B_P_Beretrlc",
		"XLA_Null"				//Leave this here, avoids comma issues
	];


	// -------------------------------------------------------------------
	// 		@rh_m4_a3
	// -------------------------------------------------------------------
	_RHGuns = [
		"RH_m4",
		"RH_M4_M203",
		"RH_M4_ris",
		"RH_M4_ris_M203",
		"RH_M4A1_ris",
		"RH_M4A1_ris_M203",
		"RH_M4sbr",
		"RH_M4sbr_g",
		"RH_M4sbr_b",
		"RH_M16a1",
		"RH_M16A1gl",
		"RH_M16A2",
		"RH_M16A2gl",
		"RH_M16A3",
		"RH_M16A4",
		"RH_M16A4gl",
		"RH_M16A4_m",
		"RH_Mk12mod1",
		"RH_SAMR",
		"RH_ar10",
		"XLA_Null"				//Leave this here, avoids comma issues
	];

	_RHAttachments = [
		"RH_compm4s",
		"RH_eotech553",
		"RH_t1",
		"RH_reflex",
		"RH_Delft",
		"RH_shortdot",
		"RH_ta31rco",
		"RH_ta31rco_2D",
		"RH_m3lr",	
		"RH_peq2",
		"RH_peq15",
		"RH_peq2_top",
		"RH_peq15_top",	
		"RH_m4covers_s",
		"RH_m4covers_f",
		"RH_m16covers_s",
		"RH_m16covers_f",
		"RH_SFM952V",
		"RH_SFM952V_tan",	
		"RH_qdss_nt4",
		"RH_saker",
		"RH_qdss_nt4b",
		"RH_sakerb",
		"RH_spr_mbs",
		"XLA_Null"				//Leave this here, avoids comma issues
	];

	_RHMagazines = [
		"rh_20rnd_762x51_ar10",
		"XLA_Null"				//Leave this here, avoids comma issues
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
		"tf_microdagr",			//Used to program Rifleman Radios
		"XLA_Null"				//Leave this here, avoids comma issues
	];

	_tfarBackpacks = [
		"tf_anarc210",
		"tf_rt1523g",
		// "tiny" backpack
		"tf_rt1523g_bwmod",
		"tf_rt1523g_rhs",
		//Normal Backpack
		"tf_rt1523g_sage",
		"tf_rt1523g_green",
		"tf_rt1523g_fabric",
		"tf_rt1523g_black",
		//Big packpack
		"tf_rt1523g_big",
		"tf_rt1523g_big_bwmod",
		"tf_rt1523g_big_rhs",
		"XLA_Null" //Leave this here, avoids comma issues
	];

	//Fix for "cannot load saved outfit" caused by saved loadouts containing unique radios
		for "_x" from 0 to 512 step 1 do { _tfarItems = _tfarItems + ["tf_anprc152_" + str _x , "tf_rf7800str_" + str _x]};
	//	for "_x" from 0 to 512 step 1 do { _tfarBackpacks = _tfarBackpacks + ["tf_anprc152_" + str _x , "tf_rf7800str_" + str _x]};

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
		"6Rnd_RedSignal_F",
		"XLA_Null"				//Leave this here, avoids comma issues
	];
	_agm_grenades_Weapons = [
		"AGM_HandFlare_WhiteMuzzle",
		"AGM_HandFlare_RedMuzzle",
		"AGM_HandFlare_GreenMuzzle",
		"AGM_HandFlare_YellowMuzzle",
		"AGM_M84Muzzle",
		"XLA_Null"				//Leave this here, avoids comma issues
	];

	// -------------------------------------------------------------------
	// 		AGM Attach
	// -------------------------------------------------------------------

	_agm_attach_Weapons = [
		"AGM_IR_Strobe_Item",
		"XLA_Null"				//Leave this here, avoids comma issues
	];

	_agm_attach_Magazines = [
		"B_IR_Grenade",
		"Chemlight_green",
		"XLA_Null"				//Leave this here, avoids comma issues
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
		"AGM_20Rnd_762x51_Mag_AP",
		"XLA_Null"				//Leave this here, avoids comma issues	
	];

	_agm_ballistics_attachments = [
		"AGM_muzzle_mzls_H",
		"AGM_muzzle_mzls_B",
		"AGM_muzzle_mzls_L",
		"AGM_muzzle_mzls_smg_01",
		"AGM_muzzle_mzls_smg_02",
		"XLA_Null"				//Leave this here, avoids comma issues	
	];

	// -------------------------------------------------------------------
	// 		AGM Disposable (Launchers)
	// -------------------------------------------------------------------

		//This is a design choice - do we want people saving spent tubes?
	_agm_disposable_Weapons = [
		"AGM_launch_NLAW_Used_F",
		"XLA_Null"				//Leave this here, avoids comma issues	
	];

	_agm_disposable_Magazines = [
		"AGM_UsedTube_F",
		"XLA_Null"				//Leave this here, avoids comma issues	
	];

	// -------------------------------------------------------------------
	// 		AGM Explosives
	// -------------------------------------------------------------------

	_agm_explosives_Weapons = [
		"AGM_Clacker",
		"AGM_M26_Clacker",
		"AGM_DefusalKit",
		"AGM_DeadManSwitch",
		"XLA_Null"				//Leave this here, avoids comma issues	
	];

	_agm_explosives_Magazines = [
		"ATMine_Range_Mag",
		"APERSBoundingMine_Range_Mag",
		"APERSMine_Range_Mag",
		"APERSTripMine_Wire_Mag",
		"ClaymoreDirectionalMine_Remote_Mag",
		"SatchelCharge_Remote_Mag",
		"DemoCharge_Remote_Mag",
		"SLAMDirectionalMine_Wire_Mag",
		"XLA_Null"				//Leave this here, avoids comma issues		
	];

	// -------------------------------------------------------------------
	// 		AGM Hearing (Earbuds)
	// -------------------------------------------------------------------

	_agm_hearing_Weapons = [
		"AGM_EarBuds",
		"XLA_Null"				//Leave this here, avoids comma issues	
	];

	// -------------------------------------------------------------------
	// 		AGM Interaction (Handcuffs)
	// -------------------------------------------------------------------

	_agm_interaction_Weapons = [
		"AGM_CableTie",
		"XLA_Null"				//Leave this here, avoids comma issues	
	];

	// -------------------------------------------------------------------
	// 		AGM Logistics (UAV Batteries)
	// -------------------------------------------------------------------

	_agm_logistics_Weapons = [
		"AGM_UAVBattery",
		"XLA_Null"				//Leave this here, avoids comma issues	
	];

	// -------------------------------------------------------------------
	// 		AGM Map (Maptool)
	// -------------------------------------------------------------------

	_agm_map_Weapons = [
		"AGM_MapTools",
		"XLA_Null"				//Leave this here, avoids comma issues	
	];

	// -------------------------------------------------------------------
	// 		AGM Medical
	// -------------------------------------------------------------------

	_agm_medical_Weapons = [
		"AGM_Bandage",
		"AGM_Morphine",
		"AGM_Epipen",
		"AGM_Bloodbag",
		"XLA_Null"				//Leave this here, avoids comma issues	
	];

	// -------------------------------------------------------------------
	// 		AGM Overheating (Spare Barrels)
	// -------------------------------------------------------------------

	_agm_overheating_Weapons = [
		"AGM_SpareBarrel",
		"XLA_Null"				//Leave this here, avoids comma issues	
	];

	// -------------------------------------------------------------------
	// 		AGM Parachute (Altimeter)
	// -------------------------------------------------------------------

	_agm_parachute_Weapons = [
		"AGM_Altimeter",
		"XLA_Null"				//Leave this here, avoids comma issues	
	];

	// -------------------------------------------------------------------
	// 		AGM Vector 
	// -------------------------------------------------------------------

	_agm_vector_Weapons = [
		"AGM_Vector",
		"AGM_Item_Vector",
		"XLA_Null"				//Leave this here, avoids comma issues	
	];

	// -------------------------------------------------------------------
	// 		AGM Wind (Kestrel) 
	// -------------------------------------------------------------------

	_agm_wind_Weapons = [
		"AGM_ItemKestrel",
		"XLA_Null"				//Leave this here, avoids comma issues	
	];


	// -------------------------------------------------------------------
	// 		Magic (Implementation of mod-detection)
	// -------------------------------------------------------------------

	_availableGuns 				= [];
	_availableMagazines 	= [];
	_availableAttachments = [];
	_availableItems 			= [];
	_availableUniforms 		= [];
	_availableVests 			= [];
	_availableHeadgear 		= [];
	_availableGoggles  		= [];
	_availableBackpacks 	= [];

	// MOD DETECTION
	_hasRHM4 						= isClass(configFile >> "CfgWeapons" >> "RH_m4"); 
	_hasTFAR						= isClass(configFile >> "CfgWeapons" >> "tf_anprc152");
	_hasAGM_grenades 		= isClass(configFile >> "CfgPatches" >> "AGM_Grenades");
	_hasAGM_attach 			= isClass(configFile >> "CfgPatches" >> "AGM_Attach");
	_hasAGM_ballistics 	= isClass(configFile >> "CfgPatches" >> "AGM_Ballistics");
	_hasAGM_disposable 	= isClass(configFile >> "CfgPatches" >> "AGM_Disposable");
	_hasAGM_explosives 	= isClass(configFile >> "CfgPatches" >> "AGM_Explosives");
	_hasAGM_hearing 		= isClass(configFile >> "CfgPatches" >> "AGM_Hearing");
	_hasAGM_interaction = isClass(configFile >> "CfgPatches" >> "AGM_Interaction");
	_hasAGM_logistics 	= isClass(configFile >> "CfgPatches" >> "AGM_Logistics");
	_hasAGM_map 				= isClass(configFile >> "CfgPatches" >> "AGM_Map");
	_hasAGM_medical 		= isClass(configFile >> "CfgPatches" >> "AGM_Medical");
	_hasAGM_overheating = isClass(configFile >> "CfgPatches" >> "AGM_Overheating");
	_hasAGM_parachute 	= isClass(configFile >> "CfgPatches" >> "AGM_Parachute");
	_hasAGM_vector 			= isClass(configFile >> "CfgPatches" >> "AGM_Vector");
	_hasAGM_wind 				= isClass(configFile >> "CfgPatches" >> "AGM_Wind");


	if (_hasRHM4) then 
	{
		_availableGuns = _availableGuns + _RHGuns;
		_availableAttachments = _availableAttachments + _RHAttachments;
		_availableMagazines = _availableMagazines + _RHMagazines;
	};

	if (_hasTFAR) then 
	{
		_availableItems = _availableItems + _tfarItems;
		_availableBackpacks = _availableBackpacks + _tfarBackpacks;
	};

	if (_hasAGM_grenades) then {
		_availableGuns = _availableGuns + _agm_grenades_Weapons;
		_availableMagazines = _availableMagazines + _agm_grenades_Magazines;
	};

	if (_hasAGM_attach) then {
		_availableGuns = _availableGuns + _agm_attach_Weapons;
		_availableMagazines = _availableMagazines + _agm_attach_Magazines
	};

	if (_hasAGM_ballistics) then {
		_availableMagazines = _availableMagazines + _agm_ballistics_Magazines;
		_availableAttachments = _availableAttachments + _agm_ballistics_attachments;
	};

	if (_hasAGM_disposable) then {
		_availableGuns = _availableGuns + _agm_disposable_Weapons;
		_availableMagazines = _availableMagazines + _agm_disposable_Magazines;
	};

	if (_hasAGM_explosives) then {
		_availableGuns = _availableGuns + _agm_explosives_Weapons;
		_availableMagazines = _availableMagazines + _agm_explosives_Magazines;
	};

	if (_hasAGM_hearing) then {
		_availableGuns = _availableGuns + _agm_hearing_Weapons;
	};

	if (_hasAGM_interaction) then {
		_availableGuns = _availableGuns + _agm_interaction_Weapons;
	};

	if (_hasAGM_logistics) then {
		_availableGuns = _availableGuns + _agm_logistics_Weapons;
	};

	if (_hasAGM_map) then {
		_availableGuns = _availableGuns + _agm_map_Weapons;
	};

	if (_hasAGM_medical) then {
		_availableGuns = _availableGuns + _agm_medical_Weapons;
	};

	if (_hasAGM_overheating) then {
		_availableGuns = _availableGuns + _agm_overheating_Weapons;
	};

	if (_hasAGM_parachute) then {
		_availableGuns = _availableGuns + _agm_parachute_Weapons;
	};

	if (_hasAGM_vector) then {
		_availableGuns = _availableGuns + _agm_vector_Weapons;
	};

	if (_hasAGM_wind) then {
		_availableGuns = _availableGuns + _agm_wind_Weapons;
	};

	// -------------------------------------------------------------------
	// 		Finally: Setting up the arsenal
	// -------------------------------------------------------------------

	_crate = _this;

	// Populate with predefined items, do not add default "Virtual Arsenal" option
	 if (isnil "XLA_fnc_addVirtualItemCargo") then {
	 	hint "@XLA_FixedArsenal not found. Reverting to vanilla arsenal";
		[_crate, _availableBackpacks,true,false] call bis_fnc_addVirtualBackpackCargo;
		[_crate,(_availableGuns + _availableMagazines + _availableAttachments +_availableItems + _availableUniforms + _availableVests + _availableGoggles + _availableHeadgear),true,false] call  bis_fnc_addVirtualItemCargo;
		[_crate, _availableMagazines,true,false] call bis_fnc_addVirtualMagazineCargo;
		[_crate, (_availableGuns),true,false] call bis_fnc_addVirtualWeaponCargo;
	} else {
		[_crate, _availableBackpacks,true,false] call XLA_fnc_addVirtualBackpackCargo;
		[_crate,(_availableGuns + _availableMagazines + _availableAttachments +_availableItems + _availableUniforms + _availableVests + _availableGoggles + _availableHeadgear),true,false] call  XLA_fnc_addVirtualItemCargo;
		[_crate, _availableMagazines,true,false] call XLA_fnc_addVirtualMagazineCargo;
		[_crate, (_availableGuns),true,false] call XLA_fnc_addVirtualWeaponCargo;
		[_crate, ["-2","1"],true,false] call XLA_fnc_addVirtualSideCargo; // -2 means 'all sides'	and includes items like binoculars, compass and map. Should be included virtually all the time.
	};

	/*
		This is taken from BIS_fnc_arsenal (functions_f_bootcamp\Inventory\fn_arsenal.sqf),
		specifically, this is from case "AmmoboxLocal" which is the final step in how the 
		BI script adds that "Virtual Arsenal" addAction.
		In the original script, there's a rather lengthy chain of calls,
		This script does things in a slightly non-canon way, by not using the missionnamespace variable "boxes"	
	*/

	_hasAction = _crate getVariable ["XLA_ArsenalAddActionPresent", false];

	if (isnil "XLA_fnc_arsenal") then {

		if (!_hasAction) then {
			[[_crate, ["<t color='#45B6EA'>Open Armoury (general sample)",
			{
				_box = _this select 0;
				_unit = _this select 1;
				["Open",[nil,_box]] call BIS_fnc_arsenal;
			},
			[],	6, true, false,	"", "true"]], "addAction",true] call BIS_fnc_MP;

			_crate setVariable ["XLA_ArsenalAddActionPresent", true, true];
		};
	} else {
		if (!_hasAction) then {
			[[_crate, ["<t color='#45B6EA'>Open Armoury (general sample)",
			{
				_box = _this select 0;
				_unit = _this select 1;
				["Open",[nil,_box]] call XLA_fnc_arsenal;
			},
			[],	6, true, false,	"", "true"]], "addAction",true] call BIS_fnc_MP;

			_crate setVariable ["XLA_ArsenalAddActionPresent", true, true];
		};
	};

}; //END OF "if (isServer)"