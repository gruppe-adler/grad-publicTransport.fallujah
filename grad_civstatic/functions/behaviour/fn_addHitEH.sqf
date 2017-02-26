params ["_agent"];

if (!isMultiplayer) then {
	_agent addEventhandler ["Hit",
	    {
			_agent = _this select 0;
			
			if (!alive _agent) exitWith {
				_agent removeAllEventHandlers "MPHit";
				_agent removeAllEventHandlers "AnimDone";
				_agent removeAllEventHandlers "FiredNear";
			};

			_agent setVariable ["grad_civstatic_currentAnimation", "INJURED"];
			_agent playMoveNow selectRandom (missionNamespace getVariable ["grad_civstatic_animations_injured", ["Acts_CivilInjuredChest_1"]]);
	}];
} else {
	_agent addMPEventhandler ["MPHit",
	    {
			_agent = _this select 0;
			
			if (!alive _agent) exitWith {
				_agent removeAllEventHandlers "MPHit";
				_agent removeAllEventHandlers "AnimDone";
				_agent removeAllEventHandlers "FiredNear";
			};

			_agent setVariable ["grad_civstatic_currentAnimation", "INJURED"];
			_agent playMoveNow selectRandom (missionNamespace getVariable ["grad_civstatic_animations_injured", ["Acts_CivilInjuredChest_1"]]);
	}];
};