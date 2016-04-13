 
 /*------------------------------------------------------------------------
    File        : StateService
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Mon May 05 23:55:32 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using DataSources.*.      
using DataServices.DataService.
 
class DataServices.SpaceFlightData inherits  DataService : 
 
 /*------------------------------------------------------------------------
    File        : SalesrepService
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : 
    Notes       : 
  ----------------------------------------------------------------------*/
     
    define temp-table eSpaceFlight
        field FlightId as integer format "99" label "Flight ID"
        field SpaceLineId as integer format "99" label "SpaceLine"
        field DepartureSpacePortID as integer format "99" label "Departure SpacePort"
        field ArrivalSpacePortID as integer format "99" label "Arrival SpacePort"
        field DepartureDate as date label "Departure Date"
        field ArrivalDate as date label "Arrival Date"
        field etd as datetime label "Departure time"
        field eta as datetime label "Arrival time"
        field StatusId as int label "Status"
        index flight as unique FlightId.
    
    define temp-table eStatus
        field StatusId as int 
        field StatusDesc as char 
        index statusid as unique StatusId.
        
    define temp-table eSpacePort 
        field SpacePortId as int 
        field SpacePortName as char 
        index spaceport as unique SpacePortId.

   define temp-table eSpaceLine 
        field SpaceLineId as int 
        field SpaceLineName as char 
        index spaceline as unique SpaceLineId.

    define dataset dsSpaceFlight for eSpaceFlight,eStatus,eSpacePort,eSpaceLine.   
     
    constructor SpaceFlightData():
        super(dataset dsSpaceFlight:handle).
    end constructor.        
    
    method override public void fetchData():
        if not can-find(first eSpaceflight) then
        do:
           populateData(). 
        end.    
    end method.    
    
    method private void populateData():
        def var i as int no-undo.
        def var numPorts as int no-undo.
        def var spacelines as char init "Sol,Terra Firma,United,People's Express,American,Trans World" no-undo.     
        def var statusvalues as char init "DELAYED,ONTIME,EMBARKING,BOARDING" no-undo.     
        def var cities as char init "New York,London,Chicago,Belgrade,Tokyo,Paris,Madagaskar,Mexico,Seoul,Berlin,Madrid" no-undo.
        def var planets as char init "Mars One,Mars Two,Jupiter One,Jupiter Two,Saturn One,Luna One,Luna Two,Luna Three" no-undo.
                
        do i = 1 to num-entries(cities):
            create eSpacePort.
            assign
                SpacePortId = i
                SpacePortName = entry(i,cities) + " Interplanetary"
                numPorts = i.
        end.     
        do i = 1 to num-entries(planets):           
            create eSpacePort.
            assign
                numPorts = numPorts + 1
                SpacePortId = numPorts
                SpacePortName = entry(i,planets).
        
        end.
        
        do i = 1 to num-entries(statusvalues):
           create eStatus.
           assign
               StatusId = i
               StatusDesc = entry(i,statusvalues).
        end.     
        
        do i = 1 to num-entries(spacelines):
           create eSpaceLine.
           assign
               SpaceLineId = i
               SpaceLineName = entry(i,spacelines) + " Spacelines" .
        end.     
        
        do i = 1 to 100 :
            create eSpaceFlight.
            assign
                FlightId = i
                eSpaceFlight.SpaceLineId = random(1,num-entries(spacelines))
                DepartureSpacePortID = random(1,numPorts)
                ArrivalSpacePortID = random(1,numPorts)
                eta = 1/1/2050 
                eta = eta + random(200000000000,36000000000000)
                etd = eta + random(20000000,36000000) 
                DepartureDate = etd 
                ArrivalDate = eta
                eSpaceFlight.Statusid = random(1,num-entries(statusvalues)). 
        end.     
    
    end method.
                        
end class.
 