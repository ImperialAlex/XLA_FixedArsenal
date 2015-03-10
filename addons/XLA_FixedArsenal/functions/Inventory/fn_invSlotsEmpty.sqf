
/*
	File: fn_invSlotsEmpty.sqf
	Author: Vilem

	Description:
	Returns empty inventory slots of given unit.
	
	Parameter(s):
	1: <object> unit 
	
	Returns:
	<array> numbers of empty slots
		
	Example:
	 [player] call BIS_fnc_invSlotsEmpty;	 	 
	 -> [1,1,1,8,12,2,0,12] (means: 1 x WeaponSlotPrimary, 1 x WeaponSlotHangun, ... , 12 x WeaponSlotInventory - see BIS_FNC_invCodeToArray for code definition)
*/

private["_return","_unit","_slotsCode","_slotsVar","_inv","_slotsTotal","_class"];
_unit = _this select 0;

//--Get total slots for unit----------

if ((typeName _unit) != "OBJECT") exitWith {textLogFormat ["INV_ Error: BIS_FNC_invSlotsEmpty - 1st parameter must be unit! %1", _this];[]};
_class = (configfile >> "cfgvehicles" >> (typeOf _unit)); 

if (!isClass _class) exitWith {textLogFormat ["INV_ Error: cannot get config cfgVehicles class of vehicle: %1", [_unit,_class]];};

if (isNumber (_class >> "WeaponSlots")) then {_slotsVar = getNumber (_class >> "WeaponSlots");}
else 
{
  if (isText (_class >> "WeaponSlots")) then 
  {_slotsCode = getText (_class >> "WeaponSlots"); _slotsVar = call compile _slotsCode;} 
  else 
  {textLogFormat ["INV_ Error: no or bad 'WeaponSlots' entry for given vehicle: %1", [_unit,_class]];};
};

//textLogFormat ["INV_ SLOTS EMPTY _this _slotVar _unit _class %1 ", [_this, _slotsVar, _unit, _class]];

if (_slotsVar < 0) exitWith {textLogFormat ["INV_ Error: negative weaponSlots %1 for class: %2", _slotVar, _unit];[]};
if (_slotsVar == 0) exitWith {[]};

_slotsTotal = [_slotsVar] call BIS_fnc_invCodeToArray;


//--Get seized slots-------------------
private ["_slotsSeized"];
_slotsSeized = [];

_inv = [_unit] call BIS_fnc_inv;
_slotsSeized = ([] call BIS_fnc_invSlotType);  //fill zeros in _slotsSeized;

{//for each item in inventory: get slots it is taking & add to _slotsSeized  
  _slotsSeized = [_slotsSeized, ([_x] call BIS_fnc_invSlotType)] call BIS_fnc_vectorAdd;                        
} forEach ([_unit] call BIS_fnc_inv);


//--Substract seized from total--------
_return = [_slotsSeized, _slotsTotal] call BIS_fnc_vectorDiff;
_return
