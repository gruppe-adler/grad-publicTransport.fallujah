params["_src","_dst", ["_lineNumber", 1]];

private _srcRoad = [_src] call GRAD_publicTransport_fnc_getNearestRoad;
private _dstRoad = [_dst] call GRAD_publicTransport_fnc_getNearestRoad;

if (isNull _srcRoad || isNull _dstRoad) exitWith {hint "src or dst not close to a road"};
_rawData = [_srcRoad, _dstRoad] call GRAD_publicTransport_fnc_aStar;
_targetRouteDir = [_rawData, _dst] call GRAD_publicTransport_fnc_addVectors;

_returnRaw = [_rawData] call GRAD_publicTransport_fnc_getReturnRoute;
_returnRouteDir = [_returnRaw, _src] call GRAD_publicTransport_fnc_addVectors;

_stationArrayUp = [];
_stationArrayDown = [];

diag_log format ["_targetRoute %1", _targetRouteDir];
diag_log format ["_returnRoute %1", _returnRouteDir];

_nextStation = [];

{

  _nextStation = [_x select 0, _x select 1] call GRAD_publicTransport_fnc_getNextStation;

  if (_nextStation select 0) then {
  		_stationArrayUp = _stationArrayUp + [_nextStation select 1];
  };
} forEach _targetRouteDir;

{
	[getPos _x, "colorRed", _forEachIndex] call GRAD_publicTransport_fnc_createDebugMarker;
} forEach _stationArrayUp;


/* return route */
_nextStation = [];

{
  _nextStation = [_x select 0, _x select 1] call GRAD_publicTransport_fnc_getNextStation;

  if (_nextStation select 0) then {
  		_stationArrayDown = _stationArrayDown + [_nextStation select 1];
  };
} forEach _returnRouteDir;

{
	[getPos _x, "colorBlue", _forEachIndex] call GRAD_publicTransport_fnc_createDebugMarker;
} forEach _stationArrayDown;



missionNameSpace setVariable ["GRAD_publicTransport_Stations_Line_" + (str _lineNumber), [_stationArrayUp, _stationArrayDown], true];