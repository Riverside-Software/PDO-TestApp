 
 /*------------------------------------------------------------------------
    File        : NewFeatureType
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Wed Jul 02 17:50:47 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.



CLASS WinTree.MiscellaneousFeatures.NewFeatureType   : 

    DEFINE PUBLIC STATIC PROPERTY None                 AS INTEGER NO-UNDO INITIAL -1 GET.
	DEFINE PUBLIC STATIC PROPERTY CutCopyPaste         AS INTEGER NO-UNDO INITIAL 0  GET.
	DEFINE PUBLIC STATIC PROPERTY EmbeddableEditors    AS INTEGER NO-UNDO INITIAL 1  GET.
    DEFINE PUBLIC STATIC PROPERTY InterNodeSpacing     AS INTEGER NO-UNDO INITIAL 2  GET.
	DEFINE PUBLIC STATIC PROPERTY MultilineNodes       AS INTEGER NO-UNDO INITIAL 3  GET.
	DEFINE PUBLIC STATIC PROPERTY MaxLabelSizing       AS INTEGER NO-UNDO INITIAL 4  GET.
	DEFINE PUBLIC STATIC PROPERTY SavingLoadingLayouts AS INTEGER NO-UNDO INITIAL 5  GET.

END CLASS.