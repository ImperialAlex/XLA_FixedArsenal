/*
	Author: ImperialAlex (Alexander)

	Description: 
	Construct a white/blacklist for given types, optionally from an ammobox and/or unit.

	Parameter(s):
		0: ARRAY of INTEGERS - what types to add. (0 = item, 1 = Magazine, 2 = Backpack, 3 = Weapon, 4 = Side)
		1 (Optional): OBJECT -  'ammobox' object containing virtualCargo/virtualBlacklist. (default: objNull)
		2 (Optional): BOOL - allowEquipped toggle. (default: true)
		3 (Optional): OBJECT - unit to use as target for equipment check. (default: Player)

	Returns:
	[whitelist,blacklist]
*/

	private ["_item","_cargo","_fullVersion","_allowEquipped","_center"];
	_types = [_this,0,[],[[]],[0,1,2,3,4,5]] call bis_fnc_param;
	_cargo = [_this,1,objNull,[objNull]] call bis_fnc_param;
	_allowEquipped = [_this,2,true,[true]] call bis_fnc_param;
	_center = [_this,3,player,[player]] call bis_fnc_param;


	/* Input cleaning */
	_cargomode = _cargo != objNull;
	if (_center == objNull) then { _allowEquipped = false; };
	// Remove invalid type indices.

	// !!! This currently allows mixing "side" and "real" classname returning things. not a good idea!
	_cleanTypes = [];
	{
		if (_x <= 4) then {	
			_cleanTypes pushBack _x;
		} else { 
			["Invalid type index (%1) in input",_x] call bis_fnc_error;
		};
	} forEach _types;
	_types = _cleanTypes;

	/* Construct Whitelist/Blacklist */

	_virtualCargo = [];
	_virtualBlacklist = [];

	{
	  switch (_x) do {

		  case 0: { // ITEM
		  	_virtualCargo append (missionnamespace call XLA_fnc_getVirtualItemCargo);
		  	_virtualCargo append (_cargo call XLA_fnc_getVirtualItemCargo);
		  	_virtualBlacklist append (missionnamespace call XLA_fnc_getVirtualItemBlacklist);
		  	_virtualBlacklist append (_cargo call XLA_fnc_getVirtualItemBlacklist);

		  	if (_allowEquipped) then {
						_virtualCargo append (items _center);
						_virtualCargo append (assigneditems _center);
						_virtualCargo append (primaryweaponitems _center);
						_virtualCargo append (secondaryweaponitems _center);
						_virtualCargo append (handgunitems _center);
						_virtualCargo append [uniform _center,vest _center,headgear _center,goggles _center];

						// We need to whitelist the attachments of the currently equipped weapon
						{
							{
								private ["_item"];
								_item = gettext (_x >> "item");
								if !(_item in _virtualCargo) then {_virtualCargo pushBack _item;};
							} foreach ((configfile >> "cfgweapons" >> _x >> "linkeditems") call bis_fnc_returnchildren);
						} foreach (weapons _center + [binocular _center]);
				};
			};

		  case 1: { // MAGAZINE
		  	_virtualCargo append (missionnamespace call XLA_fnc_getVirtualMagazineCargo);
		  	_virtualCargo append (_cargo call XLA_fnc_getVirtualMagazineCargo);
		  	_virtualBlacklist append (missionnamespace call XLA_fnc_getVirtualMagazineBlacklist);
		  	_virtualBlacklist append (_cargo call XLA_fnc_getVirtualMagazineBlacklist);

		  	if (_allowEquipped) then {
		  		_virtualCargo append (magazines _center);
		  	};
			};

		  case 2: { // BACKPACK
		  	_virtualCargo append (missionnamespace call XLA_fnc_getVirtualBackpackCargo);
		  	_virtualCargo append (_cargo call XLA_fnc_getVirtualBackpackCargo);
		  	_virtualBlacklist append (missionnamespace call XLA_fnc_getVirtualBackpackBlacklist);
		  	_virtualBlacklist append (_cargo call XLA_fnc_getVirtualBackpackBlacklist);

		  	if (_allowEquipped) then {
		  		_virtualCargo pushBack (backpack _center);
		  	};
			};

			case 3: { // WEAPON
		  	_virtualBlacklist append (missionnamespace call XLA_fnc_getVirtualWeaponBlacklist);
		  	_virtualBlacklist append (_cargo call XLA_fnc_getVirtualWeaponBlacklist);

		  	// When you add a weapon to the whitelist, all it's attachments (if any) are also added to the whitelist.
				// This is not true for blacklisting. (blacklisting a weapon doesn't blacklist its attachments)
				{
					_weapon = _x;
					_virtualCargo pushBack _weapon;					
					{
						private ["_item"];
						_item = gettext (_x >> "item");
						if !(_item in _virtualCargo) then {_virtualCargo pushBack _item;};
					} foreach ((configfile >> "cfgweapons" >> _x >> "linkeditems") call bis_fnc_returnchildren);

				} foreach ((missionnamespace call XLA_fnc_getVirtualWeaponCargo) + (_cargo call XLA_fnc_getVirtualWeaponCargo));

				if (_allowEquipped) then {
					_virtualCargo append weapons _center;
					_virtualCargo pushBack (binocular _center);
				};
		  };

		  case 4: { // SIDE
		  	_virtualCargo append (missionnamespace call XLA_fnc_getVirtualSideCargo);
		  	_virtualCargo append (_cargo call XLA_fnc_getVirtualSideCargo);
		  	_virtualBlacklist append (missionnamespace call XLA_fnc_getVirtualSideBlacklist);
		  	_virtualBlacklist append (_cargo call XLA_fnc_getVirtualSideBlacklist);
		  }; 

		  default { ["Invalid type index (%1) found while trying to construct whitelist/blacklist", _x] call bis_fnc_error;}		  
		}; //end of switch statement

	} forEach _types;

	[_virtualCargo,_virtualBlacklist];