params ["_unit", "_veh"];

cutRsc ["GRAD_publicTransport_taxameter","PLAIN",3];

vehicle player vehicleChat "Wo solls hingehen? Taxameter läuft...";
driver vehicle player doWatch player;

disableSerialization;

_taxameterCtrl = uiNamespace getVariable ["GRAD_publicTransport_taxameter_text", controlNull];
waitUntil {!isNull _taxameterCtrl};

// reset just to be sure
TAXAMETER_ON = true;
TAXAMETER_KM = 0;
TAXAMETER_POS = getPos _veh;
TAXAMETER_START = time;

while {TAXAMETER_ON} do {

	TAXAMETER_TIME = (floor((time - TAXAMETER_START)/60*10)/10);
	TAXAMETER_METERS_TICK = ceil (TAXAMETER_POS distance2D getPos _veh);
	TAXAMETER_POS = getPos _veh;

	TAXAMETER_KM = (floor (TAXAMETER_KM + TAXAMETER_METERS_TICK))/1000;

	TAXAMETER_PRICE = floor (((TAXAMETER_KM) + (TAXAMETER_TIME))*100);

	_taxameterCtrl ctrlSetStructuredText parseText format ["
		<t size='1.2' shadow='0' align='left'>
		<t color='#99ffffff'>ZEIT</t><br/>
		<t size='3'>%1 </t> <t size='1.2'>min</t><br/><br/>
		<t color='#99ffffff'>DISTANZ</t><br/>
		<t size='3'>%2 </t> <t size='1.2'>km</t><br/><br/>
		<t color='#99ffffff'>PREIS</t><br/>
		<t size='3'>%3 </t> <t size='1.2'>cr</t>
		</t>
		",
		TAXAMETER_TIME,
		TAXAMETER_KM,
		TAXAMETER_PRICE
		];

	sleep 1;

	if (TAXAMETER_PRICE >= player getVariable ["grad_lbm_myFunds", 0]) then {
		call GRAD_publicTransport_fnc_stopTaxameter;
		
		vehicle player vehicleChat format ['Du hast keine Kohle mehr, Lump!'];
		player action ["GetOut", vehicle player];
	};
};

_taxameterCtrl ctrlSetFade 0;
_taxameterCtrl ctrlCommit 1;

sleep 1;
cutText ["", "PLAIN"];

[player, TAXAMETER_PRICE] call grad_moneymenu_fnc_removeFunds;