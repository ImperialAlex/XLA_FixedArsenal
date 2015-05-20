/*
	Author: Karel Moricky
	Edits: Alexander

	Description:
	Add config defined inventory to an unit

	Parameter(s):
		0: OBJECT - object which will receive the loadout
		1:
			CONFIG - link to CfgVehicles soldier or to CfgRespawnInventory
			ARRAY in format [NAMESPACE or GROUP or OBJECT,STRING] - inventory saved using BIS_fnc_saveInventory
		2: ARRAY of STRINGs - config entries to be ignored (e.g. "weapons", "uniform", ...)
		3: ARRAY of ARRAY of STRINGs - forceReplace tuples

	Returns:
	BOOL
*/

#define DEFAULT_SLOT 0
#define MUZZLE_SLOT 101
#define OPTICS_SLOT 201
#define FLASHLIGHT_SLOT 301
#define FIRSTAIDKIT_SLOT 401
#define FINS_SLOT 501
#define BREATHINGBOMB_SLOT 601
#define NVG_SLOT 602
#define GOGGLE_SLOT 603
#define SCUBA_SLOT 604
#define HEADGEAR_SLOT 605
#define UNIFORM_SLOT 801// just for DEBUG
#define FACTOR_SLOT 607

#define HMD_SLOT       616
#define BINOCULAR_SLOT 617
#define MEDIKIT_SLOT   619
#define RADIO_SLOT    611

#define VEST_SLOT      701
#define BACKPACK_SLOT  901

scopename _fnc_scriptName;
private ["_cfg","_inventory","_isCfg","_blacklist","_forceReplace"];
_object = [_this,0,objnull,[objnull]] call bis_fnc_param;

_cfg = [_this,1,configfile,[configfile,"",[]]] call bis_fnc_param;

_cargo = (missionnamespace getvariable ["XLA_fnc_arsenal_cargo",objnull]);

_center = (missionnamespace getvariable ["XLA_fnc_arsenal_center",player]);

_fullVersion = (missionnamespace getvariable ["XLA_fnc_arsenal_fullArsenal",false]);

_forceReplace = [_this,3,[],[[]]] call bis_fnc_param;

// XLA: Grab the cargo and blacklist
// Get the whitelist of the object/mission
_list = _cargo call xla_fnc_constructWhiteBlacklist;
_wlist = (_list select 0);
_blist = (_list select 1);


_inventory = [];
switch (typename _cfg) do {
	case (typename ""): {
		_cfg = configfile >> "cfgvehicles" >> _cfg;
	};
	case (typename []): {
		if ({typename _x != typename ""} count _cfg == 0) then {
			_cfg = [_cfg,configfile] call bis_fnc_configpath;
		} else {
			if (count _cfg == 1) then {
				_inventory = _cfg select 0;
			} else {
				private ["_namespace","_name","_data","_nameID"];
				_namespace = [_cfg,0,missionnamespace,[missionnamespace,grpnull,objnull]] call bis_fnc_paramin;
				_name = [_cfg,1,"",[""]] call bis_fnc_paramin;
				_data = _namespace getvariable ["bis_fnc_saveInventory_data",[]];
				_nameID = _data find _name;
				if (_nameID >= 0) then {
					_inventory = _data select (_nameID + 1);
					_cfg = [_inventory];
				} else {
					["Inventory '%1' not found",_name] call bis_fnc_error; breakout _fnc_scriptName;
				};
			};
		};
	};
};
_isCfg = count _inventory == 0;

_blacklist = [_this,2,[],[[]]] call bis_fnc_param;
{_blacklist set [_foreachindex,tolower _x];} foreach _blacklist;

//--- Send to where the object is local (weapons can be changed only locally)
if !(local _object) exitwith {[[_object,_cfg,_blacklist],_fnc_scriptName,_object] call bis_fnc_mp; false};

//--- Process items
private ["_items","_linkedItemsMisc","_vest","_headgear","_goggles"];
_items = [];
_linkedItemsMisc = [];
_vest = "";
_headgear = ""; //--- Added as assigned item
_goggles = ""; //--- Added as assigned item
if (_isCfg) then {
	_items = getarray (_cfg >> "items");
	_linkedItems = getarray (_cfg >> "linkedItems");
	_linkedItemsMisc = [];
	{
		_item = _x;
		if (typename _item == typename []) then {_item = _item call bis_fnc_selectrandom;};

		if (isclass (configfile >> "cfgglasses" >> _item)) then {
			_goggles = _item;
		} else {
			private ["_type"];
			_type = getnumber (configfile >> "cfgweapons" >> _item >> "iteminfo" >> "type");
			switch _type do {
				case VEST_SLOT: {_vest = _item;};
				case HEADGEAR_SLOT: {_headgear = _item;};
				//case GOGGLE_SLOT: {_goggles = _item;};
				default {_linkedItemsMisc set [count _linkedItemsMisc,_item];};
			};
		};
	} foreach _linkedItems;
} else {
	_vest = _inventory select 1 select 0;
	_headgear = _inventory select 3;
	_goggles = _inventory select 4;
	//_linkedItemsMisc = (_inventory select 9) + (_inventory select 6 select 1) + (_inventory select 7 select 1) + (_inventory select 8 select 1);
	//--- Do isNil check because weaponAccessories command can return nil
	_linkedItemsMisc = (_inventory select 9);
	if (!isnil {_inventory select 6 select 1}) then {_linkedItemsMisc = _linkedItemsMisc + (_inventory select 6 select 1)} else {_linkedItemsMisc = _linkedItemsMisc + ["","",""];};
	if (!isnil {_inventory select 7 select 1}) then {_linkedItemsMisc = _linkedItemsMisc + (_inventory select 7 select 1)} else {_linkedItemsMisc = _linkedItemsMisc + ["","",""];};
	if (!isnil {_inventory select 8 select 1}) then {_linkedItemsMisc = _linkedItemsMisc + (_inventory select 8 select 1)} else {_linkedItemsMisc = _linkedItemsMisc + ["","",""];};
};

_uniform_old = "";
_backpack_old = "";
_vest_old = "";

//--- Remove
//XLA: Save old containers in case a new one is not allowed
if !("uniform" in _blacklist) then {
	_uniform_old = uniform _object;
	removeuniform _object;
};
if !("vest" in _blacklist) then {
	_vest_old = vest _object;
	removevest _object;
};
if !("headgear" in _blacklist) then {
	removeheadgear _object;
};
if !("goggles" in _blacklist) then {
	removegoggles _object;
};
if !("backpack" in _blacklist) then {
	_backpack_old = backpack _object;
	removebackpack _object;
};
if !("items" in _blacklist) then {
	removeallitems _object;
};
if !("linkeditems" in _blacklist) then
{
	private["_headgear","_goggles"];

	//store headgear & goggles to prevent uncontrolled removal
	_headgear = headgear _object;
	_goggles = goggles _object;

	removeallassigneditems _object;

	//re-store headgear & goggles
	if (_headgear != "") then
	{
		_object addheadgear _headgear;
	};
	if (_goggles != "") then
	{
		_object addgoggles _goggles;
	};
};
if !("weapons" in _blacklist) then {
	removeallweapons _object;
};
if !("transportMagazines" in _blacklist) then {
	if (count (getmagazinecargo _object select 0) > 0) then {clearmagazinecargoglobal _object;};
};
if !("transportWeapons" in _blacklist) then {
	if (count (getweaponcargo _object select 0) > 0) then {clearweaponcargoglobal _object;};
};
if !("transportItems" in _blacklist) then {
	if (count (getitemcargo _object select 0) > 0) then {clearitemcargoglobal _object;};
};

//--- Add

//XLA: List of "failures" (items that couldn't be found (!isClass) or aren't allowed)
_failures = [];

if !("uniform" in _blacklist) then {
	private ["_uniform"];
	_uniform = "";
	if (_isCfg) then {
		_uniform = _cfg >> "uniformClass";
		_uniform = if (isarray _uniform) then {(getarray _uniform) call bis_fnc_selectrandom} else {gettext _uniform};
	} else {
		_uniform = _inventory select 0 select 0;
	};
	if (_uniform != "") then {

		// force-replace			
		{	
			if ((_x select 0)  == _uniform) then {
				_uniform = (_x select 1);
				_failures = _failures + [format ["Uniform %1 replaced with %2\n",(_x select 0),_uniform]];
			};
		} forEach _forceReplace;

		if (isclass (configfile >> "cfgWeapons" >> _uniform)) then {		

			// 0 for virtualItemCargo/Blacklist, 1 for virtualWeaponCargo/Blacklist
			_XLA_condition = [_uniform,_wlist,_blist,[0,1],_fullVersion] call xla_fnc_arsenalCondition;
			if (_XLA_condition) then {
				_object forceadduniform _uniform;				
			} else {
				_failures = _failures + [format ["Uniform %1 is not whitelisted\n",_uniform]];
				_object forceadduniform _uniform_old;
			};
		} else {
			_failures = _failures + [format["Uniform '%1' does not exist in CfgWeapons\n",_uniform]];
			_object forceadduniform _uniform_old;
		};
	};
};

if !("vest" in _blacklist) then {
	if (_vest != "") then {

		// force-replace			
		{	
			if ((_x select 0)  == _vest) then { 
				_vest = (_x select 1);
				_failures = _failures +  [format ["Vest %1 replaced with %2\n",(_x select 0),_vest]];
			};
		} forEach _forceReplace;

		if (isclass (configfile >> "cfgWeapons" >> _vest)) then {
		
			// 0 for virtualItemCargo/Blacklist,
			_XLA_condition = [_vest,_wlist,_blist,[0],_fullVersion] call xla_fnc_arsenalCondition;
			if (_XLA_condition) then {
				_object addvest _vest;
			} else {
				_failures = _failures +  [format ["Vest %1 is not whitelisted\n",_vest]];
				_object addvest _vest_old;
			};
		} else {
			_failures = _failures + [format["Vest '%1' does not exist in CfgWeapons\n",_vest]];
			_object addvest _vest_old;
		};
	};
};

if !("headgear" in _blacklist) then {
	if (_headgear != "") then {

		// force-replace			
		{	
			if ((_x select 0)  == _headgear) then {
				_headgear = (_x select 1);
				_failures = _failures + [format ["Headgear %1 replaced with %2\n",(_x select 0),_headgear]];
			};
		} forEach _forceReplace;;

		if (isclass (configfile >> "cfgWeapons" >> _headgear)) then {		

			// 0 for virtualItemCargo/Blacklist,
			_XLA_condition = [_headgear,_wlist,_blist,[0],_fullVersion] call xla_fnc_arsenalCondition;		
			if (_XLA_condition) then {
				_object addheadgear _headgear;
			} else {
				_failures = _failures + [format ["Headgear %1 is not whitelisted\n",_headgear]];
			};
		} else {
			_failures = _failures + [format["Headgear '%1' does not exist in CfgWeapons\n",_headgear]];
		};
	};
};

if !("goggles" in _blacklist) then {
	if (_goggles != "") then {

		// force-replace			
		{	
			if ((_x select 0)  == _goggles) then { 
				_goggles = (_x select 1);
				_failures = _failures + [format ["Goggles %1 replaced with %2\n",(_x select 0),_goggles]];
			};
		} forEach _forceReplace;

		if (isclass (configfile >> "cfgGlasses" >> _goggles)) then {

			// 0 for virtualItemCargo/Blacklist,
			_XLA_condition = [_goggles,_wlist,_blist,[0],_fullVersion] call xla_fnc_arsenalCondition;
			if (_XLA_condition) then {
			_object addgoggles _goggles;
		} else {
				_failures = _failures + [format ["Goggles %1 are not whitelisted\n",_goggles]];
			};
		} else {
			_failures = _failures + [format ["Goggles '%1' does not exist in CfgGlasses\n",_goggles]];
		};
	};
};

if !("backpack" in _blacklist) then {
	private ["_backpack"];
	_backpack = "";
	if (_isCfg) then {
		_backpack = _cfg >> "backpack";
		_backpack = if (isarray _backpack) then {(getarray _backpack) call bis_fnc_selectrandom} else {gettext _backpack};
	} else {
		_backpack = _inventory select 2 select 0;
	};
	if (_backpack != "") then {
		// force-replace			
		{	
			if ((_x select 0)  == _backpack) then { 
				_backpack = (_x select 1);
				_failures = _failures + [format ["Backpack %1 replaced with %2\n",(_x select 0),_backpack]];
			};
		} forEach _forceReplace;

		if (isclass (configfile >> "cfgVehicles" >> _backpack)) then {

			// 0 for virtualItemCargo/Blacklist, 3 for virtualBackpackCargo/Blacklist
			_XLA_condition = [_backpack,_wlist,_blist,[0,3],_fullVersion] call xla_fnc_arsenalCondition;
			if (_XLA_condition) then {
				_object addbackpack _backpack;
			} else {
				_failures = _failures + [format ["Backpack %1 is not whitelisted\n",_backpack]];
				_object addBackpack _backpack_old;
			};
		} else {
			_failures = _failures +  [format["Backpack '%1' does not exist in CfgVehicles\n",_backpack]];
			_object addBackpack _backpack_old;
		};
	};
};

if !("magazines" in _blacklist) then {
	if (_isCfg) then {
		private ["_magazines"];
		_magazines = getarray (_cfg >> "magazines");
		{
			if (_x != "") then {
				_magazine = _x;
				if (typename _magazine == typename []) then {_magazine = _magazine call bis_fnc_selectrandom;};

				// force-replace			
				{	
					if ((_x select 0)  == _magazine) then { 
						_magazine = (_x select 1);
						_failures = _failures + [format ["Magazine %1 replaced with %2\n",(_x select 0),_magazine]];
					};
				} forEach _forceReplace;

				// 2 for virtualMagazineCargo/Blacklist,
				_XLA_condition = [_magazine,_wlist,_blist,[2],_fullVersion] call xla_fnc_arsenalCondition;
				if (_XLA_condition) then {
					_object addmagazine _magazine;
				} else {
					_failures = _failures + [format ["Magazine %1 is not available\n",_magazine]];
				};
			};
		} foreach _magazines;
	} else {
		//--- Add magazines to be loaded in weapons by default
		if ({!isnil "_x"} count (_inventory select 6) > 2) then {
			{
				if (_x != "") then {

					// force-replace
					_thing = _x;		
					{	
						if ((_x select 0)  == _thing) then {
							_thing = (_x select 1);
							_failures = _failures + [format ["Magazine %1 replaced with %2\n",(_x select 0),(_x select 1)]];
						};
					} forEach _forceReplace;
					_x = _thing;

					if (isClass (configFile >> "CfgMagazines" >> _x)) then {						

						// 2 for virtualMagazineCargo/Blacklist,
						_XLA_condition = [_x,_wlist,_blist,[2],_fullVersion] call xla_fnc_arsenalCondition;
						if (_XLA_condition) then {
							_object addmagazine _x;
						} else {
							_failures = _failures + [format ["Default Magazine %1 is not whitelisted\n",_x]];
						};
					} else {
						_failures = _failures + [format["Default Magazine '%1' does not exist in CfgMagazines\n",_x]];
					};
				};
			} foreach [_inventory select 6 select 2,_inventory select 7 select 2,_inventory select 8 select 2];
		} else {
			_failures = _failures + ["SOMETHING WEIRD HAPPENED. SORRY.\n"];
		};
	};
};

if !("weapons" in _blacklist) then {
	private ["_weapons"];
	_weapons = if (_isCfg) then {getarray (_cfg >> "weapons")} else {[_inventory select 5,_inventory select 6 select 0,_inventory select 7 select 0,_inventory select 8 select 0]};
	{
		if (_x != "") then {
			_weapon = _x;

			// force-replace	
			{	
				if ((_x select 0)  == _weapon) then { 
					_weapon = (_x select 1);
					_failures = _failures + [format ["Weapon %1 replaced with %2\n",(_x select 0),(_x select 1)]];
				};
			} forEach _forceReplace;

			if (isClass (configFile >> "CfgWeapons" >> _weapon)) then {
				if (typename _weapon == typename []) then {_weapon = _weapon call bis_fnc_selectrandom;};

				// 1 for virtualWeaponCargo/Blacklist,
				_XLA_condition = [_weapon,_wlist,_blist,[1],_fullVersion] call xla_fnc_arsenalCondition;
				if (_XLA_condition) then {
					_object addweapon _weapon;
				} else {
					_failures = _failures + [format["Weapon %1 is not whitelisted\n",_weapon]];
				};	
			} else {
				_failures = _failures + [format["Weapon '%1' does not exist in CfgWeapons\n",_weapon]];
			};
		};
	} foreach _weapons;
};

if !(_isCfg) then {
	//--- Add container items (only after weapons were added together with their default magazines)
	if !("uniform" in _blacklist) then {{

			// force-replace
			_thing = _x;		
			{	
				if ((_x select 0)  == _thing) then { 
					_thing = (_x select 1);
					_failures = _failures + [format ["Item %1 in uniform replaced with %2\n",(_x select 0),(_x select 1)]];
				};
			} forEach _forceReplace;
			_x = _thing;

			// 2 for virtualMagazineCargo/Blacklist, 1 for Weapons, 0 for Items
			_XLA_condition = [_x,_wlist,_blist,[2,1,0],_fullVersion] call xla_fnc_arsenalCondition;
			if (_XLA_condition) then {
				_object additemtouniform _x;
			} else {
				_failures = _failures + [format ["Item %1 in uniform is not available\n",_x]];
			};
	} foreach (_inventory select 0 select 1);};
	if !("vest" in _blacklist) then {{

		// force-replace
		_thing = _x;		
		{	
			if ((_x select 0)  == _thing) then { 
				_thing = (_x select 1);
				_failures = _failures + [format ["Item %1 in vest replaced with %2\n",(_x select 0),(_x select 1)]];
			};
		} forEach _forceReplace;
		_x = _thing;

		// 2 for virtualMagazineCargo/Blacklist, 1 for Weapons, 0 for Items
		_XLA_condition = [_x,_wlist,_blist,[2,1,0],_fullVersion] call xla_fnc_arsenalCondition;
		if (_XLA_condition) then {
			_object additemtovest _x;
		} else {
			_failures = _failures + [format ["Item %1 in vest is not available\n",_x]];
		};
	} foreach (_inventory select 1 select 1);};
	if !("backpack" in _blacklist) then {{

		// force-replace
		_thing = _x;		
		{	
			if ((_x select 0)  == _thing) then {
				_thing = (_x select 1);
				_failures = _failures + [format ["Item %1 in backpack replaced with %2\n",(_x select 0),(_x select 1)]];
			};
		} forEach _forceReplace;
		_x = _thing;

		// 2 for virtualMagazineCargo/Blacklist, 1 for Weapons, 0 for Items
		_XLA_condition = [_x,_wlist,_blist,[2,1,0],_fullVersion] call xla_fnc_arsenalCondition;
		if (_XLA_condition) then {
			_object additemtobackpack _x;
		} else {
			_failures = _failures + [format ["Item %1 in backpack is not available\n",_x]];
		};

	} foreach (_inventory select 2 select 1);};
};

if !("transportMagazines" in _blacklist) then {
	if (_isCfg) then {
		private ["_transportMagazines"];
		_transportMagazines = [];
		{
			_transportMagazines set [count _transportMagazines,[gettext (_x >> "magazine"),getnumber (_x >> "count")]];
		} foreach ([_cfg >> "transportMagazines"] call bis_fnc_subclasses);
		{
			if ((_x select 0) != "") then {

				// force-replace
				_thing = _x;		
				{	
					if ((_x select 0)  == _thing) then {
						_thing = (_x select 1);
						_failures = _failures + [format ["Transport Magazine %1 replaced with %2\n",(_x select 0),(_x select 1)]];
					};
				} forEach _forceReplace;
				_x = _thing;

				// 2 for virtualMagazineCargo/Blacklist, 0 for Items
				_XLA_condition = [_x,_wlist,_blist,[2,0],_fullVersion] call xla_fnc_arsenalCondition;
				if (_XLA_condition) then {
					_object addmagazinecargoglobal _x;
				} else {
					_failures = _failures + [format ["Transport Magazine %1 is not available\n",_x]];
				};
			};
		} foreach _transportMagazines;
	};
};

if !("items" in _blacklist) then {
	{
		// force-replace
		_thing = _x;		
		{	
			if ((_x select 0)  == _thing) then {
				_thing = (_x select 1);
				_failures = _failures + [format ["Item %1 replaced with %2\n",(_x select 0),(_x select 1)]];
			};
		} forEach _forceReplace;
		_x = _thing;

		if (isClass (configFile >> "CfgWeapons" >> _x)) then {		

		// 0 for Items
		_XLA_condition = [_x,_wlist,_blist,[0],_fullVersion] call xla_fnc_arsenalCondition;
			if (_XLA_condition) then {
			_object additem _x;
			} else {
				_failures = _failures + [format ["Item %1 is not whitelisted\n",_x]];
			};
		} else {
			_failures = _failures + [format["Item '%1' does not exist in CfgWeapons\n",_item]];
		};
	} foreach _items;
};

if !("linkeditems" in _blacklist) then {
	{
		if (_x != "") then {

			// force-replace
			_thing = _x;		
			{	
				if ((_x select 0)  == _thing) then { 
					_thing = (_x select 1);
					_failures = _failures + [format ["LinkedItem %1 replaced with %2\n",(_x select 0),(_x select 1)]];
				};
			} forEach _forceReplace;
			_x = _thing;

			if (isClass (configFile >> "CfgWeapons" >> _x)) then {			

			// 1 for Weapons, 0 for Items
			_XLA_condition = [_x,_wlist,_blist,[1,0],_fullVersion] call xla_fnc_arsenalCondition;
				if (_XLA_condition)  then {
					_object linkitem _x;
					_object addPrimaryWeaponItem _x;
					_object addSecondaryWeaponItem _x;
					_object addHandgunItem _x;
				} else {
					_failures = _failures + [format ["LinkedItem %1 is not whitelisted\n",_x]];
				};
			} else {
				_failures = _failures + [format["LinkedItem '%1' does not exist in CfgWeapons\n",_x]];
			};
		};
	} foreach _linkedItemsMisc;
};

if !("transportWeapons" in _blacklist) then {
	if (_isCfg) then {
		private ["_transportWeapons"];
		_transportWeapons = [];
		{
			_transportWeapons set [count _transportWeapons,[gettext (_x >> "weapon"),getnumber (_x >> "count")]];
		} foreach ([_cfg >> "transportWeapons"] call bis_fnc_subclasses);
		{
			if ((_x select 0) != "") then {

				// force-replace
				_thing = _x;		
				{	
					if ((_x select 0)  == _thing) then {
						_thing = (_x select 1);
						_failures = _failures + [format ["Transport Weapon %1 replaced with %2\n",(_x select 0),(_x select 1)]];
					};
				} forEach _forceReplace;
				_x = _thing;

				// 1 for Weapons, 0 for Items
				_XLA_condition = [_x,_wlist,_blist,[1,0],_fullVersion] call xla_fnc_arsenalCondition;
				if (_XLA_condition) then {
					_object addweaponcargoglobal _x;
				} else {
					_failures = _failures + [format ["Transport Weapon %1 is not available\n",_x]];
				};		
			};
		} foreach _transportWeapons;
	};
};

if !("transportItems" in _blacklist) then {
	if (_isCfg) then {
		private ["_transportItems"];
		_transportItems = [];
		{
			_transportItems set [count _transportItems,[gettext (_x >> "name"),getnumber (_x >> "count")]];
		} foreach ([_cfg >> "transportItems"] call bis_fnc_subclasses);
		{
			if ((_x select 0) != "") then {

				// force-replace
				_thing = _x;		
				{	
					if ((_x select 0)  == _thing) then {
						_thing = (_x select 1);
						_failures = _failures + [format ["Transport Item %1 replaced with %2\n",(_x select 0),(_x select 1)]];
					};
				} forEach _forceReplace;
				_x = _thing;

				// 1 for Weapons, 0 for Items
				_XLA_condition = [_x,_wlist,_blist,[1,0],_fullVersion] call xla_fnc_arsenalCondition;
				if (_XLA_condition) then {
					_object additemcargoglobal _x;
				} else {
					_failures = _failures + [format ["Transport Item %1 is not available\n",_x]];
				};
			};
		} foreach _transportItems;
	};
};

// XLA: Find unique entries in failures:
_uniqueFailures = [];
{
	if ((_uniqueFailures find _x)<0) then {
		_uniqueFailures = _uniqueFailures + [_x];
	}
} forEach _failures ;

// XLA: Now count the groups
_failString = "";
{
	_y = _x;
	_n =  {_x == _y} count _failures;
	_failString = _failString + (format ["%1x %2" , _n,_x]);
} forEach _uniqueFailures;

// XLA: Display failures
titleText[_failString, "PLAIN"];

// always returns true
true