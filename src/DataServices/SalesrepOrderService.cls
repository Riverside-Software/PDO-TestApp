 
 /*------------------------------------------------------------------------
    File        : SalesrepOrderService
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

using System.Data.DataTable.
 
class DataServices.SalesrepOrderService inherits  DataService : 
  
 /*------------------------------------------------------------------------
    File        : SalesrepOrderService
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
        field NumOrders as integer label "Num orders" 
        index sls as unique Salesrep.
    
     define temp-table eOrder no-undo before-table eOrderBefore  
        field Ordernum as integer label "Order Num" format "zzzzzzzzz9" initial "0"
        field CustNum as integer label "Cust Num" format ">>>>9" initial "0"
        field Salesrep as character format "xxx" label "Salesrep"
       
       /*        field OrderTotal as decimal format ">>>>>9.99"*/
        index Salesrep salesrep
        index OrderNum is primary unique Ordernum . 
        
    define dataset dsSalesrepOrder for eSalesrep,eOrder 
            data-relation dSalesrepOrder for eSalesrep,eOrder
            relation-fields (SalesRep,SalesRep).   
     
    constructor SalesrepOrderService():
        super(dataset dsSalesrepOrder:handle).
    end.        
    
    method override protected IDataAccess createDataAccessObject():
        return new DynamicDAO("eSalesrep,eOrder","Salesrep,Order").
    end.    
      
	method override public void fetchData( ):
		define variable orderCount as integer no-undo.  
		super:fetchData( ).
        /* this could be done in the data access layer or in the business logic 
           layer as here  */
        for each esalesrep:
            orderCount = 0.
            for each eorder of esalesrep:
                orderCount = orderCount + 1.
            end.    
            eSalesrep.NumOrders = orderCount.
        end.          
	end method.
         
end class.
 