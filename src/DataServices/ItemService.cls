 
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
 
class DataServices.ItemService inherits DataService : 
 
 /*------------------------------------------------------------------------
    File        : ItemService
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : 
    Notes       : 
  ----------------------------------------------------------------------*/
 
    define temp-table eItem no-undo before-table eItemBefore
        field ItemNum as integer label "Item Num" format "zzzzzzzzz9" initial "0"
        field ItemName as character label "Item Name" format "x(25)"
        field Price as decimal label "Price" format "->,>>>,>>9.99" initial "0" decimals 2
        field Onhand as integer label "On Hand" format "->>>>9" initial "0"
        field OnOrder as integer label "On Order" format "->>>>9" initial "0"
        field Category1 as character label "Category1" format "x(30)"
        field Allocated as integer label "Allocated" format "->>>>9" initial "0"
        field CatDescription as character label "Cat-Description" format "X(200)"
      index ItemNum is primary unique 
        Itemnum       
      index CategoryItemName
        Category1
        ItemName
      index ItemName 
        ItemName
      index CatDescription is word-index 
        CatDescription
       .  
           
    define dataset dsItem for eItem.   
     
    constructor ItemService():
        super(dataset dsItem:handle).     
    end.        
    
    method override protected IDataAccess createDataAccessObject():
        return new DynamicDAO("eItem","Item").
    end.    
                        
end class.
 