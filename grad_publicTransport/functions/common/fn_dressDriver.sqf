params ["_unit"];

/*
 civ unit redressing
*/

GRAD_publicTransport_clothes = [
	"LOP_U_AM_Fatigue_01",
    "LOP_U_AM_Fatigue_01_2",
    "LOP_U_AM_Fatigue_01_3",
    "LOP_U_AM_Fatigue_01_4",
    "LOP_U_AM_Fatigue_01_5",
    "LOP_U_AM_Fatigue_01_6",
    "LOP_U_AM_Fatigue_02",
    "LOP_U_AM_Fatigue_02_2",
    "LOP_U_AM_Fatigue_02_3",
    "LOP_U_AM_Fatigue_02_4",
    "LOP_U_AM_Fatigue_02_5",
    "LOP_U_AM_Fatigue_02_6",
    "LOP_U_AM_Fatigue_03",
    "LOP_U_AM_Fatigue_03_2",
    "LOP_U_AM_Fatigue_03_3",
    "LOP_U_AM_Fatigue_03_4",
    "LOP_U_AM_Fatigue_03_5",
    "LOP_U_AM_Fatigue_03_6",
    "LOP_U_AM_Fatigue_04",
    "LOP_U_AM_Fatigue_04_2",
    "LOP_U_AM_Fatigue_04_3",
    "LOP_U_AM_Fatigue_04_4",
    "LOP_U_AM_Fatigue_04_5",
    "LOP_U_AM_Fatigue_04_6"
];

GRAD_publicTransport_headgear = [
	"LOP_H_Turban",
    "LOP_H_Turban",
    "LOP_H_Pakol",
    "LOP_H_Pakol",
    "LOP_H_Pakol",
    "LOP_H_Pakol"
];

GRAD_publicTransport_faces = [
	"PersianHead_A3_01",
	"PersianHead_A3_02",
	"PersianHead_A3_03",
	"PersianHead_A3_01",
	"PersianHead_A3_02",
	"PersianHead_A3_03",
	"PersianHead_A3_01",
	"PersianHead_A3_02",
	"PersianHead_A3_03",
	"WhiteHead_08",
	"WhiteHead_16",
	"GreekHead_A3_01",
	"GreekHead_A3_02",
	"GreekHead_A3_03",
	"GreekHead_A3_04"
];

GRAD_publicTransport_beards = [
	"TRYK_Beard_BK",
   	"TRYK_Beard_BK2",
    "TRYK_Beard_BK3",
    "TRYK_Beard_BK4",
    "TRYK_Beard_BW",
    "TRYK_Beard_BK",
    "TRYK_Beard_BK",
    "TRYK_Beard_BK"
];

_stripHim = {
	_it = _this select 0;
	removeAllWeapons _it;
	removeAllItems _it;
	removeAllAssignedItems _it;
	removeUniform _it;
	removeVest _it;
	removeBackpack _it;
	removeHeadgear _it;
	removeGoggles _it;
	_return = true;
	_return
};


_unitLoadout = [[],[],[],[selectRandom GRAD_publicTransport_clothes,[]],[],[],selectRandom GRAD_publicTransport_headgear,"""",[],["""","""","""","""","""",""""]];


_reclotheHim = {
	params ["_guy", "_loadout"];
	
	_guy setUnitLoadout _loadout;

	[[_guy, selectRandom GRAD_publicTransport_faces], "setCustomFace"] call BIS_fnc_MP;
	_guy setVariable ["BIS_noCoreConversations", true];
	
};

_addBeard = {
	params ["_guy"];

	_firstBeard = GRAD_publicTransport_beards select 0;
	// diag_log format ["_trying to select beard %1", _firstBeard];
	// add beards if possible
	if (!(isClass (configfile >> "CfgGlasses" >> "TRYK_Beard"))) exitWith {};

   	_guy addGoggles selectRandom GRAD_publicTransport_beards;
};




_addBehaviour = {
	group (_this select 0) setBehaviour "CARELESS";
	(_this select 0) disableAI "TARGET";
	(_this select 0) disableAI "AUTOTARGET";
	// (_this select 0) disableAI "FSM";
};



// _stripped = [_unit] call _stripHim;
[_unit, _unitLoadout] call _reclotheHim;

[_unit] call _addBehaviour;
[_unit] call _addBeard;
_unit linkItem "itemRadio";