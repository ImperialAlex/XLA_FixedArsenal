
/*
	File: fn_invSlotsEmpty.sqf
	Author: Vilem

	Description:
	Converts inventory code (used in configs) to array with numbers for weapons and magazines (and their counts).
		
	Parameter(s):
	1: <scalar | empty> config code
	
	Returns:
	<array> items (slots) numbers
	
	
	Function:
	 input (result of): [1  +  4  + 12*  256  + 2* 4096  +  2  + 8* 16  + 12*131072]	 
	 output: [1,1,1,8,12,2,0,12]
	  - means: 1 x WeaponSlotPrimary, 1 x WeaponSlotHangun, ... , 12 x WeaponSlotInventory
	  
	 input: []
	 output: [0,0,0,0,0,0,0,0]

*/


//returned array gives numbers of following:
//mirrored from core config: cfg\Bin\cfgWeapons.hpp
#define WeaponSlotPrimary        1        // primary weapons
#define WeaponSlotHandGun        2        // HandGun
#define WeaponSlotSecondary        4        // secondary weapons
#define WeaponSlotHandGunItem        16 // HandGun magazines
#define WeaponSlotItem                256        // items
#define WeaponSlotBinocular        4096        // binocular
#define WeaponHardMounted        65536
#define WeaponSlotInventory 131072 // inventory items


_dividerArray = [WeaponSlotInventory, WeaponHardMounted,WeaponSlotBinocular,WeaponSlotItem,WeaponSlotHandGunItem, WeaponSlotSecondary, WeaponSlotHandGun, WeaponSlotPrimary];

//_dividerArray = [WeaponSlotHandGun,WeaponSlotSecondary,WeaponSlotHandGunItem,WeaponSlotItem,WeaponSlotBinocular,WeaponHardMounted,WeaponSlotInventory];

private["_return","_unit","_slotsCode","_slotsVar"];

if (count _this == 0) then
{
  _slotsVar = 0;  
}
else
{
  _slotsVar = _this select 0; //input code - coded slots and numbers for them
};

if (_slotsVar < 0) exitWith {textLogFormat ["INV_ Error: negative weaponSlots %1 for class: %2", _slotVar, _unit];[]};

_divider = _dividerArray select 0;
_return = [];

{
  private ["_remainder","_val"];

  _remainder = _slotsVar % _x; //get remainder 
  _val = round ((_slotsVar - _remainder) / _x); //get value coded by multiples of _x (without influence of other coded numbers (that are in remainder))
  _return = [_val] + _return;  
  _slotsVar = _slotsVar - (_val * _x); 
} forEach _dividerArray;

//textLogFormat ["INV_ %1 %2 %3" , [_class, _return, _slotsCode]];

_return
