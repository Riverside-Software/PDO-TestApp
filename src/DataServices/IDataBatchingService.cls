/*------------------------------------------------------------------------
    File        : IDataBatchingService for .NET 
    Purpose     : Data batching service 
    Syntax      : 
    Author(s)   : hdaniels
    Created     :  
    Notes       : The number of overloads is perhaps an overreaction of 
                  never having this capability in adm2...
  ----------------------------------------------------------------------*/

interface DataServices.IDataBatchingService:  
    define public property DatasetHandle as handle no-undo get.  
    define public property BatchSize as integer no-undo get. set.  
    define public property HasLast as logical no-undo get. 
    
    method public void FetchData().
    method public void FetchData(numRecords as int).
    method public void FetchData(numRecords as int, sortExpression as char).
    method public integer FetchNextBatch().
    method public integer FetchNextBatch(numRecords as int).
    method public void ResortQuery( bufferName as character, sortExpression as character).

end interface.