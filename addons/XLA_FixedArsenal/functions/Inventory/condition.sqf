#define GETVIRTUALCARGO\
	_virtualItemCargo =\
		(missionnamespace call XLA_fnc_getVirtualItemCargo) +\
		(_cargo call XLA_fnc_getVirtualItemCargo) +\
		items _center +\
		assigneditems _center +\
		primaryweaponitems _center +\
		secondaryweaponitems _center +\
		handgunitems _center +\
		[uniform _center,vest _center,headgear _center,goggles _center];\
	_virtualWeaponCargo = [];\
	{\
		_weapon = _x call XLA_fnc_baseWeapon;\
		_virtualWeaponCargo set [count _virtualWeaponCargo,_weapon];\
		{\
			private ["_item"];\
			_item = gettext (_x >> "item");\
			if !(_item in _virtualItemCargo) then {_virtualItemCargo set [count _virtualItemCargo,_item];};\
		} foreach ((configfile >> "cfgweapons" >> _x >> "linkeditems") call bis_fnc_returnchildren);\
	} foreach ((missionnamespace call XLA_fnc_getVirtualWeaponCargo) + (_cargo call XLA_fnc_getVirtualWeaponCargo) + weapons _center + [binocular _center]);\
	_virtualMagazineCargo = (missionnamespace call XLA_fnc_getVirtualMagazineCargo) + (_cargo call XLA_fnc_getVirtualMagazineCargo) + magazines _center;\
	_virtualBackpackCargo = (missionnamespace call XLA_fnc_getVirtualBackpackCargo) + (_cargo call XLA_fnc_getVirtualBackpackCargo) + [backpack _center];

#define CONDITION(LIST)	(_fullVersion || {"%ALL" in LIST} || {{_item == _x} count LIST > 0})