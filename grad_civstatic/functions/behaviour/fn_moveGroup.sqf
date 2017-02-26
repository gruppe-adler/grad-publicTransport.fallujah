params ["_group"];

private ["_pos", "_movePosition", "_speed", "_poi"];

diag_log format ["group is %1, _leader is %2", _group, (_group select 0)];

_pos = (getpos (_group select (count _group - 1))); // get leader of group

_poi = [_pos] call grad_civstatic_fnc_getNextPOI;

_speed = selectRandom ["SLOW", "NORMAL", "FAST"];

{
	_movePosition = [_poi, [2,2.5], random 360] call SHK_POS;
	_x moveTo _movePosition;
	_x forceSpeed (_x getSpeed _speed);
} forEach _group;

diag_log format ["%1 moving to %2", _group, _poi];



/* DEBUG MARKER */
{ _x setMarkerAlpha 0; } forEach allMapMarkers;

[_pos, "colorBlue"] call grad_civstatic_fnc_createDebugMarker;
[_movePosition, "colorOrange"] call grad_civstatic_fnc_createDebugMarker;