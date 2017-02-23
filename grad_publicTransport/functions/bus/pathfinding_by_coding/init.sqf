/*
	code by coding @armaworld.de, splitted into files by nomisum
*/


CODI_Path_markers = [];
CODI_Path_markersLocal = [];
CODI_Path_variables = [];

/*

player addAction["Calculate Route", {call GRAD_publicTransport_fnc_start;}, [], 0, false, true, "", "count CODI_Path_markers == 0"];
player addAction["Delete Route", {call GRAD_publicTransport_fnc_removeMarkers;}, [], 0, false, true, "", "count CODI_Path_markers > 0"];

player addEventHandler ["Respawn", {
	player addAction["Calculate Route", {call GRAD_publicTransport_fnc_start;}, [], 0, false, true, "", "count CODI_Path_markers == 0"];
	player addAction["Delete Route", {call GRAD_publicTransport_fnc_removeMarkers;}, [], 0, false, true, "", "count CODI_Path_markers > 0"];
}]; 

*/