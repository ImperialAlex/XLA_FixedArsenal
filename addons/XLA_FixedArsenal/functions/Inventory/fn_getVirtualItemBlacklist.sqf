/*
	Author: Karel Moricky

	Description:
	Get virtual items to an object (e.g., ammo box).
	Virtual items can be selected in the Arsenal.

	Parameter(s):
		0: OBJECT

	Returns:
	ARRAY of ARRAYs - all virtual items within the object's space in format [<items>,<weapons>,<magazines>,<backpacks>,<sides>]
*/

private ["_object"];
_object = [_this,0,missionnamespace,[missionnamespace,objnull]] call bis_fnc_param;
[_object,[],false,false,0,0] call XLA_fnc_addVirtualItemBlacklist;