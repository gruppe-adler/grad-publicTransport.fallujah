params["_src","_dst"];
private _dist = ((getPos _src) distance (getPos _dst))*1;

_stationMapObjects = (nearestTerrainObjects [getPos _dst, [ "BUSSTOP"], 20]);
if (count _stationMapObjects == 0) then {
	diag_log format ["dist %1 added 10", _dist];
	_dist = _dist + 10;
}; 

_dist