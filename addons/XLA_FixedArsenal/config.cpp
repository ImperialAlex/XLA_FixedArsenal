// XLA FixedArsenal by Alexander (ImperialAlex)
// All this does is overwrite some of the Virtual Arsenal related functions

#include "definesides.hpp"

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
		tag = XLA;

		class Inventory {
			class loadPartialInventory {file = "\XLA_Fixedarsenal\functions\Inventory\fn_loadPartialInventory.sqf";};
			class arsenal {file = "\XLA_Fixedarsenal\functions\Inventory\fn_arsenal.sqf";};
			class addVirtualBackpackCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_addVirtualBackpackCargo.sqf";};
			class addVirtualItemCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_addVirtualItemCargo.sqf";};
			class addVirtualMagazineCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_addVirtualMagazineCargo.sqf";};
			class addVirtualSideCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_addVirtualSideCargo.sqf";};
			class addVirtualWeaponCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_addVirtualWeaponCargo.sqf";};
			class getVirtualBackpackCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_getVirtualBackpackCargo.sqf";};
			class getVirtualItemCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_getVirtualItemCargo.sqf";};
			class getVirtualMagazineCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_getVirtualMagazineCargo.sqf";};	
			class getVirtualSideCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_getVirtualSideCargo.sqf";};	
			class getVirtualWeaponCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_getVirtualWeaponCargo.sqf";};
			class removeVirtualBackpackCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_removeVirtualBackpackCargo.sqf";};
			class removeVirtualItemCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_removeVirtualItemCargo.sqf";};
			class removeVirtualMagazineCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_removeVirtualMagazineCargo.sqf";};
			class removeVirtualSideCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_removeVirtualSideCargo.sqf";};
			class removeVirtualWeaponCargo {file = "\XLA_Fixedarsenal\functions\Inventory\fn_removeVirtualWeaponCargo.sqf";};
			class addVirtualItemBlacklist {file = "\XLA_Fixedarsenal\functions\Inventory\fn_addVirtualItemBlacklist.sqf";};
			class addVirtualMagazineBlacklist {file = "\XLA_Fixedarsenal\functions\Inventory\fn_addVirtualMagazineBlacklist.sqf";};
			class addVirtualSideBlacklist {file = "\XLA_Fixedarsenal\functions\Inventory\fn_addVirtualSideBlacklist.sqf";};
			class addVirtualWeaponBlacklist {file = "\XLA_Fixedarsenal\functions\Inventory\fn_addVirtualWeaponBlacklist.sqf";};
			class getVirtualBackpackBlacklist {file = "\XLA_Fixedarsenal\functions\Inventory\fn_getVirtualBackpackBlacklist.sqf";};
			class getVirtualItemBlacklist {file = "\XLA_Fixedarsenal\functions\Inventory\fn_getVirtualItemBlacklist.sqf";};
			class getVirtualMagazineBlacklist {file = "\XLA_Fixedarsenal\functions\Inventory\fn_getVirtualMagazineBlacklist.sqf";}; 
			class getVirtualSideBlacklist {file = "\XLA_Fixedarsenal\functions\Inventory\fn_getVirtualSideBlacklist.sqf";};	
			class getVirtualWeaponBlacklist {file = "\XLA_Fixedarsenal\functions\Inventory\fn_getVirtualWeaponBlacklist.sqf";};
			class removeVirtualBackpackBlacklist {file = "\XLA_Fixedarsenal\functions\Inventory\fn_removeVirtualBackpackBlacklist.sqf";};
			class removeVirtualItemBlacklist {file = "\XLA_Fixedarsenal\functions\Inventory\fn_removeVirtualItemBlacklist.sqf";};
			class removeVirtualMagazineBlacklist {file = "\XLA_Fixedarsenal\functions\Inventory\fn_removeVirtualMagazineBlacklist.sqf";};
			class removeVirtualSideBlacklist {file = "\XLA_Fixedarsenal\functions\Inventory\fn_removeVirtualSideBlacklist.sqf";};
			class removeVirtualWeaponBlacklist {file = "\XLA_Fixedarsenal\functions\Inventory\fn_removeVirtualWeaponBlacklist.sqf";};
			
		};
	};
};

class CfgScriptPaths {
	FixedArsenal = "\XLA_FixedArsenal\scripts\"; // "
};



// Everything below this is related to UI.

// Because of issue #21842 (http://feedback.arma3.com/view.php?id=20978) we cannot just use inheritance as normal
// Once BI fixes #21842 (so anytime between tomorrow and never) we can remove virtually all of this and just override the few parameters we want to touch.
// Due to this bug all the "BaseClasses" have to be named:
class RscDisplayArsenal;
class RscText;
class RscProgress;
class RscControlsGroup;
class RscTitle;
class RscButtonMenu;
class RscEdit;
class RscListNBox;


class ArrowLeft;
class ArrowRight;
class BackgroundLeft;
class BackgroundRight;
class BlackLeft;
class BlackRight;
class ButtonCancel;
class ButtonClose;
class ButtonDelete;
class ButtonExport;
class ButtonImport;
class ButtonInterface;
class ButtonLoad;
class ButtonOK;
class ButtonRandom;
class ButtonSave;
class Column1;
class Column2;
class Column3;
class Column4;
class Column5;
class ControlBar;
class Controls;
class ControlsBackground;
class DLCBackground;
class DLCIcon;
class EditName;
class FrameLeft;
class FrameRight;
class IconBackpack;
class IconBinoculars;
class IconCargoMag;
class IconCargoMisc;
class IconCargoPut;
class IconCargoThrow;
class IconCompass;
class IconFace;
class IconGoggles;
class IconGPS;
class IconHandgun;
class IconHeadgear;
class IconInsignia;
class IconItemAcc;
class IconItemMuzzle;
class IconItemOptic;
class IconMap;
class IconNVGs;
class IconPrimaryWeapon;
class IconRadio;
class IconSecondaryWeapon;
class IconUniform;
class IconVest;
class IconVoice;
class IconWatch;
class Info;
class InfoAuthor;
class InfoBackground;
class InfoName;
class LineIcon;
class LineTabLeft;
class LineTabRight;
class ListBackpack;
class ListBinoculars;
class ListCargoMag;
class ListCargoMisc;
class ListCargoPut;
class ListCargoThrow;
class ListCompass;
class ListFace;
class ListGoggles;
class ListGPS;
class ListHandgun;
class ListHeadgear;
class ListInsignia;
class ListItemAcc;
class ListItemMuzzle;
class ListItemOptic;
class ListMap;
class ListNVGs;
class ListPrimaryWeapon;
class ListRadio;
class ListSecondaryWeapon;
class ListUniform;
class ListVest;
class ListVoice;
class ListWatch;
class Load;
class LoadCargo;
class MainBackground;
class Message;
class MessageBox;
class MouseArea;
class MouseBlock;
class Stat1;
class Stat2;
class Stat3;
class Stat4;
class Stats;
class StatsBackground;
class StatText1;
class StatText2;
class StatText3;
class StatText4;
class TabBackpack;
class TabBinoculars;
class TabCargoMag;
class TabCargoMisc;
class TabCargoPut;
class TabCargoThrow;
class TabCompass;
class TabFace;
class TabGoggles;
class TabGPS;
class TabHandgun;
class TabHeadgear;
class TabInsignia;
class TabItemAcc;
class TabItemMuzzle;
class TabItemOptic;
class TabMap;
class TabNVGs;
class TabPrimaryWeapon;
class TabRadio;
class Tabs;
class TabSecondaryWeapon;
class TabUniform;
class TabVest;
class TabVoice;
class TabWatch;
class TextName;
class ValueName;

class RscDisplayFixedArsenal: RscDisplayArsenal {
	
	onLoad = "[""onLoad"",_this,""RscDisplayFixedArsenal"",'FixedArsenal'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""; //The things we actually want to override
	onUnload = "[""onUnload"",_this,""RscDisplayFixedArsenal"",'FixedArsenal'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf"""; //The things we actually want to override

	class ControlsBackground: ControlsBackground
	{
		class BlackLeft: BlackLeft {};
		class BlackRight: BlackRight {};
		class MouseArea: MouseArea {};
	};
	class Controls: Controls
	{
		class ArrowLeft: ArrowLeft {};
		class ArrowRight: ArrowRight {};
		class BackgroundLeft: BackgroundLeft {};
		class BackgroundRight: BackgroundRight {};
		class LineIcon: LineIcon {};
		class LineTabLeft: LineTabLeft {};
		class LineTabRight: LineTabRight {};
		class Tabs: Tabs {};
		class FrameLeft: FrameLeft {};
		class FrameRight: FrameRight {};
		class Load: RscProgress
		{
			idc = 990; //same as in vanilla arsenal
			texture = "#(argb,8,8,3)color(1,1,1,1)";
			colorBar[] = {1,1,1,1};
			colorFrame[] = {0,0,0,0.5};
			x = "safezoneX + 18 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			y = "safezoneY + 0.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "safezoneW - 36 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class LoadText: RscText
		{
			shadow = 0;
			colorShadow[] = {1,1,1,1.0};
			idc = 27357;
			x = "safezoneX + 18 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			y = "safezoneY + 0.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			w = "safezoneW - 36 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {0,0,0,1};
			colorBackground[] = {1,1,1,0.1};
			sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

		};
		class LoadCargo: LoadCargo {};
		class LoadCargoText: RscText
			{
				shadow = 0;
				colorShadow[] = {1,1,1,1.0};
				idc = 27356;
				x = "safezoneX + safezoneW - 17.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
				y = "safezoneY + 15.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				w = "15 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
				h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				colorText[] = {0,0,0,1};
				colorBackground[] = {1,1,1,0.1};
				sizeEx = "0.8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			};
		class Message: Message {};
		class ControlBar: ControlBar
		{
			class controls: controls
			{
				class ButtonClose: ButtonClose {};
				class ButtonInterface: ButtonInterface {};
				class ButtonRandom: ButtonRandom {};
				class ButtonSave: ButtonSave {};
				class ButtonLoad: ButtonLoad {};
				class ButtonExport: ButtonExport {};
				class ButtonImport: ButtonImport {};
				class ButtonOK: ButtonOK {};
			};
		};
		class Info: Info
		{
			 class controls: controls
			{
				class InfoBackground: InfoBackground {};
				class InfoName: InfoName {};
				class InfoAuthor: InfoAuthor {};
				class DLCBackground: DLCBackground {};
				class DLCIcon: DLCIcon {};
			};
		};
		class Stats: Stats
		{			
			class controls: controls
			{
				class StatsBackground: StatsBackground {};
				class Stat1: Stat1 {};
				class Stat2: Stat2 {};
				class Stat3: Stat3 {};
				class Stat4: Stat4 {};
				class StatText1: StatText1 {};
				class StatText2: StatText2 {};
				class StatText3: StatText3 {};
				class StatText4: StatText4 {};
			};
		};
		class MouseBlock: MouseBlock {};
		class Template: RscControlsGroup
		{
			fade = 1;
			idc = 35919;
			x = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
			y = "0.9 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "20 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "23.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			class controls
			{
				class Title: RscTitle
				{
					style = 0;
					colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
					idc = 34619;
					text = "";
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "20 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};						
				class MainBackground: RscText
				{
					idc = 34622;
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "20 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "21.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0.7};
				};
				class Column1: RscText
				{
					idc = 34620;
					x = "0.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "3.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "19 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "17.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {1,1,1,0.2};
				};
				class Column2: RscText
				{
					idc = 34623;
					x = "9.05 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "3.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "17.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {1,1,1,0.1};
				};
				class Column3: RscText
				{
					idc = 34624;
					x = "12.85 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "3.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "1.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "17.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {1,1,1,0.1};
				};
				class Column4: RscText
				{
					idc = 34625;
					x = "15.7 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "3.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.95 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "17.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {1,1,1,0.1};
				};
				class Column5: RscText
				{
					idc = 34626;
					x = "17.6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "3.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "0.95 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "17.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {1,1,1,0.1};
				};
				class TextName: RscText
				{
					style = 1;
					idc = 34621;
					text = "$STR_DISP_GAME_NAME";
					x = "0.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "21.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "5.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					colorBackground[] = {0,0,0,0.2};
					sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class EditName: RscEdit
				{
					idc = 35020;
					x = "6 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "21.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "13.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class ValueName: RscListNBox
				{
					columns[] = {0.0,0.45,0.55,0.65,0.75,0.8,0.85,0.9,0.95};
					idc = 35119;
					x = "0.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "3.1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "19 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "17.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class ButtonOK: RscButtonMenu
				{
					idc = 36019;
					text = "$STR_DISP_OK";
					x = "15 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "22.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class ButtonAddCustom: RscButtonMenu
				{
					idc = 27362;
					text = "STAR";
					x = "5.1 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "22.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "4.8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class ButtonCancel: RscButtonMenu
				{
					idc = 36020;
					text = "$STR_DISP_CANCEL";
					x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "22.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class ButtonDelete: RscButtonMenu
				{
					idc = 36021;
					text = "$STR_DISP_DELETE";
					x = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "22.7 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "4.9 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class ButtonDefault: RscButtonMenu
				{
					idc = 27359;
					text = "$STR_DISP_DEFAULT";					
					x = "0.500005 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "6.33333 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class ButtonCustom: RscButtonMenu
				{
					idc = 27360;
					text = "FAVOURITES";					
					x = "6.83333 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "6.33333 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
				class ButtonMission: RscButtonMenu
				{
					idc = 27361;
					text = "$STR_SECTION_MISSION";				
					x = "13.1666 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					y = "1.6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "6.33333 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
					h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
		class MessageBox: MessageBox {};
		class TabPrimaryWeapon: TabPrimaryWeapon {};
		class IconPrimaryWeapon: IconPrimaryWeapon {};
		class ListPrimaryWeapon: ListPrimaryWeapon {};
		class TabSecondaryWeapon: TabSecondaryWeapon {};
		class IconSecondaryWeapon: IconSecondaryWeapon {};
		class ListSecondaryWeapon: ListSecondaryWeapon {};
		class TabHandgun: TabHandgun {};
		class IconHandgun: IconHandgun {};
		class ListHandgun: ListHandgun {};
		class TabUniform: TabUniform {};
		class IconUniform: IconUniform {};
		class ListUniform: ListUniform {};
		class TabVest: TabVest {};
		class IconVest: IconVest {};
		class ListVest: ListVest {};
		class TabBackpack: TabBackpack {};
		class IconBackpack: IconBackpack {};
		class ListBackpack: ListBackpack {};
		class TabHeadgear: TabHeadgear {};
		class IconHeadgear: IconHeadgear {};
		class ListHeadgear: ListHeadgear {};
		class TabGoggles: TabGoggles {};
		class IconGoggles: IconGoggles {};
		class ListGoggles: ListGoggles {};
		class TabNVGs: TabNVGs {};
		class IconNVGs: IconNVGs {};
		class ListNVGs: ListNVGs {};
		class TabBinoculars: TabBinoculars {};
		class IconBinoculars: IconBinoculars {};
		class ListBinoculars: ListBinoculars {};
		class TabMap: TabMap {};
		class IconMap: IconMap {};
		class ListMap: ListMap {};
		class TabGPS: TabGPS {};
		class IconGPS: IconGPS {};
		class ListGPS: ListGPS {};
		class TabRadio: TabRadio {};
		class IconRadio: IconRadio {};
		class ListRadio: ListRadio {};
		class TabCompass: TabCompass {};
		class IconCompass: IconCompass {};
		class ListCompass: ListCompass {};
		class TabWatch: TabWatch {};
		class IconWatch: IconWatch {};
		class ListWatch: ListWatch {};
		class TabFace: TabFace {};
		class IconFace: IconFace {};
		class ListFace: ListFace {};
		class TabVoice: TabVoice {};
		class IconVoice: IconVoice {};
		class ListVoice: ListVoice {};
		class TabInsignia: TabInsignia {};
		class IconInsignia: IconInsignia {};
		class ListInsignia: ListInsignia {};
		class TabItemOptic: TabItemOptic {};
		class IconItemOptic: IconItemOptic {};
		class ListItemOptic: ListItemOptic {};
		class TabItemAcc: TabItemAcc {};
		class IconItemAcc: IconItemAcc {};
		class ListItemAcc: ListItemAcc {};
		class TabItemMuzzle: TabItemMuzzle {};
		class IconItemMuzzle: IconItemMuzzle {};
		class ListItemMuzzle: ListItemMuzzle {};
		class TabCargoMag: TabCargoMag {};
		class IconCargoMag: IconCargoMag {};
		class ListCargoMag: ListCargoMag {};
		class TabCargoThrow: TabCargoThrow {};
		class IconCargoThrow: IconCargoThrow {};
		class ListCargoThrow: ListCargoThrow {};
		class TabCargoPut: TabCargoPut {};
		class IconCargoPut: IconCargoPut {};
		class ListCargoPut: ListCargoPut {};
		class TabCargoMisc: TabCargoMisc {};
		class IconCargoMisc: IconCargoMisc {};
		class ListCargoMisc: ListCargoMisc {};
	};
};




		

