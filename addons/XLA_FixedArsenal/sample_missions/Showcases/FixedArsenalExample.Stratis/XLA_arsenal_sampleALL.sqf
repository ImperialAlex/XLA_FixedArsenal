if (isServer) then {

	// Initialisation
	_crate = [_this, 0, objNull, [objNull]] call BIS_fnc_param;


	// Populate with predefined items, do not add default "Virtual Arsenal" option
	 if (isnil "XLA_fnc_addVirtualItemCargo") then {
	 	hint "@XLA_FixedArsenal not found. Reverting to vanilla arsenal";
	} else {	
		[_crate, [["-1"],true,false] call XLA_fnc_addVirtualSideCargo; // -1 means EVERYTHING is allowed, no matter what side parameter (if any) it has

_addActionText = "<t color='#45B6EA'>Open Armoury (Everything whitelisted)"

// -------------------------------------------------------------------
//		MAGIC (uses internal workings of bis_fnc_arsenal/xla_fnc_arsenal)
// -------------------------------------------------------------------

	_hasAction = _crate getVariable ["XLA_ArsenalAddActionPresent", false];

	if (!(isnil "XLA_fnc_arsenal") then {
		if (!_hasAction) then {
			[[_crate, [_addActionText,
			{
				_box = _this select 0;
				_unit = _this select 1;
				["Open",[nil,_box]] call XLA_fnc_arsenal;
			},
			[],	6, true, false,	"", "true"]], "addAction",true] call BIS_fnc_MP;

			_crate setVariable ["XLA_ArsenalAddActionPresent", true, true];
		};
	};

}; //END OF "if (isServer)"