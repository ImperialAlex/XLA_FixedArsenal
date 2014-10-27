// XLA FixedArsenal by Alexander (ImperialAlex)
// All this does is overwrite some of the Virtual Arsenal related functions


class CfgPatches
{
	class XLA_FixedArsenal
	{
		units[] = {};
		requiredVersion = 1;
		requiredAddons[] = {"A3_Functions_F_Bootcamp"};
	};
};


class CfgFunctions {
	class A3_Bootcamp {
		tag = BIS;
		
		class Inventory {
			file = "\XLA_FixedArsenal\Inventory";
			
			class arsenal {};
			
		};
	};
};