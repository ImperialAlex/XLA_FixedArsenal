// XLA FixedArsenal by Alexander (ImperialAlex)
// All this does is overwrite some of the Virtual Arsenal related functions


class CfgPatches
{
	class XLA_FixedArsenal
	{
		units[] = {};
		requiredVersion = 1;
		requiredAddons[] = {"A3_Functions_F_Bootcamp","A3_UI_F"};
	};
};

class RscDisplayArsenal{};

class RscDisplayFixedArsenal: RscDisplayArsenal {
	onLoad = "[""onLoad"",_this,""RscDisplayFixedArsenal"",'FixedArsenal'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
	onUnload = "[""onUnload"",_this,""RscDisplayFixedArsenal"",'FixedArsenal'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
};

class CfgScriptPaths {
	FixedArsenal = "\XLA_FixedArsenal\scripts\"; // " // Fix for difference in Arma string parsing vs SQF highlighter for Sublime Text 2
};


class CfgFunctions {
	
	class XLA {
		tag = XLA;

		class Inventory {
			class loadPartialInventory {file = "\XLA_FixedArsenal\Inventory\fn_loadPartialInventory.sqf";};
			class arsenal {file = "\XLA_FixedArsenal\Inventory\fn_arsenal.sqf";};
		};
	};
};