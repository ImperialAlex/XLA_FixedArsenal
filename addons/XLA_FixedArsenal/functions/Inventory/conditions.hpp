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
	_virtualItemCargo =\
		(missionnamespace call XLA_fnc_getVirtualItemCargo) +\
		(_cargo call XLA_fnc_getVirtualItemCargo);\
	_virtualWeaponCargo = [];\
	{\
		_weapon = _x;\
		_virtualWeaponCargo set [count _virtualWeaponCargo,_weapon];\
		{\
			private ["_item"];\
			_item = gettext (_x >> "item");\
			if !(_item in _virtualItemCargo) then {_virtualItemCargo set [count _virtualItemCargo,_item];};\
		} foreach ((configfile >> "cfgweapons" >> _x >> "linkeditems") call bis_fnc_returnchildren);\
	} foreach ((missionnamespace call XLA_fnc_getVirtualWeaponCargo) + (_cargo call XLA_fnc_getVirtualWeaponCargo));\
	_virtualMagazineCargo = (missionnamespace call XLA_fnc_getVirtualMagazineCargo) + (_cargo call XLA_fnc_getVirtualMagazineCargo);\
	_virtualSideCargo = (missionnamespace call XLA_fnc_getVirtualSideCargo) + (_cargo call XLA_fnc_getVirtualSideCargo);\
	_virtualBackpackCargo = (missionnamespace call XLA_fnc_getVirtualBackpackCargo) + (_cargo call XLA_fnc_getVirtualBackpackCargo);

#define GETVIRTUALBLACKLIST\
	_virtualItemBlacklist =\
		(missionnamespace call XLA_fnc_GetVirtualItemBlacklist) +\
		(_cargo call XLA_fnc_getVirtualItemBlacklist);\
	_virtualWeaponBlacklist = [];\
	{\
		_weapon = _x;\
		_virtualWeaponBlacklist set [count _virtualWeaponBlacklist,_weapon];\
		{\
			private ["_item"];\
			_item = gettext (_x >> "item");\
			if !(_item in _virtualItemBlacklist) then {_virtualItemBlacklist set [count _virtualItemBlacklist,_item];};\
		} foreach ((configfile >> "cfgweapons" >> _x >> "linkeditems") call bis_fnc_returnchildren);\
	} foreach ((missionnamespace call XLA_fnc_getVirtualWeaponBlacklist) + (_cargo call XLA_fnc_getVirtualWeaponBlacklist));\
	_virtualMagazineBlacklist = (missionnamespace call XLA_fnc_getVirtualMagazineBlacklist) + (_cargo call XLA_fnc_getVirtualMagazineBlacklist);\
	_virtualSideBlacklist = (missionnamespace call XLA_fnc_getVirtualSideBlacklist) + (_cargo call XLA_fnc_getVirtualSideBlacklist);\
	_virtualBackpackBlacklist = (missionnamespace call XLA_fnc_getVirtualBackpackBlacklist) + (_cargo call XLA_fnc_getVirtualBackpackBlacklist);

// ADVANCED CONDITION:
#define GETCONDITION(WLIST,WSIDES,BLIST,BSIDES,ITEM,CONFIG)\
	_item_to_test = ITEM;\
	_condition = false;\
	if (!_fullVersion) then { \
		_sideAllowed = false;\
		_itemSide = NO_SIDE;\
		{ \
			_config = (configFile / _x / _item_to_test );\
			if (isNumber (_config >> "side")) then { \
				_itemSide = getNumber (_config >> "side");\
			};\
			_factionstring = getText(_config >> "faction");\
			if (_factionstring != "" && _factionstring != "Default") then { \
				_configFaction = (configFile / "CfgFactionClasses" / _factionstring);\
				if (isNumber (_configFaction >> "side")) then { \
					_itemSide = getNumber (_configFaction >> "side"); \
				};\
			};\
			if (isNumber (_config >> "XLA_arsenal_side")) then { \
				_itemSide = getNumber (_config >> "XLA_arsenal_side");\
			};\
			_sideAllowed = (_sideAllowed || ( ( ((WSIDES find (str _itemSide)) >= 0) || ((WSIDES find "ALL") >= 0) ) && !( ((BSIDES find _itemSide) >= 0 ) || ((BSIDES find "ALL") >= 0) ) ));\
		} forEach CONFIG ;\
		if (_sideAllowed) then { \
			_condition = !((BLIST find _item_to_test) >= 0 );\
		} else { \
			_condition = ((WLIST find _item_to_test) >= 0);\
		};\
	} else { \
		_condition = true;\
	};\
	_condition;	