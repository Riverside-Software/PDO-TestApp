 
 /*------------------------------------------------------------------------
    File        : CustomerService  
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   :  
    Created     :  
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

using DataServices.DataService.      
using DataSources.*.      
      
class DataServices.CustOrderItemService  inherits  DataService :    
    define temp-table eCustomer
        field CustNum as integer   label "CustNum"
        field Name    as character format "x(40)" label "Name"
        field Phone   as character label "Phone" format "x(20)"
        field Contact as character label "Contact" format "x(30)"
        field Balance as decimal   decimals 2 label "Balance" format "->,>>>,>>9.99"
        index custnum as unique CustNum.

    define temp-table eOrder
        field Ordernum    as integer   label "Order Num"    format "zzzzzzzzz9" initial "0"
        field CustNum     as integer   label "Cust Num"     format ">>>>9" initial "0"
        field OrderDate   as date      label "Ordered"      format "99/99/99" initial "TODAY"
        field ShipDate    as date      label "Shipped"      format "99/99/9999"
        field PromiseDate as date      label "Promised"     format "99/99/99"
        field OrderStatus as character label "Order Status" format "x(20)" 
        index CustOrder is unique CustNum Ordernum
        index OrderDate OrderDate
        index OrderNum is primary unique Ordernum
        index OrderStatus OrderStatus.

    define temp-table eOrderLine
        field Ordernum as integer   label "Order Num" format "zzzzzzzzz9"    initial "0"
        field Linenum  as integer   label "Line Num"  format ">>9"           initial "0"
        field Itemnum  as integer   label "Item Num"  format "zzzzzzzzz9"    initial "0"
        field ItemName as character label "Item Name" format "x(25)"
        field Price    as decimal   label "Price"     format "->,>>>,>>9.99" initial "0" decimals 2
        field Qty      as integer   label "Qty"       format "->>>>9"        initial "0"
        field Discount as integer label "Discount" format ">>9%" initial "0"
        index Itemnum Itemnum
        index orderline is primary unique Ordernum Linenum.

   define temp-table eItem
   field Itemnum as integer label "Item Num" format "zzzzzzzzz9" initial "0"
   field ItemName as character label "Item Name" format "x(25)"
   field Price as decimal label "Price" format "->,>>>,>>9.99" initial "0" decimals 2
   field Stock as integer label "Stock" format "->>>>9" initial "0"
   field OnOrder as integer label "On Order" format "->>>>9" initial "0"
   field Category1 as character label "Category1" format "x(30)"
   field Allocated as integer label "Allocated" format "->>>>9" initial "0"
   field Onhand as integer label "On Hand" format "->>>>9" initial "0"
      index CategoryItemName
        Category1
        ItemName
      index ItemName is word-index 
        ItemName
      index ItemNum is primary unique 
        Itemnum.

    define dataset dsCustomer for eCustomer, eOrder, eOrderLine, eItem
        data-relation oorderd for eCustomer,eOrder
            relation-fields(custnum,custnum)
        data-relation orline for eOrder,eOrderLine
            relation-fields(ordernum,ordernum).

    constructor CustOrderItemService():
        super(dataset dsCustomer:handle).    
    end.        
    
    method override protected IDataAccess createDataAccessObject():
        return new DynamicDAO("eCustomer,eOrder,eOrderLine,eItem","Customer,Order,OrderLine,Item").
    end.    
end class.