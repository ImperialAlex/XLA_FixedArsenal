#define NO_SIDE -1
#define EAST_SIDE 0
#define WEST_SIDE 1
#define INDEP_SIDE 2
#define CIV_SIDE 3
#define NEUTRAL_SIDE 4
#define ENEMY_SIDE 5
#define FRIENDLY_SIDE 6
#define LOGIC_SIDE 7

if (isServer) then {


	// Grab the parameter that was passed in. 
	// The box should have "this execVM <scriptname>" in it's init field.
	_box = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

	// Check if @XLA_FixedArsenal is loaded
	 if (isnil "XLA_fnc_addVirtualItemCargo") then {

	 	hint "@XLA_FixedArsenal not found.";

	} else {	

		["Preload",[false, _box, nil, ["arifle_Katiba_BASE_F" ]]] spawn XLA_fnc_arsenal;

		[_box, [WEST_SIDE,FRIENDLY_SIDE],true,false] call XLA_fnc_addVirtualSideCargo;
		[_box, ["arifle_Katiba_BASE_F"],true,false] call XLA_fnc_addVirtualWeaponCargo;

		// Start the arsenal on it
		_addActionText = "<t color='#45B6EA'>Open Armoury (preload test)";
		["AmmoboxInit",[_box,false,{true},_addActionText,false]] spawn XLA_fnc_arsenal;

	};
};
