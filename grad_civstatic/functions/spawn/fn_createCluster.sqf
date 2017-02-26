params ["_pos", "_count"];

private ["_agentArray", "_agent", "_leader", "_allTheOthers", "_wholeGroup", "_existingGroups"];



_agentArray = [];

for "_i" from 0 to _count do {
	_agent = [_pos] call grad_civstatic_fnc_spawnAgent;
	_agentArray = _agentArray + [_agent];
};
_leader = _agentArray select 0;
_allTheOthers = _agentArray - [_leader];

{
	_x doWatch _leader;
	_x setDir (_x getRelDir _leader);
	[_x] call grad_civstatic_fnc_addKilledEH;
	_x setVariable ["grad_civstatic_groupleader", _leader, true];
} forEach _allTheOthers;

_leader doWatch (_allTheOthers select 0);
_leader setDir (_allTheOthers select 0 getRelDir _leader);

// group leader
[_leader] call grad_civstatic_fnc_addFiredEH;
_leader setVariable ["grad_civstatic_groupmembers", _allTheOthers, true];

_allTheOthers pushBack _leader;

_existingGroups = missionNamespace getVariable ["grad_civstatic_allgroups", []];

// register group
missionNamespace setVariable ["grad_civstatic_allgroups", _existingGroups + [_allTheOthers]];