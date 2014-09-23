 
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
 
class DataServices.DeptEmployeeService inherits  DataService : 

    define temp-table eDepartment
      field DeptCode as character   format "x(3)" label "Dept Code"
      field DeptName as character   format "x(15)" label "Dept Name"
      index DeptCode as unique primary DeptCode.
      
    define temp-table eEmployee 
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
      field position         as character   format "x(20)" label "Position"
      field SickDaysLeft     as integer     format ">>9" label "Sick Days Left"
      field StartDate        as date        format "99/99/9999" label "Start Date"
      field State            as character   format "x(20)" label "State"
      field VacationDaysLeft as integer     format ">>9" label "Vacation Days Left"
      field WorkPhone        as character   format "x(20)" label "Work Phone"
      index EmpNum as unique primary EmpNum
      index DeptCode DeptCode
      index State State.
    
    define temp-table eFamily
      field Relation          as character   format "x(15)" label "Relation"
      field RelativeName      as character   format "x(15)" label "Relative Name"
      field Birthdate         as date        format "99/99/9999" label "Birthdate"
      field BenefitDate       as date        format "99/99/9999" label "Benefit Date"
      field CoveredOnBenefits as logical     label "Covered On Benefits"
      field EmpNum            as integer     format "zzzzzzzzz9" label "Emp No"
      index relative as unique EmpNum RelativeName.
	   
    define dataset dsDepartment for eDepartment,eEmployee,eFamily
        data-relation rDepartment for eDepartment,eEmployee
            relation-fields (DeptCode,DeptCode)
        data-relation rFamily for eEmployee,eFamily
            relation-fields (EmpNum,EmpNum).
             
    constructor DeptEmployeeService():
        super(dataset dsDepartment:handle).
    end.        
    
    method override protected IDataAccess createDataAccessObject():
        return new DynamicDAO("eDepartment,eEmployee,eFamily","Department,Employee,Family").
    end.    
                        
end class.
 