params ["_faction", ["_player", objNull]];

[_faction, _player] spawn {
    params ["_faction", ["_player", objNull]];

    if (!hasInterface) exitWith {};

    waitUntil {
        !isNull player && {time > 0}
    };

    private _targetPlayer = if (isNull _player) then { player } else { _player };

    switch (_faction) do {
        case "411": {
            private _bright     = 1;
            private _con        = 1;
            private _color      = 0;
            private _rgb        = 1;
            private _white      = 1.1;
            private _cDark      = 0.4;
            private _colorDark  = 0.2;
            private _rgbC       = 0.5;

            while {((_bright < _white) or (_color < _colorDark) or (_con > _cDark) or (_rgb > _rgbC))} do {
                "ColorInversion" ppEffectAdjust [_color, _color, _color];
                "ColorInversion" ppEffectEnable true;
                "ColorInversion" ppEffectCommit 0;

                if (_color < _colorDark) then { _color = _color + 0.01; };

                "colorCorrections" ppEffectAdjust [_bright, _con, 0, [0.0, 0.0, 0.0, 0.0], [0.5, 1, 1, _rgb], [0.75, 0.25, 0, 1.0]];
                "colorCorrections" ppEffectEnable true;
                "colorCorrections" ppEffectCommit 0;

                if (_bright < _white) then  { _bright = _bright + 0.005; };
                if (_con > _cDark) then     { _con    = _con    - 0.05;  };
                if (_rgb > _rgbC) then      { _rgb    = _rgb    - 0.1;   };

                sleep 0.003;
            };
        };
        case "Abom": {
            private _bright  = 1;
            private _con     = 1;
            private _brightC = 0.85;
            private _conC    = 0.3;

            while {((_bright > _brightC) or (_con > _conC))} do {
                "colorCorrections" ppEffectAdjust [_bright, _con, -0.002, [0.0, 0.0, 0.0, 0.0], [1.0, 0.6, 0.4, 0.6], [0.199, 0.587, 0.114, 0.0]];
                "colorCorrections" ppEffectEnable true;
                "colorCorrections" ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125; };
                if (_con > _conC) then       { _con    = _con    - 0.01;   };

                sleep 0.001;
            };
        };
        case "Mind": {
            private _color = 0;

            while {_color < 0.4} do {
                "ColorInversion" ppEffectAdjust [_color, _color, _color];
                "ColorInversion" ppEffectEnable true;
                "ColorInversion" ppEffectCommit 0;
                _color = _color + 0.005;
                sleep 0.003;
            };
        };
        case "Rake": {
            private _bright     = 1;
            private _con        = 1;
            private _color      = 0;
            private _white      = 1.6;
            private _cDark      = 0.5;
            private _colorDark  = 0.2;

            while {((_bright < _white) or (_color < _colorDark) or (_con > _cDark))} do {
                "ColorInversion" ppEffectAdjust [_color, _color, _color];
                "ColorInversion" ppEffectEnable true;
                "ColorInversion" ppEffectCommit 0;

                if (_color < _colorDark) then { _color = _color + 0.01; };

                "colorCorrections" ppEffectAdjust [_bright, _con, 0, [1, 1, 1, 0], [1, 1, 1, 0.5], [0.75, 0.25, 0, 1.0]];
                "colorCorrections" ppEffectEnable true;
                "colorCorrections" ppEffectCommit 0;

                if (_bright < _white) then { _bright = _bright + 0.0125;  };
                if (_con > _cDark) then    { _con    = _con    - 0.00625; };

                sleep 0.003;
            };
        };
        case "Shadow": {
            private _bright  = 1;
            private _con     = 1;
            private _rgb     = 1;
            private _brightC = 0.60;
            private _conC    = 0.6;
            private _r       = 0.35;

            while {((_bright > _brightC) or (_con > _conC) or (_rgb > _r))} do {
                "colorCorrections" ppEffectAdjust [_bright, _con, 0, [0.2, 0.2, 1.0, -0.1], [1, 1, 0.9, _rgb], [0.5, 0.3, 1.0, -0.1]];
                "colorCorrections" ppEffectEnable true;
                "colorCorrections" ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125; };
                if (_con > _conC) then       { _con    = _con    - 0.01;   };
                if (_rgb > _r) then          { _rgb    = _rgb    - 0.01;   };

                sleep 0.001;
            };
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

            while {((_bright > _brightC) or (_color < _colorC) or (_con > _conC) or (_rgb > _r))} do {
                "ColorInversion" ppEffectAdjust [_color, _color, _color];
                "ColorInversion" ppEffectEnable true;
                "ColorInversion" ppEffectCommit 0;

                if (_color < _colorC) then { _color = _color + 0.01; };

                "colorCorrections" ppEffectAdjust [_bright, _con, 0, [0, 0, 0, 0], [0, 0.5, 0, 0.7], [0.95, _rgb, _rgb, 1]];
                "colorCorrections" ppEffectEnable true;
                "colorCorrections" ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125;  };
                if (_con > _conC) then       { _con    = _con    - 0.00625; };
                if (_rgb > _r) then          { _rgb    = _rgb    - 0.05;    };

                sleep 0.001;
            };
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

            while {((_bright > _brightC) or (_color < _colorC) or (_con > _conC) or (_rgb > _r))} do {
                "ColorInversion" ppEffectAdjust [_color, _color, _color];
                "ColorInversion" ppEffectEnable true;
                "ColorInversion" ppEffectCommit 0;

                if (_color < _colorC) then { _color = _color + 0.01; };

                "colorCorrections" ppEffectAdjust [_bright, _con, 0, [0.95, 0, 0, 0], [0.95, _rgb, _rgb, 0.5], [0.95, _rgb, _rgb, 1]];
                "colorCorrections" ppEffectEnable true;
                "colorCorrections" ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125;  };
                if (_con > _conC) then       { _con    = _con    - 0.00625; };
                if (_rgb > _r) then          { _rgb    = _rgb    - 0.05;    };

                sleep 0.001;
            };

            hint format ["A feeling of imminent death comes over %1", name _targetPlayer];
        };
        case "Vamp": {
            private _bright  = 1;
            private _con     = 1;
            private _rgb     = 1;
            private _brightC = 0.8;
            private _conC    = 0.8;
            private _r       = 0;

            while {(_bright > _brightC) or (_con > _conC) or (_rgb > _r)} do {
                "colorCorrections" ppEffectAdjust [_bright, _con, 0, [1, 1, 1, 0], [1, 1, 1, _rgb], [0.75, 0.25, 0, 1.0]];
                "colorCorrections" ppEffectEnable true;
                "colorCorrections" ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.01; };
                if (_con > _conC) then       { _con    = _con    - 0.01; };
                if (_rgb > _r) then          { _rgb    = _rgb    - 0.05; };

                sleep 0.001;
            };
        };
        case "Various": {
            hint format ["A terrible feeling comes over %1", name _targetPlayer];

            private _bright  = 1;
            private _con     = 1;
            private _rgb     = 1;
            private _color   = 0;
            private _brightC = 0.80;
            private _conC    = 0.6;
            private _r       = 0.3;
            private _colorC  = 0.01;

            while {(_bright > _brightC) or (_color < _colorC) or (_con > _conC) or (_rgb > _r)} do {
                "ColorInversion" ppEffectAdjust [_color, _color, _color];
                "ColorInversion" ppEffectEnable true;
                "ColorInversion" ppEffectCommit 0;

                if (_color < _colorC) then { _color = _color + 0.01; };

                "colorCorrections" ppEffectAdjust [_bright, _con, 0, [0.95, 0, 0, 0], [0.95, _rgb, _rgb, 0.5], [0.95, _rgb, _rgb, 1]];
                "colorCorrections" ppEffectEnable true;
                "colorCorrections" ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125;  };
                if (_con > _conC) then       { _con    = _con    - 0.00625; };
                if (_rgb > _r) then          { _rgb    = _rgb    - 0.05;    };

                sleep 0.001;
            };
        };
        case "Hellspawn": {
            hintSilent format ["An awful feeling of imminent dread comes over you, %1. You fear your time has come to an end...", name _targetPlayer];

            private _bright  = 1;
            private _con     = 1;
            private _rgb     = 1;
            private _color   = 0;
            private _brightC = 0.80;
            private _conC    = 0.6;
            private _r       = 0.3;
            private _colorC  = 0.01;

            while {(_bright > _brightC) or (_color < _colorC) or (_con > _conC) or (_rgb > _r)} do {
                "ColorInversion" ppEffectAdjust [_color, _color, _color];
                "ColorInversion" ppEffectEnable true;
                "ColorInversion" ppEffectCommit 0;

                if (_color < _colorC) then { _color = _color + 0.01; };

                "colorCorrections" ppEffectAdjust [_bright, _con, 0, [0.95, 0, 0, 0], [0.95, _rgb, _rgb, 0.5], [0.95, _rgb, _rgb, 1]];
                "colorCorrections" ppEffectEnable true;
                "colorCorrections" ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125;  };
                if (_con > _conC) then       { _con    = _con    - 0.00625; };
                if (_rgb > _r) then          { _rgb    = _rgb    - 0.05;    };

                sleep 0.001;
            };
        };
        case "Goliath": {
            hintSilent format ["An unspeakable feeling of horror comes over you, %1. It is as if the personification of death awaits you nearby...", name _targetPlayer];

            private _bright  = 1;
            private _con     = 1;
            private _rgb     = 1;
            private _color   = 0;
            private _brightC = 0.80;
            private _conC    = 0.6;
            private _r       = 0.3;
            private _colorC  = 0.01;

            while {(_bright > _brightC) or (_color < _colorC) or (_con > _conC) or (_rgb > _r)} do {
                "ColorInversion" ppEffectAdjust [_color, _color, _color];
                "ColorInversion" ppEffectEnable true;
                "ColorInversion" ppEffectCommit 0;

                if (_color < _colorC) then { _color = _color + 0.01; };

                "colorCorrections" ppEffectAdjust [_bright, _con, 0, [0.95, 0, 0, 0], [0.95, _rgb, _rgb, 0.5], [0.95, _rgb, _rgb, 1]];
                "colorCorrections" ppEffectEnable true;
                "colorCorrections" ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125;  };
                if (_con > _conC) then       { _con    = _con    - 0.00625; };
                if (_rgb > _r) then          { _rgb    = _rgb    - 0.05;    };

                sleep 0.001;
            };
        };
        case "Wend": {
            private _bright = 1;
            private _bDark  = 0.65;
            private _con    = 1;
            private _cDark  = 0.45;

            while {(_bright > _bDark) or (_con > _cDark)} do {
                "colorCorrections" ppEffectAdjust [_bright, _con, 0, [0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 1]];
                "colorCorrections" ppEffectEnable true;
                "colorCorrections" ppEffectCommit 0;

                if (_bright > _bDark) then { _bright = _bright - 0.01; };
                if (_con > _cDark) then    { _con    = _con    - 0.01; };

                sleep 0.001;
            };
        };
        case "demon": {
            hint format ["A demonicly cold feeling comes over %1", name _targetPlayer];

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

            while {(_bright > _brightC) or (_color < _colorC) or (_con > _conC) or (_red > _redC) or (_green > _greenC) or (_blue > _blueC)} do {
                "ColorInversion" ppEffectAdjust [_color, _color, _color];
                "ColorInversion" ppEffectEnable true;
                "ColorInversion" ppEffectCommit 0;

                if (_color < _colorC) then { _color = _color + 0.01; };

                "colorCorrections" ppEffectAdjust [_bright, _con, 0, [0.95, 0, 0, 0], [_red, _green, _blue, 0.5], [0.2, 0.5, 0.5, 0.0]];
                "colorCorrections" ppEffectEnable true;
                "colorCorrections" ppEffectCommit 0;

                if (_bright > _brightC) then { _bright = _bright - 0.0125;  };
                if (_con > _conC) then       { _con    = _con    - 0.00625; };
                if (_red > _redC) then       { _red    = _red    - 0.05;    };
                if (_green > _greenC) then   { _green  = _green  - 0.05;    };
                if (_blue > _blueC) then     { _blue   = _blue   - 0.05;    };

                sleep 0.001;
            };
        };
    };
};