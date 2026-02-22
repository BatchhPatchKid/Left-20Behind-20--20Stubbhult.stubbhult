/*
  LB_Chatter.sqf — Ambient conversations + simple combat shouts (registry-based)
  ---------------------------------------------------------------------------
  - Server-only. No EHs.
  - Faction is read from the central registry (LB_FacReg_Get).
  - Conversations are authored via LB_Conversations() (data-only).

  Start in initServer.sqf AFTER the registry:
    if (isServer) then {
      [] execVM "LB_FactionRegistry.sqf";
      [] execVM "LB_Chatter.sqf";
    };
*/

if (!isServer) exitWith {};

// ---------------------------
// Variable declarations
// ---------------------------
private _sleepTime = 15;
private _probSpeekAmbient = 0.005;
private _probSpeekCombat = 0.35;
private _probAllClear = 0.10;
private _talkRadius = 50;
private _radioRadius = 500;
private _debug = false;

private _radios = ["tfar_anprc148jem","rhsusf_radio_anprc152","tfar_anprc152","tfar_anprc154","tfar_fadak","tfar_pnr1000a","rhs_radio_r169p1","rhs_radio_r187p1","tfar_rf7800str","itemradio"];
// Precompute squared radii + normalize radio classnames to lowercase
private _talkR2  = _talkRadius * _talkRadius;
private _radioR2 = _radioRadius * _radioRadius;
_radios = _radios apply { toLower _x };

// Helper: per-player radio check (exact match in assignedItems)
private _hasAnyRadio =
{
  params ["_unit"];
  private _invLower = (assignedItems _unit) apply { toLower _x };
  {
    if (_x in _invLower) exitWith { true };
  } forEach _radios;
  false
};


// ---------------------------
// Function declarations
// ---------------------------
missionNamespace setVariable ["LB_FactionRegistry", createHashMap];

LB_FacReg_Set = {
  params ["_grp","_key"];
  if (isNull _grp) exitWith {};
  private _reg = missionNamespace getVariable ["LB_FactionRegistry", createHashMap];
  _reg set [netId _grp, _key];
  missionNamespace setVariable ["LB_FactionRegistry", _reg];
};

LB_FacReg_Get = {
  params ["_grp", ["_default","*"]];
  private _reg = missionNamespace getVariable ["LB_FactionRegistry", createHashMap];
  _reg getOrDefault [netId _grp, _default]
};

LB_FacReg_Has = {
  params ["_grp"];
  private _reg = missionNamespace getVariable ["LB_FactionRegistry", createHashMap];
  (netId _grp) in (keys _reg)
};

_FN_debug = {
  params ["_alivePlayers", "_leader", "_leaderValid", "_playersNearLeader", "_isRed"];

  private _msg = format [
    "alivePlayers = %1\nleader = %2\nleaderValid = %3\nnearLeader = %4\ngrp in combat: %5",
    count _alivePlayers,
    name _leader,
    _leaderValid,
    count _playersNearLeader,
    _isRed
  ];

  [_msg] remoteExecCall ["hintSilent", 0];
};

// ---------------------------
// Get dialogue lines
// ---------------------------
private _ConGetter = missionNamespace getVariable [
  "LB_Conversations",
  { createHashMapFromArray [["ambient",createHashMap],["allClear",createHashMap],["combat",createHashMap]] }
];
private _ConDB     = [] call _ConGetter;
private _CombatSrc = _ConDB get "combat"; 
private _AmbientSrc = _ConDB get "ambient";
private _AllClearSrc = _ConDB get "allClear";

// Precomputed pools
private _CombatPools = createHashMap;
{
  private _fac = _x;
  private _arr = _CombatSrc get _fac;                // array of strings
  if (!isNil "_arr" && {_arr isEqualType []}) then {
    _CombatPools set [_fac, _arr];                   // store reference (no + copy)
  };
} forEach (keys _CombatSrc);

private _AmbientPools = createHashMap;
{
  private _fac = _x;
  private _arr = _AmbientSrc get _fac;  // array of conversations
  if (!isNil "_arr" && {_arr isEqualType []}) then {
    // keep only non-empty conversations (each conversation is an array of entries)
    private _clean = _arr select { _x isEqualType [] && { count _x > 0 } };
    _AmbientPools set [_fac, _clean];
  };
} forEach (keys _AmbientSrc);

if (isNil { _AmbientPools get "*" }) then { _AmbientPools set ["*", []]; };

private _AllClearPool = createHashMap;
{
  private _fac = _x;
  private _arr = _AllClearSrc get _fac;                // array of strings
  if (!isNil "_arr" && {_arr isEqualType []}) then {
    _AllClearPool set [_fac, _arr];                   // store reference (no + copy)
  };
} forEach (keys _AllClearSrc);

// ---------------------------
// Main Loop
// ---------------------------
while {true} do {
  private _reg = missionNamespace getVariable ["LB_FactionRegistry", createHashMap]; //getting updated version of the hash map
  {
      _x params ["_nid","_fac"];
      private _grp = groupFromNetId _nid;

      if (isNull _grp) then {
          _reg deleteAt _nid; //deleting old groups
      } else { //main action section of the chatter script
        private _alivePlayers = allPlayers select { isPlayer _x && { alive _x } };
        private _leader = leader _grp;
        private _leaderValid = (!isNull _leader) && { alive _leader };

        // Build [player, hasRadio] pairs for those within talk OR radio radius
        private _playersNearLeader = [];

        if (_leaderValid) then {
          {
            if (isPlayer _x && {alive _x}) then {
              private _d2 = _x distanceSqr _leader;
              if ( (_d2 <= _talkR2) || (_d2 <= _radioR2) ) then {
                _playersNearLeader pushBack [_x, (_x call _hasAnyRadio)];
              };
            };
            sleep 0.001;
          } forEach allPlayers;
        } else {
          continue;
        };

        if (count _playersNearLeader > 0) then {
          {
            _x params ["_player","_playerHasRadio"];

            // ==== COMBAT LINES ====
            if (
                (random 1 < _probSpeekCombat && {behaviour _leader == "COMBAT"})
                || (
                      ((_leader distanceSqr _player) < _talkR2)
                      && {behaviour _leader == "CARELESS"}
                      && {side _leader in [opfor, independent]}
                    )
              )
            then {
              private _facKey = [_grp, "*"] call LB_FacReg_Get;
              private _lines  = _CombatPools get _facKey;
              if (isNil "_lines") then { _lines = _CombatPools get "*"; };
              if (!isNil "_lines" && {count _lines > 0}) then {
                private _selectedLine = selectRandom _lines;
                [_selectedLine] remoteExec ["systemChat", _player, false];
              };

            } else {

              // ==== AMBIENT CONVERSATIONS ====
              if (
                  (random 1 < _probSpeekAmbient)
                  && {behaviour _leader != "COMBAT"}
                  && {behaviour _leader != "CARELESS"}
                  && {(_leader distanceSqr _player) < _talkR2}
                )
              then {
                private _facKey = [_grp, "*"] call LB_FacReg_Get;
                private _convs  = _AmbientPools get _facKey;
                if (isNil "_convs") then { _convs = _AmbientPools get "*"; };
                if (!isNil "_convs" && {count _convs > 0}) then {
                  private _conv = selectRandom _convs; // [ROLE, TEXT, MIN, MAX] entries
                  {
                    _x params ["_role","_text","_min","_max"];
                    [_text] remoteExec ["systemChat", _player, false];
                    sleep (_min + random ((_max - _min) max 0));
                  } forEach _conv;
                };

              } else {

                // ==== ALL-CLEAR RADIO MESSAGES ====
                if (
                    _playerHasRadio
                    && {random 1 < _probAllClear}
                    && {behaviour _leader != "COMBAT"}
                    && {behaviour _leader != "CARELESS"}
                    && {(_leader distanceSqr _player) >= _talkR2}
                    && {(_leader distanceSqr _player) <  _radioR2}
                  )
                then {
                  private _facKey = [_grp, "*"] call LB_FacReg_Get;
                  private _lines  = _AllClearPool get _facKey;
                  if (isNil "_lines") then { _lines = _AllClearPool get "*"; };
                  if (!isNil "_lines" && {count _lines > 0}) then {
                    private _selectedLine = selectRandom _lines;
                    [_selectedLine] remoteExec ["systemChat", _player, false];
                  };
                };
              };
            };

            sleep 0.001;
          } forEach _playersNearLeader;
        };

        if (_debug) then {
          [_alivePlayers, _leader, _leaderValid, (_playersNearLeader apply {_x#0}), (behaviour _leader == "COMBAT")] call _FN_debug;
        };
      };
      sleep 0.01;

  } forEach _reg;

  sleep _sleepTime;
};