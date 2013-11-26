 /* 
ABL example derived from Infragistics source, copyright ©1992-2008 Infragistics, 
Inc., Windsor Corporate Park, 50 Millstone Road, Building 200 Suite 150, East 
Windsor, NJ 08520. All rights reserved.
*/
 /*------------------------------------------------------------------------
    File        : frmFilterRow
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels - copied/transformed from Infragistic sample
    Created     : Mon Jun 23 21:36:10 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/
 
USING Progress.Lang.*.
USING Progress.Windows.Form.

using WinGrid.SamplesExplorer.*.
 

CLASS WinGrid.SamplesExplorer.frmFilterRow INHERITS Form implements ISamplesBase : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.
 
	define public variable Panel1 as System.Windows.Forms.Panel no-undo.
	define private variable ultraTabControl1 as Infragistics.Win.UltraWinTabControl.UltraTabControl no-undo.
	define private variable ultraTabSharedControlsPage1 as Infragistics.Win.UltraWinTabControl.UltraTabSharedControlsPage no-undo.
	define private variable ultraTabPageControl1 as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraCheckEditorSingleBand as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraGroupBoxFilterRowOverrideSettings as Infragistics.Win.Misc.UltraGroupBox no-undo.
	define private variable ultraTextEditorFilterRowPrompt as Infragistics.Win.UltraWinEditors.UltraTextEditor no-undo.
	define private variable ultraLabel10 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorOverrideFilterEvaluationTrigger as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabel9 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraLabel4 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorOverrideFilterOperatorDefaultValue as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabel3 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorOverrideFilterOperatorDropDownItems as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabel1 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorOverrideFilterOperatorLocation as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabelOverrideFilterUIType as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraLabel2 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorOverrideFilterUIType as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraComboEditorOverrideFilterOperandStyle as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraGroupBoxFilterRowColumnSettings as Infragistics.Win.Misc.UltraGroupBox no-undo.
	define private variable ultraLabel11 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorColumnFilterEvaluationTrigger as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabel5 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorColumnFilterOperatorDefaultValue as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabel6 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorColumnFilterOperatorDropDownItems as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabel7 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorColumnFilterOperatorLocation as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabel8 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorColumnFilterOperandStyle as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraComboEditorColumn as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabelSelectColumn as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraTabPageControl2 as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraNumericEditorFilterRowSpacingAfter as Infragistics.Win.UltraWinEditors.UltraNumericEditor no-undo.
	define private variable ultraLabel18 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraNumericEditorFilterRowSpacingBefore as Infragistics.Win.UltraWinEditors.UltraNumericEditor no-undo.
	define private variable ultraLabel17 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraLabel16 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorFilterCellBorderStyle as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabel15 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorFilterOperatorBorderStyle as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabel14 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorFilterRowBorderStyle as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraButtonFilterCellAppearanceActive as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraButtonFilterRowAppearanceActive as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraButtonFilterRowSelectorAppearance as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraGroupBoxSeparatorGroupBox as Infragistics.Win.Misc.UltraGroupBox no-undo.
	define private variable ultraLabel13 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorSpecialRowSeparatorBorderStyle as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraNumericEditorSeparatorHeight as Infragistics.Win.UltraWinEditors.UltraNumericEditor no-undo.
	define private variable ultraLabel12 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraButtonSeparatorAppearance as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraCheckEditorSeparator as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraButtonFilterRowPromptAppearance as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraButtonFilterClearButtonAppearance as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraButtonFilterOperatorAppearance as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraButtonFilterCellAppearance as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraButtonFilterRowAppearance as Infragistics.Win.Misc.UltraButton no-undo.
	define public variable btnTitle as System.Windows.Forms.Button no-undo.

	define private variable UltraGrid1 as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.

	define private variable toolTip1 as System.Windows.Forms.ToolTip no-undo.

    /* manual defs */
	define private variable fCustOrderDataSource as DataServices.IDataService no-undo.
    define private variable fAppearancePickerForm as AppearancePicker no-undo.
	
	/* Column currently selected in columns combo. */
	define private property SelectedColumn as Infragistics.Win.UltraWinGrid.UltraGridColumn  no-undo
    get:
		return cast(ultraComboEditorColumn:SelectedItem:DataValue,Infragistics.Win.UltraWinGrid.UltraGridColumn).
	end.
	
	/* ISampleBase properties */
	/* Provides a description for the sample. */
	define public property Description as character no-undo 
	get:
	    return "This sample demonstrates the Fixed Filter Row Functionality.".
	end.
	
    /* Name of the sample. */
	define public property SampleName as character no-undo
    get:
        return btnTitle:Text. 
    end.
	
    /* Type of sample. */
	define public property SampleType as character no-undo
	get:
	    return "Feature".
	end.    

	/* Preview Picture for Sample */
	define public property PreviewPicture as System.Drawing.Image no-undo
    get:
        return System.Drawing.Image:FromFile(SamplesPath:GraphicsPath + "/Previews/FixedFilterRow.png").
    end.  
		
		
	CONSTRUCTOR PUBLIC frmFilterRow (  ):
		
		SUPER().
		InitializeComponent ( ).

	END CONSTRUCTOR.
	




	method private void InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

		this-object:components = new System.ComponentModel.Container().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance1 as Infragistics.Win.Appearance no-undo.
		appearance1 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab1 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab1 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab2 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab2 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance10 as Infragistics.Win.Appearance no-undo.
		appearance10 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance11 as Infragistics.Win.Appearance no-undo.
		appearance11 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance12 as Infragistics.Win.Appearance no-undo.
		appearance12 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance13 as Infragistics.Win.Appearance no-undo.
		appearance13 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance14 as Infragistics.Win.Appearance no-undo.
		appearance14 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance15 as Infragistics.Win.Appearance no-undo.
		appearance15 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance16 as Infragistics.Win.Appearance no-undo.
		appearance16 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance17 as Infragistics.Win.Appearance no-undo.
		appearance17 = new Infragistics.Win.Appearance().
		this-object:ultraTabPageControl1 = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraCheckEditorSingleBand = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraGroupBoxFilterRowOverrideSettings = new Infragistics.Win.Misc.UltraGroupBox().
		this-object:ultraTextEditorFilterRowPrompt = new Infragistics.Win.UltraWinEditors.UltraTextEditor().
		this-object:ultraLabel10 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorOverrideFilterEvaluationTrigger = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraLabel9 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraLabel4 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorOverrideFilterOperatorDefaultValue = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraLabel3 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorOverrideFilterOperatorDropDownItems = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraLabel1 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorOverrideFilterOperatorLocation = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraLabelOverrideFilterUIType = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraLabel2 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorOverrideFilterUIType = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraComboEditorOverrideFilterOperandStyle = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraGroupBoxFilterRowColumnSettings = new Infragistics.Win.Misc.UltraGroupBox().
		this-object:ultraLabel11 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorColumnFilterEvaluationTrigger = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraLabel5 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorColumnFilterOperatorDefaultValue = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraLabel6 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorColumnFilterOperatorDropDownItems = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraLabel7 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorColumnFilterOperatorLocation = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraLabel8 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorColumnFilterOperandStyle = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraComboEditorColumn = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraLabelSelectColumn = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraTabPageControl2 = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraNumericEditorFilterRowSpacingAfter = new Infragistics.Win.UltraWinEditors.UltraNumericEditor().
		this-object:ultraLabel18 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraNumericEditorFilterRowSpacingBefore = new Infragistics.Win.UltraWinEditors.UltraNumericEditor().
		this-object:ultraLabel17 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraLabel16 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorFilterCellBorderStyle = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraLabel15 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorFilterOperatorBorderStyle = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraLabel14 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorFilterRowBorderStyle = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraButtonFilterCellAppearanceActive = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraButtonFilterRowAppearanceActive = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraButtonFilterRowSelectorAppearance = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraGroupBoxSeparatorGroupBox = new Infragistics.Win.Misc.UltraGroupBox().
		this-object:ultraLabel13 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraNumericEditorSeparatorHeight = new Infragistics.Win.UltraWinEditors.UltraNumericEditor().
		this-object:ultraLabel12 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraButtonSeparatorAppearance = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraCheckEditorSeparator = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraButtonFilterRowPromptAppearance = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraButtonFilterClearButtonAppearance = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraButtonFilterOperatorAppearance = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraButtonFilterCellAppearance = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraButtonFilterRowAppearance = new Infragistics.Win.Misc.UltraButton().
		this-object:Panel1 = new System.Windows.Forms.Panel().
		this-object:ultraTabControl1 = new Infragistics.Win.UltraWinTabControl.UltraTabControl().
		this-object:ultraTabSharedControlsPage1 = new Infragistics.Win.UltraWinTabControl.UltraTabSharedControlsPage().
		this-object:btnTitle = new System.Windows.Forms.Button().
		this-object:UltraGrid1 = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:toolTip1 = new System.Windows.Forms.ToolTip(this-object:components).
		this-object:ultraTabPageControl1:SuspendLayout().
		cast(this-object:ultraGroupBoxFilterRowOverrideSettings, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraGroupBoxFilterRowOverrideSettings:SuspendLayout().
		cast(this-object:ultraTextEditorFilterRowPrompt, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorOverrideFilterEvaluationTrigger, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorOverrideFilterOperatorDefaultValue, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorOverrideFilterOperatorDropDownItems, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorOverrideFilterOperatorLocation, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorOverrideFilterUIType, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorOverrideFilterOperandStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraGroupBoxFilterRowColumnSettings, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraGroupBoxFilterRowColumnSettings:SuspendLayout().
		cast(this-object:ultraComboEditorColumnFilterEvaluationTrigger, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorColumnFilterOperatorDefaultValue, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorColumnFilterOperatorDropDownItems, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorColumnFilterOperatorLocation, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorColumnFilterOperandStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorColumn, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabPageControl2:SuspendLayout().
		cast(this-object:ultraNumericEditorFilterRowSpacingAfter, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraNumericEditorFilterRowSpacingBefore, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorFilterCellBorderStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorFilterOperatorBorderStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorFilterRowBorderStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraGroupBoxSeparatorGroupBox, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraGroupBoxSeparatorGroupBox:SuspendLayout().
		cast(this-object:ultraComboEditorSpecialRowSeparatorBorderStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraNumericEditorSeparatorHeight, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:Panel1:SuspendLayout().
		cast(this-object:ultraTabControl1, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabControl1:SuspendLayout().
		cast(this-object:UltraGrid1, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:SuspendLayout().
		/*  */
		/* ultraTabPageControl1 */
		/*  */
		this-object:ultraTabPageControl1:Controls:Add(this-object:ultraCheckEditorSingleBand).
		this-object:ultraTabPageControl1:Controls:Add(this-object:ultraGroupBoxFilterRowOverrideSettings).
		this-object:ultraTabPageControl1:Controls:Add(this-object:ultraGroupBoxFilterRowColumnSettings).
		this-object:ultraTabPageControl1:Location = new System.Drawing.Point(2, 24).
		this-object:ultraTabPageControl1:Name = "ultraTabPageControl1".
		this-object:ultraTabPageControl1:Size = new System.Drawing.Size(748, 222).
		/*  */
		/* ultraCheckEditorSingleBand */
		/*  */
		this-object:ultraCheckEditorSingleBand:Location = new System.Drawing.Point(624, 192).
		this-object:ultraCheckEditorSingleBand:Name = "ultraCheckEditorSingleBand".
		this-object:ultraCheckEditorSingleBand:Size = new System.Drawing.Size(120, 20).
		this-object:ultraCheckEditorSingleBand:TabIndex = 23.
		this-object:ultraCheckEditorSingleBand:Text = "SingleBand".
		this-object:ultraCheckEditorSingleBand:CheckedChanged:subscribe(this-object:ultraCheckEditorSingleBand_CheckedChanged).
		/*  */
		/* ultraGroupBoxFilterRowOverrideSettings */
		/*  */
		this-object:ultraGroupBoxFilterRowOverrideSettings:Controls:Add(this-object:ultraTextEditorFilterRowPrompt).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Controls:Add(this-object:ultraLabel10).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Controls:Add(this-object:ultraComboEditorOverrideFilterEvaluationTrigger).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Controls:Add(this-object:ultraLabel9).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Controls:Add(this-object:ultraLabel4).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Controls:Add(this-object:ultraComboEditorOverrideFilterOperatorDefaultValue).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Controls:Add(this-object:ultraLabel3).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Controls:Add(this-object:ultraComboEditorOverrideFilterOperatorDropDownItems).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Controls:Add(this-object:ultraLabel1).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Controls:Add(this-object:ultraComboEditorOverrideFilterOperatorLocation).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Controls:Add(this-object:ultraLabelOverrideFilterUIType).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Controls:Add(this-object:ultraLabel2).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Controls:Add(this-object:ultraComboEditorOverrideFilterUIType).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Controls:Add(this-object:ultraComboEditorOverrideFilterOperandStyle).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Location = new System.Drawing.Point(8, 8).
		this-object:ultraGroupBoxFilterRowOverrideSettings:Name = "ultraGroupBoxFilterRowOverrideSettings".
		this-object:ultraGroupBoxFilterRowOverrideSettings:Size = new System.Drawing.Size(360, 208).
		this-object:ultraGroupBoxFilterRowOverrideSettings:TabIndex = 20.
		this-object:ultraGroupBoxFilterRowOverrideSettings:Text = "Filter Row Settings - Grid Wide".
		this-object:ultraGroupBoxFilterRowOverrideSettings:UseMnemonic = false.
		/*  */
		/* ultraTextEditorFilterRowPrompt */
		/*  */
		this-object:ultraTextEditorFilterRowPrompt:Location = new System.Drawing.Point(192, 176).
		this-object:ultraTextEditorFilterRowPrompt:Name = "ultraTextEditorFilterRowPrompt".
		this-object:ultraTextEditorFilterRowPrompt:Size = new System.Drawing.Size(152, 21).
		this-object:ultraTextEditorFilterRowPrompt:TabIndex = 39.
		this-object:ultraTextEditorFilterRowPrompt:ValueChanged:subscribe(this-object:ultraTextEditorFilterRowPrompt_ValueChanged).
		/*  */
		/* ultraLabel10 */
		/*  */
		this-object:ultraLabel10:Location = new System.Drawing.Point(16, 80).
		this-object:ultraLabel10:Name = "ultraLabel10".
		this-object:ultraLabel10:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabel10:TabIndex = 38.
		this-object:ultraLabel10:Text = "FilterEvaluationTrigger:".
		/*  */
		/* ultraComboEditorOverrideFilterEvaluationTrigger */
		/*  */
		this-object:ultraComboEditorOverrideFilterEvaluationTrigger:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorOverrideFilterEvaluationTrigger:Location = new System.Drawing.Point(192, 80).
		this-object:ultraComboEditorOverrideFilterEvaluationTrigger:Name = "ultraComboEditorOverrideFilterEvaluationTrigger".
		this-object:ultraComboEditorOverrideFilterEvaluationTrigger:Size = new System.Drawing.Size(152, 21).
		this-object:ultraComboEditorOverrideFilterEvaluationTrigger:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorOverrideFilterEvaluationTrigger:TabIndex = 37.
		this-object:ultraComboEditorOverrideFilterEvaluationTrigger:ValueChanged:subscribe(this-object:ultraComboEditorOverrideFilterEvaluationTrigger_ValueChanged).
		/*  */
		/* ultraLabel9 */
		/*  */
		this-object:ultraLabel9:Location = new System.Drawing.Point(16, 176).
		this-object:ultraLabel9:Name = "ultraLabel9".
		this-object:ultraLabel9:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabel9:TabIndex = 36.
		this-object:ultraLabel9:Text = "Filter Row Prompt:".
		/*  */
		/* ultraLabel4 */
		/*  */
		this-object:ultraLabel4:Location = new System.Drawing.Point(16, 152).
		this-object:ultraLabel4:Name = "ultraLabel4".
		this-object:ultraLabel4:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabel4:TabIndex = 34.
		this-object:ultraLabel4:Text = "FilterOperatorDefaultValue:".
		/*  */
		/* ultraComboEditorOverrideFilterOperatorDefaultValue */
		/*  */
		this-object:ultraComboEditorOverrideFilterOperatorDefaultValue:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorOverrideFilterOperatorDefaultValue:Location = new System.Drawing.Point(192, 152).
		this-object:ultraComboEditorOverrideFilterOperatorDefaultValue:Name = "ultraComboEditorOverrideFilterOperatorDefaultValue".
		this-object:ultraComboEditorOverrideFilterOperatorDefaultValue:Size = new System.Drawing.Size(152, 21).
		this-object:ultraComboEditorOverrideFilterOperatorDefaultValue:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorOverrideFilterOperatorDefaultValue:TabIndex = 33.
		this-object:ultraComboEditorOverrideFilterOperatorDefaultValue:ValueChanged:subscribe(this-object:ultraComboEditorOverrideFilterOperatorDefaultValue_ValueChanged).
		/*  */
		/* ultraLabel3 */
		/*  */
		this-object:ultraLabel3:Location = new System.Drawing.Point(16, 128).
		this-object:ultraLabel3:Name = "ultraLabel3".
		this-object:ultraLabel3:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabel3:TabIndex = 32.
		this-object:ultraLabel3:Text = "FilterOperatorDropDownItems:".
		/*  */
		/* ultraComboEditorOverrideFilterOperatorDropDownItems */
		/*  */
		this-object:ultraComboEditorOverrideFilterOperatorDropDownItems:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorOverrideFilterOperatorDropDownItems:Location = new System.Drawing.Point(192, 128).
		this-object:ultraComboEditorOverrideFilterOperatorDropDownItems:Name = "ultraComboEditorOverrideFilterOperatorDropDownItems".
		this-object:ultraComboEditorOverrideFilterOperatorDropDownItems:Size = new System.Drawing.Size(152, 21).
		this-object:ultraComboEditorOverrideFilterOperatorDropDownItems:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorOverrideFilterOperatorDropDownItems:TabIndex = 31.
		this-object:ultraComboEditorOverrideFilterOperatorDropDownItems:ValueChanged:subscribe(this-object:ultraComboEditorOverrideFilterOperatorDropDownItems_ValueChanged).
		/*  */
		/* ultraLabel1 */
		/*  */
		this-object:ultraLabel1:Location = new System.Drawing.Point(16, 104).
		this-object:ultraLabel1:Name = "ultraLabel1".
		this-object:ultraLabel1:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabel1:TabIndex = 30.
		this-object:ultraLabel1:Text = "FilterOperatorLocation:".
		/*  */
		/* ultraComboEditorOverrideFilterOperatorLocation */
		/*  */
		this-object:ultraComboEditorOverrideFilterOperatorLocation:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorOverrideFilterOperatorLocation:Location = new System.Drawing.Point(192, 104).
		this-object:ultraComboEditorOverrideFilterOperatorLocation:Name = "ultraComboEditorOverrideFilterOperatorLocation".
		this-object:ultraComboEditorOverrideFilterOperatorLocation:Size = new System.Drawing.Size(152, 21).
		this-object:ultraComboEditorOverrideFilterOperatorLocation:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorOverrideFilterOperatorLocation:TabIndex = 29.
		this-object:ultraComboEditorOverrideFilterOperatorLocation:ValueChanged:subscribe(this-object:ultraComboEditorOverrideFilterOperatorLocation_ValueChanged).
		/*  */
		/* ultraLabelOverrideFilterUIType */
		/*  */
		this-object:ultraLabelOverrideFilterUIType:Location = new System.Drawing.Point(16, 56).
		this-object:ultraLabelOverrideFilterUIType:Name = "ultraLabelOverrideFilterUIType".
		this-object:ultraLabelOverrideFilterUIType:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabelOverrideFilterUIType:TabIndex = 28.
		this-object:ultraLabelOverrideFilterUIType:Text = "FilterOperandStyle:".
		/*  */
		/* ultraLabel2 */
		/*  */
		this-object:ultraLabel2:Location = new System.Drawing.Point(16, 24).
		this-object:ultraLabel2:Name = "ultraLabel2".
		this-object:ultraLabel2:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabel2:TabIndex = 27.
		this-object:ultraLabel2:Text = "FilterUIType:".
		/*  */
		/* ultraComboEditorOverrideFilterUIType */
		/*  */
		this-object:ultraComboEditorOverrideFilterUIType:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorOverrideFilterUIType:Location = new System.Drawing.Point(192, 24).
		this-object:ultraComboEditorOverrideFilterUIType:Name = "ultraComboEditorOverrideFilterUIType".
		this-object:ultraComboEditorOverrideFilterUIType:Size = new System.Drawing.Size(152, 21).
		this-object:ultraComboEditorOverrideFilterUIType:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorOverrideFilterUIType:TabIndex = 22.
		this-object:ultraComboEditorOverrideFilterUIType:ValueChanged:subscribe(this-object:ultraComboEditorOverrideFilterUIType_ValueChanged).
		/*  */
		/* ultraComboEditorOverrideFilterOperandStyle */
		/*  */
		this-object:ultraComboEditorOverrideFilterOperandStyle:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorOverrideFilterOperandStyle:Location = new System.Drawing.Point(192, 56).
		this-object:ultraComboEditorOverrideFilterOperandStyle:Name = "ultraComboEditorOverrideFilterOperandStyle".
		this-object:ultraComboEditorOverrideFilterOperandStyle:Size = new System.Drawing.Size(152, 21).
		this-object:ultraComboEditorOverrideFilterOperandStyle:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorOverrideFilterOperandStyle:TabIndex = 23.
		this-object:ultraComboEditorOverrideFilterOperandStyle:ValueChanged:subscribe(this-object:ultraComboEditorOverrideFilterOperandStyle_ValueChanged).
		/*  */
		/* ultraGroupBoxFilterRowColumnSettings */
		/*  */
		this-object:ultraGroupBoxFilterRowColumnSettings:Controls:Add(this-object:ultraLabel11).
		this-object:ultraGroupBoxFilterRowColumnSettings:Controls:Add(this-object:ultraComboEditorColumnFilterEvaluationTrigger).
		this-object:ultraGroupBoxFilterRowColumnSettings:Controls:Add(this-object:ultraLabel5).
		this-object:ultraGroupBoxFilterRowColumnSettings:Controls:Add(this-object:ultraComboEditorColumnFilterOperatorDefaultValue).
		this-object:ultraGroupBoxFilterRowColumnSettings:Controls:Add(this-object:ultraLabel6).
		this-object:ultraGroupBoxFilterRowColumnSettings:Controls:Add(this-object:ultraComboEditorColumnFilterOperatorDropDownItems).
		this-object:ultraGroupBoxFilterRowColumnSettings:Controls:Add(this-object:ultraLabel7).
		this-object:ultraGroupBoxFilterRowColumnSettings:Controls:Add(this-object:ultraComboEditorColumnFilterOperatorLocation).
		this-object:ultraGroupBoxFilterRowColumnSettings:Controls:Add(this-object:ultraLabel8).
		this-object:ultraGroupBoxFilterRowColumnSettings:Controls:Add(this-object:ultraComboEditorColumnFilterOperandStyle).
		this-object:ultraGroupBoxFilterRowColumnSettings:Controls:Add(this-object:ultraComboEditorColumn).
		this-object:ultraGroupBoxFilterRowColumnSettings:Controls:Add(this-object:ultraLabelSelectColumn).
		this-object:ultraGroupBoxFilterRowColumnSettings:Location = new System.Drawing.Point(376, 8).
		this-object:ultraGroupBoxFilterRowColumnSettings:Name = "ultraGroupBoxFilterRowColumnSettings".
		this-object:ultraGroupBoxFilterRowColumnSettings:Size = new System.Drawing.Size(368, 184).
		this-object:ultraGroupBoxFilterRowColumnSettings:TabIndex = 21.
		this-object:ultraGroupBoxFilterRowColumnSettings:Text = "Filter Row Settings - Per Column".
		/*  */
		/* ultraLabel11 */
		/*  */
		this-object:ultraLabel11:Location = new System.Drawing.Point(16, 80).
		this-object:ultraLabel11:Name = "ultraLabel11".
		this-object:ultraLabel11:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabel11:TabIndex = 44.
		this-object:ultraLabel11:Text = "FilterEvaluationTrigger:".
		/*  */
		/* ultraComboEditorColumnFilterEvaluationTrigger */
		/*  */
		this-object:ultraComboEditorColumnFilterEvaluationTrigger:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorColumnFilterEvaluationTrigger:Location = new System.Drawing.Point(192, 80).
		this-object:ultraComboEditorColumnFilterEvaluationTrigger:Name = "ultraComboEditorColumnFilterEvaluationTrigger".
		this-object:ultraComboEditorColumnFilterEvaluationTrigger:Size = new System.Drawing.Size(152, 21).
		this-object:ultraComboEditorColumnFilterEvaluationTrigger:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorColumnFilterEvaluationTrigger:TabIndex = 43.
		this-object:ultraComboEditorColumnFilterEvaluationTrigger:ValueChanged:subscribe(this-object:ultraComboEditorColumnFilterEvaluationTrigger_ValueChanged).
		/*  */
		/* ultraLabel5 */
		/*  */
		this-object:ultraLabel5:Location = new System.Drawing.Point(16, 152).
		this-object:ultraLabel5:Name = "ultraLabel5".
		this-object:ultraLabel5:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabel5:TabIndex = 42.
		this-object:ultraLabel5:Text = "FilterOperatorDefaultValue:".
		/*  */
		/* ultraComboEditorColumnFilterOperatorDefaultValue */
		/*  */
		this-object:ultraComboEditorColumnFilterOperatorDefaultValue:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorColumnFilterOperatorDefaultValue:Location = new System.Drawing.Point(192, 152).
		this-object:ultraComboEditorColumnFilterOperatorDefaultValue:Name = "ultraComboEditorColumnFilterOperatorDefaultValue".
		this-object:ultraComboEditorColumnFilterOperatorDefaultValue:Size = new System.Drawing.Size(152, 21).
		this-object:ultraComboEditorColumnFilterOperatorDefaultValue:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorColumnFilterOperatorDefaultValue:TabIndex = 41.
		this-object:ultraComboEditorColumnFilterOperatorDefaultValue:ValueChanged:subscribe(this-object:ultraComboEditorColumnFilterOperatorDefaultValue_ValueChanged).
		/*  */
		/* ultraLabel6 */
		/*  */
		this-object:ultraLabel6:Location = new System.Drawing.Point(16, 128).
		this-object:ultraLabel6:Name = "ultraLabel6".
		this-object:ultraLabel6:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabel6:TabIndex = 40.
		this-object:ultraLabel6:Text = "FilterOperatorDropDownItems:".
		/*  */
		/* ultraComboEditorColumnFilterOperatorDropDownItems */
		/*  */
		this-object:ultraComboEditorColumnFilterOperatorDropDownItems:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorColumnFilterOperatorDropDownItems:Location = new System.Drawing.Point(192, 128).
		this-object:ultraComboEditorColumnFilterOperatorDropDownItems:Name = "ultraComboEditorColumnFilterOperatorDropDownItems".
		this-object:ultraComboEditorColumnFilterOperatorDropDownItems:Size = new System.Drawing.Size(152, 21).
		this-object:ultraComboEditorColumnFilterOperatorDropDownItems:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorColumnFilterOperatorDropDownItems:TabIndex = 39.
		this-object:ultraComboEditorColumnFilterOperatorDropDownItems:ValueChanged:subscribe(this-object:ultraComboEditorColumnFilterOperatorDropDownItems_ValueChanged).
		/*  */
		/* ultraLabel7 */
		/*  */
		this-object:ultraLabel7:Location = new System.Drawing.Point(16, 104).
		this-object:ultraLabel7:Name = "ultraLabel7".
		this-object:ultraLabel7:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabel7:TabIndex = 38.
		this-object:ultraLabel7:Text = "FilterOperatorLocation:".
		/*  */
		/* ultraComboEditorColumnFilterOperatorLocation */
		/*  */
		this-object:ultraComboEditorColumnFilterOperatorLocation:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorColumnFilterOperatorLocation:Location = new System.Drawing.Point(192, 104).
		this-object:ultraComboEditorColumnFilterOperatorLocation:Name = "ultraComboEditorColumnFilterOperatorLocation".
		this-object:ultraComboEditorColumnFilterOperatorLocation:Size = new System.Drawing.Size(152, 21).
		this-object:ultraComboEditorColumnFilterOperatorLocation:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorColumnFilterOperatorLocation:TabIndex = 37.
		this-object:ultraComboEditorColumnFilterOperatorLocation:ValueChanged:subscribe(this-object:ultraComboEditorColumnFilterOperatorLocation_ValueChanged).
		/*  */
		/* ultraLabel8 */
		/*  */
		this-object:ultraLabel8:Location = new System.Drawing.Point(16, 56).
		this-object:ultraLabel8:Name = "ultraLabel8".
		this-object:ultraLabel8:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabel8:TabIndex = 36.
		this-object:ultraLabel8:Text = "FilterOperandStyle:".
		/*  */
		/* ultraComboEditorColumnFilterOperandStyle */
		/*  */
		this-object:ultraComboEditorColumnFilterOperandStyle:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorColumnFilterOperandStyle:Location = new System.Drawing.Point(192, 56).
		this-object:ultraComboEditorColumnFilterOperandStyle:Name = "ultraComboEditorColumnFilterOperandStyle".
		this-object:ultraComboEditorColumnFilterOperandStyle:Size = new System.Drawing.Size(152, 21).
		this-object:ultraComboEditorColumnFilterOperandStyle:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorColumnFilterOperandStyle:TabIndex = 35.
		this-object:ultraComboEditorColumnFilterOperandStyle:ValueChanged:subscribe(this-object:ultraComboEditorColumnFilterOperandStyle_ValueChanged).
		/*  */
		/* ultraComboEditorColumn */
		/*  */
		this-object:ultraComboEditorColumn:DropDownListAlignment = Infragistics.Win.DropDownListAlignment:Right.
		this-object:ultraComboEditorColumn:DropDownListWidth = -1.
		this-object:ultraComboEditorColumn:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorColumn:Location = new System.Drawing.Point(120, 24).
		this-object:ultraComboEditorColumn:Name = "ultraComboEditorColumn".
		this-object:ultraComboEditorColumn:Size = new System.Drawing.Size(224, 21).
		this-object:ultraComboEditorColumn:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorColumn:TabIndex = 34.
		this-object:ultraComboEditorColumn:ValueChanged:subscribe(this-object:ultraComboEditorColumn_ValueChanged).
		/*  */
		/* ultraLabelSelectColumn */
		/*  */
		appearance1:FontData:BoldAsString = "True".
		this-object:ultraLabelSelectColumn:Appearance = appearance1.
		this-object:ultraLabelSelectColumn:Location = new System.Drawing.Point(16, 24).
		this-object:ultraLabelSelectColumn:Name = "ultraLabelSelectColumn".
		this-object:ultraLabelSelectColumn:Size = new System.Drawing.Size(100, 23).
		this-object:ultraLabelSelectColumn:TabIndex = 22.
		this-object:ultraLabelSelectColumn:Text = "Select Column:".
		/*  */
		/* ultraTabPageControl2 */
		/*  */
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraNumericEditorFilterRowSpacingAfter).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraLabel18).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraNumericEditorFilterRowSpacingBefore).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraLabel17).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraLabel16).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraComboEditorFilterCellBorderStyle).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraLabel15).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraComboEditorFilterOperatorBorderStyle).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraLabel14).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraComboEditorFilterRowBorderStyle).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraButtonFilterCellAppearanceActive).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraButtonFilterRowAppearanceActive).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraButtonFilterRowSelectorAppearance).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraGroupBoxSeparatorGroupBox).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraButtonFilterRowPromptAppearance).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraButtonFilterClearButtonAppearance).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraButtonFilterOperatorAppearance).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraButtonFilterCellAppearance).
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraButtonFilterRowAppearance).
		this-object:ultraTabPageControl2:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPageControl2:Name = "ultraTabPageControl2".
		this-object:ultraTabPageControl2:Size = new System.Drawing.Size(748, 222).
		/*  */
		/* ultraNumericEditorFilterRowSpacingAfter */
		/*  */
		this-object:ultraNumericEditorFilterRowSpacingAfter:Location = new System.Drawing.Point(280, 192).
		this-object:ultraNumericEditorFilterRowSpacingAfter:MaskInput = "~{double:-2.0:c~}".
		this-object:ultraNumericEditorFilterRowSpacingAfter:MaxValue = 500.
		this-object:ultraNumericEditorFilterRowSpacingAfter:MinValue = -1.
		this-object:ultraNumericEditorFilterRowSpacingAfter:Name = "ultraNumericEditorFilterRowSpacingAfter".
		this-object:ultraNumericEditorFilterRowSpacingAfter:PromptChar = ' '.
		this-object:ultraNumericEditorFilterRowSpacingAfter:Size = new System.Drawing.Size(56, 21).
		this-object:ultraNumericEditorFilterRowSpacingAfter:SpinButtonDisplayStyle = Infragistics.Win.ButtonDisplayStyle:Always.
		this-object:ultraNumericEditorFilterRowSpacingAfter:TabIndex = 45.
		this-object:ultraNumericEditorFilterRowSpacingAfter:Value = -1.
		this-object:ultraNumericEditorFilterRowSpacingAfter:ValueChanged:subscribe(this-object:ultraNumericEditorFilterRowSpacingAfter_ValueChanged).
		/*  */
		/* ultraLabel18 */
		/*  */
		this-object:ultraLabel18:Location = new System.Drawing.Point(240, 192).
		this-object:ultraLabel18:Name = "ultraLabel18".
		this-object:ultraLabel18:Size = new System.Drawing.Size(40, 24).
		this-object:ultraLabel18:TabIndex = 44.
		this-object:ultraLabel18:Text = "After:".
		/*  */
		/* ultraNumericEditorFilterRowSpacingBefore */
		/*  */
		this-object:ultraNumericEditorFilterRowSpacingBefore:Location = new System.Drawing.Point(184, 192).
		this-object:ultraNumericEditorFilterRowSpacingBefore:MaskInput = "~{double:-2.0:c~}".
		this-object:ultraNumericEditorFilterRowSpacingBefore:MaxValue = 500.
		this-object:ultraNumericEditorFilterRowSpacingBefore:MinValue = -1.
		this-object:ultraNumericEditorFilterRowSpacingBefore:Name = "ultraNumericEditorFilterRowSpacingBefore".
		this-object:ultraNumericEditorFilterRowSpacingBefore:PromptChar = ' '.
		this-object:ultraNumericEditorFilterRowSpacingBefore:Size = new System.Drawing.Size(56, 21).
		this-object:ultraNumericEditorFilterRowSpacingBefore:SpinButtonDisplayStyle = Infragistics.Win.ButtonDisplayStyle:Always.
		this-object:ultraNumericEditorFilterRowSpacingBefore:TabIndex = 43.
		this-object:ultraNumericEditorFilterRowSpacingBefore:Value = -1.
		this-object:ultraNumericEditorFilterRowSpacingBefore:ValueChanged:subscribe(this-object:ultraNumericEditorFilterRowSpacingBefore_ValueChanged).
		/*  */
		/* ultraLabel17 */
		/*  */
		this-object:ultraLabel17:Location = new System.Drawing.Point(16, 192).
		this-object:ultraLabel17:Name = "ultraLabel17".
		this-object:ultraLabel17:Size = new System.Drawing.Size(168, 24).
		this-object:ultraLabel17:TabIndex = 42.
		this-object:ultraLabel17:Text = "Filter Row Spacing Before:".
		/*  */
		/* ultraLabel16 */
		/*  */
		this-object:ultraLabel16:Location = new System.Drawing.Point(16, 144).
		this-object:ultraLabel16:Name = "ultraLabel16".
		this-object:ultraLabel16:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabel16:TabIndex = 41.
		this-object:ultraLabel16:Text = "Filter Cell Border Style:".
		/*  */
		/* ultraComboEditorFilterCellBorderStyle */
		/*  */
		this-object:ultraComboEditorFilterCellBorderStyle:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorFilterCellBorderStyle:Location = new System.Drawing.Point(184, 144).
		this-object:ultraComboEditorFilterCellBorderStyle:Name = "ultraComboEditorFilterCellBorderStyle".
		this-object:ultraComboEditorFilterCellBorderStyle:Size = new System.Drawing.Size(152, 21).
		this-object:ultraComboEditorFilterCellBorderStyle:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorFilterCellBorderStyle:TabIndex = 40.
		this-object:ultraComboEditorFilterCellBorderStyle:ValueChanged:subscribe(this-object:ultraComboEditorFilterCellBorderStyle_ValueChanged).
		/*  */
		/* ultraLabel15 */
		/*  */
		this-object:ultraLabel15:Location = new System.Drawing.Point(16, 168).
		this-object:ultraLabel15:Name = "ultraLabel15".
		this-object:ultraLabel15:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabel15:TabIndex = 39.
		this-object:ultraLabel15:Text = "Filter Operator Border Style:".
		/*  */
		/* ultraComboEditorFilterOperatorBorderStyle */
		/*  */
		this-object:ultraComboEditorFilterOperatorBorderStyle:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorFilterOperatorBorderStyle:Location = new System.Drawing.Point(184, 168).
		this-object:ultraComboEditorFilterOperatorBorderStyle:Name = "ultraComboEditorFilterOperatorBorderStyle".
		this-object:ultraComboEditorFilterOperatorBorderStyle:Size = new System.Drawing.Size(152, 21).
		this-object:ultraComboEditorFilterOperatorBorderStyle:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorFilterOperatorBorderStyle:TabIndex = 38.
		this-object:ultraComboEditorFilterOperatorBorderStyle:ValueChanged:subscribe(this-object:ultraComboEditorFilterOperatorBorderStyle_ValueChanged).
		/*  */
		/* ultraLabel14 */
		/*  */
		this-object:ultraLabel14:Location = new System.Drawing.Point(16, 120).
		this-object:ultraLabel14:Name = "ultraLabel14".
		this-object:ultraLabel14:Size = new System.Drawing.Size(168, 23).
		this-object:ultraLabel14:TabIndex = 37.
		this-object:ultraLabel14:Text = "Filter Row Border Style:".
		/*  */
		/* ultraComboEditorFilterRowBorderStyle */
		/*  */
		this-object:ultraComboEditorFilterRowBorderStyle:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorFilterRowBorderStyle:Location = new System.Drawing.Point(184, 120).
		this-object:ultraComboEditorFilterRowBorderStyle:Name = "ultraComboEditorFilterRowBorderStyle".
		this-object:ultraComboEditorFilterRowBorderStyle:Size = new System.Drawing.Size(152, 21).
		this-object:ultraComboEditorFilterRowBorderStyle:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorFilterRowBorderStyle:TabIndex = 36.
		this-object:ultraComboEditorFilterRowBorderStyle:ValueChanged:subscribe(this-object:ultraComboEditorFilterRowBorderStyle_ValueChanged).
		/*  */
		/* ultraButtonFilterCellAppearanceActive */
		/*  */
		this-object:ultraButtonFilterCellAppearanceActive:Location = new System.Drawing.Point(200, 40).
		this-object:ultraButtonFilterCellAppearanceActive:Name = "ultraButtonFilterCellAppearanceActive".
		this-object:ultraButtonFilterCellAppearanceActive:Size = new System.Drawing.Size(176, 23).
		this-object:ultraButtonFilterCellAppearanceActive:TabIndex = 35.
		this-object:ultraButtonFilterCellAppearanceActive:Text = "Filter Cell Appearance Active".
		this-object:ultraButtonFilterCellAppearanceActive:Click:subscribe(this-object:ultraButtonFilterCellAppearanceActive_Click).
		/*  */
		/* ultraButtonFilterRowAppearanceActive */
		/*  */
		this-object:ultraButtonFilterRowAppearanceActive:Location = new System.Drawing.Point(200, 16).
		this-object:ultraButtonFilterRowAppearanceActive:Name = "ultraButtonFilterRowAppearanceActive".
		this-object:ultraButtonFilterRowAppearanceActive:Size = new System.Drawing.Size(176, 23).
		this-object:ultraButtonFilterRowAppearanceActive:TabIndex = 34.
		this-object:ultraButtonFilterRowAppearanceActive:Text = "Filter Row Appearance Active".
		this-object:ultraButtonFilterRowAppearanceActive:Click:subscribe(this-object:ultraButtonFilterRowAppearanceActive_Click).
		/*  */
		/* ultraButtonFilterRowSelectorAppearance */
		/*  */
		this-object:ultraButtonFilterRowSelectorAppearance:Location = new System.Drawing.Point(16, 64).
		this-object:ultraButtonFilterRowSelectorAppearance:Name = "ultraButtonFilterRowSelectorAppearance".
		this-object:ultraButtonFilterRowSelectorAppearance:Size = new System.Drawing.Size(176, 23).
		this-object:ultraButtonFilterRowSelectorAppearance:TabIndex = 33.
		this-object:ultraButtonFilterRowSelectorAppearance:Text = "Filter Row Selector Appearance".
		this-object:ultraButtonFilterRowSelectorAppearance:Click:subscribe(this-object:ultraButtonFilterRowSelectorAppearance_Click).
		/*  */
		/* ultraGroupBoxSeparatorGroupBox */
		/*  */
		this-object:ultraGroupBoxSeparatorGroupBox:Controls:Add(this-object:ultraLabel13).
		this-object:ultraGroupBoxSeparatorGroupBox:Controls:Add(this-object:ultraComboEditorSpecialRowSeparatorBorderStyle).
		this-object:ultraGroupBoxSeparatorGroupBox:Controls:Add(this-object:ultraNumericEditorSeparatorHeight).
		this-object:ultraGroupBoxSeparatorGroupBox:Controls:Add(this-object:ultraLabel12).
		this-object:ultraGroupBoxSeparatorGroupBox:Controls:Add(this-object:ultraButtonSeparatorAppearance).
		this-object:ultraGroupBoxSeparatorGroupBox:Controls:Add(this-object:ultraCheckEditorSeparator).
		this-object:ultraGroupBoxSeparatorGroupBox:Location = new System.Drawing.Point(392, 16).
		this-object:ultraGroupBoxSeparatorGroupBox:Name = "ultraGroupBoxSeparatorGroupBox".
		this-object:ultraGroupBoxSeparatorGroupBox:Size = new System.Drawing.Size(312, 136).
		this-object:ultraGroupBoxSeparatorGroupBox:TabIndex = 32.
		this-object:ultraGroupBoxSeparatorGroupBox:Text = "Separator Related".
		/*  */
		/* ultraLabel13 */
		/*  */
		this-object:ultraLabel13:Location = new System.Drawing.Point(8, 104).
		this-object:ultraLabel13:Name = "ultraLabel13".
		this-object:ultraLabel13:Size = new System.Drawing.Size(96, 23).
		this-object:ultraLabel13:TabIndex = 36.
		this-object:ultraLabel13:Text = "Separator Border:".
		/*  */
		/* ultraComboEditorSpecialRowSeparatorBorderStyle */
		/*  */
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle:Location = new System.Drawing.Point(104, 104).
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle:Name = "ultraComboEditorSpecialRowSeparatorBorderStyle".
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle:Size = new System.Drawing.Size(112, 21).
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle:TabIndex = 35.
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle:ValueChanged:subscribe(this-object:ultraComboEditorSpecialRowSeparatorBorderStyle_ValueChanged).
		/*  */
		/* ultraNumericEditorSeparatorHeight */
		/*  */
		this-object:ultraNumericEditorSeparatorHeight:Location = new System.Drawing.Point(104, 80).
		this-object:ultraNumericEditorSeparatorHeight:MaskInput = "~{double:-2.0:c~}".
		this-object:ultraNumericEditorSeparatorHeight:MaxValue = 500.
		this-object:ultraNumericEditorSeparatorHeight:MinValue = -1.
		this-object:ultraNumericEditorSeparatorHeight:Name = "ultraNumericEditorSeparatorHeight".
		this-object:ultraNumericEditorSeparatorHeight:PromptChar = ' '.
		this-object:ultraNumericEditorSeparatorHeight:Size = new System.Drawing.Size(112, 21).
		this-object:ultraNumericEditorSeparatorHeight:SpinButtonDisplayStyle = Infragistics.Win.ButtonDisplayStyle:Always.
		this-object:ultraNumericEditorSeparatorHeight:TabIndex = 31.
		this-object:ultraNumericEditorSeparatorHeight:Value = -1.
		this-object:ultraNumericEditorSeparatorHeight:ValueChanged:subscribe(this-object:ultraNumericEditorSeparatorHeight_ValueChanged).
		/*  */
		/* ultraLabel12 */
		/*  */
		this-object:ultraLabel12:Location = new System.Drawing.Point(8, 80).
		this-object:ultraLabel12:Name = "ultraLabel12".
		this-object:ultraLabel12:Size = new System.Drawing.Size(96, 24).
		this-object:ultraLabel12:TabIndex = 30.
		this-object:ultraLabel12:Text = "Separator Height:".
		/*  */
		/* ultraButtonSeparatorAppearance */
		/*  */
		this-object:ultraButtonSeparatorAppearance:Location = new System.Drawing.Point(8, 48).
		this-object:ultraButtonSeparatorAppearance:Name = "ultraButtonSeparatorAppearance".
		this-object:ultraButtonSeparatorAppearance:Size = new System.Drawing.Size(208, 23).
		this-object:ultraButtonSeparatorAppearance:TabIndex = 28.
		this-object:ultraButtonSeparatorAppearance:Text = "Separator Appearance".
		this-object:ultraButtonSeparatorAppearance:Click:subscribe(this-object:ultraButtonSeparatorAppearance_Click).
		/*  */
		/* ultraCheckEditorSeparator */
		/*  */
		this-object:ultraCheckEditorSeparator:Location = new System.Drawing.Point(8, 24).
		this-object:ultraCheckEditorSeparator:Name = "ultraCheckEditorSeparator".
		this-object:ultraCheckEditorSeparator:Size = new System.Drawing.Size(208, 16).
		this-object:ultraCheckEditorSeparator:TabIndex = 28.
		this-object:ultraCheckEditorSeparator:Text = "Display Filter Row Separator".
		this-object:ultraCheckEditorSeparator:CheckedChanged:subscribe(this-object:ultraCheckEditorSeparator_CheckedChanged).
		/*  */
		/* ultraButtonFilterRowPromptAppearance */
		/*  */
		this-object:ultraButtonFilterRowPromptAppearance:Location = new System.Drawing.Point(200, 88).
		this-object:ultraButtonFilterRowPromptAppearance:Name = "ultraButtonFilterRowPromptAppearance".
		this-object:ultraButtonFilterRowPromptAppearance:Size = new System.Drawing.Size(176, 23).
		this-object:ultraButtonFilterRowPromptAppearance:TabIndex = 30.
		this-object:ultraButtonFilterRowPromptAppearance:Text = "Filter Row Prompt Appearance".
		this-object:ultraButtonFilterRowPromptAppearance:Click:subscribe(this-object:ultraButtonFilterRowPromptAppearance_Click).
		/*  */
		/* ultraButtonFilterClearButtonAppearance */
		/*  */
		this-object:ultraButtonFilterClearButtonAppearance:Location = new System.Drawing.Point(16, 88).
		this-object:ultraButtonFilterClearButtonAppearance:Name = "ultraButtonFilterClearButtonAppearance".
		this-object:ultraButtonFilterClearButtonAppearance:Size = new System.Drawing.Size(176, 23).
		this-object:ultraButtonFilterClearButtonAppearance:TabIndex = 29.
		this-object:ultraButtonFilterClearButtonAppearance:Text = "Filter Clear Button Appearance".
		this-object:ultraButtonFilterClearButtonAppearance:Click:subscribe(this-object:ultraButtonFilterClearButtonAppearance_Click).
		/*  */
		/* ultraButtonFilterOperatorAppearance */
		/*  */
		this-object:ultraButtonFilterOperatorAppearance:Location = new System.Drawing.Point(200, 64).
		this-object:ultraButtonFilterOperatorAppearance:Name = "ultraButtonFilterOperatorAppearance".
		this-object:ultraButtonFilterOperatorAppearance:Size = new System.Drawing.Size(176, 23).
		this-object:ultraButtonFilterOperatorAppearance:TabIndex = 28.
		this-object:ultraButtonFilterOperatorAppearance:Text = "Filter Operator Appearance".
		this-object:ultraButtonFilterOperatorAppearance:Click:subscribe(this-object:ultraButtonFilterOperatorAppearance_Click).
		/*  */
		/* ultraButtonFilterCellAppearance */
		/*  */
		this-object:ultraButtonFilterCellAppearance:Location = new System.Drawing.Point(16, 40).
		this-object:ultraButtonFilterCellAppearance:Name = "ultraButtonFilterCellAppearance".
		this-object:ultraButtonFilterCellAppearance:Size = new System.Drawing.Size(176, 23).
		this-object:ultraButtonFilterCellAppearance:TabIndex = 27.
		this-object:ultraButtonFilterCellAppearance:Text = "Filter Cell Appearance".
		this-object:ultraButtonFilterCellAppearance:Click:subscribe(this-object:ultraButtonFilterCellAppearance_Click).
		/*  */
		/* ultraButtonFilterRowAppearance */
		/*  */
		this-object:ultraButtonFilterRowAppearance:Location = new System.Drawing.Point(16, 16).
		this-object:ultraButtonFilterRowAppearance:Name = "ultraButtonFilterRowAppearance".
		this-object:ultraButtonFilterRowAppearance:Size = new System.Drawing.Size(176, 23).
		this-object:ultraButtonFilterRowAppearance:TabIndex = 26.
		this-object:ultraButtonFilterRowAppearance:Text = "Filter Row Appearance".
		this-object:ultraButtonFilterRowAppearance:Click:subscribe(this-object:ultraButtonFilterRowAppearance_Click).
		/*  */
		/* Panel1 */
		/*  */
		this-object:Panel1:Controls:Add(this-object:ultraTabControl1).
		this-object:Panel1:Controls:Add(this-object:btnTitle).
		this-object:Panel1:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:Panel1:Location = new System.Drawing.Point(0, 0).
		this-object:Panel1:Name = "Panel1".
		this-object:Panel1:Size = new System.Drawing.Size(752, 280).
		this-object:Panel1:TabIndex = 16.
		/*  */
		/* ultraTabControl1 */
		/*  */
		this-object:ultraTabControl1:BackColorInternal = System.Drawing.SystemColors:Control.
		this-object:ultraTabControl1:Controls:Add(this-object:ultraTabSharedControlsPage1).
		this-object:ultraTabControl1:Controls:Add(this-object:ultraTabPageControl1).
		this-object:ultraTabControl1:Controls:Add(this-object:ultraTabPageControl2).
		this-object:ultraTabControl1:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:ultraTabControl1:Location = new System.Drawing.Point(0, 32).
		this-object:ultraTabControl1:Name = "ultraTabControl1".
		this-object:ultraTabControl1:SharedControlsPage = this-object:ultraTabSharedControlsPage1.
		this-object:ultraTabControl1:Size = new System.Drawing.Size(752, 248).
		this-object:ultraTabControl1:TabIndex = 22.
		ultraTab1:TabPage = this-object:ultraTabPageControl1.
		ultraTab1:Text = "Behavior Settings".
		ultraTab2:TabPage = this-object:ultraTabPageControl2.
		ultraTab2:Text = "Appearance Settings".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		define variable arrayvar0 as Infragistics.Win.UltraWinTabControl.UltraTab extent 2 no-undo.
		arrayvar0[1] = ultraTab1.
		arrayvar0[2] = ultraTab2.
		this-object:ultraTabControl1:Tabs:AddRange(arrayvar0).
		this-object:ultraTabControl1:UseOsThemes = Infragistics.Win.DefaultableBoolean:False.
		/*  */
		/* ultraTabSharedControlsPage1 */
		/*  */
		this-object:ultraTabSharedControlsPage1:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabSharedControlsPage1:Name = "ultraTabSharedControlsPage1".
		this-object:ultraTabSharedControlsPage1:Size = new System.Drawing.Size(748, 222).
		/*  */
		/* btnTitle */
		/*  */
		this-object:btnTitle:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:btnTitle:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		this-object:btnTitle:Font = new System.Drawing.Font("Arial", 14.25, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		this-object:btnTitle:Location = new System.Drawing.Point(0, 0).
		this-object:btnTitle:Name = "btnTitle".
		this-object:btnTitle:Size = new System.Drawing.Size(752, 32).
		this-object:btnTitle:TabIndex = 13.
		this-object:btnTitle:Text = "Fixed Filter Row".
		this-object:btnTitle:TextAlign = System.Drawing.ContentAlignment:MiddleLeft.
		this-object:btnTitle:UseCompatibleTextRendering = true.
		this-object:btnTitle:Click:subscribe(this-object:btnTitle_Click).
		this-object:btnTitle:MouseUp:subscribe(this-object:btnTitle_MouseUp).
		/*  */
		/* UltraGrid1 */
		/*  */
		appearance10:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(250)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(245))).
		appearance10:BackGradientAlignment = Infragistics.Win.GradientAlignment:Container.
		this-object:UltraGrid1:DisplayLayout:Appearance = appearance10.
		appearance11:BackColor = System.Drawing.Color:White.
		appearance11:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance11:BackGradientAlignment = Infragistics.Win.GradientAlignment:Container.
		appearance11:BackGradientStyle = Infragistics.Win.GradientStyle:ForwardDiagonal.
		appearance11:BorderColor = System.Drawing.Color:Green.
		this-object:UltraGrid1:DisplayLayout:GroupByBox:Appearance = appearance11.
		this-object:UltraGrid1:DisplayLayout:GroupByBox:BorderStyle = Infragistics.Win.UIElementBorderStyle:Solid.
		appearance12:BackColor = System.Drawing.Color:White.
		this-object:UltraGrid1:DisplayLayout:GroupByBox:PromptAppearance = appearance12.
		this-object:UltraGrid1:DisplayLayout:InterBandSpacing = 10.
		this-object:UltraGrid1:DisplayLayout:MaxColScrollRegions = 1.
		this-object:UltraGrid1:DisplayLayout:MaxRowScrollRegions = 1.
		appearance13:BackColor = System.Drawing.Color:Transparent.
		this-object:UltraGrid1:DisplayLayout:Override:CardAreaAppearance = appearance13.
		this-object:UltraGrid1:DisplayLayout:Override:CellClickAction = Infragistics.Win.UltraWinGrid.CellClickAction:EditAndSelectText.
		appearance14:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance14:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		appearance14:BackGradientAlignment = Infragistics.Win.GradientAlignment:Element.
		appearance14:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance14:ForeColor = System.Drawing.Color:Black.
		appearance14:TextHAlignAsString = "Left".
		appearance14:ThemedElementAlpha = Infragistics.Win.Alpha:Transparent.
		this-object:UltraGrid1:DisplayLayout:Override:HeaderAppearance = appearance14.
		this-object:UltraGrid1:DisplayLayout:Override:HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction:SortMulti.
		appearance15:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		this-object:UltraGrid1:DisplayLayout:Override:RowAppearance = appearance15.
		appearance16:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance16:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		appearance16:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		this-object:UltraGrid1:DisplayLayout:Override:RowSelectorAppearance = appearance16.
		appearance17:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		appearance17:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance17:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance17:ForeColor = System.Drawing.Color:Black.
		this-object:UltraGrid1:DisplayLayout:Override:SelectedRowAppearance = appearance17.
		this-object:UltraGrid1:DisplayLayout:RowConnectorColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		this-object:UltraGrid1:DisplayLayout:RowConnectorStyle = Infragistics.Win.UltraWinGrid.RowConnectorStyle:Solid.
		this-object:UltraGrid1:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
		this-object:UltraGrid1:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:UltraGrid1:DisplayLayout:ViewStyleBand = Infragistics.Win.UltraWinGrid.ViewStyleBand:OutlookGroupBy.
		this-object:UltraGrid1:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:UltraGrid1:Location = new System.Drawing.Point(0, 280).
		this-object:UltraGrid1:Name = "UltraGrid1".
		this-object:UltraGrid1:Size = new System.Drawing.Size(752, 222).
		this-object:UltraGrid1:TabIndex = 16.
		this-object:UltraGrid1:InitializeLayout:subscribe(this-object:UltraGrid1_InitializeLayout).
		/*  */
		/* toolTip1 */
		/*  */
		this-object:toolTip1:AutomaticDelay = 0.
		this-object:toolTip1:AutoPopDelay = 50000.
		this-object:toolTip1:InitialDelay = 500.
		this-object:toolTip1:ReshowDelay = 100.
		/*  */
		/* frmFilterRow */
		/*  */
		this-object:ClientSize = new System.Drawing.Size(752, 502).
		this-object:Controls:Add(this-object:UltraGrid1).
		this-object:Controls:Add(this-object:Panel1).
		this-object:Name = "frmFilterRow".
		this-object:Text = "frmFilterRow".
		this-object:Load:subscribe(this-object:frmFilterRow_Load).
		this-object:FormClosing:subscribe(this-object:frmFilterRow_FormClosing).
		this-object:ultraTabPageControl1:ResumeLayout(false).
		cast(this-object:ultraGroupBoxFilterRowOverrideSettings, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraGroupBoxFilterRowOverrideSettings:ResumeLayout(false).
		this-object:ultraGroupBoxFilterRowOverrideSettings:PerformLayout().
		cast(this-object:ultraTextEditorFilterRowPrompt, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorOverrideFilterEvaluationTrigger, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorOverrideFilterOperatorDefaultValue, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorOverrideFilterOperatorDropDownItems, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorOverrideFilterOperatorLocation, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorOverrideFilterUIType, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorOverrideFilterOperandStyle, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraGroupBoxFilterRowColumnSettings, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraGroupBoxFilterRowColumnSettings:ResumeLayout(false).
		this-object:ultraGroupBoxFilterRowColumnSettings:PerformLayout().
		cast(this-object:ultraComboEditorColumnFilterEvaluationTrigger, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorColumnFilterOperatorDefaultValue, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorColumnFilterOperatorDropDownItems, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorColumnFilterOperatorLocation, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorColumnFilterOperandStyle, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorColumn, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabPageControl2:ResumeLayout(false).
		this-object:ultraTabPageControl2:PerformLayout().
		cast(this-object:ultraNumericEditorFilterRowSpacingAfter, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraNumericEditorFilterRowSpacingBefore, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorFilterCellBorderStyle, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorFilterOperatorBorderStyle, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorFilterRowBorderStyle, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraGroupBoxSeparatorGroupBox, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraGroupBoxSeparatorGroupBox:ResumeLayout(false).
		this-object:ultraGroupBoxSeparatorGroupBox:PerformLayout().
		cast(this-object:ultraComboEditorSpecialRowSeparatorBorderStyle, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraNumericEditorSeparatorHeight, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:Panel1:ResumeLayout(false).
		cast(this-object:ultraTabControl1, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabControl1:ResumeLayout(false).
		cast(this-object:UltraGrid1, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ResumeLayout(false).

	end method.

   	method private void LoadColumnsCombo(ultraCombo as Infragistics.Win.UltraWinEditors.UltraComboEditor , layout as Infragistics.Win.UltraWinGrid.UltraGridLayout  ):
		define variable bands as Infragistics.Win.UltraWinGrid.BandsCollection no-undo.
		define variable bandColumns as Infragistics.Win.UltraWinGrid.ColumnsCollection no-undo.
        define variable oBand as Infragistics.Win.UltraWinGrid.UltraGridBand no-undo.
        define variable oColumn as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
        define variable iBand as integer no-undo.
        define variable iColumn as integer no-undo.
          
		bands = layout:Bands.
		do iBand = 0 to bands:Count - 1:
		    oBand = bands[iBand].
		    bandColumns = oBand:Columns.
		    do iColumn = 0 to bandColumns:Count - 1:
		        oColumn = bandColumns[iColumn].
		        ultraCombo:Items:Add(oColumn,oColumn:Band:Key + " - " + oColumn:Header:Caption).
		    end.
		end. 
		/* select first entry */
		if ultraCombo:Items:Count > 0 then
			ultraCombo:SelectedIndex = 0.
	end method.

    method private void LoadEnumCombo(ultraCombo as Infragistics.Win.UltraWinEditors.UltraComboEditor, enumTypeName as char ):
		define var enumTypes as System.Array no-undo.
		define var type as System.Type no-undo.
		define var i as integer no-undo.
		
		type = Progress.Util.TypeHelper:GetType(enumTypeName).
		 
		enumTypes = System.Enum:GetValues( type ).
 
		ultraCombo:Items:Clear( ).
		do i = 0 to enumTypes:Length - 1:
		    ultraCombo:Items:Add( enumTypes:GetValue(i)).
		end.
	end method.
    
    method private void CreateAppearancePicker():
	    if valid-object(fAppearancePickerForm ) then
		do:
		    fAppearancePickerForm:Close().
			fAppearancePickerForm:Dispose().
		end.
		
		fAppearancePickerForm = new AppearancePicker().
	end method.
    
    method protected Progress.Data.BindingSource GetCustOrderSource():   
        if not valid-object(fCustOrderDataSource) then
        do:
            fCustOrderDataSource = new DataServices.CustOrderService().                  
            fCustOrderDataSource:fetchData().                                                 
        end.
        return new Progress.Data.BindingSource(fCustOrderDataSource:DataSetHandle).
    end method. 
	
    /* implements ISamplesBase interface  */
    method public void ShowMe( owner as System.Windows.Forms.Form  ):
/*		InitializeForm().*/
	    if (owner <> ?) then
			this-object:Owner = owner.
		this-object:Show().
	    this-object:CancelButton = btnTitle.
        this-object:CenterToScreen().
		this-object:MaximizeBox = true.
	end method.	

    /* implements ISamplesBase interface  */
    method public void HideMe( ):
        this-object:Hide().   
    end.
    
   	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID frmFilterRow_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		/* Hide the grid caption by setting the Text to empty string. */
		UltraGrid1:Text = "".
        UltraGrid1:DataSource = GetCustOrderSource().
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID UltraGrid1_InitializeLayout( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.InitializeLayoutEventArgs ):
 
		/* FILTER ROW FUNCTIONALITY RELATED ULTRAGRID SETTINGS */
		/*---------------------------------------------------------------------------------- */
		/* Enable the the filter row user interface by setting the FilterUIType to FilterRow. */
		e:Layout:Override:FilterUIType = Infragistics.Win.UltraWinGrid.FilterUIType:FilterRow.

		/* FilterEvaluationTrigger specifies when UltraGrid applies the filter criteria typed */ 
		/* into a filter row. Default is OnCellValueChange which will cause the UltraGrid to */
		/* re-filter the data as soon as the user modifies the value of a filter cell. */
		e:Layout:Override:FilterEvaluationTrigger = Infragistics.Win.UltraWinGrid.FilterEvaluationTrigger:OnCellValueChange.

		/* By default the UltraGrid selects the type of the filter operand editor based on */
		/* the column's DataType. For DateTime and boolean columns it uses the column's editors. */
		/* For other column types it uses the Combo. You can explicitly specify the operand */
		/* editor style by setting the FilterOperandStyle on the override or the individual */
		/* columns. */
		/*e:Layout:Override:FilterOperandStyle = FilterOperandStyle:Combo. */

		/* By default UltraGrid displays user interface for selecting the filter operator. */ 
		/* You can set the FilterOperatorLocation to hide this user interface. This */
		/* property is available on column as well so it can be controlled on a per column */
		/* basis. Default is WithOperand. This property is exposed off the column as well. */
		e:Layout:Override:FilterOperatorLocation = Infragistics.Win.UltraWinGrid.FilterOperatorLocation:WithOperand.

		/* By default the UltraGrid uses StartsWith as the filter operator. You use */
		/* the FilterOperatorDefaultValue property to specify a different filter operator */
		/* to use. This is the default or the initial filter operator value of the cells */
		/* in filter row. If filter operator user interface is enabled (FilterOperatorLocation */
		/* is not set to None) then that ui will be initialized to the value of this */
		/* property. The user can then change the operator as he/she chooses via the operator */
		/* drop down. */
		e:Layout:Override:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:StartsWith.

		/* FilterOperatorDropDownItems property can be used to control the options provided */
		/* to the user for selecting the filter operator. By default UltraGrid bases  */
		/* what operator options to provide on the column's data type. This property is */
		/* avaibale on the column as well. */
		/*e:Layout:Override:FilterOperatorDropDownItems = Infragistics.Win.UltraWinGrid.FilterOperatorDropDownItems:All. */

		/* By default UltraGrid displays a clear button in each cell of the filter row */
		/* as well as in the row selector of the filter row. When the user clicks this */
		/* button the associated filter criteria is cleared. You can use the */ 
		/* FilterClearButtonLocation property to control if and where the filter clear */
		/* buttons are displayed. */
		e:Layout:Override:FilterClearButtonLocation = Infragistics.Win.UltraWinGrid.FilterClearButtonLocation:RowAndCell.

		/* Appearance of the filter row can be controlled using the FilterRowAppearance proeprty. */
		e:Layout:Override:FilterRowAppearance:BackColor = System.Drawing.Color:LightYellow.

		/* You can use the FilterRowPrompt to display a prompt in the filter row. By default */
		/* UltraGrid does not display any prompt in the filter row. */
		e:Layout:Override:FilterRowPrompt = "Click here to filter data...".

		/* You can use the FilterRowPromptAppearance to change the appearance of the prompt. */
		/* By default the prompt is transparent and uses the same fore color as the filter row. */
		/* You can make it non-transparent by setting the appearance' BackColorAlpha property */ 
		/* or by setting the BackColor to a desired value. */
		e:Layout:Override:FilterRowPromptAppearance:BackColorAlpha = Infragistics.Win.Alpha:Opaque.

		/* By default the prompt is spread across multiple cells if it's bigger than the */
		/* first cell. You can confine the prompt to a particular cell by setting the */
		/* SpecialRowPromptField property off the band to the key of a column. */
		/*e:Layout:Bands[0]:SpecialRowPromptField = e:Layout:Bands[0]:Columns[0]:Key. */

		/* Display a separator between the filter row other rows. SpecialRowSeparator property */ 
		/* can be used to display separators between various 'special' rows, including for the */
		/* filter row. This property is a flagged enum property so it can take multiple values. */
		e:Layout:Override:SpecialRowSeparator = Infragistics.Win.UltraWinGrid.SpecialRowSeparator:FilterRow.
        
		/* You can control the appearance of the separator using the SpecialRowSeparatorAppearance */
		/* property. */
		e:Layout:Override:SpecialRowSeparatorAppearance:BackColor = System.Drawing.Color:FromArgb( 233, 242, 199 ).
		/* ---------------------------------------------------------------------------------- */
	
		/* INITIALIZE CONTROLS ON THE FORM. */
		/* ---------------------------------------------------------------------------------- */
		LoadEnumCombo( ultraComboEditorOverrideFilterUIType, "Infragistics.Win.UltraWinGrid.FilterUIType" ).
		LoadEnumCombo( ultraComboEditorOverrideFilterOperandStyle, "Infragistics.Win.UltraWinGrid.FilterOperandStyle").
		LoadEnumCombo( ultraComboEditorOverrideFilterEvaluationTrigger, "Infragistics.Win.UltraWinGrid.FilterEvaluationTrigger").
		LoadEnumCombo( ultraComboEditorOverrideFilterOperatorLocation, "Infragistics.Win.UltraWinGrid.FilterOperatorLocation").
		LoadEnumCombo( ultraComboEditorOverrideFilterOperatorDropDownItems, "Infragistics.Win.UltraWinGrid.FilterOperatorDropDownItems").
		LoadEnumCombo( ultraComboEditorOverrideFilterOperatorDefaultValue, "Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue").

		LoadEnumCombo( ultraComboEditorFilterRowBorderStyle, "Infragistics.Win.UIElementBorderStyle").
		LoadEnumCombo( ultraComboEditorFilterCellBorderStyle, "Infragistics.Win.UIElementBorderStyle").
		LoadEnumCombo( ultraComboEditorFilterOperatorBorderStyle, "Infragistics.Win.UIElementBorderStyle").
		LoadEnumCombo( ultraComboEditorSpecialRowSeparatorBorderStyle, "Infragistics.Win.UIElementBorderStyle").

		LoadEnumCombo( ultraComboEditorColumnFilterOperandStyle, "Infragistics.Win.UltraWinGrid.FilterOperandStyle").
		LoadEnumCombo( ultraComboEditorColumnFilterEvaluationTrigger, "Infragistics.Win.UltraWinGrid.FilterEvaluationTrigger").
		LoadEnumCombo( ultraComboEditorColumnFilterOperatorLocation, "Infragistics.Win.UltraWinGrid.FilterOperatorLocation").
		LoadEnumCombo( ultraComboEditorColumnFilterOperatorDropDownItems, "Infragistics.Win.UltraWinGrid.FilterOperatorDropDownItems").
		LoadEnumCombo( ultraComboEditorColumnFilterOperatorDefaultValue, "Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue").
    
		/* Initialize the combos to their initial values. */
		ultraComboEditorOverrideFilterUIType:Value = e:Layout:Override:FilterUIType.
		ultraComboEditorOverrideFilterOperandStyle:Value = e:Layout:Override:FilterOperandStyle.
		ultraComboEditorOverrideFilterEvaluationTrigger:Value = e:Layout:Override:FilterEvaluationTrigger.
		ultraComboEditorOverrideFilterOperatorLocation:Value = e:Layout:Override:FilterOperatorLocation.
		ultraComboEditorOverrideFilterOperatorDropDownItems:Value = e:Layout:Override:FilterOperatorDropDownItems.
		ultraComboEditorOverrideFilterOperatorDefaultValue:Value = e:Layout:Override:FilterOperatorDefaultValue.
		ultraComboEditorFilterRowBorderStyle:Value = e:Layout:Override:BorderStyleFilterRow.
		ultraComboEditorFilterCellBorderStyle:Value = e:Layout:Override:BorderStyleFilterCell.
		ultraComboEditorFilterOperatorBorderStyle:Value = e:Layout:Override:BorderStyleFilterOperator.
		ultraComboEditorSpecialRowSeparatorBorderStyle:Value = e:Layout:Override:BorderStyleSpecialRowSeparator.
		ultraNumericEditorFilterRowSpacingAfter:Value = e:Layout:Override:FilterRowSpacingAfter.
		ultraNumericEditorFilterRowSpacingBefore:Value = e:Layout:Override:FilterRowSpacingBefore.
		ultraNumericEditorSeparatorHeight:Value = e:Layout:Override:SpecialRowSeparatorHeight.
 		ultraCheckEditorSingleBand:CheckedValue = Progress.Util.EnumHelper:AreEqual(Infragistics.Win.UltraWinGrid.ViewStyle:SingleBand,e:Layout:ViewStyle).
  		ultraCheckEditorSeparator:CheckedValue = Progress.Util.EnumHelper:AreNotEqual(Infragistics.Win.UltraWinGrid.SpecialRowSeparator:None,Progress.Util.EnumHelper:And(Infragistics.Win.UltraWinGrid.SpecialRowSeparator:FilterRow,e:Layout:Override:SpecialRowSeparator)).
		ultraTextEditorFilterRowPrompt:Text = e:Layout:Override:FilterRowPrompt.
  
		/* Initialize the columns combo. */
		LoadColumnsCombo( ultraComboEditorColumn, UltraGrid1:DisplayLayout).
  
	
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorColumn_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable validColumn as logical no-undo. 
		
		validColumn = valid-object(SelectedColumn).
        
        assign
		    ultraComboEditorColumnFilterEvaluationTrigger:Enabled = validColumn
		    ultraComboEditorColumnFilterOperandStyle:Enabled = validColumn
		    ultraComboEditorColumnFilterOperatorDefaultValue:Enabled = validColumn
		    ultraComboEditorColumnFilterOperatorDropDownItems:Enabled = validColumn
		    ultraComboEditorColumnFilterOperatorLocation:Enabled = validColumn.
		
		if validColumn then
            assign
            	ultraComboEditorColumnFilterEvaluationTrigger:Value = SelectedColumn:FilterEvaluationTrigger
            	ultraComboEditorColumnFilterOperandStyle:Value = SelectedColumn:FilterOperandStyle
			    ultraComboEditorColumnFilterOperatorDefaultValue:Value = SelectedColumn:FilterOperatorDefaultValue
			    ultraComboEditorColumnFilterOperatorDropDownItems:Value = SelectedColumn:FilterOperatorDropDownItems
			    ultraComboEditorColumnFilterOperatorLocation:Value = SelectedColumn:FilterOperatorLocation.
		else
            assign
			    ultraComboEditorColumnFilterEvaluationTrigger:Value = Infragistics.Win.UltraWinGrid.FilterEvaluationTrigger:Default
			    ultraComboEditorColumnFilterOperandStyle:Value = Infragistics.Win.UltraWinGrid.FilterOperandStyle:Default
			    ultraComboEditorColumnFilterOperatorDefaultValue:Value = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:Default
			    ultraComboEditorColumnFilterOperatorDropDownItems:Value = Infragistics.Win.UltraWinGrid.FilterOperatorDropDownItems:Default
			    ultraComboEditorColumnFilterOperatorLocation:Value = Infragistics.Win.UltraWinGrid.FilterOperatorLocation:Default.
	 
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonFilterRowAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		CreateAppearancePicker( ).
		fAppearancePickerForm:ShowMe(UltraGrid1:DisplayLayout:Override:FilterRowAppearance,
				            "Filter Row Appearance" ).
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonFilterRowAppearanceActive_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        CreateAppearancePicker( ).
        fAppearancePickerForm:ShowMe(UltraGrid1:DisplayLayout:Override:FilterRowAppearanceActive,
				            "Filter Row Appearance Active" ).		
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonFilterCellAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		CreateAppearancePicker( ).
        fAppearancePickerForm:ShowMe(UltraGrid1:DisplayLayout:Override:FilterCellAppearance,
				                "Filter Cell Appearance" ).
		RETURN.
	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonFilterCellAppearanceActive_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		CreateAppearancePicker( ).
        fAppearancePickerForm:ShowMe(UltraGrid1:DisplayLayout:Override:FilterCellAppearanceActive,
				                "Filter Cell Appearance  Active" ).
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonFilterRowSelectorAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		CreateAppearancePicker( ).
        fAppearancePickerForm:ShowMe(UltraGrid1:DisplayLayout:Override:FilterRowSelectorAppearance,
				                "Filter Row Selector Appearance").
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonFilterClearButtonAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		CreateAppearancePicker( ).
        fAppearancePickerForm:ShowMe(UltraGrid1:DisplayLayout:Override:FilterClearButtonAppearance,
				"Filter Clear Button Appearance" ).
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonFilterRowPromptAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		CreateAppearancePicker( ).
        fAppearancePickerForm:ShowMe(UltraGrid1:DisplayLayout:Override:FilterRowPromptAppearance,
				"Filter Row Pormpt Appearance" ).
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonSeparatorAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		CreateAppearancePicker( ).
        fAppearancePickerForm:ShowMe(UltraGrid1:DisplayLayout:Override:SpecialRowSeparatorAppearance,
				"Special Row Separator Appearance" ).
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonFilterOperatorAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		CreateAppearancePicker( ).
        fAppearancePickerForm:ShowMe(UltraGrid1:DisplayLayout:Override:FilterOperatorAppearance,
				"Filter Operator Appearance" ). 
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorOverrideFilterUIType_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable val as Infragistics.Win.UltraWinGrid.FilterUIType no-undo.
		val = cast(ultraComboEditorOverrideFilterUIType:Value,Infragistics.Win.UltraWinGrid.FilterUIType).
        UltraGrid1:DisplayLayout:Override:FilterUIType = val.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorOverrideFilterOperandStyle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        define variable val as Infragistics.Win.UltraWinGrid.FilterOperandStyle no-undo.
		val = cast(ultraComboEditorOverrideFilterOperandStyle:Value,Infragistics.Win.UltraWinGrid.FilterOperandStyle).
        UltraGrid1:DisplayLayout:Override:FilterOperandStyle = val.
        RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorOverrideFilterEvaluationTrigger_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable val as Infragistics.Win.UltraWinGrid.FilterEvaluationTrigger no-undo.
		val = cast(ultraComboEditorOverrideFilterEvaluationTrigger:Value,Infragistics.Win.UltraWinGrid.FilterEvaluationTrigger).
        UltraGrid1:DisplayLayout:Override:FilterEvaluationTrigger = val.
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorOverrideFilterOperatorLocation_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable val as Infragistics.Win.UltraWinGrid.FilterOperatorLocation no-undo.
		val = cast(ultraComboEditorOverrideFilterOperatorLocation:Value,Infragistics.Win.UltraWinGrid.FilterOperatorLocation).
        UltraGrid1:DisplayLayout:Override:FilterOperatorLocation = val.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorOverrideFilterOperatorDropDownItems_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        define variable val as Infragistics.Win.UltraWinGrid.FilterOperatorDropDownItems no-undo.
		val = cast(ultraComboEditorOverrideFilterOperatorDropDownItems:Value,Infragistics.Win.UltraWinGrid.FilterOperatorDropDownItems).
        UltraGrid1:DisplayLayout:Override:FilterOperatorDropDownItems = val.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorOverrideFilterOperatorDefaultValue_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable val as Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue no-undo.
		val = cast(ultraComboEditorOverrideFilterOperatorDefaultValue:Value,Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue).
        UltraGrid1:DisplayLayout:Override:FilterOperatorDefaultValue = val.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraTextEditorFilterRowPrompt_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable val as character no-undo.
		val = ultraTextEditorFilterRowPrompt:Text.
        UltraGrid1:DisplayLayout:Override:FilterRowPrompt = val.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorColumnFilterOperandStyle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable val as Infragistics.Win.UltraWinGrid.FilterOperandStyle no-undo.
		val = cast(ultraComboEditorColumnFilterOperandStyle:Value,Infragistics.Win.UltraWinGrid.FilterOperandStyle).
        SelectedColumn:FilterOperandStyle = val.
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorColumnFilterEvaluationTrigger_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable val as Infragistics.Win.UltraWinGrid.FilterEvaluationTrigger no-undo.
		val = cast(ultraComboEditorColumnFilterEvaluationTrigger:Value,Infragistics.Win.UltraWinGrid.FilterEvaluationTrigger).
        SelectedColumn:FilterEvaluationTrigger = val.
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorColumnFilterOperatorLocation_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable val as Infragistics.Win.UltraWinGrid.FilterOperatorLocation no-undo.
		val = cast(ultraComboEditorColumnFilterOperatorLocation:Value,Infragistics.Win.UltraWinGrid.FilterOperatorLocation).
        SelectedColumn:FilterOperatorLocation = val.
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorColumnFilterOperatorDropDownItems_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable val as Infragistics.Win.UltraWinGrid.FilterOperatorDropDownItems no-undo.
		val = cast(ultraComboEditorColumnFilterOperatorDropDownItems:Value,Infragistics.Win.UltraWinGrid.FilterOperatorDropDownItems).
        SelectedColumn:FilterOperatorDropDownItems = val.
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorColumnFilterOperatorDefaultValue_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable val as Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue no-undo.
		val = cast(ultraComboEditorColumnFilterOperatorDefaultValue:Value,Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue).
        SelectedColumn:FilterOperatorDefaultValue = val.
		
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraCheckEditorSingleBand_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        if ultraCheckEditorSingleBand:Checked then
        	UltraGrid1:DisplayLayout:ViewStyle = Infragistics.Win.UltraWinGrid.ViewStyle:SingleBand.
		else
			UltraGrid1:DisplayLayout:ViewStyle = Infragistics.Win.UltraWinGrid.ViewStyle:MultiBand.
	
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorFilterRowBorderStyle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable borderStyle as Infragistics.Win.UIElementBorderStyle no-undo.
		borderStyle = cast(ultraComboEditorFilterRowBorderStyle:Value,Infragistics.Win.UIElementBorderStyle).
        UltraGrid1:DisplayLayout:Override:BorderStyleFilterRow = borderStyle.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorFilterCellBorderStyle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable borderStyle as Infragistics.Win.UIElementBorderStyle no-undo.
		borderStyle = cast(ultraComboEditorFilterCellBorderStyle:Value,Infragistics.Win.UIElementBorderStyle).
        UltraGrid1:DisplayLayout:Override:BorderStyleFilterCell = borderStyle.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorFilterOperatorBorderStyle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable borderStyle as Infragistics.Win.UIElementBorderStyle no-undo.
		borderStyle = cast(ultraComboEditorFilterOperatorBorderStyle:Value,Infragistics.Win.UIElementBorderStyle).
        UltraGrid1:DisplayLayout:Override:BorderStyleFilterOperator = borderStyle.
		
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraNumericEditorFilterRowSpacingBefore_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    define variable val as System.Object no-undo.
	    define variable spacingBefore as integer no-undo. 
	     	
		val = ultraNumericEditorFilterRowSpacingBefore:Value.
		
		do on error undo, leave:
			spacingBefore = int(val) no-error.
            catch err as Progress.Lang.Error :
                undo, throw err.     	 	
            end catch.
		end.
        
		UltraGrid1:DisplayLayout:Override:FilterRowSpacingBefore = spacingBefore.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraNumericEditorFilterRowSpacingAfter_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    define variable val as System.Object no-undo.
	    define variable spacingAfter as integer no-undo. 
	     	
		val = ultraNumericEditorFilterRowSpacingAfter:Value.
		
		do on error undo, leave:
			spacingAfter = int(val) no-error.
            catch err as Progress.Lang.Error :
                undo, throw err.     	 	
            end catch.
		end.
        
		UltraGrid1:DisplayLayout:Override:FilterRowSpacingAfter = spacingAfter.
		
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraCheckEditorSeparator_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		/* SpecialRowSeparator property can be used to display separators 
		   between various 'special' rows. 
		   This property is a flagged enum property so it can take multiple  
		   values. */
		
		if ultraCheckEditorSeparator:Checked then
		    UltraGrid1:DisplayLayout:Override:SpecialRowSeparator = Infragistics.Win.UltraWinGrid.SpecialRowSeparator:FilterRow.
		else
		    UltraGrid1:DisplayLayout:Override:SpecialRowSeparator = Infragistics.Win.UltraWinGrid.SpecialRowSeparator:None.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraNumericEditorSeparatorHeight_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable val as System.Object no-undo.
	    define variable separatorHeight as integer no-undo. 
	     	
		val = ultraNumericEditorSeparatorHeight:Value.
		
		do on error undo, leave:
			separatorHeight = int(val) no-error.
            catch err as Progress.Lang.Error :
                undo, throw err.     	 	
            end catch.
		end.
        
		UltraGrid1:DisplayLayout:Override:SpecialRowSeparatorHeight = separatorHeight.
		
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorSpecialRowSeparatorBorderStyle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable borderStyle as Infragistics.Win.UIElementBorderStyle no-undo.
		borderStyle = cast(ultraComboEditorFilterOperatorBorderStyle:Value,Infragistics.Win.UIElementBorderStyle).
        UltraGrid1:DisplayLayout:Override:BorderStyleSpecialRowSeparator = borderStyle.
	
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID frmFilterRow_FormClosing( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.FormClosingEventArgs ):
		if valid-object(this-object:Owner) then 
	    do:
	        e:Cancel = true.
		    this-object:Visible = false.
		end.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID btnTitle_MouseUp( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.MouseEventArgs ):
	    if valid-object(this-object:Owner) then
		    (cast (this-object:Owner,frmMain)):Navigation(e:Button).	
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID btnTitle_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        if valid-object(this-object:Owner) then
            HideMe().
		RETURN.

	END METHOD.

	DESTRUCTOR PUBLIC frmFilterRow ( ):

		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.

	END DESTRUCTOR.

END CLASS.