[] spawn {
    private _lines = [
        ["Player", "Here's the medicine I was tasked to bring you.", 4],
        ["Scientist", "Very good, very good. I was informed about you by leadership. They want you to investigate a missing Survivor's Union Patrol west of here. I have all the details on this piece of paper.", 9],
        ["Scientist", "Well Survivor, if you would, please help us take out those bandits. It would be greatly appreciated.", 7]
    ];

    {
        _x params ["_speaker", "_text", "_sleepTime"];
        systemChat format ["%1: %2", _speaker, _text];
        uiSleep _sleepTime;
    } forEach _lines;
};