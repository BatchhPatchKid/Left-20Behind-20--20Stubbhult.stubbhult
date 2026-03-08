[] spawn {
    private _lines = [
        ["Player", "Good afternoon soldier, I was sent here by the Survivor’s Union to pick up the medical supply crate", 5],
        ["Scientist", "Good, we were expecting you 15 minutes ago. No matter, at least you’re here now. How’s the Union doing? Any new illness breakouts in the area recently?", 8],
        ["Player", "I don’t know. I just got here, so I’m not sure of the state of Survivor’s Union at the moment.", 5],
        ["Scientist", "I see, if that’s the case, when you get back to the Survivor’s Union Contractor’s Office, make sure you take a vial of this drug. It’ll keep you healthy from the outbreak.", 8],
        ["Player", "I thought there wasn’t a cure for the virus yet?", 4],
        ["Scientist", "Just trust me, you’ll want to take the medicine. Now go, before the medicine goes bad out in this weather", 6]
    ];

    {
        _x params ["_speaker", "_text", "_sleepTime"];
        systemChat format ["%1: %2", _speaker, _text];
        uiSleep _sleepTime;
    } forEach _lines;
};