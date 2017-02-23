class GRAD_publicTransport {

    class behaviour {
        file = grad_publicTransport\functions\bus\behaviour;
        
        class addBehaviour {};
        class closeDoors {};
        class honk {};
        class openDoors {};
        class waitForPassengers {};
    };

    class debug {
        file = grad_publicTransport\functions\bus\debug;
        
        class createDebugMarker {};
    };

    class pathfinding_by_coding {
        file = grad_publicTransport\functions\bus\pathfinding_by_coding;
        
        class addVectors {};
        class aStar {};
        class calcRoute {};
        class cost {};
        class createRoute {};
        class getNearestRoad {};
        class mark {};
        class removeMarker {};
        class start {};
        class h {};
    };

    class stations {
        file = grad_publicTransport\functions\bus\stations;
        
        class assignRoute {};
        class createStations {};
        class findStations {};
        class getNextStation {};
        class getReturnRoute {};
        class isAtStation {};
        class isOnRightSide {};
        class waypointGetNext {};
        class waypointSetStatements {};
        class waypointsCreate {};
    };
};