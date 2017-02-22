class GRAD_publicTransport {

    class behaviour {
        file = grad_publicTransport\functions\bus\behaviour;
        
        class openDoors {};
        class closeDoors {};
        class honk {};
        class addBehaviour {};
    };

    class stations {
        file = grad_publicTransport\functions\bus\stations;
        
        class createStations {};
        class createWaypoints {};
        class findStations {};
        class getNextStation {};
        class getStationDataAToB {};
        class getStationDataBToA {};
        class isAtStation {};
        class sortByDistance {};
    };

    class debug {
        file = grad_publicTransport\functions\bus\debug;
        
        class createDebugMarker {};
    };
};