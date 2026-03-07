params ["_player"];

if (!isServer) exitWith {};
if (isNull _player) exitWith {};
if (!isPlayer _player) exitWith {};

private _existingTrigger = _player getVariable ["LBMQ_task001OfficeTrigger", objNull];
if (!isNull _existingTrigger) then {
    deleteVehicle _existingTrigger;
};

private _officePos = [0, 0, 0];
private _officeAnchor = missionNamespace getVariable ["LBMQ_task001OfficeAnchor", objNull];
if (!isNull _officeAnchor) then {
    _officePos = getPosATL _officeAnchor;
} else {
    if (!isNil "suTrader" && {!isNull suTrader}) then {
        _officePos = getPosATL suTrader;
    } else {
        if ((getMarkerColor "LBMQ_Task001_Office") != "") then {
            _officePos = markerPos "LBMQ_Task001_Office";
        };
    };
};

if (_officePos isEqualTo [0, 0, 0]) exitWith {};

private _trigger = createTrigger ["EmptyDetector", _officePos, false];
_trigger setVariable ["LBMQ_owner", _player, false];
_trigger setTriggerArea [6, 6, 0, false, 3];
_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", false];
_trigger setTriggerTimeout [0, 0, 0, false];

private _onCondition = "private _owner = thisTrigger getVariable ['LBMQ_owner', objNull]; !isNull _owner && {alive _owner} && {_owner inArea thisTrigger}";
private _onActivation = "private _owner = thisTrigger getVariable ['LBMQ_owner', objNull]; if (!isNull _owner) then { [_owner] call (missionNamespace getVariable 'LBMQ_fnc_completeTask001Server'); };";
_trigger setTriggerStatements [_onCondition, _onActivation, ""];

_player setVariable ["LBMQ_task001OfficeTrigger", _trigger, false];