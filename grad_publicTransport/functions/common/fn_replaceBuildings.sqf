if (!isServer) exitWith {};

_buildingReplacements = [
["Land_Dum_mesto3_istan", "Land_House_C_10_EP1"],
["Land_Dum_istan1","Land_Dum_olez_istan1_open2"],
["Land_Dum_istan2", "Land_House_C_12_EP1"],
["Land_Dum_istan3_pumpa", "Land_Unfinished_Building_01_F"],
["Land_Dum_olez_istan2_maly2", "Land_House_C_5_V2_EP1"],
["Land_Dum_olez_istan2_maly", "Land_Unfinished_Building_01_F"],
["Land_Dum_olez_istan2", "Land_House_C_4_EP1"]
];


_count = 0;
_time = time;

for "_i" from 0 to (count _buildingReplacements - 1) do {

	_currentBuilding = _buildingReplacements select _i select 0;

	

	_arrayOfBuildings = nearestObjects  [[worldSize/2, worldSize/2], [_currentBuilding], worldSize/2];

	{
		_replacementType = _buildingReplacements select _i select 1;
		_pos = getPosATL _x;
		_dir = getDir _x;


		[_x] call grad_publicTransport_fnc_hideObject;

		_newBuilding = createVehicle [_replacementType, _pos, [], 0, "NONE"];
		// _model = getText ( configFile >> "CfgVehicles" >> _replacementType >> "Model" );
		// _newBuilding = createSimpleObject [_model, _pos];
		_newBuilding setDir _dir;
		_newBuilding enableSimulationGlobal false;

		
		sleep 0.0001;
		_count = _count + 1;
	} forEach _arrayOfBuildings;
};


diag_log format ["replacement script completed %2 buildings in %1 seconds", time - _time, _count];

/*
(parseText format ["
REPLACEMENTS FINISHED<br/>
%1 buildings in %2 s<br/>
",
_count, 
time - _time,
]) remoteExec ["hint", [0,-2] select isDedicated, true];
*/