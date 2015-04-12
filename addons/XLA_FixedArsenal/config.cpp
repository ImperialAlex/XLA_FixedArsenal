// XLA FixedArsenal by Alexander (ImperialAlex)

#include "uiconfig.cpp"

class CfgPatches
{
	class XLA_FixedArsenal
	{
		units[] = {};
		requiredVersion = 1;
		requiredAddons[] = {"A3_Functions_F_Bootcamp","A3_UI_F"};
	};
};

class CfgFunctions {
	
	class XLA {

		class Inventory { 
			file = "\XLA_FixedArsenal\functions\Inventory"; //"
			class addVirtualBackpackCargo {};
			class addVirtualItemCargo {};
			class addVirtualMagazineCargo {};
			class addVirtualWeaponCargo {};
			class arsenal {};
			class baseWeapon {};
			class basicBackpack {};
			class compatibleItems {};
			class deleteInventory {};
			class exportInventory {};
			class getVirtualBackpackCargo {};
			class getVirtualItemCargo {};
			class getVirtualMagazineCargo {};
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
			class removeVirtualBackpackCargo {};
			class removeVirtualItemCargo {};
			class removeVirtualMagazineCargo {};
			class removeVirtualWeaponCargo {};
			class saveInventory {};

		};
	};
};

class CfgScriptPaths {
	FixedArsenal = "\XLA_FixedArsenal\scripts\"; // "
};







		

