/*
	Author: Karel Moricky

	Description:
	Delete loadout saved using BIS_fnc_saveInventory

	Parameter(s):
		0: OBJECT - unit of which loadout will be saved
		1: ARRAY in format
			0: NAMESPACE or GROUP or OBJECT - target in which namespace the loadout is saved
			1: STRING - loadout name

	Returns:
	BOOL
*/


_center = [_this,0,player,[objnull]] call bis_fnc_param;
_path = [_this,1,[],[[]]] call bis_fnc_param;

[_center,_path,true] call bis_fnc_saveInventory;
true