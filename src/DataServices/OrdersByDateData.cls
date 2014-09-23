 
 /*------------------------------------------------------------------------
    File        : OrdersByDateData
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Sun Sep 07 14:30:18 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING DataServices.DataService.

USING Progress.Util.*.

USING System.Data.*.
USING DataSources.*.


CLASS DataServices.OrdersByDateData INHERITS DataService   : 
    DEFINE PRIVATE VARIABLE startDate AS DATETIME NO-UNDO.
    DEFINE PRIVATE VARIABLE endDate   AS DATETIME NO-UNDO.

    DEFINE PRIVATE TEMP-TABLE eOrderByData NO-UNDO
    FIELD orderDate AS DATE LABEL "Order Date"
    FIELD totalOrders AS INTEGER LABEL "Orders"
    INDEX orderDate AS PRIMARY orderDate.
    
    DEFINE PRIVATE TEMP-TABLE eOrder NO-UNDO
    FIELD orderDate AS DATE LABEL "Order Date"
    INDEX orderDate AS PRIMARY orderDate.

    DEFINE PRIVATE DATASET dsOrders FOR eOrder.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	CONSTRUCTOR PUBLIC OrdersByDateData (  ):
		SUPER (DATASET dsOrders:HANDLE).
		startDate = DATE(1,1,1950).
		endDate   = DATE(12,31,2100).
	END CONSTRUCTOR.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	CONSTRUCTOR PUBLIC OrdersByDateData (INPUT newStartDate AS DATETIME, INPUT newEndDate AS DATETIME):
		SUPER (DATASET dsOrders:HANDLE).
		startDate = newStartDate.
		endDate   = newEndDate.
	END CONSTRUCTOR.

	METHOD OVERRIDE PUBLIC VOID fetchData():
	    SUPER:fetchData( ).
        DEFINE VARIABLE totalOrdersByDate AS INTEGER NO-UNDO.

	    FOR EACH eOrder NO-LOCK BREAK BY eOrder.OrderDate:
	        totalOrdersByDate = totalOrdersByDate + 1.
            IF LAST-OF(eOrder.OrderDate) THEN
            DO:
                CREATE eOrderByData.
                ASSIGN eOrderByData.OrderDate = eOrder.OrderDate
                       eOrderByData.totalOrders = totalOrdersByDate
                       totalOrdersByDate = 0. 
            END.
        END.
    END METHOD.

    METHOD OVERRIDE PROTECTED IDataAccess createDataAccessObject():
        RETURN NEW DynamicDAO("eOrder","Order").
    END.

	METHOD PUBLIC DataTable DataTable(): 
        DEFINE VARIABLE listRecord AS System.Array NO-UNDO.
	    DEFINE VARIABLE dataTable  AS DataTable    NO-UNDO.
        DEFINE VARIABLE dataColumn AS DataColumn   NO-UNDO.

        dataTable  = new System.Data.DataTable('eOrdersByData').

	    listRecord = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Object"), 2).
        dataColumn = dataTable:Columns:Add("OrderDate",TypeHelper:GetType("System.DateTime")).	
		dataColumn:Caption = "Order Date". 
        dataColumn = dataTable:Columns:Add("totalOrders",TypeHelper:GetType("System.Int32")).	
		dataColumn:Caption = "Total Orders". 

     	FOR EACH eOrderByData NO-LOCK:	
		    listRecord:SetValue(eOrderByData.OrderDate, 0).
		    listRecord:SetValue(eOrderByData.TotalOrders, 1).                                                    

             dataTable:Rows:Add(listRecord).                           
         END.

         RETURN dataTable.
     end method.
END CLASS.