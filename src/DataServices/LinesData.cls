 
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

CLASS DataServices.LinesData INHERITS DataService:

    DEFINE TEMP-TABLE eScatterData NO-UNDO
	FIELD X AS DECIMAL LABEL "X"
	field Y AS DECIMAL LABEL "Y"
	FIELD VerticalAxis AS CHARACTER LABEL "VerticalAxis".

    DEFINE TEMP-TABLE eLineData NO-UNDO
	FIELD cLABEL AS CHARACTER LABEL "Label"
    FIELD Y AS DECIMAL LABEL "Y"
	FIELD Y2 AS DECIMAL LABEL "Y2".

    DEFINE DATASET dsLinePoints FOR eScatterData, eLineData.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	CONSTRUCTOR PUBLIC LinesData():
		SUPER (DATASET dsLinePoints:HANDLE).

	END CONSTRUCTOR.

	METHOD OVERRIDE PUBLIC VOID fetchData():
        IF NOT CAN-FIND(FIRST eLineData) THEN
            populateData().
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID populateData():
	    DEFINE VARIABLE currentRecord AS INTEGER NO-UNDO.

	    REPEAT currentRecord = 1 TO 1000 BY 50:
            CREATE eScatterData.
            ASSIGN eScatterData.X = currentRecord
                   eScatterData.Y = System.Math:Sin(currentRecord)
                   eScatterData.VerticalAxis = "Y".
            CREATE eScatterData.
            ASSIGN eScatterData.X = currentRecord
                   eScatterData.Y = System.Math:Sin(currentRecord)
                   eScatterData.VerticalAxis = "Y2".

            CREATE eLineData.
            ASSIGN eLineData.cLabel = STRING(TODAY + currentRecord,"99/99/99").
                   eLineData.Y  = System.Math:Sin(currentRecord).
                   eLineData.Y2 = System.Math:Cos(currentRecord).
	    END. 
	END METHOD.
END CLASS.