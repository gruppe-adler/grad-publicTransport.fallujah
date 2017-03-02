params ["_pos", ["_color", "colorRed"], ["_number", -1]];

_marker = createMarker [format["%1", toString _pos],_pos];


diag_log format ["GRAD_publicTransport: Marker %1 created", _pos];


_marker setMarkerShape "ICON";
_marker setMarkerType "hd_dot";

_marker setMarkerAlpha 1;
_marker setMarkerColor _color;

if (_number > -1) then {
	_marker setMarkerText (str _number);
};