params ["_obj"];

if (isMultiplayer) then {
	hideObjectGlobal _obj;
	_obj enableSimulationGlobal false;
} else {
	hideObject _obj;
	_obj enableSimulation false;
};