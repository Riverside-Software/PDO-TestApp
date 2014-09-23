  
 /*------------------------------------------------------------------------
    File        : EventWrapper
    Purpose     : 
    Syntax      : 
    Description : Class used to wrap an event Id.  Instances of the class
                  are added to the cancelable event list.
                  The class overrides to string to return a description of
                  the event to display in the listbox.
    Author(s)   : mferrant
    Created     : Wed Apr 30 15:27:48 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Infragistics.Win.UltraWinExplorerBar.*.

CLASS WinExplorerBar.BasicFeatures.EventWrapper INHERITS System.Object  : 
      DEFINE PUBLIC PROPERTY eventID AS UltraExplorerBarEventIds NO-UNDO
      GET.
      PRIVATE SET.
      DEFINE PUBLIC PROPERTY Name    AS CHARACTER NO-UNDO
      GET.
      PRIVATE SET.

   /*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	CONSTRUCTOR EventWrapper ():
		SUPER ().
        eventId = UltraExplorerBarEventIds:ActiveGroupChanged.		
	END CONSTRUCTOR.


	CONSTRUCTOR EventWrapper (INPUT eventId AS UltraExplorerBarEventIds):
		SUPER ().
        THIS-OBJECT:eventID = eventId.
        THIS-OBJECT:NAME    = eventId:ToString().
	END CONSTRUCTOR.
	

	METHOD OVERRIDE  PUBLIC CHARACTER ToString(  ):
		RETURN THIS-OBJECT:Name.
	END METHOD.


END CLASS.