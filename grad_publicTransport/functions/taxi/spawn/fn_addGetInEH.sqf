params ["_veh"];

_veh addEventHandler ["GetIn", {
	_veh = _this select 0;
	_unit = _this select 2;

	_owner = _veh getVariable ["grad_publicTransport_taxi_owner", objNull];

	if (isNull _owner && isPlayer _unit) then {

		if (player getVariable ["grad_lbm_myFunds", 0] == 0) exitWith {
			vehicle player vehicleChat format ['Du hast keine Kohle, Lump!'];
			player action ["GetOut", vehicle player];
		};

		_veh setVariable ["grad_publicTransport_taxi_owner", _unit];
		[_owner, _veh] remoteExec ["grad_publicTransport_fnc_taxiDialogOpen", _unit, false];
		[_owner, _veh] remoteExec ["grad_publicTransport_fnc_startTaxameter", _unit, false];
	};

}];

_veh addEventHandler ["GetOut", {
	_veh = _this select 0;
	_unit = _this select 2;	

	_owner = _veh getVariable ["grad_publicTransport_taxi_owner", objNull];

	if (str _unit == str _owner) then {
		_veh setVariable ["grad_publicTransport_taxi_owner", objNull];		
		[_owner, _veh] remoteExec ["grad_publicTransport_fnc_stopTaxameter", _unit, false];
	};

}];