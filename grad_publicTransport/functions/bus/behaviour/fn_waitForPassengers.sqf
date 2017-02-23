params ["_driver"];

_bus = vehicle _driver;
_waitingTime = 10 + (random 2);

[_bus, ['doors_1', 'doors_2', 'doors_3']] call grad_publicTransport_fnc_openDoors;


// check if potential passengers are nearby
if (count (_driver nearEntities ["Man", 15]) > 0) then {
	_waitingTime = _waitingTime + 10;
};

sleep _waitingTime;

// make drive ready
[_bus] call grad_publicTransport_fnc_honk;
[_bus, ['doors_2']] call grad_publicTransport_fnc_closeDoors;
sleep 0.5;
[_bus, ['doors_3']] call grad_publicTransport_fnc_closeDoors;
sleep 0.75;
[_bus, ['doors_1']] call grad_publicTransport_fnc_closeDoors;
sleep 0.5;
[_bus] call grad_publicTransport_fnc_honk;

// next waypoint for this line
[_driver] call grad_publicTransport_fnc_waypointGetNext;