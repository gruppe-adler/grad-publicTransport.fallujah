params ["_driver", "_busline"];

_busline = _driver getVariable ["GRAD_publicTransport_currentLine", 1];
_currentStationIndex = _driver getVariable ["GRAD_publicTransport_currentStationIndex", -1];
_allStations = missionNamespace getVariable ["GRAD_publicTransport_Stations_Line_" + (str _busline), []];

_up = (_driver getVariable ["GRAD_publicTransport_drivingUp", true]);

_stationSelector = 0;

if (!_up) then {
	_stationSelector = 1;
};

_stationCount = count (_allStations select _stationSelector);

_nextStationIndex = 0;

// exit if no stations are recorded
if (_stationCount == 0) exitWith { diag_log format ["no stations found"]; };

// exit if its the first station you are going to
if (_currentStationIndex == -1) exitWith {
	_nextPosition = getPos (_allStations select _stationSelector select 0);
	[_driver, _nextPosition] call GRAD_publicTransport_fnc_waypointsCreate;

	_driver setVariable ["GRAD_publicTransport_currentStationIndex", 0];

	hintsilent format ["next station: %1 on route %2", _nextStationIndex, _stationSelector];
};

// if you reach the last stop on the line, go back to start
if (_currentStationIndex >= _stationCount - 1) then {

	// reverse direction
	_driver setVariable ["GRAD_publicTransport_drivingUp", !(_driver getVariable ["GRAD_publicTransport_drivingUp", true])];
	_driver setVariable ["GRAD_publicTransport_currentStationIndex", 0];

	hintsilent format ["reversing route"];
	
} else {
	_nextStationIndex = _currentStationIndex + 1;
	_driver setVariable ["GRAD_publicTransport_currentStationIndex", _nextStationIndex];

	hintsilent format ["next station: %1 on route %2", _nextStationIndex, _stationSelector];
};

_nextPosition = getPos (_allStations select _stationSelector select _nextStationIndex);
[_driver, _nextPosition] call GRAD_publicTransport_fnc_waypointsCreate;

