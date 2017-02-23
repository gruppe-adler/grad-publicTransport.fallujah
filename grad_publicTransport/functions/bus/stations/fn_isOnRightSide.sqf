/* 
	checks side relative to road
*/

params ["_pos", "_obj", "_traveldirection"];


_relDir = (_pos getDir _obj) + _traveldirection;
// _roadDir = getDir _road;

_isOnRight = true;

if ((_relDir > 180 && _relDir < 360) || (_relDir < 0 && _relDir > -180)) then {
	_isOnRight = false;
	_isOnRight
} else { 
	diag_log format ["_reldir is %1", _reldir];
	_isOnRight
};