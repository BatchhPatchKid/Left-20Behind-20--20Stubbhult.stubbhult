params ["_anchors", ["_fallbackMarker", ""]];

private _destination = [];

{
    if (_x isEqualType objNull && {!isNull _x}) exitWith {
        _destination = getPosATL _x;
    };
} forEach _anchors;

if ((_destination isEqualTo []) && {_fallbackMarker != ""} && {(getMarkerColor _fallbackMarker) != ""}) then {
    _destination = markerPos _fallbackMarker;
};

_destination