  
 /*------------------------------------------------------------------------
    File        : Form1
    Purpose     : 
    Syntax      :  
    Description : 
    Author(s)   : mferrant
    Created     : Mon Jun 09 10:26:39 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

USING System.Drawing.*.
USING System.Windows.Forms.*.
USING System.Text.StringBuilder.

USING WinToolbar.BasicFeatures.*.

USING Infragistics.Win.*.
USING Infragistics.Win.UltraWinTree.*.
USING Infragistics.Win.UltraWinToolbars.*.
USING Infragistics.Win.UltraWinExplorerBar.*.

CLASS WinToolbar.BasicFeatures.Form1 INHERITS Form   : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.


	DEFINE PRIVATE VARIABLE imageList1 AS System.Windows.Forms.ImageList NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraToolbarsManager1 AS Infragistics.Win.UltraWinToolbars.UltraToolbarsManager NO-UNDO.
	DEFINE PRIVATE VARIABLE Form1_Fill_Panel AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE pnlTaskPaneContents AS Infragistics.Win.IGPanel NO-UNDO.
	DEFINE PRIVATE VARIABLE lblFolders AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraGridBagLayoutManager1 AS Infragistics.Win.Misc.UltraGridBagLayoutManager NO-UNDO.
	DEFINE PRIVATE VARIABLE btnExplore AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE treFolders AS Infragistics.Win.UltraWinTree.UltraTree NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExplorerBar1 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBar NO-UNDO.
	DEFINE PRIVATE VARIABLE label6 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE coStyle AS System.Windows.Forms.ComboBox NO-UNDO.
	DEFINE PRIVATE VARIABLE spinFloatingToolbarFadeDelay AS System.Windows.Forms.NumericUpDown NO-UNDO.
	DEFINE PRIVATE VARIABLE label5 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE chLargeMenuIcons AS System.Windows.Forms.CheckBox NO-UNDO.
	DEFINE PRIVATE VARIABLE chLargeToolbarIcons AS System.Windows.Forms.CheckBox NO-UNDO.
	DEFINE PRIVATE VARIABLE chAllowTearawayToDock AS System.Windows.Forms.CheckBox NO-UNDO.
	DEFINE PRIVATE VARIABLE chDestroyTearawayOnClose AS System.Windows.Forms.CheckBox NO-UNDO.
	DEFINE PRIVATE VARIABLE label1 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE coMenuAnimationStyle AS System.Windows.Forms.ComboBox NO-UNDO.
	DEFINE PRIVATE VARIABLE panel1 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE panel2 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE chMergeWithParent AS System.Windows.Forms.CheckBox NO-UNDO.
	DEFINE PRIVATE VARIABLE chAllowToolbarMoving AS System.Windows.Forms.CheckBox NO-UNDO.
	DEFINE PRIVATE VARIABLE label2 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE m_panel1_Toolbars_Dock_Area_Left AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraToolbarsManager2 AS Infragistics.Win.UltraWinToolbars.UltraToolbarsManager NO-UNDO.
	DEFINE PRIVATE VARIABLE m_panel1_Toolbars_Dock_Area_Right AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE m_panel1_Toolbars_Dock_Area_Top AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE m_panel1_Toolbars_Dock_Area_Bottom AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE panel3 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE pictureBox1 AS System.Windows.Forms.PictureBox NO-UNDO.
	DEFINE PRIVATE VARIABLE label3 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE chPopupToolbarStyle AS System.Windows.Forms.CheckBox NO-UNDO.
	DEFINE PRIVATE VARIABLE pnlPopupControlContainer AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE treeView1 AS System.Windows.Forms.TreeView NO-UNDO.
	DEFINE PRIVATE VARIABLE imageList2 AS System.Windows.Forms.ImageList NO-UNDO.
	DEFINE PRIVATE VARIABLE label4 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE liEvents AS System.Windows.Forms.ListBox NO-UNDO.
	DEFINE PRIVATE VARIABLE m_Form1_Toolbars_Dock_Area_Left AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE m_Form1_Toolbars_Dock_Area_Right AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE m_Form1_Toolbars_Dock_Area_Top AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE m_Form1_Toolbars_Dock_Area_Bottom AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.

    DEFINE PRIVATE VARIABLE ignoreSpinFadeDelayTextChanged AS LOGICAL NO-UNDO INITIAL FALSE.
	CONSTRUCTOR PUBLIC Form1 (  ):
		
		SUPER().
		InitializeComponent ( ).

	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC Form1 ( ):

		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.

	END DESTRUCTOR.

	METHOD PRIVATE VOID InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

        this-object:components = new System.ComponentModel.Container().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable resources as System.Resources.ResXResourceSet no-undo.
        resources = Progress.Util.ResourceHelper:Load("WinToolbar\BasicFeatures\Form1.resx", PROPATH).
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraToolbar1 as Infragistics.Win.UltraWinToolbars.UltraToolbar no-undo.
        ultraToolbar1 = new Infragistics.Win.UltraWinToolbars.UltraToolbar("MainMenuBar").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraToolbar2 as Infragistics.Win.UltraWinToolbars.UltraToolbar no-undo.
        ultraToolbar2 = new Infragistics.Win.UltraWinToolbars.UltraToolbar("Formatting").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool1 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool1 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Cut").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool2 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool2 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Copy").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool3 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool3 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Paste").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraToolbar3 as Infragistics.Win.UltraWinToolbars.UltraToolbar no-undo.
        ultraToolbar3 = new Infragistics.Win.UltraWinToolbars.UltraToolbar("Standard").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool4 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool4 = new Infragistics.Win.UltraWinToolbars.ButtonTool("New").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool5 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool5 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Open").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool6 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool6 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Save").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool7 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool7 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Cut").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool8 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool8 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Copy").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool9 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool9 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Paste").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraToolbar4 as Infragistics.Win.UltraWinToolbars.UltraToolbar no-undo.
        ultraToolbar4 = new Infragistics.Win.UltraWinToolbars.UltraToolbar("Editors").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool10 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool10 = new Infragistics.Win.UltraWinToolbars.ButtonTool("New").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool11 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool11 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Open").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool12 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool12 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Save").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable comboBoxTool1 as Infragistics.Win.UltraWinToolbars.ComboBoxTool no-undo.
        comboBoxTool1 = new Infragistics.Win.UltraWinToolbars.ComboBoxTool("ComboBoxTool1").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool13 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool13 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Cut").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool14 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool14 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Copy").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool15 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool15 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Paste").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable fontListTool1 as Infragistics.Win.UltraWinToolbars.FontListTool no-undo.
        fontListTool1 = new Infragistics.Win.UltraWinToolbars.FontListTool("FontListTool1").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable textBoxTool1 as Infragistics.Win.UltraWinToolbars.TextBoxTool no-undo.
        textBoxTool1 = new Infragistics.Win.UltraWinToolbars.TextBoxTool("Style").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraTaskPaneToolbar1 as Infragistics.Win.UltraWinToolbars.UltraTaskPaneToolbar no-undo.
        ultraTaskPaneToolbar1 = new Infragistics.Win.UltraWinToolbars.UltraTaskPaneToolbar("TaskPaneEvents").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable taskPaneTool1 as Infragistics.Win.UltraWinToolbars.TaskPaneTool no-undo.
        taskPaneTool1 = new Infragistics.Win.UltraWinToolbars.TaskPaneTool("Events").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraTaskPaneToolbar2 as Infragistics.Win.UltraWinToolbars.UltraTaskPaneToolbar no-undo.
        ultraTaskPaneToolbar2 = new Infragistics.Win.UltraWinToolbars.UltraTaskPaneToolbar("TaskPane").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable taskPaneTool2 as Infragistics.Win.UltraWinToolbars.TaskPaneTool no-undo.
        taskPaneTool2 = new Infragistics.Win.UltraWinToolbars.TaskPaneTool("TaskPaneTool1").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable taskPaneTool3 as Infragistics.Win.UltraWinToolbars.TaskPaneTool no-undo.
        taskPaneTool3 = new Infragistics.Win.UltraWinToolbars.TaskPaneTool("TaskPaneTool2").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraToolbar5 as Infragistics.Win.UltraWinToolbars.UltraToolbar no-undo.
        ultraToolbar5 = new Infragistics.Win.UltraWinToolbars.UltraToolbar("Editor Tools").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable progressBarTool1 as Infragistics.Win.UltraWinToolbars.ProgressBarTool no-undo.
        progressBarTool1 = new Infragistics.Win.UltraWinToolbars.ProgressBarTool("Progress Tool").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable maskedEditTool1 as Infragistics.Win.UltraWinToolbars.MaskedEditTool no-undo.
        maskedEditTool1 = new Infragistics.Win.UltraWinToolbars.MaskedEditTool("MaskedEditTool1").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable textBoxTool2 as Infragistics.Win.UltraWinToolbars.TextBoxTool no-undo.
        textBoxTool2 = new Infragistics.Win.UltraWinToolbars.TextBoxTool("TextBoxTool1").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable comboBoxTool2 as Infragistics.Win.UltraWinToolbars.ComboBoxTool no-undo.
        comboBoxTool2 = new Infragistics.Win.UltraWinToolbars.ComboBoxTool("ComboBoxTool2").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable fontListTool2 as Infragistics.Win.UltraWinToolbars.FontListTool no-undo.
        fontListTool2 = new Infragistics.Win.UltraWinToolbars.FontListTool("FontListTool2").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraToolbar6 as Infragistics.Win.UltraWinToolbars.UltraToolbar no-undo.
        ultraToolbar6 = new Infragistics.Win.UltraWinToolbars.UltraToolbar("Masked Edit").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable comboBoxTool3 as Infragistics.Win.UltraWinToolbars.ComboBoxTool no-undo.
        comboBoxTool3 = new Infragistics.Win.UltraWinToolbars.ComboBoxTool("Example Masks").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable maskedEditTool2 as Infragistics.Win.UltraWinToolbars.MaskedEditTool no-undo.
        maskedEditTool2 = new Infragistics.Win.UltraWinToolbars.MaskedEditTool("MaskedEdit Tool").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool16 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool16 = new Infragistics.Win.UltraWinToolbars.ButtonTool("New").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable appearance1 as Infragistics.Win.Appearance no-undo.
        appearance1 = new Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool17 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool17 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Open").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable appearance2 as Infragistics.Win.Appearance no-undo.
        appearance2 = new Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool18 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool18 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Save").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable appearance3 as Infragistics.Win.Appearance no-undo.
        appearance3 = new Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool19 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool19 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Cut").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable appearance4 as Infragistics.Win.Appearance no-undo.
        appearance4 = new Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool20 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool20 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Copy").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable appearance5 as Infragistics.Win.Appearance no-undo.
        appearance5 = new Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable buttonTool21 as Infragistics.Win.UltraWinToolbars.ButtonTool no-undo.
        buttonTool21 = new Infragistics.Win.UltraWinToolbars.ButtonTool("Paste").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable appearance6 as Infragistics.Win.Appearance no-undo.
        appearance6 = new Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable comboBoxTool4 as Infragistics.Win.UltraWinToolbars.ComboBoxTool no-undo.
        comboBoxTool4 = new Infragistics.Win.UltraWinToolbars.ComboBoxTool("ComboBoxTool1").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable valueList1 as Infragistics.Win.ValueList no-undo.
        valueList1 = new Infragistics.Win.ValueList(0).
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable valueListItem1 as Infragistics.Win.ValueListItem no-undo.
        valueListItem1 = new Infragistics.Win.ValueListItem().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable valueListItem2 as Infragistics.Win.ValueListItem no-undo.
        valueListItem2 = new Infragistics.Win.ValueListItem().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable valueListItem3 as Infragistics.Win.ValueListItem no-undo.
        valueListItem3 = new Infragistics.Win.ValueListItem().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable fontListTool3 as Infragistics.Win.UltraWinToolbars.FontListTool no-undo.
        fontListTool3 = new Infragistics.Win.UltraWinToolbars.FontListTool("FontListTool1").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable textBoxTool3 as Infragistics.Win.UltraWinToolbars.TextBoxTool no-undo.
        textBoxTool3 = new Infragistics.Win.UltraWinToolbars.TextBoxTool("Style").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable taskPaneTool4 as Infragistics.Win.UltraWinToolbars.TaskPaneTool no-undo.
        taskPaneTool4 = new Infragistics.Win.UltraWinToolbars.TaskPaneTool("Events").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable taskPaneTool5 as Infragistics.Win.UltraWinToolbars.TaskPaneTool no-undo.
        taskPaneTool5 = new Infragistics.Win.UltraWinToolbars.TaskPaneTool("TaskPaneTool1").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable taskPaneTool6 as Infragistics.Win.UltraWinToolbars.TaskPaneTool no-undo.
        taskPaneTool6 = new Infragistics.Win.UltraWinToolbars.TaskPaneTool("TaskPaneTool2").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable progressBarTool2 as Infragistics.Win.UltraWinToolbars.ProgressBarTool no-undo.
        progressBarTool2 = new Infragistics.Win.UltraWinToolbars.ProgressBarTool("Progress Tool").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable maskedEditTool3 as Infragistics.Win.UltraWinToolbars.MaskedEditTool no-undo.
        maskedEditTool3 = new Infragistics.Win.UltraWinToolbars.MaskedEditTool("MaskedEdit Tool").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable comboBoxTool5 as Infragistics.Win.UltraWinToolbars.ComboBoxTool no-undo.
        comboBoxTool5 = new Infragistics.Win.UltraWinToolbars.ComboBoxTool("Example Masks").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable valueList2 as Infragistics.Win.ValueList no-undo.
        valueList2 = new Infragistics.Win.ValueList(0).
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable maskedEditTool4 as Infragistics.Win.UltraWinToolbars.MaskedEditTool no-undo.
        maskedEditTool4 = new Infragistics.Win.UltraWinToolbars.MaskedEditTool("MaskedEditTool1").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable textBoxTool4 as Infragistics.Win.UltraWinToolbars.TextBoxTool no-undo.
        textBoxTool4 = new Infragistics.Win.UltraWinToolbars.TextBoxTool("TextBoxTool1").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable comboBoxTool6 as Infragistics.Win.UltraWinToolbars.ComboBoxTool no-undo.
        comboBoxTool6 = new Infragistics.Win.UltraWinToolbars.ComboBoxTool("ComboBoxTool2").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable valueList3 as Infragistics.Win.ValueList no-undo.
        valueList3 = new Infragistics.Win.ValueList(0).
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable fontListTool4 as Infragistics.Win.UltraWinToolbars.FontListTool no-undo.
        fontListTool4 = new Infragistics.Win.UltraWinToolbars.FontListTool("FontListTool2").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable gridBagConstraint1 as Infragistics.Win.Layout.GridBagConstraint no-undo.
        gridBagConstraint1 = new Infragistics.Win.Layout.GridBagConstraint().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable gridBagConstraint2 as Infragistics.Win.Layout.GridBagConstraint no-undo.
        gridBagConstraint2 = new Infragistics.Win.Layout.GridBagConstraint().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable gridBagConstraint3 as Infragistics.Win.Layout.GridBagConstraint no-undo.
        gridBagConstraint3 = new Infragistics.Win.Layout.GridBagConstraint().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraExplorerBarGroup1 as Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup no-undo.
        ultraExplorerBarGroup1 = new Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraExplorerBarItem1 as Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem no-undo.
        ultraExplorerBarItem1 = new Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraExplorerBarItem2 as Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem no-undo.
        ultraExplorerBarItem2 = new Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraExplorerBarItem3 as Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem no-undo.
        ultraExplorerBarItem3 = new Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraExplorerBarGroup2 as Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup no-undo.
        ultraExplorerBarGroup2 = new Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraExplorerBarItem4 as Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem no-undo.
        ultraExplorerBarItem4 = new Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraExplorerBarItem5 as Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem no-undo.
        ultraExplorerBarItem5 = new Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable ultraExplorerBarItem6 as Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem no-undo.
        ultraExplorerBarItem6 = new Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem().
        this-object:imageList1 = new System.Windows.Forms.ImageList(this-object:components).
        this-object:ultraToolbarsManager1 = new Infragistics.Win.UltraWinToolbars.UltraToolbarsManager(this-object:components).
        this-object:m_Form1_Toolbars_Dock_Area_Top = new Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        this-object:m_Form1_Toolbars_Dock_Area_Bottom = new Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        this-object:m_Form1_Toolbars_Dock_Area_Left = new Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        this-object:m_Form1_Toolbars_Dock_Area_Right = new Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        this-object:coStyle = new System.Windows.Forms.ComboBox().
        this-object:ultraToolbarsManager2 = new Infragistics.Win.UltraWinToolbars.UltraToolbarsManager(this-object:components).
        this-object:panel1 = new System.Windows.Forms.Panel().
        this-object:panel2 = new System.Windows.Forms.Panel().
        this-object:chMergeWithParent = new System.Windows.Forms.CheckBox().
        this-object:chAllowToolbarMoving = new System.Windows.Forms.CheckBox().
        this-object:label2 = new System.Windows.Forms.Label().
        this-object:m_panel1_Toolbars_Dock_Area_Left = new Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        this-object:m_panel1_Toolbars_Dock_Area_Right = new Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        this-object:m_panel1_Toolbars_Dock_Area_Top = new Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        this-object:m_panel1_Toolbars_Dock_Area_Bottom = new Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        this-object:pnlTaskPaneContents = new Infragistics.Win.IGPanel().
        this-object:lblFolders = new Infragistics.Win.Misc.UltraLabel().
        this-object:btnExplore = new Infragistics.Win.Misc.UltraButton().
        this-object:treFolders = new Infragistics.Win.UltraWinTree.UltraTree().
        this-object:ultraExplorerBar1 = new Infragistics.Win.UltraWinExplorerBar.UltraExplorerBar().
        this-object:label6 = new System.Windows.Forms.Label().
        this-object:pictureBox1 = new System.Windows.Forms.PictureBox().
        this-object:spinFloatingToolbarFadeDelay = new System.Windows.Forms.NumericUpDown().
        this-object:label4 = new System.Windows.Forms.Label().
        this-object:label5 = new System.Windows.Forms.Label().
        this-object:chLargeMenuIcons = new System.Windows.Forms.CheckBox().
        this-object:imageList2 = new System.Windows.Forms.ImageList(this-object:components).
        this-object:treeView1 = new System.Windows.Forms.TreeView().
        this-object:label3 = new System.Windows.Forms.Label().
        this-object:chLargeToolbarIcons = new System.Windows.Forms.CheckBox().
        this-object:pnlPopupControlContainer = new System.Windows.Forms.Panel().
        this-object:ultraGridBagLayoutManager1 = new Infragistics.Win.Misc.UltraGridBagLayoutManager(this-object:components).
        this-object:liEvents = new System.Windows.Forms.ListBox().
        this-object:chPopupToolbarStyle = new System.Windows.Forms.CheckBox().
        this-object:chDestroyTearawayOnClose = new System.Windows.Forms.CheckBox().
        this-object:label1 = new System.Windows.Forms.Label().
        this-object:chAllowTearawayToDock = new System.Windows.Forms.CheckBox().
        this-object:Form1_Fill_Panel = new System.Windows.Forms.Panel().
        this-object:coMenuAnimationStyle = new System.Windows.Forms.ComboBox().
        this-object:panel3 = new System.Windows.Forms.Panel().
        cast(this-object:ultraToolbarsManager1, System.ComponentModel.ISupportInitialize):BeginInit().
        cast(this-object:ultraToolbarsManager2, System.ComponentModel.ISupportInitialize):BeginInit().
        this-object:panel1:SuspendLayout().
        this-object:panel2:SuspendLayout().
        this-object:pnlTaskPaneContents:SuspendLayout().
        cast(this-object:treFolders, System.ComponentModel.ISupportInitialize):BeginInit().
        cast(this-object:ultraExplorerBar1, System.ComponentModel.ISupportInitialize):BeginInit().
        cast(this-object:pictureBox1, System.ComponentModel.ISupportInitialize):BeginInit().
        cast(this-object:spinFloatingToolbarFadeDelay, System.ComponentModel.ISupportInitialize):BeginInit().
        this-object:pnlPopupControlContainer:SuspendLayout().
        cast(this-object:ultraGridBagLayoutManager1, System.ComponentModel.ISupportInitialize):BeginInit().
        this-object:Form1_Fill_Panel:SuspendLayout().
        this-object:panel3:SuspendLayout().
        this-object:SuspendLayout().
        /*  */
        /* imageList1 */
        /*  */
        this-object:imageList1:ImageStream = cast(resources:GetObject("imageList1.ImageStream"), System.Windows.Forms.ImageListStreamer).
        this-object:imageList1:TransparentColor = System.Drawing.Color:Transparent.
        this-object:imageList1:Images:SetKeyName(0, "").
        this-object:imageList1:Images:SetKeyName(1, "").
        this-object:imageList1:Images:SetKeyName(2, "").
        this-object:imageList1:Images:SetKeyName(3, "").
        this-object:imageList1:Images:SetKeyName(4, "").
        this-object:imageList1:Images:SetKeyName(5, "").
        this-object:imageList1:Images:SetKeyName(6, "").
        this-object:imageList1:Images:SetKeyName(7, "").
        this-object:imageList1:Images:SetKeyName(8, "").
        this-object:imageList1:Images:SetKeyName(9, "").
        this-object:imageList1:Images:SetKeyName(10, "").
        this-object:imageList1:Images:SetKeyName(11, "").
        this-object:imageList1:Images:SetKeyName(12, "").
        this-object:imageList1:Images:SetKeyName(13, "").
        this-object:imageList1:Images:SetKeyName(14, "").
        this-object:imageList1:Images:SetKeyName(15, "").
        this-object:imageList1:Images:SetKeyName(16, "").
        this-object:imageList1:Images:SetKeyName(17, "").
        this-object:imageList1:Images:SetKeyName(18, "").
        this-object:imageList1:Images:SetKeyName(19, "").
        this-object:imageList1:Images:SetKeyName(20, "").
        this-object:imageList1:Images:SetKeyName(21, "").
        this-object:imageList1:Images:SetKeyName(22, "").
        this-object:imageList1:Images:SetKeyName(23, "").
        this-object:imageList1:Images:SetKeyName(24, "").
        this-object:imageList1:Images:SetKeyName(25, "").
        this-object:imageList1:Images:SetKeyName(26, "").
        this-object:imageList1:Images:SetKeyName(27, "").
        this-object:imageList1:Images:SetKeyName(28, "").
        this-object:imageList1:Images:SetKeyName(29, "").
        this-object:imageList1:Images:SetKeyName(30, "").
        this-object:imageList1:Images:SetKeyName(31, "").
        this-object:imageList1:Images:SetKeyName(32, "").
        this-object:imageList1:Images:SetKeyName(33, "").
        this-object:imageList1:Images:SetKeyName(34, "").
        this-object:imageList1:Images:SetKeyName(35, "").
        this-object:imageList1:Images:SetKeyName(36, "").
        this-object:imageList1:Images:SetKeyName(37, "").
        this-object:imageList1:Images:SetKeyName(38, "").
        this-object:imageList1:Images:SetKeyName(39, "").
        this-object:imageList1:Images:SetKeyName(40, "").
        this-object:imageList1:Images:SetKeyName(41, "").
        /*  */
        /* ultraToolbarsManager1 */
        /*  */
        this-object:ultraToolbarsManager1:AlwaysShowMenusExpanded = Infragistics.Win.DefaultableBoolean:False.
        this-object:ultraToolbarsManager1:DesignerFlags = 1.
        this-object:ultraToolbarsManager1:DockWithinContainer = this-object.
        this-object:ultraToolbarsManager1:DockWithinContainerBaseType = Progress.Util.TypeHelper:GetType("System.Windows.Forms.Form").
        this-object:ultraToolbarsManager1:ImageListSmall = this-object:imageList1.
        this-object:ultraToolbarsManager1:ImageTransparentColor = System.Drawing.Color:Silver.
        this-object:ultraToolbarsManager1:MdiMergeable = false.
        this-object:ultraToolbarsManager1:ShowFullMenusDelay = 500.
        ultraToolbar1:DockedColumn = 0.
        ultraToolbar1:DockedRow = 0.
        ultraToolbar1:IsMainMenuBar = true.
        ultraToolbar1:Text = "MainMenuBar".
        ultraToolbar2:DockedColumn = 0.
        ultraToolbar2:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Left.
        ultraToolbar2:DockedRow = 0.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar0 as Infragistics.Win.UltraWinToolbars.ToolBase extent 3 no-undo.
        arrayvar0[1] = buttonTool1.
        arrayvar0[2] = buttonTool2.
        arrayvar0[3] = buttonTool3.
        ultraToolbar2:NonInheritedTools:AddRange(arrayvar0).
        ultraToolbar2:Text = "Formatting".
        ultraToolbar3:DockedColumn = 0.
        ultraToolbar3:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Right.
        ultraToolbar3:DockedRow = 0.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar1 as Infragistics.Win.UltraWinToolbars.ToolBase extent 6 no-undo.
        arrayvar1[1] = buttonTool4.
        arrayvar1[2] = buttonTool5.
        arrayvar1[3] = buttonTool6.
        arrayvar1[4] = buttonTool7.
        arrayvar1[5] = buttonTool8.
        arrayvar1[6] = buttonTool9.
        ultraToolbar3:NonInheritedTools:AddRange(arrayvar1).
        ultraToolbar3:Text = "Standard".
        ultraToolbar4:DockedColumn = 0.
        ultraToolbar4:DockedRow = 1.
        comboBoxTool1:InstanceProps:IsFirstInGroup = true.
        buttonTool13:InstanceProps:IsFirstInGroup = true.
        fontListTool1:InstanceProps:IsFirstInGroup = true.
        textBoxTool1:InstanceProps:IsFirstInGroup = true.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar2 as Infragistics.Win.UltraWinToolbars.ToolBase extent 9 no-undo.
        arrayvar2[1] = buttonTool10.
        arrayvar2[2] = buttonTool11.
        arrayvar2[3] = buttonTool12.
        arrayvar2[4] = comboBoxTool1.
        arrayvar2[5] = buttonTool13.
        arrayvar2[6] = buttonTool14.
        arrayvar2[7] = buttonTool15.
        arrayvar2[8] = fontListTool1.
        arrayvar2[9] = textBoxTool1.
        ultraToolbar4:NonInheritedTools:AddRange(arrayvar2).
        ultraToolbar4:Text = "Editors".
        ultraTaskPaneToolbar1:DockedColumn = 0.
        ultraTaskPaneToolbar1:DockedContentExtent = 86.
        ultraTaskPaneToolbar1:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Bottom.
        ultraTaskPaneToolbar1:DockedRow = 0.
        ultraTaskPaneToolbar1:HomeTaskPaneToolKey = "Events".
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar3 as Infragistics.Win.UltraWinToolbars.ToolBase extent 1 no-undo.
        arrayvar3[1] = taskPaneTool1.
        ultraTaskPaneToolbar1:NonInheritedTools:AddRange(arrayvar3).
        ultraTaskPaneToolbar1:SelectedTaskPaneToolKey = "Events".
        ultraTaskPaneToolbar1:Text = "UltraToolbar1".
        ultraTaskPaneToolbar2:DockedColumn = 0.
        ultraTaskPaneToolbar2:DockedContentExtent = 118.
        ultraTaskPaneToolbar2:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Right.
        ultraTaskPaneToolbar2:DockedRow = 1.
        ultraTaskPaneToolbar2:HomeTaskPaneToolKey = "TaskPaneTool1".
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar4 as Infragistics.Win.UltraWinToolbars.ToolBase extent 2 no-undo.
        arrayvar4[1] = taskPaneTool2.
        arrayvar4[2] = taskPaneTool3.
        ultraTaskPaneToolbar2:NonInheritedTools:AddRange(arrayvar4).
        ultraTaskPaneToolbar2:SelectedTaskPaneToolKey = "TaskPaneTool1".
        ultraTaskPaneToolbar2:Text = "TaskPane".
        ultraToolbar5:DockedColumn = 0.
        ultraToolbar5:DockedRow = 2.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar5 as Infragistics.Win.UltraWinToolbars.ToolBase extent 5 no-undo.
        arrayvar5[1] = progressBarTool1.
        arrayvar5[2] = maskedEditTool1.
        arrayvar5[3] = textBoxTool2.
        arrayvar5[4] = comboBoxTool2.
        arrayvar5[5] = fontListTool2.
        ultraToolbar5:NonInheritedTools:AddRange(arrayvar5).
        ultraToolbar5:Text = "Editor Tools".
        ultraToolbar6:DockedColumn = 0.
        ultraToolbar6:DockedRow = 3.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar6 as Infragistics.Win.UltraWinToolbars.ToolBase extent 2 no-undo.
        arrayvar6[1] = comboBoxTool3.
        arrayvar6[2] = maskedEditTool2.
        ultraToolbar6:NonInheritedTools:AddRange(arrayvar6).
        ultraToolbar6:Text = "Masked Edit".
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar7 as Infragistics.Win.UltraWinToolbars.UltraToolbar extent 8 no-undo.
        arrayvar7[1] = ultraToolbar1.
        arrayvar7[2] = ultraToolbar2.
        arrayvar7[3] = ultraToolbar3.
        arrayvar7[4] = ultraToolbar4.
        arrayvar7[5] = ultraTaskPaneToolbar1.
        arrayvar7[6] = ultraTaskPaneToolbar2.
        arrayvar7[7] = ultraToolbar5.
        arrayvar7[8] = ultraToolbar6.
        this-object:ultraToolbarsManager1:Toolbars:AddRange(arrayvar7).
        appearance1:Image = cast(resources:GetObject("appearance1.Image"), System.Object).
        buttonTool16:SharedProps:AppearancesSmall:Appearance = appearance1.
        buttonTool16:SharedProps:Caption = "New".
        buttonTool16:SharedProps:Shortcut = System.Windows.Forms.Shortcut:CtrlN.
        appearance2:Image = cast(resources:GetObject("appearance2.Image"), System.Object).
        buttonTool17:SharedProps:AppearancesSmall:Appearance = appearance2.
        buttonTool17:SharedProps:Caption = "Open".
        buttonTool17:SharedProps:Shortcut = System.Windows.Forms.Shortcut:CtrlO.
        appearance3:Image = cast(resources:GetObject("appearance3.Image"), System.Object).
        buttonTool18:SharedProps:AppearancesSmall:Appearance = appearance3.
        buttonTool18:SharedProps:Caption = "Save".
        buttonTool18:SharedProps:Shortcut = System.Windows.Forms.Shortcut:CtrlS.
        appearance4:Image = cast(resources:GetObject("appearance4.Image"), System.Object).
        buttonTool19:SharedProps:AppearancesSmall:Appearance = appearance4.
        buttonTool19:SharedProps:Caption = "Cut".
        buttonTool19:SharedProps:DisplayStyle = Infragistics.Win.UltraWinToolbars.ToolDisplayStyle:DefaultForToolType.
        buttonTool19:SharedProps:Shortcut = System.Windows.Forms.Shortcut:CtrlX.
        appearance5:Image = cast(resources:GetObject("appearance5.Image"), System.Object).
        buttonTool20:SharedProps:AppearancesSmall:Appearance = appearance5.
        buttonTool20:SharedProps:Caption = "Copy".
        buttonTool20:SharedProps:Shortcut = System.Windows.Forms.Shortcut:CtrlC.
        appearance6:Image = cast(resources:GetObject("appearance6.Image"), System.Object).
        buttonTool21:SharedProps:AppearancesSmall:Appearance = appearance6.
        buttonTool21:SharedProps:Caption = "Paste".
        buttonTool21:SharedProps:Shortcut = System.Windows.Forms.Shortcut:CtrlV.
        comboBoxTool4:SharedProps:Caption = "Select Item".
        valueListItem1:DataValue = "ValueListItem0".
        valueListItem1:DisplayText = "Item 1".
        valueListItem2:DataValue = "ValueListItem1".
        valueListItem2:DisplayText = "Item 2".
        valueListItem3:DataValue = "ValueListItem2".
        valueListItem3:DisplayText = "Item 3".
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar8 as Infragistics.Win.ValueListItem extent 3 no-undo.
        arrayvar8[1] = valueListItem1.
        arrayvar8[2] = valueListItem2.
        arrayvar8[3] = valueListItem3.
        valueList1:ValueListItems:AddRange(arrayvar8).
        comboBoxTool4:ValueList = valueList1.
        fontListTool3:SharedProps:Caption = "Font".
        textBoxTool3:SharedProps:Caption = "Style".
        taskPaneTool4:ControlName = "liEvents".
        taskPaneTool4:SharedProps:Caption = "Events".
        taskPaneTool5:ControlName = "ultraExplorerBar1".
        taskPaneTool5:HeaderCaption = "Infragistics".
        taskPaneTool5:SharedProps:Caption = "Infragistics Website".
        taskPaneTool6:ControlName = "pnlTaskPaneContents".
        taskPaneTool6:SharedProps:Caption = "Local System".
        progressBarTool2:SharedProps:Caption = "ProgressBar:".
        progressBarTool2:SharedProps:Category = "Editor Tools".
        progressBarTool2:SharedProps:DisplayStyle = Infragistics.Win.UltraWinToolbars.ToolDisplayStyle:ImageAndText.
        maskedEditTool3:SharedProps:Caption = "MaskedEdit Tool:".
        maskedEditTool3:SharedProps:Category = "Editor Tools".
        maskedEditTool3:SharedProps:DisplayStyle = Infragistics.Win.UltraWinToolbars.ToolDisplayStyle:ImageAndText.
        comboBoxTool5:SharedProps:Caption = "Example Masks".
        comboBoxTool5:SharedProps:Category = "Editor Tools".
        comboBoxTool5:SharedProps:DisplayStyle = Infragistics.Win.UltraWinToolbars.ToolDisplayStyle:ImageAndText.
        comboBoxTool5:ValueList = valueList2.
        maskedEditTool4:SharedProps:Caption = "MaskedEdit:".
        maskedEditTool4:SharedProps:DisplayStyle = Infragistics.Win.UltraWinToolbars.ToolDisplayStyle:ImageAndText.
        textBoxTool4:SharedProps:Caption = "TextBox:".
        textBoxTool4:SharedProps:DisplayStyle = Infragistics.Win.UltraWinToolbars.ToolDisplayStyle:ImageAndText.
        comboBoxTool6:SharedProps:Caption = "ComboBox:".
        comboBoxTool6:SharedProps:DisplayStyle = Infragistics.Win.UltraWinToolbars.ToolDisplayStyle:ImageAndText.
        comboBoxTool6:ValueList = valueList3.
        fontListTool4:SharedProps:Caption = "FontList".
        fontListTool4:SharedProps:DisplayStyle = Infragistics.Win.UltraWinToolbars.ToolDisplayStyle:ImageAndText.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar9 as Infragistics.Win.UltraWinToolbars.ToolBase extent 19 no-undo.
        arrayvar9[1] = buttonTool16.
        arrayvar9[2] = buttonTool17.
        arrayvar9[3] = buttonTool18.
        arrayvar9[4] = buttonTool19.
        arrayvar9[5] = buttonTool20.
        arrayvar9[6] = buttonTool21.
        arrayvar9[7] = comboBoxTool4.
        arrayvar9[8] = fontListTool3.
        arrayvar9[9] = textBoxTool3.
        arrayvar9[10] = taskPaneTool4.
        arrayvar9[11] = taskPaneTool5.
        arrayvar9[12] = taskPaneTool6.
        arrayvar9[13] = progressBarTool2.
        arrayvar9[14] = maskedEditTool3.
        arrayvar9[15] = comboBoxTool5.
        arrayvar9[16] = maskedEditTool4.
        arrayvar9[17] = textBoxTool4.
        arrayvar9[18] = comboBoxTool6.
        arrayvar9[19] = fontListTool4.
        this-object:ultraToolbarsManager1:Tools:AddRange(arrayvar9).
        this-object:ultraToolbarsManager1:ToolbarModified:subscribe(this-object:ultraToolbarsManager1_ToolbarModified).
        this-object:ultraToolbarsManager1:AfterToolExitEditMode:subscribe(this-object:ultraToolbarsManager1_AfterToolExitEditMode).
        this-object:ultraToolbarsManager1:AfterToolEnterEditMode:subscribe(this-object:ultraToolbarsManager1_AfterToolEnterEditMode).
        this-object:ultraToolbarsManager1:BeforeShortcutKeyProcessed:subscribe(this-object:ultraToolbarsManager1_BeforeShortcutKeyProcessed).
        this-object:ultraToolbarsManager1:AfterTaskPaneToolSelected:subscribe(this-object:ultraToolbarsManager1_AfterTaskPaneToolSelected).
        this-object:ultraToolbarsManager1:BeforeToolDragBegin:subscribe(this-object:ultraToolbarsManager1_BeforeToolDragBegin).
        this-object:ultraToolbarsManager1:AfterToolDropdown:subscribe(this-object:ultraToolbarsManager1_AfterToolDropdown).
        this-object:ultraToolbarsManager1:ToolEditError:subscribe(this-object:ultraToolbarsManager1_ToolEditError).
        this-object:ultraToolbarsManager1:ToolClick:subscribe(this-object:ultraToolbarsManager1_ToolClick).
        this-object:ultraToolbarsManager1:ToolDoubleClick:subscribe(this-object:ultraToolbarsManager1_ToolDoubleClick).
        this-object:ultraToolbarsManager1:AfterToolDragEnd:subscribe(this-object:ultraToolbarsManager1_AfterToolDragEnd).
        this-object:ultraToolbarsManager1:BeforeToolEnterEditMode:subscribe(this-object:ultraToolbarsManager1_BeforeToolEnterEditMode).
        this-object:ultraToolbarsManager1:TearawayToolbarCreated:subscribe(this-object:ultraToolbarsManager1_TearawayToolbarCreated).
        this-object:ultraToolbarsManager1:ToolValueChanged:subscribe(this-object:ultraToolbarsManager1_ToolValueChanged).
        this-object:ultraToolbarsManager1:AfterToolCloseup:subscribe(this-object:ultraToolbarsManager1_AfterToolCloseup).
        this-object:ultraToolbarsManager1:TaskPaneToolResize:subscribe(this-object:ultraToolbarsManager1_TaskPaneToolResize).
        this-object:ultraToolbarsManager1:BeforeToolExitEditMode:subscribe(this-object:ultraToolbarsManager1_BeforeToolExitEditMode).
        this-object:ultraToolbarsManager1:BeforeToolDropdown:subscribe(this-object:ultraToolbarsManager1_BeforeToolDropdown).
        /*  */
        /* m_Form1_Toolbars_Dock_Area_Top */
        /*  */
        this-object:m_Form1_Toolbars_Dock_Area_Top:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        this-object:m_Form1_Toolbars_Dock_Area_Top:BackColor = System.Drawing.SystemColors:Control.
        this-object:m_Form1_Toolbars_Dock_Area_Top:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Top.
        this-object:m_Form1_Toolbars_Dock_Area_Top:ForeColor = System.Drawing.SystemColors:ControlText.
        this-object:m_Form1_Toolbars_Dock_Area_Top:Location = new System.Drawing.Point(0, 0).
        this-object:m_Form1_Toolbars_Dock_Area_Top:Name = "m_Form1_Toolbars_Dock_Area_Top".
        this-object:m_Form1_Toolbars_Dock_Area_Top:Size = new System.Drawing.Size(842, 86).
        this-object:m_Form1_Toolbars_Dock_Area_Top:ToolbarsManager = this-object:ultraToolbarsManager1.
        /*  */
        /* m_Form1_Toolbars_Dock_Area_Bottom */
        /*  */
        this-object:m_Form1_Toolbars_Dock_Area_Bottom:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        this-object:m_Form1_Toolbars_Dock_Area_Bottom:BackColor = System.Drawing.SystemColors:Control.
        this-object:m_Form1_Toolbars_Dock_Area_Bottom:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Bottom.
        this-object:m_Form1_Toolbars_Dock_Area_Bottom:ForeColor = System.Drawing.SystemColors:ControlText.
        this-object:m_Form1_Toolbars_Dock_Area_Bottom:Location = new System.Drawing.Point(0, 407).
        this-object:m_Form1_Toolbars_Dock_Area_Bottom:Name = "m_Form1_Toolbars_Dock_Area_Bottom".
        this-object:m_Form1_Toolbars_Dock_Area_Bottom:Size = new System.Drawing.Size(842, 110).
        this-object:m_Form1_Toolbars_Dock_Area_Bottom:ToolbarsManager = this-object:ultraToolbarsManager1.
        /*  */
        /* m_Form1_Toolbars_Dock_Area_Left */
        /*  */
        this-object:m_Form1_Toolbars_Dock_Area_Left:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        this-object:m_Form1_Toolbars_Dock_Area_Left:BackColor = System.Drawing.SystemColors:Control.
        this-object:m_Form1_Toolbars_Dock_Area_Left:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Left.
        this-object:m_Form1_Toolbars_Dock_Area_Left:ForeColor = System.Drawing.SystemColors:ControlText.
        this-object:m_Form1_Toolbars_Dock_Area_Left:Location = new System.Drawing.Point(0, 86).
        this-object:m_Form1_Toolbars_Dock_Area_Left:Name = "m_Form1_Toolbars_Dock_Area_Left".
        this-object:m_Form1_Toolbars_Dock_Area_Left:Size = new System.Drawing.Size(23, 321).
        this-object:m_Form1_Toolbars_Dock_Area_Left:ToolbarsManager = this-object:ultraToolbarsManager1.
        /*  */
        /* m_Form1_Toolbars_Dock_Area_Right */
        /*  */
        this-object:m_Form1_Toolbars_Dock_Area_Right:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        this-object:m_Form1_Toolbars_Dock_Area_Right:BackColor = System.Drawing.SystemColors:Control.
        this-object:m_Form1_Toolbars_Dock_Area_Right:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Right.
        this-object:m_Form1_Toolbars_Dock_Area_Right:ForeColor = System.Drawing.SystemColors:ControlText.
        this-object:m_Form1_Toolbars_Dock_Area_Right:Location = new System.Drawing.Point(697, 86).
        this-object:m_Form1_Toolbars_Dock_Area_Right:Name = "m_Form1_Toolbars_Dock_Area_Right".
        this-object:m_Form1_Toolbars_Dock_Area_Right:Size = new System.Drawing.Size(145, 321).
        this-object:m_Form1_Toolbars_Dock_Area_Right:ToolbarsManager = this-object:ultraToolbarsManager1.
        /*  */
        /* coStyle */
        /*  */
        this-object:coStyle:DropDownStyle = System.Windows.Forms.ComboBoxStyle:DropDownList.
        this-object:coStyle:Location = new System.Drawing.Point(16, 24).
        this-object:coStyle:Name = "coStyle".
        this-object:coStyle:Size = new System.Drawing.Size(176, 21).
        this-object:coStyle:TabIndex = 1.
        this-object:coStyle:SelectedIndexChanged:subscribe(this-object:coStyle_SelectedIndexChanged).
        /*  */
        /* ultraToolbarsManager2 */
        /*  */
        this-object:ultraToolbarsManager2:DesignerFlags = 1.
        this-object:ultraToolbarsManager2:DockWithinContainer = this-object:panel1.
        this-object:ultraToolbarsManager2:ImageListSmall = this-object:imageList1.
        this-object:ultraToolbarsManager2:ImageTransparentColor = System.Drawing.Color:Silver.
        this-object:ultraToolbarsManager2:MdiMergeable = false.
        this-object:ultraToolbarsManager2:ShowFullMenusDelay = 500.
        this-object:ultraToolbarsManager2:ToolbarModified:subscribe(this-object:ultraToolbarsManager2_ToolbarModified).
        this-object:ultraToolbarsManager2:AfterToolDropdown:subscribe(this-object:ultraToolbarsManager2_AfterToolDropdown).
        this-object:ultraToolbarsManager2:PropertyChanged:subscribe(this-object:ultraToolbarsManager2_PropertyChanged).
        this-object:ultraToolbarsManager2:ToolClick:subscribe(this-object:ultraToolbarsManager2_ToolClick).
        this-object:ultraToolbarsManager2:TearawayToolbarCreated:subscribe(this-object:ultraToolbarsManager2_TearawayToolbarCreated).
        this-object:ultraToolbarsManager2:AfterToolCloseup:subscribe(this-object:ultraToolbarsManager2_AfterToolCloseup).
        this-object:ultraToolbarsManager2:BeforeToolDropdown:subscribe(this-object:ultraToolbarsManager2_BeforeToolDropdown).
        /*  */
        /* panel1 */
        /*  */
        this-object:panel1:Anchor = cast(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        this-object:panel1:BackColor = System.Drawing.SystemColors:ControlDark.
        this-object:panel1:Controls:Add(this-object:panel2).
        this-object:panel1:Controls:Add(this-object:m_panel1_Toolbars_Dock_Area_Left).
        this-object:panel1:Controls:Add(this-object:m_panel1_Toolbars_Dock_Area_Right).
        this-object:panel1:Controls:Add(this-object:m_panel1_Toolbars_Dock_Area_Top).
        this-object:panel1:Controls:Add(this-object:m_panel1_Toolbars_Dock_Area_Bottom).
        this-object:panel1:Location = new System.Drawing.Point(216, 16).
        this-object:panel1:Name = "panel1".
        this-object:panel1:Size = new System.Drawing.Size(445, 128).
        this-object:panel1:TabIndex = 9.
        /*  */
        /* panel2 */
        /*  */
        this-object:panel2:Controls:Add(this-object:chMergeWithParent).
        this-object:panel2:Controls:Add(this-object:chAllowToolbarMoving).
        this-object:panel2:Controls:Add(this-object:label2).
        this-object:panel2:Dock = System.Windows.Forms.DockStyle:Fill.
        this-object:panel2:Location = new System.Drawing.Point(0, 0).
        this-object:panel2:Name = "panel2".
        this-object:panel2:Size = new System.Drawing.Size(445, 128).
        this-object:panel2:TabIndex = 0.
        /*  */
        /* chMergeWithParent */
        /*  */
        this-object:chMergeWithParent:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
        this-object:chMergeWithParent:ForeColor = System.Drawing.SystemColors:ControlLight.
        this-object:chMergeWithParent:Location = new System.Drawing.Point(96, 72).
        this-object:chMergeWithParent:Name = "chMergeWithParent".
        this-object:chMergeWithParent:Size = new System.Drawing.Size(248, 24).
        this-object:chMergeWithParent:TabIndex = 2.
        this-object:chMergeWithParent:Text = "Float Toolbar and Merge with Main Manager".
        this-object:chMergeWithParent:UseCompatibleTextRendering = true.
        this-object:chMergeWithParent:CheckedChanged:subscribe(this-object:chMergeWithParent_CheckedChanged).
        /*  */
        /* chAllowToolbarMoving */
        /*  */
        this-object:chAllowToolbarMoving:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
        this-object:chAllowToolbarMoving:ForeColor = System.Drawing.SystemColors:ControlLight.
        this-object:chAllowToolbarMoving:Location = new System.Drawing.Point(96, 48).
        this-object:chAllowToolbarMoving:Name = "chAllowToolbarMoving".
        this-object:chAllowToolbarMoving:Size = new System.Drawing.Size(160, 16).
        this-object:chAllowToolbarMoving:TabIndex = 1.
        this-object:chAllowToolbarMoving:Text = "Allow Toolbar Movement".
        this-object:chAllowToolbarMoving:UseCompatibleTextRendering = true.
        this-object:chAllowToolbarMoving:CheckedChanged:subscribe(this-object:chAllowToolbarMoving_CheckedChanged).
        /*  */
        /* label2 */
        /*  */
        this-object:label2:Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
        this-object:label2:ForeColor = System.Drawing.SystemColors:ControlLight.
        this-object:label2:Location = new System.Drawing.Point(72, 24).
        this-object:label2:Name = "label2".
        this-object:label2:Size = new System.Drawing.Size(200, 16).
        this-object:label2:TabIndex = 0.
        this-object:label2:Text = "Panel Control with its own Toolbar".
        this-object:label2:UseCompatibleTextRendering = true.
        /*  */
        /* m_panel1_Toolbars_Dock_Area_Left */
        /*  */
        this-object:m_panel1_Toolbars_Dock_Area_Left:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        this-object:m_panel1_Toolbars_Dock_Area_Left:BackColor = System.Drawing.SystemColors:ControlDark.
        this-object:m_panel1_Toolbars_Dock_Area_Left:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Left.
        this-object:m_panel1_Toolbars_Dock_Area_Left:ForeColor = System.Drawing.SystemColors:ControlText.
        this-object:m_panel1_Toolbars_Dock_Area_Left:Location = new System.Drawing.Point(0, 0).
        this-object:m_panel1_Toolbars_Dock_Area_Left:Name = "m_panel1_Toolbars_Dock_Area_Left".
        this-object:m_panel1_Toolbars_Dock_Area_Left:Size = new System.Drawing.Size(0, 128).
        this-object:m_panel1_Toolbars_Dock_Area_Left:ToolbarsManager = this-object:ultraToolbarsManager2.
        /*  */
        /* m_panel1_Toolbars_Dock_Area_Right */
        /*  */
        this-object:m_panel1_Toolbars_Dock_Area_Right:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        this-object:m_panel1_Toolbars_Dock_Area_Right:BackColor = System.Drawing.SystemColors:ControlDark.
        this-object:m_panel1_Toolbars_Dock_Area_Right:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Right.
        this-object:m_panel1_Toolbars_Dock_Area_Right:ForeColor = System.Drawing.SystemColors:ControlText.
        this-object:m_panel1_Toolbars_Dock_Area_Right:Location = new System.Drawing.Point(445, 0).
        this-object:m_panel1_Toolbars_Dock_Area_Right:Name = "m_panel1_Toolbars_Dock_Area_Right".
        this-object:m_panel1_Toolbars_Dock_Area_Right:Size = new System.Drawing.Size(0, 128).
        this-object:m_panel1_Toolbars_Dock_Area_Right:ToolbarsManager = this-object:ultraToolbarsManager2.
        /*  */
        /* m_panel1_Toolbars_Dock_Area_Top */
        /*  */
        this-object:m_panel1_Toolbars_Dock_Area_Top:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        this-object:m_panel1_Toolbars_Dock_Area_Top:BackColor = System.Drawing.SystemColors:ControlDark.
        this-object:m_panel1_Toolbars_Dock_Area_Top:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Top.
        this-object:m_panel1_Toolbars_Dock_Area_Top:ForeColor = System.Drawing.SystemColors:ControlText.
        this-object:m_panel1_Toolbars_Dock_Area_Top:Location = new System.Drawing.Point(0, 0).
        this-object:m_panel1_Toolbars_Dock_Area_Top:Name = "m_panel1_Toolbars_Dock_Area_Top".
        this-object:m_panel1_Toolbars_Dock_Area_Top:Size = new System.Drawing.Size(445, 0).
        this-object:m_panel1_Toolbars_Dock_Area_Top:ToolbarsManager = this-object:ultraToolbarsManager2.
        /*  */
        /* m_panel1_Toolbars_Dock_Area_Bottom */
        /*  */
        this-object:m_panel1_Toolbars_Dock_Area_Bottom:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        this-object:m_panel1_Toolbars_Dock_Area_Bottom:BackColor = System.Drawing.SystemColors:ControlDark.
        this-object:m_panel1_Toolbars_Dock_Area_Bottom:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Bottom.
        this-object:m_panel1_Toolbars_Dock_Area_Bottom:ForeColor = System.Drawing.SystemColors:ControlText.
        this-object:m_panel1_Toolbars_Dock_Area_Bottom:Location = new System.Drawing.Point(0, 128).
        this-object:m_panel1_Toolbars_Dock_Area_Bottom:Name = "m_panel1_Toolbars_Dock_Area_Bottom".
        this-object:m_panel1_Toolbars_Dock_Area_Bottom:Size = new System.Drawing.Size(445, 0).
        this-object:m_panel1_Toolbars_Dock_Area_Bottom:ToolbarsManager = this-object:ultraToolbarsManager2.
        /*  */
        /* pnlTaskPaneContents */
        /*  */
        this-object:pnlTaskPaneContents:BackColor = System.Drawing.Color:Transparent.
        this-object:pnlTaskPaneContents:Controls:Add(this-object:lblFolders).
        this-object:pnlTaskPaneContents:Controls:Add(this-object:btnExplore).
        this-object:pnlTaskPaneContents:Controls:Add(this-object:treFolders).
        this-object:pnlTaskPaneContents:Location = new System.Drawing.Point(400, 208).
        this-object:pnlTaskPaneContents:Name = "pnlTaskPaneContents".
        this-object:pnlTaskPaneContents:Size = new System.Drawing.Size(136, 152).
        this-object:pnlTaskPaneContents:TabIndex = 30.
        /*  */
        /* lblFolders */
        /*  */
        gridBagConstraint1:Fill = Infragistics.Win.Layout.FillType:Both.
        gridBagConstraint1:OriginX = 0.
        gridBagConstraint1:OriginY = 0.
        gridBagConstraint1:SpanX = 2.
        this-object:ultraGridBagLayoutManager1:SetGridBagConstraint(this-object:lblFolders, gridBagConstraint1).
        this-object:lblFolders:Location = new System.Drawing.Point(5, 5).
        this-object:lblFolders:Name = "lblFolders".
        this-object:ultraGridBagLayoutManager1:SetPreferredSize(this-object:lblFolders, new System.Drawing.Size(112, 16)).
        this-object:lblFolders:Size = new System.Drawing.Size(126, 16).
        this-object:lblFolders:TabIndex = 2.
        this-object:lblFolders:Text = "Folders:".
        /*  */
        /* btnExplore */
        /*  */
        gridBagConstraint2:Anchor = Infragistics.Win.Layout.AnchorType:Right.
        gridBagConstraint2:OriginX = 1.
        gridBagConstraint2:OriginY = 2.
        this-object:ultraGridBagLayoutManager1:SetGridBagConstraint(this-object:btnExplore, gridBagConstraint2).
        this-object:btnExplore:Location = new System.Drawing.Point(67, 123).
        this-object:btnExplore:Name = "btnExplore".
        this-object:btnExplore:Size = new System.Drawing.Size(64, 24).
        this-object:btnExplore:TabIndex = 1.
        this-object:btnExplore:Text = "Explore...".
        this-object:btnExplore:Click:subscribe(this-object:btnExplore_Click).
        /*  */
        /* treFolders */
        /*  */
        gridBagConstraint3:Fill = Infragistics.Win.Layout.FillType:Both.
        gridBagConstraint3:OriginX = 0.
        gridBagConstraint3:OriginY = 1.
        gridBagConstraint3:SpanX = 2.
        gridBagConstraint3:WeightY = 1.
        this-object:ultraGridBagLayoutManager1:SetGridBagConstraint(this-object:treFolders, gridBagConstraint3).
        this-object:treFolders:Location = new System.Drawing.Point(5, 21).
        this-object:treFolders:Name = "treFolders".
        this-object:ultraGridBagLayoutManager1:SetPreferredSize(this-object:treFolders, new System.Drawing.Size(121, 88)).
        this-object:treFolders:Size = new System.Drawing.Size(126, 102).
        this-object:treFolders:TabIndex = 0.
        this-object:treFolders:BeforeExpand:subscribe(this-object:treFolders_BeforeExpand).
        /*  */
        /* ultraExplorerBar1 */
        /*  */
        ultraExplorerBarGroup1:Expanded = false.
        ultraExplorerBarItem1:Tag = "http://www.infragistics.com/".
        ultraExplorerBarItem1:Text = "Infragistics Home Page".
        ultraExplorerBarItem2:Tag = "http://devcenter.infragistics.com/Default.Aspx".
        ultraExplorerBarItem2:Text = "Infragistics DevCenter".
        ultraExplorerBarItem3:Tag = "http://www.infragistics.com/products/netadvantage_portal.asp".
        ultraExplorerBarItem3:Text = "NetAdvantage".
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar10 as Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem extent 3 no-undo.
        arrayvar10[1] = ultraExplorerBarItem1.
        arrayvar10[2] = ultraExplorerBarItem2.
        arrayvar10[3] = ultraExplorerBarItem3.
        ultraExplorerBarGroup1:Items:AddRange(arrayvar10).
        ultraExplorerBarGroup1:Text = "Main".
        ultraExplorerBarItem4:Tag = "http://devcenter.infragistics.com/Support/KnowledgeBase.Aspx".
        ultraExplorerBarItem4:Text = "Search the Knowledge Base".
        ultraExplorerBarItem5:Tag = "http://devcenter.infragistics.com/Protected/RequestFeature.aspx".
        ultraExplorerBarItem5:Text = "Submit a Suggestion".
        ultraExplorerBarItem6:Tag = "http://devcenter.infragistics.com/Protected/SubmitSupportIssue.aspx".
        ultraExplorerBarItem6:Text = "Log an Incident".
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar11 as Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarItem extent 3 no-undo.
        arrayvar11[1] = ultraExplorerBarItem4.
        arrayvar11[2] = ultraExplorerBarItem5.
        arrayvar11[3] = ultraExplorerBarItem6.
        ultraExplorerBarGroup2:Items:AddRange(arrayvar11).
        ultraExplorerBarGroup2:Text = "Support".
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        define variable arrayvar12 as Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup extent 2 no-undo.
        arrayvar12[1] = ultraExplorerBarGroup1.
        arrayvar12[2] = ultraExplorerBarGroup2.
        this-object:ultraExplorerBar1:Groups:AddRange(arrayvar12).
        this-object:ultraExplorerBar1:GroupSettings:ItemAreaInnerMargins:Left = 0.
        this-object:ultraExplorerBar1:GroupSettings:Style = Infragistics.Win.UltraWinExplorerBar.GroupStyle:SmallImagesWithText.
        this-object:ultraExplorerBar1:GroupSpacing = 10.
        this-object:ultraExplorerBar1:ItemSettings:MaxLines = 5.
        this-object:ultraExplorerBar1:Location = new System.Drawing.Point(432, 152).
        this-object:ultraExplorerBar1:Margins:Bottom = 8.
        this-object:ultraExplorerBar1:Margins:Left = 8.
        this-object:ultraExplorerBar1:Margins:Right = 8.
        this-object:ultraExplorerBar1:Margins:Top = 8.
        this-object:ultraExplorerBar1:Name = "ultraExplorerBar1".
        this-object:ultraExplorerBar1:Scrollbars = Infragistics.Win.UltraWinExplorerBar.ScrollbarStyle:Never.
        this-object:ultraExplorerBar1:Size = new System.Drawing.Size(128, 208).
        this-object:ultraExplorerBar1:TabIndex = 29.
        this-object:ultraExplorerBar1:GroupExpanded:subscribe(this-object:ultraExplorerBar1_GroupExpanded).
        this-object:ultraExplorerBar1:GroupCollapsed:subscribe(this-object:ultraExplorerBar1_GroupCollapsed).
        this-object:ultraExplorerBar1:ItemClick:subscribe(this-object:ultraExplorerBar1_ItemClick).
        /*  */
        /* label6 */
        /*  */
        this-object:label6:Location = new System.Drawing.Point(16, 8).
        this-object:label6:Name = "label6".
        this-object:label6:Size = new System.Drawing.Size(144, 16).
        this-object:label6:TabIndex = 0.
        this-object:label6:Text = "Style".
        this-object:label6:UseCompatibleTextRendering = true.
        /*  */
        /* pictureBox1 */
        /*  */
        this-object:pictureBox1:Image = cast(resources:GetObject("pictureBox1.Image"), System.Drawing.Image).
        this-object:pictureBox1:Location = new System.Drawing.Point(248, 16).
        this-object:pictureBox1:Name = "pictureBox1".
        this-object:pictureBox1:Size = new System.Drawing.Size(24, 24).
        this-object:pictureBox1:TabIndex = 25.
        this-object:pictureBox1:TabStop = false.
        this-object:pictureBox1:MouseUp:subscribe(this-object:pictureBox1_MouseUp).
        /*  */
        /* spinFloatingToolbarFadeDelay */
        /*  */
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true", Type="System.Int32").
        define variable arrayvar13 as INTEGER extent 4 no-undo.
        arrayvar13[1] = 100.
        arrayvar13[2] = 0.
        arrayvar13[3] = 0.
        arrayvar13[4] = 0.
        this-object:spinFloatingToolbarFadeDelay:Increment = Progress.Util.DecimalHelper:Create(arrayvar13).
        this-object:spinFloatingToolbarFadeDelay:Location = new System.Drawing.Point(216, 232).
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true", Type="System.Int32").
        define variable arrayvar14 as INTEGER extent 4 no-undo.
        arrayvar14[1] = 100000.
        arrayvar14[2] = 0.
        arrayvar14[3] = 0.
        arrayvar14[4] = 0.
        this-object:spinFloatingToolbarFadeDelay:Maximum = Progress.Util.DecimalHelper:Create(arrayvar14).
        this-object:spinFloatingToolbarFadeDelay:Name = "spinFloatingToolbarFadeDelay".
        this-object:spinFloatingToolbarFadeDelay:Size = new System.Drawing.Size(72, 20).
        this-object:spinFloatingToolbarFadeDelay:TabIndex = 10.
        this-object:spinFloatingToolbarFadeDelay:TextChanged:subscribe(this-object:spinFloatingToolbarFadeDelay_TextChanged).
        this-object:spinFloatingToolbarFadeDelay:ValueChanged:subscribe(this-object:spinFloatingToolbarFadeDelay_ValueChanged).
        /*  */
        /* label4 */
        /*  */
        this-object:label4:BackColor = System.Drawing.SystemColors:ControlDark.
        this-object:label4:Dock = System.Windows.Forms.DockStyle:Top.
        this-object:label4:ForeColor = System.Drawing.SystemColors:ControlLight.
        this-object:label4:Location = new System.Drawing.Point(0, 0).
        this-object:label4:Name = "label4".
        this-object:label4:Size = new System.Drawing.Size(216, 16).
        this-object:label4:TabIndex = 0.
        this-object:label4:Text = "Popup Control Container".
        this-object:label4:TextAlign = System.Drawing.ContentAlignment:MiddleCenter.
        this-object:label4:UseCompatibleTextRendering = true.
        /*  */
        /* label5 */
        /*  */
        this-object:label5:Location = new System.Drawing.Point(216, 216).
        this-object:label5:Name = "label5".
        this-object:label5:Size = new System.Drawing.Size(224, 16).
        this-object:label5:TabIndex = 9.
        this-object:label5:Text = "Floating Toolbar Fade Delay (milliseconds)".
        this-object:label5:UseCompatibleTextRendering = true.
        /*  */
        /* chLargeMenuIcons */
        /*  */
        this-object:chLargeMenuIcons:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
        this-object:chLargeMenuIcons:Location = new System.Drawing.Point(16, 112).
        this-object:chLargeMenuIcons:Name = "chLargeMenuIcons".
        this-object:chLargeMenuIcons:Size = new System.Drawing.Size(112, 16).
        this-object:chLargeMenuIcons:TabIndex = 4.
        this-object:chLargeMenuIcons:Text = "Large Menu Icons".
        this-object:chLargeMenuIcons:UseCompatibleTextRendering = true.
        this-object:chLargeMenuIcons:CheckedChanged:subscribe(this-object:chLargeMenuIcons_CheckedChanged).
        /*  */
        /* imageList2 */
        /*  */
        this-object:imageList2:ImageStream = cast(resources:GetObject("imageList2.ImageStream"), System.Windows.Forms.ImageListStreamer).
        this-object:imageList2:TransparentColor = System.Drawing.Color:Transparent.
        this-object:imageList2:Images:SetKeyName(0, "").
        this-object:imageList2:Images:SetKeyName(1, "").
        this-object:imageList2:Images:SetKeyName(2, "").
        this-object:imageList2:Images:SetKeyName(3, "").
        this-object:imageList2:Images:SetKeyName(4, "").
        this-object:imageList2:Images:SetKeyName(5, "").
        this-object:imageList2:Images:SetKeyName(6, "").
        this-object:imageList2:Images:SetKeyName(7, "").
        this-object:imageList2:Images:SetKeyName(8, "").
        /*  */
        /* treeView1 */
        /*  */
        this-object:treeView1:Dock = System.Windows.Forms.DockStyle:Fill.
        this-object:treeView1:ImageIndex = 0.
        this-object:treeView1:ImageList = this-object:imageList2.
        this-object:treeView1:Location = new System.Drawing.Point(0, 16).
        this-object:treeView1:Name = "treeView1".
        this-object:treeView1:SelectedImageIndex = 0.
        this-object:treeView1:Size = new System.Drawing.Size(216, 136).
        this-object:treeView1:TabIndex = 1.
        /*  */
        /* label3 */
        /*  */
        this-object:label3:Location = new System.Drawing.Point(8, 12).
        this-object:label3:Name = "label3".
        this-object:label3:Size = new System.Drawing.Size(240, 24).
        this-object:label3:TabIndex = 0.
        this-object:label3:Text = "Right-click on flag to display a context menu".
        this-object:label3:TextAlign = System.Drawing.ContentAlignment:MiddleRight.
        this-object:label3:UseCompatibleTextRendering = true.
        /*  */
        /* chLargeToolbarIcons */
        /*  */
        this-object:chLargeToolbarIcons:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
        this-object:chLargeToolbarIcons:Location = new System.Drawing.Point(16, 136).
        this-object:chLargeToolbarIcons:Name = "chLargeToolbarIcons".
        this-object:chLargeToolbarIcons:Size = new System.Drawing.Size(144, 16).
        this-object:chLargeToolbarIcons:TabIndex = 5.
        this-object:chLargeToolbarIcons:Text = "Large Toolbar Icons".
        this-object:chLargeToolbarIcons:UseCompatibleTextRendering = true.
        this-object:chLargeToolbarIcons:CheckedChanged:subscribe(this-object:chLargeToolbarIcons_CheckedChanged).
        /*  */
        /* pnlPopupControlContainer */
        /*  */
        this-object:pnlPopupControlContainer:Controls:Add(this-object:treeView1).
        this-object:pnlPopupControlContainer:Controls:Add(this-object:label4).
        this-object:pnlPopupControlContainer:Location = new System.Drawing.Point(456, 224).
        this-object:pnlPopupControlContainer:Name = "pnlPopupControlContainer".
        this-object:pnlPopupControlContainer:Size = new System.Drawing.Size(216, 152).
        this-object:pnlPopupControlContainer:TabIndex = 28.
        this-object:pnlPopupControlContainer:Visible = false.
        /*  */
        /* ultraGridBagLayoutManager1 */
        /*  */
        this-object:ultraGridBagLayoutManager1:ContainerControl = this-object:pnlTaskPaneContents.
        this-object:ultraGridBagLayoutManager1:ExpandToFitHeight = true.
        this-object:ultraGridBagLayoutManager1:ExpandToFitWidth = true.
        this-object:ultraGridBagLayoutManager1:Margins:Bottom = 5.
        this-object:ultraGridBagLayoutManager1:Margins:Left = 5.
        this-object:ultraGridBagLayoutManager1:Margins:Right = 5.
        this-object:ultraGridBagLayoutManager1:Margins:Top = 5.
        /*  */
        /* liEvents */
        /*  */
        this-object:liEvents:BorderStyle = System.Windows.Forms.BorderStyle:FixedSingle.
        this-object:liEvents:IntegralHeight = false.
        this-object:liEvents:Location = new System.Drawing.Point(16, 280).
        this-object:liEvents:Name = "liEvents".
        this-object:liEvents:Size = new System.Drawing.Size(638, 64).
        this-object:liEvents:TabIndex = 0.
        /*  */
        /* chPopupToolbarStyle */
        /*  */
        this-object:chPopupToolbarStyle:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
        this-object:chPopupToolbarStyle:Location = new System.Drawing.Point(16, 168).
        this-object:chPopupToolbarStyle:Name = "chPopupToolbarStyle".
        this-object:chPopupToolbarStyle:Size = new System.Drawing.Size(144, 32).
        this-object:chPopupToolbarStyle:TabIndex = 6.
        this-object:chPopupToolbarStyle:Text = "Use PopupToolbar style on 'Tearoff Menu'".
        this-object:chPopupToolbarStyle:UseCompatibleTextRendering = true.
        this-object:chPopupToolbarStyle:CheckedChanged:subscribe(this-object:chPopupToolbarStyle_CheckedChanged).
        /*  */
        /* chDestroyTearawayOnClose */
        /*  */
        this-object:chDestroyTearawayOnClose:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
        this-object:chDestroyTearawayOnClose:Location = new System.Drawing.Point(16, 56).
        this-object:chDestroyTearawayOnClose:Name = "chDestroyTearawayOnClose".
        this-object:chDestroyTearawayOnClose:Size = new System.Drawing.Size(176, 16).
        this-object:chDestroyTearawayOnClose:TabIndex = 2.
        this-object:chDestroyTearawayOnClose:Text = "Destroy tearoffs on close".
        this-object:chDestroyTearawayOnClose:UseCompatibleTextRendering = true.
        /*  */
        /* label1 */
        /*  */
        this-object:label1:Location = new System.Drawing.Point(16, 216).
        this-object:label1:Name = "label1".
        this-object:label1:Size = new System.Drawing.Size(144, 16).
        this-object:label1:TabIndex = 7.
        this-object:label1:Text = "Menu Animation Style".
        this-object:label1:UseCompatibleTextRendering = true.
        /*  */
        /* chAllowTearawayToDock */
        /*  */
        this-object:chAllowTearawayToDock:Checked = true.
        this-object:chAllowTearawayToDock:CheckState = System.Windows.Forms.CheckState:Checked.
        this-object:chAllowTearawayToDock:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
        this-object:chAllowTearawayToDock:Location = new System.Drawing.Point(16, 88).
        this-object:chAllowTearawayToDock:Name = "chAllowTearawayToDock".
        this-object:chAllowTearawayToDock:Size = new System.Drawing.Size(192, 16).
        this-object:chAllowTearawayToDock:TabIndex = 3.
        this-object:chAllowTearawayToDock:Text = "Allow tearoffs to dock".
        this-object:chAllowTearawayToDock:UseCompatibleTextRendering = true.
        this-object:chAllowTearawayToDock:CheckedChanged:subscribe(this-object:chAllowTearawayToDock_CheckedChanged).
        /*  */
        /* Form1_Fill_Panel */
        /*  */
        this-object:Form1_Fill_Panel:Controls:Add(this-object:pnlTaskPaneContents).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:ultraExplorerBar1).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:label6).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:coStyle).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:spinFloatingToolbarFadeDelay).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:label5).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:chLargeMenuIcons).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:chLargeToolbarIcons).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:chAllowTearawayToDock).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:chDestroyTearawayOnClose).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:label1).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:coMenuAnimationStyle).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:panel1).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:panel3).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:chPopupToolbarStyle).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:pnlPopupControlContainer).
        this-object:Form1_Fill_Panel:Controls:Add(this-object:liEvents).
        this-object:Form1_Fill_Panel:Cursor = System.Windows.Forms.Cursors:Default.
        this-object:Form1_Fill_Panel:Dock = System.Windows.Forms.DockStyle:Fill.
        this-object:Form1_Fill_Panel:Location = new System.Drawing.Point(23, 86).
        this-object:Form1_Fill_Panel:Name = "Form1_Fill_Panel".
        this-object:Form1_Fill_Panel:Size = new System.Drawing.Size(674, 321).
        this-object:Form1_Fill_Panel:TabIndex = 5.
        /*  */
        /* coMenuAnimationStyle */
        /*  */
        this-object:coMenuAnimationStyle:DropDownStyle = System.Windows.Forms.ComboBoxStyle:DropDownList.
        this-object:coMenuAnimationStyle:Location = new System.Drawing.Point(16, 232).
        this-object:coMenuAnimationStyle:Name = "coMenuAnimationStyle".
        this-object:coMenuAnimationStyle:Size = new System.Drawing.Size(176, 21).
        this-object:coMenuAnimationStyle:TabIndex = 8.
        this-object:coMenuAnimationStyle:SelectedIndexChanged:subscribe(this-object:coMenuAnimationStyle_SelectedIndexChanged).
        /*  */
        /* panel3 */
        /*  */
        this-object:panel3:Anchor = cast(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        this-object:panel3:BackColor = System.Drawing.SystemColors:ControlLight.
        this-object:panel3:BorderStyle = System.Windows.Forms.BorderStyle:FixedSingle.
        this-object:panel3:Controls:Add(this-object:pictureBox1).
        this-object:panel3:Controls:Add(this-object:label3).
        this-object:panel3:Location = new System.Drawing.Point(216, 152).
        this-object:panel3:Name = "panel3".
        this-object:panel3:Size = new System.Drawing.Size(445, 51).
        this-object:panel3:TabIndex = 11.
        /*  */
        /* Form1 */
        /*  */
        this-object:ClientSize = new System.Drawing.Size(842, 517).
        this-object:Controls:Add(this-object:Form1_Fill_Panel).
        this-object:Controls:Add(this-object:m_Form1_Toolbars_Dock_Area_Left).
        this-object:Controls:Add(this-object:m_Form1_Toolbars_Dock_Area_Right).
        this-object:Controls:Add(this-object:m_Form1_Toolbars_Dock_Area_Top).
        this-object:Controls:Add(this-object:m_Form1_Toolbars_Dock_Area_Bottom).
        this-object:Name = "Form1".
        this-object:Text = "WinToolbar - Basic Features".
        this-object:Load:subscribe(this-object:Form1_Load).
        cast(this-object:ultraToolbarsManager1, System.ComponentModel.ISupportInitialize):EndInit().
        cast(this-object:ultraToolbarsManager2, System.ComponentModel.ISupportInitialize):EndInit().
        this-object:panel1:ResumeLayout(false).
        this-object:panel2:ResumeLayout(false).
        this-object:pnlTaskPaneContents:ResumeLayout(false).
        cast(this-object:treFolders, System.ComponentModel.ISupportInitialize):EndInit().
        cast(this-object:ultraExplorerBar1, System.ComponentModel.ISupportInitialize):EndInit().
        cast(this-object:pictureBox1, System.ComponentModel.ISupportInitialize):EndInit().
        cast(this-object:spinFloatingToolbarFadeDelay, System.ComponentModel.ISupportInitialize):EndInit().
        this-object:pnlPopupControlContainer:ResumeLayout(false).
        cast(this-object:ultraGridBagLayoutManager1, System.ComponentModel.ISupportInitialize):EndInit().
        this-object:Form1_Fill_Panel:ResumeLayout(false).
        this-object:panel3:ResumeLayout(false).
        this-object:ResumeLayout(false).
        catch e as Progress.Lang.Error:
            undo, throw e.
        end catch.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID Form1_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE maskListTool   AS ComboBoxTool             NO-UNDO.
	    DEFINE VARIABLE maskListItems  AS ValueListItemsCollection NO-UNDO.
	    DEFINE VARIABLE maskConverter  AS MaskTypeConverter        NO-UNDO.
	    DEFINE VARIABLE standardValue  AS System.Object            NO-UNDO.
	    DEFINE VARIABLE standardValues AS System.ComponentModel.TypeConverter+StandardValuesCollection NO-UNDO.
	    DEFINE VARIABLE valuesEnum     AS System.Collections.IEnumerator NO-UNDO.
	     
        InitializeToolbarsManager1().
		InitializeToolbarsManager2().

		/*Load the Styles combo*/
		LoadEnumsIntoCombo(coStyle, Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinToolbars.ToolbarStyle")).

		coStyle:SelectedItem = ultraToolbarsManager1:Style.

		/*Load the menu animations combo*/
		coMenuAnimationStyle:Items:Add(MenuAnimationStyle:None).
		coMenuAnimationStyle:Items:Add(MenuAnimationStyle:Random).
		coMenuAnimationStyle:Items:Add(MenuAnimationStyle:Unfold).
		coMenuAnimationStyle:Items:Add(MenuAnimationStyle:Slide).
		coMenuAnimationStyle:Items:Add(MenuAnimationStyle:Fade).
		coMenuAnimationStyle:SelectedItem = ultraToolbarsManager1:MenuAnimationStyle.

		/*Init some controls.*/
		ASSIGN
		chLargeMenuIcons:Checked			= ultraToolbarsManager1:UseLargeImagesOnMenu
		chLargeToolbarIcons:Checked		    = ultraToolbarsManager1:UseLargeImagesOnToolbar
		spinFloatingToolbarFadeDelay:Value	= DECIMAL(ultraToolbarsManager1:FloatingToolbarFadeDelay).

		/*Load the treeview control with data.*/
		LoadTreeview().
		LoadFolderTreeview().

	    maskListTool = CAST(ultraToolbarsManager1:Tools:Item["Example Masks"], ComboBoxTool).
	    maskListItems = maskListTool:ValueList:ValueListItems.
		maskListItems:Clear().
	    maskConverter = new MaskTypeConverter().
		standardValues = maskConverter:GetStandardValues( new SimpleTypeDescriptorContext(ultraToolbarsManager1:Tools:Item["MaskedEdit Tool"])).
		valuesEnum = standardValues:GetEnumerator().

        valuesEnum:Reset().

        REPEAT:
            IF NOT valuesEnum:MoveNext() THEN LEAVE.
            standardValue = valuesEnum:CURRENT. 
        END.
	END METHOD. /*METHOD PRIVATE VOID Form1_Load*/

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID InitializeToolbarsManager1():
	    DEFINE VARIABLE mainMenuBar         AS UltraToolbar    NO-UNDO.
	    DEFINE VARIABLE standardMenuBar     AS UltraToolbar    NO-UNDO.
	    DEFINE VARIABLE formattingMenuBar   AS UltraToolbar    NO-UNDO.
	    DEFINE VARIABLE fileMenuTool        AS PopupMenuTool   NO-UNDO.
	    DEFINE VARIABLE editMenuTool        AS PopupMenuTool   NO-UNDO.
	    DEFINE VARIABLE bigMenu             AS PopupMenuTool   NO-UNDO. 
	    DEFINE VARIABLE cascadeMenuTool1    AS PopupMenuTool   NO-UNDO.
	    DEFINE VARIABLE cascadeMenuTool2    AS PopupMenuTool   NO-UNDO.
	    DEFINE VARIABLE bt                  AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt1                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt2                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt3                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt4                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt5                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt6                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt7                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt8                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt9                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bigToolbar          AS UltraToolbar    NO-UNDO.
	    DEFINE VARIABLE alignmentToolbar    AS UltraToolbar    NO-UNDO.
	    DEFINE VARIABLE sbLeft              AS StateButtonTool NO-UNDO.
	    DEFINE VARIABLE sbCenter            AS StateButtonTool NO-UNDO.
	    DEFINE VARIABLE sbRight             AS StateButtonTool NO-UNDO.
	    DEFINE VARIABLE imageAndTextToolbar AS UltraToolbar    NO-UNDO.
	    DEFINE VARIABLE popupControlContainerTool AS PopupControlContainerTool NO-UNDO.
	    DEFINE VARIABLE popupColorPickerTool AS PopupColorPickerTool NO-UNDO. 
	    DEFINE VARIABLE buttonNumber        AS INTEGER         NO-UNDO.
	    DEFINE VARIABLE toolRange           AS CHARACTER       NO-UNDO EXTENT 3 INITIAL ["Left", "Center", "Right"].

	    /*Get a reference to the menu bars we created at designtime via the customizer.*/
		ASSIGN mainMenuBar		 = ultraToolbarsManager1:Toolbars["MainMenuBar"]
		       standardMenuBar	 = ultraToolbarsManager1:Toolbars["Standard"]
		       formattingMenuBar = ultraToolbarsManager1:Toolbars["Formatting"].

		/*Create the File Menu*/
		ASSIGN fileMenuTool = new PopupMenuTool("file_menu")
 		       fileMenuTool:SharedProps:Caption	= "&File"
   		       fileMenuTool:SETTINGS:IsSideStripVisible						   = DefaultableBoolean:TRUE
		       fileMenuTool:SETTINGS:SideStripText							   = "Infragistics"
		       fileMenuTool:SETTINGS:SideStripAppearance:ForeColor			   = SystemColors:Highlight
		       fileMenuTool:SETTINGS:SideStripAppearance:BackColor2			   = System.Drawing.Color:WhiteSmoke
		       fileMenuTool:SETTINGS:SideStripAppearance:BackGradientStyle	   = GradientStyle:Vertical
		       fileMenuTool:SETTINGS:SideStripAppearance:FontData:Bold		   = DefaultableBoolean:False
		       fileMenuTool:SETTINGS:SideStripAppearance:FontData:SizeInPoints = 16
		       fileMenuTool:SETTINGS:SideStripAppearance:FontData:Name         = "Arial"
		       fileMenuTool:SETTINGS:SideStripAppearance:Image				   = 24.

		/*Add the tool to the root tools collection.*/
		ultraToolbarsManager1:Tools:Add(fileMenuTool).

		/*Add the tool to the main menu bar.*/
		mainMenuBar:Tools:Add(fileMenuTool).

	    /*Place tools we created at designtime onto the file menu.*/
		fileMenuTool:Tools:Add(CAST(ultraToolbarsManager1:Tools:Item["New"],Infragistics.Win.UltraWinToolbars.ToolBase)).
		fileMenuTool:Tools:Add(CAST(ultraToolbarsManager1:Tools:Item["Open"],Infragistics.Win.UltraWinToolbars.ToolBase)).
		fileMenuTool:Tools:Add(CAST(ultraToolbarsManager1:Tools:Item["Save"],Infragistics.Win.UltraWinToolbars.ToolBase)).

		/*Create the Edit Menu*/
		ASSIGN editMenuTool                     = new PopupMenuTool("edit_menu")
               editMenuTool:SharedProps:Caption	= "&Edit".

		/*Add the tool to the root tools collection.*/
		ultraToolbarsManager1:Tools:Add(editMenuTool).

		/*Add the tool to the main menu bar.*/
		mainMenuBar:Tools:Add(editMenuTool).

		/*Place tools we created at designtime onto the edit menu.*/
		editMenuTool:Tools:Add(CAST(ultraToolbarsManager1:Tools:Item["Cut"],ToolBase)).
		editMenuTool:Tools:Add(CAST(ultraToolbarsManager1:Tools:Item["Copy"],ToolBase)).
		editMenuTool:Tools:Add(CAST(ultraToolbarsManager1:Tools:Item["Paste"],ToolBase)).

		/*Create some miscellaneous button tools*/
		ASSIGN bt1						                         = new ButtonTool("bt1")
			   bt1:SharedProps:Caption				             = "Button Tool 1"
			   bt1:SharedProps:Shortcut    			             = Shortcut:CtrlShiftA
			   bt1:SharedProps:AppearancesSmall:Appearance:Image = 27.
		ultraToolbarsManager1:Tools:Add(bt1).

		ASSIGN bt2						                         = new ButtonTool("bt2")
		       bt2:SharedProps:Caption				             = "Button Tool 2"
			   bt2:SharedProps:Shortcut			                 = Shortcut:CtrlShiftB
		       bt2:SharedProps:AppearancesSmall:Appearance:Image = 28.
		ultraToolbarsManager1:Tools:Add(bt2).

		ASSIGN bt3					                 	         = new ButtonTool("bt3")
			   bt3:SharedProps:Caption				             = "Button Tool 3"
			   bt3:SharedProps:Shortcut			                 = Shortcut:CtrlShiftC
			   bt3:SharedProps:AppearancesSmall:Appearance:Image = 29.
		ultraToolbarsManager1:Tools:Add(bt3).

		ASSIGN bt4					                      	     = new ButtonTool("bt4")
			   bt4:SharedProps:Caption				             = "Button Tool 4"
			   bt4:SharedProps:Shortcut			                 = Shortcut:CtrlShiftD
			   bt4:SharedProps:AppearancesSmall:Appearance:Image = 30.
		ultraToolbarsManager1:Tools:Add(bt4).

		ASSIGN bt5						                         = new ButtonTool("bt5")
			   bt5:SharedProps:Caption				             = "Button Tool 5"
			   bt5:SharedProps:Shortcut			                 = Shortcut:CtrlShiftE
			   bt5:SharedProps:AppearancesSmall:Appearance:Image = 31.
		ultraToolbarsManager1:Tools:Add(bt5).

		ASSIGN bt6						                      = new ButtonTool("bt6")
			bt6:SharedProps:Caption				              = "Button Tool 6"
			bt6:SharedProps:Shortcut			              = Shortcut:CtrlShiftF
			bt6:SharedProps:AppearancesSmall:Appearance:Image = 32.
		ultraToolbarsManager1:Tools:Add(bt6).

		ASSIGN bt7					             	          = new ButtonTool("bt7")
			bt7:SharedProps:Caption				              = "Button Tool 7"
			bt7:SharedProps:Shortcut			              = Shortcut:CtrlShiftG
			bt7:SharedProps:AppearancesSmall:Appearance:Image = 33.
		ultraToolbarsManager1:Tools:Add(bt7).

        ASSIGN bt8						                      = new ButtonTool("bt8")
			   bt8:SharedProps:Caption				          = "Button Tool 8"
			   bt8:SharedProps:Shortcut		 	              = Shortcut:CtrlShiftH
			   bt8:SharedProps:AppearancesSmall:Appearance:Image = 34.
		ultraToolbarsManager1:Tools:Add(bt8).

	    ASSIGN bt9					                	      = new ButtonTool("bt9")
			   bt9:SharedProps:Caption				          = "Button Tool 9"
			   bt9:SharedProps:Shortcut			              = Shortcut:CtrlShiftI
			   bt9:SharedProps:AppearancesSmall:Appearance:Image = 35.
		ultraToolbarsManager1:Tools:Add(bt9).

		/*Add some miscellaneous button tools to the standard menu bar.*/
		standardMenuBar:Tools:Add(bt1).
		standardMenuBar:Tools:Add(bt2).
		standardMenuBar:Tools:Add(bt3).
		standardMenuBar:Tools:Add(bt4).
		standardMenuBar:Tools:Add(bt5).

        standardMenuBar:Tools:Item["bt1"]:InstanceProps:IsFirstInGroup = TRUE.

		/*Add some miscellaneous button tools to the formatting menu bar.*/
		formattingMenuBar:Tools:Add(bt6).
		formattingMenuBar:Tools:Add(bt7).
		formattingMenuBar:Tools:Add(bt8).
		formattingMenuBar:Tools:Add(bt9).

        formattingMenuBar:Tools:Item["bt6"]:InstanceProps:IsFirstInGroup = TRUE.

		/*Add some miscellaneous button tools to the file menu*/
		fileMenuTool:Tools:Add(bt6).
		fileMenuTool:Tools:Add(bt7).
		fileMenuTool:Tools:Add(bt8).
		fileMenuTool:Tools:Add(bt9).

        formattingMenuBar:Tools:Item["bt7"]:InstanceProps:IsFirstInGroup = TRUE.

		/*Create a new toolbar.*/
		ASSIGN bigToolbar = new UltraToolbar("BigToolbar").

		/*Add it to the component's toolbars collection.*/
		ultraToolbarsManager1:Toolbars:Add(bigToolbar).

		ASSIGN bigToolbar:TEXT           = "Big Toolbar"
 			   bigToolbar:DockedPosition = DockedPosition:TOP. /*Dock it to the top.*/

		/*Add a bunch of button tools:*/
		bigToolbar:Tools:Add(bt1).
		bigToolbar:Tools:Add(bt2).
		bigToolbar:Tools:Add(bt3).
		bigToolbar:Tools:Add(bt4).
		bigToolbar:Tools:Add(bt5).
		bigToolbar:Tools:Add(bt6).
		bigToolbar:Tools:Add(bt7).
		bigToolbar:Tools:Add(bt8).
		bigToolbar:Tools:Add(bt9).

		/*Add a couple of menu tools*/
		bigToolbar:Tools:Add(fileMenuTool).
		bigToolbar:Tools:Add(editMenuTool).

        ASSIGN bigToolbar:Tools:Item["bt1"]:InstanceProps:IsFirstInGroup       = TRUE
		       bigToolbar:Tools:Item["bt3"]:InstanceProps:IsFirstInGroup       = TRUE
		       bigToolbar:Tools:Item["bt5"]:InstanceProps:IsFirstInGroup       = TRUE
		       bigToolbar:Tools:Item["file_menu"]:InstanceProps:IsFirstInGroup = TRUE.

		/*Create 2 more menus we can use to create cascading menus:*/
		ASSIGN cascadeMenuTool1		                = new PopupMenuTool("cascade1")
 			   cascadeMenuTool1:SharedProps:Caption	= "Tearoff Menu"
			   cascadeMenuTool1:AllowTearaway		= TRUE.

		/*Add the Cascade1 menu tool to the root tools collection:*/
		ultraToolbarsManager1:Tools:Add(cascadeMenuTool1).

		/*Add some tools to the menu:*/
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager1:Tools:Item["bt1"]).
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager1:Tools:Item["bt2"]).
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager1:Tools:Item["bt3"]).
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager1:Tools:Item["bt4"]).
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager1:Tools:Item["bt5"]).

		/*Add the Cascade1 menu tool to the File menu tools collection:*/
		fileMenuTool:Tools:Add(cascadeMenuTool1).

		/*Create a second cascading menu and add it to the first*/
		ASSIGN cascadeMenuTool2							              = new PopupMenuTool("cascade2")
  			   cascadeMenuTool2:SharedProps:Caption					  = "Menu With Gradients"
			   cascadeMenuTool2:Settings:ToolAppearance:BackColor	  = Color:Transparent
			   cascadeMenuTool2:Settings:Appearance:BackColor		  = SystemColors:ControlDark
			   cascadeMenuTool2:Settings:Appearance:BackColor2		  = SystemColors:Control
			   cascadeMenuTool2:Settings:Appearance:BackGradientStyle = GradientStyle:HorizontalBump.

		/*Add the Cascade2 menu tool to the root tools collection:*/
		ultraToolbarsManager1:Tools:Add(cascadeMenuTool2).

		/*Add some tools to the menu:*/
		cascadeMenuTool2:Tools:Add(ultraToolbarsManager1:Tools:Item["bt5"]).
		cascadeMenuTool2:Tools:Add(ultraToolbarsManager1:Tools:Item["bt6"]).
		cascadeMenuTool2:Tools:Add(ultraToolbarsManager1:Tools:Item["bt7"]).
		cascadeMenuTool2:Tools:Add(ultraToolbarsManager1:Tools:Item["bt8"]).
		cascadeMenuTool2:Tools:Add(ultraToolbarsManager1:Tools:Item["bt9"]).

		/*Add the Cascade2 menu tool to the Cascade1 menu:*/
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager1:Tools:Item["cascade2"]).

		/*Add the Cascade1 menu tool to the main menu bar menu tools collection:*/
		mainMenuBar:Tools:Add(cascadeMenuTool1).

		/*Add the Cascade2 menu tool to the main menu bar menu tools collection:*/
		mainMenuBar:Tools:Add(cascadeMenuTool2).

		/*Create an 'Alignment' toolbar:*/
		ASSIGN alignmentToolbar      = new UltraToolbar("Alignment")
 			   alignmentToolbar:Text = "Alignment".

		/*Add it to the component's toolbars collection:*/
		ultraToolbarsManager1:Toolbars:Add(alignmentToolbar).

		/*Dock it to the top:*/
		alignmentToolbar:DockedPosition	= DockedPosition:Top.

		/*Create 3 state button tools for alignment*/
		ASSIGN sbLeft				                                = new StateButtonTool("Left")
			   sbLeft:SharedProps:Caption		            	    = "Align Left"
			   sbLeft:SharedProps:Shortcut			                = Shortcut:CtrlL
			   sbLeft:SharedProps:AppearancesSmall:Appearance:Image	= 0.
		ultraToolbarsManager1:Tools:Add(sbLeft).

		ASSIGN sbCenter				                                  = new StateButtonTool("Center")
			   sbCenter:SharedProps:Caption			                  = "Align Center"
			   sbCenter:SharedProps:Shortcut			              = Shortcut:CtrlE
			   sbCenter:SharedProps:AppearancesSmall:Appearance:Image = 1.
		ultraToolbarsManager1:Tools:Add(sbCenter).

		ASSIGN sbRight					                             = new StateButtonTool("Right")
			   sbRight:SharedProps:Caption				             = "Align Right"
			   sbRight:SharedProps:Shortcut			                 = Shortcut:CtrlR
			   sbRight:SharedProps:AppearancesSmall:Appearance:Image = 2.
		ultraToolbarsManager1:Tools:Add(sbRight).

		/*Create an Option set for the state buttons*/
		ultraToolbarsManager1:OptionSets:Add(false, "align").
		ultraToolbarsManager1:OptionSets["align"]:Tools:AddToolRange(toolRange).

		/*Add the state buttons to the toolbar:*/
		alignmentToolbar:Tools:Add(sbLeft).
		alignmentToolbar:Tools:Add(sbCenter).
		alignmentToolbar:Tools:Add(sbRight).


		/*Add the state buttons to a menu as well:*/
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager1:Tools:Item["Left"]).
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager1:Tools:Item["Center"]).
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager1:Tools:Item["Right"]).

		cascadeMenuTool1:Tools:Item["Left"]:InstanceProps:IsFirstInGroup = TRUE.

		/*Create a big menus so we can demonstrate scrolling and the hiding of non-recently used items:*/
		ASSIGN bigMenu		               = new PopupMenuTool("bigmenu")
			   bigMenu:SharedProps:Caption = "Big Menu"
			   bigMenu:AllowTearaway	   = TRUE.

		/*Add the 'big menu' tool to the root tools collection:*/
		ultraToolbarsManager1:Tools:Add(bigMenu).

		/*Add some tools to the menu:*/
		bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["bt1"]).
		bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["bt2"]).
		bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["bt3"]).
		bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["bt4"]).
		bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["bt5"]).
		bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["bt6"]).
		bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["bt7"]).
		bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["bt8"]).
		bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["bt9"]).
		bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["cascade1"]).
		bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["cascade2"]).
		bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["Left"]).
		bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["Center"]).
		bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["Right"]).

		bigMenu:Tools:Item["Left"]:InstanceProps:IsFirstInGroup = TRUE.

		/*Create some more buttons and add them:*/
		REPEAT buttonNumber = 10 TO 34:
		    ASSIGN bt                     = new ButtonTool("bt" + STRING(buttonNumber))
				   bt:SharedProps:Caption = "Button Tool " + STRING(buttonNumber).
			ultraToolbarsManager1:Tools:Add(bt).

			bigMenu:Tools:Add(ultraToolbarsManager1:Tools:Item["bt" + STRING(buttonNumber)]).
	    END.

		/*Make some of the tools on the menu 'not recently used':*/
		ASSIGN bigMenu:Tools:Item["bt3"]:InstanceProps:RecentlyUsed = FALSE
		       bigMenu:Tools:Item["bt5"]:InstanceProps:RecentlyUsed = FALSE
		       bigMenu:Tools:Item["bt7"]:InstanceProps:RecentlyUsed = FALSE.

		/*Add the 'big menu' tool to the main menu bar menu tools collection:*/
		mainMenuBar:Tools:Add(bigMenu).

		/*Create a toolbar we can use to show the display of image and text for a tools on a toolbar:*/
	    ASSIGN imageAndTextToolbar                           = new UltraToolbar("imageAndTextToolbar")
			   imageAndTextToolbar:Text						 = "Image And Text"
			   imageAndTextToolbar:Settings:ToolDisplayStyle = ToolDisplayStyle:ImageAndText
			   imageAndTextToolbar:Settings:CaptionPlacement = TextPlacement:BelowImage.

		/*Add it to the component's toolbars collection:*/
		ultraToolbarsManager1:Toolbars:Add(imageAndTextToolbar).

		/*Dock it to the bottom:*/
		imageAndTextToolbar:DockedPosition	= DockedPosition:Bottom.


		/*Add some miscellaneous tools*/
		imageAndTextToolbar:Tools:Add(ultraToolbarsManager1:Tools:Item["bt1"]).
		imageAndTextToolbar:Tools:Add(ultraToolbarsManager1:Tools:Item["bt2"]).
		imageAndTextToolbar:Tools:Add(ultraToolbarsManager1:Tools:Item["bt3"]).
		imageAndTextToolbar:Tools:Add(ultraToolbarsManager1:Tools:Item["bt4"]).
		imageAndTextToolbar:Tools:Add(ultraToolbarsManager1:Tools:Item["bt5"]).

		/*Create a PopupControlContainer Tool*/
	    ASSIGN popupControlContainerTool                          = new PopupControlContainerTool("popup_control")
 			   popupControlContainerTool:Control				  = pnlPopupControlContainer
			   popupControlContainerTool:DropDownArrowStyle		  = DropDownArrowStyle:Standard
			   popupControlContainerTool:AllowTearaway			  = TRUE
			   popupControlContainerTool:SharedProps:Caption	  = "World Flags"
			   popupControlContainerTool:SharedProps:DisplayStyle = ToolDisplayStyle:TextOnlyAlways.

		/*Add it to the component's tools collection:*/
		ultraToolbarsManager1:Tools:Add(popupControlContainerTool).

		/*Add it to the main menu bar:*/
		mainMenuBar:Tools:AddTool("popup_control").

		/*Create a ColorPickerTool*/
	    ASSIGN popupColorPickerTool                                               = new PopupColorPickerTool("popup_color_picker")
 			   popupColorPickerTool:SharedProps:Caption                           = "Color Picker Tool"
			   popupColorPickerTool:AllowTearaway					              = TRUE
			   popupColorPickerTool:SharedProps:AppearancesSmall:Appearance:Image = 41.

		/*Add it to the component's tools collection:*/
		ultraToolbarsManager1:Tools:Add(popupColorPickerTool).

		/*Add it to the main menu bar:*/
		mainMenuBar:Tools:AddTool("popup_color_picker").
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID LoadEnumsIntoCombo(INPUT combo AS ComboBox, INPUT tp AS System.Type):
        DEFINE VARIABLE enumValues  AS System.Array NO-UNDO.
        DEFINE VARIABLE totalValues AS INTEGER NO-UNDO.
        DEFINE VARIABLE currValue   AS INTEGER NO-UNDO.

        ASSIGN enumValues  = System.Enum:GetValues(tp)
               totalValues = enumValues:LENGTH - 1.

        REPEAT currValue = 0 TO totalValues:
            combo:Items:Add(enumValues:GetValue(currValue)).
        END.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID LoadTreeView(  ):
	    DEFINE VARIABLE rootNode   AS TreeNode                       NO-UNDO.
	    DEFINE VARIABLE node       AS TreeNode                       NO-UNDO.
	    DEFINE VARIABLE childNode  AS TreeNode                       NO-UNDO.
	    DEFINE VARIABLE childNodes AS System.Collections.IEnumerator NO-UNDO.

        rootNode = treeView1:Nodes:Add("Flags of the World").

		node		        = rootNode:Nodes:Add("USA").
		node:ImageIndex		= 0.

		node				= rootNode:Nodes:Add("Great Britain").
		node:ImageIndex		= 1.

		node				= rootNode:Nodes:Add("France").
		node:ImageIndex		= 2.

		node				= rootNode:Nodes:Add("Argentina").
		node:ImageIndex		= 3.

		node				= rootNode:Nodes:Add("Canada").
		node:ImageIndex		= 4.

		node				= rootNode:Nodes:Add("Italy").
		node:ImageIndex		= 5.

		node				= rootNode:Nodes:Add("Japan").
		node:ImageIndex		= 6.

		node				= rootNode:Nodes:Add("Mexico").
		node:ImageIndex		= 7.

		node				= rootNode:Nodes:Add("Norway").
		node:ImageIndex		= 8.

        ASSIGN childNodes = rootNode:Nodes:GetEnumerator().

        childNodes:Reset().

        REPEAT:
            IF NOT childNodes:MoveNext() THEN LEAVE.
            childNode = CAST(childNodes:CURRENT, TreeNode).
            childNode:SelectedImageIndex = childNode:ImageIndex.
        END.
		rootNode:Expand().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID LoadFolderTreeview():
	    DEFINE VARIABLE drives       AS System.Array  NO-UNDO.
	    DEFINE VARIABLE drive        AS CHARACTER     NO-UNDO.
        DEFINE VARIABLE totalDrives  AS INTEGER       NO-UNDO.
        DEFINE VARIABLE currentDrive AS INTEGER       NO-UNDO.
	    treFolders:Nodes:Clear().

		ASSIGN treFolders:PathSeparator = System.IO.Path:DirectorySeparatorChar.
		       treFolders:OVERRIDE:ShowExpansionIndicator = ShowExpansionIndicator:CheckOnExpand.
               drives = System.IO.Directory:GetLogicalDrives().
               totalDrives = drives:LENGTH - 1.

        REPEAT currentDrive = 0 TO totalDrives:
            drive = drives:GetValue(currentDrive).
            treFolders:Nodes:Add(?, drive).
        END.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID LoadFolderTreeviewHelper(INPUT node AS UltraTreeNode, INPUT path AS CHARACTER):
	    DEFINE VARIABLE directories      AS System.Array NO-UNDO.
	    DEFINE VARIABLE dirctry          AS CHARACTER    NO-UNDO.
	    DEFINE VARIABLE totalDirectories AS INTEGER      NO-UNDO.
	    DEFINE VARIABLE currentDirectory AS INTEGER      NO-UNDO.

	    ASSIGN directories = System.IO.Directory:GetDirectories(path + System.IO.Path:DirectorySeparatorChar)
	           totalDirectories = directories:LENGTH - 1.

        REPEAT currentDirectory = 0 TO totalDirectories:
            dirctry = directories:GetValue(currentDirectory).
	    	node:Nodes:Add(?, System.IO.Path:GetFileName(dirctry)).
		END.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID InitializeToolbarsManager2():
	    DEFINE VARIABLE bt1                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt2                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt3                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt4                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt5                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt6                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt7                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt8                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bt9                 AS ButtonTool      NO-UNDO.
	    DEFINE VARIABLE bigToolbar          AS UltraToolbar    NO-UNDO.
	    DEFINE VARIABLE cascadeMenuTool1    AS PopupMenuTool   NO-UNDO.
	    DEFINE VARIABLE cascadeMenuTool2    AS PopupMenuTool   NO-UNDO.

	    /*Create some miscellaneous button tools*/
		ASSIGN bt1  						                      = new ButtonTool("bt1")
			   bt1:SharedProps:Caption				              = "Button Tool 1"
			    bt1:SharedProps:AppearancesSmall:Appearance:Image = 30.
		ultraToolbarsManager2:Tools:Add(bt1).

		ASSIGN bt2  						                      = new ButtonTool("bt2")
			   bt2:SharedProps:Caption				              = "Button Tool 2"
			   bt2:SharedProps:AppearancesSmall:Appearance:Image  = 31.
		ultraToolbarsManager2:Tools:Add(bt2).

		ASSIGN bt3						                         = new ButtonTool("bt3")
			   bt3:SharedProps:Caption			          	     = "Button Tool 3"
			   bt3:SharedProps:AppearancesSmall:Appearance:Image = 32.
		ultraToolbarsManager2:Tools:Add(bt3).

		ASSIGN bt4						                         = new ButtonTool("bt4")
			   bt4:SharedProps:Caption				             = "Button Tool 4"
			   bt4:SharedProps:AppearancesSmall:Appearance:Image = 33.
		ultraToolbarsManager2:Tools:Add(bt4).

		ASSIGN bt5						                         = new ButtonTool("bt5")
			   bt5:SharedProps:Caption				             = "Button Tool 5"
			   bt5:SharedProps:AppearancesSmall:Appearance:Image = 34.
		ultraToolbarsManager2:Tools:Add(bt5).

		ASSIGN bt6						                         = new ButtonTool("bt6")
			   bt6:SharedProps:Caption				             = "Button Tool "
			   bt6:SharedProps:AppearancesSmall:Appearance:Image = 35.
		ultraToolbarsManager2:Tools:Add(bt6).

	    ASSIGN bt7						                         = new ButtonTool("bt7")
			   bt7:SharedProps:Caption				             = "Button Tool 7"
			   bt7:SharedProps:AppearancesSmall:Appearance:Image = 36.
		ultraToolbarsManager2:Tools:Add(bt7).

		ASSIGN bt8						                         = new ButtonTool("bt8")
			   bt8:SharedProps:Caption				             = "Button Tool 8"
			   bt8:SharedProps:AppearancesSmall:Appearance:Image = 37.
		ultraToolbarsManager2:Tools:Add(bt8).

		ASSIGN bt9						                         = new ButtonTool("bt9")
			   bt9:SharedProps:Caption				             = "Button Tool 9"
			   bt9:SharedProps:AppearancesSmall:Appearance:Image = 38.
		ultraToolbarsManager2:Tools:Add(bt9).


		/*Create a new toolbar:*/
	    ASSIGN bigToolbar = new UltraToolbar("BigToolbar2").

		/*Add it to the component's toolbars collection:*/
		ultraToolbarsManager2:Toolbars:Add(bigToolbar).

		ASSIGN bigToolbar:DockedPosition = DockedPosition:TOP /*Dock it to the top:*/
			   bigToolbar:Text			 = "BigToolbar2".

		/*Initialize the LockToolbars to true*/
		ultraToolbarsManager2:LockToolbars = TRUE.


		/*Prevent hiding of this toolbar since it is the only one on this manager:
		  If it was hidden then all the dock areas would disappear and the user
		  wouldn't be able to get to the toolbar list menu to make the toolbar visible again:*/
		bigToolbar:Settings:AllowHiding = DefaultableBoolean:False.

		/*Add a bunch of button tools to the toolbar:*/
		bigToolbar:Tools:Add(bt1).
		bigToolbar:Tools:Add(bt2).
		bigToolbar:Tools:Add(bt3).
		bigToolbar:Tools:Add(bt4).
		bigToolbar:Tools:Add(bt5).
		bigToolbar:Tools:Add(bt6).
		bigToolbar:Tools:Add(bt7).
		bigToolbar:Tools:Add(bt8).
		bigToolbar:Tools:Add(bt9).

		bigToolbar:Tools:Item["bt1"]:InstanceProps:IsFirstInGroup = TRUE.
		bigToolbar:Tools:Item["bt3"]:InstanceProps:IsFirstInGroup = TRUE.
		bigToolbar:Tools:Item["bt5"]:InstanceProps:IsFirstInGroup = TRUE.

		/*Create 2 more menus we can use to create cascading menus:*/
		ASSIGN cascadeMenuTool1		                = new PopupMenuTool("cascade1")
  			   cascadeMenuTool1:SharedProps:Caption	= "Tearoff Menu &1"
			   cascadeMenuTool1:AllowTearaway		= TRUE.

		/*Add the Cascade1 menu tool to the root tools collection:*/
		ultraToolbarsManager2:Tools:Add(cascadeMenuTool1).


		/*Add some tools to the menu:*/
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager2:Tools:Item["bt1"]).
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager2:Tools:Item["bt2"]).
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager2:Tools:Item["bt3"]).
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager2:Tools:Item["bt4"]).
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager2:Tools:Item["bt5"]).

		/*Add the Cascade1 menu tool to the toolbar's tools collection:*/
		bigToolbar:Tools:Add(cascadeMenuTool1).

		/*Create a second cascading menu and add it to the first*/
        ASSIGN cascadeMenuTool2		                = new PopupMenuTool("cascade2")
 			   cascadeMenuTool2:SharedProps:Caption	= "Tearoff Menu &2"
			   cascadeMenuTool2:AllowTearaway		= TRUE.

		/*Add the Cascade2 menu tool to the root tools collection:*/
		ultraToolbarsManager2:Tools:Add(cascadeMenuTool2).

		/*Add some tools to the menu:*/
		cascadeMenuTool2:Tools:Add(ultraToolbarsManager2:Tools:Item["bt5"]).
		cascadeMenuTool2:Tools:Add(ultraToolbarsManager2:Tools:Item["bt6"]).
		cascadeMenuTool2:Tools:Add(ultraToolbarsManager2:Tools:Item["bt7"]).
		cascadeMenuTool2:Tools:Add(ultraToolbarsManager2:Tools:Item["bt8"]).
		cascadeMenuTool2:Tools:Add(ultraToolbarsManager2:Tools:Item["bt9"]).

		/*Add the Cascade2 menu tool to the Cascade1 menu:*/
		cascadeMenuTool1:Tools:Add(ultraToolbarsManager2:Tools:Item["cascade2"]).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID btnExplore_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE path AS CHARACTER NO-UNDO.

		IF treFolders:SelectedNodes:Count = 0 THEN
            RETURN.
				
		ASSIGN path = treFolders:SelectedNodes[0]:FullPath.

		IF path NE ? AND LENGTH(path) > 0 THEN
			System.Diagnostics.Process:Start("explorer", path).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID chAllowTearawayToDock_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE toolbars AS System.Collections.IEnumerator NO-UNDO.
	    DEFINE VARIABLE toolbar  AS UltraToolbar NO-UNDO.

	    ASSIGN toolbars = ultraToolbarsManager1:Toolbars:GetEnumerator().

	    toolbars:RESET().

        REPEAT:
            IF NOT toolbars:MoveNext() THEN LEAVE.
            toolbar = CAST(toolbars:CURRENT, UltraToolbar).
            SetTearawayAllowDockProperties(toolbar).
	    END.

	    ASSIGN toolbars = ultraToolbarsManager1:Toolbars:GetEnumerator().

	    toolbars:RESET().

        REPEAT:
            IF NOT toolbars:MoveNext() THEN LEAVE.
            toolbar = CAST(toolbars:CURRENT, UltraToolbar).
            IF TYPE-OF(toolbar:TearawayToolOwner, TearawayToolBase) THEN
                SetTearawayAllowDockProperties(toolbar).
	    END.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID SetTearawayAllowDockProperties(INPUT toolbar AS UltraToolbar):
        DEFINE VARIABLE allowDock AS DefaultableBoolean NO-UNDO.

		IF chAllowTearawayToDock:CHECKED THEN
		    allowDock = DefaultableBoolean:TRUE.
		ELSE
			allowDock = DefaultableBoolean:FALSE.

		toolbar:SETTINGS:AllowDockTop		= allowDock.
		toolbar:SETTINGS:AllowDockBottom	= allowDock.
		toolbar:SETTINGS:AllowDockLeft		= allowDock.
		toolbar:SETTINGS:AllowDockRight		= allowDock.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID chAllowToolbarMoving_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        ultraToolbarsManager2:LockToolbars = NOT chAllowToolbarMoving:Checked.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID chLargeMenuIcons_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        ultraToolbarsManager1:UseLargeImagesOnMenu = chLargeMenuIcons:CHECKED.
		ultraToolbarsManager2:UseLargeImagesOnMenu = chLargeMenuIcons:CHECKED.
	END METHOD.

	/*------------------------------------------------------------------------------
    		Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID chLargeToolbarIcons_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        ultraToolbarsManager1:UseLargeImagesOnToolbar = chLargeToolbarIcons:Checked.
		ultraToolbarsManager2:UseLargeImagesOnToolbar = chLargeToolbarIcons:Checked.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID chMergeWithParent_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        IF chMergeWithParent:Checked = TRUE THEN
        DO:
			ultraToolbarsManager2:Toolbars[0]:Settings:AllowHiding = DefaultableBoolean:True.
			ultraToolbarsManager2:Toolbars[0]:DockedPosition = DockedPosition:Floating.

			/*Set the ActiveMdiChildManager property of the main manager*/
			ultraToolbarsManager1:ActiveMdiChildManager = ultraToolbarsManager2.

			/*Note: The following code that sets the MdiParentManager of 
			  the child manager is functionally equivalent to the line above 
			  this:ultraToolbarsManager2:MdiParentManager = this:ultraToolbarsManager1.*/
		END.
		ELSE DO:
			
			/*Set the ActiveMdiChildManager property of the main manager*/
			ultraToolbarsManager1:ActiveMdiChildManager = ?.

			ultraToolbarsManager2:Toolbars[0]:Settings:AllowHiding = DefaultableBoolean:False.
			ultraToolbarsManager2:Toolbars[0]:ResetState().
			ultraToolbarsManager2:Toolbars[0]:DockedPosition = DockedPosition:Top.
		END.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID chPopupToolbarStyle_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE newPopupStyle AS PopupStyle NO-UNDO.
	    DEFINE VARIABLE popupMenuTool AS PopupMenuTool NO-UNDO.
	    DEFINE VARIABLE tools AS System.Collections.IEnumerator NO-UNDO.
	    DEFINE VARIABLE tool AS ToolBase NO-UNDO.

        /*Determine the new popup style based on the checkbox setting.*/
		ASSIGN newPopupStyle = IF chPopupToolbarStyle:Checked THEN PopupStyle:Toolbar ELSE PopupStyle:MENU.

		/*Get a reference to the 'cascade1' menu.*/
		ASSIGN popupMenuTool = CAST(ultraToolbarsManager1:Tools:Item["cascade1"], PopupMenuTool).

		/*Change the popup style on the 'cascade1' root tool as well as all its instances.*/
		IF popupMenuTool NE ? THEN
        DO:
		    /*Set the popup style on the root tool.*/
			popupMenuTool:SETTINGS:PopupStyle = newPopupStyle.

            /*Change the popup style on every instance of the cascade1 menu.*/
            ASSIGN tools = popupMenuTool:SharedProps:ToolInstances:GetEnumerator().
            tools:RESET().

            REPEAT:
                IF NOT tools:MoveNext() THEN LEAVE.
                tool = CAST(tools:current, ToolBase).
                CAST(tool,PopupMenuTool):SETTINGS:PopupStyle = newPopupStyle.
            END.
		END.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID coMenuAnimationStyle_SelectedIndexChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        ultraToolbarsManager1:MenuAnimationStyle = CAST(coMenuAnimationStyle:SelectedItem,MenuAnimationStyle).
		ultraToolbarsManager2:MenuAnimationStyle = CAST(coMenuAnimationStyle:SelectedItem,MenuAnimationStyle).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID coStyle_SelectedIndexChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        /*Set the UltraToolbarsManager's Style property.*/
		IF coStyle:SelectedIndex  >  - 1 THEN
        DO:
		    ASSIGN ultraToolbarsManager1:Style = CAST(coStyle:SelectedItem,ToolbarStyle)
			       ultraToolbarsManager2:Style = CAST(coStyle:SelectedItem,ToolbarStyle).

			CASE ultraToolbarsManager1:Style:
			    WHEN ToolbarStyle:Office2000 THEN
			        ultraExplorerBar1:ViewStyle = Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarViewStyle:Office2000.
				WHEN ToolbarStyle:OfficeXP THEN
					ultraExplorerBar1:ViewStyle = Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarViewStyle:XP.
				WHEN ToolbarStyle:Office2003 THEN
					ultraExplorerBar1:ViewStyle = Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarViewStyle:Office2003.
				WHEN ToolbarStyle:VisualStudio2005 THEN
					ultraExplorerBar1:ViewStyle = Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarViewStyle:VisualStudio2005.
		    END CASE.
		END.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID OnToolbarModified(INPUT manager AS UltraToolbarsManager, INPUT e AS Infragistics.Win.UltraWinToolbars.ToolbarModifiedEventArgs):
	    DEFINE VARIABLE sb AS StringBuilder NO-UNDO.

	    ASSIGN  sb = new StringBuilder(200).

		sb:Append("Toolbar Modified!  <").

		CASE e:ToolbarChangeType:
		    WHEN ToolbarChangeType:Closed THEN
            DO:
			    sb:Append("Closed").

				IF e:Toolbar:TearawayToolOwner NE ? AND chDestroyTearawayOnClose:Checked THEN
					manager:Toolbars:Remove(e:Toolbar).
			END.
			WHEN ToolbarChangeType:Created THEN
			    sb:Append("Created").
			WHEN ToolbarChangeType:Destroyed THEN
			    sb:Append("Destroyed").
			WHEN ToolbarChangeType:Docked THEN
			    sb:Append("Docked").
			WHEN ToolbarChangeType:EndDrag THEN
			    sb:Append("End Drag").
			WHEN ToolbarChangeType:Opened THEN
			    sb:Append("Opened").
			WHEN ToolbarChangeType:Resized THEN
			    sb:Append("Resize").
			WHEN ToolbarChangeType:StartDrag THEN
			    sb:Append("Start Drag").
			WHEN ToolbarChangeType:Undocked THEN
			    sb:Append("Undocked").
        END CASE.

		sb:Append(">  [Key: '").
		sb:Append(e:Toolbar:Key).
		sb:Append("', Text: '").
		sb:Append(e:Toolbar:Text).
		sb:Append("']").

		AddStringToEventList(sb:ToString()).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC VOID AddStringToEventList(INPUT eventString AS CHARACTER):
	    liEvents:Items:Add(eventString).
		liEvents:SelectedIndex = liEvents:Items:Count - 1.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID AddToolEventToList(INPUT eventName AS CHARACTER, INPUT tool AS ToolBase):
	    DEFINE VARIABLE sb AS StringBuilder NO-UNDO.

	    ASSIGN sb = new StringBuilder(200).

		sb:Append(eventName).
		sb:Append("!    ").
		sb:Append("[Key: '").
		sb:Append(tool:Key).
		sb:Append("', Text: '").
		sb:Append(tool:CaptionResolved).
		sb:Append("']").

		IF TYPE-OF(tool, StateButtonTool) THEN
        DO:
		    sb:Append("  [Checked = ").
			sb:Append(CAST(tool,StateButtonTool):Checked).
			sb:Append("]").
        END.
		    AddStringToEventList(sb:ToString()).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID pictureBox1_MouseUp( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.MouseEventArgs ):
		IF Progress.Util.EnumHelper:AreEqual(e:Button,MouseButtons:RIGHT) THEN
		    ultraToolbarsManager1:ShowPopup("cascade1", System.Windows.Forms.Cursor:Position).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID spinFloatingToolbarFadeDelay_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    ultraToolbarsManager1:FloatingToolbarFadeDelay = DECIMAL(spinFloatingToolbarFadeDelay:Value).		
		ultraToolbarsManager2:FloatingToolbarFadeDelay = DECIMAL(spinFloatingToolbarFadeDelay:Value).		
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD private void spinFloatingToolbarFadeDelay_TextChanged(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
        IF ignoreSpinFadeDelayTextChanged = TRUE THEN RETURN.

		ultraToolbarsManager1:FloatingToolbarFadeDelay = System.Convert:ToInt32(spinFloatingToolbarFadeDelay:Text).		
		ultraToolbarsManager2:FloatingToolbarFadeDelay = System.Convert:ToInt32(spinFloatingToolbarFadeDelay:Text).		

        CATCH ex AS Progress.Lang.Error :
            ultraToolbarsManager1:FloatingToolbarFadeDelay = 0.		
			ultraToolbarsManager2:FloatingToolbarFadeDelay = 0.		

			ignoreSpinFadeDelayTextChanged		= TRUE.
			spinFloatingToolbarFadeDelay:Text	= "0".
			ignoreSpinFadeDelayTextChanged		= FALSE.
        END CATCH.
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID treFolders_BeforeExpand( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinTree.CancelableNodeEventArgs ):
        IF NOT e:TreeNode:HasNodes THEN
		    LoadFolderTreeviewHelper(e:TreeNode, e:TreeNode:FullPath).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupExpanded( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.GroupEventArgs ):
		ultraExplorerBar1:Height = ultraExplorerBar1:GetLogicalControlHeight().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_GroupCollapsed( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.GroupEventArgs ):
        ultraExplorerBar1:Height = ultraExplorerBar1:GetLogicalControlHeight().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraExplorerBar1_ItemClick( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinExplorerBar.ItemEventArgs ):
	    DEFINE VARIABLE newURL AS CHARACTER NO-UNDO.

        ASSIGN newUrl = STRING(e:ITEM:Tag).

		IF newUrl NE ? AND LENGTH(newUrl) > 0 THEN
            System.Diagnostics.Process:Start(newUrl).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_AfterTaskPaneToolSelected( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.TaskPaneToolbarEventArgs ):
        AddToolEventToList("AfterTaskPaneToolSelected", e:TaskPaneToolbar:SelectedTaskPaneTool).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_AfterToolCloseup( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.ToolDropdownEventArgs ):
		AddToolEventToList("AfterToolCloseup", e:Tool).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_AfterToolDragEnd( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.AfterToolDragEventArgs ):
        AddToolEventToList("AfterToolDragEnd", e:Tool).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_AfterToolDropdown( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.ToolDropdownEventArgs ):
	    AddToolEventToList("AfterToolDropDown", e:Tool).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_AfterToolEnterEditMode( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.AfterToolEnterEditModeEventArgs ):
		AddToolEventToList("AfterToolEnterEditMode", e:Tool).	
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_AfterToolExitEditMode( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.AfterToolExitEditModeEventArgs ):
        AddToolEventToList("AfterToolExitEditMode", e:Tool).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_BeforeShortcutKeyProcessed( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.BeforeShortcutKeyProcessedEventArgs ):
        AddToolEventToList("BeforeShortcutKeyProcessed", e:Tool).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_BeforeToolDragBegin( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.CancelableToolEventArgs ):
		AddToolEventToList("BeforeToolDragBegin", e:Tool).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_BeforeToolDropdown( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.BeforeToolDropdownEventArgs ):
        AddToolEventToList("BeforeToolDropdown", e:Tool).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_BeforeToolEnterEditMode( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.BeforeToolEnterEditModeEventArgs ):
        AddToolEventToList("BeforeToolEnterEditMode", e:Tool).	
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_BeforeToolExitEditMode( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.BeforeToolExitEditModeEventArgs ):
        AddToolEventToList("BeforeToolExitEditMode", e:Tool).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_TaskPaneToolResize( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.TaskPaneToolResizeEventArgs ):
	    DEFINE VARIABLE explorerBar AS UltraExplorerBar NO-UNDO.

        AddToolEventToList("TaskPaneToolResize", e:Tool).

		explorerBar = CAST(e:Control, UltraExplorerBar) NO-ERROR.

		IF explorerBar NE ? THEN
        DO:
		    /*initialize the width of the explorerbar with the available area*/
			explorerBar:Width = e:NewControlSize:Width.

			/*set the size using the maximum of the available height or the height needed to show all the groups*/
			e:NewControlSize = new Size(explorerBar:Width, 
					System.Math:Max(e:NewControlSize:Height, explorerBar:GetLogicalControlHeight()) ).
		END.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_TearawayToolbarCreated( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.TearawayToolbarCreatedEventArgs ):
	    e:DestroyOnClose = chDestroyTearawayOnClose:CHECKED.
		SetTearawayAllowDockProperties(e:Toolbar).

		AddStringToEventList("TearawayToolbarCreated").
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_ToolbarModified( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.ToolbarModifiedEventArgs ):
		OnToolbarModified(CAST(sender,UltraToolbarsManager), e ).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_ToolClick( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.ToolClickEventArgs ):
		AddToolEventToList("ToolClick", e:Tool).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_ToolDoubleClick( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.ToolEventArgs ):
		AddToolEventToList("ToolDoubleClick", e:Tool).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_ToolEditError( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.ToolEditErrorEventArgs ):
	    DEFINE VARIABLE messageResult AS logical NO-UNDO.
	    e:ShowErrorMessage = FALSE.

        MESSAGE "An exception occured while exiting edit mode:" + CHR(10) + e:ErrorText + CHR(10) + CHR(10) +  "Press OK to continue exiting edit mode and restore the original value. Press No to stay in edit mode." 
        VIEW-AS ALERT-BOX ERROR
        BUTTONS OK-CANCEL
        TITLE "ToolEditError event"
        UPDATE messageResult.

		IF messageResult THEN
            e:RestoreOriginalValue = TRUE.
		ELSE DO:
		    /*stay in edit mode and let the user modify the value*/
			e:StayInEditMode = TRUE.
		    e:RestoreOriginalValue = FALSE.
		END.
	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager1_ToolValueChanged( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.ToolEventArgs ):
	    DEFINE VARIABLE popupColorPickerTool AS PopupColorPickerTool NO-UNDO.
        DEFINE VARIABLE comboTool            AS ComboBoxTool         NO-UNDO.
        DEFINE VARIABLE maskTool             AS MaskedEditTool       NO-UNDO.

        AddToolEventToList("ToolValueChanged", e:Tool).
    
        IF TYPE-OF(e:Tool,PopupColorPickerTool) THEN
        DO:
            ASSIGN popupColorPickerTool = CAST(e:Tool,PopupColorPickerTool)
                   ForeColor            = popupColorPickerTool:SelectedColor.
        END.
		ELSE IF TYPE-OF(e:Tool,ComboBoxTool) THEN
        DO:
		    comboTool = CAST(e:Tool,ComboBoxTool).
            IF comboTool NE ? AND e:Tool:Key = "Example Masks" THEN
            DO ON ERROR UNDO, THROW:
                ASSIGN maskTool = CAST(e:Tool:ToolbarsManager:Tools:Item["MaskedEdit Tool"],MaskedEditTool)
                       maskTool:Value = ?
                       maskTool:MaskInput = comboTool:TEXT.

                CATCH ex AS Progress.Lang.Error :
                    MESSAGE "The specified mask '" + comboTool:Text + "' is not a valid input mask for a MaskedEditTool."
                    VIEW-AS ALERT-BOX.
                END CATCH.
            END.
        END.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager2_AfterToolCloseup( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.ToolDropdownEventArgs ):
        AddToolEventToList("AfterToolCloseup", e:Tool).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager2_AfterToolDropdown( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.ToolDropdownEventArgs ):
        AddToolEventToList("AfterToolDropDown", e:Tool).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager2_BeforeToolDropdown( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.BeforeToolDropdownEventArgs ):
        AddToolEventToList("BeforeToolDropdown", e:Tool).	
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager2_PropertyChanged( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.PropertyChangedEventArgs ):
        /*Listen for changes to the LockToolbars property so we can keep the associated checkbox in sync.*/
		IF TYPE-OF(e:ChangeInfo:PropId, Infragistics.Win.UltraWinToolbars.PropertyIds) THEN
		    IF CAST(e:ChangeInfo:PropId,Infragistics.Win.UltraWinToolbars.PropertyIds) = Infragistics.Win.UltraWinToolbars.PropertyIds:LockToolbars THEN
			    chAllowToolbarMoving:Checked = NOT ultraToolbarsManager2:LockToolbars.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager2_TearawayToolbarCreated( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.TearawayToolbarCreatedEventArgs ):
        e:DestroyOnClose = chDestroyTearawayOnClose:Checked.
        SetTearawayAllowDockProperties(e:Toolbar).

		AddStringToEventList("TearawayToolbarCreated").
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager2_ToolbarModified( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.ToolbarModifiedEventArgs ):
        OnToolbarModified( CAST(sender,UltraToolbarsManager), e ).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraToolbarsManager2_ToolClick( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.ToolClickEventArgs ):
        AddToolEventToList("ToolClick", e:Tool).	
	END METHOD.
END CLASS.