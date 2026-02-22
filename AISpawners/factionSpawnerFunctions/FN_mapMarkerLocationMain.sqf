/*
    FN_mapMarkerLocationMain.sqf
    Server-owned marker management for random location spawns.
    Survivors: hd_join with faction color
    Zombies: hd_warning in purple
    Mutants: NATO Markers in purple
*/

params ["_centerPos","_clearRadius","_kind","_label","_area"];

if (!isServer) exitWith {};

private _markers = missionNamespace getVariable ["LB_locationMarkers",[]];

private _isUpdate = (_markers findIf { (_centerPos distance2D (getMarkerPos _x)) <= _clearRadius } != -1);

{
    private _mName = _x;
    if ((_centerPos distance2D (getMarkerPos _mName)) <= _clearRadius) then {
        deleteMarker _mName;
        _markers = _markers - [_mName];
    };
} forEach +_markers;

private _markerType = "hd_dot";
private _markerColor = "ColorWhite";
private _markerText = "";

switch (_kind) do {
    case "survivor": {
        _markerType = "hd_join";
        switch (_label) do {
            case "TRB": {_markerColor = "ColorKhaki";};
            case "SU": {_markerColor = "colorBLUFOR";};
            case "BB": {_markerColor = "colorBLUFOR";};
            case "PMC": {_markerColor = "ColorBrown";};
            case "ROA": {_markerColor = "ColorOrange";};
            case "DT": {_markerColor = "ColorBlue";};
            case "NH": {_markerColor = "ColorGreen";};
            case "PF": {_markerColor = "ColorRed";};
            case "RC": {_markerColor = "ColorGrey";};
            case "ALF": {_markerColor = "ColorPink";};
            case "WO": {_markerColor = "ColorYellow";};
            case "Bandit": {_markerColor = "ColorBlack";};
            case "RU": {_markerColor = "ColorEAST";};
            case "US": {_markerColor = "colorIndependent";};
            default {_markerColor = "ColorGreen";};
        };
    };
    case "zombie": {
        _markerType = "hd_warning";
        _markerColor = "ColorCIV";
    };
    case "mutant": {
        switch (_label) do {
            case "Skulls": {_markerType = "o_mortar";};
            case "Wendigo": {_markerType = "o_support";};
            case "Rake": {_markerType = "o_med";};
            case "Mindflayer": {_markerType = "o_maint";};
            case "411": {_markerType = "o_art";};
            case "Snatcher": {_markerType = "o_mortar_inf";};
            case "Vampire": {_markerType = "o_air";};
            case "Shadowmen": {_markerType = "o_uav";};
            case "Abomination": {_markerType = "o_inf";};
            case "Bloater": {_markerType = "o_naval";};
            case "Leaper": {_markerType = "o_recon";};
            case "Screamer": {_markerType = "o_support";};
            case "Demons": {_markerType = "o_service";};
            case "Tank": {_markerType = "o_armor";};
            case "Statue": {_markerType = "o_mech_inf";};
            case "Hellspawn": {_markerType = "o_plane";};
            case "Spewer": {_markerType = "o_plane";};
            case "Goliath": {_markerType = "u_installation";};
            case "Various": {_markerType = "hd_destroy";};
            default {_markerType = "o_Ordnance";};
        };
        _markerColor = "ColorCIV";
    };
    default {
        _markerType = "hd_dot";
        _markerColor = "ColorWhite";
        _markerText = "Location";
    };
};

private _name = format ["LB_loc_%1_%2",floor diag_tickTime,floor (random 1000000)];
private _m = createMarker [_name,_centerPos];

_m setMarkerType _markerType;
_m setMarkerColor _markerColor;
_m setMarkerAlpha 1;
_m setMarkerText _markerText;
_m setMarkerSize [0.75,0.75];

_markers pushBack _name;
missionNamespace setVariable ["LB_locationMarkers",_markers];

private _eventText = if (_isUpdate) then {"Location updated"} else {"Location discovered"};
[format ["%1",_eventText]] remoteExec ["hint",0];