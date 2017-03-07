if (!isServer) exitWith {};

/*
_typeArray = 
["palm_01.p3d",
"palm_02.p3d",
"palm_03.p3d",
"palm_04.p3d",
"palm_05.p3d",
"palm_10.p3d"];

_replacementArray =
["a3\vegetation_f_exp\tree\t_CocosNucifera3s_tall_F.p3d",
"a3\vegetation_f_exp\tree\t_Cyathea_F.p3d",
"a3\vegetation_f_exp\tree\t_Cocos_tall_F.p3d",
"a3\vegetation_f_exp\tree\t_CocosNucifera2s_small_F.p3d",
"a3\vegetation_f_exp\tree\t_Cocos_small_F.p3d",
"a3\vegetation_f_exp\tree\t_CocosNucifera3s_tall_F.p3d"];
*/

/*
_typeArray = 
["palm_02.p3d"];

_replacementArray =
["CUP_palm_01"];
*/

_typeArray = 
["palm_01.p3d",
"palm_02.p3d",
"palm_03.p3d",
"palm_04.p3d",
"palm_10.p3d"];


_replacementArray =
["CUP_palm_01",
"CUP_palm_01",
"CUP_palm_03",
"CUP_palm_04",
"CUP_palm_09"];


/*
_replacementArray =
["ca\plants\palm_01.p3d",
"ca\plants\palm_01.p3d",
"ca\plants\palm_03.p3d",
"ca\plants\palm_04.p3d",
"ca\plants\palm_09.p3d"];
*/



_simpleObject = false;


/*

 DO NOT EDIT BELOW 

*/

_trees = nearestTerrainObjects [[worldSize/2, worldSize/2], ["TREE", "SMALL TREE"], worldSize/2];



_count = 0;
_time = time;


{
	_tree = _x;
	_pos = getPosATL _tree;
	_dir = getDir _tree;

	{
	if ((getModelInfo _tree) select 0 == _x) then {
			
			
			[_tree] call grad_publicTransport_fnc_hideObject;


			if (_simpleObject) then {
				_replacementTree = createSimpleObject [_replacementArray select _forEachIndex, _pos];
				_onGround = [getPosATL _replacementTree select 0, getPosATL _replacementTree select 1 , 0];
				_replacementTree setPosATL _onGround;
				_replacementTree setDir (random 360);
			} else {
				_replacementTree = createVehicle [_replacementArray select _forEachIndex, _pos, [], 0, "CAN_COLLIDE"];
				_replacementTree setDir _dir;
				_replacementTree enableSimulationGlobal false;
			};

			sleep 0.0001;
		};

		_count = _count + 1;
	} forEach _typeArray;

} count _trees;

diag_log format ["replacement script completed %2 problematic trees in %1 seconds", time - _time, _count];

/*
(parseText format ["
REPLACEMENTS FINISHED<br/>
%1 trees in %2 s<br/>
",
_count, 
time - _time,
]) remoteExec ["hint", [0,-2] select isDedicated, true];
*/
////////////////////////////////// old shit 

/*
for "_i" from 0 to (count _treeReplacements - 1) do {
	_currentTreeType = _treeReplacements select _i select 0;

	

	_arrayOfTrees = nearestObjects  [[worldSize/2, worldSize/2], [_currentTreeType], worldSize/2];

	{
		_replacementType = selectRandom (_treeReplacements select _i select 1);
		_pos = getPosATL _x;
		_dir = getDir _x;
		[_x] call _hideObject;
		_newTree = createSimpleObject [_replacementType, _pos];
		_onGround = [getPosATL _newTree select 0, getPosATL _newTree select 1 , 0];
		_newTree setPosATL _onGround;
		// _model = getText ( configFile >> "CfgVehicles" >> _replacementType >> "Model" );
		// _newTree = createSimpleObject [_model, _pos];
		_newTree setDir _dir;
		sleep 0.0001;
		_count = _count + 1;
	} forEach _arrayOfTrees;
};
*/