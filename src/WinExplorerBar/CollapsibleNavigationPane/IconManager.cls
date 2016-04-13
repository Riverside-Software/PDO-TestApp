 /*------------------------------------------------------------------------
    File        : IconManager
    Purpose     : Class which serves bitmaps created from icons embedded as
	              resources. The implementation was designed to be somewhat
	              portable; however, it is coupled with the naming convention
	              of the icon files it uses. The filenames are implied to contain a 
	              number which identifies its dimensions; it is also implied
	              that the dimensions of the icons are perfect squares, i.e., the width
	              and height are the same.
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Thu May 01 19:16:18 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING System.Type.*.

USING System.Drawing.*.
USING System.IO.*.

USING Progress.Windows.Form.

USING Infragistics.Win.DrawUtility.
USING System.Reflection.Assembly.*.

CLASS WinExplorerBar.CollapsibleNavigationPane.IconManager /*IMPLEMENTS IDisposable*/ :
    /*Constant values for the size of the icons*/ 
    DEFINE PUBLIC PROPERTY SMALL_IMAGE_SIZE  AS INTEGER INITIAL 16 GET. PRIVATE SET.
    DEFINE PUBLIC PROPERTY MEDIUM_IMAGE_SIZE AS INTEGER INITIAL 32 GET. PRIVATE SET.
    DEFINE PUBLIC PROPERTY LARGE_IMAGE_SIZE  AS INTEGER INITIAL 48 GET. PRIVATE SET.

    /*Constant values for the toolbar groups*/
    DEFINE PUBLIC PROPERTY GROUP_CALENDAR      AS INTEGER INITIAL 1 GET. PRIVATE SET.
    DEFINE PUBLIC PROPERTY GROUP_CUSTOMERS     AS INTEGER INITIAL 2 GET. PRIVATE SET.
    DEFINE PUBLIC PROPERTY GROUP_ORDERS        AS INTEGER INITIAL 3 GET. PRIVATE SET.
    DEFINE PUBLIC PROPERTY GROUP_ORDER_DETAILS AS INTEGER INITIAL 4 GET. PRIVATE SET.
    DEFINE PUBLIC PROPERTY GROUP_PRODUCTS      AS INTEGER INITIAL 5 GET. PRIVATE SET.
    DEFINE PUBLIC PROPERTY GROUP_EXIT          AS INTEGER INITIAL 6 GET. PRIVATE SET.
    DEFINE PUBLIC PROPERTY GROUP_VIEW_STYLE    AS INTEGER INITIAL 7 GET. PRIVATE SET.
    DEFINE PUBLIC PROPERTY ICON_GROUP_COUNT AS INTEGER   NO-UNDO INITIAL 8 GET. PRIVATE SET.
	DEFINE PUBLIC PROPERTY ICON_SIZE_COUNT  AS INTEGER   NO-UNDO INITIAL 3 GET. PRIVATE SET.
	DEFINE PUBLIC PROPERTY ICON_FOLDER_NAME AS CHARACTER NO-UNDO INITIAL "WinExplorerBar/CollapsibleNavigationPane/Icons":U GET. PRIVATE SET.

    DEFINE PRIVATE VARIABLE owningForm AS FORM         NO-UNDO.
    DEFINE PRIVATE VARIABLE bitmaps    AS System.Array NO-UNDO.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	CONSTRUCTOR PUBLIC IconManager (INPUT newForm AS FORM):
		SUPER ().
		ASSIGN bitmaps    = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Drawing.Bitmap"), ICON_GROUP_COUNT, ICON_SIZE_COUNT)
		       owningForm = newForm.
	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC IconManager ( ):
        DisposeBitMaps().
	END DESTRUCTOR.

	
	METHOD PRIVATE void DisposeBitmaps(  ):
		DEFINE VARIABLE currentGroup AS INTEGER NO-UNDO.
		DEFINE VARIABLE currentSize  AS INTEGER NO-UNDO.
		DEFINE VARIABLE bitmp        AS Bitmap  NO-UNDO.

		DO currentGroup = 0 TO ICON_GROUP_COUNT - 1:
            DO currentSize = 0 TO ICON_SIZE_COUNT - 1:
                ASSIGN bitmp = CAST(bitmaps:GetValue(currentGroup,currentSize), Bitmap). 		
			    IF bitmp NE ? THEN
                DO:
				    bitmp:Dispose().
					bitmp = ?.
				END.
		    END.
	    END.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Returns the Bitmap corresponding to the specified IconGroup
		             at the specified IconSize. If no icon exists in the associated
		             form's resources, null is returned.
			Notes:
	------------------------------------------------------------------------------*/
        METHOD PUBLIC Bitmap GetBitmap(INPUT iconGroup AS INTEGER, INPUT iconSize AS INTEGER):
            DEFINE VARIABLE iconPosition AS INTEGER NO-UNDO.
            DEFINE VARIABLE newIcon AS System.Drawing.Icon NO-UNDO.
            DEFINE VARIABLE imageFile AS CHARACTER NO-UNDO.

            CASE iconSize:
			    WHEN SMALL_IMAGE_SIZE  THEN ASSIGN iconPosition = 0.
			    WHEN MEDIUM_IMAGE_SIZE THEN ASSIGN iconPosition = 1.
			    WHEN LARGE_IMAGE_SIZE  THEN ASSIGN iconPosition = 2.
			END.

            ASSIGN imageFile = replace(ICON_FOLDER_NAME + "/" + GetGroupName(iconGroup) + STRING(iconSize) + ".ICO", '/', '~\')
                   imageFile = search(imageFile)
                   imageFile = replace(imageFile, '~\', '~\~\').
            
			IF bitmaps:getValue(iconGroup,iconPosition) = ? THEN
    			bitmaps:SetValue(new System.Drawing.Bitmap(imageFile), iconGroup, iconPosition).

            RETURN CAST(bitmaps:GetValue(iconGroup, iconPosition), Bitmap).
        END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	METHOD PUBLIC CHARACTER GetGroupName(INPUT groupID AS INTEGER):
		CASE groupID:
		    WHEN 1 THEN RETURN "Calendar":U.
		    WHEN 2 THEN RETURN "Customers":U.
		    WHEN 3 THEN RETURN "Orders":U.
		    WHEN 4 THEN RETURN "OrderDetails":U.
		    WHEN 5 THEN RETURN "Products":U.
		    WHEN 6 THEN RETURN "Exit":U.
		    WHEN 7 THEN RETURN "ViewStyle":U.
		END CASE.

		RETURN "".
	END METHOD.
    
END CLASS.