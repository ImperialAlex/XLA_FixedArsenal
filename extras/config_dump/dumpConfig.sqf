//
// dumpConfig.sqf
// Copyright (c) 2010 Denis Usenko, DenVdmj@gmail.com
// MIT-style license
//

/*
======================================================================================

Dump config to the clipboard:

    [config HNDL, bool IncludeInheritedPropertiesFlag] call compile preprocessFileLineNumbers "dumpConfig.sqf"

This example put section CfgVehicles on the clipboard:

    [configFile >> "CfgVehicles"] call compile preprocessFileLineNumbers "dumpConfig.sqf"

This example will put on the clipboard class "RscDisplayArcadeUnit", all classes will contain all heritable properties, so you get a full and self-sufficient class, independent from the other classes.

    [configFile >> "RscDisplayArcadeUnit", true] call compile preprocessFileLineNumbers "dumpConfig.sqf"

More examples:

    [configFile >> "RscTitle", true] call compile preprocessFileLineNumbers "dumpConfig.sqf"
    [configFile >> "RscEdit", true] call compile preprocessFileLineNumbers "dumpConfig.sqf"
    [configFile >> "RscToolbox", true] call compile preprocessFileLineNumbers "dumpConfig.sqf"

Warning: don't attempt to get a large classes with switched on parameter "IncludeInheritedPropertiesFlag", eg don't do so:

    [configFile, true] call compile preprocessFileLineNumbers "dumpConfig.sqf"

Dump the entire config, it can take over ten seconds:

    [configFile] call compile preprocessFileLineNumbers "dumpConfig.sqf"

======================================================================================
*/

//
// #include "\rls\common";
//

#define arg(x)          (_this select (x))
#define argIf(x)        if(count _this > (x))
#define argIfType(x,t)  if(argIf(x)then{typeName arg(x) == (t)}else{false})
#define argSafe(x)      argIf(x)then{arg(x)}
#define argSafeType(x,t)  argIfType(x,t)then{arg(x)}
#define argOr(x,v)      (argSafe(x)else{v})
#define push(a,v)       (a)set[count(a),(v)]
#define pushTo(a)       call{(a)set[count(a),_this]}
#define log2(number)    ((log number)/.3010299956639812)

private [
    "_joinString",
    "_escapeString",
    "_collectInheritedProperties",
    "_dumpConfigTree"
];

_joinString = {
    //
    // Fast string concatenation,
    //
    private ["_list", "_char", "_size", "_subsize", "_oversize", "_j"];

    _list = arg(0);
    _char = arg(1);

    if( count _list < 1 ) exitwith {""};

    // while { count _list > 1 } do {
    for "" from 1 to ceil(log2(count _list)) do {
        _size = count _list / 2;
        _subsize = floor _size;
        _oversize = ceil _size;
        _j = 0;
        for "_i" from 0 to _subsize - 1 do {
            _list set [_i, (_list select _j) + _char + (_list select (_j+1))];
            _j = _j + 2;
        };
        if( _subsize != _oversize ) then { // to add a tail
            _list set [_j/2, _list select _j];
        };
        _list resize _oversize;
    };

    _list select 0;
};

_escapeString = {
    private ["_source", "_target", "_start", "_charCode"];
    _source = toArray _this;
    _start = _source find 34;
    if(_start > 0) then {
        _target = +_source;
        _target resize _start;
        for "_i" from _start to count _source - 1 do {
            _charCode = _source select _i;
            push(_target, _charCode);
            if(_charCode == 34) then {
                push(_target, _charCode);
            };
        };
        str toString _target;
    } else {
        str _this;
    };
};

_collectInheritedProperties = {
    private [
        "_config",
        "_className",
        "_propertyNameList",
        "_propertyNameLCList",
        "_propertyName",
        "_propertyNameLC"
    ];
    _config = _this;
    _propertyNameList = [];
    _propertyNameLCList = [];
    while {
        _className = configName _config;
        for "_i" from 0 to count _config - 1 do {
            _propertyName = _config select _i;
            _propertyNameLC = toLower configName _propertyName;
            if!(_propertyNameLC in _propertyNameLCList) then {
                push(_propertyNameList, _propertyName);
                push(_propertyNameLCList, _propertyNameLC);
            };
        };
        _className != "";
    } do {
        _config = inheritsFrom _config;
    };
    _propertyNameList;
};

_dumpConfigTree = {
    private [
        "_includeInheritedProperties", "_specifyParentClass",
        "_result", "_indents", "_depth",
        "_pushLine", "_traverse", "_traverseArray"
    ];
    _includeInheritedProperties = argOr(1, false);
    _specifyParentClass = argOr(2, !_includeInheritedProperties);

    _result = [];
    _indents = [""];
    _depth = 0;
    _pushLine = {
        if(_depth >= count _indents) then {
            _indents set [_depth, (_indents select _depth-1) + "    "];
        };
        push(_result, (_indents select _depth) + _this);
    };

    _traverse = {
        private "_confName";
        _confName = configName _this;
        if( isText _this ) exitwith {
            _confName + " = " + (getText _this call _escapeString) + ";" call _pushLine;
        };
        if( isNumber _this ) exitwith {
            _confName + " = " + str getNumber _this + ";" call _pushLine;
        };
        if( isArray _this ) exitwith {
            _confName + "[] = " + (getArray _this call _traverseArray) + ";" call _pushLine;
        };
        if( isClass _this ) exitwith {
            "class " + _confName + (
                configName inheritsFrom _this call {
                    if( _this == "" || !_specifyParentClass ) then { "" } else { " : " + _this }
                }
            ) + " {" call _pushLine;
            if( _includeInheritedProperties ) then {
                _this = _this call _collectInheritedProperties;
            };
            _depth = _depth + 1;
            for "_i" from 0 to count _this - 1 do {
                _this select _i call _traverse
            };
            _depth = _depth - 1;
            "};" call _pushLine;
        };
    };

    _traverseArray = {
        if(typeName _this == "array") exitwith {
            private "_array";
            _array = [];
            for "_i" from 0 to count _this - 1 do {
                push(_array, _this select _i call _traverseArray);
            };
            "{" + ([_array, ", "] call _joinString) + "}";
        };
        if(typeName _this == "string") exitwith {
            _this call _escapeString;
        };
        str _this;
    };

    arg(0) call _traverse;

    [_result, toString [0x0D,0x0A]] call _joinString;
};

private ["_res", "_startTime", "_endTime"];
_startTime = diag_tickTime;
_res = _this call _dumpConfigTree;
_endTime = diag_tickTime;
copyToClipboard _res;
hint format["Ready\nNow get config from clipboard\ntime: %1", _endTime - _startTime];
_res;
