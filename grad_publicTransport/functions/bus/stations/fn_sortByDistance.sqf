params ["_array"];

private ["_roadPosBefore", "_nearestPos", "_resultingArray"];


_resultingArray = [_array select 0];
_roadPosBefore = _array select 0;

{
	
	if (_forEachIndex > 0) then {
		// diag_log format ["forEachIndex is %1", _forEachIndex];
		// diag_log format ["_roadPosBefore is %1", _roadPosBefore];
		// diag_log format ["_x is %1", _x];

		_nearestPos = [_array, _roadPosBefore] call BIS_fnc_nearestPosition; 

		_resultingArray = _resultingArray + [_nearestPos];

		// diag_log format ["_resultingArray is %1", _resultingArray];

		_roadPosBefore = _x;
		_array = _array - [_x];
		// diag_log format ["_array is %1", _array];
	};

} forEach _array;

{
	_marker = createMarker [format["%1", toString _x],_x];
	// diag_log format ["GRAD_CIV_DEBUG: Marker %1 created", _marker];
	_marker setMarkerShape "ICON";
	_marker setMarkerType "hd_dot";
	_marker setMarkerAlpha 1;
	_marker setMarkerColor "ColorRed";
	_marker setMarkerText (str _forEachIndex);

} forEach _resultingArray;