[] spawn {
    private _lines = [
        ["Player", "Hello Contractor, I need to establish contact with PMC Group Alpha asap, can you assist with this?"],
        ["Trader", "Bro what? Who just barges in a Contractor Office demanding something like that? You want me to get the president on the phone while I’m at it? No, I can’t do that. Not at least for free."],
        ["Player", "Okay, what is your price then?"],
        ["Trader", "Don’t know yet, nobody around this area has asked that before, and I figure something like that is fairly hard, so for now, I do have something you can do while I talk to the higher ups. Go grab the weekly crate of medicine the US Army provides to my faction. Do that, and we’ll have an asking price for ya."]
    ];

    {
        systemChat format ["%1: %2", _x select 0, _x select 1];
        uiSleep 6;
    } forEach _lines;

    [player] remoteExecCall ["LBMQ_fnc_onTask001DialogueFinishedServer", 2];
};