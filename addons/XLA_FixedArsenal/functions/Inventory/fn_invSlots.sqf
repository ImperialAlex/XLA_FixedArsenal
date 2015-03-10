
/*
	File: fn_invSlots.sqf
	Author: Vilem

	Description:
	Returns config inventory slots of given unit (total numbers of available slots in array).
	
	Parameter(s):
	1: <object> unit 
	
	Returns:
	<array> array with total available slots of all types that are given by config
	
	
	Function:
	 input: [player] call BIS_fnc_invSlotsEmpty;
	 partial result - from config (class "USMC_rifleman"):	weaponSlots = "1  +  4  + 12*  256  + 2* 4096  +  2  + 8* 16  + 12*131072"
	 output: [1,1,1,8,12,2,0,12]
	  - means: 1 x WeaponSlotPrimary, 1 x WeaponSlotHangun, ... , 12 x WeaponSlotInventory

*/

private["_return","_unit","_slotsCode","_slotsVar", "_class"];
_unit = _this select 0;

_class = (configfile >> "cfgvehicles" >> typeOf _unit); 

if (!isClass _class) exitWith {textLogFormat ["INV_ Error: cannot get config cfgVehicles class of vehicle: %1", [_unit,_class]];};

if (isNumber (_class >> "WeaponSlots")) then {_slotsVar = getNumber (_class >> "WeaponSlots");}
  else 
  {
  if (isText (_class >> "WeaponSlots")) then 
    {_slotsCode = getText (_class >> "WeaponSlots"); _slotsVar = call compile _slotsCode;} 
    else 
    {textLogFormat ["INV_ Error: no or bad 'WeaponSlots' entry for given vehicle: %1", [_unit,_class]];};
  };

if (_slotsVar < 0) exitWith {textLogFormat ["INV_ Error: negative weaponSlots %1 for class: %2", _slotVar, _unit];[]};
if (_slotsVar == 0) exitWith {[]};


_return = [_slotsVar] call BIS_fnc_invCodeToArray;
_return
