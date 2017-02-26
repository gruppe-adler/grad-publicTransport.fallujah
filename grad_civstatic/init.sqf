call grad_civstatic_fnc_animationDefinition;
call grad_civstatic_fnc_behaviourUpdateLoop;

_count = 100;


_mapCenter = [worldSize/2, worldSize/2];


for "_i" from 0 to _count do {

	
	_pos = [_mapCenter, [10,2000], random 360] call SHK_POS;
	if (isOnRoad _pos) then {
		_count = _count + 1;
	} else {
		[_pos, 1 + (ceil (random 3))] call grad_civstatic_fnc_createCluster;
		sleep 0.001;
	};
};