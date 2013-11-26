
/*------------------------------------------------------------------------
    File        : IDataAccess sample data access  
    Purpose     :  
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Tue May 06 01:49:29 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

interface DataSources.IDataAccess:  
    define public property TempTableNames as character extent no-undo get.    
    method public void FetchData(input-output dataset-handle h).
    method public void FetchBatch(numRecords as int, input-output dataset-handle h, input-output context as char).
    method public void FetchBatch(whereClause as char, numRecords as int, input-output dataset-handle h, input-output context as char).
end interface.