 
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

class DataSources.EmployeeDAO  inherits DataSources.DynamicDAO:
	define private variable fTemptable as char no-undo.	
 
    constructor public EmployeeDAO (temptables as character):
		super (temptables, 'employee').
		fTemptable = temptables.		
	end constructor.
	
	method override public void fetchData(input-output dataset-handle h):
         h:read-xml("FILE", SEARCH("DataSources/EmployeeData.xml") ,'append',"",yes). 
    end method.
            
    /** the blob is stored with the data in the xml file
	method override protected void loadReadCallBacks( input-output dataset-handle h ):
	    define variable empBuffer as handle no-undo.
	    empBuffer = h:get-buffer-handle(fTemptable).
        empBuffer:set-callback("after-row-fill","EmployeeAfterRowFill",this-object).  	   	
	end method.

    method public void EmployeeAfterRowFill( input dataset-handle h ):
        define variable filename as char no-undo.
        filename = "Graphics/Pictures/emp" + string(h::eEmployee::empnum,"999") + ".png".      
        copy-lob file filename to h::eEmployee::photo no-error.      
	end method.
    **/ 
end class.