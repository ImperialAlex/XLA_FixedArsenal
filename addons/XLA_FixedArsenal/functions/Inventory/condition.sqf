#define GETVIRTUALCARGO\
	_allowEquipped = _cargo getVariable ["XLA_fnc_arsenal_allowEquipped",true];\
	_virtualItemCargo = (missionnamespace call XLA_fnc_getVirtualItemCargo) +	(_cargo call XLA_fnc_getVirtualItemCargo);\
	_virtualMagazineCargo = (missionnamespace call XLA_fnc_getVirtualMagazineCargo) + (_cargo call XLA_fnc_getVirtualMagazineCargo);\
	_virtualBackpackCargo = (missionnamespace call XLA_fnc_getVirtualBackpackCargo) + (_cargo call XLA_fnc_getVirtualBackpackCargo);\
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
	};

#define CONDITION(LIST)	(_fullVersion || {"%ALL" in LIST} || {{_item == _x} count LIST > 0})