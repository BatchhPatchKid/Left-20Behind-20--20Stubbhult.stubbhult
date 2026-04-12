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
private _probSpeekCombat = 1.15;
private _probAllClear = 0.30;
private _talkRadius = 25;
private _radioRadius = 500;
private _debug = false;

// Precompute squared radii
private _talkR2 = _talkRadius * _talkRadius;
private _radioR2 = _radioRadius * _radioRadius;

// Helper: per-player radio check (accept any item that occupies the radio slot)
private _hasAnyRadio = {
  params ["_unit"];
  private _assigned = assignedItems _unit;

  (_assigned findIf {
    private _item = _x;

    isClass (configFile >> "CfgWeapons" >> _item)
    && {
      (_item isEqualTo "ItemRadio")
      || { _item isKindOf ["ItemRadio", configFile >> "CfgWeapons"] }
    }
  }) > -1
};

private _getFactionKey = {
  params ["_grp", ["_uppercase", false]];

  private _facKey = [_grp, "*"] call LB_FacReg_Get;
  if !(_facKey isEqualType "") then {
    _facKey = str _facKey;
  };

  if (_uppercase) then {
    _facKey = toUpper _facKey;
  };

  _facKey
};

private _getPoolForFaction = {
  params ["_poolMap", "_facKey"];

  private _directPool = _poolMap get _facKey;
  if (!isNil "_directPool") exitWith { _directPool };

  private _fallbackPool = _poolMap get "*";
  if (!isNil "_fallbackPool") exitWith { _fallbackPool };

  []
};

private _sendAmbientConversation = {
  params ["_conversation", "_player"];

  {
    _x params ["_role", "_text", "_min", "_max"];
    [_text] remoteExec ["systemChat", _player, false];
    sleep (_min + random ((_max - _min) max 0));
  } forEach _conversation;
};

// Helper: play optional faction all-clear chatter audio for a specific line index.
// Audio is resolved by line position in the all-clear array:
//   Conversations\RadioChatter\<FAC>\<FAC>_Radio_Chatter_<NN>.ogg
private _tryPlayAllClearAudioForLine = {
  params ["_player", "_leader", "_facKey", "_lineIndex"];

  private _idx = _lineIndex + 1;
  private _idxText = if (_idx < 10) then { format ["0%1", _idx] } else { str _idx };
  private _soundClass = format ["LBRC_%1_Radio_Chatter_%2", _facKey, _idxText];

  if !(isClass (missionConfigFile >> "CfgSounds" >> _soundClass)) then {
    _soundClass = format ["LBRC_%1_Radio_Chatter_01", _facKey];
  };

  if (_debug) then {
    [format ["LB_Chatter all-clear audio class: %1", _soundClass]] remoteExecCall ["systemChat", owner _player, false];
  };

  [_player, [_soundClass, 100, 1]] remoteExecCall ["say3D", owner _player, false];
  [_leader, [_soundClass, 100, 1]] remoteExecCall ["say3D", owner _player, false];
};

// Helper: play optional faction combat chatter audio for a specific line index.
// Audio is resolved by line position in the combat array:
//   Conversations\RadioChatter\<FAC>\<FAC>_Radio_Combat_<NN>.ogg
// Combat audio should only be played from the originating AI, never from the player.
private _tryPlayCombatAudioForLine = {
  params ["_player", "_speaker", "_facKey", "_lineIndex"];

  private _idx = _lineIndex + 1;
  private _idxText = if (_idx < 10) then { format ["0%1", _idx] } else { str _idx };
  private _soundClass = format ["LBRC_%1_Radio_Combat_%2", _facKey, _idxText];

  if !(isClass (missionConfigFile >> "CfgSounds" >> _soundClass)) exitWith {
    if (_debug) then {
      [format ["LB_Chatter combat audio missing for class: %1", _soundClass]] remoteExecCall ["systemChat", owner _player, false];
    };
  };

  if (_debug) then {
    [format ["LB_Chatter combat audio class: %1", _soundClass]] remoteExecCall ["systemChat", owner _player, false];
  };

  [_speaker, [_soundClass, 200, 1]] remoteExecCall ["say3D", owner _player, false];
};

// ---------------------------
// Function declarations
// ---------------------------
missionNamespace setVariable ["LB_FactionRegistry", createHashMap];

LB_FacReg_Set = {
  params ["_grp", "_key"];
  if (isNull _grp) exitWith {};
  private _reg = missionNamespace getVariable ["LB_FactionRegistry", createHashMap];
  _reg set [netId _grp, _key];
  missionNamespace setVariable ["LB_FactionRegistry", _reg];
};

LB_FacReg_Get = {
  params ["_grp", ["_default", "*"]];
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
  {
    createHashMapFromArray [
      ["ambient", createHashMap],
      ["allClear", createHashMap],
      ["combat", createHashMap]
    ]
  }
];

private _ConDB = [] call _ConGetter;
private _CombatSrc = _ConDB get "combat";
private _AmbientSrc = _ConDB get "ambient";
private _AllClearSrc = _ConDB get "allClear";

// Precomputed pools
private _CombatPools = createHashMap;
{
  private _fac = _x;
  private _arr = _CombatSrc get _fac;
  if (!isNil "_arr" && { _arr isEqualType [] }) then {
    _CombatPools set [_fac, _arr];
  };
} forEach (keys _CombatSrc);

private _AmbientPools = createHashMap;
{
  private _fac = _x;
  private _arr = _AmbientSrc get _fac;
  if (!isNil "_arr" && { _arr isEqualType [] }) then {
    private _clean = _arr select { _x isEqualType [] && { count _x > 0 } };
    _AmbientPools set [_fac, _clean];
  };
} forEach (keys _AmbientSrc);

if (isNil { _AmbientPools get "*" }) then {
  _AmbientPools set ["*", []];
};

private _AllClearPool = createHashMap;
{
  private _fac = _x;
  private _arr = _AllClearSrc get _fac;
  if (!isNil "_arr" && { _arr isEqualType [] }) then {
    _AllClearPool set [_fac, _arr];
    _AllClearPool set [toUpper _fac, _arr];
  };
} forEach (keys _AllClearSrc);

// ---------------------------
// Main Loop
// ---------------------------
while { true } do {
  private _reg = missionNamespace getVariable ["LB_FactionRegistry", createHashMap];
  private _alivePlayers = allPlayers select { isPlayer _x && { alive _x } };

  // Build a per-tick spatial player index so groups query nearby candidates only.
  // Cell size uses radio radius because it is the largest range checked in this loop.
  private _cellSize = _radioRadius;
  private _playerGrid = createHashMap;

  {
    private _player = _x;
    private _pos = getPosWorld _player;
    private _cx = floor ((_pos # 0) / _cellSize);
    private _cy = floor ((_pos # 1) / _cellSize);
    private _cellKey = format ["%1:%2", _cx, _cy];

    private _bucket = _playerGrid get _cellKey;
    if (isNil "_bucket") then {
      _bucket = [];
      _playerGrid set [_cellKey, _bucket];
    };

    _bucket pushBack [
      _player,
      (_player call _hasAnyRadio),
      (_player getVariable ["LB_radioAudioDisabled", false]),
      (_player getVariable ["LB_radioTranscriptDisabled", false])
    ];
    _playerGrid set [_cellKey, _bucket];
  } forEach _alivePlayers;

  {
    _x params ["_nid", "_fac"];
    private _grp = groupFromNetId _nid;

    if (isNull _grp) then {
      _reg deleteAt _nid;
    } else {
      private _leader = leader _grp;
      private _leaderValid = (!isNull _leader) && { alive _leader };
      private _playersNearLeader = [];
      private _isCombat = false;

      if (_leaderValid) then {
        private _leaderPos = getPosWorld _leader;
        private _lcx = floor ((_leaderPos # 0) / _cellSize);
        private _lcy = floor ((_leaderPos # 1) / _cellSize);

        for "_dx" from -1 to 1 do {
          for "_dy" from -1 to 1 do {
            private _cellKey = format ["%1:%2", (_lcx + _dx), (_lcy + _dy)];
            private _candidates = _playerGrid get _cellKey;

            if (!isNil "_candidates") then {
              {
                _x params ["_player", "_playerHasRadio", "_playerRadioAudioDisabled", "_playerRadioTranscriptDisabled"];
                private _distanceSqr = _player distanceSqr _leader;
                if (_distanceSqr <= _radioR2) then {
                  _playersNearLeader pushBack [_player, _playerHasRadio, _playerRadioAudioDisabled, _playerRadioTranscriptDisabled];
                };
              } forEach _candidates;
            };
          };
        };
      } else {
        continue;
      };

      if (count _playersNearLeader > 0) then {
        private _leaderBehaviour = behaviour _leader;
        _isCombat = _leaderBehaviour == "COMBAT";
        private _isCareless = _leaderBehaviour == "CARELESS";
        private _canPlayAmbient = !_isCombat && !_isCareless;
        private _canPlayAllClear = !_isCombat;
        private _canCarelessCombatBark = _isCareless && { side _leader in [opfor, independent] };

        private _facKey = [_grp, false] call _getFactionKey;
        private _combatLines = [_CombatPools, _facKey] call _getPoolForFaction;
        private _ambientConversations = [_AmbientPools, _facKey] call _getPoolForFaction;
        private _allClearFacKey = [_grp, true] call _getFactionKey;
        private _allClearLines = [_AllClearPool, _allClearFacKey] call _getPoolForFaction;

        {
          _x params ["_player", "_playerHasRadio", "_playerRadioAudioDisabled", "_playerRadioTranscriptDisabled"];

          private _distanceSqr = _player distanceSqr _leader;
          private _inTalkRange = _distanceSqr < _talkR2;
          private _sentCombatLine = false;

          if (
            (_isCombat && { random 1 < _probSpeekCombat })
            || { _canCarelessCombatBark && { _inTalkRange } }
          ) then {
            if (!isNil "_combatLines" && { count _combatLines > 0 }) then {
              private _combatLineIndex = floor (random (count _combatLines));
              private _selectedCombatLine = _combatLines # _combatLineIndex;

              if (!_playerRadioTranscriptDisabled) then {
                [_selectedCombatLine] remoteExec ["systemChat", _player, false];
              };

              if (!_playerRadioAudioDisabled) then {
                [_player, _leader, _facKey, _combatLineIndex] call _tryPlayCombatAudioForLine;
              };

              _sentCombatLine = true;
            };
          };

          if (
            !_sentCombatLine
            && { _canPlayAmbient }
            && { _inTalkRange }
            && { random 1 < _probSpeekAmbient }
          ) then {
            if (!isNil "_ambientConversations" && { count _ambientConversations > 0 }) then {
              [selectRandom _ambientConversations, _player] call _sendAmbientConversation;
            };
          };

          if (
            _playerHasRadio
            && { !_playerRadioAudioDisabled || !_playerRadioTranscriptDisabled }
            && { _canPlayAllClear }
            && { !_inTalkRange }
            && { _distanceSqr < _radioR2 }
            && { random 1 < _probAllClear }
          ) then {
            if (!isNil "_allClearLines" && { count _allClearLines > 0 }) then {
              private _lineIndex = floor (random (count _allClearLines));
              private _selectedLine = _allClearLines # _lineIndex;

              if (!_playerRadioTranscriptDisabled) then {
                [_selectedLine] remoteExec ["systemChat", _player, false];
              };

              if (!_playerRadioAudioDisabled) then {
                [_player, _leader, _allClearFacKey, _lineIndex] call _tryPlayAllClearAudioForLine;
              };
            };
          };

          sleep 0.001;
        } forEach _playersNearLeader;
      };

      if (_debug) then {
        [_alivePlayers, _leader, _leaderValid, (_playersNearLeader apply { _x # 0 }), _isCombat] call _FN_debug;
      };
    };

    sleep 0.01;
  } forEach _reg;

  sleep _sleepTime;
};