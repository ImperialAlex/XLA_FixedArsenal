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

class CfgFunctions {
	
	class XLA {
		tag = XLA;

		class Inventory {
			class loadPartialInventory {file = "\XLA_FixedArsenal\Inventory\fn_loadPartialInventory.sqf";};
			class arsenal {file = "\XLA_FixedArsenal\Inventory\fn_arsenal.sqf";};
		};
	};
};

class CfgScriptPaths {
	FixedArsenal = "\XLA_FixedArsenal\scripts\"; // "
};


// Because of issue #21842 (http://feedback.arma3.com/view.php?id=20978) we cannot just use inheritance as normal
// Once BI fixes #21842 (so anytime between tomorrow and never) we can remove virtually all of this and just override the few parameters we want to touch.
// Due to this bug all the "BaseClasses" have to be named:
class RscDisplayArsenal;

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
class LoadCargoText;
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
class Template;
class TextName;
class Title;
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
		class Load: Load {};
		class LoadCargo: LoadCargo {};
		class LoadCargoText: LoadCargoText {};
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
		class Template: Template 
		{
			class controls: controls
			{
				class Title: Title {};
				class MainBackground: MainBackground {};
				class Column1: Column1 {};
				class Column2: Column2 {};
				class Column3: Column3 {};
				class Column4: Column4 {};
				class Column5: Column5 {};
				class TextName: TextName {};
				class EditName: EditName {};
				class ValueName: ValueName {};
				class ButtonOK: ButtonOK {};
				class ButtonCancel: ButtonCancel {};
				class ButtonDelete: ButtonDelete {};
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




		

