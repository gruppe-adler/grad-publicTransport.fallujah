/* 

	gets direction the bus should travel to halt at the station

*/

params ["_obj"];

private ["_dir", "_road", "_pos"];

// check for nearest road

_road = [getPos _obj] call BIS_fnc_nearestRoad;

_relDir = _road getRelDir _obj;
_roadDir = getDir _road;

if (_relDir < 180 && _relDir > 0) then {
	_dir = _roadDir;
	_pos = getPos _road;

	[_road, _pos, _dir]
} else { [] };