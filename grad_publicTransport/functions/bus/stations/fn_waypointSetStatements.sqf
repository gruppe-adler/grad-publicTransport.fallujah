params ["_waypoint"];

//     this refers to the group leader
// thisList refers to an array containing each unit in the group 

_waypoint setWaypointStatements [
"true", 
"
[this] spawn grad_publicTransport_fnc_waitForPassengers;

"];

_waypoint setWaypointTimeout [0,0.25,0.5];

_waypoint setWaypointSpeed "NORMAL"; // todo adjust to behaviour