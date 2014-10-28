 
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
 
class DataServices.SalesrepService inherits  DataService : 
 
 /*------------------------------------------------------------------------
    File        : SalesrepService
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : 
    Notes       : 
  ----------------------------------------------------------------------*/

    define temp-table eSalesrep
        field Salesrep as character format "xxx" label "Salesrep"
        field Repname as character format "x(20)" label "Rep name"
        index sls as unique Salesrep.

    define dataset dsSalesrep for eSalesrep.   
     
    constructor SalesrepService():
        super(dataset dsSalesrep:handle).
    end.        
    
    method override protected IDataAccess createDataAccessObject():
        return new DynamicDAO("eSalesrep","Salesrep").
    end.    
                        
end class.
 