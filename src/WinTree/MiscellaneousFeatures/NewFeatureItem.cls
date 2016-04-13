 
 /*------------------------------------------------------------------------
    File        : NewFeatureItem
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Wed Jul 02 17:27:13 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING System.Object.

USING WinTree.MiscellaneousFeatures.*.

CLASS WinTree.MiscellaneousFeatures.NewFeatureItem INHERITS Object   : 

    DEFINE PRIVATE STATIC PROPERTY FEATURE_DESCRIPTION_CUT_COPY_PASTE         AS CHARACTER NO-UNDO INITIAL "Cut/Copy/Paste support" GET.
	DEFINE PRIVATE STATIC PROPERTY FEATURE_DESCRIPTION_EMBEDDABLE_EDITORS     AS CHARACTER NO-UNDO INITIAL "Embeddable Editors"     GET. 
	DEFINE PRIVATE STATIC PROPERTY FEATURE_DESCRIPTION_INTER_NODE_SPACING     AS CHARACTER NO-UNDO INITIAL "Inter-node spacing"     GET.
	DEFINE PRIVATE STATIC PROPERTY FEATURE_DESCRIPTION_MULTI_LINE_NODES       AS CHARACTER NO-UNDO INITIAL "Multiline nodes"        GET.
	DEFINE PRIVATE STATIC PROPERTY FEATURE_DESCRIPTION_MAX_LABEL_SIZING       AS CHARACTER NO-UNDO INITIAL "Maximum label sizing"   GET.
	DEFINE PRIVATE STATIC PROPERTY FEATURE_DESCRIPTION_SAVING_LOADING_LAYOUTS AS CHARACTER NO-UNDO INITIAL "Saving/Loading layouts" GET.
	DEFINE PRIVATE STATIC PROPERTY FEATURE_DESCRIPTION_NONE                   AS CHARACTER NO-UNDO INITIAL "No Feature Selected"    GET.
 
    DEFINE PUBLIC PROPERTY FeatureType AS INTEGER NO-UNDO GET. SET.

    DEFINE PUBLIC PROPERTY DESCRIPTION AS CHARACTER NO-UNDO
	GET:
        CASE FeatureType:
            WHEN NewFeatureType:CutCopyPaste THEN
			    RETURN NewFeatureItem:FEATURE_DESCRIPTION_CUT_COPY_PASTE.

			WHEN NewFeatureType:EmbeddableEditors THEN
				RETURN NewFeatureItem:FEATURE_DESCRIPTION_EMBEDDABLE_EDITORS.

			WHEN NewFeatureType:InterNodeSpacing THEN
				RETURN NewFeatureItem:FEATURE_DESCRIPTION_INTER_NODE_SPACING.

			WHEN NewFeatureType:MultilineNodes THEN
				RETURN NewFeatureItem:FEATURE_DESCRIPTION_MULTI_LINE_NODES.

			WHEN NewFeatureType:MaxLabelSizing THEN
				RETURN NewFeatureItem:FEATURE_DESCRIPTION_MAX_LABEL_SIZING.

			WHEN NewFeatureType:SavingLoadingLayouts THEN
				RETURN NewFeatureItem:FEATURE_DESCRIPTION_SAVING_LOADING_LAYOUTS.

			WHEN NewFeatureType:None THEN
				RETURN NewFeatureItem:FEATURE_DESCRIPTION_NONE.
			
			OTHERWISE RETURN "".
		END CASE.
	END GET.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
		
	CONSTRUCTOR PUBLIC NewFeatureItem (INPUT featureType AS INTEGER):
		SUPER ().
		THIS-OBJECT:FeatureType = featureType.
	END CONSTRUCTOR.

	METHOD PUBLIC OVERRIDE CHARACTER ToString():
	    RETURN THIS-OBJECT:DESCRIPTION.
	END METHOD.

END CLASS.