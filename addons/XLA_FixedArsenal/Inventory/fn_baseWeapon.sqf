/*
	Author: Karel Moricky

	Description:
	Return base weapon (i.e., weapon without any attachments)
	
	Parameter(s):
		0: STRING - weapon class
	
	Returns:
	STRING - weapon class
*/

private ["_class","_cfg"];
_class = [_this,0,"",[""]] call bis_fnc_param;

//--- Incorrect weapon class - terminate
_cfg = configfile >> "cfgweapons" >> _class;
if !(isclass _cfg) exitwith {
	if (_class != "") then {["Class '%1' not found in CfgWeapons",_class] call bis_fnc_error};
	_class
};

//--- Get manual base weapon
private ["_base"];
_base = gettext (_cfg >> "baseWeapon");
if (isclass (configfile >> "cfgweapons" >> _base)) exitwith {_base};

//--- Get first parent without any attachments
private ["_return"];
_return = _class;
{
	if (count (_x >> "linkeditems") == 0) exitwith {_return = configname _x;};
} foreach (_cfg call bis_Fnc_returnparents);
_return