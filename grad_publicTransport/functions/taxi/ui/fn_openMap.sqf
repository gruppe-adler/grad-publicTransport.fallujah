private ["_map", "_btn_cancel", "_btn_choose", "_btn_exitMenu"];

["GRAD_publicTransport_mapClickListener", "onMapSingleClick", {
	//	openMap [false,false];
	try {
		/*diag_log format ["this is the STEH : %1", _pos];
		hint format ["this is the STEH : %1", _pos];*/
		[_pos] call GRAD_publicTransport_fnc_setTaxiWaypoint;
		[_pos] call GRAD_publicTransport_fnc_createDebugMarker;

		["GRAD_publicTransport_mapClickListener", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	} catch {
		hint str _exception;
	};
}] call BIS_fnc_addStackedEventHandler;

/*
["GRAD_publicTransport_mapCloseListener", "Map", {
	["GRAD_publicTransport_mapCloseListener", "Map"] call BIS_fnc_removeStackedEventHandler;
	closeDialog 0;
	player action ['getOut', vehicle player];
}] call BIS_fnc_addStackedEventHandler;
*/


disableSerialization;

_map = (uiNamespace getVariable ['GRAD_publicTransport_taxiDialog_map', controlNull]);
_map ctrlShow true;
_map ctrlMapCursor ["", "Move"];


_btn_cancel = (uiNamespace getVariable ['GRAD_publicTransport_taxiDialog_btn_cancel', controlNull]); 
_btn_cancel ctrlShow true;

 
_btn_choose = (uiNamespace getVariable ['GRAD_publicTransport_taxiDialog_btn_choose', controlNull]);
_btn_choose ctrlShow false;

_btn_exitMenu = (uiNamespace getVariable ['GRAD_publicTransport_taxiDialog_btn_exitMenu', controlNull]);
_btn_exitMenu ctrlShow false;

// diag_log 'open map';
// _display = uiNamespace getVariable ['GRAD_publicTransport_taxiDialog',0];
