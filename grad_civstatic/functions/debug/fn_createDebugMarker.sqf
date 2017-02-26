params ["_pos", ["_color", "colorYellow"]];

_marker = createMarker [format["%1", toString _pos],_pos];

_marker setMarkerShape "ICON";
_marker setMarkerType "hd_dot";

_marker setMarkerAlpha 1;
_marker setMarkerColor _color;