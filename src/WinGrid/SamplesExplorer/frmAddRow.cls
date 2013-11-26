 
 /*------------------------------------------------------------------------
    File        : frmAddRow
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Mon Jul 21 19:35:25 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.
using Infragistics.Win.UltraWinGrid.*.
using System.Drawing.Color.
using System.Drawing.SystemColors.
using Infragistics.Win.DefaultableBoolean.
using Infragistics.Win.UIElementBorderStyle.
using Infragistics.Win.UltraWinEditors.UltraComboEditor.

using WinGrid.SamplesExplorer.*.

CLASS WinGrid.SamplesExplorer.frmAddRow INHERITS Form IMPLEMENTS ISamplesBase  : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.
	

	define public variable Panel1 as System.Windows.Forms.Panel no-undo.
	define private variable ultraGroupBoxOtherSettings as Infragistics.Win.Misc.UltraGroupBox no-undo.
	define private variable ultraCheckEditorSingleBand as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraButtonCollapseAll as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraButtonExpandAll as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraCheckEditorCardView as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraCheckEditorAddNewBox as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraGroupBoxAddRowSettings as Infragistics.Win.Misc.UltraGroupBox no-undo.
	define private variable ultraGroupBoxAddRowPrompt as Infragistics.Win.Misc.UltraGroupBox no-undo.
	define private variable ultraLabel4 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorSpecialRowPromptField as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraButtonAddRowPromptAppearance as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraLabel1 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraTextEditorAddRowPrompt as Infragistics.Win.UltraWinEditors.UltraTextEditor no-undo.
	define private variable ultraNumericEditorAddRowSpacingAfter as Infragistics.Win.UltraWinEditors.UltraNumericEditor no-undo.
	define private variable ultraNumericEditorAddRowSpacingBefore as Infragistics.Win.UltraWinEditors.UltraNumericEditor no-undo.
	define private variable ultraLabel3 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraLabel2 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraButtonTemplateAddRowAppearance as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraButtonAddRowAppearance as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraGroupBoxAllowAddNew as Infragistics.Win.Misc.UltraGroupBox no-undo.
	define private variable ultraComboEditorAllowAddNew as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabelDescription as Infragistics.Win.Misc.UltraLabel no-undo.
	define public variable btnTitle as System.Windows.Forms.Button no-undo.
	define private variable ultraGroupBoxSeparatorGroupBox as Infragistics.Win.Misc.UltraGroupBox no-undo.
	define private variable ultraLabel13 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboEditorSpecialRowSeparatorBorderStyle as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraNumericEditorSeparatorHeight as Infragistics.Win.UltraWinEditors.UltraNumericEditor no-undo.
	define private variable ultraCheckEditorSeparator as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraLabel12 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraButtonSeparatorAppearance as Infragistics.Win.Misc.UltraButton no-undo.

	define private variable UltraGrid1 as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.

	define private variable toolTip1 as System.Windows.Forms.ToolTip no-undo.
	
	/* manual defs */
	define private variable fCustOrderDataSource as DataServices.IDataService no-undo.
    define private variable fAppearancePickerForm as AppearancePicker no-undo.
	
	/** ISamplesBase properties */
	
	/* Provides a description for the sample. */
	define public property Description as character no-undo 
	get:
	    return ultraLabelDescription:Text.
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
        return System.Drawing.Image:FromFile(SamplesPath:GraphicsPath + "/Previews/FixedAddRow.png").
    end.  
 	
	CONSTRUCTOR PUBLIC frmAddRow ( ):
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
		define variable resources as System.Resources.ResXResourceSet no-undo.
		resources = Progress.Util.ResourceHelper:Load("WinGrid/SamplesExplorer/frmAddRow.resx", PROPATH).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance1 as Infragistics.Win.Appearance no-undo.
		appearance1 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance2 as Infragistics.Win.Appearance no-undo.
		appearance2 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance3 as Infragistics.Win.Appearance no-undo.
		appearance3 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance4 as Infragistics.Win.Appearance no-undo.
		appearance4 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance5 as Infragistics.Win.Appearance no-undo.
		appearance5 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance6 as Infragistics.Win.Appearance no-undo.
		appearance6 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance7 as Infragistics.Win.Appearance no-undo.
		appearance7 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance8 as Infragistics.Win.Appearance no-undo.
		appearance8 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance9 as Infragistics.Win.Appearance no-undo.
		appearance9 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance10 as Infragistics.Win.Appearance no-undo.
		appearance10 = new Infragistics.Win.Appearance().
		this-object:Panel1 = new System.Windows.Forms.Panel().
		this-object:ultraGroupBoxOtherSettings = new Infragistics.Win.Misc.UltraGroupBox().
		this-object:ultraCheckEditorSingleBand = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraButtonCollapseAll = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraButtonExpandAll = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraCheckEditorCardView = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraCheckEditorAddNewBox = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraGroupBoxAddRowSettings = new Infragistics.Win.Misc.UltraGroupBox().
		this-object:ultraGroupBoxAddRowPrompt = new Infragistics.Win.Misc.UltraGroupBox().
		this-object:ultraLabel4 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorSpecialRowPromptField = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraButtonAddRowPromptAppearance = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraLabel1 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraTextEditorAddRowPrompt = new Infragistics.Win.UltraWinEditors.UltraTextEditor().
		this-object:ultraNumericEditorAddRowSpacingAfter = new Infragistics.Win.UltraWinEditors.UltraNumericEditor().
		this-object:ultraNumericEditorAddRowSpacingBefore = new Infragistics.Win.UltraWinEditors.UltraNumericEditor().
		this-object:ultraLabel3 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraLabel2 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraButtonTemplateAddRowAppearance = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraButtonAddRowAppearance = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraGroupBoxAllowAddNew = new Infragistics.Win.Misc.UltraGroupBox().
		this-object:ultraComboEditorAllowAddNew = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraLabelDescription = new Infragistics.Win.Misc.UltraLabel().
		this-object:btnTitle = new System.Windows.Forms.Button().
		this-object:ultraGroupBoxSeparatorGroupBox = new Infragistics.Win.Misc.UltraGroupBox().
		this-object:ultraLabel13 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraNumericEditorSeparatorHeight = new Infragistics.Win.UltraWinEditors.UltraNumericEditor().
		this-object:ultraCheckEditorSeparator = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraLabel12 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraButtonSeparatorAppearance = new Infragistics.Win.Misc.UltraButton().
		this-object:UltraGrid1 = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:toolTip1 = new System.Windows.Forms.ToolTip(this-object:components).
		this-object:Panel1:SuspendLayout().
		cast(this-object:ultraGroupBoxOtherSettings, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraGroupBoxOtherSettings:SuspendLayout().
		cast(this-object:ultraGroupBoxAddRowSettings, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraGroupBoxAddRowSettings:SuspendLayout().
		cast(this-object:ultraGroupBoxAddRowPrompt, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraGroupBoxAddRowPrompt:SuspendLayout().
		cast(this-object:ultraComboEditorSpecialRowPromptField, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraTextEditorAddRowPrompt, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraNumericEditorAddRowSpacingAfter, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraNumericEditorAddRowSpacingBefore, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraGroupBoxAllowAddNew, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraGroupBoxAllowAddNew:SuspendLayout().
		cast(this-object:ultraComboEditorAllowAddNew, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraGroupBoxSeparatorGroupBox, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraGroupBoxSeparatorGroupBox:SuspendLayout().
		cast(this-object:ultraComboEditorSpecialRowSeparatorBorderStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraNumericEditorSeparatorHeight, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:UltraGrid1, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:SuspendLayout().
		/*  */
		/* Panel1 */
		/*  */
		this-object:Panel1:Controls:Add(this-object:ultraGroupBoxOtherSettings).
		this-object:Panel1:Controls:Add(this-object:ultraGroupBoxAddRowSettings).
		this-object:Panel1:Controls:Add(this-object:ultraLabelDescription).
		this-object:Panel1:Controls:Add(this-object:btnTitle).
		this-object:Panel1:Controls:Add(this-object:ultraGroupBoxSeparatorGroupBox).
		this-object:Panel1:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:Panel1:Location = new System.Drawing.Point(0, 0).
		this-object:Panel1:Name = "Panel1".
		this-object:Panel1:Size = new System.Drawing.Size(704, 312).
		this-object:Panel1:TabIndex = 16.
		/*  */
		/* ultraGroupBoxOtherSettings */
		/*  */
		this-object:ultraGroupBoxOtherSettings:Controls:Add(this-object:ultraCheckEditorSingleBand).
		this-object:ultraGroupBoxOtherSettings:Controls:Add(this-object:ultraButtonCollapseAll).
		this-object:ultraGroupBoxOtherSettings:Controls:Add(this-object:ultraButtonExpandAll).
		this-object:ultraGroupBoxOtherSettings:Controls:Add(this-object:ultraCheckEditorCardView).
		this-object:ultraGroupBoxOtherSettings:Controls:Add(this-object:ultraCheckEditorAddNewBox).
		this-object:ultraGroupBoxOtherSettings:Location = new System.Drawing.Point(400, 200).
		this-object:ultraGroupBoxOtherSettings:Name = "ultraGroupBoxOtherSettings".
		this-object:ultraGroupBoxOtherSettings:Size = new System.Drawing.Size(280, 104).
		this-object:ultraGroupBoxOtherSettings:TabIndex = 22.
		this-object:ultraGroupBoxOtherSettings:Text = "Other Settings".
		/*  */
		/* ultraCheckEditorSingleBand */
		/*  */
		this-object:ultraCheckEditorSingleBand:Location = new System.Drawing.Point(16, 72).
		this-object:ultraCheckEditorSingleBand:Name = "ultraCheckEditorSingleBand".
		this-object:ultraCheckEditorSingleBand:Size = new System.Drawing.Size(120, 16).
		this-object:ultraCheckEditorSingleBand:TabIndex = 4.
		this-object:ultraCheckEditorSingleBand:Text = "Single Band".
		this-object:ultraCheckEditorSingleBand:CheckedChanged:subscribe(this-object:ultraCheckEditorSingleBand_CheckedChanged).
		/*  */
		/* ultraButtonCollapseAll */
		/*  */
		this-object:ultraButtonCollapseAll:Location = new System.Drawing.Point(160, 40).
		this-object:ultraButtonCollapseAll:Name = "ultraButtonCollapseAll".
		this-object:ultraButtonCollapseAll:Size = new System.Drawing.Size(88, 23).
		this-object:ultraButtonCollapseAll:TabIndex = 3.
		this-object:ultraButtonCollapseAll:Text = "Collapse All".
		this-object:ultraButtonCollapseAll:Click:subscribe(this-object:ultraButtonCollapseAll_Click).
		/*  */
		/* ultraButtonExpandAll */
		/*  */
		this-object:ultraButtonExpandAll:Location = new System.Drawing.Point(160, 16).
		this-object:ultraButtonExpandAll:Name = "ultraButtonExpandAll".
		this-object:ultraButtonExpandAll:Size = new System.Drawing.Size(88, 23).
		this-object:ultraButtonExpandAll:TabIndex = 2.
		this-object:ultraButtonExpandAll:Text = "Expand All".
		this-object:ultraButtonExpandAll:Click:subscribe(this-object:ultraButtonExpandAll_Click).
		/*  */
		/* ultraCheckEditorCardView */
		/*  */
		this-object:ultraCheckEditorCardView:Location = new System.Drawing.Point(16, 48).
		this-object:ultraCheckEditorCardView:Name = "ultraCheckEditorCardView".
		this-object:ultraCheckEditorCardView:Size = new System.Drawing.Size(120, 20).
		this-object:ultraCheckEditorCardView:TabIndex = 1.
		this-object:ultraCheckEditorCardView:Text = "Card View".
		this-object:ultraCheckEditorCardView:CheckedChanged:subscribe(this-object:ultraCheckEditorCardView_CheckedChanged).
		/*  */
		/* ultraCheckEditorAddNewBox */
		/*  */
		this-object:ultraCheckEditorAddNewBox:Location = new System.Drawing.Point(16, 24).
		this-object:ultraCheckEditorAddNewBox:Name = "ultraCheckEditorAddNewBox".
		this-object:ultraCheckEditorAddNewBox:Size = new System.Drawing.Size(120, 20).
		this-object:ultraCheckEditorAddNewBox:TabIndex = 0.
		this-object:ultraCheckEditorAddNewBox:Text = "Add New Box".
		this-object:ultraCheckEditorAddNewBox:CheckedChanged:subscribe(this-object:ultraCheckEditorAddNewBox_CheckedChanged).
		/*  */
		/* ultraGroupBoxAddRowSettings */
		/*  */
		this-object:ultraGroupBoxAddRowSettings:Controls:Add(this-object:ultraGroupBoxAddRowPrompt).
		this-object:ultraGroupBoxAddRowSettings:Controls:Add(this-object:ultraNumericEditorAddRowSpacingAfter).
		this-object:ultraGroupBoxAddRowSettings:Controls:Add(this-object:ultraNumericEditorAddRowSpacingBefore).
		this-object:ultraGroupBoxAddRowSettings:Controls:Add(this-object:ultraLabel3).
		this-object:ultraGroupBoxAddRowSettings:Controls:Add(this-object:ultraLabel2).
		this-object:ultraGroupBoxAddRowSettings:Controls:Add(this-object:ultraButtonTemplateAddRowAppearance).
		this-object:ultraGroupBoxAddRowSettings:Controls:Add(this-object:ultraButtonAddRowAppearance).
		this-object:ultraGroupBoxAddRowSettings:Controls:Add(this-object:ultraGroupBoxAllowAddNew).
		this-object:ultraGroupBoxAddRowSettings:Location = new System.Drawing.Point(0, 80).
		this-object:ultraGroupBoxAddRowSettings:Name = "ultraGroupBoxAddRowSettings".
		this-object:ultraGroupBoxAddRowSettings:Size = new System.Drawing.Size(392, 224).
		this-object:ultraGroupBoxAddRowSettings:TabIndex = 21.
		this-object:ultraGroupBoxAddRowSettings:Text = "Add-Row Feature Settings".
		/*  */
		/* ultraGroupBoxAddRowPrompt */
		/*  */
		this-object:ultraGroupBoxAddRowPrompt:Controls:Add(this-object:ultraLabel4).
		this-object:ultraGroupBoxAddRowPrompt:Controls:Add(this-object:ultraComboEditorSpecialRowPromptField).
		this-object:ultraGroupBoxAddRowPrompt:Controls:Add(this-object:ultraButtonAddRowPromptAppearance).
		this-object:ultraGroupBoxAddRowPrompt:Controls:Add(this-object:ultraLabel1).
		this-object:ultraGroupBoxAddRowPrompt:Controls:Add(this-object:ultraTextEditorAddRowPrompt).
		this-object:ultraGroupBoxAddRowPrompt:Location = new System.Drawing.Point(16, 112).
		this-object:ultraGroupBoxAddRowPrompt:Name = "ultraGroupBoxAddRowPrompt".
		this-object:ultraGroupBoxAddRowPrompt:Size = new System.Drawing.Size(368, 104).
		this-object:ultraGroupBoxAddRowPrompt:TabIndex = 45.
		this-object:ultraGroupBoxAddRowPrompt:Text = "Add-Row Prompt Related".
		/*  */
		/* ultraLabel4 */
		/*  */
		this-object:ultraLabel4:Location = new System.Drawing.Point(8, 48).
		this-object:ultraLabel4:Name = "ultraLabel4".
		this-object:ultraLabel4:Size = new System.Drawing.Size(96, 23).
		this-object:ultraLabel4:TabIndex = 49.
		this-object:ultraLabel4:Text = "Prompt Field:".
		/*  */
		/* ultraComboEditorSpecialRowPromptField */
		/*  */
		this-object:ultraComboEditorSpecialRowPromptField:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorSpecialRowPromptField:Location = new System.Drawing.Point(104, 48).
		this-object:ultraComboEditorSpecialRowPromptField:Name = "ultraComboEditorSpecialRowPromptField".
		this-object:ultraComboEditorSpecialRowPromptField:Size = new System.Drawing.Size(208, 21).
		this-object:ultraComboEditorSpecialRowPromptField:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorSpecialRowPromptField:TabIndex = 48.
		this-object:ultraComboEditorSpecialRowPromptField:ValueChanged:subscribe(this-object:ultraComboEditorSpecialRowPromptField_ValueChanged).
		/*  */
		/* ultraButtonAddRowPromptAppearance */
		/*  */
		this-object:ultraButtonAddRowPromptAppearance:Location = new System.Drawing.Point(8, 72).
		this-object:ultraButtonAddRowPromptAppearance:Name = "ultraButtonAddRowPromptAppearance".
		this-object:ultraButtonAddRowPromptAppearance:Size = new System.Drawing.Size(192, 23).
		this-object:ultraButtonAddRowPromptAppearance:TabIndex = 47.
		this-object:ultraButtonAddRowPromptAppearance:Text = "Prompt Appearance".
		this-object:ultraButtonAddRowPromptAppearance:Click:subscribe(this-object:ultraButtonAddRowPromptAppearance_Click).
		/*  */
		/* ultraLabel1 */
		/*  */
		this-object:ultraLabel1:Location = new System.Drawing.Point(8, 24).
		this-object:ultraLabel1:Name = "ultraLabel1".
		this-object:ultraLabel1:Size = new System.Drawing.Size(96, 23).
		this-object:ultraLabel1:TabIndex = 46.
		this-object:ultraLabel1:Text = "Prompt Text:".
		/*  */
		/* ultraTextEditorAddRowPrompt */
		/*  */
		this-object:ultraTextEditorAddRowPrompt:Location = new System.Drawing.Point(104, 24).
		this-object:ultraTextEditorAddRowPrompt:Name = "ultraTextEditorAddRowPrompt".
		this-object:ultraTextEditorAddRowPrompt:Size = new System.Drawing.Size(208, 21).
		this-object:ultraTextEditorAddRowPrompt:TabIndex = 45.
		this-object:ultraTextEditorAddRowPrompt:ValueChanged:subscribe(this-object:ultraTextEditorAddRowPrompt_ValueChanged).
		/*  */
		/* ultraNumericEditorAddRowSpacingAfter */
		/*  */
		this-object:ultraNumericEditorAddRowSpacingAfter:Location = new System.Drawing.Point(248, 88).
		this-object:ultraNumericEditorAddRowSpacingAfter:MaskInput = "~{double:-2.0:c~}".
		this-object:ultraNumericEditorAddRowSpacingAfter:MaxValue = 99.
		this-object:ultraNumericEditorAddRowSpacingAfter:MinValue = -1.
		this-object:ultraNumericEditorAddRowSpacingAfter:Name = "ultraNumericEditorAddRowSpacingAfter".
		this-object:ultraNumericEditorAddRowSpacingAfter:PromptChar = ' '.
		this-object:ultraNumericEditorAddRowSpacingAfter:Size = new System.Drawing.Size(56, 21).
		this-object:ultraNumericEditorAddRowSpacingAfter:SpinButtonDisplayStyle = Infragistics.Win.ButtonDisplayStyle:Always.
		this-object:ultraNumericEditorAddRowSpacingAfter:TabIndex = 6.
		this-object:ultraNumericEditorAddRowSpacingAfter:ValueChanged:subscribe(this-object:ultraNumericEditorAddRowSpacingAfter_ValueChanged).
		/*  */
		/* ultraNumericEditorAddRowSpacingBefore */
		/*  */
		this-object:ultraNumericEditorAddRowSpacingBefore:Location = new System.Drawing.Point(152, 88).
		this-object:ultraNumericEditorAddRowSpacingBefore:MaskInput = "~{double:-2.0:c~}".
		this-object:ultraNumericEditorAddRowSpacingBefore:MaxValue = 99.
		this-object:ultraNumericEditorAddRowSpacingBefore:MinValue = -1.
		this-object:ultraNumericEditorAddRowSpacingBefore:Name = "ultraNumericEditorAddRowSpacingBefore".
		this-object:ultraNumericEditorAddRowSpacingBefore:PromptChar = ' '.
		this-object:ultraNumericEditorAddRowSpacingBefore:Size = new System.Drawing.Size(56, 21).
		this-object:ultraNumericEditorAddRowSpacingBefore:SpinButtonDisplayStyle = Infragistics.Win.ButtonDisplayStyle:Always.
		this-object:ultraNumericEditorAddRowSpacingBefore:TabIndex = 5.
		this-object:ultraNumericEditorAddRowSpacingBefore:ValueChanged:subscribe(this-object:ultraNumericEditorAddRowSpacingBefore_ValueChanged).
		/*  */
		/* ultraLabel3 */
		/*  */
		this-object:ultraLabel3:Location = new System.Drawing.Point(208, 88).
		this-object:ultraLabel3:Name = "ultraLabel3".
		this-object:ultraLabel3:Size = new System.Drawing.Size(40, 23).
		this-object:ultraLabel3:TabIndex = 4.
		this-object:ultraLabel3:Text = "After:".
		/*  */
		/* ultraLabel2 */
		/*  */
		this-object:ultraLabel2:Location = new System.Drawing.Point(16, 88).
		this-object:ultraLabel2:Name = "ultraLabel2".
		this-object:ultraLabel2:Size = new System.Drawing.Size(136, 23).
		this-object:ultraLabel2:TabIndex = 3.
		this-object:ultraLabel2:Text = "Add-Row Spacing Before:".
		/*  */
		/* ultraButtonTemplateAddRowAppearance */
		/*  */
		this-object:ultraButtonTemplateAddRowAppearance:Location = new System.Drawing.Point(208, 32).
		this-object:ultraButtonTemplateAddRowAppearance:Name = "ultraButtonTemplateAddRowAppearance".
		this-object:ultraButtonTemplateAddRowAppearance:Size = new System.Drawing.Size(176, 23).
		this-object:ultraButtonTemplateAddRowAppearance:TabIndex = 2.
		this-object:ultraButtonTemplateAddRowAppearance:Text = "Template Add-Row Appearance".
		this-object:ultraButtonTemplateAddRowAppearance:Click:subscribe(this-object:ultraButtonTemplateAddRowAppearance_Click).
		/*  */
		/* ultraButtonAddRowAppearance */
		/*  */
		this-object:ultraButtonAddRowAppearance:Location = new System.Drawing.Point(208, 56).
		this-object:ultraButtonAddRowAppearance:Name = "ultraButtonAddRowAppearance".
		this-object:ultraButtonAddRowAppearance:Size = new System.Drawing.Size(176, 23).
		this-object:ultraButtonAddRowAppearance:TabIndex = 1.
		this-object:ultraButtonAddRowAppearance:Text = "Add-Row Appearance".
		this-object:ultraButtonAddRowAppearance:Click:subscribe(this-object:ultraButtonAddRowAppearance_Click).
		/*  */
		/* ultraGroupBoxAllowAddNew */
		/*  */
		this-object:ultraGroupBoxAllowAddNew:Controls:Add(this-object:ultraComboEditorAllowAddNew).
		this-object:ultraGroupBoxAllowAddNew:Location = new System.Drawing.Point(8, 24).
		this-object:ultraGroupBoxAllowAddNew:Name = "ultraGroupBoxAllowAddNew".
		this-object:ultraGroupBoxAllowAddNew:Size = new System.Drawing.Size(192, 56).
		this-object:ultraGroupBoxAllowAddNew:TabIndex = 0.
		this-object:ultraGroupBoxAllowAddNew:Text = "AllowAddNew".
		/*  */
		/* ultraComboEditorAllowAddNew */
		/*  */
		this-object:ultraComboEditorAllowAddNew:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorAllowAddNew:Location = new System.Drawing.Point(8, 24).
		this-object:ultraComboEditorAllowAddNew:Name = "ultraComboEditorAllowAddNew".
		this-object:ultraComboEditorAllowAddNew:Size = new System.Drawing.Size(176, 21).
		this-object:ultraComboEditorAllowAddNew:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorAllowAddNew:TabIndex = 0.
		this-object:ultraComboEditorAllowAddNew:ValueChanged:subscribe(this-object:ultraComboEditorAllowAddNew_ValueChanged).
		/*  */
		/* ultraLabelDescription */
		/*  */
		this-object:ultraLabelDescription:Anchor = System.Windows.Forms.AnchorStyles:Top.
		this-object:ultraLabelDescription:Location = new System.Drawing.Point(0, 32).
		this-object:ultraLabelDescription:Name = "ultraLabelDescription".
		this-object:ultraLabelDescription:Size = new System.Drawing.Size(696, 48).
		this-object:ultraLabelDescription:TabIndex = 20.
		this-object:ultraLabelDescription:Text = resources:GetString("ultraLabelDescription.Text").
		/*  */
		/* btnTitle */
		/*  */
		this-object:btnTitle:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:btnTitle:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		this-object:btnTitle:Font = new System.Drawing.Font("Arial", 14.25, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		this-object:btnTitle:Location = new System.Drawing.Point(0, 0).
		this-object:btnTitle:Name = "btnTitle".
		this-object:btnTitle:Size = new System.Drawing.Size(704, 32).
		this-object:btnTitle:TabIndex = 13.
		this-object:btnTitle:Text = "Fixed Add-Row Feature".
		this-object:btnTitle:TextAlign = System.Drawing.ContentAlignment:MiddleLeft.
		this-object:btnTitle:UseCompatibleTextRendering = true.
		this-object:btnTitle:MouseUp:subscribe(this-object:btnTitle_MouseUp).
		/*  */
		/* ultraGroupBoxSeparatorGroupBox */
		/*  */
		this-object:ultraGroupBoxSeparatorGroupBox:Controls:Add(this-object:ultraLabel13).
		this-object:ultraGroupBoxSeparatorGroupBox:Controls:Add(this-object:ultraComboEditorSpecialRowSeparatorBorderStyle).
		this-object:ultraGroupBoxSeparatorGroupBox:Controls:Add(this-object:ultraNumericEditorSeparatorHeight).
		this-object:ultraGroupBoxSeparatorGroupBox:Controls:Add(this-object:ultraCheckEditorSeparator).
		this-object:ultraGroupBoxSeparatorGroupBox:Controls:Add(this-object:ultraLabel12).
		this-object:ultraGroupBoxSeparatorGroupBox:Controls:Add(this-object:ultraButtonSeparatorAppearance).
		this-object:ultraGroupBoxSeparatorGroupBox:Location = new System.Drawing.Point(400, 80).
		this-object:ultraGroupBoxSeparatorGroupBox:Name = "ultraGroupBoxSeparatorGroupBox".
		this-object:ultraGroupBoxSeparatorGroupBox:Size = new System.Drawing.Size(280, 120).
		this-object:ultraGroupBoxSeparatorGroupBox:TabIndex = 33.
		this-object:ultraGroupBoxSeparatorGroupBox:Text = "Separator Related".
		/*  */
		/* ultraLabel13 */
		/*  */
		this-object:ultraLabel13:Location = new System.Drawing.Point(112, 80).
		this-object:ultraLabel13:Name = "ultraLabel13".
		this-object:ultraLabel13:Size = new System.Drawing.Size(48, 23).
		this-object:ultraLabel13:TabIndex = 36.
		this-object:ultraLabel13:Text = "Border:".
		/*  */
		/* ultraComboEditorSpecialRowSeparatorBorderStyle */
		/*  */
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle:Location = new System.Drawing.Point(160, 80).
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle:Name = "ultraComboEditorSpecialRowSeparatorBorderStyle".
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle:Size = new System.Drawing.Size(112, 21).
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle:TabIndex = 35.
		this-object:ultraComboEditorSpecialRowSeparatorBorderStyle:ValueChanged:subscribe(this-object:ultraComboEditorSpecialRowSeparatorBorderStyle_ValueChanged).
		/*  */
		/* ultraNumericEditorSeparatorHeight */
		/*  */
		this-object:ultraNumericEditorSeparatorHeight:Location = new System.Drawing.Point(56, 80).
		this-object:ultraNumericEditorSeparatorHeight:MaskInput = "~{double:-2.0:c~}".
		this-object:ultraNumericEditorSeparatorHeight:MaxValue = 500.
		this-object:ultraNumericEditorSeparatorHeight:MinValue = -1.
		this-object:ultraNumericEditorSeparatorHeight:Name = "ultraNumericEditorSeparatorHeight".
		this-object:ultraNumericEditorSeparatorHeight:PromptChar = ' '.
		this-object:ultraNumericEditorSeparatorHeight:Size = new System.Drawing.Size(56, 21).
		this-object:ultraNumericEditorSeparatorHeight:SpinButtonDisplayStyle = Infragistics.Win.ButtonDisplayStyle:Always.
		this-object:ultraNumericEditorSeparatorHeight:TabIndex = 31.
		this-object:ultraNumericEditorSeparatorHeight:Value = -1.
		this-object:ultraNumericEditorSeparatorHeight:ValueChanged:subscribe(this-object:ultraNumericEditorSeparatorHeight_ValueChanged).
		/*  */
		/* ultraCheckEditorSeparator */
		/*  */
		this-object:ultraCheckEditorSeparator:Location = new System.Drawing.Point(16, 24).
		this-object:ultraCheckEditorSeparator:Name = "ultraCheckEditorSeparator".
		this-object:ultraCheckEditorSeparator:Size = new System.Drawing.Size(168, 16).
		this-object:ultraCheckEditorSeparator:TabIndex = 28.
		this-object:ultraCheckEditorSeparator:Text = "Display Add-Row Separator".
		this-object:ultraCheckEditorSeparator:CheckedChanged:subscribe(this-object:ultraCheckEditorSeparator_CheckedChanged).
		/*  */
		/* ultraLabel12 */
		/*  */
		this-object:ultraLabel12:Location = new System.Drawing.Point(8, 80).
		this-object:ultraLabel12:Name = "ultraLabel12".
		this-object:ultraLabel12:Size = new System.Drawing.Size(48, 24).
		this-object:ultraLabel12:TabIndex = 30.
		this-object:ultraLabel12:Text = "Height:".
		/*  */
		/* ultraButtonSeparatorAppearance */
		/*  */
		this-object:ultraButtonSeparatorAppearance:Location = new System.Drawing.Point(8, 48).
		this-object:ultraButtonSeparatorAppearance:Name = "ultraButtonSeparatorAppearance".
		this-object:ultraButtonSeparatorAppearance:Size = new System.Drawing.Size(120, 23).
		this-object:ultraButtonSeparatorAppearance:TabIndex = 28.
		this-object:ultraButtonSeparatorAppearance:Text = "Appearance".
		this-object:ultraButtonSeparatorAppearance:Click:subscribe(this-object:ultraButtonSeparatorAppearance_Click).
		/*  */
		/* UltraGrid1 */
		/*  */
		appearance1:BackColor = System.Drawing.SystemColors:Window.
		appearance1:BorderColor = System.Drawing.SystemColors:InactiveCaption.
		this-object:UltraGrid1:DisplayLayout:Appearance = appearance1.
		this-object:UltraGrid1:DisplayLayout:BorderStyle = Infragistics.Win.UIElementBorderStyle:Solid.
		this-object:UltraGrid1:DisplayLayout:CaptionVisible = Infragistics.Win.DefaultableBoolean:False.
		appearance2:BackColor = System.Drawing.SystemColors:ActiveBorder.
		appearance2:BackColor2 = System.Drawing.SystemColors:ControlDark.
		appearance2:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance2:BorderColor = System.Drawing.SystemColors:Window.
		this-object:UltraGrid1:DisplayLayout:GroupByBox:Appearance = appearance2.
		appearance3:ForeColor = System.Drawing.SystemColors:GrayText.
		this-object:UltraGrid1:DisplayLayout:GroupByBox:BandLabelAppearance = appearance3.
		this-object:UltraGrid1:DisplayLayout:GroupByBox:BorderStyle = Infragistics.Win.UIElementBorderStyle:Solid.
		appearance4:BackColor = System.Drawing.SystemColors:ControlLightLight.
		appearance4:BackColor2 = System.Drawing.SystemColors:Control.
		appearance4:BackGradientStyle = Infragistics.Win.GradientStyle:Horizontal.
		appearance4:ForeColor = System.Drawing.SystemColors:GrayText.
		this-object:UltraGrid1:DisplayLayout:GroupByBox:PromptAppearance = appearance4.
		this-object:UltraGrid1:DisplayLayout:MaxColScrollRegions = 1.
		this-object:UltraGrid1:DisplayLayout:MaxRowScrollRegions = 1.
		this-object:UltraGrid1:DisplayLayout:Override:BorderStyleCell = Infragistics.Win.UIElementBorderStyle:Dotted.
		this-object:UltraGrid1:DisplayLayout:Override:BorderStyleRow = Infragistics.Win.UIElementBorderStyle:Dotted.
		appearance5:BackColor = System.Drawing.SystemColors:Window.
		this-object:UltraGrid1:DisplayLayout:Override:CardAreaAppearance = appearance5.
		appearance6:BorderColor = System.Drawing.Color:Silver.
		appearance6:TextTrimming = Infragistics.Win.TextTrimming:EllipsisCharacter.
		this-object:UltraGrid1:DisplayLayout:Override:CellAppearance = appearance6.
		this-object:UltraGrid1:DisplayLayout:Override:CellClickAction = Infragistics.Win.UltraWinGrid.CellClickAction:EditAndSelectText.
		appearance7:BackColor = System.Drawing.SystemColors:Control.
		appearance7:BackColor2 = System.Drawing.SystemColors:ControlDark.
		appearance7:BackGradientAlignment = Infragistics.Win.GradientAlignment:Client.
		appearance7:BackGradientStyle = Infragistics.Win.GradientStyle:Horizontal.
		appearance7:BorderColor = System.Drawing.SystemColors:Window.
		this-object:UltraGrid1:DisplayLayout:Override:GroupByRowAppearance = appearance7.
		appearance8:TextHAlignAsString = "Left".
		this-object:UltraGrid1:DisplayLayout:Override:HeaderAppearance = appearance8.
		this-object:UltraGrid1:DisplayLayout:Override:HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction:SortMulti.
		this-object:UltraGrid1:DisplayLayout:Override:HeaderStyle = Infragistics.Win.HeaderStyle:WindowsXPCommand.
		appearance9:BackColor = System.Drawing.SystemColors:Window.
		appearance9:BorderColor = System.Drawing.Color:Silver.
		this-object:UltraGrid1:DisplayLayout:Override:RowAppearance = appearance9.
		this-object:UltraGrid1:DisplayLayout:Override:RowSelectors = Infragistics.Win.DefaultableBoolean:True.
		appearance10:BackColor = System.Drawing.SystemColors:ControlLight.
		this-object:UltraGrid1:DisplayLayout:Override:TemplateAddRowAppearance = appearance10.
		this-object:UltraGrid1:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
		this-object:UltraGrid1:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:UltraGrid1:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:UltraGrid1:Location = new System.Drawing.Point(0, 312).
		this-object:UltraGrid1:Name = "UltraGrid1".
		this-object:UltraGrid1:Size = new System.Drawing.Size(704, 190).
		this-object:UltraGrid1:TabIndex = 17.
		this-object:UltraGrid1:InitializeLayout:subscribe(this-object:UltraGrid1_InitializeLayout).
		/*  */
		/* frmAddRow */
		/*  */
		this-object:ClientSize = new System.Drawing.Size(704, 502).
		this-object:Controls:Add(this-object:UltraGrid1).
		this-object:Controls:Add(this-object:Panel1).
		this-object:Name = "frmAddRow".
		this-object:Text = "AddRow".
		this-object:Load:subscribe(this-object:frmAddRow_Load).
		this-object:FormClosing:subscribe(this-object:frmAddRow_FormClosing).
		this-object:Panel1:ResumeLayout(false).
		cast(this-object:ultraGroupBoxOtherSettings, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraGroupBoxOtherSettings:ResumeLayout(false).
		cast(this-object:ultraGroupBoxAddRowSettings, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraGroupBoxAddRowSettings:ResumeLayout(false).
		this-object:ultraGroupBoxAddRowSettings:PerformLayout().
		cast(this-object:ultraGroupBoxAddRowPrompt, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraGroupBoxAddRowPrompt:ResumeLayout(false).
		this-object:ultraGroupBoxAddRowPrompt:PerformLayout().
		cast(this-object:ultraComboEditorSpecialRowPromptField, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraTextEditorAddRowPrompt, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraNumericEditorAddRowSpacingAfter, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraNumericEditorAddRowSpacingBefore, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraGroupBoxAllowAddNew, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraGroupBoxAllowAddNew:ResumeLayout(false).
		this-object:ultraGroupBoxAllowAddNew:PerformLayout().
		cast(this-object:ultraComboEditorAllowAddNew, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraGroupBoxSeparatorGroupBox, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraGroupBoxSeparatorGroupBox:ResumeLayout(false).
		this-object:ultraGroupBoxSeparatorGroupBox:PerformLayout().
		cast(this-object:ultraComboEditorSpecialRowSeparatorBorderStyle, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraNumericEditorSeparatorHeight, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:UltraGrid1, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ResumeLayout(false).

	end method.

    method private void ScrollTemplateRowIntoView( ):
	    define variable templateAddRow as UltraGridRow no-undo.
	    templateAddRow = UltraGrid1:Rows:TemplateAddRow.
		if valid-object(templateAddRow) and not templateAddRow:HiddenResolved then
		    UltraGrid1:ActiveRowScrollRegion:ScrollRowIntoView( templateAddRow ).			
	end method.
    
   	method private void LoadColumnsCombo(ultraCombo as UltraComboEditor, band as UltraGridBand  ):
        define variable i as integer no-undo.
        define variable gridColumn as UltraGridColumn no-undo.
                	    
	    ultraCombo:Items:Clear( ).
		ultraCombo:Items:Add(?, "None" ).

        do i = 0 to band:Columns:Count - 1:
		    gridColumn = band:Columns[i].
		    ultraCombo:Items:Add( gridColumn, gridColumn:Header:Caption ).
		end.

		if ( ultraCombo:Items:Count > 0 ) then
			ultraCombo:SelectedIndex = 0.
	end method.

    method private void LoadAllowAddNewCombo(ultraCombo as  UltraComboEditor ):
		ultraCombo:Items:Clear( ). 
		ultraCombo:Items:Add( AllowAddNew:No ).
		ultraCombo:Items:Add( AllowAddNew:FixedAddRowOnTop, "FixedAddRowOnTop" ).
		ultraCombo:Items:Add( AllowAddNew:FixedAddRowOnBottom, "FixedAddRowOnBottom" ).
		ultraCombo:Items:Add( AllowAddNew:TemplateOnTop ).
		ultraCombo:Items:Add( AllowAddNew:TemplateOnTopWithTabRepeat ).
		ultraCombo:Items:Add( AllowAddNew:TemplateOnBottom ).
	end method.
	    	
	method private void CreateAppearancePicker():
	    if valid-object(fAppearancePickerForm ) then
		do:
		    fAppearancePickerForm:Close().
			fAppearancePickerForm:Dispose().
		end.
		
		fAppearancePickerForm = new AppearancePicker().
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
	end.	

    /* implements ISamplesBase interface  */
    method public void HideMe( ):
        this-object:Hide().   
    end.
	
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
	METHOD PRIVATE VOID frmAddRow_FormClosing( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.FormClosingEventArgs ):
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
	METHOD PRIVATE VOID frmAddRow_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
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
    	
    	/* --------------------------------------------------------------------------------
    	   Add-Row Feature Related Settings
    	   --------------------------------------------------------------------------------*/ 
        /* To enable the add-row functionality set the AllowAddNew. If you set the property*/
        /* to FixedAddRowOnTop or FixedAddRowOnBottom then the add-row will be fixed in the*/
        /* root band. It won't scroll out of view as rows are scrolled.                    */
		 
		e:Layout:Override:AllowAddNew = AllowAddNew:FixedAddRowOnTop.
	
        /* Set the appearance for template add-rows. Template add-rows are the 
           add-row templates that are displayed with each rows collection. */
	 
		e:Layout:Override:TemplateAddRowAppearance:BackColor = Color:FromArgb( 245, 250, 255 ).
		e:Layout:Override:TemplateAddRowAppearance:ForeColor = SystemColors:GrayText.
	
		/* Once  the user modifies the contents of a template add-row, it becomes */
		/* an add-row and the AddRowAppearance gets applied to such rows. */
		
		e:Layout:Override:AddRowAppearance:BackColor = Color:LightYellow.
		e:Layout:Override:AddRowAppearance:ForeColor = Color:Blue.
	
        /*	You can set the SpecialRowSeparator to a value with TemplateAddRow flag    */
        /*	turned on to display a separator ui element after the add-row. By default  */
        /*	UltraGrid displays a separator element if AllowAddNew is either            */
        /*	FixedAddRowOnTop or FixedAddRowOnBottom. For scrolling add-rows you have to*/
        /*	set the SpecialRowSeparator explicitly. You can also control the appearance*/
        /*	of the separator using the SpecialRowSeparatorAppearance proeprty.         */
		
		e:Layout:Override:SpecialRowSeparator = SpecialRowSeparator:TemplateAddRow.
		e:Layout:Override:SpecialRowSeparatorAppearance:BackColor = SystemColors:Control.
	
        /*	You can display a prompt in the add-row by setting the TemplateAddRowPrompt*/
        /*	proeprty. By default UltraGrid does not display any add-row prompt.        */
		
		e:Layout:Override:TemplateAddRowPrompt = "Click here to add a new record...".
	
    	/*	You can control the appearance of the prompt using the Override's         */
    	/*  TemplateAddRowPromptAppearance property. By default the prompt is      */
    	/*  transparent. You can make it non-transparent by setting the appearance'*/
    	/*	BackColorAlpha property or by setting the BackColor to a desired value.   */
		 
		e:Layout:Override:TemplateAddRowPromptAppearance:ForeColor = Color:Maroon.
		e:Layout:Override:TemplateAddRowPromptAppearance:FontData:Bold = DefaultableBoolean:True.
	
    	/*	By default the prompt is displayed across multiple cells. You can confine    */
    	/*	the prompt a particular cell by setting the SpecialRowPromptField property   */
    	/*	of the band to the key of the column that you want to display the prompt in. */
    	/*		                                                                           */
        /*	 e:Layout:Bands[0]:SpecialRowPromptField = e:Layout:Bands[0]:Columns[0]:Key    */
	
    	/*	You can set the default value of an add-row field by using the DefaultCellValue*/
    	/*	property of the column. Also you can initialize a template add-row to dynamic  */
    	/*	default values using the InitializeTemplateAddRow event of the UltraGrid.      */
		e:Layout:Bands[0]:Columns[5]:DefaultCellValue = "(DefaultValue)".
		
		/*----------------------------------------------------------------------
		Other miscellaneous settings 
		----------------------------------------------------------------------*/
    	
    	/* Set the scroll style to immediate so the rows get scrolled immediately*/
    	/* when the vertical scrollbar thumb is dragged.                            */
		
		e:Layout:ScrollStyle = ScrollStyle:Immediate.
	
    	/*	ScrollBounds of ScrollToFill will prevent the user from scrolling the*/
    	/*	grid further down once the last row becomes fully visible.           */
 
 		e:Layout:ScrollBounds = ScrollBounds:ScrollToFill.
		 
		/*--------------------------------------------------------------------------------
		  Initialize controls
		--------------------------------------------------------------------------------*/
		/* Load the AllowAddNew combobox. */
		
		LoadAllowAddNewCombo( ultraComboEditorAllowAddNew ).
		LoadEnumCombo( ultraComboEditorSpecialRowSeparatorBorderStyle,"Infragistics.Win.UIElementBorderStyle").
		LoadColumnsCombo( ultraComboEditorSpecialRowPromptField, e:Layout:Bands[0] ).
	
        /* Initialize the controls to their values.*/
		ultraComboEditorAllowAddNew:Value = e:Layout:Override:AllowAddNew.
		ultraComboEditorSpecialRowSeparatorBorderStyle:Value = e:Layout:Override:BorderStyleSpecialRowSeparator.
		ultraNumericEditorAddRowSpacingAfter:Value = e:Layout:Override:TemplateAddRowSpacingAfter.
		ultraNumericEditorAddRowSpacingBefore:Value = e:Layout:Override:TemplateAddRowSpacingBefore.
		ultraNumericEditorSeparatorHeight:Value = e:Layout:Override:SpecialRowSeparatorHeight.
		ultraCheckEditorAddNewBox:Checked = not e:Layout:AddNewBox:Hidden.
		ultraCheckEditorCardView:Checked = e:Layout:Bands[0]:CardView.
		ultraCheckEditorSeparator:Checked = "0" <> string(Progress.Util.EnumHelper:And(SpecialRowSeparator:TemplateAddRow,e:Layout:Override:SpecialRowSeparator)).
		ultraTextEditorAddRowPrompt:Value = e:Layout:Override:TemplateAddRowPrompt.
 
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorAllowAddNew_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    define variable allowAddNew as AllowAddNew no-undo.
		
		allowAddNew = cast(ultraComboEditorAllowAddNew:Value,AllowAddNew).
		UltraGrid1:DisplayLayout:Override:AllowAddNew = allowAddNew.

		ultraGroupBoxSeparatorGroupBox:Enabled = Progress.Util.EnumHelper:AreNotEqual(Infragistics.Win.UltraWinGrid.AllowAddNew:No,allowAddNew).

		ScrollTemplateRowIntoView( ).
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonAddRowAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		CreateAppearancePicker( ).
		fAppearancePickerForm:ShowMe(UltraGrid1:DisplayLayout:Override:AddRowAppearance,
				                    "Add-Row Appearance" ).			
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonTemplateAddRowAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		CreateAppearancePicker( ).
		fAppearancePickerForm:ShowMe(UltraGrid1:DisplayLayout:Override:TemplateAddRowAppearance,
				                    "Template Add-Row Appearance" ).
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonAddRowPromptAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		CreateAppearancePicker( ).
		fAppearancePickerForm:ShowMe(UltraGrid1:DisplayLayout:Override:TemplateAddRowPromptAppearance,
	                                "Template Add-Row Prompt Appearance" ).
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
				                    "Separator Appearance" ).	
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraNumericEditorAddRowSpacingBefore_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		UltraGrid1:DisplayLayout:Override:TemplateAddRowSpacingBefore = ultraNumericEditorAddRowSpacingBefore:Value.
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraNumericEditorAddRowSpacingAfter_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		UltraGrid1:DisplayLayout:Override:TemplateAddRowSpacingAfter = ultraNumericEditorAddRowSpacingAfter:Value.
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraCheckEditorAddNewBox_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		UltraGrid1:DisplayLayout:AddNewBox:Hidden = not ultraCheckEditorAddNewBox:Checked.
		ScrollTemplateRowIntoView( ).	
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraCheckEditorCardView_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		UltraGrid1:DisplayLayout:Bands[0]:CardView = ultraCheckEditorCardView:Checked.

		/* Disable expand all and collapse all buttons since turning on card-view on */
		/* the first band will not show any child rows */ 
		ultraButtonExpandAll:Enabled = not UltraGrid1:DisplayLayout:Bands[0]:CardView.
        ultraButtonCollapseAll:Enabled = ultraButtonExpandAll:Enabled. 
		
		/* Scroll the template add-row into view. This works in both card-view */ 
		/* and in  non-card-view. */
		ScrollTemplateRowIntoView( ).
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraCheckEditorSingleBand_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		if ultraCheckEditorSingleBand:Checked then
			UltraGrid1:DisplayLayout:ViewStyle = ViewStyle:SingleBand.
		else
			UltraGrid1:DisplayLayout:ViewStyle = ViewStyle:MultiBand.			
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonExpandAll_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		UltraGrid1:Rows:ExpandAll( true ).
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonCollapseAll_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    UltraGrid1:Rows:CollapseAll( true ).
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraCheckEditorSeparator_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		if ultraCheckEditorSeparator:Checked then
			UltraGrid1:DisplayLayout:Override:SpecialRowSeparator = SpecialRowSeparator:TemplateAddRow.
		else
			UltraGrid1:DisplayLayout:Override:SpecialRowSeparator = SpecialRowSeparator:None.		
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraNumericEditorSeparatorHeight_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable separatorHeight as integer no-undo.
		 
		do on error undo,throw:
			separatorHeight = System.Convert:ToInt32(ultraNumericEditorSeparatorHeight:Value).			
			catch err as Progress.Lang.Error:
             	separatorHeight = -1.
				ultraNumericEditorSeparatorHeight:Value = separatorHeight.
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
		define variable borderStyle as UIElementBorderStyle no-undo.
		borderStyle = cast(ultraComboEditorSpecialRowSeparatorBorderStyle:Value,UIElementBorderStyle).
		UltraGrid1:DisplayLayout:Override:BorderStyleSpecialRowSeparator = borderStyle.
		RETURN.
	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorSpecialRowPromptField_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable selectedColumn as UltraGridColumn no-undo.
		
		selectedColumn = cast(ultraComboEditorSpecialRowPromptField:Value,UltraGridColumn).
		if valid-object(selectedColumn) then 
        	/* When SpecialRowPromptField of a band is set to a column's key then the   */
        	/* add-row prompt (and also the filter row prompt) is displayed in this     */
        	/* column's cell. Otherwise it's displayed in the row potentially spread    */
        	/* across multiple cells if the width of the prompt is bigger than the first*/
        	/* visible cell in the row.                                                 */
			UltraGrid1:DisplayLayout:Bands[0]:SpecialRowPromptField = selectedColumn:Key.
		else
            /* Setting the SpecialRowPromptField null displays the prompt in the row*/
            /* potentially across multiple cells.                                   */
			UltraGrid1:DisplayLayout:Bands[0]:SpecialRowPromptField = ?.	
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraTextEditorAddRowPrompt_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs):
		UltraGrid1:DisplayLayout:Override:TemplateAddRowPrompt = ultraTextEditorAddRowPrompt:Text.
		RETURN.
	END METHOD.

	DESTRUCTOR PUBLIC frmAddRow ( ):
		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.
	END DESTRUCTOR.

END CLASS.