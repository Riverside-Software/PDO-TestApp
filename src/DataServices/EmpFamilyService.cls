 
 /*------------------------------------------------------------------------
    File        : CustomerService
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Mon Apr 28 23:36:42 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

using DataSources.*.

CLASS DataServices.EmpFamilyService inherits DataServices.DataService:   

   DEFINE TEMP-TABLE eEmployee
   FIELD EmpNum    AS INTEGER   LABEL "Emp No"     FORMAT "zzzzzzzzz9" INITIAL "0"
   FIELD LastName  AS CHARACTER LABEL "Last Name"  FORMAT "x(25)"
   FIELD FirstName AS CHARACTER LABEL "First Name" FORMAT "x(15)"
   FIELD FullName  AS CHARACTER LABEL "Name"       FORMAT "x(40)"
      INDEX EmpNo IS PRIMARY UNIQUE 
        EmpNum
      INDEX Name IS UNIQUE 
        LastName
        FirstName
      .

   DEFINE TEMP-TABLE eFamily
   FIELD EmpNum AS INTEGER LABEL "Emp No" FORMAT "zzzzzzzzz9" INITIAL "0"
   FIELD RelativeName AS CHARACTER LABEL "Relative Name" FORMAT "x(15)"
   FIELD Relation AS CHARACTER LABEL "Relation" FORMAT "x(15)"
   FIELD Birthdate AS DATE LABEL "Birthdate" FORMAT "99/99/9999"
   FIELD CoveredOnBenefits AS LOGICAL LABEL "Covered On Benefits" FORMAT "yes/no" INITIAL "no"
   FIELD BenefitDate AS DATE LABEL "Benefit Date" FORMAT "99/99/9999"
      INDEX EmpNoRelativeName IS PRIMARY UNIQUE 
        EmpNum
        RelativeName
      .

    DEFINE DATASET dsEmpFamily FOR eEmployee, eFamily
        DATA-RELATION rlempfamily FOR eEmployee,eFamily
            RELATION-FIELDS(EmpNum,EmpNum).
     
    CONSTRUCTOR EmpFamilyService():
       super(dataset dsEmpFamily:handle).    
    END.
    
    method override protected IDataAccess createDataAccessObject():
        return new EmpFamilyDAO("eEmployee,eFamily").
    end.    
            
END CLASS.