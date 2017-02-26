params ["_agent"];

if (!isMultiplayer) then {
	_agent addEventhandler ["Killed",
	    {
			_agent = _this select 0;
			
			_leader = _agent getVariable ["grad_civstatic_groupleader", objNull];
			_group = _leader getVariable ["grad_civstatic_groupmembers", []];
			_newgroup = _group - [_agent];
			_leader setVariable ["grad_civstatic_groupmembers", _newgroup, true];

			_agent removeAllEventHandlers "Killed";
			_agent removeAllEventHandlers "FiredNear";
			_agent removeAllEventHandlers "Hit";
			
	}];
} else {
	_agent addMPEventhandler ["MPKilled",
	    {
			_agent = _this select 0;
			
			_leader = _agent getVariable ["grad_civstatic_groupleader", objNull];
			_group = _leader getVariable ["grad_civstatic_groupmembers", []];
			_newgroup = _group - [_agent];
			_leader setVariable ["grad_civstatic_groupmembers", _newgroup, true];

			_agent removeAllEventHandlers "MPKilled";
			_agent removeAllEventHandlers "FiredNear";
			_agent removeAllEventHandlers "MPHit";

	}];
};