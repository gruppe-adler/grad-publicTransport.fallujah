params ["_array", "_endpoint"];

_vectorizedArray = [];

_posBefore = _array select 0;
_dir = _posBefore getDir _endpoint;

_vectorizedArray = _vectorizedArray + [[_posBefore, _dir]];

{
	if (_forEachIndex > 0) then {
		_dir = _x getDir _posBefore;

		diag_log format ["dir %1",_dir];
		_vectorizedArray = _vectorizedArray + [[_x, _dir]];
		_posBefore = _x;
	};
} forEach _array;

_vectorizedArray