{
	deleteMarkerLocal _x;
	nil
}
count CODI_Path_markersLocal;
CODI_Path_markersLocal = [];

private _dst = param[0, objNull];
private _marker = createMarker [str _dst, getPos _dst];
private _array = [];

_marker setMarkerShape "ICON";
_marker setMarkerColor "ColorWEST";
_marker setMarkerType "MIL_DOT";
CODI_Path_markers pushBack _marker;

while {!isNull _dst} do
{
	if ((getMarkerPos _marker) distance2d (getPos _dst) > 10) then
	{		
		_marker = createMarker [str _dst, getPos _dst];
		_marker setMarkerShape "ICON";
		_marker setMarkerColor "ColorWEST";
		_marker setMarkerType "MIL_DOT";
		_marker setMarkerAlpha 0;
	};
	CODI_Path_markers pushBack _marker;
	_dst = missionNamespace getVariable ["CODI_Path_parent_" + str _dst, objNull];
};

{

	_array = _array + [getMarkerPos _x];

} forEach CODI_Path_markers;

_array
