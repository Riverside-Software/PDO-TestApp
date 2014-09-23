 
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
 
class DataServices.StateService inherits  DataService : 
 
 /*------------------------------------------------------------------------
    File        : StateService
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Mon Apr 28 23:36:42 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

    define temp-table eState
        field State as character format "xx" label "State"
        field StateName as character format "x(20)" label "StateName"
        field Region as char format "x(8)" label "Region"
        index state as unique State.

    define dataset dsState for eState.   
     
    constructor StateService():
        super(dataset dsState:handle).
    end.        
    
    method override protected IDataAccess createDataAccessObject():
        return new DynamicDAO("eState","State").
    end.    
                        
end class.
 