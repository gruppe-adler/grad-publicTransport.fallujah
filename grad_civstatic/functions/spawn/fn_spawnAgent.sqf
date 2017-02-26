params ["_pos"];

_type = selectRandom (missionNamespace getVariable ["grad_civstatic_agenttypes", ["LOP_Tak_Civ_Random"]]);

_agent = createAgent [_type, _pos, [], 0, "NONE"];

// _agent disableAI "MOVE";
_agent disableAI "FSM";
_agent setBehaviour "CARELESS";
_agent setDir (random 360);


_agent setVariable ["grad_civstatic_currentAnimationType", "TALK"];

// DEBUG

[_pos] call grad_civstatic_fnc_createDebugMarker;

[_agent, ""] call grad_civstatic_fnc_animateAI;
// [_agent] call grad_civstatic_fnc_sitDown;
// [_agent] call grad_civstatic_fnc_addAnimEH; // animdone stresses performance too much
[_agent] call grad_civstatic_fnc_addHitEH;



_agent