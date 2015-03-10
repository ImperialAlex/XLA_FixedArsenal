/*
	Author: Karel Moricky

	Description:
	Add virtual weapons to an object (e.g., ammo box).
	Virtual items can be selected in the Arsenal.

	Parameter(s):
		0: OBJECT - objct to which weapons will be added
		1: STRING or ARRAY of STRINGs - weapon class(es) to be added
		2 (Optional): BOOL - true to add weapons globally (default: false)
		3 (Optional): BOOL - true to add Arsenal action (default: true)

	Returns:
	ARRAY of ARRAYs - all virtual items within the object's space in format [<items>,<weapons>,<magazines>,<backpacks>,<sides>]
*/

private ["_object","_classes","_isGlobal","_initAction"];
_object = [_this,0,missionnamespace,[missionnamespace,objnull]] call bis_fnc_param;
_classes = [_this,1,[],["",true,[]]] call bis_fnc_param;
_isGlobal = [_this,2,false,[false]] call bis_fnc_param;
_initAction = [_this,3,true,[true]] call bis_fnc_param;
[_object,_classes,_isGlobal,_initAction,1,1] call XLA_fnc_addVirtualItemCargo;