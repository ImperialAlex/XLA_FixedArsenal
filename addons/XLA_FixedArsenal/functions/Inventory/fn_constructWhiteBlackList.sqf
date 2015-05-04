/*
	Author: ImperialAlex (Alexander)

	Description: 
	Construct a white/blacklist for given types, optionally from an ammobox and/or unit.

	Parameter(s):		
		0: OBJECT -  'ammobox' object containing virtualCargo/virtualBlacklist. (default: objNull)
		1 (Optional): BOOL - allowEquipped toggle. (default: false)
		2 (Optional): OBJECT - unit to use as target for equipment check. (default: objNull)

	Example: 
	[ammobox,false] call xla_fnc_constructWhiteBlacklist

	Returns:
	[whitelist,blacklist]
*/

	private ["_cargo","_allowEquipped","_center"];
	_cargo = [_this,0,objNull,[objNull]] call bis_fnc_param;
	_allowEquipped = [_this,1,true,[true]] call bis_fnc_param;
	_center = [_this,2,objNull,[objNull]] call bis_fnc_param;

	private ["_DEBUG"];
	_DEBUG = if (!isNil "XLA_FNC_ARSENAL_DEBUG") then {XLA_FNC_ARSENAL_DEBUG} else {false};
	
	if (_DEBUG) then { 
		diag_log format ["CONSTRUCT_WHITELIST: _cargo: %1",_cargo];
		diag_log format ["CONSTRUCT_WHITELIST: _allowEquipped: %1",_allowEquipped];
		diag_log format ["CONSTRUCT_WHITELIST: _center: %1",_center];
	};

	/* Input cleaning */	
	if (_center == objNull) then { _allowEquipped = false; };

	/* Construct Whitelist/Blacklist */
	_list = [ [[],[],[],[],[]] , [[],[],[],[],[]] ];
	// [wlist,blist]
	// format [<items>,<weapons>,<magazines>,<backpacks>,<sides>]
	// wlist indices: 0 = items,1 = weapons, 2 = magazines,3 = backpacks,4 = sides

	private ["_virtualItemCargo","_virtualItemBlacklist","_virtualWeaponCargo",
	"_virtualWeaponBlacklist","_virtualMagazineCargo","_virtualMagazineBlacklist","_virtualBackpackCargo","_virtualBackpackBlacklist","_virtualSideCargo","_virtualSideBlacklist"];
	_virtualItemCargo =	((_list select 0) select 0);
	_virtualItemBlacklist = ((_list select 1) select 0);
	_virtualWeaponCargo =	((_list select 0) select 1);
	_virtualWeaponBlacklist = ((_list select 1) select 1);
	_virtualMagazineCargo =	((_list select 0) select 2);
	_virtualMagazineBlacklist = ((_list select 1) select 2);
	_virtualBackpackCargo =	((_list select 0) select 3);
	_virtualBackpackBlacklist = ((_list select 1) select 3);
	_virtualSideCargo =	((_list select 0) select 4);
	_virtualSideBlacklist = ((_list select 1) select 4);


	/* ITEM */
  _virtualItemCargo append (missionnamespace call XLA_fnc_getVirtualItemCargo);
  _virtualItemCargo append (_cargo call XLA_fnc_getVirtualItemCargo);
  _virtualItemBlacklist append (missionnamespace call XLA_fnc_getVirtualItemBlacklist);
  _virtualItemBlacklist append (_cargo call XLA_fnc_getVirtualItemBlacklist);

	if (_allowEquipped) then {		  			
		_virtualItemCargo append (items _center);
		_virtualItemCargo append (assigneditems _center);
		_virtualItemCargo append (primaryweaponitems _center);
		_virtualItemCargo append (secondaryweaponitems _center);
		_virtualItemCargo append (handgunitems _center);
		_virtualItemCargo append [uniform _center,vest _center,headgear _center,goggles _center];

		// We need to whitelist the attachments of the currently equipped weapon
		{
			{
				private ["_item"];
				_item = gettext (_x >> "item");
				if !(_item in _virtualItemCargo) then {_virtualItemCargo pushBack _item;};
			} foreach ((configfile >> "cfgweapons" >> _x >> "linkeditems") call bis_fnc_returnchildren);
		} foreach (weapons _center + [binocular _center]);
	};

	/* WEAPON */
	_virtualWeaponBlacklist append (missionnamespace call XLA_fnc_getVirtualWeaponBlacklist);
	_virtualWeaponBlacklist append (_cargo call XLA_fnc_getVirtualWeaponBlacklist);

	// When you add a weapon to the whitelist, all it's attachments (if any) are also added to the whitelist.
	// This is not true for blacklisting. (blacklisting a weapon doesn't blacklist its attachments)
	{
		_virtualWeaponCargo pushBack _x;					
		{
			private ["_item"];
			_item = gettext (_x >> "item");
			if !(_item in _virtualItemCargo) then {_virtualItemCargo pushBack _item;};
		} foreach ((configfile >> "cfgweapons" >> _x >> "linkeditems") call bis_fnc_returnchildren);

	} foreach ((missionnamespace call XLA_fnc_getVirtualWeaponCargo) + (_cargo call XLA_fnc_getVirtualWeaponCargo));

	if (_allowEquipped) then {
		_virtualWeaponCargo append weapons _center;
		_virtualWeaponCargo pushBack (binocular _center);
	};

  /* MAGAZINE */
	_virtualMagazineCargo append (missionnamespace call XLA_fnc_getVirtualMagazineCargo);
	_virtualMagazineCargo append (_cargo call XLA_fnc_getVirtualMagazineCargo);
	_virtualMagazineBlacklist append (missionnamespace call XLA_fnc_getVirtualMagazineBlacklist);
	_virtualMagazineBlacklist append (_cargo call XLA_fnc_getVirtualMagazineBlacklist);

	if (_allowEquipped) then {
		_virtualMagazineCargo append (magazines _center);
	};

  /* BACKPACK */
	_virtualBackpackCargo append (missionnamespace call XLA_fnc_getVirtualBackpackCargo);
	_virtualBackpackCargo append (_cargo call XLA_fnc_getVirtualBackpackCargo);
	_virtualBackpackBlacklist append (missionnamespace call XLA_fnc_getVirtualBackpackBlacklist);
	_virtualBackpackBlacklist append (_cargo call XLA_fnc_getVirtualBackpackBlacklist);

	if (_allowEquipped) then {
		_virtualBackpackCargo pushBack (backpack _center);
	};
	
  /* SIDE */
	_virtualSideCargo append (missionnamespace call XLA_fnc_getVirtualSideCargo);
	_virtualSideCargo append (_cargo call XLA_fnc_getVirtualSideCargo);
	_virtualSideBlacklist append (missionnamespace call XLA_fnc_getVirtualSideBlacklist);
	_virtualSideBlacklist append (_cargo call XLA_fnc_getVirtualSideBlacklist);

	// Return the entire list
	if (_DEBUG) then {
		diag_log format ["CONSTRUCT_WHITELIST: _list: %1",_list];
	};
	_list;