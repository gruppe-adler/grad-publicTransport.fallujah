params ["_veh", "_sign"];

private ["_sign_front", "_sign_back"];


_sign_front = "UserTexture1m_F" createVehicle [0,0,0];
_sign_back = "UserTexture1m_F" createVehicle [0,0,0];

_sign_front setObjectTextureGlobal [0, _sign];
_sign_back setObjectTextureGlobal [0, _sign];

_sign_front attachTo [_veh, [0.2,5.05,-0.8]];  
_sign_front setVectorDirAndUp [[0,-1,0],[0,0,1]];
_sign_back attachTo [_veh, [1.2,-5.81,-0.65]];