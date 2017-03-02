_trees_tall = (nearestTerrainObjects [[worldSize/2, worldSize/2], ["TREE"], worldSize/2]);
_trees_small = (nearestTerrainObjects [[worldSize/2, worldSize/2], ["TREE SMALL"], worldSize/2]);

/*_original_palms = [
["Land_shez_palm_01", ["a3\vegetation_f_exp\tree\t_CocosNucifera3s_tall_F.p3d", "a3\vegetation_f_exp\tree\t_Cocos_tall_F.p3d"]],
["Land_shez_palm_02", ["a3\vegetation_f_exp\tree\t_CocosNucifera3s_tall_F.p3d", "a3\vegetation_f_exp\tree\t_Cocos_tall_F.p3d"]],
["Land_shez_palm_03", ["a3\vegetation_f_exp\tree\t_CocosNucifera3s_tall_F.p3d", "a3\vegetation_f_exp\tree\t_Cocos_tall_F.p3d"]],
["Land_shez_palm_04", ["a3\vegetation_f_exp\tree\t_Cyathea_F.p3d"]],
["Land_shez_palm_10", ["a3\vegetation_f_exp\tree\t_CocosNucifera3s_tall_F.p3d", "a3\vegetation_f_exp\tree\t_Cocos_tall_F.p3d"]]
];*/


/* removed because of shitty bending
"a3\vegetation_f_exp\tree\t_CocosNucifera3s_bend_F.p3d" 
"a3\vegetation_f_exp\tree\t_cocos_bend_f.p3d" */
_apex_tall = [
	"a3\vegetation_f_exp\tree\t_CocosNucifera3s_tall_F.p3d",
	"a3\vegetation_f_exp\tree\t_Cyathea_F.p3d",
	"a3\vegetation_f_exp\tree\t_Cocos_tall_F.p3d"

];

_apex_small = [
	"a3\vegetation_f_exp\tree\t_CocosNucifera2s_small_F.p3d",
	"a3\vegetation_f_exp\tree\t_Cocos_small_F.p3d"
];

_hideObject = {
	params ["_obj"];

	if (isMultiplayer) then {
		hideObjectGlobal _x;
	} else {
		hideObject _x;
	};		
};


_iterateTrees = {
	params ["_array", "_replacementArray", "_count"];

	{	
		_tree = _x;
		_pos = getPosATL _x;
		[_tree] call _hideObject;
		_replacementTree = createSimpleObject [selectRandom _replacementArray, _pos];
		_onGround = [getPosATL _replacementTree select 0, getPosATL _replacementTree select 1 , 0];
		_replacementTree setPosATL _onGround;
		_replacementTree setDir (random 360);

		// for collision detection from ai
		/* _collisionDetector = "Land_Can_Dented_F" createVehicleLocal [0,0,0];
		_collisionDetector setPosATL _onGround;
		*/

		sleep 0.001;

		_count = _count + 1;

	} count _array;

	_count
};


_time = time;
_count = 0;

_count1 = [_trees_tall, _apex_tall, 0] call _iterateTrees;
_count2 = [_trees_small, _apex_small, 0] call _iterateTrees;

_count = _count1 + _count2;

/*
{
  if (isOnRoad getPos _x) then {
  		_x hideObjectGlobal true;

  		[getPos _x, "colorWhite", 0] call grad_publicTransport_fnc_createDebugMarker;
  }; 

  sleep 0.001;
} forEach _objects;*/

[format ["replacement script completed %2 trees in %1 seconds", time - _time, _count]] remoteExec ["hint", -2, false];
diag_log format ["replacement script completed %2 trees in %1 seconds", time - _time, _count];