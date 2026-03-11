params ["_player", "_trigger"];

if (!hasInterface) exitWith {};
if (isNull _player || {isNull _trigger}) exitWith {};
if (!local _player) exitWith {};

private _existingHandle = _player getVariable ["LB_megaRadZoneHandle", scriptNull];
if !(_existingHandle isEqualTo scriptNull) then {
    terminate _existingHandle;
};

private _zoneHandle = [_player, _trigger] spawn {
    params ["_unit", "_trg"];

    private _ratePerSecond = 0.1;

    while {alive _unit && {_unit inArea _trg}} do {
        private _currentRad = _unit getVariable ["Rad", 0];
        _unit setVariable ["Rad", (_currentRad + _ratePerSecond) max 0, true];

        if (_ratePerSecond >= 1) then {
            [format ["<t color='#ff0000' size='.5'>Your body feels like it's in a microwave - perhaps it's a good idea to return to the map</t>"],.8,1,1.5,.3,0,789] spawn BIS_fnc_dynamicText;
        };

        sleep 10;
		
		if ("rvg_Geiger" in (itemsWithMagazines _unit)) then {
		private _owner = owner _unit;
			if ((_currentRad + _ratePerSecond) > 1)     exitWith { [_unit, ["rvg_geiger_3", 100, 1]] remoteExecCall ["say3D", _owner]; };
			if ((_currentRad + _ratePerSecond) > 0.5)   exitWith { [_unit, ["rvg_geiger_0", 100, 1]] remoteExecCall ["say3D", _owner]; };
			if ((_currentRad + _ratePerSecond) > 0.1)   exitWith { [_unit, ["rvg_geiger_2", 100, 1]] remoteExecCall ["say3D", _owner]; };
			if ((_currentRad + _ratePerSecond) > 0.05)  exitWith { [_unit, ["rvg_geiger_1", 100, 1]] remoteExecCall ["say3D", _owner]; };
		};
		
		_ratePerSecond = _ratePerSecond * 2;
    };

    _unit setVariable ["LB_megaRadZoneHandle", scriptNull];
};

_player setVariable ["LB_megaRadZoneHandle", _zoneHandle];