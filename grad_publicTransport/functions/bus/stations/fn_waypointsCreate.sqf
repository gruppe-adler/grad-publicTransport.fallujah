params ["_driver", "_pos"];

_wp = (group _driver) addWaypoint [_pos, 0];

[_wp] call grad_publicTransport_fnc_waypointSetStatements;