params ["_agent"];

_agent addEventhandler ["FiredNear",
    {
		

    [_this select 0, _this select 1] spawn {
    	_agent = _this select 0;
		_attacker = _this select 1;	

		_group = _agent getVariable ["grad_civstatic_groupmembers", []];
		_allOfThem = _group + [_agent];

		_attackerDirection = [_agent, _attacker] call BIS_fnc_relativeDirTo;

		/*

			setting mood.

			0 - careless
			2 - concerned
			4 - shocked
			10 - panic

		*/
		_mood = _agent getVariable ["grad_civstatic_mood", 0];
		_mood = _mood + 1;
		_agent setVariable ["grad_civstatic_mood", _mood];

		_fleeToPos = ([_agent, _mood * 10, _attackerDirection - 180] call BIS_fnc_relPos);

		sleep (random 1.5);

		{
			_fleeToPos = [_fleeToPos, [4,5], random 360] call SHK_POS;
			_x moveTo _fleeToPos;
			_x forceSpeed (_x getSpeed "FAST");

			if (random 10 < _mood) then {
				sleep (random 3);
				_x setVariable ["grad_civstatic_currentAnimation", "SHOCKED"];
				_x playMoveNow selectRandom (missionNamespace getVariable ["grad_civstatic_animations_shocked", ["apanppnemsprsnonwnondf"]]);
			};
			
			_x doWatch _attacker;
		}
		forEach _allOfThem;
	};

    }];