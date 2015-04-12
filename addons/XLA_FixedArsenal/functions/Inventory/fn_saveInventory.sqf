/*
	Author: Karel Moricky

	Description:
	Save unit's loadout

	Parameter(s):
		0: OBJECT - unit of which loadout will be saved
		1: ARRAY in format
			0: NAMESPACE or GROUP or OBJECT - target in which namespace the loadout will be saved
			1: STRING - loadout name
		2 (Optional): ARRAY - custom params to be saved along the loadout (default: [])
		3 (Optional): BOOL - true to delete the loadout (default: false)

	Returns:
	ARRAY - saved value
*/

private ["_center","_path","_custom","_delete","_namespace","_name"];
_center = [_this,0,player,[objnull]] call bis_fnc_param;
_path = [_this,1,[],[[]]] call bis_fnc_param;
_custom = [_this,2,[],[[]]] call bis_fnc_param;
_delete = [_this,3,false,[false]] call bis_fnc_param;

_namespace = [_path,0,missionnamespace,[missionnamespace,grpnull,objnull]] call bis_fnc_paramin;
_name = [_path,1,"",[""]] call bis_fnc_paramin;

//--- Get magazines loaded to weapons
private ["_primaryWeaponMagazine","_secondaryWeaponMagazine","_handgunMagazine"];
_primaryWeaponMagazine = "";
_secondaryWeaponMagazine = "";
_handgunMagazine = "";
{
	if (count _x > 4 && {typename (_x select 4) == typename []}) then {
		private ["_weapon","_magazine"];
		_weapon = _x select 0;
		_magazine = _x select 4 select 0;
		switch _weapon do {
			case (primaryweapon _center): {_primaryWeaponMagazine = _magazine;};
			case (secondaryweapon _center): {_secondaryWeaponMagazine = _magazine;};
			case (handgunweapon _center): {_handgunMagazine = _magazine;};
		};
	};
} foreach weaponsitems _center;

//--- Get current values
private ["_export"];
_export = [
	/* 00 */	[uniform _center,uniformitems _center],
	/* 01 */	[vest _center,vestitems _center],
	/* 02 */	[backpack _center,backpackitems _center],
	/* 03 */	headgear _center,
	/* 04 */	goggles _center,
	/* 05 */	binocular _center,
	/* 06 */	[primaryweapon _center,_center weaponaccessories primaryweapon _center,_primaryWeaponMagazine],
	/* 07 */	[secondaryweapon _center,_center weaponaccessories secondaryweapon _center,_secondaryWeaponMagazine],
	/* 08 */	[handgunweapon _center,_center weaponaccessories handgunweapon _center,_handgunMagazine],
	/* 09 */	assigneditems _center - [binocular _center],
	/* 10 */	_custom
];

//--- Store
private ["_data","_nameID"];
_data = _namespace getvariable ["bis_fnc_saveInventory_data",[]];
_nameID = _data find _name;
if (_delete) then {
	if (_nameID >= 0) then {
		_data set [_nameID,objnull];
		_data set [_nameID + 1,objnull];
		_data = _data - [objnull];
	};
} else {
	if (_nameID < 0) then {
		_nameID = count _data;
		_data set [_nameID,_name];
	};
	_data set [_nameID + 1,_export];
};
_namespace setvariable ["bis_fnc_saveInventory_data",_data];
profilenamespace setvariable ["bis_fnc_saveInventory_profile",true];
if !(isnil {profilenamespace getvariable "bis_fnc_saveInventory_profile"}) then {saveprofilenamespace};

_export