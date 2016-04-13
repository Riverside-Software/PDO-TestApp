 
 /*------------------------------------------------------------------------
    File        : RandomPoints
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Sat Sep 06 17:26:56 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING DataServices.DataService.

CLASS DataServices.RandomPointsData INHERITS DataService:
    DEFINE PRIVATE VARIABLE numRecords AS INTEGER NO-UNDO.
    DEFINE PRIVATE VARIABLE xMinValue  AS INTEGER NO-UNDO.
    DEFINE PRIVATE VARIABLE xMaxValue  AS INTEGER NO-UNDO.
    DEFINE PRIVATE VARIABLE yMinValue  AS INTEGER NO-UNDO.
    DEFINE PRIVATE VARIABLE yMaxValue  AS INTEGER NO-UNDO.

    DEFINE TEMP-TABLE eChartPoints NO-UNDO
        FIELD columnName AS CHARACTER LABEL "Name"
        FIELD ColumnY    AS INTEGER   LABEL "ColumnY"
        FIELD ColumnX    AS INTEGER   LABEL "ColumnX"
        INDEX columnX    AS PRIMARY columnX.

    DEFINE DATASET dsChartPoints FOR eChartPoints.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	CONSTRUCTOR PUBLIC RandomPointsData ():
		SUPER (DATASET dsChartPoints:HANDLE).
		ASSIGN numRecords = 100
		       xMinValue  = -50
		       xMaxValue  = 50
		       yMinValue  = 0
		       yMaxValue  = 200.
	END CONSTRUCTOR.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	CONSTRUCTOR PUBLIC RandomPointsData (INPUT newRecords   AS INTEGER,
	                                     INPUT newXMinValue AS INTEGER,
	                                     INPUT newXMaxValue AS INTEGER,
	                                     INPUT newYMinValue AS INTEGER,
	                                     INPUT newYMaxValue AS INTEGER):
		SUPER (DATASET dsChartPoints:HANDLE).
		ASSIGN numRecords = newRecords
		       xMinValue  = newXMinValue
		       xMaxValue  = newXMaxValue
		       yMinValue  = newYMinValue
		       yMaxValue  = newYMaxValue.
	END CONSTRUCTOR.

	METHOD OVERRIDE PUBLIC VOID fetchData():
        IF NOT CAN-FIND(FIRST eChartPoints) THEN
            populateData().
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID populateData():
	    DEFINE VARIABLE currentRecord AS INTEGER NO-UNDO.

	    REPEAT currentRecord = 1 TO numRecords:
	        CREATE eChartPoints.
	        ASSIGN ColumnName = "Point# " + STRING(currentRecord)
	               ColumnX = RANDOM(yMinValue,yMaxValue)
	               ColumnY = RANDOM(xMinValue,xMaxValue).
	    END. 
	END METHOD.
END CLASS.