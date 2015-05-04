// XLA FixedArsenal by Alexander (ImperialAlex)

#include "uiconfig.h"
#include "definesides.h"

class CfgPatches
{
	class XLA_FixedArsenal
	{
		units[] = {};
		requiredVersion = 1;
		requiredAddons[] = {"A3_Functions_F_Bootcamp","A3_UI_F"};
	};
};

class CfgMissions
{
	class Showcases
	{
    class Showcase_XLA
		{
			displayName = "XLA | Arsenal Showcase";
			briefingName = "XLA | Arsenal Showcase";
			directory = "XLA_FixedArsenal\missions\showcases\XLA_FixedArsenalExample.Stratis";
			overviewText = "This mission shows how to use xla_fnc_arsenal with examples. It also includes a few handy tools for debugging the mod's definesides.hpp";
			author = "Alexander (ImperialAlex)";
		};
	};
};

class CfgFunctions {
	
	class XLA {

		class Inventory { 
			file = "\XLA_FixedArsenal\functions\Inventory"; //"
			class addVirtualBackpackBlacklist {};
			class addVirtualBackpackCargo {};
			class addVirtualItemBlacklist {};
			class addVirtualItemCargo {};
			class addVirtualMagazineBlacklist {};
			class addVirtualMagazineCargo {};
			class addVirtualSideBlacklist {};
			class addVirtualSideCargo {};
			class addVirtualWeaponBlacklist {};
			class addVirtualWeaponCargo {};
			class addWeapon {};
			class arsenal {};
			class arsenalCondition {};
			class baseWeapon {};
			class basicBackpack {};
			class compatibleItems {};
			class constructWhiteBlacklist {};
			class deleteInventory {};
			class exportInventory {};
			class getVirtualBackpackBlacklist {};
			class getVirtualBackpackCargo {};
			class getVirtualItemBlacklist {};
			class getVirtualItemCargo {};
			class getVirtualMagazineBlacklist {};
			class getVirtualMagazineCargo {};
			class getVirtualSideBlacklist {};
			class getVirtualSideCargo {};
			class getVirtualWeaponBlacklist {};			
			class getVirtualWeaponCargo {};
			class inv {};
			class invAdd {};
			class invCodeToArray {};
			class invRemove {};
			class invSlots {};
			class invSlotsEmpty {};
			class invString {};
			class itemType {};
			class loadInventory {};
			class removeVirtualBackpackBlacklist {};
			class removeVirtualBackpackCargo {};
			class removeVirtualItemBlacklist {};
			class removeVirtualItemCargo {};
			class removeVirtualMagazineBlacklist {};
			class removeVirtualMagazineCargo {};
			class removeVirtualSideBlacklist {};
			class removeVirtualSideCargo {};
			class removeVirtualWeaponBlacklist {};
			class removeVirtualWeaponCargo {};
			class saveInventory {};
		};
	};
};

class CfgScriptPaths {
	FixedArsenal = "\XLA_FixedArsenal\scripts\"; // "
};
