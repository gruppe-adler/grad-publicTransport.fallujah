params ["_pos", ["_color", "colorRed"], "_number"];

_marker = createMarker [format["%1", toString _pos],_pos];


diag_log format ["GRAD_publicTransport: Marker %1 created", _pos];


_marker setMarkerShape "ICON";
_marker setMarkerType "hd_dot";

_marker setMarkerAlpha 1;
_marker setMarkerColor _color;
_marker setMarkerText (str _number);

