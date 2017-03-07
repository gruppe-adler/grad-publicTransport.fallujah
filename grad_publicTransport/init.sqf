/*

	pathfinding by coding @armaworld.de

*/

// _signline1 = "grad_publicTransport\data\sign_line_101.paa";

// [ikarus, _signline1] call grad_publicTransport_fnc_attachSigns;



if (hasInterface) then {
	call grad_publicTransport_fnc_addACEInteraction;
};



[] execVM "grad_publicTransport\functions\taxi\init.sqf";

/*
call grad_publicTransport_fnc_replaceBuildings;
[
["palm_01.p3d",
"palm_02.p3d",
"palm_03.p3d",
"palm_04.p3d",
"palm_05.p3d",
"palm_10.p3d"]
,
["CUP_palm_01",
"CUP_palm_09",
"CUP_palm_03",
"CUP_palm_04",
"CUP_palm_05",
"CUP_palm_10"],
false
] call grad_publicTransport_fnc_replaceSingleTreeType; */

/*
_timeCountBuildings = call grad_publicTransport_fnc_replaceBuildings;


_timeCountTrees = [
["palm_01.p3d",
"palm_02.p3d",
"palm_03.p3d",
"palm_04.p3d",
"palm_05.p3d",
"palm_10.p3d"]
,
["a3\vegetation_f_exp\tree\t_CocosNucifera3s_tall_F.p3d",
"a3\vegetation_f_exp\tree\t_Cyathea_F.p3d",
"a3\vegetation_f_exp\tree\t_Cocos_tall_F.p3d",
"a3\vegetation_f_exp\tree\t_CocosNucifera2s_small_F.p3d",
"a3\vegetation_f_exp\tree\t_Cocos_small_F.p3d",
"a3\vegetation_f_exp\tree\t_CocosNucifera3s_tall_F.p3d"],
true
] call grad_publicTransport_fnc_replaceSingleTreeType;
*/

/*
_timeCountClutter = call grad_publicTransport_fnc_removeObjectsFromRoads;
*/










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