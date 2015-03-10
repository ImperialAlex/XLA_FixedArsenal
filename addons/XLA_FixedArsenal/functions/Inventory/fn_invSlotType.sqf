
/*
	File: fn_invSlotType.sqf
	Author: Vilem

	Description:
	Returns slots taken by given item (given in config).

	Parameter(s):
	1: <string | config class | empty> inventory item given by name or by config class
	
	Returns:
	<array> array - numbers representing slots taken by given item (one item can take more slots of same or different type)
	              - empty if type 0 or not found
*/

if (count _this == 0) exitWith {[] call BIS_FNC_invCodeToArray}; //fill slot array with zeroes

private["_return","_type","_item"];
_item = _this select 0;
_type = 0;

if ((typeName _item) == "CONFIG") then 
{//received config class
  if (isClass (_item)) then 
  {
    _type = getNumber (_item >> "type");
    //textLogFormat ["INV_ fn_invSlotType class: %1" , [_item, _type]];
  };  
}
else
{//received string - try to find type by reading from config
  
  if (isClass (configfile >> "cfgweapons" >> (_item))) then {_type = getNumber (configfile >> "cfgweapons" >> (_item) >> "type")};
  if (_type == 0) then
  {//try magazines if nothing found in weapons
    if (isClass (configfile >> "cfgmagazines" >> (_item))) then {_type = getNumber (configfile >> "cfgmagazines" >> (_item) >> "type")};
  };
};

//textLogFormat ["INV_ %1" , [_item, _type]];

if (_type ==0) exitWith {[]}; //empty array if no type found or type is 0

_return = [_type] call BIS_FNC_invCodeToArray;
_return