 
 /*------------------------------------------------------------------------
    File        : DockingForm
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Fri Jul 18 16:53:51 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

USING Infragistics.Win.Misc.*.
USING Infragistics.Win.UltraWinDock.*.

CLASS DockManager.Coding.DockingForm INHERITS Form   : 

	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.

	DEFINE PRIVATE VARIABLE ultraDockManager1 AS Infragistics.Win.UltraWinDock.UltraDockManager NO-UNDO.
	DEFINE PRIVATE VARIABLE m_DockingFormAutoHideControl AS Infragistics.Win.UltraWinDock.AutoHideControl NO-UNDO.
	DEFINE PRIVATE VARIABLE m_DockingFormUnpinnedTabAreaTop AS Infragistics.Win.UltraWinDock.UnpinnedTabArea NO-UNDO.
	DEFINE PRIVATE VARIABLE m_DockingFormUnpinnedTabAreaBottom AS Infragistics.Win.UltraWinDock.UnpinnedTabArea NO-UNDO.
	DEFINE PRIVATE VARIABLE m_DockingFormUnpinnedTabAreaLeft AS Infragistics.Win.UltraWinDock.UnpinnedTabArea NO-UNDO.
	DEFINE PRIVATE VARIABLE m_DockingFormUnpinnedTabAreaRight AS Infragistics.Win.UltraWinDock.UnpinnedTabArea NO-UNDO.

    DEFINE PRIVATE VARIABLE dockAreaPaneLeft     AS Infragistics.Win.UltraWinDock.DockAreaPane NO-UNDO.
    DEFINE PRIVATE VARIABLE dockAreaPaneRight    AS Infragistics.Win.UltraWinDock.DockAreaPane NO-UNDO.
    DEFINE PRIVATE VARIABLE dockAreaPaneTop      AS Infragistics.Win.UltraWinDock.DockAreaPane NO-UNDO.
    DEFINE PRIVATE VARIABLE dockAreaPaneBottom   AS Infragistics.Win.UltraWinDock.DockAreaPane NO-UNDO.
    DEFINE PRIVATE VARIABLE dockAreaPaneFloating AS Infragistics.Win.UltraWinDock.DockAreaPane NO-UNDO.

    DEFINE PRIVATE VARIABLE dockGroupPaneLeft     AS Infragistics.Win.UltraWinDock.DockableGroupPane   NO-UNDO.
    DEFINE PRIVATE VARIABLE dockGroupPaneRight    AS Infragistics.Win.UltraWinDock.DockableGroupPane   NO-UNDO.
    DEFINE PRIVATE VARIABLE dockGroupPaneTop      AS Infragistics.Win.UltraWinDock.DockableGroupPane   NO-UNDO.
    DEFINE PRIVATE VARIABLE dockGroupPaneBottom   AS Infragistics.Win.UltraWinDock.DockableGroupPane   NO-UNDO.
    DEFINE PRIVATE VARIABLE dockGroupPaneFloating AS Infragistics.Win.UltraWinDock.DockableGroupPane   NO-UNDO.

	CONSTRUCTOR PUBLIC DockingForm (  ):
		SUPER().
		InitializeComponent ( ).
	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC DockingForm ( ):
		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.
	END DESTRUCTOR.

	METHOD PRIVATE VOID InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

		THIS-OBJECT:components = NEW System.ComponentModel.Container().
		THIS-OBJECT:ultraDockManager1 = NEW Infragistics.Win.UltraWinDock.UltraDockManager(THIS-OBJECT:components).
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaLeft = NEW Infragistics.Win.UltraWinDock.UnpinnedTabArea().
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaRight = NEW Infragistics.Win.UltraWinDock.UnpinnedTabArea().
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaTop = NEW Infragistics.Win.UltraWinDock.UnpinnedTabArea().
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaBottom = NEW Infragistics.Win.UltraWinDock.UnpinnedTabArea().
		THIS-OBJECT:m_DockingFormAutoHideControl = NEW Infragistics.Win.UltraWinDock.AutoHideControl().
		CAST(THIS-OBJECT:ultraDockManager1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* ultraDockManager1 */
		/*  */
		THIS-OBJECT:ultraDockManager1:HostControl = THIS-OBJECT.
		THIS-OBJECT:ultraDockManager1:BeforeDockChange:SUBSCRIBE(THIS-OBJECT:ultraDockManager1_BeforeDockChange).
		/*  */
		/* m_DockingFormUnpinnedTabAreaLeft */
		/*  */
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaLeft:Dock = System.Windows.Forms.DockStyle:Left.
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaLeft:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaLeft:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaLeft:Name = "m_DockingFormUnpinnedTabAreaLeft".
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaLeft:Owner = THIS-OBJECT:ultraDockManager1.
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaLeft:Size = NEW System.Drawing.Size(0, 348).
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaLeft:TabIndex = 0.
		/*  */
		/* m_DockingFormUnpinnedTabAreaRight */
		/*  */
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaRight:Dock = System.Windows.Forms.DockStyle:Right.
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaRight:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaRight:Location = NEW System.Drawing.Point(546, 0).
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaRight:Name = "m_DockingFormUnpinnedTabAreaRight".
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaRight:Owner = THIS-OBJECT:ultraDockManager1.
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaRight:Size = NEW System.Drawing.Size(0, 348).
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaRight:TabIndex = 1.
		/*  */
		/* m_DockingFormUnpinnedTabAreaTop */
		/*  */
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaTop:Dock = System.Windows.Forms.DockStyle:Top.
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaTop:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaTop:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaTop:Name = "m_DockingFormUnpinnedTabAreaTop".
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaTop:Owner = THIS-OBJECT:ultraDockManager1.
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaTop:Size = NEW System.Drawing.Size(546, 0).
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaTop:TabIndex = 2.
		/*  */
		/* m_DockingFormUnpinnedTabAreaBottom */
		/*  */
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaBottom:Dock = System.Windows.Forms.DockStyle:Bottom.
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaBottom:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaBottom:Location = NEW System.Drawing.Point(0, 348).
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaBottom:Name = "m_DockingFormUnpinnedTabAreaBottom".
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaBottom:Owner = THIS-OBJECT:ultraDockManager1.
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaBottom:Size = NEW System.Drawing.Size(546, 0).
		THIS-OBJECT:m_DockingFormUnpinnedTabAreaBottom:TabIndex = 3.
		/*  */
		/* m_DockingFormAutoHideControl */
		/*  */
		THIS-OBJECT:m_DockingFormAutoHideControl:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:m_DockingFormAutoHideControl:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:m_DockingFormAutoHideControl:Name = "m_DockingFormAutoHideControl".
		THIS-OBJECT:m_DockingFormAutoHideControl:Owner = THIS-OBJECT:ultraDockManager1.
		THIS-OBJECT:m_DockingFormAutoHideControl:Size = NEW System.Drawing.Size(0, 0).
		THIS-OBJECT:m_DockingFormAutoHideControl:TabIndex = 4.
		/*  */
		/* DockingForm */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(546, 348).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:m_DockingFormAutoHideControl).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:m_DockingFormUnpinnedTabAreaTop).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:m_DockingFormUnpinnedTabAreaBottom).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:m_DockingFormUnpinnedTabAreaLeft).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:m_DockingFormUnpinnedTabAreaRight).
		THIS-OBJECT:Name = "DockingForm".
		THIS-OBJECT:Text = "DockingForm".
		THIS-OBJECT:Load:SUBSCRIBE(THIS-OBJECT:DockingForm_Load).
		CAST(THIS-OBJECT:ultraDockManager1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ResumeLayout(FALSE).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC VOID CreateDockingControl(INPUT controlType AS CHARACTER, INPUT location AS CHARACTER, INPUT style AS Infragistics.Win.UltraWinDock.ChildPaneStyle, INPUT controlNumber AS INTEGER):
        DEFINE VARIABLE dControlPane AS DockableControlPane          NO-UNDO.
        DEFINE VARIABLE dAreaPane    AS DockAreaPane                 NO-UNDO.
        DEFINE VARIABLE dGroupPane   AS DockableGroupPane            NO-UNDO.
        DEFINE VARIABLE newControl   AS Progress.Windows.UserControl NO-UNDO.

        SuspendLayout().
        /* controlType is a full name reference of the class (control) to be created. That allow us to use
          DYNAMIC-NEW to create the control without having to use CASE and CAST in order to create the 
          control. The drawback of this approach is that you loose early binding and type checking */
        newControl = DYNAMIC-NEW controlType().
        newControl:Name = SUBSTRING(controlType, R-INDEX(controlType,".") + 1) + "_" + STRING(controlNumber).

        /*Create the DockableControlPane that hosts the new control.*/
        dControlPane = NEW DockableControlPane(newControl:name, newControl:Name, newControl).

        /*Gets the appropiate DockAreaPane and DockableGroupPane according to the location in which
          the control is going to be docked.*/
        CASE location:
            WHEN "DockedLeft"     THEN
                ASSIGN dAreaPane  = dockAreaPaneLeft
                       dGroupPane = dockGroupPaneLeft.
            WHEN "DockedRight"    THEN
                ASSIGN dAreaPane  = dockAreaPaneRight
                       dGroupPane = dockGroupPaneRight.
            WHEN "DockedTop"      THEN
                ASSIGN dAreaPane  = dockAreaPaneTop
                       dGroupPane = dockGroupPaneTop.
            WHEN "DockedBottom"   THEN
            DO:
                ASSIGN dAreaPane  = dockAreaPaneBottom.
                       dGroupPane = dockGroupPaneBottom.
            END.
            WHEN "Floating" THEN
                ASSIGN dAreaPane  = dockAreaPaneFloating
                       dGroupPane = dockGroupPaneFloating.
        END CASE.

        /*Sets the grouping style*/
        dGroupPane:ChildPaneStyle = style.

        /*Add the new control to the grouping pane*/
        dGroupPane:Panes:Add(dControlPane).

        ResumeLayout().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID DockingForm_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    this-object:size = NEW System.Drawing.Size(NEW System.Drawing.Point(600,600)).
	    dockAreaPaneLeft     = NEW DockAreaPane(DockedLocation:DockedLeft).
		dockAreaPaneRight    = NEW DockAreaPane(DockedLocation:DockedRight).
		dockAreaPaneTop      = NEW DockAreaPane(DockedLocation:DockedTop).
		dockAreaPaneBottom   = NEW DockAreaPane(DockedLocation:DockedBottom).
		dockAreaPaneFloating = NEW DockAreaPane(DockedLocation:Floating).
		dockGroupPaneLeft     = NEW DockableGroupPane().
		dockGroupPaneRight    = NEW DockableGroupPane().
		dockGroupPaneTop      = NEW DockableGroupPane().
		dockGroupPaneBottom   = NEW DockableGroupPane().
		dockGroupPaneFloating = NEW DockableGroupPane().

        dockAreaPaneLeft:Panes:Add(dockGroupPaneLeft).
        dockAreaPaneRight:Panes:Add(dockGroupPaneRight).
        dockAreaPaneTop:Panes:Add(dockGroupPaneTop).
        dockAreaPaneBottom:Panes:Add(dockGroupPaneBottom).
        dockAreaPaneFloating:Panes:Add(dockGroupPaneFloating).

        dockAreaPaneFloating:SIZE = NEW System.Drawing.Size(NEW System.Drawing.Point(300,300)).
        dockAreaPaneBottom:SIZE = NEW System.Drawing.Size(NEW System.Drawing.Point(150,150)).
        dockAreaPaneTop:size = NEW System.Drawing.Size(NEW System.Drawing.Point(150,150)).
		ultraDockManager1:DockAreas:Add(dockAreaPaneLeft).
		ultraDockManager1:DockAreas:Add(dockAreaPaneRight).
		ultraDockManager1:DockAreas:Add(dockAreaPaneTop).
		ultraDockManager1:DockAreas:Add(dockAreaPaneBottom).
		ultraDockManager1:DockAreas:Add(dockAreaPaneFloating).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Avoid moving controls in the form.
			Notes: There is a bug in the Infragistics control that after a control
			       is moved to another dock area, then more controls
			       cannot be added to the form.
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraDockManager1_BeforeDockChange( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinDock.BeforeDockChangeEventArgs ):
		MESSAGE "This feature is not enabled for this sample."
        VIEW-AS ALERT-BOX.
	END METHOD.
END CLASS.