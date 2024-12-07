 
 /*------------------------------------------------------------------------
    File        : frmMain
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Mon Jul 14 16:59:52 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

USING Infragistics.Win.UltraWinSchedule.*.
USING Infragistics.Win.UltraWinToolbars.*.

USING WinMisc.DesktopAlertAppointmentReminder.frmMain.
USING WinMisc.DesktopAlertAppointmentReminder.IconName.
USING WinMisc.DesktopAlertAppointmentReminder.AppointmentReminderDesktopAlert.

CLASS WinMisc.DesktopAlertAppointmentReminder.frmMain INHERITS Form   : 

	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.

	DEFINE PRIVATE VARIABLE frmMain_Fill_Panel AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraDayView1 AS Infragistics.Win.UltraWinSchedule.UltraDayView NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraCalendarInfo1 AS Infragistics.Win.UltraWinSchedule.UltraCalendarInfo NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraCalendarLook1 AS Infragistics.Win.UltraWinSchedule.UltraCalendarLook NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraDesktopAlert1 AS Infragistics.Win.Misc.UltraDesktopAlert NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraToolbarsManager1 AS Infragistics.Win.UltraWinToolbars.UltraToolbarsManager NO-UNDO.
	DEFINE PRIVATE VARIABLE m_frmMain_Toolbars_Dock_Area_Left AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE m_frmMain_Toolbars_Dock_Area_Right AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE m_frmMain_Toolbars_Dock_Area_Top AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE m_frmMain_Toolbars_Dock_Area_Bottom AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.

    DEFINE PRIVATE VARIABLE ownerBillDesktopAlert AS AppointmentReminderDesktopAlert NO-UNDO.
    DEFINE PRIVATE VARIABLE ownerTedDesktopAlert  AS AppointmentReminderDesktopAlert NO-UNDO.

	DEFINE PUBLIC PROPERTY thisComponents AS System.ComponentModel.IContainer NO-UNDO
    GET:
        RETURN THIS-OBJECT:Components.
    END GET.

	CONSTRUCTOR PUBLIC frmMain (  ):
		SUPER().
		InitializeComponent ( ).
	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC frmMain ( ):
		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.

	    DELETE OBJECT ownerBillDesktopAlert NO-ERROR.
		DELETE OBJECT ownerTedDesktopAlert  NO-ERROR.
		
	END DESTRUCTOR.


	METHOD PRIVATE VOID InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

		THIS-OBJECT:components = NEW System.ComponentModel.Container().
		THIS-OBJECT:frmMain_Fill_Panel = NEW System.Windows.Forms.Panel().
		THIS-OBJECT:ultraDayView1 = NEW Infragistics.Win.UltraWinSchedule.UltraDayView().
		THIS-OBJECT:ultraCalendarInfo1 = NEW Infragistics.Win.UltraWinSchedule.UltraCalendarInfo(THIS-OBJECT:components).
		THIS-OBJECT:ultraCalendarLook1 = NEW Infragistics.Win.UltraWinSchedule.UltraCalendarLook(THIS-OBJECT:components).
		THIS-OBJECT:ultraDesktopAlert1 = NEW Infragistics.Win.Misc.UltraDesktopAlert(THIS-OBJECT:components).
		THIS-OBJECT:ultraToolbarsManager1 = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsManager(THIS-OBJECT:components).
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Left = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Right = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Top = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Bottom = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
		THIS-OBJECT:frmMain_Fill_Panel:SuspendLayout().
		CAST(THIS-OBJECT:ultraDayView1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraDesktopAlert1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraToolbarsManager1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* frmMain_Fill_Panel */
		/*  */
		THIS-OBJECT:frmMain_Fill_Panel:Controls:Add(THIS-OBJECT:ultraDayView1).
		THIS-OBJECT:frmMain_Fill_Panel:Cursor = System.Windows.Forms.Cursors:Default.
		THIS-OBJECT:frmMain_Fill_Panel:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:frmMain_Fill_Panel:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:frmMain_Fill_Panel:Name = "frmMain_Fill_Panel".
		THIS-OBJECT:frmMain_Fill_Panel:Size = NEW System.Drawing.Size(440, 408).
		THIS-OBJECT:frmMain_Fill_Panel:TabIndex = 0.
		/*  */
		/* ultraDayView1 */
		/*  */
		THIS-OBJECT:ultraDayView1:CalendarInfo = THIS-OBJECT:ultraCalendarInfo1.
		THIS-OBJECT:ultraDayView1:CalendarLook = THIS-OBJECT:ultraCalendarLook1.
		THIS-OBJECT:ultraDayView1:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:ultraDayView1:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:ultraDayView1:Name = "ultraDayView1".
		THIS-OBJECT:ultraDayView1:Size = NEW System.Drawing.Size(440, 408).
		THIS-OBJECT:ultraDayView1:TabIndex = 1.
		/*  */
		/* ultraCalendarLook1 */
		/*  */
		THIS-OBJECT:ultraCalendarLook1:ViewStyle = Infragistics.Win.UltraWinSchedule.ViewStyle:Office2007.
		/*  */
		/* ultraToolbarsManager1 */
		/*  */
		THIS-OBJECT:ultraToolbarsManager1:DesignerFlags = 1.
		THIS-OBJECT:ultraToolbarsManager1:DockWithinContainer = THIS-OBJECT.
		THIS-OBJECT:ultraToolbarsManager1:DockWithinContainerBaseType = Progress.Util.TypeHelper:GetType("Progress.Windows.Form").
		/*  */
		/* m_frmMain_Toolbars_Dock_Area_Left */
		/*  */
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Left:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Left:BackColor = System.Drawing.SystemColors:Control.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Left:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Left.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Left:ForeColor = System.Drawing.SystemColors:ControlText.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Left:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Left:Name = "m_frmMain_Toolbars_Dock_Area_Left".
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Left:Size = NEW System.Drawing.Size(0, 408).
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Left:ToolbarsManager = THIS-OBJECT:ultraToolbarsManager1.
		/*  */
		/* m_frmMain_Toolbars_Dock_Area_Right */
		/*  */
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Right:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Right:BackColor = System.Drawing.SystemColors:Control.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Right:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Right.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Right:ForeColor = System.Drawing.SystemColors:ControlText.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Right:Location = NEW System.Drawing.Point(440, 0).
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Right:Name = "m_frmMain_Toolbars_Dock_Area_Right".
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Right:Size = NEW System.Drawing.Size(0, 408).
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Right:ToolbarsManager = THIS-OBJECT:ultraToolbarsManager1.
		/*  */
		/* m_frmMain_Toolbars_Dock_Area_Top */
		/*  */
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Top:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Top:BackColor = System.Drawing.SystemColors:Control.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Top:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Top.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Top:ForeColor = System.Drawing.SystemColors:ControlText.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Top:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Top:Name = "m_frmMain_Toolbars_Dock_Area_Top".
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Top:Size = NEW System.Drawing.Size(440, 0).
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Top:ToolbarsManager = THIS-OBJECT:ultraToolbarsManager1.
		/*  */
		/* m_frmMain_Toolbars_Dock_Area_Bottom */
		/*  */
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Bottom:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Bottom:BackColor = System.Drawing.SystemColors:Control.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Bottom:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Bottom.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Bottom:ForeColor = System.Drawing.SystemColors:ControlText.
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Bottom:Location = NEW System.Drawing.Point(0, 408).
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Bottom:Name = "m_frmMain_Toolbars_Dock_Area_Bottom".
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Bottom:Size = NEW System.Drawing.Size(440, 0).
		THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Bottom:ToolbarsManager = THIS-OBJECT:ultraToolbarsManager1.
		/*  */
		/* frmMain */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(440, 408).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:frmMain_Fill_Panel).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Left).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Right).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Top).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:m_frmMain_Toolbars_Dock_Area_Bottom).
		THIS-OBJECT:Name = "frmMain".
		THIS-OBJECT:Text = "Appointment Reminder Desktop Alert".
		THIS-OBJECT:Load:SUBSCRIBE(THIS-OBJECT:frmMain_Load).
		THIS-OBJECT:frmMain_Fill_Panel:ResumeLayout(FALSE).
		CAST(THIS-OBJECT:ultraDayView1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraDesktopAlert1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraToolbarsManager1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ResumeLayout(FALSE).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID frmMain_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        InitializeUI().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID InitializeUI(  ):
	    DEFINE VARIABLE popupMenuTool   AS PopupMenuTool                           NO-UNDO.
	    DEFINE VARIABLE ownerBill       AS Infragistics.Win.UltraWinSchedule.Owner NO-UNDO.
	    DEFINE VARIABLE ownerTed        AS Infragistics.Win.UltraWinSchedule.Owner NO-UNDO.
	    DEFINE VARIABLE billAppointment AS Appointment                             NO-UNDO.
	    DEFINE VARIABLE startTime       AS DATETIME                                NO-UNDO.
        DEFINE VARIABLE endTime         AS DATETIME                                NO-UNDO.

        /*Populate the UltraToolbarsManager's Tools collection*/
        popupMenuTool = InitializeToolbarsManager().

        /*Add some owners to the UltraCalendarInfo's Owners collection...also, hide the unassigned owner,
          and set the DayView's GroupingStyle so that owners are displayed separately.*/
        ultraCalendarInfo1:Owners:UnassignedOwner:Visible = FALSE.
        ownerBill = ultraCalendarInfo1:Owners:Add("Bill","Bill S. Preston, Esq.").
        ownerBill:EmailAddress = "bills@wyldstallyns.com".

        ownerTed = ultraCalendarInfo1:Owners:Add("Ted", "Ted Logan").
        ownerTed:EmailAddress = "tedl@wyldstallyns.com".

        ultraDayView1:GroupingStyle = DayViewGroupingStyle:DateWithinOwner.

        /*Create an instance of the AppointmentReminderDesktopAlert class for each owner.
          This class wraps the functionality extended by the UltraDesktopAlert component
          for use with UltraWinSchedule Appointment reminders, to provide a notification
          mechanism that is very similar to the MS Outlook New Mail Desktop Alert.*/
        ownerBillDesktopAlert = new AppointmentReminderDesktopAlert(ownerBill, ultraCalendarLook1, THIS-OBJECT, popupMenuTool).
        ownerTedDesktopAlert  = new AppointmentReminderDesktopAlert(ownerTed, ultraCalendarLook1, THIS-OBJECT, popupMenuTool).
        
        startTime = NOW - 60000.
        endTime   = NOW + 1800000.

        billAppointment = new Infragistics.Win.UltraWinSchedule.Appointment(startTime,endTime).
        billAppointment:Subject = "Bill's Most Excellent Appointment".
        billAppointment:Description = "This is to remind Bill that the San Dimas Battle of the Bands is coming up soon, so don't forget to hone your most excellent guitar playing chops!".
        billAppointment:Owner = ownerBill.
        billAppointment:Reminder:DisplayInterval = 0.
        billAppointment:Reminder:Enabled = TRUE.
        ultraCalendarInfo1:Appointments:Add(billAppointment).

        ultraCalendarInfo1:CheckAppointmentReminders().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC PopupMenuTool InitializeToolbarsManager():
        DEFINE VARIABLE localIconManager AS WinMisc.DesktopAlertAppointmentReminder.IconManager   NO-UNDO.
        DEFINE VARIABLE deleteTool       AS ButtonTool    NO-UNDO.
        DEFINE VARIABLE findTool         AS ButtonTool    NO-UNDO.
        DEFINE VARIABLE mailTool         AS ButtonTool    NO-UNDO.
        DEFINE VARIABLE noteTool         AS ButtonTool    NO-UNDO.
        DEFINE VARIABLE popupMenuTool    AS PopupMenuTool NO-UNDO.
        DEFINE VARIABLE toolbars         AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 4 NO-UNDO.
        DEFINE VARIABLE toolsNames       AS CHARACTER EXTENT 4 NO-UNDO INITIAL ["delete", "find", "mail", "note"].

        ultraToolbarsManager1:Style = ToolbarStyle:Office2007.

        localIconManager = WinMisc.DesktopAlertAppointmentReminder.IconManager:GetInstance(THIS-OBJECT).
        deleteTool = new ButtonTool("delete").
        deleteTool:SharedProps:ToolTipText = "Delete this Appointment".
        deleteTool:SharedProps:Caption = deleteTool:SharedProps:ToolTipText.
        deleteTool:SharedProps:AppearancesSmall:Appearance:Image = localIconManager:GetBitmap(IconName:Delete_16).

        findTool = new ButtonTool("find").
        findTool:SharedProps:ToolTipText = "Find a contact".
        findTool:SharedProps:Caption = findTool:SharedProps:ToolTipText.
        findTool:SharedProps:AppearancesSmall:Appearance:Image = localIconManager:GetBitmap(IconName:Find_16).

        mailTool = new ButtonTool("mail").
        mailTool:SharedProps:ToolTipText = "Send mail".
        mailTool:SharedProps:Caption = mailTool:SharedProps:ToolTipText.
        mailTool:SharedProps:AppearancesSmall:Appearance:Image = localIconManager:GetBitmap(IconName:Mail_16).

        noteTool = new ButtonTool( "note" ).
        noteTool:SharedProps:ToolTipText = "Add a note for the same date as this Appointment".
        noteTool:SharedProps:Caption = "Add a note".
        noteTool:SharedProps:AppearancesSmall:Appearance:Image = localIconManager:GetBitmap(IconName:Note_16).

        toolbars[1] = deleteTool.
        toolbars[2] = findTool.
        toolbars[3] = mailTool.
        toolbars[4] = noteTool.

        ultraToolbarsManager1:Tools:AddRange(toolbars).

        popupMenuTool = new PopupMenuTool("popupMenuTool").
        ultraToolbarsManager1:Tools:Add(popupMenuTool).

        popupMenuTool:Tools:AddToolRange(toolsNames).
 
        RETURN popupMenuTool.
	END METHOD.
END CLASS.