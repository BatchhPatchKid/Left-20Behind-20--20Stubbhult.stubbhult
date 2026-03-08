[] spawn {
    private _lines = [
        ["Scientist", "Ah, you made it. I have the medical crate prepped and ready.", 4],
        ["Player", "Good. I was sent to collect it and move it out immediately.", 3],
        ["Scientist", "Understood. We will mark the transfer complete on our end.", 4],
        ["System", "Medical supplies secured.", 1]
    ];

    {
        _x params ["_speaker", "_text", "_sleepTime"];
        systemChat format ["%1: %2", _speaker, _text];
        uiSleep _sleepTime;
    } forEach _lines;
};