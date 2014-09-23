 
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
  
class DataServices.EmployeeService inherits  DataService : 
 
 /*------------------------------------------------------------------------
    File        : SalesrepService
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : 
    Notes       : 
  ----------------------------------------------------------------------*/
 
    define temp-table  eEmployee no-undo
      field EmpNum           as integer     format "zzzzzzzzz9" label "Emp No"
      field FirstName        as character   format "x(15)" label "First Name"
      field LastName         as character   format "x(25)" label "Last Name"
      field Address          as character   format "x(35)" label "Address"
      field Address2         as character   format "x(35)" label "Address2"
      field City             as character   format "x(25)" label "City"
      field PostalCode       as character   format "x(10)" label "Postal Code"
      field Birthdate        as date        format "99/99/9999" label "Birthdate"
      field DeptCode         as character   format "x(3)" label "Dept Code"
      field HomePhone        as character   format "x(20)" label "Home Phone"
      field position         as character   format "x(30)" label "Position"
      field SickDaysLeft     as integer     format ">>9" label "Sick Days Left"
      field StartDate        as date        format "99/99/9999" label "Start Date"
      field State            as character   format "x(20)" label "State"
      field VacationDaysLeft as integer     format ">>9" label "Vacation Days Left"
      field WorkPhone        as character   format "x(20)" label "Work Phone"
      
      /* the following fields are not in sports2000 */
      field Country          as character   format "x(25)" label "Country"
      field Notes            as character   format "x(200)" label "Notes"
      field Photo            as blob label "Photo"
      index EmpNum as unique primary EmpNum
      index DeptCode DeptCode
      index State State. 
    
    define dataset dsEmployee for  eEmployee.
             
    constructor EmployeeService():
        super(dataset dsEmployee:handle).
    end.        
    
    method override protected IDataAccess createDataAccessObject():
        return new EmployeeDAO("eEmployee").
    end.    
                        
end class.
 