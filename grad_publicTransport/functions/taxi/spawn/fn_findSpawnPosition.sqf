_position = [[worldSize/2, worldSize/2], [10,3000], random 360, 0, [1,2000]] call SHK_POS;

_roadPos = [];

if (isOnRoad _position) then {
	_road = [_position, 20, []] call BIS_fnc_nearestRoad;
	_roadPos = getPosATL _road;
};

// diag_log format ["_roadPos is %1", _roadPos];

_roadPos