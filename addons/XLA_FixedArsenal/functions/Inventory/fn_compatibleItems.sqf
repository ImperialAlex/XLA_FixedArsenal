/*
	Author: Karel Moricky

	Description:
	Return all compatible weapon attachments
	
	Parameter(s):
		0: STRING - weapon class
	
	Returns:
	ARRAY of STRINGs
*/

_compatibleItems = [];

if (!isNil "asdg_fnc_compatibleItems") then {

	_weapon = [_this,0,"",[""]] call bis_fnc_param;

	_compatibleItems = _weapon call asdg_fnc_compatibleItems;

} else { 

	private ["_weapon","_cfgWeapon"];
	_weapon = [_this,0,"",[""]] call bis_fnc_param;
	_cfgWeapon = configfile >> "cfgweapons" >> _weapon;
	if (isClass _cfgWeapon) then {
		private ["_compatibleItems"];
		_compatibleItems = [];
		{
			private ["_cfgCompatibleItems"];
			_cfgCompatibleItems = _x >> "compatibleItems";
			if (isarray _cfgCompatibleItems) then {
				_compatibleItems append getarray _cfgCompatibleItems;
			} else {
				if (isclass _cfgCompatibleItems) then {
					{_compatibleItems pushback configname _x;} foreach configproperties [_cfgCompatibleItems,"isnumber _x"];
				};
			};
		} foreach configproperties [_cfgWeapon >> "WeaponSlotsInfo","isclass _x"];
		_compatibleItems
	} else {
		if (_weapon != "") then {["'%1' not found in CfgWeapons",_weapon] call bis_fnc_error;};
		[]
	};

};

_compatibleItems;
