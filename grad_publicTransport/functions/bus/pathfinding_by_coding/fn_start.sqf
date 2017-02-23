 ["CODI_Path_mapClick", "onMapSingleClick",{
    [getPos player, _pos] spawn GRAD_publicTransport_fnc_calcRoute;
	openMap false;
}] call BIS_fnc_addStackedEventHandler;
openMap true;
[] spawn {
    waitUntil{!visibleMap};
    ["CODI_Path_mapClick", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
};