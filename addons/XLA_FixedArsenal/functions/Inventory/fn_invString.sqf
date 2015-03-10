
/*
	File: fn_inv.sqf
	Author: Vilem

	Description:
	Returns inventory contents of given vehicle (unit).
	
	Note: for vehicles it returns mounted gun and its ammo, not cargo weapons and ammo.

	Parameter(s):
	1: <object> vehicle or unit 
	
	Returns:
	<array> weapons and magazines
*/

//putWeaponPool object

private["_return","_unit"];
_unit = _this select 0;

_return = (weapons _unit) + (magazines _unit);
_return