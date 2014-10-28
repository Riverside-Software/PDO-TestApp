/*------------------------------------------------------------------------
    File        : IDataService for .NET 
    Purpose     : Client side data service with .Net types in addition to 
                  dataset and query 
    Syntax      : 
    Author(s)   : hdaniels
    Created     : Tue May 06 01:49:29 EDT 2008
    Notes       : This simulates a .Net specific service adapter interface.
  ----------------------------------------------------------------------*/

interface DataServices.IDataService:  
    define public property QueryHandles as handle no-undo extent get. 
    define public property DatasetHandle as handle no-undo get.  
    
    method public void FetchData().
	method public void ResortQuery(bufferName as char,sortExpression as char).
	method public handle OpenQuery(bufferName as char,whereClause as char).
	method public handle OpenQuery(bufferName as char).
	
	/* Return a DataTable from records in the specifed buffer */  
	method public System.Data.DataTable DataTable(bufferName as char, whereClause as char, fieldNames as char). 
	
	/* Return a valuelist from all the records in the specifed buffer */  
	method public Infragistics.Win.ValueList ValueList(bufferName as char, keyName as char, fieldName as char).  
	/* Return a valuelist from all the records in the specifed buffer with automatic integer key */ 
	method public Infragistics.Win.ValueList ValueList(bufferName as char, fieldName as char).  
	
end interface.