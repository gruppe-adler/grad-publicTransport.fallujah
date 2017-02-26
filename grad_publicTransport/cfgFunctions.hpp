class GRAD_publicTransport {

    class bus_behaviour {
        file = grad_publicTransport\functions\bus\behaviour;
        
        class addBehaviour {};
        class closeDoors {};
        class honk {};
        class openDoors {};
        class waitForPassengers {};
    };

    class bus_debug {
        file = grad_publicTransport\functions\bus\debug;
        
        class createDebugMarker {};
    };

    class bus_pathfinding_by_coding {
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

    class bus_stations {
        file = grad_publicTransport\functions\bus\stations;
        
        class assignRoute {};
        class attachSigns {};
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

      class taxi_movement {
        file = grad_publicTransport\functions\taxi\movement;
     
    };

    class taxi_spawn {
        file = grad_publicTransport\functions\taxi\movement;

        class taxiSpawn {};
     
    };

    class taxi_ui {
        file = grad_publicTransport\functions\taxi\movement;
     
    };
};