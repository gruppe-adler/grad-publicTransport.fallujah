/*

	pathfinding by coding @armaworld.de

*/

[] execVM "grad_publicTransport\functions\bus\pathfinding_by_coding\init.sqf";


_signline1 = "grad_publicTransport\data\sign_line_101.paa";

[ikarus, _signline1] call grad_publicTransport_fnc_attachSigns;


/*
sign_front sign_front attachTo [ikarus, [0.2,5.05,-0.8]];  
sign_front  setVectorDirAndUp [[0,-1,0],[0,0,1]];
sign_back attachTo [ikarus, [1.2,-5.81,-0.65]];
*/


/*
	{
		[_x, 0] call GRAD_publicTransport_fnc_createDebugMarker;
	} forEach _waypoints; 
*/

// call GRAD_publicTransport_fnc_findStations;