params["_pos"];
private _roads = _pos nearRoads 1000;
if (_roads isEqualTo []) exitWith {objNull};
private _road = _roads deleteAt 0;
{
    if (((getPos _x) distance2d _pos) < ((getPos _road) distance2d _pos)) then
	{
        _road = _x;
    };
	nil
}
count _roads;
_road