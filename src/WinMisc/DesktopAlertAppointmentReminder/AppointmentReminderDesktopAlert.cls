 /*------------------------------------------------------------------------
    File        : AppointmentReminderDesktopAlert
    Purpose     : 
    Syntax      : 
    Description : Wraps the Infragistics.Win.Misc.UltraDesktopAlertShowWindowInfo class
                  for the purpose of displaying a desktop alert window instead of the standard
                  AppointmentReminder dialog.
    Author(s)   : mferrant
    Created     : Mon Jul 14 17:35:40 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING System.IDisposable.

USING System.Drawing.*.
USING System.Windows.Forms.*.
USING System.Text.*.
USING Infragistics.Win.*.
USING Infragistics.Win.Misc.*.
USING Infragistics.Shared.*.
USING Infragistics.Shared.ResourceCustomizer.*.
USING Infragistics.Win.UltraWinSchedule.*.
USING Infragistics.Win.UltraWinToolbars.*.

USING WinMisc.DesktopAlertAppointmentReminder.frmMain.
USING WinMisc.DesktopAlertAppointmentReminder.IconName.
USING WinMisc.DesktopAlertAppointmentReminder.AppointmentReminderDesktopAlert.

CLASS WinMisc.DesktopAlertAppointmentReminder.AppointmentReminderDesktopAlert: 
 
    DEFINE PRIVATE STATIC PROPERTY snoozeInterval            AS INTEGER   NO-UNDO INITIAL 1 GET.

    DEFINE PRIVATE VARIABLE inputForm          AS frmMain                                 NO-UNDO.
    DEFINE PRIVATE VARIABLE desktopAlert       AS UltraDesktopAlert                       NO-UNDO.
    DEFINE PRIVATE VARIABLE scheduleOwner      AS Infragistics.Win.UltraWinSchedule.Owner NO-UNDO.
    DEFINE PRIVATE VARIABLE calendarLook       AS UltraCalendarLook                       NO-UNDO.
    DEFINE PRIVATE VARIABLE localIconManager   AS WinMisc.DesktopAlertAppointmentReminder.IconManager                             NO-UNDO.
    DEFINE PRIVATE VARIABLE lastLocation       AS Point                                   NO-UNDO.
    DEFINE PRIVATE VARIABLE snoozeCount        AS INTEGER                                 NO-UNDO.
    DEFINE PRIVATE VARIABLE localPopupMenuTool AS PopupMenuTool                           NO-UNDO.

    /*Creates a new instance of the <see cref="AppointmentReminderDesktopAlert"/> class.*/
    CONSTRUCTOR PUBLIC AppointmentReminderDesktopAlert(
                          scheduleOwner AS Owner, calendarLook AS UltraCalendarLook,
                          newForm AS frmMain, newPopupMenuTool AS PopupMenuTool):

        DEFINE VARIABLE calendarInfo AS UltraCalendarInfo NO-UNDO.

        ASSIGN lastLocation = new Point(-1, -1).

        IF scheduleOwner = ? THEN
            UNDO, THROW new Progress.Lang.AppError( "scheduleOwner cannot be null").

        calendarInfo = scheduleOwner:CalendarInfo.
        IF calendarInfo = ? THEN
            UNDO, THROW new Progress.Lang.AppError( "CalendarInfo cannot be null").

        IF calendarLook = ? THEN
            UNDO, THROW new Progress.Lang.AppError( "CalendarLook cannot be null").

        /*Cache the owner*/
        THIS-OBJECT:scheduleOwner = scheduleOwner.

        /*Cache the CalendarLook*/
        THIS-OBJECT:calendarLook = calendarLook.

        /*Cache the Form*/
        THIS-OBJECT:inputForm = newForm.

        /*Cache the PopupMenuTool*/
        THIS-OBJECT:localPopupMenuTool = newPopupMenuTool.

        /*Create the UltraDesktopAlert component we will use to display the reminder alerts.*/
        THIS-OBJECT:desktopAlert = new UltraDesktopAlert(inputForm:thisComponents).

        /*Get an instance reference to the IconManager class we use to
          serve the images used by the desktop alert window.*/
        localIconManager = WinMisc.DesktopAlertAppointmentReminder.IconManager:GetInstance(inputForm).

        /*Initialize the appearance of the desktop alert windows that will be displayed for this owner.*/
        InitializeDesktopAlert().

        /*Hook events*/
        HookEvents(TRUE).
    END CONSTRUCTOR.
    
    METHOD PRIVATE VOID HookEvents(hook AS LOGICAL):
        DEFINE VARIABLE calendarInfo AS UltraCalendarInfo NO-UNDO.

        calendarInfo = scheduleOwner:CalendarInfo.

        IF hook THEN
        DO:
            /*Hook the CalendarInfo's 'BeforeDisplayReminderDialog' event,
              so we can display a desktop alert instead of the reminder dialog.*/
            IF calendarInfo NE ? THEN
                calendarInfo:BeforeDisplayReminderDialog:SUBSCRIBE(THIS-OBJECT:OnReminderDue).

            desktopAlert:DesktopAlertLinkClicked:SUBSCRIBE(THIS-OBJECT:OnLinkClicked).
            desktopAlert:DesktopAlertClosing:SUBSCRIBE(THIS-OBJECT:OnDesktopAlertClosing).
            desktopAlert:AlertButtonClicked:SUBSCRIBE(THIS-OBJECT:OnAlertButtonClicked).

            IF localPopupMenuTool NE ? THEN
            DO:
               localPopupMenuTool:ToolbarsManager:ToolClick:SUBSCRIBE(THIS-OBJECT:OnToolClick).
               desktopAlert:DropDownButtonClicked:SUBSCRIBE(THIS-OBJECT:OnDropDownButtonClicked).
            END.
        END.
        ELSE DO:
            IF calendarInfo NE ? THEN
            calendarInfo:BeforeDisplayReminderDialog:UNSUBSCRIBE(THIS-OBJECT:OnReminderDue).

            desktopAlert:DesktopAlertLinkClicked:UNSUBSCRIBE(THIS-OBJECT:OnLinkClicked).
            desktopAlert:DesktopAlertClosing:UNSUBSCRIBE(THIS-OBJECT:OnDesktopAlertClosing).
            desktopAlert:AlertButtonClicked:UNSUBSCRIBE(THIS-OBJECT:OnAlertButtonClicked).

            IF localPopupMenuTool NE ? THEN
            DO:
                localPopupMenuTool:ToolbarsManager:ToolClick:UNSUBSCRIBE(THIS-OBJECT:OnToolClick).
                desktopAlert:DropDownButtonClicked:UNSUBSCRIBE(THIS-OBJECT:OnDropDownButtonClicked).
            END.
        END.
    END METHOD.

    /*Sets properties on the UltraDesktopAlert component.*/
    METHOD PRIVATE VOID InitializeDesktopAlert():
        DEFINE VARIABLE colorScheme AS Outlook2007ColorScheme                NO-UNDO.
        DEFINE VARIABLE usingDefaultScheme    AS LOGICAL                     NO-UNDO.
        DEFINE VARIABLE windowAppearance      AS Infragistics.Win.Appearance NO-UNDO.
        DEFINE VARIABLE gripAreaAppearance    AS Infragistics.Win.Appearance NO-UNDO.
        DEFINE VARIABLE mainImage             AS Bitmap                      NO-UNDO.
        DEFINE VARIABLE deleteButton          AS UltraDesktopAlertButton     NO-UNDO.
        DEFINE VARIABLE dismissButton         AS UltraDesktopAlertButton     NO-UNDO.
        DEFINE VARIABLE findButton            AS UltraDesktopAlertButton     NO-UNDO.
        DEFINE VARIABLE mailButton            AS UltraDesktopAlertButton     NO-UNDO.
        DEFINE VARIABLE tasksButton           AS UltraDesktopAlertButton     NO-UNDO.
        DEFINE VARIABLE noteButton            AS UltraDesktopAlertButton     NO-UNDO.
        DEFINE VARIABLE lockedButton          AS UltraDesktopAlertButton     NO-UNDO.
        DEFINE VARIABLE snoozeButton          AS UltraDesktopAlertButton     NO-UNDO.
        DEFINE VARIABLE dropdownButtonVisible AS DefaultableBoolean          NO-UNDO.

        /*Get the resolved color scheme for the owner, so we can make the look
          of the desktop alert window consistent with that of the owner.*/
        colorScheme = scheduleOwner:GetResolvedOutlook2007ColorScheme(calendarLook).

        /*Determine whether this owner is using the default color scheme; if so,
          we will leave certain desktop alert window colors at their defaults.*/
        usingDefaultScheme = IF colorScheme:BaseColor = calendarLook:Outlook2007ColorSchemes:DefaultScheme:BaseColor THEN TRUE ELSE FALSE.

        IF usingDefaultScheme = FALSE THEN
        DO:
            /*Set the UltraDesktopAlert's Appearance properties to customize
              the colors it uses so that the alert window looks consistent with
              the way the owner looks in the WinSchedule controls.*/
            windowAppearance = new Infragistics.Win.Appearance().
            windowAppearance:BackColor = colorScheme:AppointmentBackColor.
            windowAppearance:BackColor2 = colorScheme:AppointmentBackColor2.
            windowAppearance:BorderColor = colorScheme:SelectedTimeSlotBackColor.
            desktopAlert:Appearance = windowAppearance.

            /*Set the UltraDesktopAlert's GripAreaAppearance properties to customize
              the colors it uses so that it looks consistent with the alert window.*/
            gripAreaAppearance = new Infragistics.Win.Appearance().
            gripAreaAppearance:BackColor = colorScheme:AppointmentBackColor.
            gripAreaAppearance:BackColor2 = colorScheme:AppointmentBackColor2.
            gripAreaAppearance:ForeColor = colorScheme:SelectedTimeSlotBackColor.
            desktopAlert:GripAreaAppearance = gripAreaAppearance.
        END.

        /*Force the caption's foreground color to black for all states*/
            desktopAlert:CaptionAppearance:ForeColor = SystemColors:ControlText.
            desktopAlert:CaptionHotTrackAppearance:ForeColor = SystemColors:ControlText.

        /*Set the image displayed by the desktop alert window by assigning
          it to the Appearance; also, set the ImageSize property to the natural
          size of the image, so we don't get scaling or anti-aliasing.*/
        mainImage = localIconManager:GetBitmap(IconName:Calendar_32).
        desktopAlert:Appearance:Image = mainImage.
        desktopAlert:ImageSize = mainImage:SIZE.

        /*Use the 'Fade' setting for the AnimationStyleShow and AnimationStyleAutoClose
          properties to emulate the animation effect seen in MS Outlook's New Mail Desktop Alert.*/
        desktopAlert:AnimationStyleShow = AnimationStyle:Fade.
        desktopAlert:AnimationStyleAutoClose = AnimationStyle:Fade.

        /*Set ButtonImageSize to 16 x 16*/
        desktopAlert:ButtonImageSize = new Size(16, 16).

        /*Add the alert buttons...*/
        deleteButton = desktopAlert:AlertButtons:Add("delete").
        deleteButton:ToolTipText = "Delete this Appointment".
        deleteButton:Appearance:Image = localIconManager:GetBitmap(IconName:Delete_16).

        snoozeButton = desktopAlert:AlertButtons:Add("snooze").
        snoozeButton:ToolTipText = "Snooze this Appointment for " + STRING(AppointmentReminderDesktopAlert:snoozeInterval) + " minute(s)".
        snoozeButton:Appearance:Image = localIconManager:GetBitmap(IconName:Reminder_32).

        dismissButton = desktopAlert:AlertButtons:Add("dismiss").
        dismissButton:ToolTipText = "Dismiss this Appointment".
        dismissButton:Appearance:Image = localIconManager:GetBitmap(IconName:Dismiss_16).

        lockedButton = desktopAlert:AlertButtons:Add("locked").
        lockedButton:ToolTipText = "Disable this Appointment in the user interface".
        lockedButton:Appearance:Image = localIconManager:GetBitmap(IconName:Lock_16).

        noteButton = desktopAlert:AlertButtons:Add("note").
        noteButton:ToolTipText = "Add a note for the same date as this Appointment".
        noteButton:Appearance:Image = localIconManager:GetBitmap(IconName:Note_16).

        tasksButton = desktopAlert:AlertButtons:Add("tasks").
        tasksButton:ToolTipText = "Show tasks".
        tasksButton:Appearance:Image = localIconManager:GetBitmap(IconName:Tasks_16).

        mailButton = desktopAlert:AlertButtons:Add("mail").
        mailButton:ToolTipText = "Send mail".
        mailButton:Appearance:Image = localIconManager:GetBitmap(IconName:Mail_16).

        findButton = desktopAlert:AlertButtons:Add("find").
        findButton:ToolTipText = "Search contacts".
        findButton:Appearance:Image = localIconManager:GetBitmap(IconName:Find_16).

        /*If a PopupMenuTool was specified in the constructor, show the dropdown button, which when
          clicked will display that PopupMenuTool. See the 'OnDropDownButtonClicked' method
          implementation for details on how to show a PopupMenuTool when the dropdown button is clicked.*/
        dropdownButtonVisible = IF localPopupMenuTool NE ? THEN DefaultableBoolean:True ELSE DefaultableBoolean:FALSE.
        desktopAlert:DropDownButtonVisible = dropdownButtonVisible.

        /*There are no properties for the tooltip text displayed by the links, but we can change it easily
          using the resource customizer since they are localized strings, so set the tooltip text to
          something a little more specific to this application.*/
       DEFINE VARIABLE resCustomizer AS Infragistics.Shared.ResourceCustomizer NO-UNDO.
       resCustomizer = NEW Infragistics.Shared.ResourceCustomizer().

       resCustomizer:SetCustomizedString("DesktopAlertLinkUIElement_Caption_ToolTipText", "Open this Appointment").
       resCustomizer:SetCustomizedString("DesktopAlertLinkUIElement_Text_ToolTipText", "Open this Appointment").
    END METHOD. /*METHOD PRIVATE VOID InitializeDesktopAlert():*/

    /*Handles the UltraCalendarInfo's 'BeforeDisplayReminderDialog' event.*/
    METHOD PRIVATE VOID OnReminderDue(sender AS System.Object, e AS CancelableAppointmentEventArgs):
        DEFINE VARIABLE appointment          AS Appointment                          NO-UNDO.
        DEFINE VARIABLE appointmentOwner     AS Infragistics.Win.UltraWinSchedule.Owner NO-UNDO.
        DEFINE VARIABLE colorScheme          AS Outlook2007ColorScheme               NO-UNDO.
        DEFINE VARIABLE subjectForeColor     AS System.Drawing.Color                 NO-UNDO.
        DEFINE VARIABLE descriptionForeColor AS System.Drawing.Color                 NO-UNDO.
        DEFINE VARIABLE showWindowInfo       AS UltraDesktopAlertShowWindowInfo      NO-UNDO.
        DEFINE VARIABLE alertButtons         AS DesktopAlertButtonsCollection        NO-UNDO.
        DEFINE VARIABLE visibleButtons       AS DesktopAlertVisibleButtonsCollection NO-UNDO.
        
        /*Get a reference to the Appointment whose reminder came due, and its
          Owner; if the APpointment does not belong to this owner, return.*/
        appointment = e:Appointment.
        appointmentOwner = appointment:OWNER.

        IF appointmentOwner NE scheduleOwner THEN RETURN.

        /*Cancel the event, so that the standard reminder dialog is not displayed.*/
        e:Cancel = TRUE.

        /*Get the resolved color scheme for the owner, so we can make the look
          of the desktop alert window consistent with that of the owner.*/
        colorScheme = scheduleOwner:GetResolvedOutlook2007ColorScheme(calendarLook).

        /*Define the colors that we will use for the Subject and Description*/
        subjectForeColor = colorScheme:SelectedTimeSlotBackColor.
        descriptionForeColor = colorScheme:OwnerForeColor.

        /*Create an instance of the UltraDesktopAlertShowWindowInfo class, which is used
          to specify various attributes of the desktop alert window*/
        showWindowInfo = new UltraDesktopAlertShowWindowInfo().

        /*Set the Caption property of the UltraDesktopAlertShowWindowInfo instance
          to the full name of the owner. Note that since UltraDesktopAlert uses a
          FormattedTextUIElement to render the text it displays, we can use any of
          the formatting characters recognized by the formatted link editor. We can
          take advantage of this by specifying the bold font style here, and the caption
          will appeara as bold without necessitating the creation of an Appearance object.*/
        showWindowInfo:Caption = AppointmentReminderDesktopAlert:FormatLink(scheduleOwner:Name, TRUE).
        
        /*Set the Text property of the UltraDesktopAlertShowWindowInfo instance
          to the Subject and (optionally Description) of the Appointment. Note that
          we can take advantage of the formatted link editor's capabilities again,
          this time having different colors for the Subject and Description.*/
        showWindowInfo:Text = AppointmentReminderDesktopAlert:FormatLink(appointment:Subject, appointment:Description, subjectForeColor, descriptionForeColor).

        /*Set the key of the desktop alert window to that of the associated Owner.
          If we need a reference to the window later, this will make it easier to get.*/
        showWindowInfo:Key = scheduleOwner:Key.

        /*Set the Data property of the UltraDesktopAlertShowWindowInfo instance to reference the Appointment,
          so that we have the proper context when we handle desktop alert events.*/
        showWindowInfo:Data = appointment.

        /*If a desktop alert window has been shown once before,
          we will have cached its location at the time it was closed.
          Use that location as the initial location for the window we
          are about to show. Note that we have to set the ScreenPosition
          property to 'Manual' in order to display the window an an explicit
          screen location.*/
        IF lastLocation:X >= 0 AND lastLocation:Y >= 0 THEN
        DO:
            showWindowInfo:ScreenPosition = ScreenPosition:Manual.
            showWindowInfo:ScreenLocation = lastLocation.
        END.

        /*Set the Sound property to a stream which contains a .WAV file,
          so that a sound is played as the desktop alert window appears.*/
        showWindowInfo:Sound = SEARCH("WinMisc/DesktopAlertAppointmentReminder/Sounds/NOTIFY.WAV") /*Infragistics.Win.SoundEvents:Exclamation */ .

        /*Note that we can change which buttons appear for a particular
          instance of the desktop alert window by manipulating the
          VisibleAlertButtons collection. To demonstrate, we will hide
          the snooze button if it has already been clicked more than three times.*/
        alertButtons = desktopAlert:AlertButtons.
        visibleButtons = showWindowInfo:VisibleAlertButtons.
        visibleButtons:Clear().
        visibleButtons:Add(alertButtons["delete"]).

        IF snoozeCount < 3 THEN
            visibleButtons:Add(alertButtons["snooze"]).

        visibleButtons:Add(alertButtons["dismiss"]).
        visibleButtons:Add(alertButtons["locked"]).
        visibleButtons:Add(alertButtons["tasks"]).
        /*Show the desktop alert window*/
        desktopAlert:Show(showWindowInfo).
    END METHOD. /*METHOD PRIVATE VOID OnReminderDue*/

    /*Handles the UltraDesktopAlert's 'DesktopAlertLinkClicked' event.*/
    METHOD PRIVATE VOID OnLinkClicked(sender AS System.Object, e AS DesktopAlertLinkClickedEventArgs):
        DEFINE VARIABLE appointment  AS Appointment       NO-UNDO.
        DEFINE VARIABLE calendarInfo AS UltraCalendarInfo NO-UNDO.

        /*Determine which link was clicked using the 'LinkType' property
          of the event arguments; if the Caption or Text link was clicked,
          we will open the associated Appointment in the appointment dialog.*/
        IF Progress.Util.EnumHelper:AreEqual(e:LinkType,DesktopAlertLinkType:Caption) OR
           Progress.Util.EnumHelper:AreEqual(e:LinkType,DesktopAlertLinkType:Text) THEN
        DO:
            /*Get the reference to the Appointment that we cached at the time the window was displayed.*/
            appointment = CAST(e:WindowInfo:Data, Appointment).

            IF appointment NE ? THEN
            DO:
                calendarInfo = scheduleOwner:CalendarInfo.
                IF calendarInfo NE ? THEN
                    calendarInfo:DisplayAppointmentDialog(appointment).
            END.
        END.
    END METHOD. /*METHOD PRIVATE VOID OnLinkClicked*/

    /*Handles the UltraDesktopAlert's 'DesktopAlertClosing' event.*/
    METHOD PRIVATE VOID OnDesktopAlertClosing(sender AS System.Object, e AS DesktopAlertClosingEventArgs):
        /*Cache the location of the desktop alert window so that we can display
          the next one at that same location.*/
        lastLocation = e:WindowInfo:Bounds:Location.
    END METHOD.

    /*Handles the UltraDesktopAlert's 'AlertButtonClicked' event.*/
    METHOD PRIVATE VOID OnAlertButtonClicked(sender AS System.Object, e AS AlertButtonClickedEventArgs):
        DEFINE VARIABLE buttonKey    AS CHARACTER NO-UNDO.
        DEFINE VARIABLE calendarInfo AS UltraCalendarInfo NO-UNDO.
        DEFINE VARIABLE appointment  AS Appointment NO-UNDO.

        buttonKey = LC(e:BUTTON:Key).
        calendarInfo = scheduleOwner:CalendarInfo.
        appointment = CAST(e:WindowInfo:Data,Appointment).

        e:CloseWindow = ButtonClickHelper(buttonKey, appointment).
    END METHOD.

    /*Handles the UltraDesktopAlert's 'DropDownButtonClicked' event.*/
    METHOD PRIVATE VOID OnDropDownButtonClicked(sender AS System.Object, e AS DropDownButtonClickedEventArgs):
        DEFINE VARIABLE buttonRect     AS System.Drawing.Rectangle NO-UNDO.
        DEFINE VARIABLE screenLocation AS Point                    NO-UNDO.

        /*Store a reference to the UltraDesktopAlertWindowInfo in the popupMenuTool's Tag property,
          which we can use in the ToolClick event handler.*/
        localPopupMenuTool:Tag = e:WindowInfo.

        /*Get the screen location of the dropdown button's lower right corner;
          this is where we will display the PopupMenuTool.*/
        buttonRect = e:ButtonScreenRect.
        screenLocation = buttonRect:Location.
        screenLocation:Offset(buttonRect:Width, buttonRect:Height).

        /*Show the popup menu tool at the lower right corner of the dropdown button, using the
          DesktopAlertWindow control as the owner, and the button's bounds as the exclusion rectangle.*/
        localPopupMenuTool:ShowPopup( screenLocation, buttonRect, DropDownPosition:BelowExclusionRect, e:WindowInfo:DesktopAlertWindow).
    END METHOD.

    /*Handles the UltraToolbarsManager's 'ToolClick' event.*/
    METHOD PRIVATE VOID OnToolClick(sender AS System.Object, e AS ToolClickEventArgs):
        DEFINE VARIABLE toolKey      AS CHARACTER                   NO-UNDO.
        DEFINE VARIABLE calendarInfo AS UltraCalendarInfo           NO-UNDO.
        DEFINE VARIABLE windowInfo   AS UltraDesktopAlertWindowInfo NO-UNDO.
        DEFINE VARIABLE closeWindow  AS LOGICAL                     NO-UNDO.
        DEFINE VARIABLE appointment  AS Appointment                 NO-UNDO.

        toolKey = LC(e:Tool:Key).
        calendarInfo = scheduleOwner:CalendarInfo.

        windowInfo = CAST(localPopupMenuTool:Tag,UltraDesktopAlertWindowInfo).
        closeWindow = TRUE.

        IF windowInfo NE ? THEN
        DO:            
            appointment = CAST(windowInfo:Data,Appointment).
            closeWindow = ButtonClickHelper(toolKey, appointment).
        END.

        /*We have to manually close the desktop alert window if we want
          tools to exhibit the same behavior as the alert buttons, so
          programmatically close the desktop alert window if the button
          that was clicked should cause it to close.*/
        IF closeWindow AND desktopAlert:IsOpen(windowInfo) THEN
            desktopAlert:Close(windowInfo).
    END METHOD.

    /*Helper method which handles the UltraDesktopAlert's 'AlertButtonClicked' event
      and the UltraToolbarsManager's 'ToolClick' event. Returns a boolean which indicates
      whether the desktop alert window should be closed.*/
    METHOD PRIVATE LOGICAL ButtonClickHelper(buttonKey AS CHARACTER, appointment AS Appointment):
        DEFINE VARIABLE calendarInfo AS UltraCalendarInfo NO-UNDO.
        DEFINE VARIABLE closeWindow  AS LOGICAL NO-UNDO.
        DEFINE VARIABLE note AS Note NO-UNDO.

        calendarInfo = appointment:CalendarInfo.
        closeWindow = TRUE.

        CASE buttonKey:
            WHEN "delete" THEN calendarInfo:Appointments:Remove(appointment).
            WHEN "snooze" THEN
            DO:
                appointment:Reminder:Enabled = TRUE.
                appointment:Reminder:Snooze(SnoozeIntervalUnits:Minutes, AppointmentReminderDesktopAlert:snoozeInterval).
                snoozeCount = snoozeCount + 1.
            END.
            WHEN "dismiss" THEN appointment:Reminder:Enabled = FALSE.
            WHEN "locked" THEN appointment:Locked = TRUE.
            WHEN "note" THEN
            DO:
                note = calendarInfo:Notes:Add(appointment:StartDateTime, appointment:Subject).
                note:Owner = scheduleOwner.
            END.
            WHEN "tasks" OR WHEN  "mail" OR WHEN "find" THEN
                closeWindow = FALSE.
                /*TODO: Implement*/
        END CASE.

        RETURN closeWindow.
    END METHOD.

    /*Returns a string that can be used by the FormattedLinkEditor as a link which can display optionally as bolded.*/
    METHOD PUBLIC STATIC CHARACTER FormatLink(newText AS CHARACTER, bold AS LOGICAL):
        DEFINE VARIABLE styleString AS CHARACTER NO-UNDO.
        styleString = IF bold THEN "bold" ELSE "normal".
        RETURN LinkFormatString(newText, styleString).
    END METHOD.

    /*Returns a string that can be used by the FormattedLinkEditor as a link that displays
      the first line as bold and the second line as normal, with the specified colors.*/
    METHOD PUBLIC STATIC CHARACTER FormatLink(line1Text AS CHARACTER, line2Text AS CHARACTER, line1ForeColor AS System.Drawing.Color, line2ForeColor AS System.Drawing.Color):
        DEFINE VARIABLE colorVal AS INTEGER NO-UNDO.
        DEFINE VARIABLE colorStringLine1 AS CHARACTER NO-UNDO.
        DEFINE VARIABLE colorStringLine2 AS CHARACTER NO-UNDO.
        
        colorVal = line1ForeColor:ToArgb().
        colorVal = 0x00ffffff.
        colorStringLine1 = STRING(line1ForeColor:ToArgb()).

        colorVal = line2ForeColor:ToArgb().
        colorVal = 0x00ffffff.
        colorStringLine2 = STRING(line2ForeColor:ToArgb()).

        RETURN LinkFormatStringMultiLine(line1Text, line2Text, colorStringLine1, colorStringLine2, "").
    END METHOD.

    /*Called when this instance is disposed of.*/
    METHOD PRIVATE VOID DisposeIcons():

        HookEvents(FALSE).

        IF localIconManager NE ? THEN
            DELETE OBJECT localIconManager.
    END METHOD.

    METHOD PUBLIC STATIC CHARACTER LinkFormatString (INPUT newText AS CHARACTER, INPUT styleString AS CHARACTER):
        RETURN '<a><span style="font-weight:' + styleString + '_x003B_">' + newText + '</span><br/></a>'.
    END METHOD.

    METHOD PUBLIC STATIC CHARACTER LinkFormatStringMultiLine (newLine AS CHARACTER, line1Text AS CHARACTER, line2Text AS CHARACTER, colorStringLine1 AS CHARACTER, colorStringLine2 AS CHARACTER):
        RETURN '<a><span style="color:_x0023_' + line2Text + '_x003B__x0020_font-weight:normal_x003B_">' + newLine + '</span><br/><span style="color:_x0023_' + colorStringLine1 + '_x003B_">' + line1Text + '</span><br/></a>'.
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	DESTRUCTOR PUBLIC AppointmentReminderDesktopAlert ( ):
        DisposeIcons().
	END DESTRUCTOR.

END CLASS.