params ["_pos", "_dir"];

private ["_station", "_stations", "_foundStation"];

_stations = (nearestTerrainObjects [_pos, [ "BUSSTOP"], 16]);
_foundStation = false;
_station = objNull;

if (count _stations > 0) then {
	_station = _stations select 0;

	if ([_pos, _station, _dir] call GRAD_publicTransport_fnc_isOnRightSide) then {
		_foundStation = true;
	};
};

diag_log format ["found station is %1", _foundStation];

[_foundStation, _station]