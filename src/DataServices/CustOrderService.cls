 
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
using DataServices.DataService. 
  
class DataServices.CustOrderService inherits  DataService : 
 
 /*------------------------------------------------------------------------
    File        : SalesrepService
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : 
    Notes       : 
  ----------------------------------------------------------------------*/
    define protected temp-table eCustomer no-undo before-table eCustomerBefore
        field CustNum as integer label "Cust Num" format ">>>>9" initial "0"
        field Name as character label "Name" format "x(30)"
        field Address as character label "Address" format "x(35)"
        field Address2 as character label "Address2" format "x(35)"
        field City as character label "City" format "x(25)"
        field State as character label "State" format "x(20)"
        field PostalCode as character label "Postal Code" format "x(10)"
        field Country as character label "Country" format "x(20)" initial "USA"
      index CustNum is primary unique custnum
      index Custname name. 
      
    define protected temp-table eOrder no-undo before-table eOrderBefore  
        field Ordernum as integer label "Order Num" format "zzzzzzzzz9" initial "0"
        field CustNum as integer label "Cust Num" format ">>>>9" initial "0"
        field OrderDate as date label "Ordered" format "99/99/99" initial "TODAY"
        field ShipDate as date label "Shipped" format "99/99/9999"
        field PromiseDate as date label "Promised" format "99/99/99"
        field Carrier as character label "Carrier" format "x(25)"
        field Instructions as character label "Instructions" format "x(50)"
        field PO as character label "PO" format "x(20)"
        field Terms as character label "Terms" format "x(20)" initial "Net30"
        field OrderStatus as character label "Order Status" format "x(20)" initial "Ordered"
        field Creditcard as character label "Credit Card" format "x(20)" initial "Visa"
/*        field OrderTotal as decimal format ">>>>>9.99"*/
        index OrderNum is primary unique Ordernum . 
    
    define protected temp-table eOrderLine no-undo before-table eOrderLineBefore
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
   
	   
    define dataset dsCustOrder for eCustomer,eOrder,eOrderLine
        data-relation dCustOrder for eCustomer,eOrder
            relation-fields (CustNum,CustNum)
        data-relation dOrderLine for eOrder,eOrderLine
            relation-fields (OrderNum,OrderNum)
        .   
    
    define private temp-table CountrySales 
        field Country as char 
        field Sales   as decimal
        index Country is unique country.
     
    constructor CustOrderService():
        super(dataset dsCustOrder:handle).    
    end.        
    
    method override protected IDataAccess createDataAccessObject():
        return new DynamicDAO("eCustomer,eOrder,eOrderLine","Customer,Order,OrderLine").
    end method.    
    
    method public System.Data.DataTable CountryExportSales ():
        define variable queryHandle as handle no-undo.
        /* this would be faster if the datatable was created in the for each . 
           it's mainly done in two steps to reuse the DataTable api 
           (however with many types and/or complex reports/data it might 
            be easier to use a temp-table as the starting point ) */
        for each eCustomer where eCustomer.Country <> "USA" , each eOrder of eCustomer, each eOrderline of eOrder break by eCustomer.Country:
            accumulate eOrderLine.ExtendedPrice (sub-total by ecustomer.Country).
            if last-of(eCustomer.Country) then
            do:
               create CountrySales.
               assign CountrySales.Country = eCustomer.Country
                      CountrySales.Sales = accum sub-total by ecustomer.Country eOrderLine.ExtendedPrice.
               if eCustomer.Country = "United Kingdom" then  
                  CountrySales.Country = "UK".              
            end. 
        end.
        create query queryHandle.
        queryHandle:add-buffer(buffer CountrySales:handle).      
        queryHandle:query-prepare("for each CountrySales").      
        queryHandle:query-open.
        return DataTable(queryHandle).
    end method.
            
end class.
 