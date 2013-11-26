
 /*------------------------------------------------------------------------
    File        : BasicProperties
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Fri Apr 25 17:59:25 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/
USING Progress.Lang.*.
USING Progress.Windows.Form.

USING System.Windows.Forms.*.
USING System.Windows.Forms.ListBox.*.
USING Infragistics.Shared.*.
USING Infragistics.Win.*.
USING Infragistics.Win.UltraWinEditors.*.
USING Infragistics.Win.UltraWinExplorerBar.*.

using System.*.
using System.Collections.*.
using System.ComponentModel.*.
using System.Drawing.*.
using System.Drawing.Design.*.
using System.Reflection.*.
using System.Runtime.InteropServices.*.

using WinExplorerBar.BasicFeatures.*.

CLASS WinExplorerBar.BasicFeatures.BasicProperties INHERITS Form   : 
	DEFINE PRIVATE VARIABLE coStyle AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.
	DEFINE PRIVATE VARIABLE label18 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE tabPage1 AS System.Windows.Forms.TabPage NO-UNDO.
	DEFINE PRIVATE VARIABLE chkShowExpansionIndicator AS System.Windows.Forms.CheckBox NO-UNDO.
	DEFINE PRIVATE VARIABLE toolTip AS System.Windows.Forms.ToolTip NO-UNDO.
	DEFINE PRIVATE VARIABLE pnlPropertyGrids AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE panel5 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE pgItemSettings AS System.Windows.Forms.PropertyGrid NO-UNDO.
	DEFINE PRIVATE VARIABLE label5 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE splitter2 AS System.Windows.Forms.Splitter NO-UNDO.
	DEFINE PRIVATE VARIABLE panel4 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE label4 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE pgGroupSettings AS System.Windows.Forms.PropertyGrid NO-UNDO.
	DEFINE PRIVATE VARIABLE label3 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label2 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label21 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE coGroupStyle AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE label9 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label11 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE spinColumnsSpanned AS System.Windows.Forms.NumericUpDown NO-UNDO.
	DEFINE PRIVATE VARIABLE tbGroupSpacing AS System.Windows.Forms.TrackBar NO-UNDO.
	DEFINE PRIVATE VARIABLE groupBox1 AS System.Windows.Forms.GroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE tbLeftMargin AS System.Windows.Forms.TrackBar NO-UNDO.
	DEFINE PRIVATE VARIABLE cmdResetMarginsToDefaults AS System.Windows.Forms.Button NO-UNDO.
	DEFINE PRIVATE VARIABLE lblMarginSizerInner AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE coMargins AS System.Windows.Forms.ComboBox NO-UNDO.
	DEFINE PRIVATE VARIABLE lblTopMargin AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE lblBottomMargin AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE lblLeftMargin AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE lblRightMargin AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE tbBottomMargin AS System.Windows.Forms.TrackBar NO-UNDO.
	DEFINE PRIVATE VARIABLE tbRightMargin AS System.Windows.Forms.TrackBar NO-UNDO.
	DEFINE PRIVATE VARIABLE tbTopMargin AS System.Windows.Forms.TrackBar NO-UNDO.
	DEFINE PRIVATE VARIABLE label20 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label16 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE cmdAddGroup AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE tbColumnSpacing AS System.Windows.Forms.TrackBar NO-UNDO.
	DEFINE PRIVATE VARIABLE groupBox3 AS System.Windows.Forms.GroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE label19 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE pgGroup AS System.Windows.Forms.PropertyGrid NO-UNDO.
	DEFINE PRIVATE VARIABLE label7 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label8 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE columnHeader4 AS System.Windows.Forms.ColumnHeader NO-UNDO.
	DEFINE PRIVATE VARIABLE panel2 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE pictureBox1 AS System.Windows.Forms.PictureBox NO-UNDO.
	DEFINE PRIVATE VARIABLE label1 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE columnHeader3 AS System.Windows.Forms.ColumnHeader NO-UNDO.
	DEFINE PRIVATE VARIABLE columnHeader2 AS System.Windows.Forms.ColumnHeader NO-UNDO.
	DEFINE PRIVATE VARIABLE columnHeader1 AS System.Windows.Forms.ColumnHeader NO-UNDO.
	DEFINE PRIVATE VARIABLE lvEventLog AS System.Windows.Forms.ListView NO-UNDO.
	DEFINE PRIVATE VARIABLE liEvents AS System.Windows.Forms.CheckedListBox NO-UNDO.
	DEFINE PRIVATE VARIABLE tabPage4 AS System.Windows.Forms.TabPage NO-UNDO.
	DEFINE PRIVATE VARIABLE cmdClearEventLog AS System.Windows.Forms.Button NO-UNDO.
	DEFINE PRIVATE VARIABLE spinColumnCount AS System.Windows.Forms.NumericUpDown NO-UNDO.
	DEFINE PRIVATE VARIABLE label17 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE groupBox2 AS System.Windows.Forms.GroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExplorerBar1 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBar NO-UNDO.
	DEFINE PRIVATE VARIABLE splitter1 AS System.Windows.Forms.Splitter NO-UNDO.
	DEFINE PRIVATE VARIABLE tabControl1 AS System.Windows.Forms.TabControl NO-UNDO.
	DEFINE PRIVATE VARIABLE tabPage2 AS System.Windows.Forms.TabPage NO-UNDO.
	DEFINE PRIVATE VARIABLE pnlItems AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE lblItems AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE pgItem AS System.Windows.Forms.PropertyGrid NO-UNDO.
	DEFINE PRIVATE VARIABLE label10 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE splitter4 AS System.Windows.Forms.Splitter NO-UNDO.
	DEFINE PRIVATE VARIABLE pnlGroups AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE label6 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE tabPage3 AS System.Windows.Forms.TabPage NO-UNDO.
	DEFINE PRIVATE VARIABLE coViewStyle AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE coAcceptFocus AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE chSupportThemes AS Infragistics.Win.UltraWinEditors.UltraCheckEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE coUseLargeGroupHeaderImages AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE coGroups AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE coItems AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE cmdRemoveGroup AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE cmdRemoveItem AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE cmdAddItem AS Infragistics.Win.Misc.UltraButton NO-UNDO.

	DEFINE PRIVATE VARIABLE coGroups2 AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
  	CONSTRUCTOR PUBLIC BasicProperties (  ):

		SUPER().
		InitializeComponent ( ).
		InitializeLookBehaviorControls().
		InitializeGroupsItemsControls().
		coMargins:SelectedIndex = 0.
		LoadCancelableEventsList().
	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC BasicProperties ( ):

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
		DEFINE VARIABLE ultraExplorerBarGroup1 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup NO-UNDO.
		ultraExplorerBarGroup1 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem1 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem1 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem2 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem2 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem3 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem3 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance1 AS Infragistics.Win.Appearance NO-UNDO.
		appearance1 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE resources AS System.Resources.ResXResourceSet NO-UNDO.
		resources = Progress.Util.ResourceHelper:Load("WinExplorerBar/BasicFeatures/BasicProperties.resx", PROPATH).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance2 AS Infragistics.Win.Appearance NO-UNDO.
		appearance2 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarGroup2 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup NO-UNDO.
		ultraExplorerBarGroup2 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem4 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem4 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem5 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem5 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem6 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem6 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem7 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem7 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance3 AS Infragistics.Win.Appearance NO-UNDO.
		appearance3 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance4 AS Infragistics.Win.Appearance NO-UNDO.
		appearance4 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarGroup3 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup NO-UNDO.
		ultraExplorerBarGroup3 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem8 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem8 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem9 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem9 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem10 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem10 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance5 AS Infragistics.Win.Appearance NO-UNDO.
		appearance5 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance6 AS Infragistics.Win.Appearance NO-UNDO.
		appearance6 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarGroup4 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup NO-UNDO.
		ultraExplorerBarGroup4 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem11 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem11 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem12 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem12 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance7 AS Infragistics.Win.Appearance NO-UNDO.
		appearance7 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance8 AS Infragistics.Win.Appearance NO-UNDO.
		appearance8 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarGroup5 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup NO-UNDO.
		ultraExplorerBarGroup5 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem13 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem13 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem14 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem14 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarItem15 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem NO-UNDO.
		ultraExplorerBarItem15 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance9 AS Infragistics.Win.Appearance NO-UNDO.
		appearance9 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance10 AS Infragistics.Win.Appearance NO-UNDO.
		appearance10 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance11 AS Infragistics.Win.Appearance NO-UNDO.
		appearance11 = NEW Infragistics.Win.Appearance().
		label18 = NEW System.Windows.Forms.Label().
		tabPage1 = NEW System.Windows.Forms.TabPage().
		coUseLargeGroupHeaderImages = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		chSupportThemes = NEW Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		coAcceptFocus = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		coViewStyle = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		coStyle = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		chkShowExpansionIndicator = NEW System.Windows.Forms.CheckBox().
		pnlPropertyGrids = NEW System.Windows.Forms.Panel().
		panel5 = NEW System.Windows.Forms.Panel().
		pgItemSettings = NEW System.Windows.Forms.PropertyGrid().
		ultraExplorerBar1 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBar().
		label5 = NEW System.Windows.Forms.Label().
		splitter2 = NEW System.Windows.Forms.Splitter().
		panel4 = NEW System.Windows.Forms.Panel().
		label4 = NEW System.Windows.Forms.Label().
		pgGroupSettings = NEW System.Windows.Forms.PropertyGrid().
		label3 = NEW System.Windows.Forms.Label().
		label2 = NEW System.Windows.Forms.Label().
		label21 = NEW System.Windows.Forms.Label().
		coGroupStyle = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		label9 = NEW System.Windows.Forms.Label().
		label11 = NEW System.Windows.Forms.Label().
		spinColumnsSpanned = NEW System.Windows.Forms.NumericUpDown().
		tbGroupSpacing = NEW System.Windows.Forms.TrackBar().
		groupBox1 = NEW System.Windows.Forms.GroupBox().
		tbLeftMargin = NEW System.Windows.Forms.TrackBar().
		cmdResetMarginsToDefaults = NEW System.Windows.Forms.Button().
		lblMarginSizerInner = NEW System.Windows.Forms.Label().
		coMargins = NEW System.Windows.Forms.ComboBox().
		lblTopMargin = NEW System.Windows.Forms.Label().
		lblBottomMargin = NEW System.Windows.Forms.Label().
		lblLeftMargin = NEW System.Windows.Forms.Label().
		lblRightMargin = NEW System.Windows.Forms.Label().
		tbBottomMargin = NEW System.Windows.Forms.TrackBar().
		tbRightMargin = NEW System.Windows.Forms.TrackBar().
		tbTopMargin = NEW System.Windows.Forms.TrackBar().
		label20 = NEW System.Windows.Forms.Label().
		label16 = NEW System.Windows.Forms.Label().
		tbColumnSpacing = NEW System.Windows.Forms.TrackBar().
		groupBox3 = NEW System.Windows.Forms.GroupBox().
		coGroups2 = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		label19 = NEW System.Windows.Forms.Label().
		pgGroup = NEW System.Windows.Forms.PropertyGrid().
		label7 = NEW System.Windows.Forms.Label().
		label8 = NEW System.Windows.Forms.Label().
		columnHeader4 = NEW System.Windows.Forms.ColumnHeader().
		panel2 = NEW System.Windows.Forms.Panel().
		pictureBox1 = NEW System.Windows.Forms.PictureBox().
		label1 = NEW System.Windows.Forms.Label().
		columnHeader3 = NEW System.Windows.Forms.ColumnHeader().
		columnHeader2 = NEW System.Windows.Forms.ColumnHeader().
		columnHeader1 = NEW System.Windows.Forms.ColumnHeader().
		lvEventLog = NEW System.Windows.Forms.ListView().
		liEvents = NEW System.Windows.Forms.CheckedListBox().
		tabPage4 = NEW System.Windows.Forms.TabPage().
		cmdClearEventLog = NEW System.Windows.Forms.Button().
		spinColumnCount = NEW System.Windows.Forms.NumericUpDown().
		label17 = NEW System.Windows.Forms.Label().
		groupBox2 = NEW System.Windows.Forms.GroupBox().
		splitter1 = NEW System.Windows.Forms.Splitter().
		tabControl1 = NEW System.Windows.Forms.TabControl().
		tabPage2 = NEW System.Windows.Forms.TabPage().
		pnlItems = NEW System.Windows.Forms.Panel().
		cmdRemoveItem = NEW Infragistics.Win.Misc.UltraButton().
		cmdAddItem = NEW Infragistics.Win.Misc.UltraButton().
		coItems = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		lblItems = NEW System.Windows.Forms.Label().
		pgItem = NEW System.Windows.Forms.PropertyGrid().
		label10 = NEW System.Windows.Forms.Label().
		splitter4 = NEW System.Windows.Forms.Splitter().
		pnlGroups = NEW System.Windows.Forms.Panel().
		cmdRemoveGroup = NEW Infragistics.Win.Misc.UltraButton().
		cmdAddGroup = NEW Infragistics.Win.Misc.UltraButton().
		coGroups = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		label6 = NEW System.Windows.Forms.Label().
		tabPage3 = NEW System.Windows.Forms.TabPage().
		toolTip = NEW System.Windows.Forms.ToolTip(components).
		tabPage1:SuspendLayout().
		CAST(coUseLargeGroupHeaderImages, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(coAcceptFocus, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(coViewStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(coStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		pnlPropertyGrids:SuspendLayout().
		panel5:SuspendLayout().
		CAST(ultraExplorerBar1, System.ComponentModel.ISupportInitialize):BeginInit().
		panel4:SuspendLayout().
		CAST(coGroupStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(spinColumnsSpanned, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(tbGroupSpacing, System.ComponentModel.ISupportInitialize):BeginInit().
		groupBox1:SuspendLayout().
		CAST(tbLeftMargin, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(tbBottomMargin, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(tbRightMargin, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(tbTopMargin, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(tbColumnSpacing, System.ComponentModel.ISupportInitialize):BeginInit().
		groupBox3:SuspendLayout().
		CAST(coGroups2, System.ComponentModel.ISupportInitialize):BeginInit().
		panel2:SuspendLayout().
		CAST(pictureBox1, System.ComponentModel.ISupportInitialize):BeginInit().
		tabPage4:SuspendLayout().
		CAST(spinColumnCount, System.ComponentModel.ISupportInitialize):BeginInit().
		groupBox2:SuspendLayout().
		tabControl1:SuspendLayout().
		tabPage2:SuspendLayout().
		pnlItems:SuspendLayout().
		CAST(coItems, System.ComponentModel.ISupportInitialize):BeginInit().
		pnlGroups:SuspendLayout().
		CAST(coGroups, System.ComponentModel.ISupportInitialize):BeginInit().
		tabPage3:SuspendLayout().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* label18 */
		/*  */
		label18:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
		label18:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label18:Location = NEW System.Drawing.Point(16, 394).
		label18:Name = "label18".
		label18:Size = NEW System.Drawing.Size(136, 16).
		label18:TabIndex = 5.
		label18:Text = "Spacing between groups".
		label18:UseCompatibleTextRendering = TRUE.
		/*  */
		/* tabPage1 */
		/*  */
		tabPage1:BackColor = System.Drawing.Color:WhiteSmoke.
		tabPage1:Controls:Add(coUseLargeGroupHeaderImages).
		tabPage1:Controls:Add(chSupportThemes).
		tabPage1:Controls:Add(coAcceptFocus).
		tabPage1:Controls:Add(coViewStyle).
		tabPage1:Controls:Add(coStyle).
		tabPage1:Controls:Add(chkShowExpansionIndicator).
		tabPage1:Controls:Add(pnlPropertyGrids).
		tabPage1:Controls:Add(label3).
		tabPage1:Controls:Add(label2).
		tabPage1:Controls:Add(label21).
		tabPage1:Controls:Add(coGroupStyle).
		tabPage1:Controls:Add(label9).
		tabPage1:Controls:Add(label11).
		tabPage1:Location = NEW System.Drawing.Point(4, 22).
		tabPage1:Name = "tabPage1".
		tabPage1:Size = NEW System.Drawing.Size(503, 472).
		tabPage1:TabIndex = 0.
		tabPage1:Text = "Look and Behavior".
		/*  */
		/* coUseLargeGroupHeaderImages */
		/*  */
		coUseLargeGroupHeaderImages:Location = NEW System.Drawing.Point(216, 87).
		coUseLargeGroupHeaderImages:Name = "coUseLargeGroupHeaderImages".
		coUseLargeGroupHeaderImages:Size = NEW System.Drawing.Size(176, 21).
		coUseLargeGroupHeaderImages:SyncWithCurrencyManager = FALSE.
		coUseLargeGroupHeaderImages:TabIndex = 12.
		coUseLargeGroupHeaderImages:ValueChanged:SUBSCRIBE(THIS-OBJECT:coUseLargeGroupHeaderImages_ValueChanged).
		/*  */
		/* chSupportThemes */
		/*  */
		chSupportThemes:Location = NEW System.Drawing.Point(24, 124).
		chSupportThemes:Name = "chSupportThemes".
		chSupportThemes:Size = NEW System.Drawing.Size(176, 20).
		chSupportThemes:TabIndex = 11.
		chSupportThemes:Text = "Suppport XP Themes".
		chSupportThemes:CheckedChanged:SUBSCRIBE(THIS-OBJECT:chSupportThemes_CheckedChanged).
		/*  */
		/* coAcceptFocus */
		/*  */
		coAcceptFocus:Location = NEW System.Drawing.Point(216, 147).
		coAcceptFocus:Name = "coAcceptFocus".
		coAcceptFocus:Size = NEW System.Drawing.Size(176, 21).
		coAcceptFocus:SyncWithCurrencyManager = FALSE.
		coAcceptFocus:TabIndex = 10.
		coAcceptFocus:ValueChanged:SUBSCRIBE(THIS-OBJECT:coAcceptFocus_ValueChanged).
		/*  */
		/* coViewStyle */
		/*  */
		coViewStyle:Location = NEW System.Drawing.Point(28, 87).
		coViewStyle:Name = "coViewStyle".
		coViewStyle:Size = NEW System.Drawing.Size(172, 21).
		coViewStyle:SyncWithCurrencyManager = FALSE.
		coViewStyle:TabIndex = 9.
		coViewStyle:ValueChanged:SUBSCRIBE(THIS-OBJECT:coViewStyle_ValueChanged).
		/*  */
		/* coStyle */
		/*  */
		coStyle:Location = NEW System.Drawing.Point(28, 31).
		coStyle:Name = "coStyle".
		coStyle:Size = NEW System.Drawing.Size(172, 21).
		coStyle:SyncWithCurrencyManager = FALSE.
		coStyle:TabIndex = 8.
		coStyle:ValueChanged:SUBSCRIBE(THIS-OBJECT:coStyle_ValueChanged).
		/*  */
		/* chkShowExpansionIndicator */
		/*  */
		chkShowExpansionIndicator:FlatStyle = System.Windows.Forms.FlatStyle:System.
		chkShowExpansionIndicator:Location = NEW System.Drawing.Point(24, 152).
		chkShowExpansionIndicator:Name = "chkShowExpansionIndicator".
		chkShowExpansionIndicator:Size = NEW System.Drawing.Size(176, 16).
		chkShowExpansionIndicator:TabIndex = 7.
		chkShowExpansionIndicator:Text = "Show Expansion Indicators".
		toolTip:SetToolTip(chkShowExpansionIndicator, "This setting only takes effect if the Style of the UltraExplorerBar is set to 'ExplorerBar' or 'VisualStudio2005Toolbox'.").
		chkShowExpansionIndicator:UseCompatibleTextRendering = TRUE.
		/*  */
		/* pnlPropertyGrids */
		/*  */
		pnlPropertyGrids:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		pnlPropertyGrids:Controls:Add(panel5).
		pnlPropertyGrids:Controls:Add(splitter2).
		pnlPropertyGrids:Controls:Add(panel4).
		pnlPropertyGrids:Location = NEW System.Drawing.Point(0, 180).
		pnlPropertyGrids:Name = "pnlPropertyGrids".
		pnlPropertyGrids:Size = NEW System.Drawing.Size(506, 292).
		pnlPropertyGrids:TabIndex = 6.
		/*  */
		/* panel5 */
		/*  */
		panel5:Controls:Add(pgItemSettings).
		panel5:Controls:Add(label5).
		panel5:Dock = System.Windows.Forms.DockStyle:Fill.
		panel5:Location = NEW System.Drawing.Point(221, 0).
		panel5:Name = "panel5".
		panel5:Size = NEW System.Drawing.Size(285, 292).
		panel5:TabIndex = 2.
		/*  */
		/* pgItemSettings */
		/*  */
		pgItemSettings:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		pgItemSettings:CommandsBackColor = System.Drawing.Color:WhiteSmoke.
		pgItemSettings:HelpVisible = FALSE.
		pgItemSettings:LineColor = System.Drawing.SystemColors:ScrollBar.
		pgItemSettings:Location = NEW System.Drawing.Point(8, 24).
		pgItemSettings:Name = "pgItemSettings".
		pgItemSettings:PropertySort = System.Windows.Forms.PropertySort:Alphabetical.
		pgItemSettings:SelectedObject = ultraExplorerBar1.
		pgItemSettings:Size = NEW System.Drawing.Size(272, 260).
		pgItemSettings:TabIndex = 4.
		pgItemSettings:ToolbarVisible = FALSE.
		pgItemSettings:UseCompatibleTextRendering = TRUE.
		/*  */
		/* ultraExplorerBar1 */
		/*  */
		ultraExplorerBar1:AcceptsFocus = Infragistics.Win.DefaultableBoolean:True.
		ultraExplorerBar1:ColumnCount = 2.
		ultraExplorerBar1:Dock = System.Windows.Forms.DockStyle:Right.
		ultraExplorerBarGroup1:ColumnsSpanned = 2.
		ultraExplorerBarItem1:Text = "Group 1 - Item 1".
		ultraExplorerBarItem2:Text = "Group 1 - Item 2".
		ultraExplorerBarItem3:Text = "Group 1 - Item 3".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar0 AS System.Array NO-UNDO.
		arrayvar0 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem"), 3).
		arrayvar0:SetValue(ultraExplorerBarItem1, 0).
		arrayvar0:SetValue(ultraExplorerBarItem2, 1).
		arrayvar0:SetValue(ultraExplorerBarItem3, 2).
		ultraExplorerBarGroup1:Items:AddRange(CAST(arrayvar0, "Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem[]")).
		appearance1:Image = CAST(resources:GetObject("appearance1.Image"), System.Object).
		ultraExplorerBarGroup1:ItemSettings:AppearancesSmall:Appearance = appearance1.
		appearance2:Image = CAST(resources:GetObject("appearance2.Image"), System.Object).
		ultraExplorerBarGroup1:Settings:AppearancesLarge:HeaderAppearance = appearance2.
		ultraExplorerBarGroup1:Text = "Group 1".
		ultraExplorerBarItem4:Text = "Group 2 - Item 1".
		ultraExplorerBarItem5:Text = "Group 2 - Item 2".
		ultraExplorerBarItem6:Text = "Group 2 - Item 3".
		ultraExplorerBarItem7:Text = "New Item".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar1 AS System.Array NO-UNDO.
		arrayvar1 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem"), 4).
		arrayvar1:SetValue(ultraExplorerBarItem4, 0).
		arrayvar1:SetValue(ultraExplorerBarItem5, 1).
		arrayvar1:SetValue(ultraExplorerBarItem6, 2).
		arrayvar1:SetValue(ultraExplorerBarItem7, 3).
		ultraExplorerBarGroup2:Items:AddRange(CAST(arrayvar1, "Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem[]")).
		appearance3:Image = CAST(resources:GetObject("appearance3.Image"), System.Object).
		ultraExplorerBarGroup2:ItemSettings:AppearancesSmall:Appearance = appearance3.
		appearance4:Image = CAST(resources:GetObject("appearance4.Image"), System.Object).
		ultraExplorerBarGroup2:Settings:AppearancesLarge:HeaderAppearance = appearance4.
		ultraExplorerBarGroup2:Text = "Group 2".
		ultraExplorerBarItem8:Text = "Group 3 - Item 1".
		ultraExplorerBarItem9:Text = "Group 3 - Item 2".
		ultraExplorerBarItem10:Text = "Group 3 - Item 3".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar2 AS System.Array NO-UNDO.
		arrayvar2 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem"), 3).
		arrayvar2:SetValue(ultraExplorerBarItem8, 0).
		arrayvar2:SetValue(ultraExplorerBarItem9, 1).
		arrayvar2:SetValue(ultraExplorerBarItem10, 2).
		ultraExplorerBarGroup3:Items:AddRange(CAST(arrayvar2, "Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem[]")).
		appearance5:Image = CAST(resources:GetObject("appearance5.Image"), System.Object).
		ultraExplorerBarGroup3:ItemSettings:AppearancesSmall:Appearance = appearance5.
		appearance6:Image = CAST(resources:GetObject("appearance6.Image"), System.Object).
		ultraExplorerBarGroup3:Settings:AppearancesLarge:HeaderAppearance = appearance6.
		ultraExplorerBarGroup3:Text = "Group 3".
		ultraExplorerBarGroup4:ColumnsSpanned = 2.
		ultraExplorerBarItem11:Text = "New Item".
		ultraExplorerBarItem12:Text = "New Item".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar3 AS System.Array NO-UNDO.
		arrayvar3 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem"), 2).
		arrayvar3:SetValue(ultraExplorerBarItem11, 0).
		arrayvar3:SetValue(ultraExplorerBarItem12, 1).
		ultraExplorerBarGroup4:Items:AddRange(CAST(arrayvar3, "Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem[]")).
		appearance7:Image = CAST(resources:GetObject("appearance7.Image"), System.Object).
		ultraExplorerBarGroup4:ItemSettings:AppearancesSmall:Appearance = appearance7.
		appearance8:Image = CAST(resources:GetObject("appearance8.Image"), System.Object).
		ultraExplorerBarGroup4:Settings:AppearancesLarge:HeaderAppearance = appearance8.
		ultraExplorerBarGroup4:Text = "New Group".
		ultraExplorerBarItem13:Text = "New Item".
		ultraExplorerBarItem14:Text = "New Item".
		ultraExplorerBarItem15:Text = "New Item".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar4 AS System.Array NO-UNDO.
		arrayvar4 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem"), 3).
		arrayvar4:SetValue(ultraExplorerBarItem13, 0).
		arrayvar4:SetValue(ultraExplorerBarItem14, 1).
		arrayvar4:SetValue(ultraExplorerBarItem15, 2).
		ultraExplorerBarGroup5:Items:AddRange(CAST(arrayvar4, "Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem[]")).
		appearance9:Image = CAST(resources:GetObject("appearance9.Image"), System.Object).
		ultraExplorerBarGroup5:ItemSettings:AppearancesSmall:Appearance = appearance9.
		appearance10:Image = CAST(resources:GetObject("appearance10.Image"), System.Object).
		ultraExplorerBarGroup5:Settings:AppearancesLarge:HeaderAppearance = appearance10.
		ultraExplorerBarGroup5:Text = "New Group".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar5 AS System.Array NO-UNDO.
		arrayvar5 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup"), 5).
		arrayvar5:SetValue(ultraExplorerBarGroup1, 0).
		arrayvar5:SetValue(ultraExplorerBarGroup2, 1).
		arrayvar5:SetValue(ultraExplorerBarGroup3, 2).
		arrayvar5:SetValue(ultraExplorerBarGroup4, 3).
		arrayvar5:SetValue(ultraExplorerBarGroup5, 4).
		ultraExplorerBar1:Groups:AddRange(CAST(arrayvar5, "Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup[]")).
		ultraExplorerBar1:GroupSettings:Style = Infragistics.Win.UltraWinExplorerBar.GroupStyle:SmallImages.
		appearance11:Image = CAST(resources:GetObject("appearance11.Image"), System.Object).
		ultraExplorerBar1:ItemSettings:AppearancesLarge:Appearance = appearance11.
		ultraExplorerBar1:Location = NEW System.Drawing.Point(542, 0).
		ultraExplorerBar1:Name = "ultraExplorerBar1".
		ultraExplorerBar1:Size = NEW System.Drawing.Size(224, 574).
		ultraExplorerBar1:TabIndex = 4.
		ultraExplorerBar1:UseLargeGroupHeaderImages = Infragistics.Win.DefaultableBoolean:False.
		ultraExplorerBar1:ViewStyle = Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarViewStyle:XPExplorerBar.
		ultraExplorerBar1:ItemAdded:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemAdded).
		ultraExplorerBar1:ItemAdding:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemAdding).
		ultraExplorerBar1:GroupRemoved:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupRemoved).
		ultraExplorerBar1:GroupAdded:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupAdded).
		ultraExplorerBar1:ItemRemoving:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemRemoving).
		ultraExplorerBar1:ItemDoubleClick:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemDoubleClick).
		ultraExplorerBar1:GroupRemoving:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupRemoving).
		ultraExplorerBar1:ActiveItemChanged:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ActiveItemChanged).
		ultraExplorerBar1:ActiveItemChanging:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ActiveItemChanging).
		ultraExplorerBar1:GroupClick:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupClick).
		ultraExplorerBar1:ItemExitedEditMode:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemExitedEditMode).
		ultraExplorerBar1:ItemEnteredEditMode:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemEnteredEditMode).
		ultraExplorerBar1:GroupExitedEditMode:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupExitedEditMode).
		ultraExplorerBar1:GroupExpanded:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupExpanded).
		ultraExplorerBar1:ItemDropped:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemDropped).
		ultraExplorerBar1:GroupEnteringEditMode:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupEnteringEditMode).
		ultraExplorerBar1:ContextMenuInitializing:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ContextMenuInitializing).
		ultraExplorerBar1:GroupCollapsed:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupCollapsed).
		ultraExplorerBar1:ItemExitingEditMode:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemExitingEditMode).
		ultraExplorerBar1:ItemDragging:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemDragging).
		ultraExplorerBar1:ItemCheckStateChanging:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemCheckStateChanging).
		ultraExplorerBar1:ActiveGroupChanging:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ActiveGroupChanging).
		ultraExplorerBar1:GroupDragOver:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupDragOver).
		ultraExplorerBar1:GroupAdding:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupAdding).
		ultraExplorerBar1:ItemDragOver:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemDragOver).
		ultraExplorerBar1:ItemRemoved:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemRemoved).
		ultraExplorerBar1:ItemCheckStateChanged:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemCheckStateChanged).
		ultraExplorerBar1:GroupCollapsing:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupCollapsing).
		ultraExplorerBar1:ActiveGroupChanged:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ActiveGroupChanged).
		ultraExplorerBar1:GroupDropped:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupDropped).
		ultraExplorerBar1:GroupDragging:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupDragging).
		ultraExplorerBar1:ItemEnteringEditMode:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemEnteringEditMode).
		ultraExplorerBar1:GroupEnteredEditMode:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupEnteredEditMode).
		ultraExplorerBar1:GroupExitingEditMode:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupExitingEditMode).
		ultraExplorerBar1:ItemClick:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_ItemClick).
		ultraExplorerBar1:GroupExpanding:SUBSCRIBE(THIS-OBJECT:ultraExplorerBar1_GroupExpanding).
		/*  */
		/* label5 */
		/*  */
		label5:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label5:Location = NEW System.Drawing.Point(8, 8).
		label5:Name = "label5".
		label5:Size = NEW System.Drawing.Size(208, 16).
		label5:TabIndex = 5.
		label5:Text = "Item Settings (defaults for all items)".
		label5:UseCompatibleTextRendering = TRUE.
		/*  */
		/* splitter2 */
		/*  */
		splitter2:BackColor = System.Drawing.SystemColors:ControlDark.
		splitter2:BorderStyle = System.Windows.Forms.BorderStyle:FixedSingle.
		splitter2:Location = NEW System.Drawing.Point(216, 0).
		splitter2:Name = "splitter2".
		splitter2:Size = NEW System.Drawing.Size(5, 292).
		splitter2:TabIndex = 1.
		splitter2:TabStop = FALSE.
		/*  */
		/* panel4 */
		/*  */
		panel4:Controls:Add(label4).
		panel4:Controls:Add(pgGroupSettings).
		panel4:Dock = System.Windows.Forms.DockStyle:Left.
		panel4:Location = NEW System.Drawing.Point(0, 0).
		panel4:Name = "panel4".
		panel4:Size = NEW System.Drawing.Size(216, 292).
		panel4:TabIndex = 0.
		/*  */
		/* label4 */
		/*  */
		label4:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label4:Location = NEW System.Drawing.Point(8, 8).
		label4:Name = "label4".
		label4:Size = NEW System.Drawing.Size(200, 16).
		label4:TabIndex = 5.
		label4:Text = "Group Settings (defaults for all groups)".
		label4:UseCompatibleTextRendering = TRUE.
		/*  */
		/* pgGroupSettings */
		/*  */
		pgGroupSettings:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		pgGroupSettings:CommandsBackColor = System.Drawing.Color:WhiteSmoke.
		pgGroupSettings:HelpVisible = FALSE.
		pgGroupSettings:LineColor = System.Drawing.SystemColors:ScrollBar.
		pgGroupSettings:Location = NEW System.Drawing.Point(8, 24).
		pgGroupSettings:Name = "pgGroupSettings".
		pgGroupSettings:PropertySort = System.Windows.Forms.PropertySort:Alphabetical.
		pgGroupSettings:SelectedObject = ultraExplorerBar1.
		pgGroupSettings:Size = NEW System.Drawing.Size(200, 260).
		pgGroupSettings:TabIndex = 4.
		pgGroupSettings:ToolbarVisible = FALSE.
		pgGroupSettings:UseCompatibleTextRendering = TRUE.
		pgGroupSettings:PropertyValueChanged:SUBSCRIBE(THIS-OBJECT:pgGroupSettings_PropertyValueChanged).
		/*  */
		/* label3 */
		/*  */
		label3:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label3:Location = NEW System.Drawing.Point(24, 72).
		label3:Name = "label3".
		label3:Size = NEW System.Drawing.Size(152, 16).
		label3:TabIndex = 1.
		label3:Text = "View Style (look)".
		label3:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label2 */
		/*  */
		label2:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label2:Location = NEW System.Drawing.Point(24, 16).
		label2:Name = "label2".
		label2:Size = NEW System.Drawing.Size(160, 16).
		label2:TabIndex = 1.
		label2:Text = "Control Style (behavior)".
		label2:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label21 */
		/*  */
		label21:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label21:Location = NEW System.Drawing.Point(216, 16).
		label21:Name = "label21".
		label21:Size = NEW System.Drawing.Size(160, 16).
		label21:TabIndex = 1.
		label21:Text = "Group Style (look)".
		label21:UseCompatibleTextRendering = TRUE.
		/*  */
		/* coGroupStyle */
		/*  */
		coGroupStyle:Location = NEW System.Drawing.Point(216, 32).
		coGroupStyle:Name = "coGroupStyle".
		coGroupStyle:Size = NEW System.Drawing.Size(176, 21).
		coGroupStyle:SyncWithCurrencyManager = FALSE.
		coGroupStyle:TabIndex = 2.
		coGroupStyle:ValueChanged:SUBSCRIBE(THIS-OBJECT:coGroupStyle_ValueChanged).
		/*  */
		/* label9 */
		/*  */
		label9:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label9:Location = NEW System.Drawing.Point(216, 72).
		label9:Name = "label9".
		label9:Size = NEW System.Drawing.Size(208, 16).
		label9:TabIndex = 1.
		label9:Text = "Use Large Group Header Images".
		label9:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label11 */
		/*  */
		label11:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label11:Location = NEW System.Drawing.Point(216, 128).
		label11:Name = "label11".
		label11:Size = NEW System.Drawing.Size(208, 16).
		label11:TabIndex = 1.
		label11:Text = "Accepts Focus".
		label11:UseCompatibleTextRendering = TRUE.
		/*  */
		/* spinColumnsSpanned */
		/*  */
		spinColumnsSpanned:Location = NEW System.Drawing.Point(8, 88).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true", Type="System.Int32").
		DEFINE VARIABLE arrayvar6 AS INTEGER EXTENT 4 NO-UNDO.
		arrayvar6[1] = 10.
		arrayvar6[2] = 0.
		arrayvar6[3] = 0.
		arrayvar6[4] = 0.
		spinColumnsSpanned:Maximum = Progress.Util.DecimalHelper:Create(arrayvar6).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true", Type="System.Int32").
		DEFINE VARIABLE arrayvar7 AS INTEGER EXTENT 4 NO-UNDO.
		arrayvar7[1] = 1.
		arrayvar7[2] = 0.
		arrayvar7[3] = 0.
		arrayvar7[4] = 0.
		spinColumnsSpanned:Minimum = Progress.Util.DecimalHelper:Create(arrayvar7).
		spinColumnsSpanned:Name = "spinColumnsSpanned".
		spinColumnsSpanned:Size = NEW System.Drawing.Size(40, 20).
		spinColumnsSpanned:TabIndex = 2.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true", Type="System.Int32").
		DEFINE VARIABLE arrayvar8 AS INTEGER EXTENT 4 NO-UNDO.
		arrayvar8[1] = 1.
		arrayvar8[2] = 0.
		arrayvar8[3] = 0.
		arrayvar8[4] = 0.
		spinColumnsSpanned:Value = Progress.Util.DecimalHelper:Create(arrayvar8).
		spinColumnsSpanned:ValueChanged:SUBSCRIBE(THIS-OBJECT:spinColumnsSpanned_ValueChanged).
		/*  */
		/* tbGroupSpacing */
		/*  */
		tbGroupSpacing:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
		tbGroupSpacing:AutoSize = FALSE.
		tbGroupSpacing:Location = NEW System.Drawing.Point(16, 410).
		tbGroupSpacing:Maximum = 100.
		tbGroupSpacing:Name = "tbGroupSpacing".
		tbGroupSpacing:Size = NEW System.Drawing.Size(144, 45).
		tbGroupSpacing:TabIndex = 6.
		tbGroupSpacing:TickFrequency = 5.
		tbGroupSpacing:Scroll:SUBSCRIBE(THIS-OBJECT:tbGroupSpacing_Scroll).
		/*  */
		/* groupBox1 */
		/*  */
		groupBox1:Controls:Add(tbLeftMargin).
		groupBox1:Controls:Add(cmdResetMarginsToDefaults).
		groupBox1:Controls:Add(lblMarginSizerInner).
		groupBox1:Controls:Add(coMargins).
		groupBox1:Controls:Add(lblTopMargin).
		groupBox1:Controls:Add(lblBottomMargin).
		groupBox1:Controls:Add(lblLeftMargin).
		groupBox1:Controls:Add(lblRightMargin).
		groupBox1:Controls:Add(tbBottomMargin).
		groupBox1:Controls:Add(tbRightMargin).
		groupBox1:Controls:Add(tbTopMargin).
		groupBox1:FlatStyle = System.Windows.Forms.FlatStyle:System.
		groupBox1:Location = NEW System.Drawing.Point(216, 16).
		groupBox1:Name = "groupBox1".
		groupBox1:Size = NEW System.Drawing.Size(192, 240).
		groupBox1:TabIndex = 2.
		groupBox1:TabStop = FALSE.
		groupBox1:Text = "Margins".
		groupBox1:UseCompatibleTextRendering = TRUE.
		/*  */
		/* tbLeftMargin */
		/*  */
		tbLeftMargin:AutoSize = FALSE.
		tbLeftMargin:Location = NEW System.Drawing.Point(16, 112).
		tbLeftMargin:Maximum = 100.
		tbLeftMargin:Minimum = -1.
		tbLeftMargin:Name = "tbLeftMargin".
		tbLeftMargin:Size = NEW System.Drawing.Size(48, 45).
		tbLeftMargin:TabIndex = 5.
		tbLeftMargin:TickStyle = System.Windows.Forms.TickStyle:None.
		tbLeftMargin:Scroll:SUBSCRIBE(THIS-OBJECT:tbLeftMargin_Scroll).
		/*  */
		/* cmdResetMarginsToDefaults */
		/*  */
		cmdResetMarginsToDefaults:FlatStyle = System.Windows.Forms.FlatStyle:System.
		cmdResetMarginsToDefaults:Location = NEW System.Drawing.Point(32, 208).
		cmdResetMarginsToDefaults:Name = "cmdResetMarginsToDefaults".
		cmdResetMarginsToDefaults:Size = NEW System.Drawing.Size(128, 24).
		cmdResetMarginsToDefaults:TabIndex = 4.
		cmdResetMarginsToDefaults:Text = "Reset to defaults".
		cmdResetMarginsToDefaults:UseCompatibleTextRendering = TRUE.
		cmdResetMarginsToDefaults:Click:SUBSCRIBE(THIS-OBJECT:cmdResetMarginsToDefaults_Click).
		/*  */
		/* lblMarginSizerInner */
		/*  */
		lblMarginSizerInner:BackColor = System.Drawing.SystemColors:ControlDark.
		lblMarginSizerInner:BorderStyle = System.Windows.Forms.BorderStyle:FixedSingle.
		lblMarginSizerInner:Location = NEW System.Drawing.Point(72, 96).
		lblMarginSizerInner:Name = "lblMarginSizerInner".
		lblMarginSizerInner:Size = NEW System.Drawing.Size(40, 40).
		lblMarginSizerInner:TabIndex = 3.
		lblMarginSizerInner:UseCompatibleTextRendering = TRUE.
		/*  */
		/* coMargins */
		/*  */
		coMargins:DropDownStyle = System.Windows.Forms.ComboBoxStyle:DropDownList.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar9 AS System.Array NO-UNDO.
		arrayvar9 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Object"), 3).
		arrayvar9:SetValue("Around Groups", 0).
		arrayvar9:SetValue("Around inner item area", 1).
		arrayvar9:SetValue("Around outer item area", 2).
		coMargins:Items:AddRange(CAST(arrayvar9, "System.Object[]")).
		coMargins:Location = NEW System.Drawing.Point(8, 24).
		coMargins:Name = "coMargins".
		coMargins:Size = NEW System.Drawing.Size(176, 21).
		coMargins:TabIndex = 2.
		/*  */
		/* lblTopMargin */
		/*  */
		lblTopMargin:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		lblTopMargin:Location = NEW System.Drawing.Point(64, 48).
		lblTopMargin:Name = "lblTopMargin".
		lblTopMargin:Size = NEW System.Drawing.Size(48, 16).
		lblTopMargin:TabIndex = 1.
		lblTopMargin:Text = "Top".
		lblTopMargin:TextAlign = System.Drawing.ContentAlignment:MiddleCenter.
		lblTopMargin:UseCompatibleTextRendering = TRUE.
		/*  */
		/* lblBottomMargin */
		/*  */
		lblBottomMargin:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		lblBottomMargin:Location = NEW System.Drawing.Point(64, 144).
		lblBottomMargin:Name = "lblBottomMargin".
		lblBottomMargin:Size = NEW System.Drawing.Size(48, 16).
		lblBottomMargin:TabIndex = 1.
		lblBottomMargin:Text = "Bottom".
		lblBottomMargin:TextAlign = System.Drawing.ContentAlignment:MiddleCenter.
		lblBottomMargin:UseCompatibleTextRendering = TRUE.
		/*  */
		/* lblLeftMargin */
		/*  */
		lblLeftMargin:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		lblLeftMargin:Location = NEW System.Drawing.Point(16, 96).
		lblLeftMargin:Name = "lblLeftMargin".
		lblLeftMargin:Size = NEW System.Drawing.Size(48, 16).
		lblLeftMargin:TabIndex = 1.
		lblLeftMargin:Text = "Left".
		lblLeftMargin:TextAlign = System.Drawing.ContentAlignment:MiddleCenter.
		lblLeftMargin:UseCompatibleTextRendering = TRUE.
		/*  */
		/* lblRightMargin */
		/*  */
		lblRightMargin:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		lblRightMargin:Location = NEW System.Drawing.Point(120, 96).
		lblRightMargin:Name = "lblRightMargin".
		lblRightMargin:Size = NEW System.Drawing.Size(48, 16).
		lblRightMargin:TabIndex = 1.
		lblRightMargin:Text = "Right".
		lblRightMargin:TextAlign = System.Drawing.ContentAlignment:MiddleCenter.
		lblRightMargin:UseCompatibleTextRendering = TRUE.
		/*  */
		/* tbBottomMargin */
		/*  */
		tbBottomMargin:AutoSize = FALSE.
		tbBottomMargin:Location = NEW System.Drawing.Point(64, 160).
		tbBottomMargin:Maximum = 100.
		tbBottomMargin:Minimum = -1.
		tbBottomMargin:Name = "tbBottomMargin".
		tbBottomMargin:Size = NEW System.Drawing.Size(48, 45).
		tbBottomMargin:TabIndex = 5.
		tbBottomMargin:TickStyle = System.Windows.Forms.TickStyle:None.
		tbBottomMargin:Scroll:SUBSCRIBE(THIS-OBJECT:tbBottomMargin_Scroll).
		/*  */
		/* tbRightMargin */
		/*  */
		tbRightMargin:AutoSize = FALSE.
		tbRightMargin:Location = NEW System.Drawing.Point(120, 112).
		tbRightMargin:Maximum = 100.
		tbRightMargin:Minimum = -1.
		tbRightMargin:Name = "tbRightMargin".
		tbRightMargin:Size = NEW System.Drawing.Size(48, 45).
		tbRightMargin:TabIndex = 5.
		tbRightMargin:TickStyle = System.Windows.Forms.TickStyle:None.
		tbRightMargin:Scroll:SUBSCRIBE(THIS-OBJECT:tbRightMargin_Scroll).
		/*  */
		/* tbTopMargin */
		/*  */
		tbTopMargin:AutoSize = FALSE.
		tbTopMargin:Location = NEW System.Drawing.Point(64, 64).
		tbTopMargin:Maximum = 100.
		tbTopMargin:Minimum = -1.
		tbTopMargin:Name = "tbTopMargin".
		tbTopMargin:Size = NEW System.Drawing.Size(48, 45).
		tbTopMargin:TabIndex = 5.
		tbTopMargin:TickStyle = System.Windows.Forms.TickStyle:None.
		tbTopMargin:Scroll:SUBSCRIBE(THIS-OBJECT:tbTopMargin_Scroll).
		/*  */
		/* label20 */
		/*  */
		label20:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label20:Location = NEW System.Drawing.Point(8, 72).
		label20:Name = "label20".
		label20:Size = NEW System.Drawing.Size(120, 16).
		label20:TabIndex = 3.
		label20:Text = "Columns spanned".
		label20:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label16 */
		/*  */
		label16:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label16:Location = NEW System.Drawing.Point(24, 24).
		label16:Name = "label16".
		label16:Size = NEW System.Drawing.Size(144, 16).
		label16:TabIndex = 3.
		label16:Text = "# of Columns for groups".
		label16:UseCompatibleTextRendering = TRUE.
		/*  */
		/* tbColumnSpacing */
		/*  */
		tbColumnSpacing:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
		tbColumnSpacing:AutoSize = FALSE.
		tbColumnSpacing:Location = NEW System.Drawing.Point(16, 346).
		tbColumnSpacing:Maximum = 100.
		tbColumnSpacing:Name = "tbColumnSpacing".
		tbColumnSpacing:Size = NEW System.Drawing.Size(144, 45).
		tbColumnSpacing:TabIndex = 6.
		tbColumnSpacing:TickFrequency = 5.
		tbColumnSpacing:Scroll:SUBSCRIBE(THIS-OBJECT:tbColumnSpacing_Scroll).
		/*  */
		/* groupBox3 */
		/*  */
		groupBox3:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
		groupBox3:Controls:Add(coGroups2).
		groupBox3:Controls:Add(label20).
		groupBox3:Controls:Add(spinColumnsSpanned).
		groupBox3:Controls:Add(label19).
		groupBox3:FlatStyle = System.Windows.Forms.FlatStyle:System.
		groupBox3:Location = NEW System.Drawing.Point(16, 72).
		groupBox3:Name = "groupBox3".
		groupBox3:Size = NEW System.Drawing.Size(152, 250).
		groupBox3:TabIndex = 7.
		groupBox3:TabStop = FALSE.
		groupBox3:Text = "Column Spanning".
		groupBox3:UseCompatibleTextRendering = TRUE.
		/*  */
		/* coGroups2 */
		/*  */
		coGroups2:Location = NEW System.Drawing.Point(8, 40).
		coGroups2:Name = "coGroups2".
		coGroups2:Size = NEW System.Drawing.Size(128, 21).
		coGroups2:SyncWithCurrencyManager = FALSE.
		coGroups2:TabIndex = 4.
		/*  */
		/* label19 */
		/*  */
		label19:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label19:Location = NEW System.Drawing.Point(8, 24).
		label19:Name = "label19".
		label19:Size = NEW System.Drawing.Size(112, 16).
		label19:TabIndex = 1.
		label19:Text = "Group".
		label19:UseCompatibleTextRendering = TRUE.
		/*  */
		/* pgGroup */
		/*  */
		pgGroup:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		pgGroup:CommandsBackColor = System.Drawing.Color:WhiteSmoke.
		pgGroup:HelpVisible = FALSE.
		pgGroup:LineColor = System.Drawing.SystemColors:ScrollBar.
		pgGroup:Location = NEW System.Drawing.Point(8, 96).
		pgGroup:Name = "pgGroup".
		pgGroup:PropertySort = System.Windows.Forms.PropertySort:Alphabetical.
		pgGroup:Size = NEW System.Drawing.Size(208, 332).
		pgGroup:TabIndex = 7.
		pgGroup:ToolbarVisible = FALSE.
		pgGroup:UseCompatibleTextRendering = TRUE.
		pgGroup:PropertyValueChanged:SUBSCRIBE(THIS-OBJECT:pgGroup_PropertyValueChanged).
		/*  */
		/* label7 */
		/*  */
		label7:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label7:Location = NEW System.Drawing.Point(8, 80).
		label7:Name = "label7".
		label7:Size = NEW System.Drawing.Size(216, 16).
		label7:TabIndex = 9.
		label7:Text = "Properties".
		label7:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label8 */
		/*  */
		label8:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
		label8:Location = NEW System.Drawing.Point(8, 330).
		label8:Name = "label8".
		label8:Size = NEW System.Drawing.Size(384, 16).
		label8:TabIndex = 3.
		label8:Text = "Place a checkmark next to each event you would like to cancel".
		label8:UseCompatibleTextRendering = TRUE.
		/*  */
		/* columnHeader4 */
		/*  */
		columnHeader4:Text = "Cancelled?".
		columnHeader4:Width = 80.
		/*  */
		/* panel2 */
		/*  */
		panel2:BackColor = System.Drawing.Color:White.
		panel2:Controls:Add(pictureBox1).
		panel2:Controls:Add(label1).
		panel2:Dock = System.Windows.Forms.DockStyle:Top.
		panel2:Location = NEW System.Drawing.Point(0, 0).
		panel2:Name = "panel2".
		panel2:Size = NEW System.Drawing.Size(542, 48).
		panel2:TabIndex = 5.
		/*  */
		/* pictureBox1 */
		/*  */
		pictureBox1:Image = CAST(resources:GetObject("pictureBox1.Image"), System.Drawing.Image).
		pictureBox1:Location = NEW System.Drawing.Point(8, 8).
		pictureBox1:Name = "pictureBox1".
		pictureBox1:Size = NEW System.Drawing.Size(32, 32).
		pictureBox1:TabIndex = 1.
		pictureBox1:TabStop = FALSE.
		/*  */
		/* label1 */
		/*  */
		label1:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 16, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		label1:ForeColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(0)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(0)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(192))).
		label1:Location = NEW System.Drawing.Point(48, 10).
		label1:Name = "label1".
		label1:Size = NEW System.Drawing.Size(288, 32).
		label1:TabIndex = 0.
		label1:Text = "UltraExplorerBar".
		label1:TextAlign = System.Drawing.ContentAlignment:MiddleLeft.
		label1:UseCompatibleTextRendering = TRUE.
		/*  */
		/* columnHeader3 */
		/*  */
		columnHeader3:Text = "Cancelable?".
		columnHeader3:Width = 80.
		/*  */
		/* columnHeader2 */
		/*  */
		columnHeader2:Text = "Info".
		columnHeader2:Width = 110.
		/*  */
		/* columnHeader1 */
		/*  */
		columnHeader1:Text = "Event".
		columnHeader1:Width = 120.
		/*  */
		/* lvEventLog */
		/*  */
		lvEventLog:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar10 AS System.Array NO-UNDO.
		arrayvar10 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Windows.Forms.ColumnHeader"), 4).
		arrayvar10:SetValue(columnHeader1, 0).
		arrayvar10:SetValue(columnHeader2, 1).
		arrayvar10:SetValue(columnHeader3, 2).
		arrayvar10:SetValue(columnHeader4, 3).
		lvEventLog:Columns:AddRange(CAST(arrayvar10, "System.Windows.Forms.ColumnHeader[]")).
		lvEventLog:GridLines = TRUE.
		lvEventLog:Location = NEW System.Drawing.Point(8, 8).
		lvEventLog:Name = "lvEventLog".
		lvEventLog:Size = NEW System.Drawing.Size(487, 292).
		lvEventLog:TabIndex = 0.
		lvEventLog:UseCompatibleStateImageBehavior = FALSE.
		lvEventLog:View = System.Windows.Forms.View:Details.
		/*  */
		/* liEvents */
		/*  */
		liEvents:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		liEvents:IntegralHeight = FALSE.
		liEvents:Location = NEW System.Drawing.Point(8, 346).
		liEvents:Name = "liEvents".
		liEvents:Size = NEW System.Drawing.Size(487, 120).
		liEvents:TabIndex = 2.
		liEvents:UseCompatibleTextRendering = TRUE.
		/*  */
		/* tabPage4 */
		/*  */
		tabPage4:BackColor = System.Drawing.Color:WhiteSmoke.
		tabPage4:Controls:Add(liEvents).
		tabPage4:Controls:Add(cmdClearEventLog).
		tabPage4:Controls:Add(lvEventLog).
		tabPage4:Controls:Add(label8).
		tabPage4:Location = NEW System.Drawing.Point(4, 22).
		tabPage4:Name = "tabPage4".
		tabPage4:Size = NEW System.Drawing.Size(503, 472).
		tabPage4:TabIndex = 3.
		tabPage4:Text = "Events".
		/*  */
		/* cmdClearEventLog */
		/*  */
		cmdClearEventLog:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		cmdClearEventLog:FlatStyle = System.Windows.Forms.FlatStyle:System.
		cmdClearEventLog:Location = NEW System.Drawing.Point(423, 308).
		cmdClearEventLog:Name = "cmdClearEventLog".
		cmdClearEventLog:Size = NEW System.Drawing.Size(72, 24).
		cmdClearEventLog:TabIndex = 1.
		cmdClearEventLog:Text = "Clear Log".
		cmdClearEventLog:UseCompatibleTextRendering = TRUE.
		cmdClearEventLog:Click:SUBSCRIBE(THIS-OBJECT:cmdClearEventLog_Click).
		/*  */
		/* spinColumnCount */
		/*  */
		spinColumnCount:Location = NEW System.Drawing.Point(24, 40).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true", Type="System.Int32").
		DEFINE VARIABLE arrayvar11 AS INTEGER EXTENT 4 NO-UNDO.
		arrayvar11[1] = 10.
		arrayvar11[2] = 0.
		arrayvar11[3] = 0.
		arrayvar11[4] = 0.
		spinColumnCount:Maximum = Progress.Util.DecimalHelper:Create(arrayvar11).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true", Type="System.Int32").
		DEFINE VARIABLE arrayvar12 AS INTEGER EXTENT 4 NO-UNDO.
		arrayvar12[1] = 1.
		arrayvar12[2] = 0.
		arrayvar12[3] = 0.
		arrayvar12[4] = 0.
		spinColumnCount:Minimum = Progress.Util.DecimalHelper:Create(arrayvar12).
		spinColumnCount:Name = "spinColumnCount".
		spinColumnCount:Size = NEW System.Drawing.Size(40, 20).
		spinColumnCount:TabIndex = 4.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true", Type="System.Int32").
		DEFINE VARIABLE arrayvar13 AS INTEGER EXTENT 4 NO-UNDO.
		arrayvar13[1] = 1.
		arrayvar13[2] = 0.
		arrayvar13[3] = 0.
		arrayvar13[4] = 0.
		spinColumnCount:Value = Progress.Util.DecimalHelper:Create(arrayvar13).
		spinColumnCount:ValueChanged:SUBSCRIBE(THIS-OBJECT:spinColumnCount_ValueChanged).
		/*  */
		/* label17 */
		/*  */
		label17:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
		label17:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label17:Location = NEW System.Drawing.Point(16, 330).
		label17:Name = "label17".
		label17:Size = NEW System.Drawing.Size(136, 16).
		label17:TabIndex = 5.
		label17:Text = "Spacing between columns".
		label17:UseCompatibleTextRendering = TRUE.
		/*  */
		/* groupBox2 */
		/*  */
		groupBox2:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
		groupBox2:Controls:Add(label17).
		groupBox2:Controls:Add(spinColumnCount).
		groupBox2:Controls:Add(label16).
		groupBox2:Controls:Add(tbColumnSpacing).
		groupBox2:Controls:Add(groupBox3).
		groupBox2:Controls:Add(label18).
		groupBox2:Controls:Add(tbGroupSpacing).
		groupBox2:FlatStyle = System.Windows.Forms.FlatStyle:System.
		groupBox2:Location = NEW System.Drawing.Point(16, 16).
		groupBox2:Name = "groupBox2".
		groupBox2:Size = NEW System.Drawing.Size(184, 450).
		groupBox2:TabIndex = 5.
		groupBox2:TabStop = FALSE.
		groupBox2:Text = "ExplorerBar Style only".
		groupBox2:UseCompatibleTextRendering = TRUE.
		/*  */
		/* splitter1 */
		/*  */
		splitter1:BackColor = System.Drawing.SystemColors:ControlDark.
		splitter1:BorderStyle = System.Windows.Forms.BorderStyle:FixedSingle.
		splitter1:Dock = System.Windows.Forms.DockStyle:Right.
		splitter1:Location = NEW System.Drawing.Point(766, 0).
		splitter1:Name = "splitter1".
		splitter1:Size = NEW System.Drawing.Size(5, 574).
		splitter1:TabIndex = 6.
		splitter1:TabStop = FALSE.
		/*  */
		/* tabControl1 */
		/*  */
		tabControl1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		tabControl1:Controls:Add(tabPage1).
		tabControl1:Controls:Add(tabPage2).
		tabControl1:Controls:Add(tabPage3).
		tabControl1:Controls:Add(tabPage4).
		tabControl1:Location = NEW System.Drawing.Point(16, 64).
		tabControl1:Multiline = TRUE.
		tabControl1:Name = "tabControl1".
		tabControl1:RightToLeft = System.Windows.Forms.RightToLeft:No.
		tabControl1:SelectedIndex = 0.
		tabControl1:Size = NEW System.Drawing.Size(511, 498).
		tabControl1:TabIndex = 7.
		/*  */
		/* tabPage2 */
		/*  */
		tabPage2:BackColor = System.Drawing.Color:WhiteSmoke.
		tabPage2:Controls:Add(pnlItems).
		tabPage2:Controls:Add(splitter4).
		tabPage2:Controls:Add(pnlGroups).
		tabPage2:Location = NEW System.Drawing.Point(4, 22).
		tabPage2:Name = "tabPage2".
		tabPage2:Size = NEW System.Drawing.Size(503, 472).
		tabPage2:TabIndex = 1.
		tabPage2:Text = "Groups and Items".
		/*  */
		/* pnlItems */
		/*  */
		pnlItems:Controls:Add(cmdRemoveItem).
		pnlItems:Controls:Add(cmdAddItem).
		pnlItems:Controls:Add(coItems).
		pnlItems:Controls:Add(lblItems).
		pnlItems:Controls:Add(pgItem).
		pnlItems:Controls:Add(label10).
		pnlItems:Dock = System.Windows.Forms.DockStyle:Fill.
		pnlItems:Location = NEW System.Drawing.Point(229, 0).
		pnlItems:Name = "pnlItems".
		pnlItems:Size = NEW System.Drawing.Size(274, 472).
		pnlItems:TabIndex = 8.
		/*  */
		/* cmdRemoveItem */
		/*  */
		cmdRemoveItem:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		cmdRemoveItem:ButtonStyle = Infragistics.Win.UIElementButtonStyle:WindowsXPCommandButton.
		cmdRemoveItem:Location = NEW System.Drawing.Point(178, 438).
		cmdRemoveItem:Name = "cmdRemoveItem".
		cmdRemoveItem:Size = NEW System.Drawing.Size(87, 23).
		cmdRemoveItem:TabIndex = 14.
		cmdRemoveItem:Text = "Remove Item".
		cmdRemoveItem:Click:SUBSCRIBE(THIS-OBJECT:cmdRemoveItem_Click).
		/*  */
		/* cmdAddItem */
		/*  */
		cmdAddItem:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
		cmdAddItem:ButtonStyle = Infragistics.Win.UIElementButtonStyle:WindowsXPCommandButton.
		cmdAddItem:Location = NEW System.Drawing.Point(8, 438).
		cmdAddItem:Name = "cmdAddItem".
		cmdAddItem:Size = NEW System.Drawing.Size(75, 23).
		cmdAddItem:TabIndex = 13.
		cmdAddItem:Text = "Add Item".
		cmdAddItem:Click:SUBSCRIBE(THIS-OBJECT:cmdAddItem_Click).
		/*  */
		/* coItems */
		/*  */
		coItems:Location = NEW System.Drawing.Point(8, 31).
		coItems:Name = "coItems".
		coItems:Size = NEW System.Drawing.Size(257, 21).
		coItems:SyncWithCurrencyManager = FALSE.
		coItems:TabIndex = 12.
		coItems:ValueChanged:SUBSCRIBE(THIS-OBJECT:coItems_ValueChanged).
		/*  */
		/* lblItems */
		/*  */
		lblItems:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		lblItems:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		lblItems:Location = NEW System.Drawing.Point(8, 16).
		lblItems:Name = "lblItems".
		lblItems:Size = NEW System.Drawing.Size(258, 16).
		lblItems:TabIndex = 11.
		lblItems:Text = "Items".
		lblItems:UseCompatibleTextRendering = TRUE.
		/*  */
		/* pgItem */
		/*  */
		pgItem:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		pgItem:CommandsBackColor = System.Drawing.Color:WhiteSmoke.
		pgItem:HelpVisible = FALSE.
		pgItem:LineColor = System.Drawing.SystemColors:ScrollBar.
		pgItem:Location = NEW System.Drawing.Point(8, 96).
		pgItem:Name = "pgItem".
		pgItem:PropertySort = System.Windows.Forms.PropertySort:Alphabetical.
		pgItem:Size = NEW System.Drawing.Size(258, 332).
		pgItem:TabIndex = 9.
		pgItem:ToolbarVisible = FALSE.
		pgItem:UseCompatibleTextRendering = TRUE.
		pgItem:PropertyValueChanged:SUBSCRIBE(THIS-OBJECT:pgItem_PropertyValueChanged).
		/*  */
		/* label10 */
		/*  */
		label10:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		label10:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label10:Location = NEW System.Drawing.Point(8, 80).
		label10:Name = "label10".
		label10:Size = NEW System.Drawing.Size(258, 16).
		label10:TabIndex = 10.
		label10:Text = "Properties".
		label10:UseCompatibleTextRendering = TRUE.
		/*  */
		/* splitter4 */
		/*  */
		splitter4:BackColor = System.Drawing.SystemColors:ControlDark.
		splitter4:BorderStyle = System.Windows.Forms.BorderStyle:FixedSingle.
		splitter4:Location = NEW System.Drawing.Point(224, 0).
		splitter4:Name = "splitter4".
		splitter4:Size = NEW System.Drawing.Size(5, 472).
		splitter4:TabIndex = 7.
		splitter4:TabStop = FALSE.
		/*  */
		/* pnlGroups */
		/*  */
		pnlGroups:Controls:Add(cmdRemoveGroup).
		pnlGroups:Controls:Add(cmdAddGroup).
		pnlGroups:Controls:Add(coGroups).
		pnlGroups:Controls:Add(pgGroup).
		pnlGroups:Controls:Add(label7).
		pnlGroups:Controls:Add(label6).
		pnlGroups:Dock = System.Windows.Forms.DockStyle:Left.
		pnlGroups:Location = NEW System.Drawing.Point(0, 0).
		pnlGroups:Name = "pnlGroups".
		pnlGroups:Size = NEW System.Drawing.Size(224, 472).
		pnlGroups:TabIndex = 6.
		/*  */
		/* cmdRemoveGroup */
		/*  */
		cmdRemoveGroup:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		cmdRemoveGroup:ButtonStyle = Infragistics.Win.UIElementButtonStyle:WindowsXPCommandButton.
		cmdRemoveGroup:Location = NEW System.Drawing.Point(117, 437).
		cmdRemoveGroup:Name = "cmdRemoveGroup".
		cmdRemoveGroup:Size = NEW System.Drawing.Size(99, 23).
		cmdRemoveGroup:TabIndex = 12.
		cmdRemoveGroup:Text = "Remove Group".
		cmdRemoveGroup:Click:SUBSCRIBE(THIS-OBJECT:cmdRemoveGroup_Click).
		/*  */
		/* cmdAddGroup */
		/*  */
		cmdAddGroup:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
		cmdAddGroup:ButtonStyle = Infragistics.Win.UIElementButtonStyle:WindowsXPCommandButton.
		cmdAddGroup:Location = NEW System.Drawing.Point(8, 437).
		cmdAddGroup:Name = "cmdAddGroup".
		cmdAddGroup:Size = NEW System.Drawing.Size(75, 23).
		cmdAddGroup:TabIndex = 11.
		cmdAddGroup:Text = "Add Group".
		cmdAddGroup:Click:SUBSCRIBE(THIS-OBJECT:cmdAddGroup_Click).
		/*  */
		/* coGroups */
		/*  */
		coGroups:Location = NEW System.Drawing.Point(8, 31).
		coGroups:Name = "coGroups".
		coGroups:Size = NEW System.Drawing.Size(208, 21).
		coGroups:SyncWithCurrencyManager = FALSE.
		coGroups:TabIndex = 10.
		coGroups:ValueChanged:SUBSCRIBE(THIS-OBJECT:coGroups_ValueChanged).
		/*  */
		/* label6 */
		/*  */
		label6:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		label6:Location = NEW System.Drawing.Point(8, 16).
		label6:Name = "label6".
		label6:Size = NEW System.Drawing.Size(216, 16).
		label6:TabIndex = 8.
		label6:Text = "Group".
		label6:UseCompatibleTextRendering = TRUE.
		/*  */
		/* tabPage3 */
		/*  */
		tabPage3:BackColor = System.Drawing.Color:WhiteSmoke.
		tabPage3:Controls:Add(groupBox2).
		tabPage3:Controls:Add(groupBox1).
		tabPage3:Location = NEW System.Drawing.Point(4, 22).
		tabPage3:Name = "tabPage3".
		tabPage3:Size = NEW System.Drawing.Size(503, 472).
		tabPage3:TabIndex = 2.
		tabPage3:Text = "Layout".
		/*  */
		/* BasicProperties */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(771, 574).
		THIS-OBJECT:Controls:Add(panel2).
		THIS-OBJECT:Controls:Add(ultraExplorerBar1).
		THIS-OBJECT:Controls:Add(splitter1).
		THIS-OBJECT:Controls:Add(tabControl1).
		THIS-OBJECT:Name = "BasicProperties".
		THIS-OBJECT:Text = "Basic Features".
		tabPage1:ResumeLayout(FALSE).
		tabPage1:PerformLayout().
		CAST(coUseLargeGroupHeaderImages, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(coAcceptFocus, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(coViewStyle, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(coStyle, System.ComponentModel.ISupportInitialize):EndInit().
		pnlPropertyGrids:ResumeLayout(FALSE).
		panel5:ResumeLayout(FALSE).
		CAST(ultraExplorerBar1, System.ComponentModel.ISupportInitialize):EndInit().
		panel4:ResumeLayout(FALSE).
		CAST(coGroupStyle, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(spinColumnsSpanned, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(tbGroupSpacing, System.ComponentModel.ISupportInitialize):EndInit().
		groupBox1:ResumeLayout(FALSE).
		CAST(tbLeftMargin, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(tbBottomMargin, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(tbRightMargin, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(tbTopMargin, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(tbColumnSpacing, System.ComponentModel.ISupportInitialize):EndInit().
		groupBox3:ResumeLayout(FALSE).
		groupBox3:PerformLayout().
		CAST(coGroups2, System.ComponentModel.ISupportInitialize):EndInit().
		panel2:ResumeLayout(FALSE).
		CAST(pictureBox1, System.ComponentModel.ISupportInitialize):EndInit().
		tabPage4:ResumeLayout(FALSE).
		CAST(spinColumnCount, System.ComponentModel.ISupportInitialize):EndInit().
		groupBox2:ResumeLayout(FALSE).
		tabControl1:ResumeLayout(FALSE).
		tabPage2:ResumeLayout(FALSE).
		pnlItems:ResumeLayout(FALSE).
		pnlItems:PerformLayout().
		CAST(coItems, System.ComponentModel.ISupportInitialize):EndInit().
		pnlGroups:ResumeLayout(FALSE).
		pnlGroups:PerformLayout().
		CAST(coGroups, System.ComponentModel.ISupportInitialize):EndInit().
		tabPage3:ResumeLayout(FALSE).
		THIS-OBJECT:ResumeLayout(FALSE).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Initialize all the controls in page 1 "Look and Behavior"
			Notes: DefaultableBoolean is the boolean datatype for the Infragistics
			       controls. This is in the Infragistics.Win.* package.
	------------------------------------------------------------------------------*/

	METHOD PRIVATE VOID InitializeLookBehaviorControls(  ):
		loadStyleCombo().
        loadViewStyleCombo().
        loadGroupStyleCombo().
        loadLargeGroupHeaderImageCombo().
        loadAcceptFocusCombo().
        
        /*Assigns the initial values for the combo-box editors*/
        ASSIGN coStyle:VALUE      = CAST(ultraExplorerBar1:Style, UltraExplorerBarStyle)
               coViewStyle:VALUE  = CAST(ultraExplorerBar1:ViewStyle, UltraExplorerBarViewStyle)
               coGroupStyle:VALUE = CAST(ultraExplorerBar1:GroupSettings:Style, GroupStyle)
               pgItemSettings:SelectedObject = ultraExplorerBar1:ItemSettings
               coAcceptFocus:VALUE           = CAST(ultraExplorerBar1:AcceptsFocus, DefaultableBoolean)
               coUseLargeGroupHeaderImages:VALUE = CAST(ultraExplorerBar1:UseLargeGroupHeaderImages, DefaultableBoolean).
        ASSIGN coGroups:SelectedIndex  = 0
               coGroups2:SelectedIndex = 0.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID InitializeGroupsItemsControls():
	    DEFINE VARIABLE groupNumber  AS INTEGER NO-UNDO.
	    DEFINE VARIABLE totalGroups  AS INTEGER NO-UNDO.
	    DEFINE VARIABLE currentGroup AS INTEGER NO-UNDO.
	    DEFINE VARIABLE valueList    AS ValueListItem NO-UNDO.
	    DEFINE VARIABLE valueList2   AS ValueListItem NO-UNDO.
	    DEFINE VARIABLE groupObject  AS UltraExplorerBarGroup NO-UNDO.
	    DEFINE VARIABLE groups       AS DisposableObjectCollectionBase NO-UNDO.
	    DEFINE VARIABLE groupItems   AS System.Array  NO-UNDO.
	    DEFINE VARIABLE groupItems2  AS System.Array  NO-UNDO.

        coGroups:Items:Clear().
        coGroups2:Items:Clear().
        groups = ultraExplorerBar1:Groups.
	    totalGroups = groups:COUNT - 1.
        groupItems = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.ValueListItem"), totalGroups + 1).
        groupItems2 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.ValueListItem"), totalGroups + 1).

	    REPEAT currentGroup = 0 TO totalGroups:
	       ASSIGN groupObject           = CAST(groups:GetItem(currentGroup), UltraExplorerBarGroup)
	              valueList             = NEW ValueListItem()
	              valueList:DisplayText = groupObject:TEXT
	              valueList:DataValue   = groupObject.
	       groupItems:SetValue(valueList, currentGroup).

           ASSIGN valueList2             = NEW ValueListItem()
	              valueList2:DisplayText = groupObject:TEXT
	              valueList2:DataValue   = groupObject.
           groupItems2:SetValue(valueList2, currentGroup).
	    END.

	    coGroups:Items:AddRange(CAST(groupItems, "Infragistics.Win.ValueListItem[]")).
	    coGroups2:Items:AddRange(CAST(groupItems2, "Infragistics.Win.ValueListItem[]")).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID LoadGroupItems(INPUT newGroup AS UltraExplorerBarGroup):
	    DEFINE VARIABLE totalItems   AS INTEGER NO-UNDO.
	    DEFINE VARIABLE currentItem  AS INTEGER NO-UNDO.
	    DEFINE VARIABLE items        AS DisposableObjectCollectionBase NO-UNDO.
	    DEFINE VARIABLE itemObject   AS UltraExplorerBarItem NO-UNDO.
	    DEFINE VARIABLE groupItems   AS System.Array  NO-UNDO.
	    DEFINE VARIABLE valueList    AS ValueListItem NO-UNDO.

	    coItems:Items:Clear().

        ASSIGN items = newGroup:Items
               totalItems = items:COUNT - 1
               groupItems = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.ValueListItem"), totalItems + 1).

        REPEAT currentItem = 0 TO totalItems:
            ASSIGN itemObject = CAST(items:GetItem(currentItem), UltraExplorerBarItem)
                   valueList = NEW ValueListItem()
	               valueList:DisplayText = itemObject:TEXT
	               valueList:DataValue   = itemObject.

            groupItems:SetValue(valueList, currentItem).
        END.

        coItems:Items:AddRange(CAST(groupItems, "Infragistics.Win.ValueListItem[]")).
        IF totalItems > 0 THEN
            ASSIGN coItems:SelectedIndex = 0
            .
	END METHOD.
 
	/*------------------------------------------------------------------------------
			Purpose: Loads the items for the coGroupStyle combo-box.

			Notes:   The method used here to load the combo-box items is by creating
			ValueListItem and then assgining them to the combo-box.

            Objecs used in the USING definitions:

                USING Infragistics.Win.*.
                    ValueListItem

                USING Infragistics.Win.UltraWinExplorerBar.*.
                    GroupStyle
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID LoadGroupStyleCombo(  ):
		DEFINE VARIABLE valueListSmallImages              AS ValueListItem NO-UNDO.
		DEFINE VARIABLE valueListSmallImagesWithText      AS ValueListItem NO-UNDO.
		DEFINE VARIABLE valueListLargeImages              AS ValueListItem NO-UNDO.
		DEFINE VARIABLE valueListLargeImagesWithText      AS ValueListItem NO-UNDO.
		DEFINE VARIABLE valueListLargeImagesWithTextBelow AS ValueListItem NO-UNDO.
        DEFINE VARIABLE grouptStyleItems                  AS System.Array  NO-UNDO.

		ASSIGN valueListSmallImages              = NEW ValueListItem()
		       valueListSmallImagesWithText      = NEW ValueListItem()
		       valueListLargeImages              = NEW ValueListItem()
		       valueListLargeImagesWithText      = NEW ValueListItem()
		       valueListLargeImagesWithTextBelow = NEW ValueListItem().

        ASSIGN valueListSmallImages:DataValue                = GroupStyle:SmallImages
		       valueListSmallImages:DisplayText              = "SmallImages"
		       valueListSmallImagesWithText:DataValue        = GroupStyle:SmallImagesWithText
		       valueListSmallImagesWithText:DisplayText      = "SmallImagesWithText"
		       valueListLargeImages:DataValue                = GroupStyle:LargeImages
		       valueListLargeImages:DisplayText              = "LargeImages"
		       valueListLargeImagesWithText:DataValue        = GroupStyle:LargeImagesWithText
		       valueListLargeImagesWithText:DisplayText      = "LargeImagesWithText"
		       valueListLargeImagesWithTextBelow:DataValue   = GroupStyle:LargeImagesWithTextBelow
		       valueListLargeImagesWithTextBelow:DisplayText = "LargeImagesWithTextBelow".

		grouptStyleItems = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.ValueListItem"), 5).
		grouptStyleItems:SetValue(valueListSmallImages, 0).
	    grouptStyleItems:SetValue(valueListSmallImagesWithText, 1).
	    grouptStyleItems:SetValue(valueListLargeImages, 2).
	    grouptStyleItems:SetValue(valueListLargeImagesWithText, 3).
	    grouptStyleItems:SetValue(valueListLargeImagesWithTextBelow, 4).

		coGroupStyle:Items:AddRange(CAST(grouptStyleItems, "Infragistics.Win.ValueListItem[]")).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Loads the items for the coStyle combo-box.

			Notes:   The method used here to load the combo-box items is by creating
			ValueListItem and then assgining them to the combo-box.

            Objecs used in the USING definitions:

                USING Infragistics.Win.*.
                    ValueListItem

                USING Infragistics.Win.UltraWinExplorerBar.*.
                    UltraExplorerBarStyle
	------------------------------------------------------------------------------*/
	METHOD PUBLIC VOID LoadStyleCombo(  ):
		DEFINE VARIABLE valueListExplorerBar             AS ValueListItem NO-UNDO.
		DEFINE VARIABLE valueListListBar                 AS ValueListItem NO-UNDO.
		DEFINE VARIABLE valueListToolbox                 AS ValueListItem NO-UNDO.
		DEFINE VARIABLE OutlookNavigationPane            AS ValueListItem NO-UNDO.
		DEFINE VARIABLE valueListVisualStudio2005Toolbox AS ValueListItem NO-UNDO.
        DEFINE VARIABLE styleItems                       AS System.Array  NO-UNDO.

		ASSIGN valueListExplorerBar             = NEW ValueListItem()
		       valueListListBar                 = NEW ValueListItem()
		       valueListToolbox                 = NEW ValueListItem()
	           OutlookNavigationPane            = NEW ValueListItem()
		       valueListVisualStudio2005Toolbox = NEW ValueListItem().

        ASSIGN valueListExplorerBar:DataValue               = UltraExplorerBarStyle:ExplorerBar
		       valueListExplorerBar:DisplayText             = "ExplorerBar"
		       valueListListBar:DataValue                   = UltraExplorerBarStyle:Listbar
		       valueListListBar:DisplayText                 = "Listbar"
		       valueListToolbox:DataValue                   = UltraExplorerBarStyle:Toolbox
		       valueListToolbox:DisplayText                 = "Toolbox"
		       OutlookNavigationPane:DataValue              = UltraExplorerBarStyle:OutlookNavigationPane
		       OutlookNavigationPane:DisplayText            = "OutlookNavigationPane"
		       valueListVisualStudio2005Toolbox:DataValue   = UltraExplorerBarStyle:VisualStudio2005Toolbox
		       valueListVisualStudio2005Toolbox:DisplayText = "VisualStudio2005Toolbox".

		styleItems = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.ValueListItem"), 5).
		styleItems:SetValue(valueListExplorerBar, 0).
	    styleItems:SetValue(valueListListBar, 1).
		styleItems:SetValue(valueListToolbox, 2).
		styleItems:SetValue(OutlookNavigationPane, 3).
		styleItems:SetValue(valueListVisualStudio2005Toolbox, 4).
		coStyle:Items:AddRange(CAST(styleItems, "Infragistics.Win.ValueListItem[]")).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Loads the items for the coViewStyle combo-box.

			Notes:   The method used here to load the combo-box items is by creating
			ValueListItem and then assgining them to the combo-box.

            Objecs used in the USING definitions:

                USING Infragistics.Win.*.
                    ValueListItem

                USING Infragistics.Win.UltraWinExplorerBar.*.
                    UltraExplorerBarStyle
	------------------------------------------------------------------------------*/
	METHOD PUBLIC VOID LoadViewStyleCombo():
		DEFINE VARIABLE valueListXPExplorerBar    AS ValueListItem NO-UNDO.
		DEFINE VARIABLE valueListXP               AS ValueListItem NO-UNDO.
		DEFINE VARIABLE valueListOffice2000       AS ValueListItem NO-UNDO.
		DEFINE VARIABLE valueListOffice2003       AS ValueListItem NO-UNDO.
		DEFINE VARIABLE valueListVisualStudio2005 AS ValueListItem NO-UNDO.
		DEFINE VARIABLE valueListOffice2007       AS ValueListItem NO-UNDO.
        DEFINE VARIABLE viewStyleItems            AS System.Array  NO-UNDO.

        ASSIGN valueListXPExplorerBar    = NEW ValueListItem()
               valueListXP               = NEW ValueListItem()
               valueListOffice2000       = NEW ValueListItem()
               valueListOffice2003       = NEW ValueListItem()
               valueListVisualStudio2005 = NEW ValueListItem()
               valueListOffice2007       = NEW ValueListItem().

        ASSIGN
		valueListXPExplorerBar:DataValue      = UltraExplorerBarViewStyle:XPExplorerBar
		valueListXPExplorerBar:DisplayText    = "XPExplorerBar".
		valueListXP:DataValue                 = UltraExplorerBarViewStyle:XP.
		valueListXP:DisplayText               = "XP".
		valueListOffice2000:DataValue         = UltraExplorerBarViewStyle:Office2000.
		valueListOffice2000:DisplayText       = "Office2000".
	    valueListOffice2003:DataValue         = UltraExplorerBarViewStyle:Office2003.
		valueListOffice2003:DisplayText       = "Office2003".
		valueListVisualStudio2005:DataValue   = UltraExplorerBarViewStyle:VisualStudio2005.
		valueListVisualStudio2005:DisplayText = "VisualStudio2005".
		valueListOffice2007:DataValue         = UltraExplorerBarViewStyle:Office2007.
		valueListOffice2007:DisplayText       = "Office2007".

		viewStyleItems = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.ValueListItem"), 6).
		viewStyleItems:SetValue(valueListXPExplorerBar, 0).
		viewStyleItems:SetValue(valueListXP, 1).
		viewStyleItems:SetValue(valueListOffice2000, 2).
		viewStyleItems:SetValue(valueListOffice2003, 3).
		viewStyleItems:SetValue(valueListVisualStudio2005, 4).
		viewStyleItems:SetValue(valueListOffice2007, 5).
		coViewStyle:Items:AddRange(CAST(viewStyleItems, "Infragistics.Win.ValueListItem[]")).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Loads the logical values (True/False) for the
			         coUseLargeGroupHeaderImages combo-box.
			Notes: The data value type used by the ultraExplorerBar1:UseLargeGroupHeaderImages
			       is DefaultableBoolean, this is included in the Infragistics.Win package
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID LoadLargeGroupHeaderImageCombo():
		DEFINE VARIABLE valueListTrue    AS ValueListItem NO-UNDO.
		DEFINE VARIABLE valueListFalse   AS ValueListItem NO-UNDO.
        DEFINE VARIABLE comboItems       AS System.Array NO-UNDO.

        ASSIGN valueListTrue              = NEW ValueListItem()
               valueListFalse             = NEW ValueListItem()
               valueListTrue:DataValue    = DefaultableBoolean:True
               valueListTrue:DisplayText  = "True"
               valueListFalse:DataValue   = DefaultableBoolean:False
               valueListFalse:DisplayText = "False".

		comboItems = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.ValueListItem"), 2).
		comboItems:SetValue(valueListTrue, 0).
		comboItems:SetValue(valueListFalse, 1).
		coUseLargeGroupHeaderImages:Items:AddRange(CAST(comboItems, "Infragistics.Win.ValueListItem[]")).
	END METHOD.

	/*----------------------------------------------------------------------------------------
			Purpose: Loads the logical values (True/False) for the
			         coAcceptFocus combo-box.
			Notes: The data value type used by the ultraExplorerBar1:UseLargeGroupHeaderImages
			       is DefaultableBoolean, this is included in the Infragistics.Win package.
	----------------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID LoadAcceptFocusCombo():
		DEFINE VARIABLE valueListTrue    AS ValueListItem NO-UNDO.
		DEFINE VARIABLE valueListFalse   AS ValueListItem NO-UNDO.
        DEFINE VARIABLE comboItems       AS System.Array NO-UNDO.

        ASSIGN valueListTrue              = NEW ValueListItem()
               valueListFalse             = NEW ValueListItem()
               valueListTrue:DataValue    = DefaultableBoolean:True
               valueListTrue:DisplayText  = "True"
               valueListFalse:DataValue   = DefaultableBoolean:False
               valueListFalse:DisplayText = "False".

		comboItems = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.ValueListItem"), 2).
		comboItems:SetValue(valueListTrue, 0).
		comboItems:SetValue(valueListFalse, 1).
		coAcceptFocus:Items:AddRange(CAST(comboItems, "Infragistics.Win.ValueListItem[]")).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Returns the the type of "Margins" selected in the coMargins
			         combo-box.
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
    METHOD PRIVATE System.Object GetSelectedMarginsObject():
		CASE coMargins:SelectedIndex:
			WHEN 0 THEN
			    RETURN ultraExplorerBar1:Margins.
            WHEN 1 THEN
			    RETURN ultraExplorerBar1:GroupSettings:ItemAreaInnerMargins.
            WHEN 2 THEN
		        RETURN ultraExplorerBar1:GroupSettings:ItemAreaOuterMargins.
		END CASE.
		RETURN ultraExplorerBar1:Margins.
     END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Refreshes the values of the labels used to display the values
			         of the currently selected margins object.
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
    METHOD PRIVATE VOID RefreshMarginLabelValues():
        ASSIGN lblLeftMargin:TEXT   = STRING(tbLeftMargin:VALUE)
			   lblTopMargin:TEXT    = STRING(tbTopMargin:VALUE)
			   lblRightMargin:TEXT  = STRING(tbRightMargin:VALUE)
			   lblBottomMargin:TEXT = STRING(tbBottomMargin:VALUE).
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Refreshes the values of the trackbars used to change the values
			         of the currently selected margins object.
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
    METHOD PRIVATE VOID RefreshMarginTrackBarValues():
        DEFINE VARIABLE margins AS System.Object NO-UNDO.
		DEFINE VARIABLE margin  AS Margins NO-UNDO.

		ASSIGN margins              = GetSelectedMarginsObject()
		       margin               = CAST(margins, Margins)
               tbLeftMargin:Value   = margin:Left
               tbTopMargin:Value    = margin:Top
               tbRightMargin:Value  = margin:Right
               tbBottomMargin:Value = margin:Bottom.
    END METHOD.

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID LoadCancelableEventsList(): 
	    liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:ActiveGroupChanging)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:ActiveItemChanging)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:ContextMenuInitializing)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:GroupAdding)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:GroupCollapsing)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:GroupDragging)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:GroupEnteringEditMode)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:GroupExitingEditMode)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:GroupExpanding)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:GroupRemoving)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:ItemAdding)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:ItemCheckStateChanging)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:ItemDragging)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:ItemEnteringEditMode)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:ItemExitingEditMode)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:ItemRemoving)).
        liEvents:Items:Add(NEW EventWrapper(UltraExplorerBarEventIds:SelectedGroupChanging)).
	END METHOD.

    METHOD PRIVATE VOID LogEvent(INPUT eventId AS UltraExplorerBarEventIds, INPUT info AS CHARACTER, INPUT cancelable AS LOGICAL, INPUT CANCELLED AS LOGICAL):
        DEFINE VARIABLE eventLogEntry AS ListViewItem NO-UNDO.

        eventLogEntry = new ListViewItem(eventId:ToString()).

        eventLogEntry:SubItems:Add(info).
        eventLogEntry:SubItems:Add(STRING(cancelable)).
        eventLogEntry:SubItems:Add(STRING(cancelled)).

        lvEventLog:Items:Add(eventLogEntry).
        lvEventLog:EnsureVisible(eventLogEntry:Index).

    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE LOGICAL IsEventCancelled(INPUT eventId AS UltraExplorerBarEventIds) :
        DEFINE VARIABLE i AS INTEGER NO-UNDO.
        DEFINE VARIABLE totalItems AS INTEGER NO-UNDO.
        DEFINE VARIABLE eventWrapper AS EventWrapper NO-UNDO.
        DEFINE VARIABLE enum AS IEnumerator no-undo.

        ASSIGN totalItems = liEvents:Items:Count
               enum = liEvents:Items:GetEnumerator().

        enum:Reset().
        REPEAT:
            IF NOT enum:MoveNext() THEN LEAVE.
            eventWrapper = CAST(enum:Current, EventWrapper).
            
            IF eventWrapper:eventID:Equals(eventId) THEN
                RETURN liEvents:GetItemCheckState(i):Equals(CheckState:CHECKED).
            ASSIGN i = i + 1.
        END.

    END METHOD.


	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE CHARACTER GetFormattedGroupDescription(INPUT currentGroup AS UltraExplorerBarGroup):
        IF VALID-OBJECT(currentGroup) THEN
            RETURN "[" + STRING(currentGroup:Index) + "] - " + currentGroup:TEXT.
        ELSE
            RETURN  "<null group>".
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE CHARACTER GetFormattedItemDescription(INPUT currentItem AS UltraExplorerBarItem):

        IF VALID-OBJECT(currentItem) THEN
            RETURN "[" + STRING(currentItem:Index) + "] - " + currentItem:Text.
        ELSE
            RETURN "<null item>".
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID coStyle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        ultraExplorerBar1:Style = CAST(coStyle:Value, UltraExplorerBarStyle).
        pgGroupSettings:Refresh().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID coViewStyle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        ultraExplorerBar1:ViewStyle = CAST(coViewStyle:Value, UltraExplorerBarViewStyle).
        pgGroupSettings:Refresh().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID coGroupStyle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        ultraExplorerBar1:GroupSettings:Style = CAST(coGroupStyle:Value, GroupStyle).
  	    pgGroupSettings:Refresh().
  	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes: DefaultableBoolean is the boolean datatype for the Infragistics
			       controls. This is in the Infragistics.Win.* package.
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID coAcceptFocus_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    ultraExplorerBar1:AcceptsFocus = CAST(coAcceptFocus:Value, Infragistics.Win.DefaultableBoolean).
   	    pgGroupSettings:Refresh().
   	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID chSupportThemes_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		ultraExplorerBar1:SupportThemes = chSupportThemes:Checked.
	    pgGroupSettings:Refresh().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes: DefaultableBoolean is the boolean datatype for the Infragistics
			       controls. This is in the Infragistics.Win.* package.
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID coUseLargeGroupHeaderImages_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    ultraExplorerBar1:UseLargeGroupHeaderImages = CAST(coUseLargeGroupHeaderImages:VALUE, DefaultableBoolean).
        pgGroupSettings:REFRESH().
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Synchronize the required controls when a ultraExplorerBar1
			         property is modified using the pgGroupSettings PropertiesGrid
			         control (this is the grid on the left on page 1.
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID pgGroupSettings_PropertyValueChanged( INPUT s AS System.Object, INPUT e AS System.Windows.Forms.PropertyValueChangedEventArgs ):
        ASSIGN coStyle:VALUE           = ultraExplorerBar1:Style
               coViewStyle:Value       = ultraExplorerBar1:ViewStyle
               coGroupStyle:VALUE      = ultraExplorerBar1:GroupSettings:Style
               coAcceptFocus:VALUE     = ultraExplorerBar1:AcceptsFocus
               chSupportThemes:CHECKED = ultraExplorerBar1:SupportThemes
               coUseLargeGroupHeaderImages:VALUE = ultraExplorerBar1:UseLargeGroupHeaderImages.
	END METHOD. 

	/*------------------------------------------------------------------------------
			Purpose: Refresh the groups property grid (pgGroup) with the selected
			         group in the combo-box, and reloads the item combo-box with the
			         items for the selected group.
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID coGroups_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    pgGroup:SelectedObject = CAST(coGroups:Value,UltraExplorerBarGroup).
        LoadGroupItems(CAST(coGroups:Value,UltraExplorerBarGroup)).
        coGroups2:VALUE = coGroups:VALUE.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Reloads the items property grid (pgItem) with the new selected
			         item in the combo-box.
			Notes: 
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID coItems_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        pgItem:SelectedObject = CAST(coItems:Value,UltraExplorerBarItem).
        
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Adds the new group to the UltraWinExplorerBar and in the
			         groups combo-box.
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cmdAddGroup_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE valueList    AS ValueListItem         NO-UNDO.
	    DEFINE VARIABLE newGroup     AS UltraExplorerBarGroup NO-UNDO.

        ASSIGN
               /*Adds the group to the explorer bar and stores its reference in the newGroup variable*/
               newGroup              = ultraExplorerBar1:Groups:Add()
               newGroup:TEXT         = "New Added Group"
               /*Creates the new ValueListItem and assigns its text and value properties*/
               valueList             = NEW ValueListItem()
	           valueList:DisplayText = newGroup:TEXT
	           valueList:DataValue   = newGroup.

        /*Inserts the new item in the combo-box*/
	    coGroups:items:Insert(coGroups:Items:Count, valueList).

	    /*Resets the combo-box text and reloads the items for the new group*/
	    coGroups:VALUE = valueList.
	    coItems:TEXT = "".
	    LoadGroupItems(newGroup).
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Synchronize the Groups combo-box (coGroups) with the new
			         group text assigned in the properties grid.
			Notes: Only synchronizes if the modified property is "Text":
			            e:ChangedItem:Label = "Text" THEN
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID pgGroup_PropertyValueChanged( INPUT s AS System.Object, INPUT e AS System.Windows.Forms.PropertyValueChangedEventArgs ):
	    DEFINE VARIABLE selectedIndex AS INTEGER NO-UNDO.

        IF e:ChangedItem:Label = "Text" THEN 	    
	    DO:
	        selectedIndex = coGroups:SelectedIndex. 
            InitializeGroupsItemsControls().
            coGroups:SelectedIndex = selectedIndex.
        END.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cmdRemoveGroup_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        ultraExplorerBar1:Groups:RemoveAt(coGroups:SelectedIndex).
        coGroups:Items:RemoveAt(coGroups:SelectedIndex).

        IF coGroups:Items:Count > 0 THEN
            coGroups:SelectedIndex = 0.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Adds the new item to the UltraWinExplorerBar and in the
			         items combo-box.
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cmdAddItem_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE valueList     AS ValueListItem         NO-UNDO.
	    DEFINE VARIABLE selectedGroup AS UltraExplorerBarGroup NO-UNDO.
	    DEFINE VARIABLE newItem       AS UltraExplorerBarItem  NO-UNDO.

	    /*Gets the selected object in the groups combo-box (coGroups)*/
	    selectedGroup = ultraExplorerBar1:Groups[coGroups:SelectedIndex].

        ASSIGN
               /*Adds the item to the explorer bar and stores its reference in the newItem variable*/
               newItem              = selectedGroup:Items:Add()
               newItem:TEXT         = "New Added Item"
               /*Creates the new ValueListItem and assigns its text and value properties*/
               valueList             = NEW ValueListItem()
	           valueList:DisplayText = newItem:TEXT
	           valueList:DataValue   = newItem.

        /*Inserts the new item in the combo-box*/
	    coItems:items:Insert(coItems:Items:Count, valueList).

	    /*Selects the new item in the combo-box.*/
	    coItems:VALUE = valueList.
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cmdRemoveItem_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE selectedGroup AS UltraExplorerBarGroup NO-UNDO.

	    selectedGroup = ultraExplorerBar1:Groups[coGroups:SelectedIndex].
        selectedGroup:Items:RemoveAt(coItems:SelectedIndex).
        coGroups:Items:RemoveAt(coItems:SelectedIndex).

        IF coItems:Items:Count > 0 THEN
            coItems:SelectedIndex = 0.
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: Synchronize the Items combo-box (coItems) with the new
			         item text assigned in the properties grid.
			Notes: Only synchronizes if the modified property is "Text":
			            e:ChangedItem:Label = "Text" THEN
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID pgItem_PropertyValueChanged( INPUT s AS System.Object, INPUT e AS System.Windows.Forms.PropertyValueChangedEventArgs ):
	    DEFINE VARIABLE selectedIndex AS INTEGER NO-UNDO.

        IF e:ChangedItem:Label = "Text" THEN 	    
	    DO:
	        selectedIndex = coItems:SelectedIndex. 
            loadGroupItems(CAST(coGroups:value, UltraExplorerBarGroup)).
            coItems:SelectedIndex = selectedIndex.
        END.
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID coGroups2_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        IF (coGroups2:SelectedIndex  >  -1) THEN
		    spinColumnsSpanned:Value = ultraExplorerBar1:Groups[coGroups2:SelectedIndex]:ColumnsSpanned.
        coGroups:VALUE = coGroups2:VALUE.
	END METHOD.

	/*-----------------------------------------------------------------------------------
			Purpose: Sets the ColumnCount property for the explorer bar.

			ColumnCount property description:
			Returns/sets the number of columns created to display UltraExplorerBarGroups.
			Only applies to control UltraExplorerBar:Style "ExplorerBar".

			Notes:
	------------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID spinColumnCount_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        ultraExplorerBar1:ColumnCount = spinColumnCount:Value.
	END METHOD.

	/*---------------------------------------------------------------------------------
			Purpose: Sets the ColumnsSpanned for the group.

			ColumnsSpanned property description:
			Returns/sets the number of columns spanned by the UltraExplorerBarGroup.

			Notes:
	----------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID spinColumnsSpanned_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    if (coGroups2:SelectedIndex  >  -1) THEN
		    ultraExplorerBar1:Groups[coGroups2:SelectedIndex]:ColumnsSpanned = spinColumnsSpanned:Value.
	END METHOD.

	/*------------------------------------------------------------------------------------------
			Purpose: Sets the ColumnSpacing property

			ColumnSpacing property descripcion:
			Returns/sets the distance between columns created to display UltraExplorerBarGroups.
			Only applies to control UltraExplorerBar.Style "ExplorerBar".

			Notes: 
	------------------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID tbColumnSpacing_Scroll( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        ultraExplorerBar1:ColumnSpacing = tbColumnSpacing:Value.
	END METHOD.

	/*-------------------------------------------------------------------------------
			Purpose: Sets the GroupSacing property

			ColumnSpace property description:
			Returns/sets the amount of vertical space between UltraExplorerBarGroups,
			in pixels. Only applies to control UltraExplorerBar.Style "ExplorerBar".

			Notes:
	-------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID tbGroupSpacing_Scroll( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        ultraExplorerBar1:GroupSpacing = tbGroupSpacing:VALUE.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID tbTopMargin_Scroll( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE margin AS System.Object NO-UNDO.

	    margin = GetSelectedMarginsObject().
        CAST(margin, Infragistics.Win.Margins):Top = tbTopMargin:VALUE.
		RefreshMarginLabelValues().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID tbLeftMargin_Scroll( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE margin AS System.Object NO-UNDO.

	    margin = GetSelectedMarginsObject().
        CAST(margin, Margins):Left = tbLeftMargin:VALUE.
		RefreshMarginLabelValues().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID tbBottomMargin_Scroll( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE margin AS System.Object NO-UNDO.

	    margin = GetSelectedMarginsObject().
        CAST(margin, Margins):Bottom = tbBottomMargin:VALUE.
		RefreshMarginLabelValues().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID tbRightMargin_Scroll( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE margin AS System.Object NO-UNDO.

        margin = GetSelectedMarginsObject(). 
        CAST(margin, Margins):Right = tbRightMargin:VALUE.
		RefreshMarginLabelValues().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cmdResetMarginsToDefaults_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
			DEFINE VARIABLE margins AS System.Object NO-UNDO.
			DEFINE VARIABLE margin  AS Margins NO-UNDO.
		
		    ASSIGN margins = GetSelectedMarginsObject()
			       margin = CAST(margins, Margins)
                   margin:LEFT   = -1
                   margin:TOP    = -1
                   margin:RIGHT  = -1
                   margin:BOTTOM = -1.

			RefreshMarginTrackBarValues().
			RefreshMarginLabelValues().
     END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID coMargins_SelectedIndexChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        RefreshMarginTrackBarValues().
        RefreshMarginLabelValues().
	END METHOD.

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ActiveGroupChanged( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.GroupEventArgs ):
        LogEvent(UltraExplorerBarEventIds:ActiveGroupChanged, GetFormattedGroupDescription(e:Group), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ActiveGroupChanging( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableGroupEventArgs ):
            e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:ActiveGroupChanging).
            LogEvent(UltraExplorerBarEventIds:ActiveGroupChanging, GetFormattedGroupDescription(e:Group), true, e:Cancel).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cmdClearEventLog_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        lvEventLog:Items:Clear().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes: 
	-----------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ActiveItemChanged( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.ItemEventArgs ):
        LogEvent(UltraExplorerBarEventIds:ActiveItemChanged,GetFormattedItemDescription(e:Item), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ActiveItemChanging( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableItemEventArgs ):
        e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:ActiveItemChanging).
        LogEvent(UltraExplorerBarEventIds:ActiveItemChanging,GetFormattedItemDescription(e:Item), true, e:Cancel).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ContextMenuInitializing( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableContextMenuInitializingEventArgs ):
        e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:ContextMenuInitializing).
        LogEvent(UltraExplorerBarEventIds:ContextMenuInitializing, "", true, e:Cancel).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupAdded( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.GroupEventArgs ):
		LogEvent(UltraExplorerBarEventIds:GroupAdded, GetFormattedGroupDescription(e:Group), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupAdding( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableGroupEventArgs ):
        e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:GroupAdding).
        LogEvent(UltraExplorerBarEventIds:GroupAdding, GetFormattedGroupDescription(e:Group), true, e:Cancel).
   	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupClick( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.GroupEventArgs ):
        LogEvent(UltraExplorerBarEventIds:GroupClick, GetFormattedGroupDescription(e:Group), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupCollapsed( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.GroupEventArgs ):
		LogEvent(UltraExplorerBarEventIds:GroupCollapsed, GetFormattedGroupDescription(e:Group), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupCollapsing( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableGroupEventArgs ):
		e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:GroupCollapsing).
        LogEvent(UltraExplorerBarEventIds:GroupCollapsing, GetFormattedGroupDescription(e:Group), true, e:Cancel).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupDragging( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableGroupEventArgs ):
        e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:GroupDragging).
        LogEvent(UltraExplorerBarEventIds:GroupDragging, GetFormattedGroupDescription(e:Group), true, e:Cancel).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupDragOver( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.GroupDragOverEventArgs ):
        LogEvent(UltraExplorerBarEventIds:GroupDragOver, GetFormattedGroupDescription(e:Group), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupDropped( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.GroupDroppedEventArgs ):
		   LogEvent(UltraExplorerBarEventIds:GroupDropped, GetFormattedGroupDescription(e:Group), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupEnteredEditMode( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.GroupEventArgs ):
        LogEvent(UltraExplorerBarEventIds:GroupEnteredEditMode, GetFormattedGroupDescription(e:Group), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupEnteringEditMode( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableGroupEventArgs ):
        e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:GroupEnteringEditMode).
        LogEvent(UltraExplorerBarEventIds:GroupEnteringEditMode, GetFormattedGroupDescription(e:Group), true, e:Cancel).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupExitedEditMode( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.GroupEventArgs ):
        LogEvent(UltraExplorerBarEventIds:GroupExitedEditMode, GetFormattedGroupDescription(e:Group), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupExitingEditMode( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableGroupExitingEditModeEventArgs ):
        e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:GroupExitingEditMode).
        LogEvent(UltraExplorerBarEventIds:GroupExitingEditMode, GetFormattedGroupDescription(e:Group), true, e:Cancel).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupExpanded( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.GroupEventArgs ):
        LogEvent(UltraExplorerBarEventIds:GroupExpanded, GetFormattedGroupDescription(e:Group), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupExpanding( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableGroupEventArgs ):
        e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:GroupExpanding).
        LogEvent(UltraExplorerBarEventIds:GroupExpanding, GetFormattedGroupDescription(e:Group), true, e:Cancel).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupRemoved( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.GroupEventArgs ):
        LogEvent(UltraExplorerBarEventIds:GroupRemoved, GetFormattedGroupDescription(e:Group), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupRemoving( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableGroupEventArgs ):
        e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:GroupRemoving).
        LogEvent(UltraExplorerBarEventIds:GroupRemoving, GetFormattedGroupDescription(e:Group), true, e:Cancel).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemAdded( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.ItemEventArgs ):
        LogEvent(UltraExplorerBarEventIds:ItemAdded, GetFormattedItemDescription(e:Item), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemAdding( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableItemEventArgs ):
        e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:ItemAdding).
        LogEvent(UltraExplorerBarEventIds:ItemAdding, GetFormattedItemDescription(e:Item), true, e:Cancel).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemCheckStateChanged( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.ItemEventArgs ):
        LogEvent(UltraExplorerBarEventIds:ItemCheckStateChanged, GetFormattedItemDescription(e:Item), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemCheckStateChanging( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableItemEventArgs ):
        e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:ItemCheckStateChanging).
        LogEvent(UltraExplorerBarEventIds:ItemCheckStateChanging, GetFormattedItemDescription(e:Item), true, e:Cancel).        
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemClick( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.ItemEventArgs ):
        LogEvent(UltraExplorerBarEventIds:ItemClick, GetFormattedItemDescription(e:Item), false, false).
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemDoubleClick( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.ItemEventArgs ):
        LogEvent(UltraExplorerBarEventIds:ItemDoubleClick, GetFormattedItemDescription(e:Item), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemDragging( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableItemEventArgs ):
        e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:ItemDragging).
        LogEvent(UltraExplorerBarEventIds:ItemDragging, GetFormattedItemDescription(e:Item), true, e:Cancel).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemDragOver( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.ItemDragOverEventArgs ):
        LogEvent(UltraExplorerBarEventIds:ItemDragOver, GetFormattedItemDescription(e:Item), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemDropped( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.ItemDroppedEventArgs ):
        LogEvent(UltraExplorerBarEventIds:ItemDropped, GetFormattedItemDescription(e:Item), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemEnteredEditMode( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.ItemEventArgs ):
        LogEvent(UltraExplorerBarEventIds:ItemEnteredEditMode, GetFormattedItemDescription(e:Item), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemEnteringEditMode( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableItemEventArgs ):
        e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:ItemEnteringEditMode).
        LogEvent(UltraExplorerBarEventIds:ItemEnteringEditMode, GetFormattedItemDescription(e:Item), true, e:Cancel).        
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemExitedEditMode( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.ItemEventArgs ):
	    LogEvent(UltraExplorerBarEventIds:ItemExitedEditMode, GetFormattedItemDescription(e:Item), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemExitingEditMode( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableItemExitingEditModeEventArgs ):
        e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:ItemExitingEditMode).
        LogEvent(UltraExplorerBarEventIds:ItemExitingEditMode, GetFormattedItemDescription(e:Item), true, e:Cancel).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemRemoved( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.ItemEventArgs ):
        LogEvent(UltraExplorerBarEventIds:ItemRemoved, GetFormattedItemDescription(e:Item), false, false).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemRemoving( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.CancelableItemEventArgs ):
        e:Cancel = IsEventCancelled(UltraExplorerBarEventIds:ItemRemoving).
        LogEvent(UltraExplorerBarEventIds:ItemRemoving, GetFormattedItemDescription(e:Item), true, e:Cancel).
	END METHOD.
 
 END CLASS.
