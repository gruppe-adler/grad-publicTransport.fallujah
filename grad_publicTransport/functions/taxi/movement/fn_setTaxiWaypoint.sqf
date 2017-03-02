params ["_position"];

_driverGroup = group driver vehicle player;

_wp = _driverGroup addWaypoint [_position, 0];

_driverGroup setSpeedMode "FULL";

call grad_publicTransport_fnc_taxiDialogClose;

vehicle player lockCargo [vehicle player getCargoIndex player, true];

_wp setWaypointStatements ["true", "
	vehicle player vehicleChat format ['Macht bisher %1 cr, willste aussteigen?!', TAXAMETER_PRICE];
	vehicle player lockCargo [vehicle player getCargoIndex player, false];
"];