params ["_trader", "_traderFaction", "_player"];

if (!isServer) exitWith {};
if (isNull _trader || isNull _player) exitWith {};
if (!alive _trader || !isPlayer _player) exitWith {};

private _getPlayerFactionTag = missionNamespace getVariable "FN_getPlayerFactionTag";
private _isFactionHostileToTrader = missionNamespace getVariable "FN_isFactionHostileToTrader";

private _playerFaction = [_player] call _getPlayerFactionTag;
private _isHostile = [_traderFaction, _playerFaction] call _isFactionHostileToTrader;

if (_isHostile) then {
    [_trader] remoteExec ["FN_removeTraderActionsLocal", _player];
} else {
    [_trader] remoteExec ["FN_economySystem", _player];
};