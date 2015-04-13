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
_weapon = [_this,0,"",[""]] call bis_fnc_param;

if (!isNil "asdg_fnc_compatibleItems") then {

	_compatibleItems = _weapon call asdg_fnc_compatibleItems;

} else { 

	_compatibleItems = _weapon call bis_fnc_compatibleItems;

};

_compatibleItems;
