  
 /*------------------------------------------------------------------------
    File        : IconName
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Tue Jul 15 10:25:55 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

USING WinMisc.DesktopAlertAppointmentReminder.IconName.

CLASS WinMisc.DesktopAlertAppointmentReminder.IconName   : 
    DEFINE PUBLIC STATIC PROPERTY Calendar_32 AS CHARACTER NO-UNDO INITIAL "Calendar_32" GET.
	DEFINE PUBLIC STATIC PROPERTY Delete_16   AS CHARACTER NO-UNDO INITIAL "Delete_16"   GET.
    DEFINE PUBLIC STATIC PROPERTY Find_16     AS CHARACTER NO-UNDO INITIAL "Find_16"     GET.
    DEFINE PUBLIC STATIC PROPERTY Lock_16     AS CHARACTER NO-UNDO INITIAL "Lock_16"     GET.
    DEFINE PUBLIC STATIC PROPERTY Mail_16     AS CHARACTER NO-UNDO INITIAL "Mail_16"     GET.
    DEFINE PUBLIC STATIC PROPERTY Note_16     AS CHARACTER NO-UNDO INITIAL "Note_16"     GET.
    DEFINE PUBLIC STATIC PROPERTY Reminder_32 AS CHARACTER NO-UNDO INITIAL "Reminder_32" GET.
    DEFINE PUBLIC STATIC PROPERTY Tasks_16    AS CHARACTER NO-UNDO INITIAL "Tasks_16"    GET.
    DEFINE PUBLIC STATIC PROPERTY Dismiss_16  AS CHARACTER NO-UNDO INITIAL "Dismiss_16"  GET.

    DEFINE PUBLIC STATIC PROPERTY numIcons AS INTEGER NO-UNDO INITIAL 9 GET.
    
    METHOD PUBLIC STATIC INTEGER GetIconIndex(INPUT iconName AS CHARACTER):
        CASE iconName:
            WHEN "Calendar_32" THEN RETURN 1.
            WHEN "Delete_16"   THEN RETURN 2.
            WHEN "Find_16"     THEN RETURN 3.
            WHEN "Lock_16"     THEN RETURN 4.
            WHEN "Mail_16"     THEN RETURN 5.
            WHEN "Note_16"     THEN RETURN 6.
            WHEN "Reminder_32" THEN RETURN 7.
            WHEN "Tasks_16"    THEN RETURN 8.
            WHEN "Dismiss_16"  THEN RETURN 9.
        END CASE.
    END METHOD.
END CLASS.