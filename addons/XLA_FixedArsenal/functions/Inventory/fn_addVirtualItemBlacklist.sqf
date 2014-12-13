/*
	Author: Karel Moricky
	Adapted by Alexander (ImperialAlex)

	Description:
	Add virtual items to the blacklist of an object (e.g., ammo box).
	Intended for usage together with XLA_fnc_arsenal

	Parameter(s):
		0: OBJECT - objct to which items will be added
		1: STRING or ARRAY of STRINGs - item class(es) to be added 
		2 (Optional): BOOL - true to add items globally (default: false)
		3 (Optional): BOOL - true to add Arsenal action (default: true)

	Returns:
	ARRAY of ARRAYs - all virtual items within the object's space in format [<items>,<weapons>,<magazines>,<backpacks>]

*/

private ["_object","_classes","_isGlobal","_add","_type","_initAction","_blist","_listArray","_save"];
_object = [_this,0,missionnamespace,[missionnamespace,objnull]] call bis_fnc_param;
_classes = [_this,1,[],["",true,[]]] call bis_fnc_param;
_isGlobal = [_this,2,false,[false]] call bis_fnc_param;
_initAction = [_this,3,true,[true]] call bis_fnc_param;
_add = [_this,4,1,[1]] call bis_fnc_param;
_type = [_this,5,0,[0]] call bis_fnc_param;

//--- Get blacklist
_blist = _object getvariable ["XLA_fnc_addVirtualItemBlacklist_list",[[],[],[],[]]];
_listArray = _blist select _type;
if (_add == 0) exitwith {_listArray};

//--- Modify blacklist
_save = false;
if (typename _classes != typename []) then {_classes = [_classes]};
if (count _classes == 0 && _add < 0) then {
	_listArray = [];
	_save = true;
} else {
	{
		//--- Use config classnames (conditions are case sensitive)
		private ["_class"];
		_x = [_x,0,"",["",true]] call bis_fnc_paramin;
		if (typename _x == typename true) then {_x = "%ALL";};
		_class = switch _type do {
			case 0;
			case 1: {configname (configfile >> "cfgweapons" >> _x);};
			case 2: {configname (configfile >> "cfgmagazines" >> _x);};
			case 3: {configname (configfile >> "cfgvehicles" >> _x);};
			default {""};
		};
		if (_class == "") then {_class = _x;};
		if (_add > 0) then {
			if (!(_class in _listArray) && (_class != "" || _class == "%ALL")) then {_listArray set [count _listArray,_class];};
		} else {
			_listArray = _listArray - [_class];
		};
		_save = true;
	} foreach _classes;
};
_blist set [_type,_listArray];

if (_save) then {
	if (typename _object == typename missionnamespace) then {
		_object setvariable ["XLA_fnc_addVirtualItemBlacklist_list",_blist];
		publicvariable "XLA_fnc_addVirtualItemBlacklist_list";
	} else {
		_object setvariable ["XLA_fnc_addVirtualItemBlacklist_list",_blist,_isGlobal];
	};
};

if (_initAction && typename _object == typename objnull) then {
	if ({count _x > 0} count _blist > 0) then {
		//--- Init arsenal
		["AmmoboxInit",_object] call XLA_fnc_arsenal;
	} else {
		//--- Terminate arsenal
		["AmmoboxExit",_object] call XLA_fnc_arsenal;
	};
};

_listArray