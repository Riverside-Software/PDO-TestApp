 
 /*------------------------------------------------------------------------
    File        : DynamicDAO
    Purpose     : 
    Syntax      : new DynamicDAO(temptablenames,databasetablenames).
                  temptablenames - comma separated list of temptables in BE
                  databasetablenames - comma separated list of database tables 
                                       that  should be mapped to the temptables 
    Description : 
    Author(s)   : hdaniels
    Created     :  
    Notes       : Generic/dynamic data access object for sample use 
                  This is not production code. 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

class DataSources.DynamicDAO implements DataSources.IDataAccess: 
    
    define private variable fBufferHandles as handle extent no-undo.
    
    /* context could be on server, but not in the DAO, as you would
       not get the same DAO on the next request on an appserver */      
    define private variable rContext as rowid no-undo.
    
    define public property TempTableNames as character extent no-undo 
    get.    
    private set.
     
    constructor DynamicDAO(temptables as char,buffers as char):
        def var i as integer no-undo.
        def var bufferName   as character no-undo.
        def var bufferHandle as handle    no-undo.
         
        extent(fBufferHandles) = num-entries(buffers).
        extent(TempTableNames) = num-entries(temptables).
        
        do i = 1 to extent(fBufferHandles):
            bufferName = entry(i,buffers).
            TempTableNames[i] = entry(i,tempTables).    
            bufferHandle = createDbBuffer(bufferName).
            if not valid-handle(bufferHandle) then
            do:
                undo, throw new Progress.Lang.AppError("Could not create buffer for " + bufferName).
            end.      
            create data-source fBufferHandles[i]. 
            fBufferHandles[i]:add-source-buffer(bufferHandle,bufferHandle:keys). 
        end.    
    end constructor.     
  
    method public void FetchData(input-output dataset-handle h):
        attachDataSources(input-output dataset-handle h by-reference).
        loadReadCallBacks( input-output dataset-handle h by-reference).
        h:fill().       
        detachDataSources(input-output dataset-handle h by-reference).
    end method.
   
    /* Simulates transform of client where clause to data access query */     
    method private void AssignClientQuery (bufferHandle as handle, whereClause as char):
        define variable queryHandle as handle no-undo.  
        define variable serverWhere as char no-undo.
        define variable queryPos as int no-undo.
        queryHandle = bufferHandle:data-source:query.
        /* this is a hack. do not use!  */
        serverWhere = replace(whereClause,bufferHandle:name,queryHandle:get-buffer-handle(1):name).
        queryPos = index(serverWhere," where ").
        if queryPos = 0 then
           queryPos = index(serverWhere," by ").
        if queryPos > 0 then
        do: 
          serverWhere = substr(serverWhere,querypos + 1).
          bufferHandle:data-source:fill-where-string = serverWhere.
        end.
    end method.
    
    method public void FetchBatch( whereClause as char, numRecords as int, input-output dataset-handle h, input-output context as char).
        define variable keyValue as char no-undo.
        define variable firstBuffer as handle no-undo.
        attachDataSources(input-output dataset-handle h by-reference).
        LoadReadCallBacks( input-output dataset-handle h by-reference).
        firstBuffer = h:get-buffer-handle(1).         
        firstBuffer:batch-size = numRecords.
        if context > "" then 
           firstBuffer:data-source:restart-rowid = to-rowid(context). 
        if whereClause > "" then
            AssignClientQuery(firstBuffer,whereClause). 
       
        h:fill().       
        if valid-handle(firstBuffer) and not firstbuffer:last-batch then
            context = string(firstBuffer:data-source:next-rowid).
        else
            context = "".
        
        detachDataSources(input-output dataset-handle h by-reference).
    end method.
    
    method public void FetchBatch(numRecords as int, input-output dataset-handle h, input-output context as char).
        this-object:FetchBatch("",numRecords,input-output dataset-handle h by-reference,input-output context).
    end method.
    
    method protected void AttachDataSources(input-output dataset-handle h):
        define variable bufferHandle as handle no-undo.
        define variable i as integer no-undo. 
        do i = 1 to extent(TempTableNames):
            bufferHandle = h:get-buffer-handle(TempTableNames[i]).
            bufferHandle:attach-data-source(fBufferHandles[i]).             
        end.     
    end method.
    
    method protected void DetachDataSources(input-output dataset-handle h):
        define variable bufferHandle as handle no-undo.
        define variable i as integer no-undo. 
        do i = 1 to extent(TempTableNames):
            bufferHandle = h:get-buffer-handle(TempTableNames[i]).
            bufferHandle:detach-data-source().        
        end.   
    end method.       
    
    method protected void LoadReadCallBacks( input-output dataset-handle h ):	
	end method.
	
    /* Creates a database buffer with bufferName for the specified 
        physical name */
    method protected handle CreateDbBuffer(bufferName as char, physicalName as char):
        define variable bufferHandle as handle no-undo.
        create buffer bufferHandle for table bufferName buffer-name physicalName no-error.
        return bufferHandle.
    end method.     
    
    method protected handle CreateDbBuffer(bufferName as char):
        return this-object:createDbBuffer(bufferName,bufferName).   
    end method.              
end class.