params ["_pos"];

_dir = random 360;

if (isOnRoad _pos) then {
	_road = [_pos,0,[]] call BIS_fnc_nearestRoad;
	_dir = getDir _road;
};

_result = [_pos, _dir, "RDS_Gaz24_Civ_02", civilian] call BIS_fnc_spawnVehicle;
_vehicle = _result select 0;
_vehiclesCrew = _result select 1;
_vehiclesGroup = _result select 2;

{
	[_x] call grad_publicTransport_fnc_dressDriver;
} forEach _vehiclesCrew;

clearItemCargoGlobal _vehicle;
_vehicle setObjectTextureGlobal [0, "grad_publicTransport\data\volha_taxi_eciv_co.paa"];

_vehicle setVariable ["grad_publicTransport_assignedDriver", _vehiclesCrew select 0];
_vehicle setVariable ["grad_publicTransport_isTaxi", true, true];

_vehicle