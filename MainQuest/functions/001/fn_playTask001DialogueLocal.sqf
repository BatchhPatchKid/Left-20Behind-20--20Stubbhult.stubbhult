[] spawn {
    private _dialogueAudioClasses = [
        "LBMQ_task001_trader_01",
        "LBMQ_task001_trader_02"
    ];

    // [speaker, text, audioIndex]
    // audioIndex: 0 = no audio, 1..N = index into _dialogueAudioClasses
    private _lines = [
        ["Player", "Hello Contractor, I need to establish contact with PMC Group Alpha asap, can you assist with this?", 0, 3],
        ["Trader", "Bro what? Who just barges in a Contractor Office demanding something like that? You want me to get the president on the phone while I’m at it? No, I can’t do that. Not at least for free.", 1, 12],
        ["Player", "Okay, what is your price then?", 0, 3],
        ["Trader", "Don’t know yet, nobody around this area has asked that before, and I figure something like that is fairly hard, so for now, I do have something you can do while I talk to the higher ups. Go grab the weekly crate of medicine the US Army provides to my faction. Do that, and we’ll have an asking price for ya.", 2, 0]
    ];

    private _traderSource = objNull;
    if (!isNil "suTrader" && {!isNull suTrader}) then {
        _traderSource = suTrader;
    } else {
        _traderSource = missionNamespace getVariable ["LBMQ_task001OfficeAnchor", objNull];
    };

    {
        _x params ["_speaker", "_text", ["_audioIndex", 0], "_sleepTime"];

        systemChat format ["%1: %2", _speaker, _text];

        if (_audioIndex > 0 && {_speaker isEqualTo "Trader"} && {!isNull _traderSource}) then {
            private _soundClass = _dialogueAudioClasses param [_audioIndex - 1, ""];
            if (_soundClass != "") then {
                [_traderSource, [_soundClass, 100, 1]] remoteExecCall ["say3D", clientOwner];
            };
        };

        uiSleep _sleepTime;
    } forEach _lines;

    [player] remoteExecCall ["LBMQ_fnc_onTask001DialogueFinishedServer", 2];
};