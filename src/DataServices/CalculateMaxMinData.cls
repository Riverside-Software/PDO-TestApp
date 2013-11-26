 
 /*------------------------------------------------------------------------
    File        : Calculate MaxMinData
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Sat Sep 06 17:26:56 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING DataServices.DataService.

CLASS DataServices.CalculateMaxMinData INHERITS DataService:
    DEFINE PRIVATE VARIABLE numRecords AS INTEGER NO-UNDO.
    DEFINE PRIVATE VARIABLE minValue  AS INTEGER NO-UNDO.
    DEFINE PRIVATE VARIABLE maxValue  AS INTEGER NO-UNDO.

    DEFINE TEMP-TABLE eMaxMin NO-UNDO
        FIELD Monday    AS INTEGER LABEL "Monday"
        FIELD Tuesday   AS INTEGER LABEL "Tuesday"
        FIELD Wednesday AS INTEGER LABEL "Wednesday"
        FIELD Thursday  AS INTEGER LABEL "Thursday"
        FIELD Friday    AS INTEGER LABEL "Friday".

    DEFINE DATASET dsMaxMin FOR eMaxMin.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	CONSTRUCTOR PUBLIC CalculateMaxMinData ():
		SUPER (DATASET dsMaxMin:HANDLE).
		ASSIGN numRecords = 100
		       minValue  = -50
		       maxValue  = 50.
	END CONSTRUCTOR.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	CONSTRUCTOR PUBLIC CalculateMaxMinData (INPUT newRecords   AS INTEGER,
	                                     INPUT newMinValue AS INTEGER,
	                                     INPUT newMaxValue AS INTEGER):
		SUPER (DATASET dsMaxMin:HANDLE).
		ASSIGN numRecords = newRecords
		       minValue  = newMinValue
		       maxValue  = newMaxValue.
	END CONSTRUCTOR.

	METHOD OVERRIDE PUBLIC VOID fetchData():
        IF NOT CAN-FIND(FIRST eMaxMin) THEN
            populateData().
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID populateData():
	    DEFINE VARIABLE currentRecord AS INTEGER NO-UNDO.

	    REPEAT currentRecord = 1 TO numRecords:
	        CREATE eMaxMin.
	        ASSIGN eMaxMin.Monday    = RANDOM(minValue,maxValue)
	               eMaxMin.Tuesday   = RANDOM(minValue,maxValue)
	               eMaxMin.Wednesday = RANDOM(minValue,maxValue)
	               eMaxMin.Thursday  = RANDOM(minValue,maxValue)
	               eMaxMin.Friday    = RANDOM(minValue,maxValue).
	    END. 
	END METHOD.
END CLASS.