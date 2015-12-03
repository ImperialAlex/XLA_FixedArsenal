scriptName "fn_unitHeadgear: Headgear and face wear";
/*
	Author: Julien VIDA <@tom_48_97>

	Description:
	This function is used for randomizing headgear and facewear of a character.
	https://community.bistudio.com/wiki/BIS_fnc_unitHeadgear

	If the randomization is disabled, only strings parameters, will be processed, array will be ignored and considered as false.

	Parameter(s):
	_this select 0: Object - Unit
	_this select 1: Headgear
		Array - Headgear list with individual probability
		Bool - false, change nothing to the headgear
		String - valid Headgear class or a valid class from CfgUnitTemplates (mission config file)
	_this select 2: Facewear
		Array - facewear list with individual probability
		Bool - false, change nothing to the facewear
		String - valid facewear class

	Returns:
	Bool - True when done

	Examples:
	1) Do nothing because the Headgear and the face wear will be considered as False
	result = [this] call BIS_fnc_unitHeadgear;

	2) Use the default randomization (as defined in the config)
	result = [this, [], []] call BIS_fnc_unitHeadgear; // Headgear and face wear
	result = [this, []] call BIS_fnc_unitHeadgear // Headgear only
	result = [this, nil, []] // Face wear only. Note that nil can be replaced by false

	3) Usage of classes defined in the CfgUnitTemplates (mission config file). It will use the headgearList[] and facewearList[]
	result = [this, "MyClassName"] call BIS_fnc_unitHeadgear

*/
#define SELF BIS_fnc_unitHeadgear
#define NO_HEADGEAR "none"

private ["_unit","_head","_face"];
_unit = param [0, objNull, [objNull]];
_head = param [1, false, [[], false, ""]];
_face = param [2, false, [[], false, ""]];

if !(local _unit) exitWith {false};
/*---------------------------------------------------------------------------
	Prepare some vars
---------------------------------------------------------------------------*/
private ["_unitType","_unit","_skipRandomization","_headgearToUse","_faceToUse"];
_unitType = typeOf _unit;
_skipRandomization = ({(_unitType isEqualTo _x) || (_unitType isKindOf _x) || (format ["%1", _unitType] isEqualTo _x) || format ["%1", _unit] isEqualTo _x} count (getArray(missionConfigfile >> "disableRandomization")) > 0 || !(_unit getVariable ["BIS_enableRandomization", true]));

/*---------------------------------------------------------------------------
	Headgear change
---------------------------------------------------------------------------*/
if !(_head isEqualTo false) then
{
	_headgearToUse = "";
	private ["_headgearList","_headgearPool","_probabilityPool"];
	if (typeName _head == "ARRAY" && {!_skipRandomization}) then
	{
		if (count _head >= 1) then
		{
			_headgearList = _head;
		}
		else
		{
			_headgearList = getArray(configFile >> "CfgVehicles" >> _unitType >> "headgearList");
		};
		if (count _headgearList >= 2 && {typeName (_headgearList select 1) == "SCALAR"}) then
		{
			_headgearPool = [];
			_probabilityPool = [];
			for "_i" from 0 to (count _headgearList -1) step 2 do
			{
				_headgearPool append [_headgearList select _i];
				_probabilityPool append [_headgearList select (_i +1)];
			};
			_headgearToUse = [_headgearPool, _probabilityPool] call BIS_fnc_selectRandomWeighted;
		}
		else
		{
			if (count _headgearList > 0) then
			{
				_headgearPool = _headgearList;
			}
			else
			{
				_probabilityPool = getnumber (configFile >> "cfgvehicles" >> _unitType >> "headgearProbability");
				_headgearPool = getarray(configFile >> "cfgvehicles" >> _unitType >> format["allowedheadgear%1", if (random floor 100 <= _probabilityPool) then {""} else {"B"}]);
			};
			_headgearToUse = if (count _headgearPool > 0) then {_headgearPool call BIS_fnc_selectRandom} else {""};
		};
	}
	else
	{
		if (typeName _head == "STRING") then
		{
			private ["_cfgRoot"];
			_cfgRoot = switch (true) do
			{
				case (isClass (missionConfigfile >> "CfgUnitTemplates" >> _head)):
				{
					(missionConfigfile >> "CfgUnitTemplates" >> _head)
				};
				case (isClass (campaignConfigFile >> "CfgUnitTemplates" >> _head)):
				{
					(campaignConfigFile >> "CfgUnitTemplates" >> _head)
				};
				default
				{
					"none"
				};
			};
			if !(_cfgRoot isEqualTo "none") exitWith
			{
				private ["_headgearPool","_facewearPool"];
				_headgearPool = getArray (_cfgRoot >> "headgearList");
				_facewearPool = getArray (_cfgRoot >> "facewearList");
				if (count _headgearPool < 1) then {_headgearPool = false;};
				if (count _facewearPool < 1) then {_facewearPool = false;};
				[_unit, _headgearPool, _facewearPool] call SELF;
				_head = "";
				_face = false;
			};
			_headgearToUse = _head;
		};
	};
	if (isClass (configFile >> "cfgWeapons" >> _headgearToUse) || _headgearToUse == NO_HEADGEAR) then
	{
		removeHeadgear _unit;
		if (_headgearToUse != NO_HEADGEAR) then
		{
			_unit addHeadgear _headgearToUse;
		};
	};
};
/*---------------------------------------------------------------------------
	goggles change
---------------------------------------------------------------------------*/
if !(_face isEqualTo false && {_unitType isKindOf "C_man_1"}) then
{
	private ["_faceList","_facePool","_probabilityPool","_faceToUse"];
	_faceToUse = "";
	if (typeName _face == "ARRAY" && {!_skipRandomization}) then
	{
		if (count _face >= 1) then
		{
			_faceList = _face;
		}
		else
		{
			_faceList = getArray(configFile >> "cfgWeapons" >> _headgearToUse >> "allowedFacewear");
		};
		if (count _faceList >= 2 && {typeName (_faceList select 1) == "SCALAR"}) then
		{
			_facePool = [];
			_probabilityPool = [];
			for "_i" from 0 to (count _faceList -1) step 2 do
			{
				_facePool append [_faceList select _i];
				_probabilityPool append [_faceList select (_i +1)];
			};
			_faceToUse = [_facePool, _probabilityPool] call BIS_fnc_selectRandomWeighted;
		}
		else
		{
			_faceToUse = if (count _faceList > 0) then {_faceList call BIS_fnc_selectRandom} else {""};
		};
	}
	else
	{
		if (typeName _face == "STRING") then
		{
			_faceToUse = _face;
			if (toLower(_faceToUse) == "none") then
			{
				removeGoggles _unit;
			};
		};
	};
	if (isClass (configFile >> "CfgGlasses" >> _faceToUse)) then
	{
		removeGoggles _unit;
		_unit addGoggles _faceToUse;
	};
};
true