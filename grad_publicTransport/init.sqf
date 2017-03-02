/*

	pathfinding by coding @armaworld.de

*/

// _signline1 = "grad_publicTransport\data\sign_line_101.paa";

// [ikarus, _signline1] call grad_publicTransport_fnc_attachSigns;



if (hasInterface) then {
	call grad_publicTransport_fnc_addACEInteraction;
};

if (isServer) then {
	[] execVM "grad_publicTransport\functions\taxi\init.sqf";
	
	call grad_publicTransport_fnc_replaceBuildings;
	call grad_publicTransport_fnc_replaceTrees;
	call grad_publicTransport_fnc_removeObjectsFromRoads;
};





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