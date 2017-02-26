params ["_pos"];

_poi = _pos;

_possibleInterestingThing = selectRandom [
	"TREE",
	"BUSH",
	"CHURCH",
	"CHAPEL",
	"ROCK",
	"BUNKER",
	"FORTRESS",
	"FOUNTAIN",
	"LIGHTHOUSE",
	"FUELSTATION",
	"HOSPITAL",
	"BUSSTOP",
	"BUSSTOP",
	"BUSSTOP",
	"BUSSTOP",
	"BUSSTOP",
	"RUIN",
	"TOURISM",
	"TOURISM",
	"TOURISM",
	"TOURISM",
	"WATERTOWER",
	"ROCKS", 
	"POWERSOLAR", 
	"POWERWAVE", 
	"POWERWIND"
];

_buildingPosFound = false;

_buildings = nearestObjects [_pos, ["House", "Building"], 500];

_count = 0;

while {_poi distance2d _pos < 50} do {
	if (count _buildings > 0) then {
		_randomBuilding = selectRandom _buildings;

		for "_i" from 0 to 10 do {
			_buildingPositions = [_randomBuilding] call BIS_fnc_buildingPositions;
			if (count _buildingPositions > 0) exitWith {
				_poi = selectRandom _buildingPositions;
				_buildingPosFound = true;
				diag_log format ["building pos found"];
			};
		};	
	};

	if (!_buildingPosFound) then {
		_stations = (nearestTerrainObjects [_pos, [_possibleInterestingThing], 500]);
		if (count _stations > 0) then {
			_poi = getposATL (selectRandom _stations);
			diag_log format ["choosing nearest %1 at %2 as poi", _possibleInterestingThings, _poi];
		};
	};
	_count = _count + 1;
};

hintsilent format ["found move position in %1 cycles", _count];

_poi