params ["_waypoint"];

//     this refers to the group leader
// thisList refers to an array containing each unit in the group 

_waypoint setWaypointStatements [
"true", 
"
doStop this;
[this] spawn grad_publicTransport_fnc_waitForPassengers;

"];

_waypoint setWaypointSpeed "LIMITED"; // todo adjust to behaviour