 
 /*------------------------------------------------------------------------
    File        : ListViewUserControl
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Tue Jul 22 10:53:10 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.UserControl.

CLASS DockManager.BasicFeatures.ListViewUserControl INHERITS UserControl   : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.

	DEFINE PRIVATE VARIABLE ultraListView1 AS Infragistics.Win.UltraWinListView.UltraListView NO-UNDO.

	DEFINE PRIVATE VARIABLE ultraGroupBox1 AS Infragistics.Win.Misc.UltraGroupBox NO-UNDO.


		
	CONSTRUCTOR PUBLIC ListViewUserControl (  ):
		
		SUPER().
		InitializeComponent ( ).

	END CONSTRUCTOR.

	METHOD PRIVATE VOID InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar0 AS Infragistics.Win.UltraWinListView.UltraListViewSubItem EXTENT 1 NO-UNDO.
		arrayvar0[1] = NEW Infragistics.Win.UltraWinListView.UltraListViewSubItem("Smith", ?).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraListViewItem1 AS Infragistics.Win.UltraWinListView.UltraListViewItem NO-UNDO.
		ultraListViewItem1 = NEW Infragistics.Win.UltraWinListView.UltraListViewItem("John", arrayvar0, ?).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar1 AS Infragistics.Win.UltraWinListView.UltraListViewSubItem EXTENT 1 NO-UNDO.
		arrayvar1[1] = NEW Infragistics.Win.UltraWinListView.UltraListViewSubItem("Smith", ?).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraListViewItem2 AS Infragistics.Win.UltraWinListView.UltraListViewItem NO-UNDO.
		ultraListViewItem2 = NEW Infragistics.Win.UltraWinListView.UltraListViewItem("Caty", arrayvar1, ?).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar2 AS Infragistics.Win.UltraWinListView.UltraListViewSubItem EXTENT 1 NO-UNDO.
		arrayvar2[1] = NEW Infragistics.Win.UltraWinListView.UltraListViewSubItem("Smith", ?).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraListViewItem3 AS Infragistics.Win.UltraWinListView.UltraListViewItem NO-UNDO.
		ultraListViewItem3 = NEW Infragistics.Win.UltraWinListView.UltraListViewItem("Mary", arrayvar2, ?).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraListViewSubItemColumn1 AS Infragistics.Win.UltraWinListView.UltraListViewSubItemColumn NO-UNDO.
		ultraListViewSubItemColumn1 = NEW Infragistics.Win.UltraWinListView.UltraListViewSubItemColumn("LastName").
		THIS-OBJECT:ultraListView1 = NEW Infragistics.Win.UltraWinListView.UltraListView().
		THIS-OBJECT:ultraGroupBox1 = NEW Infragistics.Win.Misc.UltraGroupBox().
		CAST(THIS-OBJECT:ultraListView1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraGroupBox1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraGroupBox1:SuspendLayout().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* ultraListView1 */
		/*  */
		THIS-OBJECT:ultraListView1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar3 AS Infragistics.Win.UltraWinListView.UltraListViewItem EXTENT 3 NO-UNDO.
		arrayvar3[1] = ultraListViewItem1.
		arrayvar3[2] = ultraListViewItem2.
		arrayvar3[3] = ultraListViewItem3.
		THIS-OBJECT:ultraListView1:Items:AddRange(arrayvar3).
		THIS-OBJECT:ultraListView1:Location = NEW System.Drawing.Point(6, 12).
		THIS-OBJECT:ultraListView1:MainColumn:Key = "FirstName".
		THIS-OBJECT:ultraListView1:MainColumn:Text = "First Name".
		THIS-OBJECT:ultraListView1:Name = "ultraListView1".
		THIS-OBJECT:ultraListView1:Size = NEW System.Drawing.Size(203, 175).
		ultraListViewSubItemColumn1:Key = "LastName".
		ultraListViewSubItemColumn1:Text = "Last Name".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar4 AS Infragistics.Win.UltraWinListView.UltraListViewSubItemColumn EXTENT 1 NO-UNDO.
		arrayvar4[1] = ultraListViewSubItemColumn1.
		THIS-OBJECT:ultraListView1:SubItemColumns:AddRange(arrayvar4).
		THIS-OBJECT:ultraListView1:TabIndex = 0.
		THIS-OBJECT:ultraListView1:Text = "ultraListView1".
		/*  */
		/* ultraGroupBox1 */
		/*  */
		THIS-OBJECT:ultraGroupBox1:BorderStyle = Infragistics.Win.Misc.GroupBoxBorderStyle:RectangularDoubleSolid.
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:ultraListView1).
		THIS-OBJECT:ultraGroupBox1:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:ultraGroupBox1:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:ultraGroupBox1:Name = "ultraGroupBox1".
		THIS-OBJECT:ultraGroupBox1:Size = NEW System.Drawing.Size(216, 194).
		THIS-OBJECT:ultraGroupBox1:TabIndex = 1.
		/*  */
		/* ListViewUserControl */
		/*  */
		THIS-OBJECT:AutoScaleDimensions = NEW System.Drawing.SizeF(6, 13).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraGroupBox1).
		THIS-OBJECT:Name = "ListViewUserControl".
		THIS-OBJECT:Size = NEW System.Drawing.Size(216, 194).
		CAST(THIS-OBJECT:ultraListView1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraGroupBox1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraGroupBox1:ResumeLayout(FALSE).
		THIS-OBJECT:ResumeLayout(FALSE).

	END METHOD.

	DESTRUCTOR PUBLIC ListViewUserControl ( ):

		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.

	END DESTRUCTOR.

END CLASS.