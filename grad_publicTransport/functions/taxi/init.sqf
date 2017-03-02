_taxiCount = 10;

for "_i" from 0 to _taxiCount do {
	_pos = call grad_publicTransport_fnc_findSpawnPosition;

	if (count _pos > 1) then {

		_taxi = [_pos] call grad_publicTransport_fnc_taxiSpawn;
		[_taxi] call grad_publicTransport_fnc_addGetInEH;
		[_pos] call grad_publicTransport_fnc_createDebugMarker;
	
	};
};
