/*
	Author: ImperialAlex (Alexander)

	Description:
	Given a classname (item to test) and an object (potentially containing virtualcargo variables), determine if the item is 'allowed' in the context of the object.	

	Parameter(s):
		0: STRING - classname of the item to test	
		1 (OPTIONAL): ARRAY of ARRAY - whitelists (default: [[],[],[],[],[]])
		2 (OPTIONAL): ARRAY of ARRAY - blacklists (default: [[],[],[],[],[]])
		3 (OPTIONAL): ARRAY of INTEGER - whitelists to check (default: [])
		4 (Optional): BOOL - fullVersion toggle. true to allow all items, false to use whitelist. (default: false)	

	Example:
	["arifle_MX_F",["arifle_MX_F"],[],false] call xla_fnc_arsenalCondition;

	Returns:
	BOOL - true if item is allowed, false otherwise.
*/

	private ["_item","_whitelists","_blacklists","_types","_fullVersion"];
	_item = [_this,0,"",[""]] call bis_fnc_param;
	_whitelists = [_this,1,[[],[],[],[],[]],[[]],[5]] call bis_fnc_param;
	_blacklists = [_this,2,[[],[],[],[],[]],[[]],[5]] call bis_fnc_param;
	_types = [_this,3,[],[[]],[0,1,2,3,4]] call bis_fnc_param;
	_fullVersion = [_this,4,false,[false]] call bis_fnc_param;

	private ["_DEBUG"];
	_DEBUG = true;

	if (_DEBUG) then {
		diag_log format ["ARSENAL CONDITION: _item: %1",_item];
		diag_log format ["ARSENAL CONDITION: _whitelists: %1",_whitelists];
		diag_log format ["ARSENAL CONDITION: _blacklists: %1",_blacklists];
		diag_log format ["ARSENAL CONDITION: _types: %1",_types];
		diag_log format ["ARSENAL CONDITION: _fullVersion: %1",_fullVersion];
	};

	private ["_whitelist","_blacklist"];
	/* Construct the whitelist/blacklist from the input */
	_whitelist = [];
	_blacklist = [];
	{
		if (_x <= 3) then {	
			_whitelist append (_whitelists select _x);
			_blacklist append (_blacklists select _x);
		} else { 
			["Invalid type index (%1) in input",_x] call bis_fnc_error;
		};
	} forEach _types;

	if (_DEBUG) then {
		diag_log format ["ARSENAL CONDITION: _whitelist: %1",_whitelist];
		diag_log format ["ARSENAL CONDITION: _blacklist: %1",_blacklist];
	};

 	private ["_virtualSideCargo","_virtualSideBlacklist"];
	_virtualSideCargo = (_whitelists select 4);
	_virtualSideBlacklist = (_blacklists select 4);

	diag_log _virtualSideCargo;
	hint str ((_virtualSideCargo find """%ALL""") >= 0);

	#define NO_SIDE -1
	#define EAST_SIDE 0
	#define WEST_SIDE 1
	#define INDEP_SIDE 2
	#define CIV_SIDE 3
	#define NEUTRAL_SIDE 4
	#define ENEMY_SIDE 5
	#define FRIENDLY_SIDE 6
	#define LOGIC_SIDE 7	

	_XLA_condition = false;
	if (_fullVersion) then {
		_XLA_condition = true;
	} else { 
		private ["_xla_config","_xla_side","_xla_factionstring","_xla_sideallowed"];
		_xla_config = configFile;
		{ 
			if (isClass(configFile / _x / _item)) then	{ 
				_xla_config = configFile / _x / _item;
			};
		}	foreach ["CfgWeapons","CfgVehicles","CfgMagazines","CfgGlasses"];
		if (_xla_config != configFile ) then { 
			_xla_side = NO_SIDE;
			if (isNumber (_xla_config >> "side")) then { 
				_xla_side = getNumber (_xla_config >> "side");
			};
			_xla_factionstring = getText(_xla_config >> "faction");
			if (_xla_factionstring != "" && _xla_factionstring != "Default") then { 
				_configFaction = (configFile / "CfgFactionClasses" / _xla_factionstring);
				if (isNumber (_configFaction >> "side")) then { 
					_xla_side = getNumber (_configFaction >> "side");
				};
			};
			if (isNumber (_xla_config >> "XLA_arsenal_side")) then { 
				_xla_side = getNumber (_xla_config >> "XLA_arsenal_side");
			};
			_xla_sideallowed = ( ((str _xla_side) in _virtualSideCargo ) || ((_virtualSideCargo find "%ALL") >= 0) ) && !( ((str _xla_side) in _virtualSideBlacklist )  || ((_virtualSideBlacklist find "%ALL") >= 0) );
			if (_xla_sideallowed) then { 
				if ( "%ALL" in _blacklist ) then {
					_XLA_condition = false;
					{if (_x == _item) exitWith {_XLA_condition = true;}} forEach _whitelist;
				} else {
					_XLA_condition = true;
					{if (_x == _item) exitWith {_XLA_condition = false;}} forEach _blacklist;
				};
			} else { 
				if ( "%ALL" in _whitelist ) then {
					_XLA_condition = true;
					{if (_x == _item) exitWith {_XLA_condition = false;}} forEach _blacklist;
				} else {
					_XLA_condition = false;
					{if (_x == _item) exitWith {_XLA_condition = true;}} forEach _whitelist;
				};
			};
		} else { 
			_XLA_condition = false;
		};
	};
	_XLA_condition;