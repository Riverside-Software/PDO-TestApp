 
 /*------------------------------------------------------------------------
    File        : BatchingService
    Purpose     : Data Batching .Net specific service adpater (simulation..) 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Tue May 06 21:29:28 EDT 2008
    Notes       : Data service adapter base class (for sample use only)
                  This simplified data service simulates a batching 
                  service adapter. 
             -    It uses a similar simplified data access interface, which
                  in theory could communicate over another session before 
                  reaching the physical data.  
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
using DataServices.*.
 
class DataServices.DataBatchingService inherits DataService implements IDataBatchingService: 
    define private variable fContext as character no-undo init ?. 
    define private variable fQueryContext as character no-undo. 
    
    define public property BatchSize as integer no-undo get. set.  
     
    define public property HasLast as logical no-undo 
    get:
        return (fContext eq "").
    end.     
 
    constructor DataBatchingService(datasetHandle as handle):
        super(datasetHandle).
    end constructor. 

    /* see comment in notes about use of by-reference  */
    method public override void FetchData():
        FetchData(BatchSize,"").
    end method. 
    
    /* see comment in notes about use of by-reference  */
    method public void FetchData(numRecords as int):
         FetchData(numRecords,"").
     end method. 
   
	/* see comment in notes about use of by-reference  */
    method public void FetchData(input numRecords as int, whereClause as char):
        define variable dao as IDataAccess no-undo.
        define variable hdl as handle no-undo.
        EmptyDataset().
        dao = createDataAccessObject(). 
        hdl = DatasetHandle.
        dao:fetchBatch(whereClause, numRecords, input-output dataset-handle hdl, input-output fContext).
    end method. 
    
    method public integer FetchNextBatch():      
        return FetchNextBatch(BatchSize).
    end method. 
    
   	/* see comment in notes about use of by-reference  */
    method public integer FetchNextBatch(numRecords as int):
        define variable queryHandle as handle no-undo.
     		define variable dao as IDataAccess no-undo.
        define variable OldNum as integer  no-undo.
        define variable hdl as handle no-undo.
        dao = createDataAccessObject(). 
        queryHandle = this-object:DatasetHandle:top-nav-query(1).
        hdl = DatasetHandle.
		dao:fetchBatch(fQueryContext,numRecords,input-output dataset-handle hdl, input-output fContext).
        
        /* we got all records and not likely an exact batch, so we need to count*/
        if fContext > "" then         
        do:
            /* must have preselect for this 
              (Otherwise a get last is required if not indexed-reposition) */ 
            OldNum = queryHandle:num-results.
            queryHandle:query-open.
		    return queryHandle:num-results - OldNum.
        end.
        else 
            return numRecords.    
    end method. 
     
    method public override void ResortQuery(bufferName as character, sortExpression as character ):
		define variable dao as IDataAccess no-undo.
		define variable queryHandle as handle no-undo.
		  
	    queryHandle = this-object:DatasetHandle:top-nav-query(bufferName).
		queryHandle:query-prepare("preselect each " + bufferName + " " + sortExpression).        
        if not HasLast then 
        do:
            FetchData(input BatchSize, queryHandle:prepare-string).
            fQueryContext = queryHandle:prepare-string.
        end.
        queryHandle:query-open().        
		return.
	end method. 
    
    method protected void EmptyDataset():
        DatasetHandle:empty-dataset.
        fContext = ?.
    end.       
end class.
 