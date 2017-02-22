private ["_mapCenter", "_stationMapObjects", "_stationsArray"];

_mapCenter = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");

_stationMapObjects = (nearestTerrainObjects [_mapCenter, [ "BUSSTOP"], 20000]);  
_stationsArray = [];
_stationsPosArray = [];

  
{
	// station is [_road, _dir]
	_station = [_x] call GRAD_publicTransport_fnc_getStationDataAToB;
	if (count _station > 0) then {
		_stationsArray = _stationsArray + [_station];
		_stationsPosArray = _stationsPosArray + [_station select 1];
	};
	// [getPos _x, _station select 1] call GRAD_publicTransport_fnc_createDebugMarker;
} foreach _stationMapObjects;

_sortedStationsPosArray = [_stationsPosArray] call GRAD_publicTransport_fnc_sortByDistance;