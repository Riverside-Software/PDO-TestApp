 /*------------------------------------------------------------------------
    File        : OverrideWrapper
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Mon Jul 07 11:37:25 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING System.Object.

USING Infragistics.Win.UltraWinTree.*.

CLASS WinTree.MiscellaneousFeatures.OverrideWrapper INHERITS Object   : 


    DEFINE PUBLIC PROPERTY OVERRIDE AS Infragistics.Win.UltraWinTree.Override NO-UNDO GET. PRIVATE SET.
    DEFINE PUBLIC PROPERTY DESCRIPTION AS CHARACTER NO-UNDO GET. PRIVATE  SET.

	CONSTRUCTOR PUBLIC OverrideWrapper(overrideVal AS Override, descriptionVal AS CHARACTER):
	    THIS-OBJECT:override = overrideVal.
		THIS-OBJECT:description = descriptionVal.
	END CONSTRUCTOR.

    METHOD PUBLIC OVERRIDE CHARACTER ToString():
	    RETURN THIS-OBJECT:DESCRIPTION.
    END.
END CLASS.