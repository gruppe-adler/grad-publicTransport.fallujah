params["_src","_dst"];
private _closed = [];
private _open = [_src];
private _markerArray = [];

missionNamespace setVariable ["CODI_Path_g_" + str _src, 0];
CODI_Path_variables pushBack ("CODI_Path_g_" + str _src);
missionNamespace setVariable ["CODI_Path_f_" + str _src, [_src, _dst] call GRAD_publicTransport_fnc_h];
CODI_Path_variables pushBack ("CODI_Path_f_" + str _src);
while {!(_open isEqualTo [])} do
{
	private _current = objNull;
	{
		if ((missionNamespace getVariable ["CODI_Path_f_" + str _x, 999999]) < (missionNamespace getVariable ["CODI_Path_f_" + str _current, 999999])) then
		{
			_current = _x;
		};
		nil
	}
	count _open;
	if (_current == _dst) exitWith
	{
		_markerArray = [_dst] call GRAD_publicTransport_fnc_mark;
	};
	_open = _open - [_current];
	_closed pushBack _current;
	private _roads = roadsConnectedTo _current;
	{
		if (_x != _current) then
		{
			_roads pushBackUnique _x;
		};
		nil
	}
	count ((getPos _current) nearRoads 20);
	{
		if (!(_x in _closed)) then
		{
			private _tentativeG = (missionNamespace getVariable ["CODI_Path_g_" + str _current, 999999]) + ([_current, _x] call GRAD_publicTransport_fnc_cost);
			private _continue = false;
			if (!(_x in _open)) then
			{
				_open pushBack _x;
			}
			else
			{
				if (_tentativeG >= (missionNamespace getVariable ["CODI_Path_g_" + str _x, 999999])) then
				{
					_continue = true;
				};
				
			};
			if (!_continue) then
			{
				private _marker = createMarkerLocal [str _x, getPos _x];
				_marker setMarkerShapeLocal "ICON";
				_marker setMarkerColorLocal "ColorWEST";
				_marker setMarkerTypeLocal "MIL_DOT";
				_marker setMarkerAlphaLocal 0.25;
				CODI_Path_markersLocal pushBack _marker;
				missionNamespace setVariable ["CODI_Path_parent_" + str _x, _current];
				CODI_Path_variables pushBack ("CODI_Path_parent_" + str _x);
				missionNamespace setVariable ["CODI_Path_g_" + str _x, _tentativeG];
				CODI_Path_variables pushBack ("CODI_Path_g_" + str _x);
				missionNamespace setVariable ["CODI_Path_f_" + str _x, (missionNamespace getVariable ["CODI_Path_g_" + str _x, 999999]) + ([_x, _dst] call GRAD_publicTransport_fnc_h)];
				CODI_Path_variables pushBack ("CODI_Path_f_" + str _x);
			};
		};
		nil
	}
	count _roads;
};

_markerArray