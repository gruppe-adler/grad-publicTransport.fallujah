params ["_agent", "_nextAnimation"];

_kindofanimation = _agent getVariable ["grad_civstatic_currentAnimationType", "TALK"]; 

	switch (_kindofanimation) do {
		case "SHOCKED": {
			_nextAnimation = selectRandom (missionNamespace getVariable ["grad_civstatic_animations_shocked", ["Acts_CivilShocked_1"]]);
		};

		case "INJURED": {
			_nextAnimation = selectRandom (missionNamespace getVariable ["grad_civstatic_animations_injured", ["Acts_CivilInjuredChest_1"]]);
		};

		case "TALK": {
			_nextAnimation = selectRandom (missionNamespace getVariable ["grad_civstatic_animations_talk", ["Acts_CivilIdle_1"]]);

		};

		default { };
	
	};

	if (_nextAnimation != "none" && random 1 > 0.75) then {
		_agent playMoveNow _nextAnimation;
	};