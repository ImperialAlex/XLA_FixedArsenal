#define NO_SIDE -1
#define EAST_SIDE 0
#define WEST_SIDE 1
#define INDEP_SIDE 2
#define CIV_SIDE 3
#define NEUTRAL_SIDE 4
#define ENEMY_SIDE 5
#define FRIENDLY_SIDE 6
#define LOGIC_SIDE 7

#define GETVIRTUALCARGO\
	_allowEquipped = _cargo getVariable ["XLA_fnc_arsenal_allowEquipped",true];\
	_virtualItemCargo = (missionnamespace call XLA_fnc_getVirtualItemCargo) +	(_cargo call XLA_fnc_getVirtualItemCargo);\
	_virtualMagazineCargo = (missionnamespace call XLA_fnc_getVirtualMagazineCargo) + (_cargo call XLA_fnc_getVirtualMagazineCargo);\
	_virtualBackpackCargo = (missionnamespace call XLA_fnc_getVirtualBackpackCargo) + (_cargo call XLA_fnc_getVirtualBackpackCargo);\
	_virtualSideCargo =  (missionnamespace call XLA_fnc_getVirtualSideCargo) + (_cargo call XLA_fnc_getVirtualSideCargo);\
	_virtualWeaponCargo = [];\
	{\
		_weapon = _x call XLA_fnc_baseWeapon;\
		_virtualWeaponCargo set [count _virtualWeaponCargo,_weapon];\
		{\
			private ["_item"];\
			_item = gettext (_x >> "item");\
			if !(_item in _virtualItemCargo) then {_virtualItemCargo set [count _virtualItemCargo,_item];};\
		} foreach ((configfile >> "cfgweapons" >> _x >> "linkeditems") call bis_fnc_returnchildren);\
	} foreach ((missionnamespace call XLA_fnc_getVirtualWeaponCargo) + (_cargo call XLA_fnc_getVirtualWeaponCargo));\
	if (_allowEquipped) then {\
		_virtualItemCargo = _virtualItemCargo + \
			items _center +\
			assigneditems _center +\
			primaryweaponitems _center +\
			secondaryweaponitems _center +\
			handgunitems _center +\
			[uniform _center,vest _center,headgear _center,goggles _center];\
		_virtualMagazineCargo = _virtualMagazineCargo + magazines _center;\
		_virtualBackpackCargo = _virtualBackpackCargo + [backpack _center];\
		{\
			_weapon = _x;\
			_virtualWeaponCargo set [count _virtualWeaponCargo,_weapon];\
			{\
				private ["_item"];\
				_item = gettext (_x >> "item");\
				if !(_item in _virtualItemCargo) then {_virtualItemCargo set [count _virtualItemCargo,_item];};\
			} foreach ((configfile >> "cfgweapons" >> _x >> "linkeditems") call bis_fnc_returnchildren);\
		} foreach (weapons _center + [binocular _center]);\
	};\
	_virtualItemBlacklist = (missionnamespace call XLA_fnc_getVirtualItemBlacklist) +	(_cargo call XLA_fnc_getVirtualItemBlacklist);\
	_virtualMagazineBlacklist = (missionnamespace call XLA_fnc_getVirtualMagazineBlacklist) + (_cargo call XLA_fnc_getVirtualMagazineBlacklist);\
	_virtualBackpackBlacklist = (missionnamespace call XLA_fnc_getVirtualBackpackBlacklist) + (_cargo call XLA_fnc_getVirtualBackpackBlacklist);\
	_virtualSideBlacklist =  (missionnamespace call XLA_fnc_getVirtualBackpackBlacklist) + (_cargo call XLA_fnc_getVirtualBackpackBlacklist);\
	_virtualWeaponBlacklist = [];\
	{\
		_weapon = _x call XLA_fnc_baseWeapon;\
		_virtualWeaponBlacklist set [count _virtualWeaponBlacklist,_weapon];\
		{\
			private ["_item"];\
			_item = gettext (_x >> "item");\
			if !(_item in _virtualItemBlacklist) then {_virtualItemBlacklist set [count _virtualItemBlacklist,_item];};\
		} foreach ((configfile >> "cfgweapons" >> _x >> "linkeditems") call bis_fnc_returnchildren);\
	} foreach ((missionnamespace call XLA_fnc_getVirtualWeaponBlacklist) + (_cargo call XLA_fnc_getVirtualWeaponBlacklist));\
	diag_log "GOT CARGO AND BLACKLIST";


#define GETCONDITION3(WLIST,BLIST,ITEM)\
	_XLA_condition = false;\
	if (_fullVersion) then { \
		_XLA_condition = true;\
	} else { \
		private ["_xla_config","_xla_wlist","_xla_blist","_xla_item","_xla_side","_xla_factionstring","_xla_sideallowed"];\
		_xla_wlist = WLIST; _xla_blist = BLIST; _xla_item = ITEM;\
		diag_log ("TESTING: ");\
		diag_log _xla_item;\
		diag_log _xla_wlist;\
		diag_log _xla_blist;\
		_xla_config = configFile;\
		{ \
			diag_log ("pre-class-test: " + str diag_log (configFile / _x / _xla_item));\
			if (isClass(configFile / _x / _xla_item)) then	{ \
				diag_log (str (configFile / _x / _xla_item) + "ISCLASS");\
				_xla_config = configFile / _x / _xla_item;\
			};\
		}	foreach ["CfgWeapons","CfgVehicles","CfgMagazines"];\
		if (_xla_config != configFile ) then { \
			diag_log ("Entering side check");\
			_xla_side = NO_SIDE;\
			if (isNumber (_xla_config >> "side")) then { \
				_xla_side = getNumber (_xla_config >> "side");\
			};\
			diag_log("tested side :" + str _xla_side);\
			_xla_factionstring = getText(_xla_config >> "faction");\
			if (_xla_factionstring != "" && _xla_factionstring != "Default") then { \
				_configFaction = (configFile / "CfgFactionClasses" / _xla_factionstring);\
				if (isNumber (_configFaction >> "side")) then { \
					_xla_side = getNumber (_configFaction >> "side");\
				};\
			};\
			diag_log("Tested faction :" + str _xla_side);\
			if (isNumber (_xla_config >> "XLA_arsenal_side")) then { \
				_xla_side = getNumber (_xla_config >> "XLA_arsenal_side");\
			};\
			diag_log("Tested XLA_arsenal_side :" + str _xla_side);\
			_xla_sideallowed = ( ((_virtualSideCargo find (str _xla_side)) >= 0) || ((_virtualSideCargo find "%ALL") >= 0) ) && !( ((_virtualSideBlacklist find (str _xla_side)) >= 0 ) || ((_virtualSideBlacklist find "%ALL") >= 0) );\
			diag_log "SIDEALLOWED: ";\
			diag_log _xla_sideallowed ;\
			if (_xla_sideallowed) then { \
				_XLA_condition = !((_xla_blist find _xla_item) >= 0 );\
			} else { \
				_XLA_condition = ((_xla_wlist find _xla_item) >= 0);\
			};\
		} else { \
			diag_log("Skipping side check. Setting to false");\
			_XLA_condition = false;\
		};\
	};\
	_XLA_condition;