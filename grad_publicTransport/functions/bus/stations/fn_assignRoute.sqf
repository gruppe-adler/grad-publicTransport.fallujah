/*
	call with 

	[driver cursortarget, 1] call grad_publictransport_fnc_assignRoute;

*/

params ["_driver", "_line"];

_driver setVariable ["GRAD_publicTransport_currentLine", _line];
[_driver, _line] call GRAD_publicTransport_fnc_waypointGetNext;