if (!isServer) exitWith {};

_clutter = nearestTerrainObjects [
	[worldSize/2, worldSize/2], 
	["TREE", "SMALL TREE", "BUSH", "WALL", "ROCKS"], 
	worldSize/2
];

_time = time;
_count = 0;
_debug = false;


{
	if (isOnRoad _x) then {
		[_x] call grad_publicTransport_fnc_hideObject;

		if (_debug) then {
			[getPos _x, "colorWhite", 0] call grad_publicTransport_fnc_createDebugMarker;
		};
		
		_count = _count + 1;
	};

} count _clutter;

diag_log format ["remove script completed %2 cluttershits in %1 seconds", time - _time, _count];

/*
(parseText format ["
REPLACEMENTS FINISHED<br/>
removed %1 objects from roads in %2 s<br/>
",
_count, 
time - _time,
]) remoteExec ["hint", [0, -2] select isMultiplayer, true];
*/