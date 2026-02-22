params ["_pos","_objType","_xDir","_yDir","_xDis","_yDis","_zDis","_prob"];
_object = "";
if (random 1 > _prob) then {
	private _x = (_pos#0)+_xDis;
	private _y = (_pos#1)+_yDis;
	private _snap = (_zDis <= 0);
	private _posATL = [_x,_y,(if (_snap) then {0} else {_zDis})];

	_object = createVehicle [_objType,[0,0,0],[],0,"CAN_COLLIDE"];
	_object allowDamage false;
	_object setPosATL _posATL;

	private _dir = [_xDir,_yDir,0];
	if ((vectorMagnitude _dir) < 0.001) then { _dir = [1,0,0]; } else { _dir = vectorNormalized _dir; };

	if (_snap) then {
		private _up = surfaceNormal _posATL;
		private _dirOnPlane = _dir vectorDiff (_up vectorMultiply (_dir vectorDotProduct _up));
		if ((vectorMagnitude _dirOnPlane) < 0.001) then {
			_dirOnPlane = [0,1,0] vectorDiff (_up vectorMultiply ([0,1,0] vectorDotProduct _up));
		};
		_object setVectorDirAndUp [vectorNormalized _dirOnPlane,_up];
	} else {
		_object setVectorDirAndUp [_dir,[0,0,1]];
	};

	_object enableSimulationGlobal false;
};
_object