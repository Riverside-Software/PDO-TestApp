 
 /*------------------------------------------------------------------------
    File        : EmployeeDAO
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Sun Jul 13 17:19:25 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/
using Progress.Lang.*.

class DataSources.EmpFamilyDAO  inherits DataSources.DynamicDAO:
	define private variable fTemptables as char no-undo.	
 
    constructor public EmpFamilyDAO (temptables as character):
		super (temptables, 'Employee,Family').
		fTemptables = temptables.		
	end constructor.
	       
    method override protected void loadReadCallBacks( input-output dataset-handle h ):
	    define variable empBuffer as handle no-undo.
	    empBuffer = h:get-buffer-handle(entry(1,fTempTables)).
        empBuffer:set-callback("after-row-fill","EmployeeAfterRowFill",this-object).  	   	
	end method.

    method public void EmployeeAfterRowFill( input dataset-handle hEmployee ):
        define variable empBuffer as handle no-undo.
	    empBuffer = hEmployee:get-buffer-handle(entry(1,fTempTables)).
        empBuffer::FullName = empBuffer::FirstName + " " + empBuffer::LastName.   
	end method.
    
end class.