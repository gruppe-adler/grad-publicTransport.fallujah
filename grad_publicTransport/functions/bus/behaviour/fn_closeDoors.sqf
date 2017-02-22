/*
 close ikarus doors one, two or all
*/

params ["_veh", "_doorsToAnimate"];

_p1= _veh modelToWorld (_veh selectionposition "pos cargo dir");
_p2= _veh modelToWorld (_veh selectionposition "pos cargo1 dir");
_p3= _veh modelToWorld (_veh selectionposition "pos cargo2 dir");

_vol=7;
_dist=79.09;

{
	_veh animateDoor [_x,0];

	if (_x == "doors_1") then {
		playSound3D ["rds_a2port_civ\data\sounds\d1cls_r.wss", player, false,  _p1, _vol, 1, _dist];
	} else {
		if (_x == "doors_2") then {
			playSound3D ["rds_a2port_civ\data\sounds\d2cls_r.wss", player, false,  _p2, _vol, 1, _dist];
		} else {
			playSound3D ["rds_a2port_civ\data\sounds\d3cls_r.wss", player, false,  _p3, _vol, 1, _dist];
		};
	};
}foreach _doorsToAnimate;