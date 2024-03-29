  
 /*------------------------------------------------------------------------
    File        : Form1
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Fri Jul 18 16:29:12 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

USING Infragistics.Win.Misc.*.
USING Infragistics.Win.UltraWinDock.*.
USING DockManager.Coding.*. 

CLASS DockManager.Coding.Form1 INHERITS Form   : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.
 

	DEFINE PRIVATE VARIABLE dockForm AS DockingForm NO-UNDO.

	DEFINE PRIVATE VARIABLE ultraLabel1 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel2 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel3 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.

	DEFINE PRIVATE VARIABLE ultraGroupBox1 AS Infragistics.Win.Misc.UltraGroupBox NO-UNDO.

	DEFINE PRIVATE VARIABLE btCreateControl AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE cbControlType AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE cbDockPosition AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE cbGroupStyle AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.

    DEFINE VARIABLE controlNumber AS INTEGER NO-UNDO.

	CONSTRUCTOR PUBLIC Form1 (  ):
		SUPER().
		InitializeComponent ( ).
	END CONSTRUCTOR.

	METHOD PRIVATE VOID InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

		THIS-OBJECT:ultraGroupBox1 = NEW Infragistics.Win.Misc.UltraGroupBox().
		THIS-OBJECT:btCreateControl = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:ultraLabel3 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel2 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel1 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:cbGroupStyle = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:cbDockPosition = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:cbControlType = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		CAST(THIS-OBJECT:ultraGroupBox1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraGroupBox1:SuspendLayout().
		CAST(THIS-OBJECT:cbGroupStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:cbDockPosition, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:cbControlType, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* ultraGroupBox1 */
		/*  */
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:btCreateControl).
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:ultraLabel3).
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:ultraLabel2).
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:ultraLabel1).
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:cbGroupStyle).
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:cbDockPosition).
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:cbControlType).
		THIS-OBJECT:ultraGroupBox1:Location = NEW System.Drawing.Point(12, 12).
		THIS-OBJECT:ultraGroupBox1:Name = "ultraGroupBox1".
		THIS-OBJECT:ultraGroupBox1:Size = NEW System.Drawing.Size(274, 188).
		THIS-OBJECT:ultraGroupBox1:TabIndex = 7.
		THIS-OBJECT:ultraGroupBox1:Text = "Docking Options".
		/*  */
		/* btCreateControl */
		/*  */
		THIS-OBJECT:btCreateControl:Location = NEW System.Drawing.Point(62, 148).
		THIS-OBJECT:btCreateControl:Name = "btCreateControl".
		THIS-OBJECT:btCreateControl:Size = NEW System.Drawing.Size(144, 23).
		THIS-OBJECT:btCreateControl:TabIndex = 13.
		THIS-OBJECT:btCreateControl:Text = "Create Control".
		THIS-OBJECT:btCreateControl:Click:SUBSCRIBE(THIS-OBJECT:btCreateControl_Click).
		/*  */
		/* ultraLabel3 */
		/*  */
		THIS-OBJECT:ultraLabel3:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:ultraLabel3:Location = NEW System.Drawing.Point(12, 100).
		THIS-OBJECT:ultraLabel3:Name = "ultraLabel3".
		THIS-OBJECT:ultraLabel3:Size = NEW System.Drawing.Size(100, 23).
		THIS-OBJECT:ultraLabel3:TabIndex = 12.
		THIS-OBJECT:ultraLabel3:Text = "Grouping style".
		/*  */
		/* ultraLabel2 */
		/*  */
		THIS-OBJECT:ultraLabel2:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:ultraLabel2:Location = NEW System.Drawing.Point(12, 65).
		THIS-OBJECT:ultraLabel2:Name = "ultraLabel2".
		THIS-OBJECT:ultraLabel2:Size = NEW System.Drawing.Size(100, 23).
		THIS-OBJECT:ultraLabel2:TabIndex = 11.
		THIS-OBJECT:ultraLabel2:Text = "Docking position".
		/*  */
		/* ultraLabel1 */
		/*  */
		THIS-OBJECT:ultraLabel1:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:ultraLabel1:Location = NEW System.Drawing.Point(12, 27).
		THIS-OBJECT:ultraLabel1:Name = "ultraLabel1".
		THIS-OBJECT:ultraLabel1:Size = NEW System.Drawing.Size(100, 23).
		THIS-OBJECT:ultraLabel1:TabIndex = 10.
		THIS-OBJECT:ultraLabel1:Text = "Control to create".
		/*  */
		/* cbGroupStyle */
		/*  */
		THIS-OBJECT:cbGroupStyle:Location = NEW System.Drawing.Point(114, 102).
		THIS-OBJECT:cbGroupStyle:Name = "cbGroupStyle".
		THIS-OBJECT:cbGroupStyle:Size = NEW System.Drawing.Size(144, 21).
		THIS-OBJECT:cbGroupStyle:SyncWithCurrencyManager = false.
		THIS-OBJECT:cbGroupStyle:TabIndex = 9.
		/*  */
		/* cbDockPosition */
		/*  */
		THIS-OBJECT:cbDockPosition:Location = NEW System.Drawing.Point(114, 61).
		THIS-OBJECT:cbDockPosition:Name = "cbDockPosition".
		THIS-OBJECT:cbDockPosition:Size = NEW System.Drawing.Size(144, 21).
		THIS-OBJECT:cbDockPosition:SyncWithCurrencyManager = false.
		THIS-OBJECT:cbDockPosition:TabIndex = 8.
		/*  */
		/* cbControlType */
		/*  */
		THIS-OBJECT:cbControlType:Location = NEW System.Drawing.Point(114, 23).
		THIS-OBJECT:cbControlType:Name = "cbControlType".
		THIS-OBJECT:cbControlType:Size = NEW System.Drawing.Size(144, 21).
		THIS-OBJECT:cbControlType:SyncWithCurrencyManager = false.
		THIS-OBJECT:cbControlType:TabIndex = 7.
		/*  */
		/* Form1 */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(296, 210).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraGroupBox1).
		THIS-OBJECT:Name = "Form1".
		THIS-OBJECT:Text = "Form1".
		THIS-OBJECT:Load:SUBSCRIBE(THIS-OBJECT:Form1_Load).
		CAST(THIS-OBJECT:ultraGroupBox1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraGroupBox1:ResumeLayout(false).
		THIS-OBJECT:ultraGroupBox1:PerformLayout().
		CAST(THIS-OBJECT:cbGroupStyle, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:cbDockPosition, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:cbControlType, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ResumeLayout(false).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID Form1_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    PopulateCombos().
		showDockingForm().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID PopulateCombos():
        cbControlType:Items:Add("DockManager.Coding.TreeUserControl","TreeUserControl").
        cbControlType:Items:Add("DockManager.Coding.ListViewUserControl","ListViewUserControl").
        cbControlType:SelectedIndex = 0.

        cbDockPosition:Items:Add("DockedBottom","DockedBottom").
        cbDockPosition:Items:Add("DockedLeft","DockedLeft").
        cbDockPosition:Items:Add("DockedRight","DockedRight").
        cbDockPosition:Items:Add("DockedTop","DockedTop").
        cbDockPosition:Items:Add("Floating","Floating").
        cbDockPosition:SelectedIndex = 0.

        cbGroupStyle:Items:Add(Infragistics.Win.UltraWinDock.ChildPaneStyle:HorizontalSplit).
        cbGroupStyle:Items:Add(Infragistics.Win.UltraWinDock.ChildPaneStyle:VerticalSplit).
        cbGroupStyle:Items:Add(Infragistics.Win.UltraWinDock.ChildPaneStyle:TabGroup).
        cbGroupStyle:Items:Add(Infragistics.Win.UltraWinDock.ChildPaneStyle:SlidingGroup).
        cbGroupStyle:SelectedIndex = 0.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID btCreateControl_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE style    AS Infragistics.Win.UltraWinDock.ChildPaneStyle NO-UNDO.

        controlNumber = controlNumber + 1.
        ASSIGN style = CAST(cbGroupStyle:SelectedItem:DataValue,Infragistics.Win.UltraWinDock.ChildPaneStyle).

        IF dockForm:IsDisposed THEN
        DO:
            dockForm:Dispose().
            showDockingForm().
        END. 

        dockForm:CreateDockingControl(UNBOX(cbControlType:SelectedItem:DataValue), STRING(cbDockPosition:SelectedItem), style, controlNumber).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID showDockingForm(  ):
        dockForm = NEW DockingForm().
		dockForm:Show().
	END METHOD.

	DESTRUCTOR PUBLIC Form1 ( ):
		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.
	END DESTRUCTOR.
	
END CLASS.


