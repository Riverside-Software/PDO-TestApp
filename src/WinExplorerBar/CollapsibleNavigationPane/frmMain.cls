 /*------------------------------------------------------------------------
    File        : frmMain
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Thu May 01 17:19:33 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.
USING Progress.Util.EnumHelper.

USING System.*.
USING System.Globalization.*.
USING System.Windows.Forms.*.

USING Infragistics.Win.UltraWinSchedule.*.
USING Infragistics.Win.UltraWinExplorerBar.*.

USING Infragistics.Win.*.
USING Infragistics.Win.UltraWinListView.*.
USING Infragistics.Win.UltraWinToolbars.*.
USING Infragistics.Win.Misc.*.
USING System.Drawing.*. 

USING WinExplorerBar.CollapsibleNavigationPane.*.

USING DataServices.EmployeeService.
USING DataServices.CustOrderItemService.

CLASS WinExplorerBar.CollapsibleNavigationPane.frmMain INHERITS Form   : 
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.

	DEFINE PRIVATE VARIABLE lblContent AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExplorerBar1 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBar NO-UNDO.
	DEFINE PRIVATE VARIABLE frmMain_Fill_Panel AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE pnlContent AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE splitter2 AS System.Windows.Forms.Splitter NO-UNDO.
	DEFINE PRIVATE VARIABLE splitter1 AS System.Windows.Forms.Splitter NO-UNDO.

	DEFINE PRIVATE VARIABLE ultraMonthViewMulti1 AS Infragistics.Win.UltraWinSchedule.UltraMonthViewMulti NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraCalendarInfo1 AS Infragistics.Win.UltraWinSchedule.UltraCalendarInfo NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraCalendarLook1 AS Infragistics.Win.UltraWinSchedule.UltraCalendarLook NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraDayView1 AS Infragistics.Win.UltraWinSchedule.UltraDayView NO-UNDO.

	DEFINE PRIVATE VARIABLE m_frmMain_Toolbars_Dock_Area_Left AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraToolbarsManager1 AS Infragistics.Win.UltraWinToolbars.UltraToolbarsManager NO-UNDO.
	DEFINE PRIVATE VARIABLE m_frmMain_Toolbars_Dock_Area_Right AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE m_frmMain_Toolbars_Dock_Area_Top AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE m_frmMain_Toolbars_Dock_Area_Bottom AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.

    DEFINE PRIVATE VARIABLE lvwContent AS Infragistics.Win.UltraWinListView.UltraListView NO-UNDO.
    DEFINE PRIVATE VARIABLE lvwNavigationPane AS Infragistics.Win.UltraWinListView.UltraListView NO-UNDO.
 
    /* manual defs */
    DEFINE PRIVATE VARIABLE monthViewMultiContainer AS System.Windows.Forms.Panel NO-UNDO.
    
    DEFINE PRIVATE VARIABLE iconManager AS IconManager NO-UNDO.
    DEFINE PRIVATE VARIABLE custOrderItemService AS CustOrderItemService NO-UNDO.
 
    DEFINE PRIVATE PROPERTY ViewStyle AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarViewStyle NO-UNDO GET.
    SET (INPUT newViewStyle AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarViewStyle):
        DEFINE VARIABL colorTable         AS MicrosoftColorTable NO-UNDO.
        DEFINE VARIABLE toolbarViewStyle  AS ToolbarStyle NO-UNDO.
        DEFINE VARIABLE scheduleViewStyle AS ViewStyle NO-UNDO.
        DEFINE VARIABLE stateButtonTool   AS StateButtonTool NO-UNDO.
        DEFINE VARIABLE currentGroup      AS UltraExplorerBarGroup NO-UNDO.
        DEFINE VARIABLE appearanceData    AS Infragistics.Win.AppearanceData NO-UNDO.
        DEFINE VARIABLE requestedProps    AS Infragistics.Win.AppearancePropFlags NO-UNDO.

        ultraDayView1:BeginUpdate().
		ultraExplorerBar1:BeginUpdate().
		lvwContent:BeginUpdate().
		lvwNavigationPane:BeginUpdate().
		ultraMonthViewMulti1:BeginUpdate().

		ultraExplorerBar1:ViewStyle = newViewStyle.

		toolbarViewStyle = ToolbarStyle:DEFAULT.
		scheduleViewStyle = Infragistics.Win.UltraWinSchedule.ViewStyle:DEFAULT.

		IF EnumHelper:AreEqual(newViewStyle,UltraExplorerBarViewStyle:Office2003) THEN
                ASSIGN toolbarViewStyle  = ToolbarStyle:Office2003
				       scheduleViewStyle = Infragistics.Win.UltraWinSchedule.ViewStyle:Office2003
				       stateButtonTool   = CAST(ultraToolbarsManager1:Tools:Item["ViewStyle_Office2003"],StateButtonTool)
				       colorTable        = Office2003ColorTable:Colors.
        ELSE IF EnumHelper:AreEqual(newViewStyle,UltraExplorerBarViewStyle:VisualStudio2005) THEN
                ASSIGN toolbarViewStyle  = ToolbarStyle:VisualStudio2005
				       scheduleViewStyle = Infragistics.Win.UltraWinSchedule.ViewStyle:VisualStudio2005
				       stateButtonTool   = CAST(ultraToolbarsManager1:Tools:Item["ViewStyle_VS2005"],StateButtonTool)
				       colorTable        = VisualStudio2005ColorTable:Colors.
        ELSE IF EnumHelper:AreEqual(newViewStyle,UltraExplorerBarViewStyle:Office2007) THEN
		DO:
			    toolbarViewStyle = ToolbarStyle:Office2007.
				scheduleViewStyle = Infragistics.Win.UltraWinSchedule.ViewStyle:Office2007.

				IF EnumHelper:AreEqual(Office2007ColorTable:ColorSchemeResolved,Office2007ColorScheme:Blue) THEN
					    stateButtonTool = CAST(ultraToolbarsManager1:Tools:Item["ViewStyle_Office2007_Blue"],StateButtonTool).
			    ELSE IF EnumHelper:AreEqual(Office2007ColorTable:ColorSchemeResolved,Office2007ColorScheme:Black) THEN
					    stateButtonTool = CAST(ultraToolbarsManager1:Tools:Item["ViewStyle_Office2007_Black"],StateButtonTool).
			    ELSE IF EnumHelper:AreEqual(Office2007ColorTable:ColorSchemeResolved,Office2007ColorScheme:Silver) THEN
					    stateButtonTool = CAST(ultraToolbarsManager1:Tools:Item["ViewStyle_Office2007_Silver"],StateButtonTool).

			    colorTable = Office2007ColorTable:Colors.
        END.

        /*Check the appropriate StateButtonTool*/
		IF stateButtonTool NE ? THEN
		    stateButtonTool:Checked = TRUE.

        /*Set the ViewStyle for each control/component*/
		ultraCalendarLook1:ViewStyle = scheduleViewStyle.
		ultraToolbarsManager1:Ribbon:Visible = (toolbarViewStyle = ToolbarStyle:Office2007).
		ultraToolbarsManager1:Style = toolbarViewStyle.

		IF colorTable NE ? THEN
        DO:
			/*Set the Appearance for the content label to colors appropriate
			  for the current ViewStyle...we'll use the UltraExplorerBar's
			  resolved navigation pane header appearance to make the label look
			  similar to the navigation pane header*/
			IF ultraExplorerBar1:Groups:Count > 0 THEN
		        currentGroup = CAST(ultraExplorerBar1:Groups[0],UltraExplorerBarGroup).
            ELSE
                currentGroup = ?.

			IF currentGroup NE ? THEN
            DO:
                appearanceData = new Infragistics.Win.AppearanceData().
		 
				requestedProps = Infragistics.Win.AppearancePropFlags:AllRender.

                ASSIGN
                lblContent:Appearance:BackColor             = appearanceData:BackColor
				lblContent:Appearance:BackColor2            = appearanceData:BackColor2
				lblContent:Appearance:BackGradientStyle     = appearanceData:BackGradientStyle
				lblContent:Appearance:ForeColor             = appearanceData:ForeColor
				lblContent:Appearance:FontData:SizeInPoints = appearanceData:FontData:SizeInPoints
				lblContent:Appearance:FontData:Name         = appearanceData:FontData:Name
				lblContent:Appearance:FontData:Bold         = appearanceData:FontData:Bold
				lblContent:Appearance:TextVAlign            = appearanceData:TextVAlign.
			END.
        END.

    	/*Set the BackColor for the splitters so they also look consistent*/
		splitter1:BackColor = colorTable:OutlookNavPaneBorder.
		splitter2:BackColor = colorTable:OutlookNavPaneBorder.

	    FINALLY:
		    ultraDayView1:EndUpdate(TRUE).
		    ultraExplorerBar1:EndUpdate(TRUE).
		    lvwContent:EndUpdate(TRUE).
		    lvwNavigationPane:EndUpdate(TRUE).
		    ultraMonthViewMulti1:EndUpdate(TRUE).
	    END FINALLY.
    END. /*SET PROPERTY ViewStyle*/

   	/*Returns a ValueList populated with the Itemnum and name of each item.*/
	DEFINE PRIVATE PROPERTY ProductsValueList AS Infragistics.Win.ValueList NO-UNDO
	GET:
        IF ProductsValueList = ? THEN
            ProductsValueList = CustOrderItemService:ValueList("eItem","ItemNum","ItemName").
        
        RETURN ProductsValueList.
    END. /*GET ProductsValueList property*/
    PRIVATE SET.
    
	/*Returns a ValueList populated with the CustomerID and CompanyName of each customer.*/
	DEFINE PRIVATE PROPERTY CustomersValueList AS Infragistics.Win.ValueList GET. SET.

    /*Returns a ValueList populated with the EmployeeID and name of each employee.*/
    DEFINE PRIVATE PROPERTY employeeValueList AS Infragistics.Win.ValueList NO-UNDO GET. SET.

	CONSTRUCTOR PUBLIC frmMain (  ):
		SUPER().
		InitializeComponent ( ).
		iconManager = IconManager().
		populateEmployeeList().
		initializeDataSource().
        InitializeUI().
	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC frmMain ( ):

		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.

	END DESTRUCTOR.

	METHOD PRIVATE VOID InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

		components = NEW System.ComponentModel.Container().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolbar1 AS Infragistics.Win.UltraWinToolbars.UltraToolbar NO-UNDO.
		ultraToolbar1 = NEW Infragistics.Win.UltraWinToolbars.UltraToolbar("tools").
		lblContent = NEW Infragistics.Win.Misc.UltraLabel().
		ultraExplorerBar1 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBar().
		frmMain_Fill_Panel = NEW System.Windows.Forms.Panel().
		pnlContent = NEW System.Windows.Forms.Panel().
		ultraMonthViewMulti1 = NEW Infragistics.Win.UltraWinSchedule.UltraMonthViewMulti().
		ultraCalendarInfo1 = NEW Infragistics.Win.UltraWinSchedule.UltraCalendarInfo(components).
		ultraCalendarLook1 = NEW Infragistics.Win.UltraWinSchedule.UltraCalendarLook(components).
		ultraDayView1 = NEW Infragistics.Win.UltraWinSchedule.UltraDayView().
		splitter2 = NEW System.Windows.Forms.Splitter().
		splitter1 = NEW System.Windows.Forms.Splitter().
		ultraToolbarsManager1 = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsManager(components).
		m_frmMain_Toolbars_Dock_Area_Left = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
		m_frmMain_Toolbars_Dock_Area_Right = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
		m_frmMain_Toolbars_Dock_Area_Top = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
		m_frmMain_Toolbars_Dock_Area_Bottom = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
		CAST(ultraExplorerBar1, System.ComponentModel.ISupportInitialize):BeginInit().
		frmMain_Fill_Panel:SuspendLayout().
		pnlContent:SuspendLayout().
		CAST(ultraMonthViewMulti1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(ultraDayView1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(ultraToolbarsManager1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* lblContent */
		/*  */
		lblContent:Dock = System.Windows.Forms.DockStyle:Top.
		lblContent:Location = NEW System.Drawing.Point(41, 0).
		lblContent:Name = "lblContent".
		lblContent:Size = NEW System.Drawing.Size(630, 24).
		lblContent:TabIndex = 3.
		/*  */
		/* ultraExplorerBar1 */
		/*  */
		ultraExplorerBar1:Dock = System.Windows.Forms.DockStyle:Left.
		ultraExplorerBar1:GroupSettings:HeaderVisible = Infragistics.Win.DefaultableBoolean:True.
		ultraExplorerBar1:GroupSettings:Style = Infragistics.Win.UltraWinExplorerBar.GroupStyle:ControlContainer.
		ultraExplorerBar1:Location = NEW System.Drawing.Point(0, 0).
		ultraExplorerBar1:Name = "ultraExplorerBar1".
		ultraExplorerBar1:NavigationPaneExpandedState = Infragistics.Win.UltraWinExplorerBar.NavigationPaneExpandedState:Collapsed.
		ultraExplorerBar1:NavigationPaneExpansionMode = CAST(Progress.Util.EnumHelper:Or(Infragistics.Win.UltraWinExplorerBar.NavigationPaneExpansionMode:OnButtonClick, Infragistics.Win.UltraWinExplorerBar.NavigationPaneExpansionMode:OnSizeChanged), Infragistics.Win.UltraWinExplorerBar.NavigationPaneExpansionMode).
		ultraExplorerBar1:Size = NEW System.Drawing.Size(40, 417).
		ultraExplorerBar1:Style = Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarStyle:OutlookNavigationPane.
		ultraExplorerBar1:TabIndex = 0.
		/*  */
		/* frmMain_Fill_Panel */
		/*  */
		frmMain_Fill_Panel:Controls:Add(pnlContent).
		frmMain_Fill_Panel:Controls:Add(splitter2).
		frmMain_Fill_Panel:Controls:Add(lblContent).
		frmMain_Fill_Panel:Controls:Add(splitter1).
		frmMain_Fill_Panel:Controls:Add(ultraExplorerBar1).
		frmMain_Fill_Panel:Cursor = System.Windows.Forms.Cursors:Default.
		frmMain_Fill_Panel:Dock = System.Windows.Forms.DockStyle:Fill.
		frmMain_Fill_Panel:Location = NEW System.Drawing.Point(0, 46).
		frmMain_Fill_Panel:Name = "frmMain_Fill_Panel".
		frmMain_Fill_Panel:Size = NEW System.Drawing.Size(671, 417).
		frmMain_Fill_Panel:TabIndex = 1.
		/*  */
		/* pnlContent */
		/*  */
		pnlContent:BackColor = System.Drawing.SystemColors:Window.
		pnlContent:Controls:Add(ultraMonthViewMulti1).
		pnlContent:Controls:Add(ultraDayView1).
		pnlContent:Dock = System.Windows.Forms.DockStyle:Fill.
		pnlContent:Location = NEW System.Drawing.Point(41, 25).
		pnlContent:Name = "pnlContent".
		pnlContent:Size = NEW System.Drawing.Size(630, 392).
		pnlContent:TabIndex = 2.
		/*  */
		/* ultraMonthViewMulti1 */
		/*  */
		ultraMonthViewMulti1:BackColor = System.Drawing.SystemColors:Window.
		ultraMonthViewMulti1:CalendarInfo = ultraCalendarInfo1.
		ultraMonthViewMulti1:CalendarLook = ultraCalendarLook1.
		ultraMonthViewMulti1:Location = NEW System.Drawing.Point(49, 26).
		ultraMonthViewMulti1:Name = "ultraMonthViewMulti1".
		ultraMonthViewMulti1:Size = NEW System.Drawing.Size(146, 130).
		ultraMonthViewMulti1:TabIndex = 10.
		/*  */
		/* ultraCalendarInfo1 */
		/*  */
		ultraCalendarInfo1:DataBindingsForAppointments:BindingContextControl = THIS-OBJECT.
		ultraCalendarInfo1:DataBindingsForOwners:BindingContextControl = THIS-OBJECT.
		/*  */
		/* ultraDayView1 */
		/*  */
		ultraDayView1:CalendarInfo = ultraCalendarInfo1.
		ultraDayView1:CalendarLook = ultraCalendarLook1.
		ultraDayView1:Location = NEW System.Drawing.Point(49, 242).
		ultraDayView1:Name = "ultraDayView1".
		ultraDayView1:Size = NEW System.Drawing.Size(152, 144).
		ultraDayView1:TabIndex = 9.
		ultraDayView1:Text = "ultraDayView1".
		ultraDayView1:Visible = FALSE.
		/*  */
		/* splitter2 */
		/*  */
		splitter2:Dock = System.Windows.Forms.DockStyle:Top.
		splitter2:Enabled = FALSE.
		splitter2:Location = NEW System.Drawing.Point(41, 24).
		splitter2:Name = "splitter2".
		splitter2:Size = NEW System.Drawing.Size(630, 1).
		splitter2:TabIndex = 4.
		splitter2:TabStop = FALSE.
		/*  */
		/* splitter1 */
		/*  */
		splitter1:BackColor = System.Drawing.SystemColors:ControlDark.
		splitter1:Location = NEW System.Drawing.Point(40, 0).
		splitter1:Name = "splitter1".
		splitter1:Size = NEW System.Drawing.Size(1, 417).
		splitter1:TabIndex = 1.
		splitter1:TabStop = FALSE.
		/*  */
		/* ultraToolbarsManager1 */
		/*  */
		ultraToolbarsManager1:DesignerFlags = 1.
		ultraToolbarsManager1:DockWithinContainer = THIS-OBJECT.
		ultraToolbarsManager1:DockWithinContainerBaseType = Progress.Util.TypeHelper:GetType("Progress.Windows.Form").
		ultraToolbar1:DockedColumn = 0.
		ultraToolbar1:DockedRow = 0.
		ultraToolbar1:Text = "UltraToolbar1".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar0 AS System.Array NO-UNDO.
		arrayvar0 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinToolbars.UltraToolbar"), 1).
		arrayvar0:SetValue(ultraToolbar1, 0).
		ultraToolbarsManager1:Toolbars:AddRange(CAST(arrayvar0, "Infragistics.Win.UltraWinToolbars.UltraToolbar[]")).
		/*  */
		/* m_frmMain_Toolbars_Dock_Area_Left */
		/*  */
		m_frmMain_Toolbars_Dock_Area_Left:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
		m_frmMain_Toolbars_Dock_Area_Left:BackColor = System.Drawing.SystemColors:Control.
		m_frmMain_Toolbars_Dock_Area_Left:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Left.
		m_frmMain_Toolbars_Dock_Area_Left:ForeColor = System.Drawing.SystemColors:ControlText.
		m_frmMain_Toolbars_Dock_Area_Left:Location = NEW System.Drawing.Point(0, 46).
		m_frmMain_Toolbars_Dock_Area_Left:Name = "m_frmMain_Toolbars_Dock_Area_Left".
		m_frmMain_Toolbars_Dock_Area_Left:Size = NEW System.Drawing.Size(0, 417).
		m_frmMain_Toolbars_Dock_Area_Left:ToolbarsManager = ultraToolbarsManager1.
		/*  */
		/* m_frmMain_Toolbars_Dock_Area_Right */
		/*  */
		m_frmMain_Toolbars_Dock_Area_Right:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
		m_frmMain_Toolbars_Dock_Area_Right:BackColor = System.Drawing.SystemColors:Control.
		m_frmMain_Toolbars_Dock_Area_Right:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Right.
		m_frmMain_Toolbars_Dock_Area_Right:ForeColor = System.Drawing.SystemColors:ControlText.
		m_frmMain_Toolbars_Dock_Area_Right:Location = NEW System.Drawing.Point(671, 46).
		m_frmMain_Toolbars_Dock_Area_Right:Name = "m_frmMain_Toolbars_Dock_Area_Right".
		m_frmMain_Toolbars_Dock_Area_Right:Size = NEW System.Drawing.Size(0, 417).
		m_frmMain_Toolbars_Dock_Area_Right:ToolbarsManager = ultraToolbarsManager1.
		/*  */
		/* m_frmMain_Toolbars_Dock_Area_Top */
		/*  */
		m_frmMain_Toolbars_Dock_Area_Top:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
		m_frmMain_Toolbars_Dock_Area_Top:BackColor = System.Drawing.SystemColors:Control.
		m_frmMain_Toolbars_Dock_Area_Top:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Top.
		m_frmMain_Toolbars_Dock_Area_Top:ForeColor = System.Drawing.SystemColors:ControlText.
		m_frmMain_Toolbars_Dock_Area_Top:Location = NEW System.Drawing.Point(0, 0).
		m_frmMain_Toolbars_Dock_Area_Top:Name = "m_frmMain_Toolbars_Dock_Area_Top".
		m_frmMain_Toolbars_Dock_Area_Top:Size = NEW System.Drawing.Size(671, 46).
		m_frmMain_Toolbars_Dock_Area_Top:ToolbarsManager = ultraToolbarsManager1.
		/*  */
		/* m_frmMain_Toolbars_Dock_Area_Bottom */
		/*  */
		m_frmMain_Toolbars_Dock_Area_Bottom:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
		m_frmMain_Toolbars_Dock_Area_Bottom:BackColor = System.Drawing.SystemColors:Control.
		m_frmMain_Toolbars_Dock_Area_Bottom:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Bottom.
		m_frmMain_Toolbars_Dock_Area_Bottom:ForeColor = System.Drawing.SystemColors:ControlText.
		m_frmMain_Toolbars_Dock_Area_Bottom:Location = NEW System.Drawing.Point(0, 463).
		m_frmMain_Toolbars_Dock_Area_Bottom:Name = "m_frmMain_Toolbars_Dock_Area_Bottom".
		m_frmMain_Toolbars_Dock_Area_Bottom:Size = NEW System.Drawing.Size(671, 0).
		m_frmMain_Toolbars_Dock_Area_Bottom:ToolbarsManager = ultraToolbarsManager1.
		/*  */
		/* frmMain */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(671, 463).
		THIS-OBJECT:Controls:Add(frmMain_Fill_Panel).
		THIS-OBJECT:Controls:Add(m_frmMain_Toolbars_Dock_Area_Left).
		THIS-OBJECT:Controls:Add(m_frmMain_Toolbars_Dock_Area_Right).
		THIS-OBJECT:Controls:Add(m_frmMain_Toolbars_Dock_Area_Top).
		THIS-OBJECT:Controls:Add(m_frmMain_Toolbars_Dock_Area_Bottom).
		THIS-OBJECT:Name = "frmMain".
		THIS-OBJECT:Text = "frmMain".
		CAST(ultraExplorerBar1, System.ComponentModel.ISupportInitialize):EndInit().
		frmMain_Fill_Panel:ResumeLayout(FALSE).
		pnlContent:ResumeLayout(FALSE).
		CAST(ultraMonthViewMulti1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(ultraDayView1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(ultraToolbarsManager1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ResumeLayout(FALSE).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID initializeUI(  ):
	    DEFINE VARIABLE grpCalendar  AS UltraExplorerBarGroup NO-UNDO.
	    DEFINE VARIABLE grpCustomers AS UltraExplorerBarGroup NO-UNDO.
	    DEFINE VARIABLE grpOrders    AS UltraExplorerBarGroup NO-UNDO.
	    DEFINE VARIABLE totalGroups  AS INTEGER NO-UNDO.
	    DEFINE VARIABLE currentGroup AS INTEGER NO-UNDO.
	    DEFINE VARIABLE monthViewMultiContaine AS Panel NO-UNDO. 
	    
	    DEFINE VARIABLE smallImageSize AS INTEGER NO-UNDO.
	    DEFINE VARIABLE largeImageSIze AS INTEGER NO-UNDO.

			/*Add the groups to the ExplorerBar*/
			ASSIGN grpCalendar  = ultraExplorerBar1:Groups:Add( "Calendar", "Calendar")
			       grpCustomers = ultraExplorerBar1:Groups:Add( "Customers", "Customers")
				   grpOrders    = ultraExplorerBar1:Groups:Add( "Orders", "Orders")
			       ultraExplorerBar1:ImageSizeLarge = new Size(IconManager:MEDIUM_IMAGE_SIZE, IconManager:MEDIUM_IMAGE_SIZE)
			       ultraExplorerBar1:ImageSizeSmall = new Size(IconManager:SMALL_IMAGE_SIZE, IconManager:SMALL_IMAGE_SIZE)
			       grpCalendar:SETTINGS:NavigationPaneCollapsedGroupAreaText = grpCalendar:Text
			       grpCustomers:SETTINGS:NavigationPaneCollapsedGroupAreaText = grpCustomers:Text
			       grpOrders:SETTINGS:NavigationPaneCollapsedGroupAreaText = grpOrders:Text.

			/*Assign the images to the HeaderAppearance.Image property for each group...
			  To prevent scaling, we'll use images of different sizes for the AppearancesSmall
			  and AppearancesLarge*/
			grpCalendar:SETTINGS:AppearancesLarge:HeaderAppearance:Image = iconManager:GetBitmap( IconManager:GROUP_CALENDAR, IconManager:MEDIUM_IMAGE_SIZE ).
			grpCalendar:SETTINGS:AppearancesSmall:HeaderAppearance:Image = iconManager:GetBitmap( IconManager:GROUP_CALENDAR, IconManager:SMALL_IMAGE_SIZE ).
			grpCustomers:SETTINGS:AppearancesLarge:HeaderAppearance:Image = iconManager:GetBitmap(IconManager:GROUP_CUSTOMERS, IconManager:MEDIUM_IMAGE_SIZE).
			grpCustomers:SETTINGS:AppearancesSmall:HeaderAppearance:Image = iconManager:GetBitmap(IconManager:GROUP_CUSTOMERS, IconManager:SMALL_IMAGE_SIZE).
			grpOrders:SETTINGS:AppearancesLarge:HeaderAppearance:Image = iconManager:GetBitmap(IconManager:GROUP_ORDERS, IconManager:MEDIUM_IMAGE_SIZE).
			grpOrders:SETTINGS:AppearancesSmall:HeaderAppearance:Image = iconManager:GetBitmap(IconManager:GROUP_ORDERS, IconManager:SMALL_IMAGE_SIZE).

			/*We'll use control containers for the groups*/
			ultraExplorerBar1:GroupSettings:Style = GroupStyle:ControlContainer.

			/*Add the UltraMonthViewMulti control to the 'Calendar' group container*/
			ASSIGN monthViewMultiContainer = new Panel()
			       monthViewMultiContainer:BackColor = SystemColors:Window
			       monthViewMultiContainer:Dock = DockStyle:Fill
			       ultraMonthViewMulti1:Top = 10
			       ultraMonthViewMulti1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(AnchorStyles:Top, AnchorStyles:Bottom), AnchorStyles:Left), AnchorStyles:Right), AnchorStyles). 

			monthViewMultiContainer:Controls:Add(ultraMonthViewMulti1).
			grpCalendar:Container:Controls:Add(monthViewMultiContainer).

			/*Set the ExplorerBar's NavigationPaneExpansionMode property to 'OnButtonClickOrSizeChanged',
			  so the navigation pane can be expanded/collapsed by the end user both when the exapansion
			  button is clicked and when the control's width crosses the threshold defined by the
			  NavigationPaneExpansionThreshold property*/
			ultraExplorerBar1:NavigationPaneExpansionMode = NavigationPaneExpansionMode:OnButtonClickOrSizeChanged.

			/*Set the ExplorerBar's NavigationPaneExpansionThreshold property to
			  the same value as the ImageSizeLarge.Width property; this will cause
			  the navigation pane's expanded state to change when the width crosses
			  this threshold.*/
			ultraExplorerBar1:NavigationPaneExpansionThreshold = ultraExplorerBar1:ImageSizeLarge:Width.

			/*Create an UltraListView control which we'll use for the content*/
			lvwContent = new UltraListView().
			lvwContent:Parent = pnlContent.

			/*Set the DOck property to 'Fill' for the controls that are
			  displayed in the content area.*/
			lvwContent:Dock = DockStyle:Fill.
			ultraDayView1:Dock = DockStyle:FILL.

			/*Create an UltraListView control which we'll use for the
			  navigation pane. Initially, it will appear in the 'Customers'
			  group, but we'll handle the ExplorerBar's 'SelectedGroupChanging'
			  event and reparent it as needed. This reduces the memory footprint
			  of the application a bit since we are only using one control to
			  render the content for each group in the navigation pane.*/
			ASSIGN lvwNavigationPane = new UltraListView()
			       lvwNavigationPane:Dock = DockStyle:Fill
			       lvwNavigationPane:BorderStyle = UIElementBorderStyle:None
			       lvwNavigationPane:ItemSettings:HideSelection = FALSE
			       lvwContent:Visible = TRUE.

			/*Only allow single selection for the ListView controls*/
			ASSIGN lvwContent:ItemSettings:SelectionType = SelectionType:Single
			       lvwNavigationPane:ItemSettings:SelectionType = SelectionType:SINGLE.

			/*Use XP themed headers for the ListView controls, if we can*/
			IF Infragistics.Win.XPThemes:IsAppThemed THEN
                ASSIGN lvwContent:ViewSettingsDetails:ColumnHeaderStyle = HeaderStyle:XPThemed
				       lvwNavigationPane:ViewSettingsDetails:ColumnHeaderStyle = HeaderStyle:XPThemed.

			grpCustomers:Container:Controls:Add(lvwNavigationPane).

			/*Set up the calendar controls*/
			InitializeSchedule().

			/*Set up the Toolbar*/
			InitializeToolBar(true).

			/*Customize the appearance for the controls on the form
			  based on the current ViewStyle*/
			ViewStyle = UltraExplorerBarViewStyle:Office2007.

			/*Hook events, now that we have initialized everything*/
			HookEvents(true).

			/*Set the initial value for the SelectedGroup to the 'Customers' group.*/
			ultraExplorerBar1:SelectedGroup = grpCustomers.

			/*Start out with the navigation pane initially collapsed*/
			ultraExplorerBar1:NavigationPaneExpandedState = NavigationPaneExpandedState:Collapsed.
		RETURN.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Returns the IconManager instance associated with this form.
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC IconManager IconManager():
	    IF iconManager = ? THEN
	        ASSIGN iconManager = new IconManager(THIS-OBJECT) no-error.

		RETURN iconManager.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Populates the specified UltraListView control with all records
	                 from the customer service
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID PopulateListViewWithCustomers(INPUT listView AS UltraListView, INPUT newView AS UltraListViewStyle):
        DEFINE VARIABLE iconSize          AS INTEGER                    NO-UNDO.
        DEFINE VARIABLE defaultImage      AS Bitmap                     NO-UNDO.
        DEFINE VARIABLE subItemColumn     AS UltraListViewSubItemColumn NO-UNDO.
        DEFINE VARIABLE hQuery            AS HANDLE                     NO-UNDO.
        DEFINE VARIABLE hCustTable        AS HANDLE                     NO-UNDO.
        DEFINE VARIABLE record            AS System.Array               NO-UNDO.
        DEFINE VARIABLE items             AS System.Array               NO-UNDO.
        DEFINE VARIABLE valueListItems    AS System.Array               NO-UNDO.
        DEFINE VARIABLE rowNum            AS INTEGER                    NO-UNDO.
        DEFINE VARIABLE currentItem       AS UltraListViewItem          NO-UNDO.
        DEFINE VARIABLE custList          AS ValueList                  NO-UNDO.

	    IF listView = ? THEN UNDO, THROW NEW Progress.Lang.AppError("Invalid ListView object").

        Cursor:CURRENT = Cursors:WaitCursor.

        custList = NEW ValueList().
		/*Clear the contents of the Items, Groups, and SubItemColumns collections*/
		listView:Groups:Clear().
		listView:Items:Clear().
		listView:SubItemColumns:Clear().

		/*Set the View property to the specified view*/
		listView:View = newView.

		/*Set the SubItemsVisibleByDefault property of the ViewSettingsTiles
		  to true so that the sub-item values are displayed.*/
		listView:ViewSettingsTiles:SubItemsVisibleByDefault = TRUE.

		/*Select the ideal image size for the specified view*/
		iconSize = IconManager:SMALL_IMAGE_SIZE.

		IF newView = UltraListViewStyle:Icons THEN
			iconSize = IconManager:MEDIUM_IMAGE_SIZE.
		ELSE
		IF newView = UltraListViewStyle:Thumbnails OR newView = UltraListViewStyle:Tiles THEN
		   iconSize = IconManager:LARGE_IMAGE_SIZE.

		/*Assign the default image for customers*/
		defaultImage = IconManager:GetBitmap(IconManager:GROUP_CUSTOMERS, iconSize).
		listView:ItemSettings:DefaultImage = defaultImage.

		/*Associate the main column with the 'CompanyName' field*/
		listView:MainColumn:Text = "Name":U.
		listView:MainColumn:DataType = Progress.Util.TypeHelper:GetType("System.String":U).

		/*Add a sub-item column for the contact's name*/
		subItemColumn = listView:SubItemColumns:Add("ContactName":U).
		subItemColumn:Text = "Contact":U.
		subItemColumn:DataType = Progress.Util.TypeHelper:GetType("System.String").

		/*Add a sub-item column for the contact's phone number*/
		subItemColumn = listView:SubItemColumns:Add("Phone":U).
		subItemColumn:Text = "Phone":U.
		subItemColumn:DataType = Progress.Util.TypeHelper:GetType("System.String":U).
        record = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Object"), 2).
        
        /* open a query on customer */
        hQuery = custOrderItemService:openQuery("eCustomer").
        hCustTable = hQuery:get-buffer-handle("eCustomer").
        
        /*Create an array of type UltraListViewItem, with the same capacity
		  as the records are in the table, and add an item for each row.*/
        items = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinListView.UltraListViewItem"), hQuery:NUM-RESULTS).
        valueListItems = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.ValueListItem"), hQuery:NUM-RESULTS).
        
        REPEAT:
            IF NOT hQuery:GET-NEXT(NO-LOCK) THEN LEAVE.
			record:SetValue(hCustTable::Contact, 0).
			record:SetValue(hCustTable::Phone, 1).

            currentItem = new UltraListViewItem(hCustTable::Name, CAST(record, "System.Object[]")).
			items:SetValue(currentItem, rowNum).
			currentItem:Tag = hCustTable::CustNum.
			valueListItems:SetValue(NEW ValueListItem(hCustTable::CustNum, hCustTable::Name), rowNum).
			rowNum = rowNum + 1.
         END. /*REPEAT*/

		 /*Add the array of UltraListViewItems to the control's Items collection*/
 		listView:Items:AddRange(CAST(items, "Infragistics.Win.UltraWinListView.UltraListViewItem[]")).
 		custList:ValueListItems:AddRange(CAST(valueListItems, "ValueListItem[]")).
 		CustomersValueList = custList.

 		FINALLY:
 		    Cursor:CURRENT = Cursors:Default.
 		END FINALLY.
    END METHOD. /*METHOD PRIVATE VOID PopulateListViewWithCustomers*/

	/*------------------------------------------------------------------------------
			Purpose: Initializes the UltraWinSchedule controls/components
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID InitializeSchedule():
        DEFINE VARIABLE totalItems  AS INTEGER NO-UNDO.
        DEFINE VARIABLE currentItem AS INTEGER NO-UNDO.
        DEFINE VARIABLE objectItem  AS ValueListItem NO-UNDO.
  
		/*Add an WinSchedule Owner for each employee so they
		  can each have a separate schedule.*/
		ultraCalendarInfo1:Owners:Clear().
		ultraCalendarInfo1:Owners:UnassignedOwner:Visible = FALSE.
        totalItems = employeeValueList:ValueListItems:Count - 1.

		REPEAT currentItem = 0 TO totalItems:
		  	objectItem = employeeValueList:ValueListItems[currentItem].
			ultraCalendarInfo1:Owners:Add(objectItem:DataValue:ToString(), objectItem:DisplayText).
        END.

		/*Set up the DayView control so that we don't have too
		  many calendars visible.*/
		ultraDayView1:GroupingStyle = DayViewGroupingStyle:OwnerWithinDate.
		ultraDayView1:PreferredInViewColumnCount = 2.
	END METHOD. /*InitializeSchedule*/

	/*------------------------------------------------------------------------------
			Purpose: Initializes the UltraWinToolBarsManager component
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID InitializeToolBar(INPUT useRibbon AS LOGICAL):
	    DEFINE VARIABLE toolBar AS UltraToolbar NO-UNDO.
	    DEFINE VARIABLE tools AS RootToolsCollection NO-UNDO.
	    DEFINE VARIABLE tool AS ButtonTool NO-UNDO.
        DEFINE VARIABLE popupMenuTool AS PopupMenuTool NO-UNDO.
        DEFINE VARIABLE stateButtonTool AS StateButtonTool NO-UNDO.
        DEFINE VARIABLE viewStyleOffice2007 AS PopupMenuTool NO-UNDO.
        DEFINE VARIABLE labelTool AS LabelTool NO-UNDO.
        DEFINE VARIABLE ribbon AS Ribbon NO-UNDO.
        DEFINE VARIABLE mainTab AS RibbonTab NO-UNDO.
        DEFINE VARIABLE calendarGroup AS RibbonGroup NO-UNDO.
        DEFINE VARIABLE dataGroup AS RibbonGroup NO-UNDO.
        DEFINE VARIABLE applicationGroup AS RibbonGroup NO-UNDO.
        DEFINE VARIABLE ribbonTool AS ToolBase NO-UNDO.
        DEFINE VARIABLE leftArea AS ApplicationMenuArea NO-UNDO.
        DEFINE VARIABLE rightArea AS ApplicationMenuArea NO-UNDO.

		toolBar = ultraToolbarsManager1:Toolbars["tools"].
		toolBar:ToolbarsManager:UseLargeImagesOnToolbar = TRUE.
		ultraToolbarsManager1:ShowQuickCustomizeButton = FALSE.
		tools = ultraToolbarsManager1:Tools.

		/*Add the 'Calendar' button*/
		tool = new ButtonTool("Calendar").
		tool:SharedProps:AppearancesLarge:Appearance:Image = IconManager:GetBitmap(IconManager:GROUP_CALENDAR, IconManager:MEDIUM_IMAGE_SIZE).
		tool:SharedProps:AppearancesSmall:Appearance:Image = IconManager:GetBitmap(IconManager:GROUP_CALENDAR, IconManager:SMALL_IMAGE_SIZE).
		tool:SharedProps:ToolTipText = tool:KEY.
		tools:Add(tool).
		toolBar:Tools:AddTool(tool:Key).


		/*Add the 'Customers' button*/
		tool = new ButtonTool("Customers").
		tool:SharedProps:AppearancesLarge:Appearance:Image = IconManager:GetBitmap(IconManager:GROUP_CUSTOMERS, IconManager:MEDIUM_IMAGE_SIZE).
		tool:SharedProps:AppearancesSmall:Appearance:Image = IconManager:GetBitmap(IconManager:GROUP_CUSTOMERS, IconManager:SMALL_IMAGE_SIZE).
		tool:SharedProps:ToolTipText = tool:KEY.
		tools:Add(tool).
		toolBar:Tools:AddTool(tool:Key).

		/*Add the 'Orders' button*/
		tool = new ButtonTool("Orders").
		tool:SharedProps:AppearancesLarge:Appearance:Image = IconManager:GetBitmap(IconManager:GROUP_ORDERS, IconManager:MEDIUM_IMAGE_SIZE).
		tool:SharedProps:AppearancesSmall:Appearance:Image = IconManager:GetBitmap(IconManager:GROUP_ORDERS, IconManager:SMALL_IMAGE_SIZE).
		tool:SharedProps:ToolTipText = tool:KEY.
		tools:Add(tool).
		toolBar:Tools:AddTool(tool:Key).

		/*Add the 'Products' button*/
		tool = new ButtonTool("Products").
		tool:SharedProps:AppearancesLarge:Appearance:Image = IconManager:GetBitmap(IconManager:GROUP_PRODUCTS, IconManager:MEDIUM_IMAGE_SIZE).
		tool:SharedProps:AppearancesSmall:Appearance:Image = IconManager:GetBitmap(IconManager:GROUP_PRODUCTS, IconManager:SMALL_IMAGE_SIZE).
		tool:SharedProps:ToolTipText = tool:KEY.
		tools:Add(tool).
		toolBar:Tools:AddTool(tool:Key).

		/*Add the 'Exit' button*/
		tool = new ButtonTool("AppMenu_Exit").
		tool:SharedProps:AppearancesLarge:Appearance:Image = IconManager:GetBitmap( IconManager:GROUP_EXIT, IconManager:MEDIUM_IMAGE_SIZE).
		tool:SharedProps:AppearancesSmall:Appearance:Image = IconManager:GetBitmap( IconManager:GROUP_EXIT, IconManager:SMALL_IMAGE_SIZE).
		tool:SharedProps:Caption = "Exit".
		tool:SharedProps:ToolTipText = "Exit the application".
		tools:Add(tool).
		toolBar:Tools:AddTool(tool:Key).

		/*Add the 'ViewStyle' state buttons and popup menu*/
		ultraToolbarsManager1:OptionSets:Add(FALSE, "ViewStyle").
		popupMenuTool = new PopupMenuTool("AppMenu_ViewStyle").
		popupMenuTool:SharedProps:AppearancesLarge:Appearance:Image = IconManager:GetBitmap(IconManager:GROUP_VIEW_STYLE, IconManager:MEDIUM_IMAGE_SIZE).
		popupMenuTool:SharedProps:AppearancesSmall:Appearance:Image = IconManager:GetBitmap(IconManager:GROUP_VIEW_STYLE, IconManager:SMALL_IMAGE_SIZE).
		popupMenuTool:SharedProps:Caption = "ViewStyle".
		popupMenuTool:SharedProps:ToolTipText = "Change the ViewStyle".
		tools:Add(popupMenuTool).
		toolBar:Tools:AddTool(popupMenuTool:Key).

		stateButtonTool = new StateButtonTool("ViewStyle_Office2003", "ViewStyle").
		stateButtonTool:MenuDisplayStyle = StateButtonMenuDisplayStyle:DisplayCheckmark.
		stateButtonTool:SharedProps:Caption = "Office2003".
		stateButtonTool:SharedProps:ToolTipText = "Emulates the look and feel of MS 'Office2003' applications".
		stateButtonTool:SharedProps:Tag = UltraExplorerBarViewStyle:Office2003.
		tools:Add(stateButtonTool).
		popupMenuTool:Tools:Add(stateButtonTool).

		stateButtonTool = new StateButtonTool("ViewStyle_VS2005", "ViewStyle").
		stateButtonTool:MenuDisplayStyle = StateButtonMenuDisplayStyle:DisplayCheckmark.
		stateButtonTool:SharedProps:Caption = "VisualStudio2005".
		stateButtonTool:SharedProps:ToolTipText = "Emulates the look and feel of the Visual Studio 2005 IDE".
		stateButtonTool:SharedProps:Tag = UltraExplorerBarViewStyle:VisualStudio2005.
		tools:Add(stateButtonTool).
		popupMenuTool:Tools:Add(stateButtonTool).

		viewStyleOffice2007 = new PopupMenuTool("ViewStyle_Office2007").
		viewStyleOffice2007:SharedProps:Caption = "Office2007".
		viewStyleOffice2007:SharedProps:ToolTipText = "Emulates the look and feel of MS 'Office2007' applications".
		tools:Add(viewStyleOffice2007).
		popupMenuTool:Tools:Add(viewStyleOffice2007).

		stateButtonTool = new StateButtonTool("ViewStyle_Office2007_Blue", "ViewStyle").
		stateButtonTool:MenuDisplayStyle = StateButtonMenuDisplayStyle:DisplayCheckmark.
		stateButtonTool:SharedProps:Caption = "Blue".
		stateButtonTool:SharedProps:ToolTipText = "The 'Blue' Office2007 color scheme".
		stateButtonTool:SharedProps:Tag = Office2007ColorScheme:Blue.
		tools:Add(stateButtonTool).
		viewStyleOffice2007:Tools:Add(stateButtonTool).

		stateButtonTool = new StateButtonTool( "ViewStyle_Office2007_Black", "ViewStyle" ).
		stateButtonTool:MenuDisplayStyle = StateButtonMenuDisplayStyle:DisplayCheckmark.
		stateButtonTool:SharedProps:Caption = "Black".
		stateButtonTool:SharedProps:ToolTipText = "The 'Black' Office2007 color scheme".
		stateButtonTool:SharedProps:Tag = Office2007ColorScheme:Black.
		tools:Add(stateButtonTool).
		viewStyleOffice2007:Tools:Add(stateButtonTool).

		stateButtonTool = new StateButtonTool( "ViewStyle_Office2007_Silver", "ViewStyle" ).
		stateButtonTool:MenuDisplayStyle = StateButtonMenuDisplayStyle:DisplayCheckmark.
		stateButtonTool:SharedProps:Caption = "Silver".
		stateButtonTool:SharedProps:ToolTipText = "The 'Silver' Office2007 color scheme".
		stateButtonTool:SharedProps:Tag = Office2007ColorScheme:Silver.
		tools:Add(stateButtonTool).
		viewStyleOffice2007:Tools:Add(stateButtonTool).

		/*Add the 'About' label tool*/
		labelTool = new LabelTool("AppMenu_About").
		labelTool:SharedProps:Caption = "Collapsible Navigation Pane".
		labelTool:SharedProps:DescriptionOnMenu = "<p style=""text-align:Left;""><span style=""color:#294c7a; font-weight:normal;"">The Collapsible Navigation Pane sample demonstrates the <a href=""www.infragistics.com"">Infragistics</a> WinExplorerBar's collapsible navigation pane feature. As with the navigation pane seen in MS Outlook, the WinExplorerBar's navigation pane can be collapsed to mininimize the amount of real estate it occupies. When in collapsed mode, the contents of the selected group can be displayed on a flyout by clicking the selected group's collapsed content area.</span><br/></p>".
		tools:Add( labelTool ).

		IF useRibbon THEN
        DO:
		    /*Get a reference to the Office2007 ribbon*/
			ribbon = ultraToolbarsManager1:Ribbon.
			ribbon:Tabs:Clear().

			/*Add the 'Main' tab*/
			mainTab = ribbon:Tabs:Add("Main":U).
			mainTab:Caption = "Main".

			/*Add the 'Calendar' group to the 'Main' tab*/
			calendarGroup = mainTab:Groups:Add("Main_Calendar":U).
			calendarGroup:SETTINGS:CollapsedAppearance:Image = IconManager:GetBitmap(IconManager:GROUP_CALENDAR, IconManager:MEDIUM_IMAGE_SIZE).
			calendarGroup:Caption = "Calendar".
			ribbonTool = calendarGroup:Tools:AddTool("Calendar":U).
			ribbonTool:InstanceProps:Caption = ribbonTool:Key.
			ribbonTool:InstanceProps:PreferredSizeOnRibbon = RibbonToolSize:LARGE.

		    /*Add the 'Data' group to the 'Main' tab*/
			dataGroup = mainTab:Groups:Add("Main_Data":U).
			dataGroup:SETTINGS:CollapsedAppearance:Image = IconManager:GetBitmap(IconManager:GROUP_CUSTOMERS, IconManager:MEDIUM_IMAGE_SIZE).
			dataGroup:Caption = "Data".

			/*Add the 'Customers' tool*/
			ribbonTool = dataGroup:Tools:AddTool("Customers":U).
			ribbonTool:InstanceProps:Caption = ribbonTool:Key.
			ribbonTool:InstanceProps:PreferredSizeOnRibbon = RibbonToolSize:LARGE.

			/*Add the 'Orders' tool*/
			ribbonTool = dataGroup:Tools:AddTool("Orders":U).
			ribbonTool:InstanceProps:Caption = ribbonTool:Key.
			ribbonTool:InstanceProps:PreferredSizeOnRibbon = RibbonToolSize:LARGE.

			/*Add the 'Products' tool*/
			ribbonTool = dataGroup:Tools:AddTool("Products":U).
			ribbonTool:InstanceProps:Caption = ribbonTool:Key.
			ribbonTool:InstanceProps:PreferredSizeOnRibbon = RibbonToolSize:LARGE.

			/*Add the 'Application' group to the 'Main' tab*/
			applicationGroup = mainTab:Groups:Add("Main_Application":U).
			applicationGroup:SETTINGS:CollapsedAppearance:Image = IconManager:GetBitmap(IconManager:GROUP_VIEW_STYLE, IconManager:MEDIUM_IMAGE_SIZE).
			applicationGroup:Caption = "Application".

			/*Add the 'ViewStyle' popup menu tool*/
			ribbonTool = applicationGroup:Tools:AddTool("AppMenu_ViewStyle":U).
			ribbonTool:InstanceProps:Caption = "ViewStyle".
			ribbonTool:InstanceProps:PreferredSizeOnRibbon = RibbonToolSize:Normal.

			ribbonTool = applicationGroup:Tools:AddTool("AppMenu_Exit":U).
			ribbonTool:InstanceProps:Caption = "Exit".
			ribbonTool:InstanceProps:PreferredSizeOnRibbon = RibbonToolSize:Normal.

			/*Add the 'Exit' tool to the ApplicationMenu's left area*/
			leftArea = ribbon:ApplicationMenu:ToolAreaLeft.
			leftArea:Tools:AddTool("AppMenu_Exit":U).

			/*Add the 'About' label tool to the right area*/
			rightArea = ribbon:ApplicationMenu:ToolAreaRight.
			rightArea:Tools:AddTool("AppMenu_About":U).

            /*Make the ribbon visible*/
			ribbon:Visible = TRUE.
        END.
    END METHOD. /*InitializeToolBar*/

	/*------------------------------------------------------------------------------
			Purpose: Hooks/unhooks events of interest for the application
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID HookEvents(INPUT hook AS LOGICAL):
		IF hook THEN
        DO:
		    ultraExplorerBar1:SelectedGroupChanging:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_SelectedGroupChanging).
			ultraExplorerBar1:SelectedGroupChanged:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_SelectedGroupChanged).
			ultraExplorerBar1:NavigationPaneFlyoutDisplayed:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_NavigationPaneFlyoutDisplayed).
			lvwNavigationPane:ItemDoubleClick:SUBSCRIBE(THIS-OBJECT:listView_ItemDoubleClick).
			lvwContent:ItemDoubleClick:SUBSCRIBE(THIS-OBJECT:listView_ItemDoubleClick).
			lvwNavigationPane:KeyDown:SUBSCRIBE(THIS-OBJECT:OnContainerControlChildKeyDown).
			ultraMonthViewMulti1:MouseUp:SUBSCRIBE(THIS-OBJECT:ultraMonthViewMulti1_MouseUp).
			ultraMonthViewMulti1:KeyDown:SUBSCRIBE(THIS-OBJECT:OnContainerControlChildKeyDown).
			ultraToolbarsManager1:ToolClick:SUBSCRIBE(THIS-OBJECT:ultraToolbarsManager1_ToolClick).
			ultraCalendarInfo1:AfterSelectedDateRangeChange:SUBSCRIBE(THIS-OBJECT:ultraCalendarInfo1_AfterSelectedDateRangeChange).
			Office2007ColorTable:ColorSchemeChanged:SUBSCRIBE(THIS-OBJECT:OnThemeOrSchemeChanged).
			XPThemes:ThemeChanged:SUBSCRIBE(THIS-OBJECT:OnThemeOrSchemeChanged).
		END.
		ELSE DO:
			ultraExplorerBar1:SelectedGroupChanging:UNSUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_SelectedGroupChanging).
			ultraExplorerBar1:SelectedGroupChanged:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_SelectedGroupChanged).
			ultraExplorerBar1:NavigationPaneFlyoutDisplayed:UNSUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_NavigationPaneFlyoutDisplayed).
			lvwNavigationPane:ItemDoubleClick:UNSUBSCRIBE(THIS-OBJECT:listView_ItemDoubleClick).
			lvwContent:ItemDoubleClick:UNSUBSCRIBE(THIS-OBJECT:listView_ItemDoubleClick).
			lvwNavigationPane:KeyDown:UNSUBSCRIBE(THIS-OBJECT:OnContainerControlChildKeyDown).
			ultraMonthViewMulti1:MouseUp:SUBSCRIBE(THIS-OBJECT:ultraMonthViewMulti1_MouseUp).
			ultraMonthViewMulti1:KeyDown:UNSUBSCRIBE(THIS-OBJECT:OnContainerControlChildKeyDown).
			ultraToolbarsManager1:ToolClick:UNSUBSCRIBE(THIS-OBJECT:ultraToolbarsManager1_ToolClick).
			ultraCalendarInfo1:AfterSelectedDateRangeChange:UNSUBSCRIBE(THIS-OBJECT:ultraCalendarInfo1_AfterSelectedDateRangeChange).
			Office2007ColorTable:ColorSchemeChanged:UNSUBSCRIBE(THIS-OBJECT:OnThemeOrSchemeChanged).
			XPThemes:ThemeChanged:UNSUBSCRIBE(THIS-OBJECT:OnThemeOrSchemeChanged).
		END.

    END METHOD.

    /*------------------------------------------------------------------------------
			Purpose: Populates the employee list property employeeValueList.
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID populateEmployeeList():
        DEFINE VARIABLE valueListItems AS ValueListItem NO-UNDO.
        DEFINE VARIABLE items AS System.Array NO-UNDO.
        DEFINE VARIABLE employeeService AS EmployeeService NO-UNDO.
        DEFINE VARIABLE hDataSet  AS HANDLE NO-UNDO.
        DEFINE VARIABLE hEmpTable AS HANDLE NO-UNDO.
        DEFINE VARIABLE hQuery    AS HANDLE NO-UNDO.
        DEFINE VARIABLE itemOrder AS INTEGER NO-UNDO.

        /*Populate the list only if this is not already created.*/
	    IF employeeValueList = ? THEN
        DO:
           /* Create instance of the employeeService, fetchData and get the ValueList */
           employeeService = NEW EmployeeService().
           employeeService:fetchData().
           employeeValueList = employeeService:ValueList("eEmployee","empNum","LastName").
		END. /*IF employeeValueList = ? THEN*/
    END METHOD. /*METHOD PRIVATE VOID populateEmployeeList*/

    METHOD PRIVATE VOID initializeDataSource():
        custOrderItemService = new CustOrderItemService().
        custOrderItemService:fetchData().
    END METHOD.    
    
    /*------------------------------------------------------------------------------
			Purpose: Handles the ExplorerBar's 'SelectedGroupChanging' event
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID ultraExplorerBar1_SelectedGroupChanging(INPUT sender AS System.Object, INPUT e AS CancelableGroupEventArgs):
        DEFINE VARIABLE groupKey AS CHARACTER NO-UNDO.
		/*Suspend painting for the controls until we are
		  finished repopulating...*/
		ultraDayView1:BeginUpdate().
		ultraExplorerBar1:BeginUpdate().
		lvwContent:BeginUpdate().
		lvwNavigationPane:BeginUpdate().
		ultraMonthViewMulti1:BeginUpdate().

		groupKey = e:GROUP:Key.

		/*Hide the content ListView; also, clear the label text*/
		lvwContent:Groups:Clear().
		lvwContent:Items:Clear().
		lvwContent:SubItemColumns:Clear().
		lvwContent:ResetView().
		lvwContent:Visible = FALSE.
		lblContent:Text = "".

    	CASE groupKey:
    	    WHEN "Calendar":U THEN
            DO:
			    lvwContent:Visible = FALSE.
				ultraDayView1:Visible = TRUE.
				ultraCalendarInfo1_AfterSelectedDateRangeChange(ultraCalendarInfo1, System.EventArgs:Empty).
            END.
			WHEN "Customers":U THEN
            DO:
			    PopulateListViewWithCustomers(lvwNavigationPane, UltraListViewStyle:Tiles).
				e:GROUP:Container:Controls:Add(lvwNavigationPane).
				lvwContent:Visible = TRUE.
				lvwNavigationPane:Tag = "Customers" /*DataTables:Customers*/.
				ultraDayView1:Visible = FALSE.
            END.
			WHEN "Orders":U THEN
            DO:
			    PopulateListViewWithOrders(lvwNavigationPane, UltraListViewStyle:List).
				e:Group:Container:Controls:Add(lvwNavigationPane).
				lvwContent:Visible = TRUE.
				lvwNavigationPane:Tag = "Orders".
				ultraDayView1:Visible = FALSE.
            END.
		END CASE.	

        FINALLY:
            /*Resume painting for the controls*/
			ultraDayView1:EndUpdate(TRUE).
			ultraExplorerBar1:EndUpdate(TRUE).
			lvwContent:EndUpdate(TRUE).
			lvwNavigationPane:EndUpdate(TRUE).
			ultraMonthViewMulti1:EndUpdate(TRUE).
        END FINALLY.
    END METHOD. /*METHOD PRIVATE VOID ultraExplorerBar1_SelectedGroupChanging*/

	/*------------------------------------------------------------------------------
			Purpose: Handles the ExplorerBar's 'SelectedGroupChanged' event
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID ultraExplorerBar1_SelectedGroupChanged(INPUT sender AS System.Object, INPUT e AS GroupEventArgs):
		/*If any of the "data groups" are selected, execute the action
          associated with the navigation ListView's ActiveItem (provided
		  it is not null), so that something appears in the content ListView.*/
		IF e:Group NE ? AND e:GROUP:Key NE "Calendar" THEN
		    IF lvwNavigationPane:Items:Count > 0 THEN
            DO:
    			lvwNavigationPane:PerformAction(UltraListViewAction:ActivateFirst, false, false ).
				OnListViewItemAction(lvwNavigationPane:ActiveItem, TRUE).
            END.
    END METHOD. /*ultraExplorerBar1_SelectedGroupChanged*/

	/*------------------------------------------------------------------------------
			Purpose: Handles the ExplorerBar's 'NavigationPaneFlyoutDisplayed' event
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID ultraExplorerBar1_NavigationPaneFlyoutDisplayed(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
	    DEFINE VARIABLE explorerBar AS UltraExplorerBar NO-UNDO.
	    DEFINE VARIABLE selectedGroup AS UltraExplorerBarGroup NO-UNDO.
	    DEFINE VARIABLE groupKey AS CHARACTER NO-UNDO.

        ASSIGN explorerBar  = CAST(sender,UltraExplorerBar)
		       selectedGroup = explorerBar:SelectedGroup
               groupKey      = IF selectedGroup NE ? THEN selectedGroup:Key ELSE "".

		/*Since the navigation pane is hosting a container control and
		  as such cannot make assumptions about which child control, if any,
		  should receive the input focus when the flyout appears, we have
		  to manually select the control.*/
		CASE groupKey:
            WHEN "Customers":U OR WHEN "Orders" THEN
                lvwNavigationPane:Select().

            WHEN "Calendar":U THEN
				ultraMonthViewMulti1:Select().
		END CASE.
	END METHOD. /*ultraExplorerBar1_NavigationPaneFlyoutDisplayed*/

	/*------------------------------------------------------------------------------
			Purpose: Handles the 'ItemDoubleClick' event for the ListView controls
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID listView_ItemDoubleClick(INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinListView.ItemDoubleClickEventArgs):
        DEFINE VARIABLE listView AS UltraListView NO-UNDO.
        DEFINE VARIABLE selectedGroup AS UltraExplorerBarGroup NO-UNDO.
        DEFINE VARIABLE groupKey AS CHARACTER NO-UNDO.
        DEFINE VARIABLE itemKey AS CHARACTER NO-UNDO.   

		listView = CAST(sender,UltraListView).
			IF sender:Equals(lvwNavigationPane) THEN
            DO:
			    selectedGroup = ultraExplorerBar1:SelectedGroup.
				groupKey = IF selectedGroup NE ? THEN selectedGroup:Key ELSE "".

				IF groupKey = "Customers":U OR groupKey = "Orders":U THEN
                    OnListViewItemAction(e:Item, TRUE).
			END.
			ELSE DO:
			    /*If the item that was double-clicked represents an order,
				  and resides in the content ListView, display the order details
				  for that order, similarly to how Windows Explorer displays a
				  folder's contents when the folder is double-clicked.*/
				itemKey = e:ITEM:Key.
				IF itemKey NE "" THEN
    				PopulateListViewWithOrderDetails(lvwContent, UltraListViewStyle:Details, INT(itemKey)).
			END.
    END METHOD. /*listView_ItemDoubleClick*/

	/*------------------------------------------------------------------------------
			Purpose: Called when an item is selected by the end user, or to close
	                 the navigation pane flyout
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID OnListViewItemAction(INPUT newItem AS Infragistics.Win.UltraWinListView.UltraListViewItem, INPUT commit AS LOGICAL):
	    DEFINE VARIABLE cur AS CLASS System.Windows.Forms.CURSOR NO-UNDO.

		Cursor:CURRENT = Cursors:WaitCursor.

	    IF ultraExplorerBar1:SelectedGroup:key = "Orders":U THEN
		    PopulateListViewWithOrderDetails(lvwContent, UltraListViewStyle:Details, INT(newItem:key)).
        ELSE
			PopulateListViewWithOrdersHelper(lvwContent, UltraListViewStyle:Tiles, newItem:Tag).

		IF ultraExplorerBar1:IsNavigationPaneFlyoutVisible THEN
		    ultraExplorerBar1:CloseNavigationPaneFlyout(commit = false).

		FINALLY:
				Cursor:CURRENT = Cursors:Default.
        END FINALLY.
    END METHOD. /*OnListViewItemAction*/

	/*------------------------------------------------------------------------------
			Purpose: Handles the 'KeyDown' event for the controls which are
	                 children of the ExplorerBar's Container Control
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID OnContainerControlChildKeyDown(INPUT sender AS System.Object, INPUT e AS KeyEventArgs):
        DEFINE VARIABLE listView AS UltraListView NO-UNDO.

	    IF sender:GetType():Equals(Progress.Util.TypeHelper:GetType("UltraMonthViewMulti")) THEN
        DO:
		    /*Since the selected date range changes on navigational keystrokes,
			  there is really no distinction between the Enter and Escape keys,
			  but we will set the 'cancel' parameter of the CloseNavigationPaneFlyout
			  appropriately nonetheless, so that the 'Canceled' parameter of the
			  'NavigationPaneFlyoutClosed' event accurately reflects the result of
			  the flyout session.*/
			IF e:KeyData:Equals(System.Windows.Forms.Keys:Enter) OR e:KeyData:Equals(System.Windows.Forms.KEYS:ESCAPE) THEN
					ultraExplorerBar1:CloseNavigationPaneFlyout(e:KeyData = System.Windows.Forms.Keys:Escape).
			RETURN.
		END.

		/*If the Enter or Escape key was pressed on one of the ListView controls,
		  call the 'OnListViewItemAction' method to handle the selection of the item.*/
        listView = CAST(sender,UltraListView).

		CASE e:KeyData:
    		WHEN System.Windows.Forms.Keys:Enter THEN
			    IF listView:ActiveItem NE ? THEN
			        OnListViewItemAction(listView:ActiveItem, TRUE).
			WHEN System.Windows.Forms.Keys:ESCAPE THEN
				OnListViewItemAction(?, FALSE).
		END CASE.

	END METHOD. /*OnContainerControlChildKeyDown*/

	/*------------------------------------------------------------------------------
			Purpose: Handles the UltraMonthViewMulti's 'MouseUp' event
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID ultraMonthViewMulti1_MouseUp(INPUT sender AS System.Object, INPUT e AS MouseEventArgs):
        /*The ExplorerBar's navigation pane has no way of knowing it
		  should close when the group is hosting a control, so call
		  the 'CloseNavigationPaneFlyout' method to close it programmatically.*/
		IF ultraExplorerBar1:IsNavigationPaneFlyoutVisible THEN
		    ultraExplorerBar1:CloseNavigationPaneFlyout(FALSE).
    END METHOD. /*ultraMonthViewMulti1_MouseUp*/

	/*------------------------------------------------------------------------------
			Purpose: Handles the UltraToolbarsManager's 'ToolClick' event
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID ultraToolbarsManager1_ToolClick(INPUT sender AS System.Object, INPUT e AS ToolClickEventArgs):
        DEFINE VARIABLE currentKey AS CHARACTER NO-UNDO.

	    /*If the tool is a shortcut to one of the ExplorerBar groups, select the associated group.*/
		currentKey = e:Tool:Key.
			IF ultraExplorerBar1:Groups:Exists(currentKey) THEN
			    ultraExplorerBar1:Groups[currentKey]:Selected = TRUE.
			ELSE DO:
				CASE currentKey:
				    /*If the 'Products' button was clicked, display the Products table*/
				    WHEN "Products":U THEN
					DO:
    					SESSION:SET-WAIT-STATE("GENERAL":U).
						PopulateListViewWithProducts(lvwContent, UltraListViewStyle:Details).
						SESSION:SET-WAIT-STATE("":U).
                    END.
					/*If the 'Exit' button was clicked, close the application*/
					WHEN "AppMenu_Exit":u THEN
					    Close().

					/*If one of the 'ViewStyle' buttons was clicked, change the view accordingly*/
					WHEN "ViewStyle_Office2003":U       OR
					WHEN "ViewStyle_VS2005":U           OR
					WHEN "ViewStyle_Office2007_Blue":U  OR
					WHEN "ViewStyle_Office2007_Black":U OR
					WHEN "ViewStyle_Office2007_Silver":U THEN
					DO:
						IF TYPE-OF(e:Tool:SharedProps:Tag, Infragistics.Win.Office2007ColorScheme) THEN
                        DO:
						    Office2007ColorTable:ColorScheme = CAST(e:Tool:SharedProps:Tag, Office2007ColorScheme).					
							ViewStyle = UltraExplorerBarViewStyle:Office2007.
						END.
						ELSE
						    IF TYPE-OF(e:Tool:SharedProps:Tag, UltraExplorerBarViewStyle) THEN
						        ViewStyle = CAST(e:Tool:SharedProps:Tag, UltraExplorerBarViewStyle).
					END.
			    END CASE.	
			END.
	END METHOD. /*ultraToolbarsManager1_ToolClick*/

	/*------------------------------------------------------------------------------
			Purpose: Populates the specified UltraListView control with all records
	                 from the Northwind database's 'Products' table
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID PopulateListViewWithProducts(INPUT listView AS UltraListView, INPUT currentView AS UltraListViewStyle):
        DEFINE VARIABLE iconSize       AS INTEGER                    NO-UNDO.
        DEFINE VARIABLE defaultImage   AS Bitmap                     NO-UNDO.
        DEFINE VARIABLE subItemColumn  AS UltraListViewSubItemColumn NO-UNDO.
        DEFINE VARIABLE category       AS UltraListViewGroup         NO-UNDO.
        DEFINE VARIABLE record         AS System.Array               NO-UNDO.
        DEFINE VARIABLE currentItem    AS UltraListViewItem          NO-UNDO.
        DEFINE VARIABLE hQuery         AS HANDLE                     NO-UNDO.
        DEFINE VARIABLE hItemTable     AS HANDLE                     NO-UNDO.
        DEFINE VARIABLE oldCategory    AS CHARACTER                  NO-UNDO.
        DEFINE VARIABLE currencyFormat AS CHARACTER                  NO-UNDO.
        DEFINE VARIABLE checkEditor    AS CheckEditor                NO-UNDO.

	    IF listView = ? THEN UNDO, THROW NEW Progress.Lang.AppError("Invalid listView object").

        /*Clear the contents of the Items, Groups, and SubItemColumns collections*/
		listView:Groups:Clear().
		listView:Items:Clear().
		listView:SubItemColumns:Clear().

        /*Set the View property to the specified view*/
		listView:View = currentView.

        /*Select the ideal image size for the specified view*/
		iconSize = IconManager:SMALL_IMAGE_SIZE.

		IF currentView = UltraListViewStyle:Icons THEN
		    iconSize = IconManager:MEDIUM_IMAGE_SIZE.
		ELSE
		    IF currentView = UltraListViewStyle:Thumbnails OR currentView = UltraListViewStyle:Tiles THEN
				iconSize = IconManager:LARGE_IMAGE_SIZE.

		/*Set the SubItemsVisibleByDefault property of the ViewSettingsTiles
		  to true so that the sub-item values are displayed.*/
		listView:ViewSettingsTiles:SubItemsVisibleByDefault = TRUE.

		/*Set the FullRowSelect property of the ViewSettingsDetails
		  to true so that the entire item appears selected*/
		listView:ViewSettingsDetails:FullRowSelect = TRUE.

        /*Since most of the columns display a numeric value, set
		  the text alignment for the SubItemAppearance to right*/
		listView:ViewSettingsDetails:SubItemAppearance:TextHAlign = HAlign:RIGHT.

		/*Assign the default image for order details*/
		defaultImage = IconManager:GetBitmap(IconManager:GROUP_PRODUCTS, iconSize).
		listView:ItemSettings:DefaultImage = defaultImage.

		/*Add a sub-item column for the quantity per unit*/
		subItemColumn = listView:SubItemColumns:Add("Allocated":U).
		subItemColumn:Text = "Allocated":U.
		subItemColumn:DataType = Progress.Util.TypeHelper:GetType("System.Int64":U).

		/*Add a sub-item column for the unit price...since the value
		  should be expressed as a currency, use the Format property
		  to display it as such.*/
		subItemColumn = listView:SubItemColumns:Add("UnitPrice").
		subItemColumn:Text = "Price".
		subItemColumn:DataType = Progress.Util.TypeHelper:GetType("System.Decimal").
		currencyFormat = EditorWithMask:CalcDefaultCurrencyMask( System.Globalization.CultureInfo:CurrentCulture, -1, 1, '0' ).
		currencyFormat = REPLACE(currencyFormat, "n", "#" ).
		currencyFormat = SUBSTRING(currencyFormat, 1, LENGTH(currencyFormat) - 1) + "00".
		subItemColumn:Format = currencyFormat.
		subItemColumn:Width = 75.

		/*Add a sub-item column for the units in stock*/
		subItemColumn = listView:SubItemColumns:Add("UnitsInStock").
		subItemColumn:Text = "Units (On Hand)".
		subItemColumn:DataType = Progress.Util.TypeHelper:GetType("System.Int32").

		/*Add a sub-item column for the units on order*/
		subItemColumn = listView:SubItemColumns:Add("UnitsOnOrder").
		subItemColumn:Text = "Units (On Order)".
		subItemColumn:DataType = Progress.Util.TypeHelper:GetType("System.Int32").

		/*Add a sub-item column for discontinued...since the field
		  is boolean, we'll call it "available", and flip the value
		  so end users don't see the check and think that it is in stock.*/
		subItemColumn = listView:SubItemColumns:Add("Available").
		subItemColumn:Text = "Available?".
		subItemColumn:DataType = Progress.Util.TypeHelper:GetType("System.Boolean").

		/*Use a CheckEditor to display the value, and align it middle center*/
		checkEditor = new CheckEditor().
		checkEditor:CheckAlign = ContentAlignment:MiddleCenter.
		subItemColumn:Editor = checkEditor.

        record = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Object"), 5).
        hQuery = custOrderItemService:openQuery("eItem","FOR EACH eItem NO-LOCK BY eItem.category1").
        hItemTable = hQuery:get-buffer-handle("eItem").
        
        /*Navigate the query and store the employee records in the ValueList object.*/
        REPEAT:
            IF NOT hQuery:GET-NEXT(NO-LOCK) THEN LEAVE.
            IF oldCategory NE hItemTable::category1 THEN
            DO:
                ASSIGN category    = listView:Groups:Add(hItemTable::category1,hItemTable::category1)
                       oldCategory = hItemTable::category1.
            END.

            record:SetValue(Progress.Util.CastUtil:ToInt32(hItemTable::Allocated), 0).
            record:SetValue(Progress.Util.CastUtil:ToDecimal(hItemTable::Price), 1).
            record:SetValue(Progress.Util.CastUtil:ToDecimal(hItemTable::OnHand), 2).
            record:SetValue(Progress.Util.CastUtil:ToDecimal(hItemTable::OnOrder), 3).
            record:SetValue(hItemTable::OnHand > hItemTable::Allocated , 4).
            currentItem = NEW Infragistics.Win.UltraWinListView.UltraListViewItem(hItemTable::ItemName, CAST(record, "System.Object[]")).
            listView:Items:Add(currentItem).
            currentItem:GROUP = category.
        END.

        hQuery:QUERY-CLOSE().
      
		/*Associate the main column with the product name*/
		listView:MainColumn:Text = "Product".
		listView:MainColumn:DataType = Progress.Util.TypeHelper:GetType("System.String":U).

    	UpdateLabelText( "Products", ?,? ).
		listView:Tag = "Products".
    END METHOD. /*PopulateListViewWithProducts*/

    /*------------------------------------------------------------------------------
			Purpose: Handle's the UltraCalendarInfo's 'AfterSelectedDateRangeChange'
			         event
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID ultraCalendarInfo1_AfterSelectedDateRangeChange(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
        DEFINE VARIABLE labelText          AS CHARACTER                               NO-UNDO.
        DEFINE VARIABLE selectedDays       AS SelectedDateRanges                      NO-UNDO.
        DEFINE VARIABLE calendarDay        AS Infragistics.Win.UltraWinSchedule.Day   NO-UNDO.

		selectedDays = ultraCalendarInfo1:SelectedDateRanges.
		IF selectedDays:SelectedDaysCount = 1 THEN
        DO:
            ASSIGN calendarDay = CAST(selectedDays:GetItem(0), Infragistics.Win.UltraWinSchedule.DateRange):FirstDay
                   labelText   = GetFormatedDate(calendarDay).
		END.
	    ELSE
			IF selectedDays:SelectedDaysCount > 1 THEN
                ASSIGN calendarDay = CAST(selectedDays:GetItem(0), Infragistics.Win.UltraWinSchedule.DateRange):FirstDay
                       labelText   = GetFormatedDate(calendarDay)
                       calendarDay = CAST(selectedDays:GetItem(0), Infragistics.Win.UltraWinSchedule.DateRange):LastDay
			           labelText   = labelText + " - " + GetFormatedDate(calendarDay).
			ELSE
			    ASSIGN calendarDay = ultraCalendarInfo1:ActiveDay
			           labelText   = GetFormatedDate(calendarDay).

			UpdateLabelText(labelText, ?, ?).

	END METHOD. /*METHOD PRIVATE VOID ultraCalendarInfo1_AfterSelectedDateRangeChange*/

    /*------------------------------------------------------------------------------
			Purpose: Returns a formated string for a date specified as parameter as
			         the type of Infragistics.Win.UltraWinSchedule.Day.
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE CHARACTER GetFormatedDate(INPUT dateToFormat AS Infragistics.Win.UltraWinSchedule.Day):
        DEFINE VARIABLE dateTimeInfoFormat AS DateTimeFormatInfo NO-UNDO.
        dateTimeInfoFormat = NEW DateTimeFormatInfo().
        RETURN dateToFormat:DayOfWeek:LongDescriptionResolved + ", " +
			   dateTimeInfoFormat:GetMonthName(MONTH(dateToFormat:Date)) + " " +
			   STRING(DAY(dateToFormat:date)) + " " +
			   STRING(YEAR(dateToFormat:date)).
    END METHOD. /*GetFormatedDate*/

	/*------------------------------------------------------------------------------
			Purpose: Udates the Text property of the content label.
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID UpdateLabelText(INPUT prefix AS CHARACTER, INPUT vl AS ValueList, INPUT id AS System.Object):
        DEFINE VARIABLE valueListText AS CHARACTER  NO-UNDO.
        DEFINE VARIABLE labelText     AS CHARACTER  NO-UNDO.
        DEFINE VARIABLE valueList     AS IValueList NO-UNDO.
        DEFINE VARIABLE unused        AS INTEGER    NO-UNDO.

		IF id NE ? THEN
        DO:
		    valueList = vl.
			unused = -1.
			valueListText = valueList:GetText(id, INPUT-OUTPUT unused).
			IF valueListText NE ? THEN
			   valueListText = " (" + valueListText + ")".
		END.

		labelText = prefix + valueListText.
        lblContent:Text = labelText.
    END METHOD. /*UpdateLabelText*/

    /*Handles the XPTheme class' ThemeChanged event and the Office2007ColorTable class' ColorSchemeChanged event.*/
	METHOD PRIVATE VOID OnThemeOrSchemeChanged(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
	    ViewStyle = ultraExplorerBar1:ViewStyle.
	END.

    /*Populates the specified UltraListView control with all records
	  from the 'Order' table*/
	METHOD PRIVATE VOID PopulateListViewWithOrders(INPUT listView AS UltraListView, INPUT newView AS UltraListViewStyle):
        PopulateListViewWithOrdersHelper(listView, newView, ?).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Populates the specified UltraListView control with the Orders
			         for the selected customer.
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID PopulateListViewWithOrdersHelper(INPUT listView AS UltraListView, INPUT newView AS UltraListViewStyle, INPUT id AS System.Object):
	    DEFINE VARIABLE iconSize              AS INTEGER                    NO-UNDO.
	    DEFINE VARIABLE defaultImage          AS Bitmap                     NO-UNDO.
	    DEFINE VARIABLE whereCriteria         AS CHARACTER                  NO-UNDO.
	    DEFINE VARIABLE valueListForLabelText AS ValueList                  NO-UNDO.
	    DEFINE VARIABLE hOrderTable           AS HANDLE                     NO-UNDO.
        DEFINE VARIABLE hQuery                AS HANDLE                     NO-UNDO.
        DEFINE VARIABLE items                 AS System.Array               NO-UNDO.
        DEFINE VARIABLE record                AS System.Array               NO-UNDO.
        DEFINE VARIABLE subItemColumn         AS UltraListViewSubItemColumn NO-UNDO.
        DEFINE VARIABLE currentRecord         AS UltraListViewItem          NO-UNDO.
        DEFINE VARIABLE rowNum                AS INTEGER                    NO-UNDO.
       
	    IF newView = ? THEN UNDO, THROW NEW Progress.Lang.AppError("Invalid ListView object").

        Cursor:CURRENT = Cursors:WaitCursor.

        /*Clear the contents of the Items, Groups, and SubItemColumns collections*/
		listView:Groups:Clear().
		listView:Items:Clear().
		listView:SubItemColumns:Clear().

		/*Set the View property to the specified view*/
		listView:View = newView.

		/*Set the SubItemsVisibleByDefault property of the ViewSettingsTiles
		  to true so that the sub-item values are displayed.*/
		listView:ViewSettingsTiles:SubItemsVisibleByDefault = TRUE.

        /*If the view is 'List', and we are displaying all orders,
		  make the list appear as a ListBox.*/
		IF id = ? AND EnumHelper:AreEqual(newView,UltraListViewStyle:List) THEN
		    listView:ViewSettingsList:MultiColumn = FALSE.

		/*Select the ideal image size for the specified view*/
		iconSize = IconManager:SMALL_IMAGE_SIZE.

		IF EnumHelper:AreEqual(newView,UltraListViewStyle:Icons) THEN
		    iconSize = IconManager:MEDIUM_IMAGE_SIZE.
		ELSE
		    IF EnumHelper:AreEqual(newView,UltraListViewStyle:Thumbnails) OR newView:Equals(UltraListViewStyle:Tiles) THEN
			    iconSize = IconManager:LARGE_IMAGE_SIZE.

		/*Assign the default image for orders*/
		defaultImage = IconManager:GetBitmap(IconManager:GROUP_ORDERS, iconSize).
		listView:ItemSettings:DefaultImage = defaultImage.

		/*Get the orders for the specified customer, or all of them if no id was specified. Also, get
		  a reference to the appropriate ValueList with which we can get the name of the customer or employee; we'll use
		  this later to update the label text.*/
		IF id NE ? THEN
            valueListForLabelText = CustomersValueList.

		/*Associate the main column with the 'OrderID' field*/
		listView:MainColumn:Text = "OrderNum":U.
		listView:MainColumn:DataType = Progress.Util.TypeHelper:GetType("System.Int32":U).

		/*Add a sub-item column for the order date*/
		subItemColumn = listView:SubItemColumns:Add("OrderDate":U).
		subItemColumn:Text = "Date":U.
		subItemColumn:DataType = Progress.Util.TypeHelper:GetType("System.DateTime":U).

	    /*Add a sub-item column for the customer ID*/
		subItemColumn = listView:SubItemColumns:Add("CustNum":U).
		subItemColumn:Text = "Customer".
		subItemColumn:DataType = Progress.Util.TypeHelper:GetType("System.String":U).
        /*Assign the CustomersValueList to the ValueList property,
		  so that we can display the name of the customer instead
		  of the ID number.*/
		subItemColumn:ValueList = CustomersValueList.
				
	    /*Add a sub-item column for the customer ID*/
		subItemColumn = listView:SubItemColumns:Add("OrderStatus":U).
		subItemColumn:Text = "Status".
		subItemColumn:DataType = Progress.Util.TypeHelper:GetType("System.String":U).

		subItemColumn:VisibleInDetailsView = DefaultableBoolean:FALSE.
		subItemColumn:VisibleInTilesView = DefaultableBoolean:False.
        hQuery = GetOrderQuery(unbox(id)).
        hOrderTable = hQuery:get-buffer-handle("eOrder").      
        record = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Object"), 3).
        items = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinListView.UltraListViewItem"), hQuery:NUM-RESULTS).
        REPEAT:
            IF NOT hQuery:GET-NEXT(NO-LOCK) THEN LEAVE.
            record:SetValue(hOrderTable::OrderDate, 0).
            record:SetValue(hOrderTable::CustNum, 1).
            record:SetValue(hOrderTable::OrderStatus, 2).
            currentRecord = NEW UltraListViewItem(hOrderTable::ordernum, CAST(record, "System.Object[]")).
            currentRecord:Tag = STRING(hOrderTable::ordernum).
            currentRecord:KEY = STRING(hOrderTable::ordernum).
            items:SetValue(currentRecord, rowNum).
            rowNum = rowNum + 1.
        END.
 
        listView:Items:AddRange(CAST(items, "Infragistics.Win.UltraWinListView.UltraListViewItem[]")).

        FINALLY:
            Cursor:CURRENT = Cursors:Default.
        END FINALLY.
    END METHOD. /*METHOD PRIVATE VOID PopulateListViewWithOrdersHelper*/

	/*------------------------------------------------------------------------------
			Purpose: Populates the specified UltraListView control with all records
		             from the Northwind database's 'OrderDetails' table associated
		             with the specified orderId
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID PopulateListViewWithOrderDetails(INPUT listView AS UltraListView, INPUT currentView AS UltraListViewStyle, INPUT orderId AS INTEGER):
        DEFINE VARIABLE defaultImage    AS Bitmap                     NO-UNDO.
        DEFINE VARIABLE hOrderLineTable AS HANDLE                     NO-UNDO.
        DEFINE VARIABLE hQuery          AS HANDLE                     NO-UNDO.
        DEFINE VARIABLE items           AS System.Array               NO-UNDO.
        DEFINE VARIABLE record          AS System.Array               NO-UNDO.
        DEFINE VARIABLE currentRecord   AS UltraListViewItem          NO-UNDO.
        DEFINE VARIABLE rowNum          AS INTEGER                    NO-UNDO.
        DEFINE VARIABLE iconSize        AS INTEGER                    NO-UNDO.
        DEFINE VARIABLE subItemColumn   AS UltraListViewSubItemColumn NO-UNDO.
        DEFINE VARIABLE currencyFormat  AS CHARACTER                  NO-UNDO.

		IF listView = ? THEN UNDO, THROW NEW Progress.Lang.AppError("Invalid ListView object").

		/*Clear the contents of the Items, Groups, and SubItemColumns collections*/
		listView:Groups:Clear().
		listView:Items:Clear().
		listView:SubItemColumns:Clear().

		/*Set the View property to the specified view*/
		listView:View = currentView.

        /*Select the ideal image size for the specified view*/
		iconSize = IconManager:SMALL_IMAGE_SIZE.

		IF currentView = UltraListViewStyle:Icons THEN
		    iconSize = IconManager:MEDIUM_IMAGE_SIZE.
		ELSE
		    IF currentView = UltraListViewStyle:Thumbnails OR currentView = UltraListViewStyle:Tiles THEN
				iconSize = IconManager:LARGE_IMAGE_SIZE.

		/*Set the SubItemsVisibleByDefault property of the ViewSettingsTiles
		  to true so that the sub-item values are displayed.*/
		listView:ViewSettingsTiles:SubItemsVisibleByDefault = TRUE.

		/*Set the FullRowSelect property of the ViewSettingsDetails
		  to true so that the entire item appears selected*/
		listView:ViewSettingsDetails:FullRowSelect = TRUE.

		/*Since most of the columns display a numeric value, set
		  the text alignment for the SubItemAppearance to right*/
		listView:ViewSettingsDetails:SubItemAppearance:TextHAlign = HAlign:Right.

		/*Assign the default image for order details*/
		defaultImage = IconManager:GetBitmap(IconManager:GROUP_ORDER_DETAILS, iconSize).
		listView:ItemSettings:DefaultImage = defaultImage.
		
		listView:MainColumn:Text = "Item".
		listView:MainColumn:DataType = Progress.Util.TypeHelper:GetType("System.Int32":U).
	    listView:MainColumn:ValueList = ProductsValueList.

		/*Add a sub-item column for the unit price...since the value
		  should be expressed as a currency, use the Format property to display it as such.*/
		subItemColumn = listView:SubItemColumns:Add("UnitPrice":U).
		subItemColumn:Text = "Price".
		subItemColumn:DataType = Progress.Util.TypeHelper:GetType("System.Decimal":U).
		currencyFormat = EditorWithMask:CalcDefaultCurrencyMask( System.Globalization.CultureInfo:CurrentCulture, -1, 1, '0' ).
		currencyFormat = REPLACE(currencyFormat, "n", "#" ).
		currencyFormat = SUBSTRING(currencyFormat, 1, LENGTH(currencyFormat) - 1) + "00".
		subItemColumn:Format = currencyFormat.
		subItemColumn:Width = 75.

		/*Add a sub-item column for the quantity*/
		subItemColumn = listView:SubItemColumns:Add("Qty":U).
		subItemColumn:Text = "Quantity".
		subItemColumn:DataType = Progress.Util.TypeHelper:GetType("System.Int32":U).
		subItemColumn:Width = 75.

	    /*Add a sub-item column for the discount...since the value
		  should be expressed as a percentage, use the Format property to display it as such.*/
		subItemColumn = listView:SubItemColumns:Add("Discount":U).
		subItemColumn:Text = "Discount".
		subItemColumn:DataType = Progress.Util.TypeHelper:GetType("System.Int32":U).
		subItemColumn:Format = "#" + System.Globalization.CultureInfo:CurrentCulture:NumberFormat:PercentSymbol.
		subItemColumn:NullText = "None".
		subItemColumn:Width = 75.

        hQuery = custOrderItemService:openQuery("eOrderLine",
                                  "PRESELECT EACH eOrderLine WHERE eOrderLine.Ordernum = ":U + STRING(OrderId)) .
        hOrderLineTable = hQuery:get-buffer-handle("eOrderLine").

        record = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Object"), 3).
        items = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinListView.UltraListViewItem"), hQuery:NUM-RESULTS).

        REPEAT:
            IF NOT hQuery:GET-NEXT(NO-LOCK) THEN LEAVE.
            record:SetValue(hOrderLineTable::Price, 0).
            record:SetValue(hOrderLineTable::Qty, 1).
            record:SetValue(hOrderLineTable::Discount, 2).
            currentRecord = NEW UltraListViewItem(hOrderLineTable::itemnum, CAST(record, "System.Object[]")).
            currentRecord:Tag = STRING(hOrderLineTable::itemnum).
            items:SetValue(currentRecord, rowNum).
            rowNum = rowNum + 1.
        END.
        
        listView:Items:AddRange(CAST(items, "Infragistics.Win.UltraWinListView.UltraListViewItem[]")).

		/*If this is the content ListView, update the label text;
		  also set the Tag to the appropriate DataTables constant
		  to provide a context of what the ListView contains.*/
		IF listView:Equals(lvwContent) THEN
        DO:
            UpdateLabelText("Order# " + STRING(orderID),?,?).
			listView:Tag = "OrderDetails":U.
        END.
    END METHOD. /*METHOD PRIVATE VOID PopulateListViewWithOrderDetails*/
    
    /* open a query on eOrder */             
    method private handle GetOrderQuery(custNum as integer): 
        define variable queryHandle as handle no-undo.
        if custNum = ? then
 	        queryHandle = custOrderItemService:OpenQuery("eOrder").
        else
           queryHandle = custOrderItemService:OpenQuery("eOrder",
           "PRESELECT EACH eOrder WHERE eOrder.custnum = " + string(custNum)).
        return queryHandle.   
    end method.
END CLASS.