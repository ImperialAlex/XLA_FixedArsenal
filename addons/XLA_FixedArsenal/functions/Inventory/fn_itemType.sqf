/*
	Author: Karel Moricky

	Description:
	Return item category and type. Recognized types are:

		Weapon / VehicleWeapon
			AssaultRifle
			BombLauncher
			Cannon
			GrenadeLauncher
			Handgun
			Launcher
			MachineGun
			Magazine
			MissileLauncher
			Mortar
			RocketLauncher
			Shotgun
			Throw
			Rifle
			SubmachineGun
			SniperRifle
		VehicleWeapon
			Horn
			CounterMeasuresLauncher
			LaserDesignator
		Item
			AccessoryMuzzle
			AccessoryPointer
			AccessorySights
			Binocular
			Compass
			FirstAidKit
			GPS
			LaserDesignator
			Map
			Medikit
			MineDetector
			NVGoggles
			Radio
			Toolkit
			UAVTerminal
			VehicleWeapon
			Unknown
			UnknownEquipment
			UnknownWeapon
			Watch
		Equipment
			Glasses
			Headgear
			Vest
			Uniform
			Backpack
		Magazine
			Artillery
			Bullet
			CounterMeasures
			Flare
			Grenade
			Laser
			Missile
			Rocket
			Shell
			ShotgunShell
			SmokeShell
			UnknownMagazine
		Mine
			Mine
			MineBounding
			MineDirectional

	Parameter(s):
		0: STRING - item class

	Returns:
	ARRAY in format [category,type]
*/
private ["_item"];
_item = [_this,0,"",[""]] call bis_fnc_param;
switch (true) do {
	case (isclass (configfile >> "cfgweapons" >> _item)): {
		private ["_cfgItem","_simulation","_itemCategory","_itemType"];
		_cfgItem = configfile >> "cfgweapons" >> _item;
		_simulation = tolower gettext (_cfgItem >> "simulation");
		_itemCategory = "Item";
		_itemType = switch _simulation do {
			case "weapon": {
				private ["_type"];
				_itemCategory = "Weapon";
				_type = getnumber (_cfgItem >> "type");
				if (istext (_cfgItem >> "type")) then {_type = gettext (_cfgItem >> "type") call bis_fnc_parsenumber};
				switch _type do {
					case 1;
					case 4;
					case 5;
					case 65536: {
						private ["_cursor"];
						_cursor = tolower gettext (_cfgItem >> "cursor");
						if (_cursor in ["","emptycursor"]) then {_cursor = tolower gettext (_cfgItem >> "cursorAim");};
						if (_cursor == "") exitwith {_itemCategory = "VehicleWeapon"; "Horn"};
						if (_type > 4) then {_itemCategory = "VehicleWeapon";};
						switch _cursor do {
							case "arifle": {"AssaultRifle"};
							case "bomb": {"BombLauncher"};
							case "cannon": {"Cannon"};
							case "gl": {"GrenadeLauncher"};
							case "laserdesignator": {"LaserDesignator"};
							case "mg": {"MachineGun"};
							case "missile": {"MissileLauncher"};
							case "mortar": {"Mortar"};
							case "rocket": {"RocketLauncher"};
							case "sgun": {"Shotgun"};
							case "throw": {"Throw"};
							case "smg": {"SubmachineGun"};
							case "srifle": {"SniperRifle"};
							default {
								switch _type do {
									case 1: {"Rifle"};
									case 4: {"Launcher"};
									case 65536: {"VehicleWeapon"};
									default {"UnknownWeapon"};
								};
							};
						};
					};
					case 2: {
						"Handgun"
					};
					case 4096: {
						_itemCategory = "Item";
						"LaserDesignator"
					};
					case 131072: {
						private ["_infoType"];
						_itemCategory = "Item";
						_infoType = getnumber (_cfgItem >> "itemInfo" >> "type");
						switch _infoType do {
							case 101: {"AccessoryMuzzle"};
							case 201: {"AccessorySights"};
							case 301: {"AccessoryPointer"};
							case 401: {"FirstAidKit"};
							case 605: {_itemCategory = "Equipment"; "Headgear"};
							case 619: {"Medikit"};
							case 620: {"Toolkit"};
							case 621: {"UAVTerminal"};
							case 701: {_itemCategory = "Equipment"; "Vest"};
							case 801: {_itemCategory = "Equipment"; "Uniform"};
							default {"UnknownEquipment"};
						};
					};
					default {"UnknownWeapon"};
				};
			};
			case "binocular": {"Binocular"};
			case "nvgoggles": {"NVGoggles"};
			case "itemcompass": {"Compass"};
			case "itemgps": {"GPS"};
			case "itemmap": {"Map"};
			case "itemminedetector": {"MineDetector"};
			case "itemradio": {"Radio"};
			case "itemwatch": {"Watch"};
			case "cmlauncher": {_itemCategory = "VehicleWeapon"; "CounterMeasuresLauncher"};
			default {"Unknown"};
		};
		[_itemCategory,_itemType]
	};
	case (isclass (configfile >> "cfgmagazines" >> _item)): {
		private ["_ammo","_itemCategory","_itemType"];
		_ammo = tolower gettext (configfile >> "cfgammo" >> gettext (configfile >> "cfgmagazines" >> _item >> "ammo") >> "simulation");
		_itemCategory = "Magazine";
		_itemType = switch _ammo do {
			case "shotboundingmine": {_itemCategory = "Mine"; "MineBounding"};
			case "shotbullet": {"Bullet"};
			case "shotcm": {"CounterMeasures"};
			case "shotdeploy": {"Artillery"};
			case "shotdirectionalbomb": {_itemCategory = "Mine"; "MineDirectional"};
			case "shotgrenade": {"Grenade"};
			case "shotilluminating": {"Flare"};
			case "shotlaser": {"Laser"};
			case "shotmine": {_itemCategory = "Mine"; "Mine"};
			case "shotmissile": {"Missile"};
			case "shotrocket": {"Rocket"};
			case "shotshell": {"Shell"};
			case "shotsmoke";
			case "shotsmokex": {"SmokeShell"};
			case "shotspread": {"ShotgunShell"};
			case "shotsubmunitions": {"Artillery"};
			default {"UnknownMagazine"};
		};

		[_itemCategory,_itemType]
	};
	case (isclass (configfile >> "cfgvehicles" >> _item)): {
		private ["_isBackpack"];
		_isBackpack = getnumber (configfile >> "cfgvehicles" >> _item >> "isBackpack");
		if (_isBackpack > 0) then {["Equipment","Backpack"]} else {["",""]}
	};
	case (isclass (configfile >> "cfgGlasses" >> _item)): {
		["Equipment","Glasses"]
	};
	default {["",""]};
};