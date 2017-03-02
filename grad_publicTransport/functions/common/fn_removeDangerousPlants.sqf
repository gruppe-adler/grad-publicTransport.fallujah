_trees_tall = (nearestTerrainObjects [[worldSize/2, worldSize/2], ["TREE"], 20000]);
_trees_small = (nearestTerrainObjects [[worldSize/2, worldSize/2], ["TREE SMALL"], 20000]);


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
REPLACE_THEM = false;

waituntil {REPLACE_THEM};

_time = time;
_count = 0;

if (isMultiplayer) then {
	{	_tree = _x;
		_pos = getPosATL _x;
		hideObjectGlobal _tree;
		_replacementTree = createSimpleObject [selectRandom _apex_tall, _pos];
		_onGround = [getPosATL _replacementTree select 0, getPosATL _replacementTree select 1 , 0];
		_replacementTree setPosATL _onGround;
		_replacementTree setDir (random 360);

		// for collision detection from ai
		_collisionDetector = "Land_Can_Dented_F" createVehicleLocal [0,0,0];

		_collisionDetector setPosATL _onGround;

		if (isOnRoad _replacementTree) then {
			_replacementTree hideObjectGlobal true;
			[getPos _replacementTree, "colorWhite", 0] call grad_publicTransport_fnc_createDebugMarker;
			
		};
		
		sleep 0.0001;

		_count = _count + 1;

	} forEach _trees_tall;

	{

		_tree = _x;
		_pos = getPosATL _x;
		hideObjectGlobal _tree;
		_replacementObject = createSimpleObject [selectRandom _apex_small, _pos];
		_onGround = [getPosATL _replacementTree select 0, getPosATL _replacementTree select 1 , 0];
		_replacementObject setPosATL _onGround;
		_replacementObject setDir (random 360);

		// for collision detection from ai
		_collisionDetector = "Land_Can_Dented_F" createVehicleLocal [0,0,0];
		_collisionDetector setPosATL _onGround;

		if (isOnRoad _replacementObject) then {
			_replacementObject hideObjectGlobal true;
			[getPos _replacementObject, "colorWhite", 0] call grad_publicTransport_fnc_createDebugMarker;
			
		};

		sleep 0.0001;

		_count = _count + 1;

	} forEach _trees_small;
} else {
	{

		
		_tree = _x;
		_pos = getPosATL _x;
		hideObject _tree;
		_replacementTree = createSimpleObject [selectRandom _apex_tall, _pos];
		_onGround = [getPosATL _replacementTree select 0, getPosATL _replacementTree select 1 , 0];
		_replacementTree setPosATL _onGround;
		_replacementTree setDir (random 360);

		// for collision detection from ai
		_collisionDetector = "Land_Can_Dented_F" createVehicleLocal [0,0,0];

		_collisionDetector setPosATL _onGround;

		if (isOnRoad _replacementTree) then {
			_replacementTree hideObject true;
			[getPos _replacementTree, "colorWhite", 0] call grad_publicTransport_fnc_createDebugMarker;
			
		};
		
		sleep 0.0001;

		_count = _count + 1;

	} forEach _trees_tall;

	{

		_tree = _x;
		_pos = getPosATL _x;
		hideObject _tree;
		_replacementObject = createSimpleObject [selectRandom _apex_small, _pos];
		_onGround = [getPosATL _replacementTree select 0, getPosATL _replacementTree select 1 , 0];
		_replacementObject setPosATL _onGround;
		_replacementObject setDir (random 360);

		// for collision detection from ai
		_collisionDetector = "Land_Can_Dented_F" createVehicleLocal [0,0,0];
		_collisionDetector setPosATL _onGround;

		if (isOnRoad _replacementObject) then {
			_replacementObject hideObject true;
			[getPos _replacementObject, "colorWhite", 0] call grad_publicTransport_fnc_createDebugMarker;
			
		};

		sleep 0.0001;

		_count = _count + 1;

	} forEach _trees_small;
};
/*
{
  if (isOnRoad getPos _x) then {
  		_x hideObjectGlobal true;

  		[getPos _x, "colorWhite", 0] call grad_publicTransport_fnc_createDebugMarker;
  }; 

  sleep 0.001;
} forEach _objects;*/

hint format ["replacement script completed %2 trees in %1 seconds", time - _time, _count];