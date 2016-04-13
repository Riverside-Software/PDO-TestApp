 
 /*------------------------------------------------------------------------
    File        : SaveLoadLayoutType
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Wed Jul 02 17:51:45 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.



CLASS WinTree.MiscellaneousFeatures.SaveLoadLayoutType   : 
    DEFINE PUBLIC STATIC PROPERTY Binary AS INTEGER INITIAL 0x0001 NO-UNDO GET.
	DEFINE PUBLIC STATIC PROPERTY Xml    AS INTEGER INITIAL 0x0002 NO-UNDO GET.
	DEFINE PUBLIC STATIC PROPERTY Save   AS INTEGER INITIAL 0x0004 NO-UNDO GET.
	DEFINE PUBLIC STATIC PROPERTY Load   AS INTEGER INITIAL 0x0008 NO-UNDO GET.
END CLASS.