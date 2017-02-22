params ["_pos", ["_dir", 0]];

_marker = createMarker [format["%1", toString _pos],_pos];
// diag_log format ["GRAD_CIV_DEBUG: Marker %1 created", _marker];
_marker setMarkerShape "ICON";
_marker setMarkerType "hd_arrow";
_marker setMarkerAlpha 1;
_marker setMarkerColor "ColorRed";
_marker setMarkerText "";
_marker setMarkerDir _dir;

