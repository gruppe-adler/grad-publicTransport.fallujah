_openTaxiMenu = [
    "openTaxiMenu",
    "Taxi Menü öffnen",
    "",
    {
        call grad_publicTransport_fnc_taxiDialogOpen;
    },
    {
        !dialog && {!isPlayer driver vehicle player} && {vehicle player getVariable ["grad_publicTransport_isTaxi", false]}
    }
] call ace_interact_menu_fnc_createAction;
[typeOf player, 1, ["ACE_SelfActions"], _openTaxiMenu] call ace_interact_menu_fnc_addActionToClass;