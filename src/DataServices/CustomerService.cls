 
 /*------------------------------------------------------------------------
    File        : CustomerService
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Mon Apr 28 23:36:42 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using DataSources.*.  
using DataServices.*.  

class DataServices.CustomerService inherits DataService :   
    define variable oCust as DynamicDAO no-undo.
    define variable fQuery as handle no-undo.
    
    define temp-table eCustomer
        field CustNum as integer label "Customer num."
        field Name as char format "x(40)" label "Name"
        field Address as char format "x(40)" label "Street address"
        field Address2 as char format "x(40)" label "Address 2"
        field City as char format "x(40)" label "City"
        field Salesrep as char format "x(3)" label "Sales rep"
        field Contact as char format "x(30)" label "Contact"
        field Phone as char format "x(18)" label "Phone"
        field Comments as char format "x(250)" label "Comments"
        field CreditLimit as decimal format ">,>>>,>>9.99" label "Credit limit"
        field Balance as decimal format "->,>>>,>>9.99" label "Balance"
        field Discount as decimal format ">>9%" label "Discount"
        index custnum as unique CustNum.

    define temp-table eSalesrep
        field SalesRep as char label "Sales rep"
        field RepName  as char label "Sales rep name"
        field Region   as char label "Region"
        index salesrep as unique SalesRep.

    define dataset dsCustomer for eCustomer, eSalesrep
      data-relation dSalesrep for eCustomer, eSalesrep
          relation-fields (Salesrep,Salesrep) reposition.   
   
    constructor CustomerService():
        super(dataset dsCustomer:handle).  
    end.        
    
    method override protected IDataAccess createDataAccessObject():
        return new DynamicDAO("eCustomer,eSalesrep","Customer,SalesRep").
    end.    
                   
end class.