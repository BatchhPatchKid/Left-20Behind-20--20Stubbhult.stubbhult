params ["_faction","_player"];

[_faction, _player] spawn {
    params ["_faction","_player"];

    // Helper to safely acquire a ppEffect handle, incrementing priority on collision
    private _fnc_createHandle = {
        params ["_effectName", "_basePriority"];
        private _handle = -1;
        private _priority = _basePriority;
        waitUntil {
            _handle = ppEffectCreate [_effectName, _priority];
            _priority = _priority + 1;
            _handle >= 0
        };
        _handle
    };

    switch (_faction) do {
        case "411": {
            private _bright  = 1;
            private _con     = 1;
            private _color   = 0;
            private _rgb     = 1;
            private _white   = 1.1;
            private _cDark   = 0.4;
            private _colorDark = 0.2;
            private _rgbC    = 0.5;

            private _hInv = ["ColorInversion",   2500] call _fnc_createHandle;
            private _hCC  = ["colorCorrections", 1501] call _fnc_createHandle;

            _hInv ppEffectEnable true;
            _hCC  ppEffectEnable true;

            while {((_bright < _white) or (_color < _colorDark) or (_con > _cDark) or (_rgb > _rgbC))} do {
                _hInv ppEffectAdjust [_color, _color, _color];
                _hInv ppEffectCommit 0;

                if (_color < _colorDark) then { _color = _color + 0.01; };

                _hCC ppEffectAdjust [_bright, _con, 0, [0.0, 0.0, 0.0, 0.0], [0.5, 1, 1, _rgb], [0.75, 0.25, 0, 1.0]];
                _hCC ppEffectCommit 0;

                if (_bright < _white) then  { _bright = _bright + 0.005; };
                if (_con > _cDark) then     { _con    = _con    - 0.05;  };
                if (_rgb > _rgbC) then      { _rgb    = _rgb    - 0.1;   };

                sleep 0.003;
            };

            _hInv ppEffectEnable false;
            _hCC  ppEffectEnable false;
            ppEffectDestroy _hInv;
            ppEffectDestroy _hCC;
        };
        case "Abom": {
            private _bright  = 1;
            private _con     = 1;
            private _brightC = 0.85;
            private _conC    = 0.3;

            private _hCC = ["colorCorrections", 1501] call _fnc_createHandle;
            _hCC ppEffectEnable true;

            while {((_bright > _brightC) or (_con > _conC))} do {
                _hCC ppEffectAdjust [_bright, _con, -0.002, [0.0, 0.0, 0.0, 0.0], [1.0, 0.6, 0.4, 0.6], [0.199, 0.587, 0.114, 0.0]];
                _hCC ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125; };
                if (_con > _conC) then       { _con    = _con    - 0.01;   };

                sleep 0.001;
            };

            _hCC ppEffectEnable false;
            ppEffectDestroy _hCC;
        };
        case "Mind": {
            private _color = 0;

            private _hInv = ["ColorInversion", 2500] call _fnc_createHandle;
            _hInv ppEffectEnable true;

            while {_color < 0.4} do {
                _hInv ppEffectAdjust [_color, _color, _color];
                _hInv ppEffectCommit 0;
                _color = _color + 0.005;
                sleep 0.003;
            };

            _hInv ppEffectEnable false;
            ppEffectDestroy _hInv;
        };
        case "Rake": {
            private _bright     = 1;
            private _con        = 1;
            private _color      = 0;
            private _white      = 1.6;
            private _cDark      = 0.5;
            private _colorDark  = 0.2;

            private _hInv = ["ColorInversion",   2500] call _fnc_createHandle;
            private _hCC  = ["colorCorrections", 1501] call _fnc_createHandle;

            _hInv ppEffectEnable true;
            _hCC  ppEffectEnable true;

            while {((_bright < _white) or (_color < _colorDark) or (_con > _cDark))} do {
                _hInv ppEffectAdjust [_color, _color, _color];
                _hInv ppEffectCommit 0;

                if (_color < _colorDark) then { _color = _color + 0.01; };

                _hCC ppEffectAdjust [_bright, _con, 0, [1, 1, 1, 0], [1, 1, 1, 0.5], [0.75, 0.25, 0, 1.0]];
                _hCC ppEffectCommit 0;

                if (_bright < _white) then { _bright = _bright + 0.0125;  };
                if (_con > _cDark) then    { _con    = _con    - 0.00625; };

                sleep 0.003;
            };

            _hInv ppEffectEnable false;
            _hCC  ppEffectEnable false;
            ppEffectDestroy _hInv;
            ppEffectDestroy _hCC;
        };
        case "Shadow": {
            private _bright  = 1;
            private _con     = 1;
            private _rgb     = 1;
            private _brightC = 0.60;
            private _conC    = 0.6;
            private _r       = 0.35;

            private _hCC = ["colorCorrections", 1501] call _fnc_createHandle;
            _hCC ppEffectEnable true;

            while {((_bright > _brightC) or (_con > _conC) or (_rgb > _r))} do {
                _hCC ppEffectAdjust [_bright, _con, 0, [0.2, 0.2, 1.0, -0.1], [1, 1, 0.9, _rgb], [0.5, 0.3, 1.0, -0.1]];
                _hCC ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125; };
                if (_con > _conC) then       { _con    = _con    - 0.01;   };
                if (_rgb > _r) then          { _rgb    = _rgb    - 0.01;   };

                sleep 0.001;
            };

            _hCC ppEffectEnable false;
            ppEffectDestroy _hCC;
        };
        case "Snatch": {
            private _bright  = 1;
            private _con     = 1;
            private _rgb     = 1;
            private _color   = 0;
            private _brightC = 0.85;
            private _conC    = 0.7;
            private _r       = 0.3;
            private _colorC  = 0.2;

            private _hInv = ["ColorInversion",   2500] call _fnc_createHandle;
            private _hCC  = ["colorCorrections", 1501] call _fnc_createHandle;

            _hInv ppEffectEnable true;
            _hCC  ppEffectEnable true;

            while {((_bright > _brightC) or (_color < _colorC) or (_con > _conC) or (_rgb > _r))} do {
                _hInv ppEffectAdjust [_color, _color, _color];
                _hInv ppEffectCommit 0;

                if (_color < _colorC) then { _color = _color + 0.01; };

                _hCC ppEffectAdjust [_bright, _con, 0, [0, 0, 0, 0], [0, 0.5, 0, 0.7], [0.95, _rgb, _rgb, 1]];
                _hCC ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125;  };
                if (_con > _conC) then       { _con    = _con    - 0.00625; };
                if (_rgb > _r) then          { _rgb    = _rgb    - 0.05;    };

                sleep 0.001;
            };

            _hInv ppEffectEnable false;
            _hCC  ppEffectEnable false;
            ppEffectDestroy _hInv;
            ppEffectDestroy _hCC;
        };
        case "Statue": {
            private _bright  = 1;
            private _con     = 1;
            private _rgb     = 1;
            private _color   = 0;
            private _brightC = 0.80;
            private _conC    = 0.6;
            private _r       = 0.3;
            private _colorC  = 0.01;

            private _hInv = ["ColorInversion",   2500] call _fnc_createHandle;
            private _hCC  = ["colorCorrections", 1501] call _fnc_createHandle;

            _hInv ppEffectEnable true;
            _hCC  ppEffectEnable true;

            while {((_bright > _brightC) or (_color < _colorC) or (_con > _conC) or (_rgb > _r))} do {
                _hInv ppEffectAdjust [_color, _color, _color];
                _hInv ppEffectCommit 0;

                if (_color < _colorC) then { _color = _color + 0.01; };

                _hCC ppEffectAdjust [_bright, _con, 0, [0.95, 0, 0, 0], [0.95, _rgb, _rgb, 0.5], [0.95, _rgb, _rgb, 1]];
                _hCC ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125;  };
                if (_con > _conC) then       { _con    = _con    - 0.00625; };
                if (_rgb > _r) then          { _rgb    = _rgb    - 0.05;    };

                sleep 0.001;
            };

            _hInv ppEffectEnable false;
            _hCC  ppEffectEnable false;
            ppEffectDestroy _hInv;
            ppEffectDestroy _hCC;

            hint format ["A feeling of imminent death comes over %1", name player];
        };
        case "Vamp": {
            private _bright  = 1;
            private _con     = 1;
            private _rgb     = 1;
            private _brightC = 0.8;
            private _conC    = 0.8;
            private _r       = 0;

            private _hCC = ["colorCorrections", 1501] call _fnc_createHandle;
            _hCC ppEffectEnable true;

            while {(_bright > _brightC) or (_con > _conC) or (_rgb > _r)} do {
                _hCC ppEffectAdjust [_bright, _con, 0, [1, 1, 1, 0], [1, 1, 1, _rgb], [0.75, 0.25, 0, 1.0]];
                _hCC ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.01; };
                if (_con > _conC) then       { _con    = _con    - 0.01; };
                if (_rgb > _r) then          { _rgb    = _rgb    - 0.05; };

                sleep 0.001;
            };

            _hCC ppEffectEnable false;
            ppEffectDestroy _hCC;
        };
        case "Various": {
            hint format ["A terrible feeling comes over %1", name _player];
            private _bright  = 1;
            private _con     = 1;
            private _rgb     = 1;
            private _color   = 0;
            private _brightC = 0.80;
            private _conC    = 0.6;
            private _r       = 0.3;
            private _colorC  = 0.01;

            private _hInv = ["ColorInversion",   2500] call _fnc_createHandle;
            private _hCC  = ["colorCorrections", 1501] call _fnc_createHandle;

            _hInv ppEffectEnable true;
            _hCC  ppEffectEnable true;

            while {(_bright > _brightC) or (_color < _colorC) or (_con > _conC) or (_rgb > _r)} do {
                _hInv ppEffectAdjust [_color, _color, _color];
                _hInv ppEffectCommit 0;

                if (_color < _colorC) then { _color = _color + 0.01; };

                _hCC ppEffectAdjust [_bright, _con, 0, [0.95, 0, 0, 0], [0.95, _rgb, _rgb, 0.5], [0.95, _rgb, _rgb, 1]];
                _hCC ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125;  };
                if (_con > _conC) then       { _con    = _con    - 0.00625; };
                if (_rgb > _r) then          { _rgb    = _rgb    - 0.05;    };

                sleep 0.001;
            };

            _hInv ppEffectEnable false;
            _hCC  ppEffectEnable false;
            ppEffectDestroy _hInv;
            ppEffectDestroy _hCC;
        };
        case "Hellspawn": {
            hintSilent format ["An awful feeling of imminent dread comes over you, %1. You fear your time has come to an end...", name _player];
            private _bright  = 1;
            private _con     = 1;
            private _rgb     = 1;
            private _color   = 0;
            private _brightC = 0.80;
            private _conC    = 0.6;
            private _r       = 0.3;
            private _colorC  = 0.01;

            private _hInv = ["ColorInversion",   2500] call _fnc_createHandle;
            private _hCC  = ["colorCorrections", 1501] call _fnc_createHandle;

            _hInv ppEffectEnable true;
            _hCC  ppEffectEnable true;

            while {(_bright > _brightC) or (_color < _colorC) or (_con > _conC) or (_rgb > _r)} do {
                _hInv ppEffectAdjust [_color, _color, _color];
                _hInv ppEffectCommit 0;

                if (_color < _colorC) then { _color = _color + 0.01; };

                _hCC ppEffectAdjust [_bright, _con, 0, [0.95, 0, 0, 0], [0.95, _rgb, _rgb, 0.5], [0.95, _rgb, _rgb, 1]];
                _hCC ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125;  };
                if (_con > _conC) then       { _con    = _con    - 0.00625; };
                if (_rgb > _r) then          { _rgb    = _rgb    - 0.05;    };

                sleep 0.001;
            };

            _hInv ppEffectEnable false;
            _hCC  ppEffectEnable false;
            ppEffectDestroy _hInv;
            ppEffectDestroy _hCC;
        };
        case "Goliath": {
            hintSilent format ["An unspeakable feeling of horror comes over you, %1. It is as if the personification of death awaits you nearby...", name _player];
            private _bright  = 1;
            private _con     = 1;
            private _rgb     = 1;
            private _color   = 0;
            private _brightC = 0.80;
            private _conC    = 0.6;
            private _r       = 0.3;
            private _colorC  = 0.01;

            private _hInv = ["ColorInversion",   2500] call _fnc_createHandle;
            private _hCC  = ["colorCorrections", 1501] call _fnc_createHandle;

            _hInv ppEffectEnable true;
            _hCC  ppEffectEnable true;

            while {(_bright > _brightC) or (_color < _colorC) or (_con > _conC) or (_rgb > _r)} do {
                _hInv ppEffectAdjust [_color, _color, _color];
                _hInv ppEffectCommit 0;

                if (_color < _colorC) then { _color = _color + 0.01; };

                _hCC ppEffectAdjust [_bright, _con, 0, [0.95, 0, 0, 0], [0.95, _rgb, _rgb, 0.5], [0.95, _rgb, _rgb, 1]];
                _hCC ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125;  };
                if (_con > _conC) then       { _con    = _con    - 0.00625; };
                if (_rgb > _r) then          { _rgb    = _rgb    - 0.05;    };

                sleep 0.001;
            };

            _hInv ppEffectEnable false;
            _hCC  ppEffectEnable false;
            ppEffectDestroy _hInv;
            ppEffectDestroy _hCC;
        };
        case "Wend": {
            private _bright = 1;
            private _bDark  = 0.65;
            private _con    = 1;
            private _cDark  = 0.45;

            private _hCC = ["colorCorrections", 1501] call _fnc_createHandle;
            _hCC ppEffectEnable true;

            while {_bright > _bDark or _con > _cDark} do {
                _hCC ppEffectAdjust [_bright, _con, 0, [0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 1]];
                _hCC ppEffectCommit 0;

                if (_bright > _bDark) then { _bright = _bright - 0.01; };
                if (_con > _cDark) then    { _con    = _con    - 0.01; };

                sleep 0.001;
            };

            _hCC ppEffectEnable false;
            ppEffectDestroy _hCC;
        };
        case "demon": {
            hint format ["A demonicly cold feeling comes over %1", name player];
            private _bright  = 1;
            private _con     = 1;
            private _red     = 1;
            private _green   = 1;
            private _blue    = 1;
            private _color   = 0;
            private _brightC = 0.8;
            private _conC    = 0.8;
            private _redC    = 0.4;
            private _greenC  = 0.5;
            private _blueC   = 0.8;
            private _colorC  = 0.01;

            private _hInv = ["ColorInversion",   2500] call _fnc_createHandle;
            private _hCC  = ["colorCorrections", 1501] call _fnc_createHandle;

            _hInv ppEffectEnable true;
            _hCC  ppEffectEnable true;

            while {(_bright > _brightC) or (_color < _colorC) or (_con > _conC) or (_red > _redC) or (_green > _greenC) or (_blue > _blueC)} do {
                _hInv ppEffectAdjust [_color, _color, _color];
                _hInv ppEffectCommit 0;

                if (_color < _colorC) then { _color = _color + 0.01; };

                _hCC ppEffectAdjust [_bright, _con, 0, [0.95, 0, 0, 0], [_red, _green, _blue, 0.5], [0.2, 0.5, 0.5, 0.0]];
                _hCC ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125;  };
                if (_con > _conC) then       { _con    = _con    - 0.00625; };
                if (_red > _redC) then       { _red    = _red    - 0.05;    };
                if (_green > _greenC) then   { _green  = _green  - 0.05;    };
                if (_blue > _blueC) then     { _blue   = _blue   - 0.05;    };

                sleep 0.001;
            };

            _hInv ppEffectEnable false;
            _hCC  ppEffectEnable false;
            ppEffectDestroy _hInv;
            ppEffectDestroy _hCC;
        };
    };
};