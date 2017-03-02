_clutter = nearestObjects [[worldSize/2, worldSize/2], [], worldSize/2]; // (nearestTerrainObjects [[worldSize/2, worldSize/2], ["TREE SMALL"], worldSize/2]);

_time = time;
_count = 0;

_hideObject = {
	params ["_obj"];

	if (isMultiplayer) then {
		hideObjectGlobal _x;
	} else {
		hideObject _x;
	};		
};

if (isOnRoad _x) then {
	[_x] call _hideObject;
	[getPos _x, "colorWhite", 0] call grad_publicTransport_fnc_createDebugMarker;
	_count = _count + 1;
} count _clutter;
		
[format ["remove script completed %2 cluttershits in %1 seconds", time - _time, _count]] remoteExec ["hint", -2, false];
diag_log format ["remove script completed %2 cluttershits in %1 seconds", time - _time, _count];