 
 /*------------------------------------------------------------------------
    File        : DataService
    Purpose     : .Net specific service adpater (simulation..) 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Tue May 06 21:29:28 EDT 2008
    Notes       : Data service adapter base class (for sample use only)
                  This simplified data service simulates a .Net specific 
                  service adapter and general service in one class. A more 
                  complete implementation would likely have this as separate 
                  classes. 
             -    It uses a similar simplified data access interface, which
                  in theory could communicate over another session before 
                  reaching the physical data.  
             -    This service is Infragistics specific. One migth consider 
                  a more general approach that supports arrays and/or more 
                  general collections or maybe even ABL strings/extents. 
                  Another alternative is to use a more callback oriented pure 
                  ABL approach.  (ok, I'm just covering my ...)
             -    WARNING: 
                  This sample is using by-reference in the call to the DAO.
                  This is simulating a call to a DA layer that can go over an 
                  appserver. However this implementation actually calls the 
                  database DAO directly. This will typically cause issues in 
                  cases where there would be many requests for data. It is 
                  difficult not to mess with client dataset settings and data 
                  if you use fill on the client dataset, particualty with 
                  complex datasets with reposition relations.  You'd simplify a 
                  lot if you ensure there is a deep copy between BL and DA also 
                  when running connected. The key is to design for appserver 
                  usage and use most of the same components and layers also 
                  when running connected. This makes the behavior similar 
                  in both cases and simplifies testing. 
  ----------------------------------------------------------------------*/
 
using Infragistics.Win.UltraWinListView.*.
using DataSources.*.

using System.Data.DataTable.
using System.Data.DataColumn.
using Progress.Util.TypeHelper.

class DataServices.DataService  implements DataServices.IDataService : 
 
    define private variable fDatasetHandle as handle no-undo.
    define private variable fStaticDatasetHandle as handle no-undo.
     
    define public property SchemaName as character no-undo
    get:
        if SchemaName = "" or SchemaName = ? then 
           return this-object:toString(). 
    end.     
    set.    
    
    define public property DatasetHandle as handle no-undo
    get:
        return fDatasetHandle.
    end. 
    
    constructor DataService(datasetHandle as handle):
        fStaticDatasetHandle = datasetHandle.
        /* real world should create a dynamic copy */
        fDatasetHandle = datasetHandle.
        extent(this-object:QueryHandles) = DataSetHandle:num-buffers.
    end constructor. 
    
    define public property QueryHandles as handle extent no-undo 
    get(i as int):
        if not valid-handle(QueryHandles[i]) then
            QueryHandles[i] = CreateQuery(DataSetHandle:get-buffer-handle(i)).
        return QueryHandles[i].
    end.    
    set. 
    
    method private handle CreateQuery (bufferName as char):
        return CreateQuery(bufferName,"").
    end method.   
        
    method private handle CreateQuery (bufferHandle as handle):
        return CreateQuery(bufferHandle,"").
    end method.     
    
    method private handle CreateQuery (bufferName as char, whereClause as char):
        define variable bufferHandle as handle no-undo.
        bufferHandle = DataSetHandle:get-buffer-handle(bufferName).
        create buffer bufferHandle for table bufferHandle.
        return CreateQuery(bufferHandle, whereClause).
    end method.     
    
    method private handle CreateQuery (bufferHandle as handle, whereClause as char):
        define variable queryHandle as handle no-undo.
        create query queryHandle.
        queryHandle:add-buffer(bufferHandle).
        if whereClause > "" then
            queryHandle:query-prepare(whereClause).
        else
            queryHandle:query-prepare("preselect each " + bufferHandle:name).
          
        return queryHandle.
    end method.     
    
    method public handle OpenQuery(bufferName as char):
        return OpenQuery(bufferName,""). 
    end method.      
    
    /* this method creates a new query each time, there are cases where 
       it might be more beneficial to reuse an existing query. */ 
    method public handle OpenQuery(bufferName as char,whereClause as char):
        define variable queryHandle as handle no-undo.
        queryHandle = CreateQuery(bufferName,whereClause).
        queryHandle:query-open().     
        return queryHandle.  
    end method.      
      	
    method public void FetchData( input whereclause as character ):
		undo, throw new Progress.Lang.AppError("METHOD NOT IMPLEMENTED").
	end method.
    
    /* Resort the default dataset query. (cannot sort child data and assumes 
       no where clause. Both of which can be fully ok, but some error handling
       should be added) 
       This is used from clients that bind to the default dataset query.
       More advanced solutions might leave this query alone and use buffers 
       to allow sharing of data.   */
	method public void ResortQuery( bufferName as character, sortExpression as character ):
		define variable queryHandle as handle no-undo.  
	    queryHandle = this-object:DatasetHandle:top-nav-query(bufferName).
		queryHandle:query-prepare("preselect each " + bufferName + " " + sortExpression).        
        queryHandle:query-open( ).        
		return.
	end method.

 	method public logical SaveData( input-output dataset-handle h):
		undo, throw new Progress.Lang.AppError("METHOD NOT IMPLEMENTED").
	end method.
	
	/* see comment in notes about use of by-reference  */
    method public void FetchData():
        define variable dao as IDataAccess no-undo.
        dao = createDataAccessObject().
        dao:fetchData(input-output dataset-handle fDatasetHandle by-reference).
    end method. 
    
    /* "abstract" method, to be implemented by sub classes */ 
    method protected IDataAccess createDataAccessObject():
    	undo, throw new Progress.Lang.AppError("Method createDataAccessObject need to be overridden by subclass").
	end method.     
    
    /* build list with name and automatic integer key */ 
    method public Infragistics.Win.ValueList ValueList(bufferName as char, fieldName as char):
	    ValueList(bufferName,"",fieldname).
	end method.
         	 
	/* Return a valuelist from all the records in the specifed buffer allowing combos and grid cells to be 
	   paopulated from the service.    
	   The actual size limit is not known. The assumption is that one would not use this for too large 
	   amounts of data, because it does not make sense to show too much data in the types of controls that 
	   use ValueLists. 
	 - Add error handling to deal with the size limitation if this approach 
	   is used in a production environment.
	 - This is not ready/not tested for use with child tables. (except REPOSITION relation) */
	method public Infragistics.Win.ValueList ValueList(bufferName as char, keyName as char, fieldName as char):
		define variable valueList    as Infragistics.Win.ValueList no-undo.
		define variable queryHandle  as handle no-undo. 
		define variable fieldHandle  as handle no-undo. 
		define variable keyHandle    as handle no-undo. 
		define variable bufferHandle as handle no-undo. 
		define variable i            as integer no-undo. 
		
		valueList = new Infragistics.Win.ValueList().
		queryHandle = OpenQuery(bufferName).
		bufferHandle = queryHandle:get-buffer-handle(1).
		fieldHandle = bufferHandle:buffer-field(fieldName).
		if keyName > "" then
	        keyHandle = bufferHandle:buffer-field(keyName).
		queryHandle:get-first.
		do while bufferHandle:avail:
		    if valid-handle(keyHandle) then 
		        valueList:ValueListItems:Add(keyHandle:buffer-value,fieldHandle:buffer-value).
	        else
                valueList:ValueListItems:Add(i,fieldHandle:buffer-value).
            i = i + 1.
            queryHandle:get-next.
        end.
        return valueList.    
	end method.
    
    /* Return data as DataTable  */
	method public DataTable DataTable(bufferName as char, whereClause as char, fieldNames as char): 
		define variable queryHandle  as handle no-undo. 
		  
	    if whereClause > "" then
	        queryHandle  = OpenQuery(bufferName,whereClause).
        else 
            queryHandle  = OpenQuery(bufferName).
              
        return DataTable(queryHandle, fieldNames).
     end method.   	      
        
     method protected DataTable DataTable(queryHandle as handle): 
	     return DataTable(queryHandle,""). 
	 end method.   	      
       
     /* Return an opened query as DataTable  */
	 method protected DataTable DataTable(queryHandle as handle, fieldNames as char): 
		
		 define variable listRecord   as System.Array no-undo.
		 define variable fieldHandle  as handle no-undo extent. 
		 define variable bufferHandle as handle no-undo. 
		 define variable i            as integer no-undo. 
	     define variable numFields    as integer no-undo. 
	     define variable dataTable    as DataTable no-undo.
	     define variable dataColumn   as DataColumn no-undo.
	 
         assign
             bufferHandle = queryHandle:get-buffer-handle(1)
             numFields    = (if fieldnames <> "" then num-entries(fieldNames) 
                             else bufferHandle:num-fields)  
             extent(fieldHandle) = numFields
             listRecord = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Object"), numFields).
             dataTable  = new System.Data.DataTable(bufferHandle:Name).
	    
         do i = 1 to extent(fieldHandle):    
             assign	    
		         fieldHandle[i] = if fieldnames <> "" then bufferHandle:buffer-field(entry(i,fieldNames))
		                          else bufferHandle:buffer-field(i)		
			     dataColumn = dataTable:Columns:Add(fieldHandle[i]:Name,NetType(fieldHandle[i]:Data-type))	
		         dataColumn:Caption = fieldHandle[i]:label. 
		 end.
     	 do while queryHandle:get-next:	
		     do i = 1 to extent(fieldHandle): 
		         listRecord:SetValue(fieldHandle[i]:buffer-value, i - 1).                                                    
             end.   
             dataTable:Rows:Add(listRecord).                           
         end. 	
         return dataTable.
     end method.   	
     
     method private static System.Type NetType (progresstype as char):
        case progresstype:
            when "character" then 
                return TypeHelper:GetType("System.String").
            when "integer" then 
                return TypeHelper:GetType("System.Int32").
            when "int64" then 
                return TypeHelper:GetType("System.Int64").
            when "date" then 
                return TypeHelper:GetType("System.DateTime").
            when "datetime" then 
                return TypeHelper:GetType("System.DateTime").
            when "decimal" then 
                return TypeHelper:GetType("System.Decimal").
            when "logical" then 
                return TypeHelper:GetType("System.Boolean").
            when "blob" then /* this isn't always right  */
                return TypeHelper:GetType("System.Drawing.Bitmap").
        end.
    end method.      
                        
end class.
 