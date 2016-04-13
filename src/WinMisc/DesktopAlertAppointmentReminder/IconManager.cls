 
 /*------------------------------------------------------------------------
    File        : IconManager
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Tue Jul 15 10:32:29 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

USING System.Drawing.*.

USING WinMisc.DesktopAlertAppointmentReminder.IconManager.
USING WinMisc.DesktopAlertAppointmentReminder.IconName.

CLASS WinMisc.DesktopAlertAppointmentReminder.IconManager: 

	DEFINE PRIVATE STATIC VARIABLE iconFolderName AS CHARACTER NO-UNDO INITIAL "WinMisc/DesktopAlertAppointmentReminder/Icons".

	DEFINE PRIVATE VARIABLE owningForm      AS Progress.Windows.Form        NO-UNDO.
	DEFINE PRIVATE VARIABLE bitmaps         AS System.Drawing.Bitmap EXTENT NO-UNDO.
    DEFINE PRIVATE STATIC VARIABLE instance AS IconManager                  NO-UNDO.

	/*Creates a new instance of the <see cref="IconManager"/> class.*/
	CONSTRUCTOR PRIVATE IconManager(newForm AS Progress.Windows.Form):
	    owningForm = newForm.
	END CONSTRUCTOR.

    METHOD PUBLIC STATIC IconManager GetInstance(newForm AS Progress.Windows.Form):
        IF IconManager:instance = ? THEN
            IconManager:instance = new IconManager(newForm).

        RETURN IconManager:instance.
    END METHOD.

	/*Returns the Icon corresponding to the specified IconGroup at the specified IconSize.
	  Note that the caller is responsible for maintaining the lifetime of the returned
	  icon, i.e., must dispose of it when it is no longer needed.*/
	METHOD PUBLIC Icon GetIcon(bitmapName AS CHARACTER):
	    DEFINE VARIABLE newIcon AS System.Drawing.Icon NO-UNDO.
        DEFINE VARIABLE fileSuffix AS CHARACTER NO-UNDO.
        DEFINE VARIABLE fName  AS CHARACTER NO-UNDO.

	    fileSuffix = ".ICO".
		fName = SEARCH(IconManager:iconFolderName + "/" + STRING(bitmapName) + fileSuffix).

        newIcon = new Icon(fName).

		RETURN  newIcon.
	END METHOD.

	/*Returns the Bitmap corresponding to the specified icon name.*/
	METHOD PUBLIC Bitmap GetBitmap(bitmapName AS CHARACTER):
        DEFINE VARIABLE iconIndex AS INTEGER             NO-UNDO.
        DEFINE VARIABLE newIcon   AS System.Drawing.Icon NO-UNDO.

        IF EXTENT(bitmaps) = ? THEN
            EXTENT(bitmaps) = IconName:numIcons.

        iconIndex = iconName:GetIconIndex(bitmapName).

		IF bitmaps[iconIndex] = ? THEN
        DO:
		    newIcon = GetIcon(bitmapName).
			IF newIcon NE ? THEN
            DO:
				bitmaps[iconIndex] = newIcon:ToBitmap().
				newIcon:Dispose().
			END.
		END.

		RETURN bitmaps[iconIndex].
    END METHOD.

	/*Implements the IDisposable interface's Dispose method.
	  Disposes of all Bitmaps created by this instance and closes any streams that remain open.*/
	METHOD PRIVATE VOID DisposeIcons():
	    DEFINE VARIABLE i AS INTEGER NO-UNDO.
	    DEFINE VARIABLE icons AS INTEGER NO-UNDO.

	    icons = IconName:numIcons.
	    REPEAT i = 1 TO icons:
		    IF bitmaps[i] NE ? THEN
            DO:
				bitmaps[i]:Dispose().
				bitmaps[i] = ?.
			END.
		END.
	 END.
	 
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	DESTRUCTOR PUBLIC IconManager ( ):
        DisposeIcons().
	END DESTRUCTOR.

     
END CLASS.