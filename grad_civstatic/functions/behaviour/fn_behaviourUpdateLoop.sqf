[{
    params ["_args", "_handle"];

    // if (MISSION_COMPLETED) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    _selectedGroup = selectRandom (missionNamespace getVariable ["grad_civstatic_allgroups", []]);

    if (count _selectedGroup > 0) then {
    	if ((_selectedGroup select 0) getVariable ["grad_civstatic_isBusy", false]) exitWith {};
     	
     	[_selectedGroup] call grad_civstatic_fnc_moveGroup;
    };

},10,[]] call CBA_fnc_addPerFrameHandler;