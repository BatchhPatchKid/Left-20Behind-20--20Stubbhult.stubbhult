params ["_lines", ["_audioClasses", []], ["_audioSource", objNull], ["_onFinished", {}]];

{
	_x params ["_speaker", "_text", ["_audioIndex", 0], ["_sleepTime", 0]];

	systemChat format ["%1: %2", _speaker, _text];

	if (_audioIndex > 0 && {_speaker != ""} && {!isNull _audioSource}) then {
		private _soundClass = _audioClasses param [_audioIndex - 1, ""];
		if (_soundClass != "") then {
			[_audioSource, [_soundClass, 100, 1]] remoteExecCall ["say3D", clientOwner];
		};
	};

	if (_sleepTime > 0) then {
		uiSleep _sleepTime;
	};
} forEach _lines;

call _onFinished;