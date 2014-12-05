/*
	Author: Karel Moricky

	Description:
	Splendid arsenal viewer

	Parameter(s):

		0: STRING - mode
		1: ANY - params (see below)

	Modes:
		"Open" - Open the Arsenal
			0 (Optional): BOOL - true to open full Arsenal, with all categories and items available (default: false)

		"Preload" - Preload item configs for Arsenal (without preloading, configs are parsed the first time Arsenal is opened)
			No params

		"AmmoboxInit" - Add virtual ammobox. Action to access the Arsenal will be added automatically on all clients.
			0: OBJECT - ammobox
			1 (Optional): BOOL - true to make all weapons and items in the game available in the box (default: false)
			2 (Optional): Condition for showing the Arsenal action (default: {true})
				      Passed arguments are the same as in addAction condition, i.e., _target - the box, _this - caller

		"AmmoboxExit" - Remove virtual ammobox
			0: OBJECT - ammobox


	Returns:
	NOTHING
*/

#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

#define FADE_DELAY	0.15

disableserialization;

_mode = [_this,0,"Open",[displaynull,""]] call bis_fnc_param;
_this = [_this,1,[]] call bis_fnc_param;
_fullVersion = missionnamespace getvariable ["BIS_fnc_arsenal_fullArsenal",false];

#define IDCS_LEFT\
	IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,\
	IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,\
	IDC_RSCDISPLAYARSENAL_TAB_HANDGUN,\
	IDC_RSCDISPLAYARSENAL_TAB_UNIFORM,\
	IDC_RSCDISPLAYARSENAL_TAB_VEST,\
	IDC_RSCDISPLAYARSENAL_TAB_BACKPACK,\
	IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR,\
	IDC_RSCDISPLAYARSENAL_TAB_GOGGLES,\
	IDC_RSCDISPLAYARSENAL_TAB_NVGS,\
	IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS,\
	IDC_RSCDISPLAYARSENAL_TAB_MAP,\
	IDC_RSCDISPLAYARSENAL_TAB_GPS,\
	IDC_RSCDISPLAYARSENAL_TAB_RADIO,\
	IDC_RSCDISPLAYARSENAL_TAB_COMPASS,\
	IDC_RSCDISPLAYARSENAL_TAB_WATCH,\
	IDC_RSCDISPLAYARSENAL_TAB_FACE,\
	IDC_RSCDISPLAYARSENAL_TAB_VOICE,\
	IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA

#define IDCS_RIGHT\
	IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC,\
	IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,\
	IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,\
	IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,\
	IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,\
	IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT,\
	IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC\

#define IDCS	[IDCS_LEFT,IDCS_RIGHT]

#define INITTYPES\
		_types = [];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_UNIFORM,["Uniform"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_VEST,["Vest"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_BACKPACK,["Backpack"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR,["Headgear"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_GOGGLES,["Glasses"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_NVGS,["NVGoggles"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS,["Binocular","LaserDesignator"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,["AssaultRifle","MachineGun","SniperRifle","Shotgun","Rifle","SubmachineGun"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,["Launcher","MissileLauncher","RocketLauncher"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_HANDGUN,["Handgun"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_MAP,["Map"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_GPS,["GPS","UAVTerminal"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_RADIO,["Radio"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_COMPASS,["Compass"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_WATCH,["Watch"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_FACE,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_VOICE,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,[/*"Grenade","SmokeShell"*/]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT,[/*"Mine","MineBounding","MineDirectional"*/]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC,["FirstAidKit","Medikit","MineDetector","Toolkit"]];

#define GETVIRTUALCARGO\
	_virtualItemCargo =\
		(missionnamespace call bis_fnc_getVirtualItemCargo) +\
		(_cargo call bis_fnc_getVirtualItemCargo);\
	_virtualWeaponCargo = [];\
	{\
		_weapon = _x;\
		_virtualWeaponCargo set [count _virtualWeaponCargo,_weapon];\
		{\
			private ["_item"];\
			_item = gettext (_x >> "item");\
			if !(_item in _virtualItemCargo) then {_virtualItemCargo set [count _virtualItemCargo,_item];};\
		} foreach ((configfile >> "cfgweapons" >> _x >> "linkeditems") call bis_fnc_returnchildren);\
	} foreach ((missionnamespace call bis_fnc_getVirtualWeaponCargo) + (_cargo call bis_fnc_getVirtualWeaponCargo));\
	_virtualMagazineCargo = (missionnamespace call bis_fnc_getVirtualMagazineCargo) + (_cargo call bis_fnc_getVirtualMagazineCargo);\
	_virtualBackpackCargo = (missionnamespace call bis_fnc_getVirtualBackpackCargo) + (_cargo call bis_fnc_getVirtualBackpackCargo);

#define STATS_WEAPONS\
	["reloadtime","maxrange","hit","mass"],\
	[true,true,true,false]

#define STATS_WEAPONS_NORMAL\
	["reloadtime","maxrange","hit","mass"],\
	[false,false,false,false]

#define STATS_EQUIPMENT\
	["armor","maximumLoad","mass"],\
	[true,false,false]

#define STATS_EQUIPMENT_NORMAL\
	["armor","maximumLoad","mass"],\
	[false,false,false]

// CONVERTING "MASS" TO REAL UNITS, OVERRIDES THE VARIABLE
// Since Mass is really "mass*volume*fudge" it's going to be hard to turn this into real values, 
// especially if we want the values to fit with what AGM says about total weight....
// This is based on the way AGM calulcates overall inventory weight:
// Compatible with AGM's Imperial/Metric switch:
#define MASSCONVERT(MASS)\
	if (profileNamespace getVariable ["AGM_useImperial", false]) then {\
  		MASS = (round (MASS * 10)) / 100;\
	} else {\
  		MASS = (round (MASS * (1/2.2046) * 10)) / 100;\
	};

_massUnit = "kg";
if (profileNamespace getVariable ["AGM_useImperial", false]) then {
	_massunit = "lb";
} else {\
  	_massunit = "kg";
};

#define CONDITION(LIST) ( _fullArsenal || {[_item,LIST] call {_thing = _this select 0; _array = _this select 1; _found = false; if ((_array find _thing) >= 0) then {_found = true;}; _found; }} || {"%ALL" in LIST} )

#define ERROR if !(_item in _disabledItems) then {_disabledItems set [count _disabledItems,_item];};


switch _mode do {

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Open": {
		if !(isnull (uinamespace getvariable ["BIS_fnc_arsenal_cam",objnull])) exitwith {"Arsenal Viewer is already running" call bis_fnc_logFormat;};
		missionnamespace setvariable ["BIS_fnc_arsenal_fullArsenal",[_this,0,false,[false]] call bis_fnc_param];

		with missionnamespace do {
			BIS_fnc_arsenal_cargo = [_this,1,objnull,[objnull]] call bis_fnc_param;
			BIS_fnc_arsenal_center = [_this,2,player,[player]] call bis_fnc_param;
			// Note: BIS_fnc_arsenal_center seems to refer to the player or unit that will be the recipient of the items.		
		};
		with uinamespace do {
			_displayMission = [] call (uinamespace getvariable "bis_fnc_displayMission");
			if !(isnull finddisplay 312) then {_displayMission = finddisplay 312;};
			_displayMission createdisplay "RscDisplayFixedArsenal";
			// This goes and executes RsdDisplayFixedArsenal.sqf, 
			// which will do ['Init',_params] spawn/call (uinamespace getvariable "XLA_fnc_arsenal");
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Init": {
		["XLA_fnc_arsenal"] call bis_fnc_startloadingscreen;
		_display = _this select 0;
		BIS_fnc_arsenal_type = 0; //--- 0 - Arsenal, 1 - Garage

		INITTYPES
		["InitGUI",[_display,"XLA_fnc_arsenal"]] call XLA_fnc_arsenal;
		["Preload"] call XLA_fnc_arsenal;
		["ListAdd",[_display]] call XLA_fnc_arsenal;
		["ListSelectCurrent",[_display]] call XLA_fnc_arsenal;

		//--- Load stats
		if (isnil {uinamespace getvariable "bis_fnc_arsenal_weaponStats"}) then {
			uinamespace setvariable [
				"bis_fnc_arsenal_weaponStats",
				[
					("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'type') < 5") configclasses (configfile >> "cfgweapons"),
					STATS_WEAPONS
				] call bis_fnc_configExtremes
			];
		};
		if (isnil {uinamespace getvariable "bis_fnc_arsenal_equipmentStats"}) then {
			_statsEquipment = [
				("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'itemInfo' >> 'type') in [605,701,801]") configclasses (configfile >> "cfgweapons"),
				STATS_EQUIPMENT
			] call bis_fnc_configExtremes;
			_statsBackpacks = [
				("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'isBackpack') == 1") configclasses (configfile >> "cfgvehicles"),
				STATS_EQUIPMENT
			] call bis_fnc_configExtremes;

			_statsEquipmentMin = _statsEquipment select 0;
			_statsEquipmentMax = _statsEquipment select 1;
			_statsBackpacksMin = _statsBackpacks select 0;
			_statsBackpacksMax = _statsBackpacks select 1;
			for "_i" from 1 to 2 do { //--- Ignore backpack armor, has no effect
				_statsEquipmentMin set [_i,(_statsEquipmentMin select _i) min (_statsBackpacksMin select _i)];
				_statsEquipmentMax set [_i,(_statsEquipmentMax select _i) max (_statsBackpacksMax select _i)];
			};

			uinamespace setvariable ["bis_fnc_arsenal_equipmentStats",[_statsEquipmentMin,_statsEquipmentMax]];
		};

		["XLA_fnc_arsenal"] call bis_fnc_endloadingscreen;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "InitGUI": {
		_display = _this select 0;
		_function = _this select 1;
		BIS_fnc_arsenal_display = _display;
		BIS_fnc_arsenal_mouse = [0,0];
		BIS_fnc_arsenal_buttons = [[],[]];
		BIS_fnc_arsenal_action = "";
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);
		cuttext ["","plain"];
		showcommandingmenu "";
		//["#(argb,8,8,3)color(0,0,0,1)",false,nil,0.1,[0,0.5]] spawn bis_fnc_textTiles;

		_display displayaddeventhandler ["mousebuttondown","with uinamespace do {['MouseButtonDown',_this] call XLA_fnc_arsenal;};"];
		_display displayaddeventhandler ["mousebuttonup","with uinamespace do {['MouseButtonUp',_this] call XLA_fnc_arsenal;};"];
		//_display displayaddeventhandler ["mousezchanged","with uinamespace do {['MouseZChanged',_this] call XLA_fnc_arsenal;};"];
		_display displayaddeventhandler ["keydown","with (uinamespace) do {['KeyDown',_this] call XLA_fnc_arsenal;};"];
		//_display displayaddeventhandler ["mousemoving","with (uinamespace) do {['Loop',_this] call XLA_fnc_arsenal;};"];
		//_display displayaddeventhandler ["mouseholding","with (uinamespace) do {['Loop',_this] call XLA_fnc_arsenal;};"];

		_ctrlMouseArea = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEAREA;
		_ctrlMouseArea ctrladdeventhandler ["mousemoving","with uinamespace do {['Mouse',_this] call XLA_fnc_arsenal;};"];
		_ctrlMouseArea ctrladdeventhandler ["mouseholding","with uinamespace do {['Mouse',_this] call XLA_fnc_arsenal;};"];
		_ctrlMouseArea ctrladdeventhandler ["mousebuttonclick","with uinamespace do {['TabDeselect',[ctrlparent (_this select 0),_this select 1]] call XLA_fnc_arsenal;};"];
		_ctrlMouseArea ctrladdeventhandler ["mousezchanged","with uinamespace do {['MouseZChanged',_this] call XLA_fnc_arsenal;};"];
		ctrlsetfocus _ctrlMouseArea;

		_ctrlMouseBlock = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEBLOCK;
		_ctrlMouseBlock ctrlenable false;
		_ctrlMouseBlock ctrladdeventhandler ["setfocus",{_this spawn {disableserialization; (_this select 0) ctrlenable false; (_this select 0) ctrlenable true;};}];

		_ctrlMessage = _display displayctrl IDC_RSCDISPLAYARSENAL_MESSAGE;
		_ctrlMessage ctrlsetfade 1;
		_ctrlMessage ctrlcommit 0;

		_ctrlInfo = _display displayctrl IDC_RSCDISPLAYARSENAL_INFO_INFO;
		_ctrlInfo ctrlsetfade 1;
		_ctrlInfo ctrlcommit 0;

		_ctrlStats = _display displayctrl IDC_RSCDISPLAYARSENAL_STATS_STATS;
		_ctrlStats ctrlsetfade 1;
		_ctrlStats ctrlcommit 0;

		//--- UI event handlers
		_ctrlButtonInterface = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONINTERFACE;
		_ctrlButtonInterface ctrladdeventhandler ["buttonclick","with uinamespace do {['buttonInterface',[ctrlparent (_this select 0)]] call XLA_fnc_arsenal;};"];

		_ctrlButtonRandom = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONRANDOM;
		_ctrlButtonRandom ctrladdeventhandler ["buttonclick",format ["with uinamespace do {['buttonRandom',[ctrlparent (_this select 0)]] call %1;};",_function]];

		_ctrlButtonSave = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONSAVE;
		_ctrlButtonSave ctrladdeventhandler ["buttonclick","with uinamespace do {['buttonSave',[ctrlparent (_this select 0)]] call XLA_fnc_arsenal;};"];

		_ctrlButtonLoad = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONLOAD;
		_ctrlButtonLoad ctrladdeventhandler ["buttonclick","with uinamespace do {['buttonLoad',[ctrlparent (_this select 0)]] call XLA_fnc_arsenal;};"];

		_ctrlButtonExport = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONEXPORT;
		_ctrlButtonExport ctrladdeventhandler ["buttonclick","with uinamespace do {['buttonExport',[ctrlparent (_this select 0),'init']] call XLA_fnc_arsenal;};"];
		_ctrlButtonExport ctrlenable !ismultiplayer;

		_ctrlButtonImport = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONIMPORT;
		_ctrlButtonImport ctrladdeventhandler ["buttonclick","with uinamespace do {['buttonImport',[ctrlparent (_this select 0)]] call XLA_fnc_arsenal;};"];

		_ctrlButtonOK = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONOK;
		_ctrlButtonOK ctrladdeventhandler ["buttonclick","with uinamespace do {['buttonOK',[ctrlparent (_this select 0)]] call XLA_fnc_arsenal;};"];

		_ctrlArrowLeft = _display displayctrl IDC_RSCDISPLAYARSENAL_ARROWLEFT;
		_ctrlArrowLeft ctrladdeventhandler ["buttonclick","with uinamespace do {['buttonCargo',[ctrlparent (_this select 0),-1]] call XLA_fnc_arsenal;};"];

		_ctrlArrowRight = _display displayctrl IDC_RSCDISPLAYARSENAL_ARROWRIGHT;
		_ctrlArrowRight ctrladdeventhandler ["buttonclick","with uinamespace do {['buttonCargo',[ctrlparent (_this select 0),+1]] call XLA_fnc_arsenal;};"];

		_ctrlTemplateButtonOK = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONOK;
		_ctrlTemplateButtonOK ctrladdeventhandler ["buttonclick","with uinamespace do {['buttonTemplateOK',[ctrlparent (_this select 0)]] call XLA_fnc_arsenal;};"];

		_ctrlTemplateButtonCancel = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONCANCEL;
		_ctrlTemplateButtonCancel ctrladdeventhandler ["buttonclick","with uinamespace do {['buttonTemplateCancel',[ctrlparent (_this select 0)]] call XLA_fnc_arsenal;};"];

		_ctrlTemplateButtonDelete = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONDELETE;
		_ctrlTemplateButtonDelete ctrladdeventhandler ["buttonclick","with uinamespace do {['buttonTemplateDelete',[ctrlparent (_this select 0)]] call XLA_fnc_arsenal;};"];

		_ctrlTemplateValue = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
		_ctrlTemplateValue ctrladdeventhandler ["lbselchanged","with uinamespace do {['templateSelChanged',[ctrlparent (_this select 0)]] call XLA_fnc_arsenal;};"];
		_ctrlTemplateValue ctrladdeventhandler ["lbdblclick","with uinamespace do {['buttonTemplateOK',[ctrlparent (_this select 0)]] call XLA_fnc_arsenal;};"];

		//--- Menus
		_ctrlIcon = _display displayctrl IDC_RSCDISPLAYARSENAL_TAB;
		_ctrlIconPos = ctrlposition _ctrlIcon;
		_ctrlTabs = _display displayctrl IDC_RSCDISPLAYARSENAL_TABS;
		_ctrlTabsPos = ctrlposition _ctrlTabs;
		_ctrlTabsPosX = _ctrlTabsPos select 0;
		_ctrlTabsPosY = _ctrlTabsPos select 1;
		_ctrlIconPosW = _ctrlIconPos select 2;
		_ctrlIconPosH = _ctrlIconPos select 3;
		_columns = (_ctrlTabsPos select 2) / _ctrlIconPosW;
		_rows = (_ctrlTabsPos select 3) / _ctrlIconPosH;
		_gridH = ctrlposition _ctrlTemplateButtonOK select 3;

		{
			_idc = _x;
			_ctrlIcon = _display displayctrl (IDC_RSCDISPLAYARSENAL_ICON + _idc);
			_ctrlTab = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _idc);
			_mode = if (_idc in [IDCS_LEFT]) then {"TabSelectLeft"} else {"TabSelectRight"};
			{
				_x ctrladdeventhandler ["buttonclick",format ["with uinamespace do {['%2',[ctrlparent (_this select 0),%1]] call %3;};",_idc,_mode,_function]];
				_x ctrladdeventhandler ["mousezchanged","with uinamespace do {['MouseZChanged',_this] call XLA_fnc_arsenal;};"];
			} foreach [_ctrlIcon,_ctrlTab];

			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _idc);
			_ctrlList ctrlenable false;
			_ctrlList ctrlsetfade 1;
			_ctrlList ctrlsetfontheight (_gridH * 0.8);
			_ctrlList ctrlcommit 0;
			_ctrlList ctrladdeventhandler ["lbselchanged",format ["with uinamespace do {['SelectItem',[ctrlparent (_this select 0),(_this select 0),%1]] call %2;};",_idc,_function]];
			_ctrlList ctrladdeventhandler ["lbdblclick",format ["with uinamespace do {['ShowItem',[ctrlparent (_this select 0),(_this select 0),%1]] spawn XLA_fnc_arsenal;};",_idc]];
		} foreach IDCS;
		['TabDeselect',[_display,-1]] call XLA_fnc_arsenal;
		['SelectItem',[_display,controlnull,-1]] call (uinamespace getvariable _function);

		{
			_ctrl = _display displayctrl _x;
			_ctrl ctrlenable false;
			_ctrl ctrlsetfade 1;
			_ctrl ctrlcommit 0;
		} foreach [
			IDC_RSCDISPLAYARSENAL_FRAMELEFT,
			IDC_RSCDISPLAYARSENAL_FRAMERIGHT,
			IDC_RSCDISPLAYARSENAL_BACKGROUNDLEFT,
			IDC_RSCDISPLAYARSENAL_BACKGROUNDRIGHT,
			IDC_RSCDISPLAYARSENAL_LINEICON,
			IDC_RSCDISPLAYARSENAL_LINETABLEFT,
			IDC_RSCDISPLAYARSENAL_LINETABRIGHT,
			IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE
		];

		_ctrlButtonClose = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONCLOSE;
		_ctrlButtonClose ctrladdeventhandler ["buttonclick","with uinamespace do {['buttonClose',[ctrlparent (_this select 0)]] spawn XLA_fnc_arsenal;}; true"];

		if (missionname == "Arsenal") then {
			_ctrlButtonClose ctrlsettext localize "STR_DISP_ARCMAP_EXIT";
		};
		if (missionname != "arsenal") then {
			_ctrlButtonOK ctrlsettext "";
			_ctrlButtonOK ctrlenable false;
		};
		if !(_fullVersion) then {
			{
				_tab = _x;
				{
					_ctrl = _display displayctrl (_tab + _x);
					_ctrl ctrlshow false;
					_ctrl ctrlenable false;
					_ctrl ctrlremovealleventhandlers "buttonclick";
					_ctrl ctrlremovealleventhandlers "mousezchanged";
					_ctrl ctrlremovealleventhandlers "lbselchanged";
					_ctrl ctrlremovealleventhandlers "lbdblclick";
					_ctrl ctrlsetposition [0,0,0,0];
					_ctrl ctrlcommit 0;
				} foreach [IDC_RSCDISPLAYARSENAL_TAB,IDC_RSCDISPLAYARSENAL_ICON];
			} foreach [
				IDC_RSCDISPLAYARSENAL_TAB_FACE,
				IDC_RSCDISPLAYARSENAL_TAB_VOICE,
				IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA
			];
		};

		//--- Camera init
		BIS_fnc_arsenal_campos = uinamespace getvariable [
			format ["BIS_fnc_arsenal_campos_%1",BIS_fnc_arsenal_type],
			if (BIS_fnc_arsenal_type == 0) then {[5,0,0,[0,0,0.85]]} else {[10,-45,15,[0,0,-1]]}
		];
		_target = createagent ["Logic",position _center,[],0,"none"];
		_target attachto [_center,BIS_fnc_arsenal_campos select 3,""];
		missionnamespace setvariable ["BIS_fnc_arsenal_target",_target];

		_cam = "camera" camcreate position _center;
		_cam cameraeffect ["internal","back"];
		_cam campreparefocus [-1,-1];
		_cam campreparefov 0.35;
		_cam camcommitprepared 0;
		cameraEffectEnableHUD true;
		showcinemaborder false;
		BIS_fnc_arsenal_cam = _cam;
		["#(argb,8,8,3)color(0,0,0,1)",false,nil,0,[0,0.5]] call bis_fnc_textTiles;

		//--- Camera reset
		["Mouse",[controlnull,0,0]] call XLA_fnc_arsenal;
		BIS_fnc_arsenal_draw3D = addMissionEventHandler ["draw3D",{with (uinamespace) do {['draw3D',_this] call XLA_fnc_arsenal;};}];

		setacctime (missionnamespace getvariable ["BIS_fnc_arsenal_acctime",1]);
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Preload": {
		private ["_data"];
		_data = missionnamespace getvariable "bis_fnc_arsenal_data";
		if (isnil "_data") then {
			["bis_fnc_arsenal_preload"] call bis_fnc_startloadingscreen;
			INITTYPES
			_data = [];
			{
				_data set [_x,[]];
			} foreach IDCS;

			_configArray = (
				("isclass _x" configclasses (configfile >> "cfgweapons")) +
				("isclass _x" configclasses (configfile >> "cfgvehicles")) +
				("isclass _x" configclasses (configfile >> "cfgglasses"))
			);
			_progressStep = 1 / count _configArray;
			{
				_class = _x;
				if ((getnumber (_class >> "scope") == 2 || getnumber (_class >> "scopeArsenal") == 2) && {gettext (_class >> "model") != ""} && {count (_class >> "linkeditems") == 0}) then {
					private ["_weaponType","_weaponTypeCategory"];
					_weaponType = ((configname _class) call bis_fnc_itemType);
					_weaponTypeCategory = _weaponType select 0;
					if (_weaponTypeCategory != "VehicleWeapon") then {
						private ["_weaponTypeSpecific","_weaponTypeID"];
						_weaponTypeSpecific = _weaponType select 1;
						_weaponTypeID = -1;
						{
							if (_weaponTypeSpecific in _x) exitwith {_weaponTypeID = _foreachindex;};
						} foreach _types;
						if (_weaponTypeID >= 0) then {
							private ["_items"];
							_items = _data select _weaponTypeID;
							_items set [count _items,configname _class];
						};
					};
				};
				progressloadingscreen (_foreachindex * _progressStep);
			} foreach _configArray;

			//--- Faces
			if (_fullVersion) then {
				{
					private ["_index"];
					_index = _foreachindex;
					{
						if (getnumber (_x >> "disabled") == 0 && gettext (_x >> "head") != "" && configname _x != "Default") then {
							private ["_items"];
							_items = _data select IDC_RSCDISPLAYARSENAL_TAB_FACE;
							_items set [count _items,[_x,_index]];
						};
					} foreach ("isclass _x" configclasses _x);
				} foreach ("isclass _x" configclasses (configfile >> "cfgfaces"));

				//--- Voices
				{
					if ((getnumber (_x >> "scope") == 2 || getnumber (_x >> "scopeArsenal") == 2) && gettext (_x >> "protocol") != "RadioProtocolBase") then {
						private ["_items"];
						_items = _data select IDC_RSCDISPLAYARSENAL_TAB_VOICE;
						_items set [count _items,configname _x];
					};
				} foreach ("isclass _x" configclasses (configfile >> "cfgvoice"));

				//--- Insignia
				{
					private ["_items"];
					_items = _data select IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA;
					_items set [count _items,configname _x];
				} foreach ("isclass _x" configclasses (configfile >> "cfgunitinsignia"));
			};

			//--- Magazines - Put and Throw
			{
				private ["_weapons","_tab","_magazines"];
				_weapon = _x select 0;
				_tab = _x select 1;
				_magazines = [];
				{
					{
						private ["_mag"];
						_mag = _x;
						if ({_x == _mag} count _magazines == 0) then {
							private ["_cfgMag"];
							_magazines set [count _magazines,_mag];
							_cfgMag = configfile >> "cfgmagazines" >> _mag;
							if (getnumber (_cfgMag >> "scope") == 2 || getnumber (_cfgMag >> "scopeArsenal") == 2) then {
								private ["_items"];
								_items = _data select _tab;
								_items set [count _items,configname _cfgMag];
							};
						};
					} foreach getarray (_x >> "magazines");
				} foreach ("isclass _x" configclasses (configfile >> "cfgweapons" >> _weapon));
			} foreach [
				["throw",IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW],
				["put",IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT]
			];

			missionnamespace setvariable ["bis_fnc_arsenal_data",_data];
			["bis_fnc_arsenal_preload"] call bis_fnc_endloadingscreen;
			true
		} else {
			false
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Exit": {
		removemissioneventhandler ["draw3D",BIS_fnc_arsenal_draw3D];

		_target = (missionnamespace getvariable ["BIS_fnc_arsenal_target",player]);
		_cam = uinamespace getvariable ["BIS_fnc_arsenal_cam",objnull];
		_camData = [getposatl _cam,(getposatl _cam) vectorfromto (getposatl _target)];
		_cam cameraeffect ["terminate","back"];
		camdestroy _cam;

		uinamespace setvariable [format ["BIS_fnc_arsenal_campos_%1",BIS_fnc_arsenal_type],BIS_fnc_arsenal_campos];

		BIS_fnc_arsenal_cam = nil;
		BIS_fnc_arsenal_display = nil;
		BIS_fnc_arsenal_type = nil;
		BIS_fnc_arsenal_mouse = nil;
		BIS_fnc_arsenal_buttons = nil;
		BIS_fnc_arsenal_action = nil;
		BIS_fnc_arsenal_campos = nil;

		deletevehicle (missionnamespace getvariable ["BIS_fnc_arsenal_target",objnull]);

		with missionnamespace do {
			BIS_fnc_arsenal_acctime = acctime;
			BIS_fnc_arsenal_target = nil;
			BIS_fnc_arsenal_center = nil;
			BIS_fnc_arsenal_cargo = nil;
		};

		setacctime 1;

		if !(isnull curatorcamera) then {
			curatorcamera setposatl (_camData select 0);
			curatorcamera setvectordir (_camData select 1);
			curatorcamera cameraeffect ["internal","back"];
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "draw3D": {
		_display = BIS_fnc_arsenal_display;

		_cam = (uinamespace getvariable ["BIS_fnc_arsenal_cam",objnull]);
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);
		_target = (missionnamespace getvariable ["BIS_fnc_arsenal_target",player]);

		_dis = BIS_fnc_arsenal_campos select 0;
		_dirH = BIS_fnc_arsenal_campos select 1;
		_dirV = BIS_fnc_arsenal_campos select 2;

		[_target,[_dirH + 180,-_dirV,0]] call bis_fnc_setobjectrotation;
		_target attachto [_center,BIS_fnc_arsenal_campos select 3,""]; //--- Reattach for smooth movement
		_cam attachto [_target,[0,-_dis,0],""];

		//--- Make sure the camera is not underground
		if ((getposatl _cam select 2) < 0) then {
			_disCoef = (getposatl _target select 2) / ((getposatl _target select 2) - (getposatl _cam select 2) + 0.001);
			_cam attachto [_target,[0,-_dis * _disCoef,0],""];
		};

		if (BIS_fnc_arsenal_type == 0) then {
			_selections = [];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_UNIFORM,		["Pelvis",						[+0.00, +0.00, -0.00]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_VEST,		["Spine3",						[+0.00, +0.00, +0.00]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_BACKPACK,		["Spine3",						[+0.00, -0.20, +0.00]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR,		["Head_axis",						[+0.00, +0.00, +0.00]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_GOGGLES,		["Pilot",						[-0.04, +0.05, +0.00]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_NVGS,		["Pilot",						[+0.00, -0.05, +0.05]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS,		["Pilot",						[+0.04, +0.05, +0.00]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,	["proxy:\A3\Characters_F\Proxies\weapon.001",		[+0.00, +0.00, +0.00]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,	["proxy:\A3\Characters_F\Proxies\launcher.001",		[+0.00, +0.00, +0.00]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_HANDGUN,		["proxy:\A3\Characters_F\Proxies\pistol.001",		[+0.00, +0.00, +0.00]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_MAP,			["",[0, 0,0]]];//["Pelvis",				[-0.15, +0.05, +0.00]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_GPS,			["",[0, 0,0]]];//["Pelvis",				[-0.05, +0.10, +0.00]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_RADIO,		["",[0, 0,0]]];//["Pelvis",				[+0.05, +0.10, +0.00]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_COMPASS,		["",[0, 0,0]]];//["Pelvis",				[+0.15, +0.05, +0.00]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_WATCH,		["",[0, 0,0]]];//["LeftForeArmRoll",			[+0.00, +0.00, +0.00]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_FACE,		["Head_axis",						[+0.05, +0.10, -0.05]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_VOICE,		["",[0, 0,0]]];//["Head_axis",				[-0.05, +0.10, -0.05]]];
			_selections set [IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA,		["LeftShoulder",					[+0.00, +0.00, +0.00]]];
			//_selections set [IDC_RSCDISPLAYARSENAL_TAB_MISC,		["",[0, 0,0]]];//["",					[+0.00, +0.00, +0.00]]];

			//_cam = (uinamespace getvariable ["BIS_fnc_arsenal_cam",player]);
			//_target = (uinamespace getvariable ["BIS_fnc_arsenal_target",player]);
			//_alpha = (1 / (_cam distance _target) - 1/3) * 0.75;

			_fade = 1;
			{
				_selPos = _center selectionposition (_x select 0);
				if (_selPos distance [0,0,0] > 0) then {
					_selPos = [_selPos,_x select 1] call bis_fnc_vectorAdd;
					_pos = _center modeltoworld _selPos;
					_uiPos = worldtoscreen _pos;
					if (count _uiPos > 0) then {
						_fade = _fade min (_uiPos distance BIS_fnc_arsenal_mouse);

						_ctrl = _display displayctrl (IDC_RSCDISPLAYARSENAL_ICON + _foreachindex);
						_ctrlPos = ctrlposition _ctrl;
						_ctrlPos set [0,(_uiPos select 0) - (_ctrlPos select 2) * 0.5];
						_ctrlPos set [1,(_uiPos select 1) - (_ctrlPos select 3) * 0.5];
						_ctrl ctrlsetposition _ctrlPos;
						_ctrl ctrlcommit 0;

						_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _foreachindex);
						_ctrlLineIcon = _display displayctrl IDC_RSCDISPLAYARSENAL_LINEICON;
						if (ctrlfade _ctrlList == 0) then {
							_ctrlLinePosX = (_uiPos select 0) - (_ctrlPos select 2) * 0.5;
							_ctrlLineIcon ctrlsetposition [
								(_uiPos select 0) - (_ctrlPos select 2) * 0.5,
								_uiPos select 1,
								(ctrlposition _ctrlList select 0) + (ctrlposition _ctrlList select 2) - _ctrlLinePosX,
								0
							];
							_ctrlLineIcon ctrlsetfade 0;
							_ctrlLineIcon ctrlcommit 0;
						} else {
							if (ctrlfade _ctrlLineIcon == 0) then {
								_ctrlLineIcon ctrlsetfade 0.01;
								_ctrlLineIcon ctrlcommit 0;
								_ctrlLineIcon ctrlsetfade 1;
								_ctrlLineIcon ctrlcommit FADE_DELAY;
							};
						};
					};
				};
			} foreach _selections;

			_fade = ((_fade - safezoneW * 0.1) * safezoneW) max 0;
			{
				_ctrl = _display displayctrl (IDC_RSCDISPLAYARSENAL_ICON + _foreachindex);
				if !(ctrlenabled _ctrl) then {
					_ctrl ctrlsetfade 0;
				} else {
					_ctrl ctrlsetfade _fade;
				};
				_ctrl ctrlcommit 0;
			} foreach _selections;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Mouse": {
		_ctrl = _this select 0;
		_mX = _this select 1;
		_mY = _this select 2;
		BIS_fnc_arsenal_mouse = [_mX,_mY];

		_cam = (uinamespace getvariable ["BIS_fnc_arsenal_cam",objnull]);
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);
		_target = (missionnamespace getvariable ["BIS_fnc_arsenal_target",player]);

		_dis = BIS_fnc_arsenal_campos select 0;
		_dirH = BIS_fnc_arsenal_campos select 1;
		_dirV = BIS_fnc_arsenal_campos select 2;
		_targetPos = BIS_fnc_arsenal_campos select 3;
		_disLocal = _dis;

		_LMB = BIS_fnc_arsenal_buttons select 0;
		_RMB = BIS_fnc_arsenal_buttons select 1;

		if (isnull _ctrl) then {_LMB = [0,0];}; //--- Init

		if (count _LMB > 0) then {
			_cX = _LMB select 0;
			_cY = _LMB select 1;
			_dX = (_cX - _mX);
			_dY = (_cY - _mY);
			BIS_fnc_arsenal_buttons set [0,[_mX,_mY]];

			_centerBox = boundingboxreal _center;
			_centerSizeBottom = _centerBox select 0 select 2;
			_centerSizeUp = _centerBox select 1 select 2;
			_centerSize = sqrt ([_centerBox select 0 select 0,_centerBox select 0 select 1] distance [_centerBox select 1 select 0,_centerBox select 1 select 1]);
			_targetPos = [_targetPos,_dX * _centerSize,_dirH - 90] call bis_fnc_relpos;
			_targetPos = [
				[0,0,((_targetPos select 2) - _dY * _centerSize) max _centerSizeBottom min _centerSizeUp],
				([[0,0,0],_targetPos] call bis_fnc_distance2D) min _centerSize,
				[[0,0,0],_targetPos] call bis_fnc_dirto
			] call bis_fnc_relpos;
			BIS_fnc_arsenal_campos set [3,_targetPos];
		};

		if (count _RMB > 0) then {
			_cX = _RMB select 0;
			_cY = _RMB select 1;
			_dX = (_cX - _mX) * 0.75;
			_dY = (_cY - _mY) * 0.75;
			_targetPos = [
				[0,0,_targetPos select 2],
				[[0,0,0],_targetPos] call bis_fnc_distance2D,
				([[0,0,0],_targetPos] call bis_fnc_dirto) - _dX * 180
			] call bis_fnc_relpos;

			BIS_fnc_arsenal_campos set [1,(_dirH - _dX * 180) % 360];
			BIS_fnc_arsenal_campos set [2,(_dirV - _dY * 100) max -89 min 89];
			BIS_fnc_arsenal_campos set [3,_targetPos];
			BIS_fnc_arsenal_buttons set [1,[_mX,_mY]];
		};

		if (isnull _ctrl) then {BIS_fnc_arsenal_buttons = [[],[]];};

		//--- Terminate when unit is dead
		if (!alive _center || isnull _center) then {
			(ctrlparent (_this select 0)) closedisplay 2;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseButtonDown": {
		BIS_fnc_arsenal_buttons set [_this select 1,[_this select 2,_this select 3]];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseButtonUp": {
		BIS_fnc_arsenal_buttons set [_this select 1,[]];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseZChanged": {
		_cam = (uinamespace getvariable ["BIS_fnc_arsenal_cam",objnull]);
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);
		_target = (missionnamespace getvariable ["BIS_fnc_arsenal_target",player]);

		_disMax = if (bis_fnc_arsenal_type > 0) then {sizeof typeof _center * 1.5} else {5};
		_disMin = _disMax * 0.15;
		_z = _this select 1;
		_dis = BIS_fnc_arsenal_campos select 0;
		_dis = _dis - (_z / 10);
		_dis = _dis max _disMin min _disMax;
		BIS_fnc_arsenal_campos set [0,_dis];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "ListAdd": {
		_display = _this select 0;
		_data = missionnamespace getvariable "bis_fnc_arsenal_data";
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);
		_cargo = (missionnamespace getvariable ["BIS_fnc_arsenal_cargo",objnull]);

		GETVIRTUALCARGO

		{	
			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _foreachindex);
			switch _foreachindex do {
				case IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON;
				case IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON;
				case IDC_RSCDISPLAYARSENAL_TAB_HANDGUN: {
					_virtualCargo = _virtualWeaponCargo;
					_virtualAll = _fullVersion || {"%ALL" in _virtualCargo};
					{
						if (_virtualAll || {_x in _virtualCargo}) then {
							_xCfg = configfile >> "cfgweapons" >> _x;
							_lbAdd = _ctrlList lbadd gettext (_xCfg >> "displayName");
							_ctrlList lbsetdata [_lbAdd,_x];
							_ctrlList lbsetpicture [_lbAdd,gettext (_xCfg >> "picture")];
						};
					} foreach _x;
				};
				case IDC_RSCDISPLAYARSENAL_TAB_UNIFORM;
				case IDC_RSCDISPLAYARSENAL_TAB_VEST;
				case IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR;
				case IDC_RSCDISPLAYARSENAL_TAB_NVGS;
				case IDC_RSCDISPLAYARSENAL_TAB_MAP;
				case IDC_RSCDISPLAYARSENAL_TAB_GPS;
				case IDC_RSCDISPLAYARSENAL_TAB_RADIO;
				case IDC_RSCDISPLAYARSENAL_TAB_COMPASS;
				case IDC_RSCDISPLAYARSENAL_TAB_WATCH: {
					_virtualCargo = _virtualItemCargo;
					_virtualAll = _fullVersion || {"%ALL" in _virtualCargo};
					{
						if (_virtualAll || {_x in _virtualCargo}) then {
							_xCfg = configfile >> "cfgweapons" >> _x;
							_lbAdd = _ctrlList lbadd gettext (_xCfg >> "displayName");
							_ctrlList lbsetdata [_lbAdd,_x];
							_ctrlList lbsetpicture [_lbAdd,gettext (_xCfg >> "picture")];
						};
					} foreach _x;
				};
				case IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS: {
					_virtualCargo = _virtualWeaponCargo + _virtualItemCargo;
					_virtualAll = _fullVersion || {"%ALL" in _virtualCargo};
					{
						if (_virtualAll || {_x in _virtualCargo}) then {
							_xCfg = configfile >> "cfgweapons" >> _x;
							_lbAdd = _ctrlList lbadd gettext (_xCfg >> "displayName");
							_ctrlList lbsetdata [_lbAdd,_x];
							_ctrlList lbsetpicture [_lbAdd,gettext (_xCfg >> "picture")];
						};
					} foreach _x;

				};
				case IDC_RSCDISPLAYARSENAL_TAB_GOGGLES: {
					_virtualCargo = _virtualItemCargo;
					_virtualAll = _fullVersion || {"%ALL" in _virtualCargo};
					{
						if (_virtualAll || {_x in _virtualCargo}) then {
							_xCfg = configfile >> "cfgglasses" >> _x;
							_lbAdd = _ctrlList lbadd gettext (_xCfg >> "displayName");
							_ctrlList lbsetdata [_lbAdd,_x];
							_ctrlList lbsetpicture [_lbAdd,gettext (_xCfg >> "picture")];
						};
					} foreach _x;
				};
				case IDC_RSCDISPLAYARSENAL_TAB_BACKPACK: {
					_virtualCargo = _virtualBackpackCargo;
					_virtualAll = _fullVersion || {"%ALL" in _virtualCargo};
					{
						if (_virtualAll || {_x in _virtualCargo}) then {
							_xCfg = configfile >> "cfgvehicles" >> _x;
							_lbAdd = _ctrlList lbadd gettext (_xCfg >> "displayName");
							_ctrlList lbsetdata [_lbAdd,_x];
							_ctrlList lbsetpicture [_lbAdd,gettext (_xCfg >> "picture")];
						};
					} foreach _x;
				};
				case IDC_RSCDISPLAYARSENAL_TAB_FACE: {
					{
						_lbAdd = _ctrlList lbadd gettext ((_x select 0) >> "displayName");//gettext (configfile >> "cfgvoice" >> _x >> "displayName");
						_ctrlList lbsetdata [_lbAdd,configname (_x select 0)];
						_ctrlList lbsetvalue [_lbAdd,_x select 1];
					} foreach _x;
				};
				case IDC_RSCDISPLAYARSENAL_TAB_VOICE: {
					{
						_lbAdd = _ctrlList lbadd ([configfile >> "cfgvoice" >> _x] call bis_fnc_displayName);
						_ctrlList lbsetdata [_lbAdd,_x];
						_ctrlList lbsetpicture [_lbAdd,gettext (configfile >> "cfgvoice" >> _x >> "icon")];
					} foreach _x;
				};
				case IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA: {
					{
						_xCfg = configfile >> "cfgunitinsignia" >> _x;
						_lbAdd = _ctrlList lbadd gettext (_xCfg >> "displayName");
						_ctrlList lbsetdata [_lbAdd,_x];
						_ctrlList lbsetpicture [_lbAdd,gettext (_xCfg >> "texture")];
					} foreach _x;
				};
				case IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW;
				case IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT: {
					_virtualCargo = _virtualMagazineCargo;
					_virtualAll = _fullVersion || {"%ALL" in _virtualCargo};
					{
						if (_virtualAll || {_x in _virtualCargo}) then {
							_xCfg = configfile >> "cfgmagazines" >> _x;
							_lbAdd = _ctrlList lnbaddrow ["",gettext (_xCfg >> "displayName"),str 0];
							_ctrlList lnbsetdata [[_lbAdd,0],_x];
							_ctrlList lnbsetpicture [[_lbAdd,0],gettext (_xCfg >> "picture")];
							_ctrlList lnbsetvalue [[_lbAdd,0],getnumber (_xCfg >> "mass")];
						};
					} foreach _x;
				};
				case IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC: {
					_virtualCargo = _virtualItemCargo;
					_virtualAll = _fullVersion || {"%ALL" in _virtualCargo};
					{
						if (_virtualAll || {_x in _virtualCargo}) then {
							_xCfg = configfile >> "cfgweapons" >> _x;
							_lbAdd = _ctrlList lnbaddrow ["",gettext (_xCfg >> "displayName"),str 0];
							_ctrlList lnbsetdata [[_lbAdd,0],_x];
							_ctrlList lnbsetpicture [[_lbAdd,0],gettext (_xCfg >> "picture")];
							_ctrlList lnbsetvalue [[_lbAdd,0],getnumber (_xCfg >> "itemInfo" >> "mass")];
						};
					} foreach _x;
				};
			};

			//--- Add <Empty> item
			if !(
				_foreachindex in [
					IDC_RSCDISPLAYARSENAL_TAB_FACE,
					IDC_RSCDISPLAYARSENAL_TAB_VOICE,
					IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,
					IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT,
					IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC
				]
			) then {
				_lbAdd = _ctrlList lbadd format [" <%1>",localize "str_empty"];
				lbsort _ctrlList;
			};
		} foreach _data;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "ListSelectCurrent": {
		_display = _this select 0;
		_data = missionnamespace getvariable "bis_fnc_arsenal_data";
		{
			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _foreachindex);

			//--- Sort alphabetically
			if (ctrltype _ctrlList == 5) then {lbsort _ctrlList;};

			//--- Select current
			_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);
			_select = true;
			_current = switch _foreachindex do {
				//--- Uniform
				case IDC_RSCDISPLAYARSENAL_TAB_UNIFORM:		{uniform _center};
				case IDC_RSCDISPLAYARSENAL_TAB_VEST:		{vest _center};
				case IDC_RSCDISPLAYARSENAL_TAB_BACKPACK:	{backpack _center};
				case IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR:	{headgear _center};
				case IDC_RSCDISPLAYARSENAL_TAB_GOGGLES:		{goggles _center};
				case IDC_RSCDISPLAYARSENAL_TAB_NVGS;
				case IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS:	{assigneditems _center};
				case IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON:	{[(primaryweapon _center) call bis_fnc_baseWeapon,0,""] call bis_fnc_paramin};
				case IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON:	{[(secondaryweapon _center) call bis_fnc_baseWeapon,0,""] call bis_fnc_paramin};
				case IDC_RSCDISPLAYARSENAL_TAB_HANDGUN:		{[(handgunweapon _center) call bis_fnc_baseWeapon,0,""] call bis_fnc_paramin};
				case IDC_RSCDISPLAYARSENAL_TAB_MAP;
				case IDC_RSCDISPLAYARSENAL_TAB_GPS;
				case IDC_RSCDISPLAYARSENAL_TAB_RADIO;
				case IDC_RSCDISPLAYARSENAL_TAB_COMPASS;
				case IDC_RSCDISPLAYARSENAL_TAB_WATCH:		{assigneditems _center};
				case IDC_RSCDISPLAYARSENAL_TAB_FACE:		{_center getvariable ["BIS_fnc_arsenal_face",face _center]};
				case IDC_RSCDISPLAYARSENAL_TAB_VOICE:		{speaker _center};
				case IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA:	{_center call bis_fnc_getUnitInsignia};
				default {_select = false; ""};
			};
			if (_select) then {
				if (typename _current != typename []) then {_current = [_current];};
				for "_l" from 0 to (lbsize _ctrlList - 1) do {
					if ({(_ctrlList lbdata _l) == _x} count _current > 0) exitwith {_ctrlList lbsetcursel _l;};
				};
				if (lbcursel _ctrlList < 0) then {_ctrlList lbsetcursel 0;};
			};
		} foreach _data;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "TabDeselect": {
		_display = _this select 0;
		_key = _this select 1;

		//--- Deselect
		if ({count _x > 0} count BIS_fnc_arsenal_buttons == 0) then {

			//--- When interface is hidden, reveal it
			_shown = ctrlshown (_display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_CONTROLBAR);
			if (!_shown || _key == 1) exitwith {['buttonInterface',[_display]] call XLA_fnc_arsenal;};

			{
				_idc = _x;
				_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _idc);
				_ctrlLIst ctrlenable false;
				_ctrlList ctrlsetfade 1;
				_ctrlList ctrlcommit FADE_DELAY;

				_ctrlIcon = _display displayctrl (IDC_RSCDISPLAYARSENAL_ICON + _idc);
				_ctrlTab = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _idc);
				{
					_x ctrlenable true;
					_x ctrlsetfade 0;
				} foreach [/*_ctrlIcon,*/_ctrlTab];
				_ctrlIcon ctrlenable true;
				_ctrlIcon ctrlshow true;

				if (_idc in [IDCS_RIGHT]) then {
					{
						_x ctrlenable false;
						_x ctrlsetfade 1;
						_x ctrlcommit FADE_DELAY;
					} foreach [_ctrlList,_ctrlTab];
				};
			} foreach IDCS;
			{
				_ctrl = _display displayctrl _x;
				_ctrl ctrlsetfade 1;
				_ctrl ctrlcommit 0;
			} foreach [
				IDC_RSCDISPLAYARSENAL_FRAMELEFT,
				IDC_RSCDISPLAYARSENAL_FRAMERIGHT,
				IDC_RSCDISPLAYARSENAL_BACKGROUNDLEFT,
				IDC_RSCDISPLAYARSENAL_BACKGROUNDRIGHT,
				IDC_RSCDISPLAYARSENAL_LINEICON,
				IDC_RSCDISPLAYARSENAL_LINETABLEFT,
				IDC_RSCDISPLAYARSENAL_LINETABRIGHT,
				IDC_RSCDISPLAYARSENAL_LOADCARGO,
				IDC_RSCDISPLAYARSENAL_INFO_INFO,
				IDC_RSCDISPLAYARSENAL_STATS_STATS
			];
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "TabSelectLeft": {
		_display = _this select 0;
		_index = _this select 1;

		{
			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _x);
			_ctrlList lbsetcursel -1;
			lbclear _ctrlList;
		} foreach [IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC,IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG];

		{
			_idc = _x;
			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _idc);
			_active = _idc == _index;

			_ctrlList ctrlenable _active;
			_ctrlList ctrlsetfade ([1,0] select _active);
			_ctrlList ctrlcommit FADE_DELAY;

			_ctrlTab = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _idc);
			_ctrlTab ctrlenable !_active;

			if (_active) then {
				_ctrlLineTabLeft = _display displayctrl IDC_RSCDISPLAYARSENAL_LINETABLEFT;
				_ctrlLineTabLeft ctrlsetfade 0;
				_ctrlTabPos = ctrlposition _ctrlTab;
				_ctrlLineTabPosX = (_ctrlTabPos select 0) + (_ctrlTabPos select 2) - 0.01;
				_ctrlLineTabPosY = (_ctrlTabPos select 1);
				_ctrlLineTabLeft ctrlsetposition [
					_ctrlLineTabPosX,
					_ctrlLineTabPosY,
					(ctrlposition _ctrlList select 0) - _ctrlLineTabPosX,
					ctrlposition _ctrlTab select 3
				];
				_ctrlLineTabLeft ctrlcommit 0;
				ctrlsetfocus _ctrlList;
				['SelectItem',[_display,_display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _idc),_idc]] call XLA_fnc_arsenal;
			};

			_ctrlIcon = _display displayctrl (IDC_RSCDISPLAYARSENAL_ICON + _idc);
			//_ctrlIcon ctrlsetfade ([1,0] select _active);
			_ctrlIcon ctrlshow _active;
			_ctrlIcon ctrlenable !_active;
		} foreach [IDCS_LEFT];

		{
			_ctrl = _display displayctrl _x;
			_ctrl ctrlsetfade 0;
			_ctrl ctrlcommit FADE_DELAY;
		} foreach [
			IDC_RSCDISPLAYARSENAL_LINETABLEFT,
			IDC_RSCDISPLAYARSENAL_FRAMELEFT,
			IDC_RSCDISPLAYARSENAL_BACKGROUNDLEFT
		];

		//--- Weapon attachments
		_showItems = _index in [IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,IDC_RSCDISPLAYARSENAL_TAB_HANDGUN];
		_fadeItems = [1,0] select _showItems;
		{
			_ctrl = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _x);
			_ctrl ctrlenable _showItems;
			_ctrl ctrlsetfade _fadeItems;
			_ctrl ctrlcommit 0;//FADE_DELAY;

			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _x);
			_ctrlList ctrlenable _showItems;
			_ctrlList ctrlsetfade _fadeItems;
			_ctrlList ctrlcommit FADE_DELAY;
		} foreach [
			IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC,
			IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,
			IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE
		];
		if (_showItems) then {['TabSelectRight',[_display,IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC]] call XLA_fnc_arsenal;};

		//--- Containers
		_showCargo = _index in [IDC_RSCDISPLAYARSENAL_TAB_UNIFORM,IDC_RSCDISPLAYARSENAL_TAB_VEST,IDC_RSCDISPLAYARSENAL_TAB_BACKPACK];
		_fadeCargo = [1,0] select _showCargo;
		{
			_ctrl = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _x);
			_ctrl ctrlenable _showCargo;
			_ctrl ctrlsetfade _fadeCargo;
			_ctrl ctrlcommit 0;//FADE_DELAY;

			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _x);
			_ctrlList ctrlenable _showCargo;
			_ctrlList ctrlsetfade _fadeCargo;
			_ctrlList ctrlcommit FADE_DELAY;
		} foreach [
			IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,
			IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,
			IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT,
			IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC
		];
		_ctrl = _display displayctrl IDC_RSCDISPLAYARSENAL_LOADCARGO;
		_ctrl ctrlsetfade _fadeCargo;
		_ctrl ctrlcommit FADE_DELAY;
		if (_showCargo) then {['TabSelectRight',[_display,IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG]] call XLA_fnc_arsenal;};

		//--- Right sidebar
		_showRight = _showItems || _showCargo;
		_fadeRight = [1,0] select _showRight;
		{
			_ctrl = _display displayctrl _x;
			_ctrl ctrlsetfade _fadeRight;
			_ctrl ctrlcommit FADE_DELAY;
		} foreach [
			IDC_RSCDISPLAYARSENAL_LINETABRIGHT,
			IDC_RSCDISPLAYARSENAL_FRAMERIGHT,
			IDC_RSCDISPLAYARSENAL_BACKGROUNDRIGHT
		];

		//--- Refresh weapon accessory lists
		//['SelectItem',[_display,_display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _index),_index]] call XLA_fnc_arsenal;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "TabSelectRight": {
		_display = _this select 0;
		_index = _this select 1;
		_ctrFrameRight = _display displayctrl IDC_RSCDISPLAYARSENAL_FRAMERIGHT;
		_ctrBackgroundRight = _display displayctrl IDC_RSCDISPLAYARSENAL_BACKGROUNDRIGHT;
		{
			_idc = _x;
			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _idc);
			_active = _idc == _index;

			_ctrlList ctrlenable _active;
			_ctrlList ctrlsetfade ([1,0] select _active);
			_ctrlList ctrlcommit FADE_DELAY;

			_ctrlTab = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _idc);
			_ctrlTab ctrlenable (!_active && ctrlfade _ctrlTab == 0);

			if (_active) then {
				_ctrlLineTabRight = _display displayctrl IDC_RSCDISPLAYARSENAL_LINETABRIGHT;
				_ctrlLineTabRight ctrlsetfade 0;
				_ctrlTabPos = ctrlposition _ctrlTab;
				_ctrlLineTabPosX = (ctrlposition _ctrlList select 0) + (ctrlposition _ctrlList select 2);
				_ctrlLineTabPosY = (_ctrlTabPos select 1);
				_ctrlLineTabRight ctrlsetposition [
					_ctrlLineTabPosX,
					_ctrlLineTabPosY,
					(_ctrlTabPos select 0) - _ctrlLineTabPosX + 0.01,
					ctrlposition _ctrlTab select 3
				];
				_ctrlLineTabRight ctrlcommit 0;
				ctrlsetfocus _ctrlList;

				_ctrlLoadCargo = _display displayctrl IDC_RSCDISPLAYARSENAL_LOADCARGO;
				_ctrlListPos = ctrlposition _ctrlList;
				_ctrlListPos set [3,(_ctrlListPos select 3) + (ctrlposition _ctrlLoadCargo select 3)];
				{
					_x ctrlsetposition _ctrlListPos;
					_x ctrlcommit 0;
				} foreach [_ctrFrameRight,_ctrBackgroundRight];

				if (_idc in [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT,IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC]) then {
					["SelectItemRight",[_display,_ctrlList,_index]] call XLA_fnc_arsenal;
				};
			};

			_ctrlIcon = _display displayctrl (IDC_RSCDISPLAYARSENAL_ICON + _idc);
			//_ctrlIcon ctrlenable false;
			_ctrlIcon ctrlshow _active;
			_ctrlIcon ctrlenable (!_active && ctrlfade _ctrlTab == 0);
		} foreach [IDCS_RIGHT];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "SelectItem": {
		private ["_ctrlList","_index","_cursel"];
		_display = _this select 0;
		_ctrlList = _this select 1;
		_index = _this select 2;
		_cursel = lbcursel _ctrlList;
		if (_cursel < 0) exitwith {};
		_item = if (ctrltype _ctrlList == 102) then {_ctrlList lnbdata [_cursel,0]} else {_ctrlList lbdata _cursel};
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);

		_ctrlListPrimaryWeapon = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON);
		_ctrlListSecondaryWeapon = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON);
		_ctrlListHandgun = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_HANDGUN);

		switch _index do {
			case IDC_RSCDISPLAYARSENAL_TAB_UNIFORM: {
				if (_item == "") then {
					removeuniform _center;
				} else {
					_items = uniformitems _center;
					_center forceadduniform _item;
					{_center additemtouniform _x} foreach _items;
				};

				//--- Refresh insignia (gets removed when uniform changes)
				['SelectItem',[_display,_display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA),IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA]] spawn XLA_fnc_arsenal;
			};
			case IDC_RSCDISPLAYARSENAL_TAB_VEST: {
				if (_item == "") then {
					removevest _center;
				} else {
					_items = vestitems _center;
					_center addvest _item;
					{_center additemtovest _x} foreach _items;
				};
			};
			case IDC_RSCDISPLAYARSENAL_TAB_BACKPACK: {
				_items = backpackitems _center;
				removebackpack _center;
				if !(_item == "") then {
					_center addbackpack _item;
					{_center additemtobackpack _x} foreach _items;
				};
			};
			case IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR: {
				if (_item == "") then {removeheadgear _center;} else {_center addheadgear _item;};
			};
			case IDC_RSCDISPLAYARSENAL_TAB_GOGGLES: {
				if (_item == "") then {removegoggles _center} else {_center addgoggles _item;};
			};
			case IDC_RSCDISPLAYARSENAL_TAB_NVGS;
			case IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS: {
				if (_item == "") then {
					_weapons = [];
					for "_l" from 0 to (lbsize _ctrlList) do {_weapons set [count _weapons,tolower (_ctrlList lbdata _l)];};
					{
						if (tolower _x in _weapons) then {_center removeweapon _x;};
					} foreach (assigneditems _center);
				} else {_center addweapon _item;};
			};
			case IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON: {
				_isDifferentWeapon = (primaryweapon _center call bis_fnc_baseWeapon) != _item;
				if (_isDifferentWeapon) then {
					{_center removemagazines _x} foreach getarray (configfile >> "cfgweapons" >> primaryweapon _center >> "magazines");
					if (_item == "") then {
						_center removeweapon primaryweapon _center;
					} else {
						_weaponAccessories = primaryweaponitems _center - [""];
						[_center,_item,4] call bis_fnc_addweapon;
						{_center addprimaryweaponitem _x;} foreach _weaponAccessories;
					};
				};
			};
			case IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON: {
				_isDifferentWeapon = (secondaryweapon _center call bis_fnc_baseWeapon) != _item;
				if (_isDifferentWeapon) then {
					{_center removemagazines _x} foreach getarray (configfile >> "cfgweapons" >> secondaryweapon _center >> "magazines");
					if (_item == "") then {
						_center removeweapon secondaryweapon _center;
					} else {
						_weaponAccessories = secondaryweaponitems _center - [""];
						[_center,_item,2] call bis_fnc_addweapon;
						{_center addsecondaryweaponitem _x;} foreach _weaponAccessories;
					};
				};
			};
			case IDC_RSCDISPLAYARSENAL_TAB_HANDGUN: {
				_isDifferentWeapon = (handgunweapon _center call bis_fnc_baseWeapon) != _item;
				if (_isDifferentWeapon) then {
					{_center removemagazines _x} foreach getarray (configfile >> "cfgweapons" >> handgunweapon _center >> "magazines");
					if (_item == "") then {
						_center removeweapon handgunweapon _center;
					} else {
						_weaponAccessories = handgunitems _center - [""];
						[_center,_item,4] call bis_fnc_addweapon;
						{_center addhandgunitem _x;} foreach _weaponAccessories;
					};
				};
			};
			case IDC_RSCDISPLAYARSENAL_TAB_MAP;
			case IDC_RSCDISPLAYARSENAL_TAB_GPS;
			case IDC_RSCDISPLAYARSENAL_TAB_RADIO;
			case IDC_RSCDISPLAYARSENAL_TAB_COMPASS;
			case IDC_RSCDISPLAYARSENAL_TAB_WATCH: {
				if (_item == "") then {
					_items = [];
					for "_l" from 0 to (lbsize _ctrlList) do {_items set [count _items,tolower (_ctrlList lbdata _l)];};
					{
						if (tolower _x in _items) then {_center unassignitem _x; _center removeitem _x;};
					} foreach (assigneditems _center);
				} else {
					_center linkitem _item;
				};
			};
			case IDC_RSCDISPLAYARSENAL_TAB_FACE: {
				_face = if (_item == "") then {"Default";} else {_item;};
				//_center setface _face;
				[[_center,_face],"bis_fnc_setidentity"] call bis_fnc_mp;
				_center setvariable ["BIS_fnc_arsenal_face",_face];
			};
			case IDC_RSCDISPLAYARSENAL_TAB_VOICE: {
				//_center setspeaker _item;
				[[_center,nil,_item],"bis_fnc_setidentity"] call bis_fnc_mp;
				if (ctrlenabled (_display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_VOICE))) then {
					_center directsay "CuratorObjectPlaced";
				};
			};
			case IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA: {
				[_center,_item] call bis_fnc_setUnitInsignia;
			};
			case IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC;
			case IDC_RSCDISPLAYARSENAL_TAB_ITEMACC;
			case IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE: {
				_accIndex = [IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC] find _index;
				switch true do {
					case (ctrlenabled _ctrlListPrimaryWeapon): {
						if (_item != "") then {
							_center addprimaryweaponitem _item;
						} else {
							_weaponAccessories = _center weaponaccessories primaryweapon _center;
							if (count _weaponAccessories > 0) then {_center removeprimaryweaponitem (_weaponAccessories select _accIndex);};
						};
					};
					case (ctrlenabled _ctrlListSecondaryWeapon): {
						if (_item != "") then {
							_center addsecondaryweaponitem _item;
						} else {
							//_weaponAccessories = _center weaponaccessories secondaryweapon _center;
							//if (count _weaponAccessories > 0) then {_center removesecondaryweaponitem (_weaponAccessories select _accIndex);};
						};
					};
					case (ctrlenabled _ctrlListHandgun): {
						if (_item != "") then {
							_center addhandgunitem _item;
						} else {
							_weaponAccessories = _center weaponaccessories handgunweapon _center;
							if (count _weaponAccessories > 0) then {_center removehandgunitem (_weaponAccessories select _accIndex);};
						};
					};
				};
			};
		};

		//--- Container Cargo
		if (
			_index in [IDC_RSCDISPLAYARSENAL_TAB_UNIFORM,IDC_RSCDISPLAYARSENAL_TAB_VEST,IDC_RSCDISPLAYARSENAL_TAB_BACKPACK]
			&&
			ctrlenabled (_display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _index))
		) then {
			_cargo = (missionnamespace getvariable ["BIS_fnc_arsenal_cargo",objnull]);
			GETVIRTUALCARGO

			private ["_ctrlList"];
			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG);
			lbclear _ctrlList;
			_itemsCurrent = [];
			_load = 0;
			switch _index do {
				case IDC_RSCDISPLAYARSENAL_TAB_UNIFORM: {
					_itemsCurrent = uniformitems _center;
					_load = if (uniform _center == "") then {1} else {loaduniform _center};
				};
				case IDC_RSCDISPLAYARSENAL_TAB_VEST: {
					_itemsCurrent = vestitems _center;
					_load = if (vest _center == "") then {1} else {loadvest _center};
				};
				case IDC_RSCDISPLAYARSENAL_TAB_BACKPACK: {
					_itemsCurrent = backpackitems _center;
					_load = if (backpack _center == "") then {1} else {loadbackpack _center};
				};
				default {[]};
			};

			_ctrlLoadCargo = _display displayctrl IDC_RSCDISPLAYARSENAL_LOADCARGO;
			_ctrlLoadCargo progresssetposition _load;

			//--- Weapon magazines (based on current weapons)
			_magazines = [];
			{
				_cfgWeapon = configfile >> "cfgweapons" >> _x;
				{
					_cfgMuzzle = if (_x == "this") then {_cfgWeapon} else {_cfgWeapon >> _x};
					{
						private ["_item"];
						_item = _x;
						if (CONDITION(_virtualMagazineCargo)) then {
							_mag = tolower _item;
							if !(_mag in _magazines) then {
								_magazines set [count _magazines,_mag];
								_value = {_x == _mag} count _itemsCurrent;
								_displayName = gettext (configfile >> "cfgmagazines" >> _mag >> "displayName");
								_displayNameArray = toarray _displayName;
								_tooltip = "";
								if (count _displayNameArray > 20) then {
									_displayNameArray resize 20;
									_displayNameArray = _displayNameArray + toarray "...";
									_tooltip = _displayName;
								};
								_lbAdd = _ctrlList lnbaddrow ["",tostring _displayNameArray,str _value];
								_ctrlList lnbsetdata [[_lbAdd,0],_mag];
								_ctrlList lnbsetvalue [[_lbAdd,0],getnumber (configfile >> "cfgmagazines" >> _mag >> "mass")];
								_ctrlList lnbsetpicture [[_lbAdd,0],gettext (configfile >> "cfgmagazines" >> _mag >> "picture")];
								_ctrlList lbsettooltip [_lbAdd,_tooltip];
							};
						};
					} foreach getarray (_cfgMuzzle >> "magazines");
				} foreach getarray (_cfgWeapon >> "muzzles");
			} foreach (weapons _center - ["Throw","Put"]);
			_ctrlList lbsetcursel (lbcursel _ctrlList max 0);

			_ctrlListActive = controlnull;
			if (ctrlenabled _ctrlList) then {_ctrlListActive = _ctrlList;};

			//--- Generic magazines (throw, put, ...)
			//_items = magazines _center + items _center;
			{
				_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _x);
				for "_l" from 0 to (lbsize _ctrlList - 1) do {
					_class = _ctrlList lnbdata [_l,0];
					_ctrlList lnbsettext [[_l,2],str ({_x == _class} count _itemsCurrent)];
				};
				_ctrlList lbsetcursel (lbcursel _ctrlList max 0);
				if (ctrlenabled _ctrlList) then {_ctrlListActive = _ctrlList;};
			} foreach [
				IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,
				IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT,
				IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC
			];

			//--- Show item availability
			if !(isnull _ctrlListActive) then {
				["SelectItemRight",[_display,_ctrlListActive,_index]] call XLA_fnc_arsenal;
			};
		};

		//--- Weapon attachments
		if (
			_index in [IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,IDC_RSCDISPLAYARSENAL_TAB_HANDGUN]
			&&
			ctrlenabled (_display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _index))
		) then {
			private ["_ctrlList"];

			_cargo = (missionnamespace getvariable ["BIS_fnc_arsenal_cargo",objnull]);
			GETVIRTUALCARGO

			{
				_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _x);
				lbclear _ctrlList;
				_ctrlList lbsetcursel -1;
			} foreach [IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC];

			//--- Attachments
			{
				_compatibleItems = [];
				if (isnil "asdg_jointrails_fnc_getCompatibleAttachments" ) then {
					_cfgCompatibleItems = _x >> "compatibleItems";
					if (isarray _cfgCompatibleItems) then {
						_compatibleItems = getarray _cfgCompatibleItems;
					} else {
						if (isclass _cfgCompatibleItems) then {
							for "_i" from 0 to (count _cfgCompatibleItems - 1) do {
								_entry = _cfgCompatibleItems select _i;
								if (getnumber _entry > 0) then {_compatibleItems set [count _compatibleItems,configname _entry];};
							};
						};
					};
				} else { 
					_compatibleItems = [_item] call asdg_jointrails_fnc_getCompatibleAttachments;
				};

				{
					private ["_item"];
					_item = _x;
					if (CONDITION(_virtualItemCargo)) then {
						_type = _item call bis_fnc_itemType;
						_idcList = switch (_type select 1) do {
							case "AccessoryMuzzle": {IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE};
							case "AccessoryPointer": {IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_ITEMACC};
							case "AccessorySights": {IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC};
							default {-1};
						};
						_ctrlList = _display displayctrl _idcList;
						_lbAdd = _ctrlList lbadd gettext (configfile >> "cfgweapons" >> _item >> "displayName");
						_ctrlList lbsetdata [_lbAdd,_item];
						_ctrlList lbsetpicture [_lbAdd,gettext (configfile >> "cfgweapons" >> _item >> "picture")];
					};
				} foreach _compatibleItems;
			} foreach ((configfile >> "cfgweapons" >> _item >> "WeaponSlotsInfo") call bis_fnc_returnchildren);

			//--- Magazines
			_weapon = switch true do {
				case (ctrlenabled _ctrlListPrimaryWeapon): {primaryweapon _center};
				case (ctrlenabled _ctrlListSecondaryWeapon): {secondaryweapon _center};
				case (ctrlenabled _ctrlListHandgun): {handgunweapon _center};
				default {""};
			};

			//--- Select current
			_weaponAccessories = _center weaponaccessories _weapon;
			{
				_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _x);
				_lbAdd = _ctrlList lbadd format ["<%1>",localize "str_empty"];
				lbsort _ctrlList;
				for "_l" from 0 to (lbsize _ctrlList - 1) do {
					_data = _ctrlList lbdata _l;
					if (_data != "" && {{_data == _x} count _weaponAccessories > 0}) exitwith {_ctrlList lbsetcursel _l;};
				};
				if (lbcursel _ctrlList < 0) then {_ctrlList lbsetcursel 0;};
			} foreach [IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC];
		};

		//--- Calculate load
		_ctrlLoad = _display displayctrl IDC_RSCDISPLAYARSENAL_LOAD;
		_ctrlLoad progresssetposition load _center;


		if (ctrlenabled _ctrlList) then {
			_itemCfg = switch _index do {
				case IDC_RSCDISPLAYARSENAL_TAB_BACKPACK:	{configfile >> "cfgvehicles" >> _item};
				case IDC_RSCDISPLAYARSENAL_TAB_GOGGLES:		{configfile >> "cfgglasses" >> _item};
				case IDC_RSCDISPLAYARSENAL_TAB_FACE:		{((configfile >> "cfgfaces") select (_ctrlList lbvalue _cursel)) >> _item};
				case IDC_RSCDISPLAYARSENAL_TAB_VOICE:		{configfile >> "cfgvoice" >> _item};
				case IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA:	{configfile >> "cfgunitinsignia" >> _item};
				case IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG;
				case IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW;
				case IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT;
				case IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC:	{configfile >> "cfgmagazines" >> _item};
				default						{configfile >> "cfgweapons" >> _item};
			};

			["ShowItemInfo",[_itemCfg]] call XLA_fnc_arsenal;
			["ShowItemStats",[_itemCfg]] call XLA_fnc_arsenal;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "SelectItemRight": {
		_display = _this select 0;
		_ctrlList = _this select 1;
		_index = _this select 2;
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);

		//--- Get container
		_indexLeft = -1;
		{
			_ctrlListLeft = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _foreachindex);
			if (ctrlenabled _ctrlListLeft) exitwith {_indexLeft = _foreachindex;};
		} foreach [IDCS_LEFT];

		_supply = switch _indexLeft do {
			case IDC_RSCDISPLAYARSENAL_TAB_UNIFORM: {
				gettext (configfile >> "CfgWeapons" >> uniform _center >> "ItemInfo" >> "containerClass")
			};
			case IDC_RSCDISPLAYARSENAL_TAB_VEST: {
				gettext (configfile >> "CfgWeapons" >> vest _center >> "ItemInfo" >> "containerClass")
			};
			case IDC_RSCDISPLAYARSENAL_TAB_BACKPACK: {
				backpack _center
			};
			default {0};
		};
		_maximumLoad = getnumber (configfile >> "CfgVehicles" >> _supply >> "maximumLoad");

		_ctrlLoadCargo = _display displayctrl IDC_RSCDISPLAYARSENAL_LOADCARGO;
		_load = _maximumLoad * (1 - progressposition _ctrlLoadCargo);

		//-- Disable too heavy items
		_rows = lnbsize _ctrlList select 0;
		_columns = lnbsize _ctrlList select 1;
		for "_r" from 0 to (_rows - 1) do {
			_mass = _ctrlList lbvalue (_r * _columns);
			_alpha = [1.0,0.25] select (_mass > _load);
			_ctrlList lnbsetcolor [[_r,1],[1,1,1,_alpha]];
			_ctrlList lnbsetcolor [[_r,2],[1,1,1,_alpha]];
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "ShowItemInfo": {
		_itemCfg = _this select 0;
		if (isclass _itemCfg) then {
			_itemName = if (ctrltype _ctrlList == 102) then {_ctrlList lnbtext [_cursel,1]} else {_ctrlList lbtext _cursel};

			_ctrlInfo = _display displayctrl IDC_RSCDISPLAYARSENAL_INFO_INFO;
			_ctrlInfo ctrlsetfade 0;
			_ctrlInfo ctrlcommit FADE_DELAY;

			_ctrlInfoName = _display displayctrl IDC_RSCDISPLAYARSENAL_INFO_INFONAME;
			_ctrlInfoName ctrlsettext _itemName;

			_ctrlInfoAuthor = _display displayctrl IDC_RSCDISPLAYARSENAL_INFO_INFOAUTHOR;
			_ctrlInfoAuthor ctrlsettext "";
			[_itemCfg,_ctrlInfoAuthor] call bis_fnc_overviewauthor;

			//--- DLC / mod icon
			_ctrlDLC = _display displayctrl IDC_RSCDISPLAYARSENAL_INFO_DLCICON;
			_ctrlDLCBackground = _display displayctrl IDC_RSCDISPLAYARSENAL_INFO_DLCBACKGROUND;
			_dlc = gettext (_itemCfg >> "dlc");
			if (_dlc != "" && _fullVersion) then {

				_cfgDLC = configfile >> "cfgMods" >> _dlc;
				_logo = gettext (_cfgDLC >> "logo");
				_logoOver = gettext (_cfgDLC >> "logoOver");
				_fieldManualTopicAndHint = getarray (_cfgDLC >> "fieldManualTopicAndHint");
				_dlcColor = getarray (_cfgDLC >> "dlcColor");
				_name = gettext (_cfgDLC >> "name");

				_ctrlDLC ctrlsettooltip _name;
				_ctrlDLC ctrlsettext _logo;
				_ctrlDLC ctrlsetfade 0;
				_ctrlDLC ctrlseteventhandler ["mouseexit",format ["(_this select 0) ctrlsettext '%1';",_logo]];
				_ctrlDLC ctrlseteventhandler ["mouseenter",format ["(_this select 0) ctrlsettext '%1';",_logoOver]];
				_ctrlDLC ctrlseteventhandler ["buttonclick",format ["(%1 + [ctrlparent (_this select 0)]) call bis_fnc_openFieldManual;",_fieldManualTopicAndHint]];
				_ctrlDLCBackground ctrlsetfade 0;
			} else {
				_ctrlDLC ctrlsetfade 1;
				_ctrlDLCBackground ctrlsetfade 1;
			};
			_ctrlDLC ctrlcommit FADE_DELAY;
			_ctrlDLCBackground ctrlcommit FADE_DELAY;

			//--- Library
/*
			_libraryText = gettext (_itemCfg >> "Library" >> "libTextDesc");
			_ctrlStatsText = _display displayctrl IDC_RSCDISPLAYARSENAL_WEAPON_WEAPONTEXT;
			if (_libraryText != "") then {
				_ctrlStatsText ctrlsetstructuredtext parsetext format ["<t size='0.8'>%1</t>",_libraryText];
				_ctrlStatsText call bis_fnc_ctrlfittotextheight;
				_ctrlStatsText ctrlsetfade 0;
			} else {
				_ctrlStatsText ctrlsetfade 1;
			};
			_ctrlStatsText ctrlcommit FADE_DELAY;
*/
		} else {
			_ctrlInfo = _display displayctrl IDC_RSCDISPLAYARSENAL_INFO_INFO;
			_ctrlInfo ctrlsetfade 1;
			_ctrlInfo ctrlcommit FADE_DELAY;

			_ctrlStats = _display displayctrl IDC_RSCDISPLAYARSENAL_STATS_STATS;
			_ctrlStats ctrlsetfade 1;
			_ctrlStats ctrlcommit FADE_DELAY;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "ShowItemStats": {
		_itemCfg = _this select 0;
		if (isclass _itemCfg) then {
			_ctrlStats = _display displayctrl IDC_RSCDISPLAYARSENAL_STATS_STATS;
			_ctrlStatsPos = ctrlposition _ctrlStats;
			_ctrlStatsPos set [0,0];
			_ctrlStatsPos set [1,0];
			_ctrlBackground = _display displayctrl IDC_RSCDISPLAYARSENAL_STATS_STATSBACKGROUND;
			_barMin = 0.01;
			_barMax = 1;

			_statControls = [
				[IDC_RSCDISPLAYARSENAL_STATS_STAT1,IDC_RSCDISPLAYARSENAL_STATS_STATTEXT1],
				[IDC_RSCDISPLAYARSENAL_STATS_STAT2,IDC_RSCDISPLAYARSENAL_STATS_STATTEXT2],
				[IDC_RSCDISPLAYARSENAL_STATS_STAT3,IDC_RSCDISPLAYARSENAL_STATS_STATTEXT3],
				[IDC_RSCDISPLAYARSENAL_STATS_STAT4,IDC_RSCDISPLAYARSENAL_STATS_STATTEXT4]
			];
			_fnc_showStats = {
				_h = 0.2;
				{
					_ctrlStat  = _display displayctrl ((_statControls select _foreachindex) select 0);
					_ctrlText  = _display displayctrl ((_statControls select _foreachindex) select 1);				
					//_ctrlValue = _display displayctrl ((_statControls select _foreachindex) select 2);

					if (count _x > 0) then {
						_ctrlStat progresssetposition (_x select 0);
						_ctrlText ctrlsettext ((toupper (_x select 1)) + ": " + (str (_x select 2)) + (_x select 3));
						_ctrlText ctrlshow true;
						_h = _h + 0.2;
					} else {
						_ctrlStat progresssetposition 0;
						_ctrlText ctrlshow false;
					};
				} foreach _this;

				_ctrlStatsPos set [1,(_ctrlStatsPos select 3) * (1 - _h)];
				_ctrlStatsPos set [3,(_ctrlStatsPos select 3) * _h];
				_ctrlBackground ctrlsetposition _ctrlStatsPos;
				_ctrlBackground ctrlcommit 0;
			};

			switch _index do {
				case IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON;
				case IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON;
				case IDC_RSCDISPLAYARSENAL_TAB_HANDGUN: {
					_ctrlStats ctrlsetfade 0;
					_statsExtremes = uinamespace getvariable "bis_fnc_arsenal_weaponStats";
					if !(isnil "_statsExtremes") then {
						_statsMin = _statsExtremes select 0;
						_statsMax = _statsExtremes select 1;

						_stats = [
							[_itemCfg],
							STATS_WEAPONS,
							_statsMin
						] call bis_fnc_configExtremes;
						_stats = _stats select 1;

						//Let's go and grab the actual values
						// Since STATS_WEAPONS asks for logarithmic values for everything except mass
						// We are going to ask the system again, but this time for all normal numbers
						_statsNormal  = [
							[_itemCfg],
							STATS_WEAPONS_NORMAL,
							_statsMin
						] call bis_fnc_configExtremes;
						_statsNormal = _statsNormal select 1;

						// Assign the values we just read out
						_valueReloadSpeed = _statsNormal select 0;
						//Instead of displaying "reload speed" (seconds between shots), we actually want "rate of fire" in rounds per minute
						// We round the value of RPM  since nobody cares about if his gun has 708 or 710 RPM. 
						_valueRPM = 0;
						if (_valueReloadSpeed != 0 ) then { _valueRPM =10*round(6*(1/_valueReloadSpeed)); };
						_valueMaxRange = _statsNormal select 1;
						_valueHit = _statsNormal select 2;
						_valueMass = _statsNormal select 3;
						MASSCONVERT(_valueMass) //convert Mass to real units

						_statReloadSpeed = linearConversion [_statsMin select 0,_statsMax select 0,_stats select 0,_barMax,_barMin];
						_statMaxRange = linearConversion [_statsMin select 1,_statsMax select 1,_stats select 1,_barMin,_barMax];
						_statHit = linearConversion [_statsMin select 2,_statsMax select 2,_stats select 2,_barMin,_barMax];
						_statMass = linearConversion [_statsMin select 3,_statsMax select 3,_stats select 3,_barMin,_barMax];
						if (getnumber (_itemCfg >> "type") == 4 && _statReloadSpeed == 1) then {_statReloadSpeed = _barMin;};

						[
							// We can't add the values as 5th/6th/.. etc parameters, since _fnc_showStats uses _foreachindex
							// So, instead, we had them add the end of the respective array. (Better style,too!)
							// We also need to access the units (kg, seconnds, etc) iteratively, so we add them, too
							[_statReloadSpeed,localize "str_a3_rscdisplayarsenal_stat_rof",_valueRPM,"RPM"],
							[_statMaxRange,localize "str_a3_rscdisplayarsenal_stat_range",_valueMaxRange,"m"],
							[_statHit,localize "str_a3_rscdisplayarsenal_stat_impact",_valueHit,""], //Hit's unit is magical engine hitpoints
							[_statMass,localize "str_a3_rscdisplayarsenal_stat_weight",_valueMass,_massunit]
						] call _fnc_showStats;
					};
				};
				case IDC_RSCDISPLAYARSENAL_TAB_UNIFORM;
				case IDC_RSCDISPLAYARSENAL_TAB_VEST;
				case IDC_RSCDISPLAYARSENAL_TAB_BACKPACK;
				case IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR: {
					_ctrlStats ctrlsetfade 0;
					_statsExtremes = uinamespace getvariable "bis_fnc_arsenal_equipmentStats";
					if !(isnil "_statsExtremes") then {
						_statsMin = _statsExtremes select 0;
						_statsMax = _statsExtremes select 1;

						_stats = [
							[_itemCfg],
							STATS_EQUIPMENT,
							_statsMin
						] call bis_fnc_configExtremes;
						_stats = _stats select 0;

						//Let's go and grab the actual values
						// Since STATS_EQUIPMENT asks for logarithmic value for Armor
						// We are going to ask the system again, but this time for all normal numbers

						_statsNormal = [
							[_itemCfg],
							STATS_EQUIPMENT_NORMAL,
							_statsMin
						] call bis_fnc_configExtremes;
						_statsNormal = _statsNormal select 0;

						_valueArmor = _statsNormal select 0;
						_valueMaximumLoad = _statsNormal select 1;
						MASSCONVERT(_valueMaximumLoad);
						_valueMass = _statsNormal select 2;
						MASSCONVERT(_valueMass) //convert Mass to real units

						_statArmor = linearConversion [_statsMin select 0,_statsMax select 0,_stats select 0,_barMin,_barMax];
						_statMaximumLoad = linearConversion [_statsMin select 1,_statsMax select 1,_stats select 1,_barMin,_barMax];
						_statMass = linearConversion [_statsMin select 2,_statsMax select 2,_stats select 2,_barMin,_barMax];

						if (getnumber (_itemCfg >> "isbackpack") == 1) then {_statArmor = _barMin;}; //--- Force no backpack armor

						[
							if (_item == "H_Beret_blk") then {[0.95,localize "STR_difficulty3"]} else {[]}, //--- Easter egg
							// We can't add the values as 5th/6th/.. etc parameters, since _fnc_showStats uses _foreachindex
							// So, instead, we had them add the end of the respective array. (Better style,too!)
							// We also need to access the units (kg, seconnds, etc) iteratively, so we add them, too
							[_statArmor,localize "str_a3_rscdisplayarsenal_stat_armor",_valueArmor,""], //armor has no real unit
							[_statMaximumLoad,localize "str_a3_rscdisplayarsenal_stat_load",_valueMaximumLoad,_massunit],
							[_statMass,localize "str_a3_rscdisplayarsenal_stat_weight",_valueMass,_massunit]
						] call _fnc_showStats;
					};
				};
				default {
					_ctrlStats ctrlsetfade 1;
				};
			};
			_ctrlStats ctrlcommit FADE_DELAY;
		} else {
			_ctrlStats = _display displayctrl IDC_RSCDISPLAYARSENAL_STATS_STATS;
			_ctrlStats ctrlsetfade 1;
			_ctrlStats ctrlcommit FADE_DELAY;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "ShowItem": {
		_display = _this select 0;
		_ctrlList = _this select 1;
		_index = _this select 2;
		_cursel = lbcursel _ctrlList;
		if (_cursel < 0) exitwith {};
		_item = _ctrlList lbdata _cursel;
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);

		_action = "";
		switch _index do {

			case IDC_RSCDISPLAYARSENAL_TAB_UNIFORM;
			case IDC_RSCDISPLAYARSENAL_TAB_VEST;
			case IDC_RSCDISPLAYARSENAL_TAB_BACKPACK;
			case IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR;
			case IDC_RSCDISPLAYARSENAL_TAB_GOGGLES;
			case IDC_RSCDISPLAYARSENAL_TAB_NVGS: {
				_action = "Stand";
			};
			case IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS: {
				_action = if (_item == "") then {"Civil"} else {"Binoculars"};
			};
			case IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON: {
				_center selectweapon primaryweapon _center;
				_action = if (_item == "") then {"Civil"} else {"PrimaryWeapon"};
			};
			case IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON: {
				_center selectweapon secondaryweapon _center;
				_action = if (_item == "") then {"Civil"} else {"SecondaryWeapon"};
			};
			case IDC_RSCDISPLAYARSENAL_TAB_HANDGUN: {
				_center selectweapon handgunweapon _center;
				_action = if (_item == "") then {"Civil"} else {"HandGunOn"};
			};
			case IDC_RSCDISPLAYARSENAL_TAB_MAP;
			case IDC_RSCDISPLAYARSENAL_TAB_GPS;
			case IDC_RSCDISPLAYARSENAL_TAB_RADIO;
			case IDC_RSCDISPLAYARSENAL_TAB_COMPASS;
			case IDC_RSCDISPLAYARSENAL_TAB_WATCH;
			case IDC_RSCDISPLAYARSENAL_TAB_FACE;
			case IDC_RSCDISPLAYARSENAL_TAB_VOICE;
			case IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC;
			case IDC_RSCDISPLAYARSENAL_TAB_ITEMACC;
			case IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE: {
			};
			case IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA: {
				_action = "Salute";
			};
		};

		if (_action != "" && _action != BIS_fnc_arsenal_action) then {
			_center playactionnow _action;
			BIS_fnc_arsenal_action = _action;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "KeyDown": {
		_display = _this select 0;
		_key = _this select 1;
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt = _this select 4;
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);
		_return = false;

		switch true do {
			case (_key == DIK_ESCAPE): {
				_ctrlTemplate = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE;
				if (ctrlfade _ctrlTemplate == 0) then {
					_ctrlTemplate ctrlsetfade 1;
					_ctrlTemplate ctrlcommit 0;
					_ctrlTemplate ctrlenable false;

					_ctrlMouseBlock = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEBLOCK;
					_ctrlMouseBlock ctrlenable false;
				} else {
					if (_fullVersion) then {["buttonClose",[_display]] spawn XLA_fnc_arsenal;} else {_display closedisplay 2;};
				};
				_return = true;
			};

			//--- Enter
			case (_key in [DIK_RETURN,DIK_NUMPADENTER]): {
				_ctrlTemplate = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE;
				if (ctrlfade _ctrlTemplate == 0) then {
					["buttonTemplateOK",[_display]] spawn XLA_fnc_arsenal;
					_return = true;
				};
			};

			//--- Prevent opening the commanding menu
			case (_key == DIK_1);
			case (_key == DIK_2);
			case (_key == DIK_3);
			case (_key == DIK_4);
			case (_key == DIK_5);
			case (_key == DIK_1);
			case (_key == DIK_7);
			case (_key == DIK_8);
			case (_key == DIK_9);
			case (_key == DIK_0): {
				_return = true;
			};

			//--- Tab to browse tabs
			case (_key == DIK_TAB): {
				_idc = -1;
				{
					_ctrlTab = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _x);
					if !(ctrlenabled _ctrlTab) exitwith {_idc = _x;};
				} foreach [IDCS_LEFT];
				_idcCount = count [IDCS_LEFT];
				_idc = if (_ctrl) then {(_idc - 1 + _idcCount) % _idcCount} else {(_idc + 1) % _idcCount};
				["TabSelectLeft",[_display,_idc]] call XLA_fnc_arsenal;
				_return = true;
			};

			//--- Export to script
			case (_key == DIK_C): {
				_mode = if (_shift) then {"config"} else {"init"};
				if (_ctrl) then {['buttonExport',[_display,_mode]] call XLA_fnc_arsenal;};
			};
			//--- Export from script
			case (_key == DIK_V): {
				if (_ctrl) then {['buttonImport',[_display]] call XLA_fnc_arsenal;};
			};
			//--- Save
			case (_key == DIK_S): {
				if (_ctrl) then {['buttonSave',[_display]] call XLA_fnc_arsenal;};
			};
			//--- Open
			case (_key == DIK_O): {
				if (_ctrl) then {['buttonLoad',[_display]] call XLA_fnc_arsenal;};
			};
			//--- Randomize
			case (_key == DIK_R): {
				if (_ctrl) then {
					if (BIS_fnc_arsenal_type == 0) then {
						if (_shift) then {
							_soldiers = [];
							{
								_soldiers set [count _soldiers,configname _x];
							} foreach ("isclass _x && getnumber (_x >> 'scope') > 1 && gettext (_x >> 'simulation') == 'soldier'" configclasses (configfile >> "cfgvehicles"));
							[_center,_soldiers call bis_fnc_selectrandom] call bis_fnc_loadinventory;
							["ListSelectCurrent",[_display]] call XLA_fnc_arsenal;
						}else {
							['buttonRandom',[_display]] call XLA_fnc_arsenal;
						};
					} else {
						['buttonRandom',[_display]] call bis_fnc_garage;
					};
				};
			};
			//--- Toggle interface
			case (_key == DIK_BACKSPACE): {
				_ctrlMouseBlock = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEBLOCK;
				if !(ctrlenabled _ctrlMouseBlock) then {
					['buttonInterface',[_display]] call XLA_fnc_arsenal;
					_return = true;
				};
			};

			//--- Acctime
			case (_key in (actionkeys "timeInc")): {
				if (acctime == 0) then {setacctime 1;};
				_return = true;
			};
			case (_key in (actionkeys "timeDec")): {
				if (acctime != 0) then {setacctime 0;};
				_return = true;

			};
/*
			//--- Delete template
			case (_key == DIK_DELETE): {
				_ctrlMouseBlock = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEBLOCK;
				if !(ctrlenabled _ctrlMouseBlock) then {
					['buttonTemplateDelete',[_display]] call XLA_fnc_arsenal;
					_return = true;
				};
			};
*/
		};
		_return
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "buttonCargo": {
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);
		_display = _this select 0;
		_add = _this select 1;

		_selected = -1;
		{
			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _x);
			if (ctrlenabled _ctrlList) exitwith {_selected = _x;};
		} foreach [IDCS_LEFT];

		_ctrlList = ctrlnull;
		_lbcursel = -1;
		{
			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _x);
			if (ctrlenabled _ctrlList) exitwith {_lbcursel = lbcursel _ctrlList;};
		} foreach [IDCS_RIGHT];
		_item = _ctrlList lnbdata [_lbcursel,0];
		_load = 0;
		_items = [];
		switch _selected do {
			case IDC_RSCDISPLAYARSENAL_TAB_UNIFORM: {
				if (_add > 0) then {_center additemtouniform _item;} else {_center removeitemfromuniform _item;};
				_load = loaduniform _center;
				_items = uniformitems _center;
			};
			case IDC_RSCDISPLAYARSENAL_TAB_VEST: {
				if (_add > 0) then {_center additemtovest _item;} else {_center removeitemfromvest _item;};
				_load = loadvest _center;
				_items = vestitems _center;
			};
			case IDC_RSCDISPLAYARSENAL_TAB_BACKPACK: {
				if (_add > 0) then {_center additemtobackpack _item;} else {_center removeitemfrombackpack _item;};
				_load = loadbackpack _center;
				_items = backpackitems _center;
			};
		};

		_ctrlLoadCargo = _display displayctrl IDC_RSCDISPLAYARSENAL_LOADCARGO;
		//TODO: Add a "actual kg loaded/max kg capacity" text to the bar.
		// However, since no text rsc exists by default, this would require some UI data changes
		_ctrlLoadCargo progresssetposition _load;

		_value = {_x == _item} count _items;
		//_ctrlList lnbsetvalue [[_lbcursel,0],_value];
		_ctrlList lnbsettext [[_lbcursel,2],str _value];

		["SelectItemRight",[_display,_ctrlList,_index]] call XLA_fnc_arsenal;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "buttonTemplateOK": {
		_display = _this select 0;
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);
		_hideTemplate = true;

		_ctrlTemplateName = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_EDITNAME;
		if (ctrlenabled _ctrlTemplateName) then {
			//--- Save
			[
				_center,
				[profilenamespace,ctrltext _ctrlTemplateName],
				[
					_center getvariable ["BIS_fnc_arsenal_face",face _center],
					speaker _center,
					_center call bis_fnc_getUnitInsignia
				]
			] call bis_fnc_saveInventory;
		} else {
			//--- Load
			_ctrlTemplateValue = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
			if ((_ctrlTemplateValue lbvalue lnbcurselrow _ctrlTemplateValue) == 0) then {
				_inventory = _ctrlTemplateValue lnbtext [lnbcurselrow _ctrlTemplateValue,0];
				// Since we've started allowing load-outs with non-whitelisted items,
				// we need to make sure that we only load those items that are allowed
				[_center,[profilenamespace,_inventory]] call XLA_fnc_loadPartialInventory;

				//--- Load custom data
				_ctrlTemplateValue = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
				_data = profilenamespace getvariable ["bis_fnc_saveInventory_data",[]];	
				_name = _ctrlTemplateValue lnbtext [lnbcurselrow _ctrlTemplateValue,0];
				_nameID = _data find _name;
				if (_nameID >= 0) then {
					_inventory = _data select (_nameID + 1);
					_inventoryCustom = _inventory select 10;
					_center setface (_inventoryCustom select 0);
					_center setvariable ["BIS_fnc_arsenal_face",(_inventoryCustom select 0)];
					_center setspeaker (_inventoryCustom select 1);
					[_center,_inventoryCustom select 2] call bis_fnc_setUnitInsignia;
				};

				["ListSelectCurrent",[_display]] call XLA_fnc_arsenal;
			} else {
				_hideTemplate = false;
			};
		};
		if (_hideTemplate) then {
			_ctrlTemplate = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE;
			_ctrlTemplate ctrlsetfade 1;
			_ctrlTemplate ctrlcommit 0;
			_ctrlTemplate ctrlenable false;

			_ctrlMouseBlock = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEBLOCK;
			_ctrlMouseBlock ctrlenable false;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "buttonTemplateCancel": {
		_display = _this select 0;

		_ctrlTemplate = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE;
		_ctrlTemplate ctrlsetfade 1;
		_ctrlTemplate ctrlcommit 0;
		_ctrlTemplate ctrlenable false;

		_ctrlMouseBlock = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEBLOCK;
		_ctrlMouseBlock ctrlenable false;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "buttonTemplateDelete": {
		_display = _this select 0;
		_ctrlTemplateValue = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
		_cursel = lnbcurselrow _ctrlTemplateValue;
		_inventory = _ctrlTemplateValue lnbtext [_cursel,0];
		[_center,[profilenamespace,_inventory],nil,true] call bis_fnc_saveinventory;
		['showTemplates',[_display]] call XLA_fnc_arsenal;
		_ctrlTemplateValue lnbsetcurselrow (_cursel max (lbsize _ctrlTemplateValue - 1));

		_enableButtons = (lnbsize _ctrlTemplateValue select 0) > 0;
		_ctrlTemplateButtonOK = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONOK;
		_ctrlTemplateButtonOK ctrlenable _enableButtons;
		_ctrlTemplateButtonDelete = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONDELETE;
		_ctrlTemplateButtonDelete ctrlenable _enableButtons;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "templateSelChanged": {
		_display = _this select 0;

		_ctrlTemplateValue = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
		_ctrlTemplateName = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_EDITNAME;
		_ctrlTemplateName ctrlsettext (_ctrlTemplateValue lnbtext [lnbcurselrow _ctrlTemplateValue,0]);

		_ctrlTemplateButtonOK = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONOK;
		_ctrlTemplateButtonOK ctrlenable ((_ctrlTemplateValue lbvalue lnbcurselrow _ctrlTemplateValue) == 0);
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "showTemplates": {
		_display = _this select 0;
		_ctrlList = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
		lnbclear _ctrlList;
		_data = profilenamespace getvariable ["bis_fnc_saveInventory_data",[]];
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);
		_cargo = (missionnamespace getvariable ["BIS_fnc_arsenal_cargo",objnull]);

		GETVIRTUALCARGO

		for "_i" from 0 to (count _data - 1) step 2 do {
			_name = _data select _i;
			_inventory = _data select (_i + 1);

			_inventoryWeapons = [
				(_inventory select 5), //--- Binocular
				(_inventory select 6 select 0), //--- Primary weapon
				(_inventory select 7 select 0), //--- Secondary weapon
				(_inventory select 8 select 0) //--- Handgun
			] - [""];
			_inventoryMagazines = (
				(_inventory select 0 select 1) + //--- Uniform
				(_inventory select 1 select 1) + //--- Vest
				(_inventory select 2 select 1) //--- Backpack items
			) - [""];
			_inventoryItems = (
				[_inventory select 0 select 0] + (_inventory select 0 select 1) + //--- Uniform
				[_inventory select 1 select 0] + (_inventory select 1 select 1) + //--- Vest
				(_inventory select 2 select 1) + //--- Backpack items
				[_inventory select 3] + //--- Headgear
				[_inventory select 4] + //--- Goggles
				(_inventory select 6 select 1) + //--- Primary weapon items
				(_inventory select 7 select 1) + //--- Secondary weapon items
				(_inventory select 8 select 1) + //--- Handgun items
				(_inventory select 9) //--- Assigned items
			) - [""];
			_inventoryBackpacks = [_inventory select 2 select 0] - [""];


			_lbAdd = _ctrlList lnbaddrow [_name];
			_ctrlList lnbsetpicture [[_lbAdd,1],gettext (configfile >> "cfgweapons" >> (_inventory select 6 select 0) >> "picture")];
			_ctrlList lnbsetpicture [[_lbAdd,2],gettext (configfile >> "cfgweapons" >> (_inventory select 7 select 0) >> "picture")];
			_ctrlList lnbsetpicture [[_lbAdd,3],gettext (configfile >> "cfgweapons" >> (_inventory select 8 select 0) >> "picture")];
			_ctrlList lnbsetpicture [[_lbAdd,4],gettext (configfile >> "cfgweapons" >> (_inventory select 0 select 0) >> "picture")];
			_ctrlList lnbsetpicture [[_lbAdd,5],gettext (configfile >> "cfgweapons" >> (_inventory select 1 select 0) >> "picture")];
			_ctrlList lnbsetpicture [[_lbAdd,6],gettext (configfile >> "cfgvehicles" >> (_inventory select 2 select 0) >> "picture")];
			_ctrlList lnbsetpicture [[_lbAdd,7],gettext (configfile >> "cfgweapons" >> (_inventory select 3) >> "picture")];
			_ctrlList lnbsetpicture [[_lbAdd,8],gettext (configfile >> "cfgglasses" >> (_inventory select 4) >> "picture")];

			// If any of these conditions match, the saved outfit is only partially loadable.
			// The item is still selectable but will be shown in a different color
			// yellow = non whitelisted item 
			// orange = non existing class (i.e. wrong classname or mod not loaded)
			// N.B: orange will take precedence over yellow if both are valid
			//  blue = non existing class (but whitelisted) - indicates typo/error in whitelist!
			_whitelisted = true;
			_isclass = true;
			if (
				{_item = _x; !CONDITION(_virtualWeaponCargo)} count _inventoryWeapons > 0
				||
				{_item = _x; !CONDITION(_virtualItemCargo + _virtualMagazineCargo)} count _inventoryMagazines > 0
				||
				{_item = _x; !CONDITION(_virtualItemCargo + _virtualMagazineCargo)} count _inventoryItems > 0
				||
				{_item = _x; !CONDITION(_virtualBackpackCargo)} count _inventoryBackpacks > 0
			) then {
				//("Item " + (format["%1",_item])  + " is not whitelisted.") call bis_fnc_log;
				//"NOT WHITELISTED" call bis_fnc_log;
				_whitelisted = false;		
			};

			if (
			{_item = _x; !isclass(configfile >> "cfgweapons" >> _item)} count _inventoryWeapons > 0
			||
			{_item = _x; {isclass(configfile >> _x >> _item)} count ["cfgweapons","cfgglasses","cfgmagazines"] == 0} count _inventoryMagazines > 0
			||
			{_item = _x; {isclass(configfile >> _x >> _item)} count ["cfgweapons","cfgglasses","cfgmagazines"] == 0} count _inventoryItems > 0
			||
			{_item = _x; !isclass(configfile >> "cfgvehicles" >> _item)} count _inventoryBackpacks > 0
			) then {
				//("Item " +  (format["%1",_item]) + " is not a class.") call bis_fnc_log;
				//"NOT A CLASS" call bis_fnc_log;
				_isclass = false;
			};

			if (!_whitelisted) then {
				// yelllow
				//"Marking as yellow" call bis_fnc_log;
				_ctrlList lnbsetcolor [[_lbAdd,0],[1,1,0,0.75]];
			};

			if (!_isclass) then {
			 	// orange
			 	//"Marking as orange" call bis_fnc_log;
			 	_ctrlList lnbsetcolor [[_lbAdd,0],[1,0.5,0,0.75]];
			};
			
			if (_whitelisted&&!_isclass) then {
				// blue
				//"Marking as blue" call bis_fnc_log;
			 	_ctrlList lnbsetcolor [[_lbAdd,0],[0,0,1,0.75]];
			};

			
		};

		//['buttonExport',[_display]] call XLA_fnc_arsenal;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "buttonImport": {
		startloadingscreen [""];
		_display = _this select 0;
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);
		_cargo = (missionnamespace getvariable ["BIS_fnc_arsenal_cargo",objnull]);

		GETVIRTUALCARGO

		_disabledItems = [];

		_import = copyfromclipboard;
		_importArray = [_import," 	;='""" + tostring [13,10]] call bis_fnc_splitString;

		if (count _importArray == 1) then {
			//--- Import vehicle class
			_class = _importArray select 0;
			if (isclass (configfile >> "cfgvehicles" >> _class)) then {[_center,_class] call bis_fnc_loadinventory;};
		} else {
			//--- Import specific items
			_importArray = _importArray + [""];
			_to = 1;
			{
				_item = _importArray select _foreachindex + 1;
				switch tolower _x do {
					case "to": {_to = parsenumber _item;};

					case "removeallweapons": {removeallweapons _center;};
					case "removeallitems": {removeallitems _center;};
					case "removeallassignedItems": {removeallassignedItems _center;};
					case "removeuniform": {removeuniform _center;};
					case "removevest": {removevest _center;};
					case "removebackpack": {removebackpack _center;};
					case "removeheadgear": {removeheadgear _center;};
					case "removegoggles": {removegoggles _center;};
					case "forceadduniform";
					case "adduniform": {
						if (CONDITION(_virtualItemCargo)) then {_center forceadduniform _item;} else {ERROR};
					};
					case "addvest": {
						if (CONDITION(_virtualItemCargo)) then {_center addvest _item;} else {ERROR};
					};
					case "addbackpack": {
						if (CONDITION(_virtualBackpackCargo)) then {_center addbackpack _item;} else {ERROR};
					};
					case "addheadgear": {
						if (CONDITION(_virtualItemCargo)) then {_center addheadgear _item;} else {ERROR};
					};
					case "addgoggles": {
						if (CONDITION(_virtualItemCargo)) then {_center addgoggles _item;} else {ERROR};
					};

					case "additemtouniform": {
						if (CONDITION(_virtualItemCargo + _virtualMagazineCargo)) then {
							for "_n" from 1 to _to do {_center additemtouniform _item;};
						} else {ERROR};
						_to = 1;
					};
					case "additemtovest": {
						if (CONDITION(_virtualItemCargo + _virtualMagazineCargo)) then {
							for "_n" from 1 to _to do {_center additemtovest _item;};
						} else {ERROR};
						_to = 1;
					};
					case "additemtobackpack": {
						if (CONDITION(_virtualItemCargo + _virtualMagazineCargo)) then {
							for "_n" from 1 to _to do {_center additemtobackpack _item;};
						} else {ERROR};
						_to = 1;
					};

					case "addweapon": {
						if (CONDITION(_virtualWeaponCargo)) then {_center addweapon _item;} else {ERROR};
					};
					case "addprimaryweaponitem": {
						if (CONDITION(_virtualItemCargo)) then {_center addprimaryweaponitem _item;} else {ERROR};
					};
					case "addsecondaryweaponitem": {
						if (CONDITION(_virtualItemCargo)) then {_center addsecondaryweaponitem _item;} else {ERROR};
					};
					case "addhandgunitem": {
						if (CONDITION(_virtualItemCargo)) then {_center addhandgunitem _item;} else {ERROR};
					};

					case "addmagazine": {
						if (CONDITION(_virtualMagazineCargo)) then {_center addmagazine _item;} else {ERROR};
					};
					case "additem": {
						if (CONDITION(_virtualItemCargo)) then {_center additem _item;} else {ERROR};
					};
					case "assignitem": {
						if (CONDITION(_virtualItemCargo)) then {_center assignitem _item;} else {ERROR};
					};
					case "linkitem": {
						if (CONDITION(_virtualItemCargo)) then {_center linkitem _item;} else {ERROR};
					};

					case "setface": {
						if (_fullVersion) then {_center setface _item; _center setvariable ["BIS_fnc_arsenal_face",_item];};
					};
					case "setspeaker": {
						if (_fullVersion) then {_center setspeaker _item;};
					};
					case "bis_fnc_setunitinsignia": {
						if (_fullVersion) then {[_center,_importArray select ((_foreachindex - 3) max 0)] call bis_fnc_setunitinsignia;};
					};
				};
			} foreach _importArray;
		};

		//--- Show unavailable items
		if (count _disabledItems > 0) then {
			['showMessage',[_display,localize "STR_A3_RscDisplayArsenal_message_unavailable"]] call XLA_fnc_arsenal;
		};

		["ListSelectCurrent",[_display]] call XLA_fnc_arsenal;
		//["templateSelChanged",[_display]] call XLA_fnc_arsenal;
		endloadingscreen;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "buttonExport": {
		_display = _this select 0;
		_exportMode = _this select 1;
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);

		_export = [_center,_exportMode,_fullVersion] call bis_fnc_exportInventory;
		_export spawn {copytoclipboard _this;};
		['showMessage',[_display,localize "STR_a3_RscDisplayArsenal_message_clipboard"]] call XLA_fnc_arsenal;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "buttonLoad": {
		_display = _this select 0;
		['showTemplates',[_display]] call XLA_fnc_arsenal;

		_ctrlTemplate = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE;
		_ctrlTemplate ctrlsetfade 0;
		_ctrlTemplate ctrlcommit 0;
		_ctrlTemplate ctrlenable true;

		_ctrlMouseBlock = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEBLOCK;
		_ctrlMouseBlock ctrlenable true;
		ctrlsetfocus _ctrlMouseBlock;

		{
			(_display displayctrl _x) ctrlsettext localize "str_disp_int_load";
		} foreach [IDC_RSCDISPLAYARSENAL_TEMPLATE_TITLE,IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONOK];
		{
			_ctrl = _display displayctrl _x;
			_ctrl ctrlshow false;
			_ctrl ctrlenable false;
		} foreach [IDC_RSCDISPLAYARSENAL_TEMPLATE_TEXTNAME,IDC_RSCDISPLAYARSENAL_TEMPLATE_EDITNAME];
		_ctrlTemplateValue = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
		if (lnbcurselrow _ctrlTemplateValue < 0) then {_ctrlTemplateValue lnbsetcurselrow 0;};
		ctrlsetfocus _ctrlTemplateValue;

		//--- Disable LOAD and DELETE buttons when no items are available
		_enableButtons = (lnbsize _ctrlTemplateValue select 0) > 0;
		_ctrlTemplateButtonOK = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONOK;
		_ctrlTemplateButtonOK ctrlenable _enableButtons;
		_ctrlTemplateButtonDelete = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONDELETE;
		_ctrlTemplateButtonDelete ctrlenable _enableButtons;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "buttonSave": {
		_display = _this select 0;
		['showTemplates',[_display]] call XLA_fnc_arsenal;

		_ctrlTemplate = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE;
		_ctrlTemplate ctrlsetfade 0;
		_ctrlTemplate ctrlcommit 0;
		_ctrlTemplate ctrlenable true;

		_ctrlMouseBlock = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEBLOCK;
		_ctrlMouseBlock ctrlenable true;

		{
			(_display displayctrl _x) ctrlsettext localize "str_disp_int_save";
		} foreach [IDC_RSCDISPLAYARSENAL_TEMPLATE_TITLE,IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONOK];
		{
			_ctrl = _display displayctrl _x;
			_ctrl ctrlshow true;
			_ctrl ctrlenable true;
		} foreach [IDC_RSCDISPLAYARSENAL_TEMPLATE_TEXTNAME,IDC_RSCDISPLAYARSENAL_TEMPLATE_EDITNAME];

		_ctrlTemplateName = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_EDITNAME;
		ctrlsetfocus _ctrlTemplateName;

		_ctrlTemplateValue = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
		_ctrlTemplateButtonOK = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONOK;
		_ctrlTemplateButtonOK ctrlenable true;
		_ctrlTemplateButtonDelete = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONDELETE;
		_ctrlTemplateButtonDelete ctrlenable ((lnbsize _ctrlTemplateValue select 0) > 0);

		['showMessage',[_display,localize "STR_A3_RscDisplayArsenal_message_save"]] call XLA_fnc_arsenal;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "buttonRandom": {
		_display = _this select 0;
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);

		//--- Left sidebar
		{
			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _x);
			_ctrlList lbsetcursel floor random (lbsize _ctrlList);
		} foreach IDCS;

		//--- Right sidebar (attachments)
		{
			_weaponID = _foreachindex;
			{
				_compatibleItems = getarray (_x >> "compatibleItems") + [""];
				_acc = _compatibleItems call bis_fnc_selectrandom;
				if (_acc != "") then {
					switch _weaponID do {
						case 0: {_center addprimaryweaponitem _acc;};
						case 1: {_center addsecondaryweaponitem _acc;};
						case 2: {_center addhandgunitem _acc;};
					};
				};
			} foreach ("isclass _x" configclasses (configfile >> "cfgweapons" >> _x >> "WeaponSlotsInfo"));
		} foreach [
			primaryweapon _center,
			secondaryweapon _center,
			handgunweapon _center
		];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "buttonInterface": {
		_display = _this select 0;
		_show = !ctrlshown (_display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_CONTROLBAR);
		{
			_tab = _x;
			{
				_ctrl = _display displayctrl (_tab + _x);
				_ctrl ctrlshow _show;
				_ctrl ctrlcommit FADE_DELAY;
			} foreach [
				IDC_RSCDISPLAYARSENAL_ICON,
				IDC_RSCDISPLAYARSENAL_TAB,
				IDC_RSCDISPLAYARSENAL_LIST
			];
		} foreach IDCS;
		{
			_ctrl = _display displayctrl _x;
			_ctrl ctrlshow _show;
			_ctrl ctrlcommit FADE_DELAY;
		} foreach [
			IDC_RSCDISPLAYARSENAL_CONTROLSBAR_CONTROLBAR,
			IDC_RSCDISPLAYARSENAL_TABS,
			IDC_RSCDISPLAYARSENAL_FRAMELEFT,
			IDC_RSCDISPLAYARSENAL_FRAMERIGHT,
			IDC_RSCDISPLAYARSENAL_LINEICON,
			IDC_RSCDISPLAYARSENAL_LINETABLEFT,
			IDC_RSCDISPLAYARSENAL_LINETABRIGHT,
			IDC_RSCDISPLAYARSENAL_ICON,
			IDC_RSCDISPLAYARSENAL_TAB,
			IDC_RSCDISPLAYARSENAL_LIST,
			IDC_RSCDISPLAYARSENAL_LOAD,
			IDC_RSCDISPLAYARSENAL_LOADCARGO,
			IDC_RSCDISPLAYARSENAL_BACKGROUNDLEFT,
			IDC_RSCDISPLAYARSENAL_BACKGROUNDRIGHT,
			IDC_RSCDISPLAYARSENAL_STATS_STATS,
			IDC_RSCDISPLAYARSENAL_INFO_DLCBACKGROUND,
			IDC_RSCDISPLAYARSENAL_INFO_DLCICON
		];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "buttonOK": {
		_display = _this select 0;
		_display closedisplay 2;

		["#(argb,8,8,3)color(0,0,0,1)",false,nil,0,[0,0.5]] call bis_fnc_textTiles;

		//missionnamespace setvariable ["RscStatic_mode",0];
		//cutrsc ["rscstatic","plain"];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "buttonClose": {
		_display = _this select 0;
		_message = if (missionname == "Arsenal") then {
			[
				localize "STR_SURE",
				localize "STR_disp_arcmap_exit",
				nil,
				true,
				_display,
				true
			] call bis_fnc_guimessage;
		} else {
			true
		};
		if (_message) then {
			_display closedisplay 2;
			if (missionname == "Arsenal") then {endmission "end1";};
			["#(argb,8,8,3)color(0,0,0,1)",false,nil,0,[0,0.5]] call bis_fnc_textTiles;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "showMessage": {
		if !(isnil {missionnamespace getvariable "BIS_fnc_arsenal_message"}) then {terminate (missionnamespace getvariable "BIS_fnc_arsenal_message")};

		_spawn = _this spawn {
			disableserialization;
			_display = _this select 0;
			_message = _this select 1;

			_ctrlMessage = _display displayctrl IDC_RSCDISPLAYARSENAL_MESSAGE;
			_ctrlMessage ctrlsettext _message;
			_ctrlMessage ctrlsetfade 1;
			_ctrlMessage ctrlcommit 0;
			_ctrlMessage ctrlsetfade 0;
			_ctrlMessage ctrlcommit FADE_DELAY;
			uisleep 5;
			_ctrlMessage ctrlsetfade 1;
			_ctrlMessage ctrlcommit FADE_DELAY;
		};
		missionnamespace setvariable ["BIS_fnc_arsenal_message",_spawn];
	};


	///////////////////////////////////////////////////////////////////////////////////////////
	case "AmmoboxInit": {
		private ["_box","_allowAll"];
		_box = [_this,0,objnull,[objnull]] call bis_fnc_param;
		_allowAll = [_this,1,false,[false]] call bis_fnc_param;
		_condition = [_this,2,{true},[{}]] call bis_fnc_param;

		if ({} isequalto {}) then {
			_box setvariable ["bis_fnc_arsenal_condition",_condition,true];
		};

		if (_allowAll) then {
			[_box,true,true,false] call bis_fnc_addVirtualWeaponCargo;
			[_box,true,true,false] call bis_fnc_addVirtualMagazineCargo;
			[_box,true,true,false] call bis_fnc_addVirtualItemCargo;
			[_box,true,true,false] call bis_fnc_addVirtualBackpackCargo;
		};
		[["AmmoboxServer",_box,true],"bis_fnc_arsenal",false] call bis_fnc_mp;
	};
	///////////////////////////////////////////////////////////////////////////////////////////
	case "AmmoboxExit": {
		private ["_box"];
		_box = [_this,0,objnull,[objnull]] call bis_fnc_param;
		[["AmmoboxServer",_box,false],"bis_fnc_arsenal",false] call bis_fnc_mp;
	};
	///////////////////////////////////////////////////////////////////////////////////////////
	case "AmmoboxServer": {
		_box = [_this,0,objnull,[objnull]] call bis_fnc_param;
		_add = [_this,1,true,[true]] call bis_fnc_param;

		_boxes = missionnamespace getvariable ["bis_fnc_arsenal_boxes",[]];
		_boxes = _boxes - [_box];
		if (_add) then {_boxes = _boxes + [_box];};
		missionnamespace setvariable ["bis_fnc_arsenal_boxes",_boxes];
		publicvariable "bis_fnc_arsenal_boxes";

		["AmmoboxLocal","bis_fnc_arsenal",true,isnil "bis_fnc_arsenal_ammoboxServer"] call bis_fnc_mp;
		bis_fnc_arsenal_ammoboxServer = true;
	};
	///////////////////////////////////////////////////////////////////////////////////////////
	case "AmmoboxLocal": {
		_boxes = missionnamespace getvariable ["bis_fnc_arsenal_boxes",[]];
		{
			if (isnil {_x getvariable "bis_fnc_arsenal_action"}) then {
				_action = _x addaction [
					localize "STR_A3_Arsenal",
					{
						_box = _this select 0;
						_unit = _this select 1;
						["Open",[nil,_box]] call XLA_fnc_arsenal;
					},
					[],
					6,
					true,
					false,
					"",
					"
						_cargo = _target getvariable ['bis_addVirtualWeaponCargo_cargo',[[],[],[],[]]];
						if ({count _x > 0} count _cargo == 0) then {
							_target removeaction (_target getvariable ['bis_fnc_arsenal_action',-1]);
							_target setvariable ['bis_fnc_arsenal_action',nil];
						};
						_condition = _target getvariable ['bis_fnc_arsenal_condition',{true}];
						alive _target && {_target distance _this < 5} && {call _condition}
					"
				];
				_x setvariable ["bis_fnc_arsenal_action",_action];
			};
		} foreach _boxes;
	};
};