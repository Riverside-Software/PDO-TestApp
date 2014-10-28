 
 /*------------------------------------------------------------------------
    File        : CustOrderService
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Mon May 05 23:55:32 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using DataSources.*.      
using DataServices.DataBatchingService.
  
class DataServices.OrderLineService inherits DataBatchingService : 
   
 /*------------------------------------------------------------------------
    File        : OrderLineService
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : 
    Notes       : 
  ----------------------------------------------------------------------*/
   
    define temp-table eOrderLine no-undo before-table eOrderLineBefore
        field Ordernum as integer label "Order Num" format "zzzzzzzzz9" initial "0"
        field Linenum as integer label "Line Num" format ">>9" initial "0"
        field Itemnum as integer label "Item Num" format "zzzzzzzzz9" initial "0"
        field Qty as integer label "Qty" format "->>>>9" initial "0"
        field Price as decimal label "Price" format "->,>>>,>>9.99" initial "0" decimals 2
        field Discount as integer label "Discount" format ">>9%" initial "0"
        field ExtendedPrice as decimal label "Extended Price" format "->>>,>>9.99" initial "0" decimals 2
        field OrderLineStatus as character label "Order Line Status" format "x(20)" initial "Ordered"
        /* VIEW-AS COMBO-BOX LIST-ITEMS "Ordered","Back Ordered","Shipped"*/
   
      index orderline is primary unique 
        Ordernum
        Linenum.
   
	   
    define dataset dsOrderLine for eOrderLine.   
     
    constructor OrderLineService():
        super(dataset dsOrderLine:handle).    
    end.        
    
    method override protected IDataAccess createDataAccessObject():
        return new DynamicDAO("eOrderLine","OrderLine").
    end.    
                        
end class.
 