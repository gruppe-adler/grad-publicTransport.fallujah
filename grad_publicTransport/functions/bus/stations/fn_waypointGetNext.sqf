params ["_driver", "_busline"];

_busline = _driver getVariable ["GRAD_publicTransport_currentLine", 1];
_currentStationIndex = _driver getVariable ["GRAD_publicTransport_currentStationIndex", 0];
_allStations = missionNamespace getVariable ["GRAD_publicTransport_Stations_Line_" + (str _busline), []];

_stationCount = count (_allStations select 0);
_nextStationIndex = 0;


if (_stationCount == 0) exitWith { diag_log format ["no stations found"]; };


if (_currentStationIndex >= _stationCount - 1) then {
	_nextStationIndex = 0;
	_currentStationIndex = _driver setVariable ["GRAD_publicTransport_currentStationIndex", _nextStationIndex];

	hintsilent format ["resetting currentstationindex"];
	
} else {
	_nextStationIndex = _currentStationIndex + 1;
	_currentStationIndex = _driver setVariable ["GRAD_publicTransport_currentStationIndex", _nextStationIndex];
};

_nextPosition = getPos (_allStations select 0 select _nextStationIndex);
[_driver, _nextPosition] call GRAD_publicTransport_fnc_waypointsCreate;