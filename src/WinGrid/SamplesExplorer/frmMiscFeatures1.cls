/* 
ABL example derived from Infragistics source, copyright ©1992-2008 Infragistics, 
Inc., Windsor Corporate Park, 50 Millstone Road, Building 200 Suite 150, East 
Windsor, NJ 08520. All rights reserved.
*/   
 /*------------------------------------------------------------------------
    File        : frmMiscFeatures1
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels copied from Infragistics samples/././frm51MiscFeatures.cs
    Created     : Mon Jul 21 18:38:01 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

USING System.Diagnostics.Debug.
USING System.Drawing.Color.
USING System.Drawing.Point.
USING System.Windows.Forms.Control.
USING System.Windows.Forms.CheckState.
USING System.Windows.Forms.DialogResult.
USING System.Windows.Forms.MessageBox.
USING System.Windows.Forms.MessageBoxButtons.

using Progress.Util.EnumHelper.
using Progress.Util.TypeHelper.

USING Infragistics.Win.ValueList.
USING Infragistics.Win.ValueListItem.
USING Infragistics.Win.DefaultableBoolean.
USING Infragistics.Win.UIElement.
USING Infragistics.Win.UltraWinEditors.SpinButtonItem.

USING Infragistics.Win.UltraWinGrid.*.

using DataServices.IDataService. 
using DataServices.StateService.
using DataServices.CustOrderService. 
using DataServices.EmployeeService. 
using DataServices.SampleData. 

using WinGrid.SamplesExplorer.*.

CLASS WinGrid.SamplesExplorer.frmMiscFeatures1 INHERITS Form IMPLEMENTS ISamplesBase  : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.
	

	define public variable btnTitle as System.Windows.Forms.Button no-undo.
	define private variable ultraTabControl_Main as Infragistics.Win.UltraWinTabControl.UltraTabControl no-undo.
	define private variable ultraTabSharedControlsPage1 as Infragistics.Win.UltraWinTabControl.UltraTabSharedControlsPage no-undo.
	define private variable ultraTabPage_Main_CardViewVertScrollbar as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraOptionSetCardVertScrollbar_CardViewBand as Infragistics.Win.UltraWinEditors.UltraOptionSet no-undo.
	define private variable ultraLabel17 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraGridCardVertScrollbar as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable ultraLabel2 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraTabPage_Main_ComboSorting as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraCheckEditorSortInUC_EnableColResizing as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraCheckEditorSortInUC_EnableFiltering as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraCheckEditorSortInUC_EnableSorting as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraCheckEditorSortInUC_AutoFit as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraDropDownSortInUC as Infragistics.Win.UltraWinGrid.UltraDropDown no-undo.
	define private variable ultraLabel4 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraGridSortInUC as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable ultraComboSortInUC as Infragistics.Win.UltraWinGrid.UltraCombo no-undo.
	define private variable ultraLabel3 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraTabPage_Main_LimitToList as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraTextEditorLimitToList_EventLog as Infragistics.Win.UltraWinEditors.UltraTextEditor no-undo.
	define private variable ultraButtonLimitToList_Btn1 as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraCheckEditorLimitToList_RetainFocus as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraCheckEditorLimitToList_Enable as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraLabel5 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboLimitToList as Infragistics.Win.UltraWinGrid.UltraCombo no-undo.
	define private variable ultraLabel6 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraTabPage_Main_ComboButtons as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraLabel15 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraComboCustomButtons as Infragistics.Win.UltraWinGrid.UltraCombo no-undo.
	define private variable ultraLabel14 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraTabPage_Main_SyncSort as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraCheckEditorSyncrhonousSorting_ShowWaitCursor as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraComboEditorSyncrhonousSorting_ProcessMode as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabel13 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraGridSyncrhonousSorting as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable ultraLabel12 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraTabPage_Main_CardCompressEvents as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraCheckEditorCardCompressedStateChange_PreventCollapsing as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraCheckEditorCardCompressedStateChange_PreventExpanding as Infragistics.Win.UltraWinEditors.UltraCheckEditor no-undo.
	define private variable ultraGridCardCompressedStateChange as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable ultraLabelCardCompressedStateChange as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraTabPage_Main_RowSelectorHeader as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraButtonRowSelectorHeaderAppearance as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraComboEditorRowSelectorHeaderStyle as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabel9 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraGridRowSelectorHeaderStyle as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable ultraLabel10 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraTabPage_Main_CellColSizing as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraComboEditorColumnSizingArea as Infragistics.Win.UltraWinEditors.UltraComboEditor no-undo.
	define private variable ultraLabel8 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraGridColumnSizingArea as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable ultraTabPage_Main_HideHeaderRowLayout as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraGridRowLayoutLabelPosition as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable ultraLabel11 as Infragistics.Win.Misc.UltraLabel no-undo.
	define private variable ultraTabPage_Main_PrintDocument as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraButton_ShowPrintDialog as Infragistics.Win.Misc.UltraButton no-undo.
	define private variable ultraGroupBoxUltraGridPrintDocument as Infragistics.Win.Misc.UltraGroupBox no-undo.
	define private variable ultraTabControl_PrintSettings as Infragistics.Win.UltraWinTabControl.UltraTabControl no-undo.
	define private variable ultraTabSharedControlsPage2 as Infragistics.Win.UltraWinTabControl.UltraTabSharedControlsPage no-undo.
	define private variable ultraTabPage_PrintSettings_PrintDocument as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable propertyGridPrintDocument as System.Windows.Forms.PropertyGrid no-undo.
	define private variable ultraTabPage_PrintSettings_PrintDialog as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable propertyGridPrintDialog as System.Windows.Forms.PropertyGrid no-undo.
	define private variable ultraTabPage_PrintSettings_PrintGrid as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable propertyGridPrintUltraGrid as System.Windows.Forms.PropertyGrid no-undo.
	define private variable ultraGridPrintGrid as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable ultraLabel16 as Infragistics.Win.Misc.UltraLabel no-undo.
    
    /* manual defs */
    define private variable StateService as DataServices.IDataService no-undo.
    define private variable EmployeeService as DataServices.IDataService no-undo.
    define private variable CustOrderService as DataServices.IDataService no-undo.
    define private variable SampleService as DataServices.SampleData no-undo.
    
    define private variable fAppearancePickerForm as WinGrid.SamplesExplorer.AppearancePicker no-undo.
  
    define private variable fItemNotInListEventCount as integer no-undo.
  
    
    define temp-table ttState 
        field State as char
        index state  state.
    	
    define private property NextOrder as integer no-undo init ?
	get:
	    NextOrder = if NextOrder = ? then 0 else NextOrder + 1. 
	    return NextOrder.
	end.
	set.
	
	/** ISamplesBase properties */
	
	/* Provides a description for the sample. */
	define public property Description as character no-undo 
	get:
	    return "This sample shows some of the new features available in 5.1 version of UltraGrid.".
	end.
	
    /* Name of the sample. */
	define public property SampleName as character no-undo
    get:
        return "Miscellaneous Features (New Infragistics V5.1)". 
    end.
	
    /* Type of sample. */
	define public property SampleType as character no-undo
	get:
	    return "Feature".
	end.    

	/* Preview Picture for Sample */
	define public property PreviewPicture as System.Drawing.Image no-undo
    get:
        return System.Drawing.Image:FromFile(SamplesPath:GraphicsPath + "/Previews/51MiscFeatures.PNG").
    end.  

	define private variable bindingSource1 as Progress.Data.BindingSource no-undo.

	define private variable ultraGridPrintDocument1 as Infragistics.Win.UltraWinGrid.UltraGridPrintDocument no-undo.

	define private variable propertyGrid1 as System.Windows.Forms.PropertyGrid no-undo.

	define private variable propertyGrid2 as System.Windows.Forms.PropertyGrid no-undo.
	define private variable ultraPrintPreviewDialog1 as Infragistics.Win.Printing.UltraPrintPreviewDialog no-undo.

		
	CONSTRUCTOR PUBLIC frmMiscFeatures1 (  ):
		
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
		define variable stateEditorButton1 as Infragistics.Win.UltraWinEditors.StateEditorButton no-undo.
		stateEditorButton1 = new Infragistics.Win.UltraWinEditors.StateEditorButton("MyCheckBtn").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable editorButton1 as Infragistics.Win.UltraWinEditors.EditorButton no-undo.
		editorButton1 = new Infragistics.Win.UltraWinEditors.EditorButton("MyEditorBtn").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable dropDownEditorButton1 as Infragistics.Win.UltraWinEditors.DropDownEditorButton no-undo.
		dropDownEditorButton1 = new Infragistics.Win.UltraWinEditors.DropDownEditorButton("MyDropDownBtn").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable spinEditorButton1 as Infragistics.Win.UltraWinEditors.SpinEditorButton no-undo.
		spinEditorButton1 = new Infragistics.Win.UltraWinEditors.SpinEditorButton("MyUpDownSpinBtn").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable spinEditorButton2 as Infragistics.Win.UltraWinEditors.SpinEditorButton no-undo.
		spinEditorButton2 = new Infragistics.Win.UltraWinEditors.SpinEditorButton("MyLeftRightSpinBtn").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable resources as System.Resources.ResXResourceSet no-undo.
		resources = Progress.Util.ResourceHelper:Load("WinGrid\SamplesExplorer\frmMiscFeatures1.resx", PROPATH).
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
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance11 as Infragistics.Win.Appearance no-undo.
		appearance11 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridBand1 as Infragistics.Win.UltraWinGrid.UltraGridBand no-undo.
		ultraGridBand1 = new Infragistics.Win.UltraWinGrid.UltraGridBand("eEmployee", -1).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn1 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn1 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("EmpNum").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance64 as Infragistics.Win.Appearance no-undo.
		appearance64 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn2 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn2 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("FirstName").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn3 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn3 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("LastName").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn4 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn4 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Address").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn5 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn5 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Address2").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn6 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn6 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("City").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn7 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn7 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("PostalCode").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn8 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn8 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Birthdate").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn9 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn9 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("DeptCode").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn10 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn10 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("HomePhone").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn11 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn11 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("position").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn12 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn12 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("SickDaysLeft").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn13 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn13 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("StartDate").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn14 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn14 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("State").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn15 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn15 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("VacationDaysLeft").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn16 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn16 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("WorkPhone").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn17 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn17 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Country").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn18 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn18 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Notes").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn19 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn19 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Photo").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn20 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn20 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("UnboundColumn1", 0).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance35 as Infragistics.Win.Appearance no-undo.
		appearance35 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn21 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn21 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("UnboundColumn2", 1).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance61 as Infragistics.Win.Appearance no-undo.
		appearance61 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn22 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn22 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("UnboundColumn3", 2).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance62 as Infragistics.Win.Appearance no-undo.
		appearance62 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn23 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn23 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("UnboundColumn4", 3).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance63 as Infragistics.Win.Appearance no-undo.
		appearance63 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance17 as Infragistics.Win.Appearance no-undo.
		appearance17 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance18 as Infragistics.Win.Appearance no-undo.
		appearance18 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance19 as Infragistics.Win.Appearance no-undo.
		appearance19 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance20 as Infragistics.Win.Appearance no-undo.
		appearance20 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance21 as Infragistics.Win.Appearance no-undo.
		appearance21 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance22 as Infragistics.Win.Appearance no-undo.
		appearance22 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance23 as Infragistics.Win.Appearance no-undo.
		appearance23 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance24 as Infragistics.Win.Appearance no-undo.
		appearance24 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance25 as Infragistics.Win.Appearance no-undo.
		appearance25 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance26 as Infragistics.Win.Appearance no-undo.
		appearance26 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance27 as Infragistics.Win.Appearance no-undo.
		appearance27 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance28 as Infragistics.Win.Appearance no-undo.
		appearance28 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab1 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab1 = new Infragistics.Win.UltraWinTabControl.UltraTab(true).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab2 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab2 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab3 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab3 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance36 as Infragistics.Win.Appearance no-undo.
		appearance36 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance37 as Infragistics.Win.Appearance no-undo.
		appearance37 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance38 as Infragistics.Win.Appearance no-undo.
		appearance38 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance39 as Infragistics.Win.Appearance no-undo.
		appearance39 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance40 as Infragistics.Win.Appearance no-undo.
		appearance40 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance41 as Infragistics.Win.Appearance no-undo.
		appearance41 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance42 as Infragistics.Win.Appearance no-undo.
		appearance42 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance43 as Infragistics.Win.Appearance no-undo.
		appearance43 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance44 as Infragistics.Win.Appearance no-undo.
		appearance44 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance45 as Infragistics.Win.Appearance no-undo.
		appearance45 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance46 as Infragistics.Win.Appearance no-undo.
		appearance46 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance47 as Infragistics.Win.Appearance no-undo.
		appearance47 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance48 as Infragistics.Win.Appearance no-undo.
		appearance48 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance49 as Infragistics.Win.Appearance no-undo.
		appearance49 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance50 as Infragistics.Win.Appearance no-undo.
		appearance50 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance51 as Infragistics.Win.Appearance no-undo.
		appearance51 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance52 as Infragistics.Win.Appearance no-undo.
		appearance52 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance53 as Infragistics.Win.Appearance no-undo.
		appearance53 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance54 as Infragistics.Win.Appearance no-undo.
		appearance54 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance55 as Infragistics.Win.Appearance no-undo.
		appearance55 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance56 as Infragistics.Win.Appearance no-undo.
		appearance56 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab4 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab4 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab5 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab5 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab6 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab6 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab7 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab7 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab8 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab8 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab9 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab9 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab10 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab10 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab11 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab11 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab12 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab12 = new Infragistics.Win.UltraWinTabControl.UltraTab(true).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab13 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab13 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable tableDesc1 as Progress.Data.TableDesc no-undo.
		tableDesc1 = new Progress.Data.TableDesc("eEmployee").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance29 as Infragistics.Win.Appearance no-undo.
		appearance29 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance30 as Infragistics.Win.Appearance no-undo.
		appearance30 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance31 as Infragistics.Win.Appearance no-undo.
		appearance31 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance32 as Infragistics.Win.Appearance no-undo.
		appearance32 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance33 as Infragistics.Win.Appearance no-undo.
		appearance33 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance34 as Infragistics.Win.Appearance no-undo.
		appearance34 = new Infragistics.Win.Appearance().
		this-object:ultraTabPage_PrintSettings_PrintDocument = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:propertyGridPrintDocument = new System.Windows.Forms.PropertyGrid().
		this-object:ultraTabPage_PrintSettings_PrintDialog = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:propertyGridPrintDialog = new System.Windows.Forms.PropertyGrid().
		this-object:ultraTabPage_PrintSettings_PrintGrid = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:propertyGridPrintUltraGrid = new System.Windows.Forms.PropertyGrid().
		this-object:ultraGridPrintGrid = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:ultraTabPage_Main_ComboButtons = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraLabel15 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboCustomButtons = new Infragistics.Win.UltraWinGrid.UltraCombo().
		this-object:ultraLabel14 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraTabPage_Main_CardCompressEvents = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraCheckEditorCardCompressedStateChange_PreventCollapsing = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraCheckEditorCardCompressedStateChange_PreventExpanding = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraGridCardCompressedStateChange = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:ultraLabelCardCompressedStateChange = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraTabPage_Main_HideHeaderRowLayout = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraGridRowLayoutLabelPosition = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:ultraLabel11 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraTabPage_Main_SyncSort = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraCheckEditorSyncrhonousSorting_ShowWaitCursor = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraComboEditorSyncrhonousSorting_ProcessMode = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraLabel13 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraGridSyncrhonousSorting = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:ultraLabel12 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraTabPage_Main_RowSelectorHeader = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraButtonRowSelectorHeaderAppearance = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraComboEditorRowSelectorHeaderStyle = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraLabel9 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraGridRowSelectorHeaderStyle = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:ultraLabel10 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraTabPage_Main_PrintDocument = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraButton_ShowPrintDialog = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraGroupBoxUltraGridPrintDocument = new Infragistics.Win.Misc.UltraGroupBox().
		this-object:ultraTabControl_PrintSettings = new Infragistics.Win.UltraWinTabControl.UltraTabControl().
		this-object:ultraTabSharedControlsPage2 = new Infragistics.Win.UltraWinTabControl.UltraTabSharedControlsPage().
		this-object:ultraLabel16 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraTabPage_Main_LimitToList = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraTextEditorLimitToList_EventLog = new Infragistics.Win.UltraWinEditors.UltraTextEditor().
		this-object:ultraButtonLimitToList_Btn1 = new Infragistics.Win.Misc.UltraButton().
		this-object:ultraCheckEditorLimitToList_RetainFocus = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraCheckEditorLimitToList_Enable = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraLabel5 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboLimitToList = new Infragistics.Win.UltraWinGrid.UltraCombo().
		this-object:ultraLabel6 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraTabPage_Main_CardViewVertScrollbar = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraOptionSetCardVertScrollbar_CardViewBand = new Infragistics.Win.UltraWinEditors.UltraOptionSet().
		this-object:ultraLabel17 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraGridCardVertScrollbar = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:ultraLabel2 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraTabPage_Main_ComboSorting = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraCheckEditorSortInUC_EnableColResizing = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraCheckEditorSortInUC_EnableFiltering = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraCheckEditorSortInUC_EnableSorting = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraCheckEditorSortInUC_AutoFit = new Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		this-object:ultraDropDownSortInUC = new Infragistics.Win.UltraWinGrid.UltraDropDown().
		this-object:ultraLabel4 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraGridSortInUC = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:ultraComboSortInUC = new Infragistics.Win.UltraWinGrid.UltraCombo().
		this-object:ultraLabel3 = new Infragistics.Win.Misc.UltraLabel().
		this-object:btnTitle = new System.Windows.Forms.Button().
		this-object:ultraTabControl_Main = new Infragistics.Win.UltraWinTabControl.UltraTabControl().
		this-object:ultraTabSharedControlsPage1 = new Infragistics.Win.UltraWinTabControl.UltraTabSharedControlsPage().
		this-object:bindingSource1 = new Progress.Data.BindingSource().
		this-object:ultraGridColumnSizingArea = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:ultraLabel8 = new Infragistics.Win.Misc.UltraLabel().
		this-object:ultraComboEditorColumnSizingArea = new Infragistics.Win.UltraWinEditors.UltraComboEditor().
		this-object:ultraTabPage_Main_CellColSizing = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraGridPrintDocument1 = new Infragistics.Win.UltraWinGrid.UltraGridPrintDocument(this-object:components).
		this-object:propertyGrid1 = new System.Windows.Forms.PropertyGrid().
		this-object:ultraPrintPreviewDialog1 = new Infragistics.Win.Printing.UltraPrintPreviewDialog(this-object:components).
		this-object:propertyGrid2 = new System.Windows.Forms.PropertyGrid().
		this-object:ultraTabPage_PrintSettings_PrintDocument:SuspendLayout().
		this-object:ultraTabPage_PrintSettings_PrintDialog:SuspendLayout().
		this-object:ultraTabPage_PrintSettings_PrintGrid:SuspendLayout().
		cast(this-object:ultraGridPrintGrid, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabPage_Main_ComboButtons:SuspendLayout().
		cast(this-object:ultraComboCustomButtons, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabPage_Main_CardCompressEvents:SuspendLayout().
		cast(this-object:ultraGridCardCompressedStateChange, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabPage_Main_HideHeaderRowLayout:SuspendLayout().
		cast(this-object:ultraGridRowLayoutLabelPosition, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabPage_Main_SyncSort:SuspendLayout().
		cast(this-object:ultraComboEditorSyncrhonousSorting_ProcessMode, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraGridSyncrhonousSorting, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabPage_Main_RowSelectorHeader:SuspendLayout().
		cast(this-object:ultraComboEditorRowSelectorHeaderStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraGridRowSelectorHeaderStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabPage_Main_PrintDocument:SuspendLayout().
		cast(this-object:ultraGroupBoxUltraGridPrintDocument, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraGroupBoxUltraGridPrintDocument:SuspendLayout().
		cast(this-object:ultraTabControl_PrintSettings, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabControl_PrintSettings:SuspendLayout().
		this-object:ultraTabPage_Main_LimitToList:SuspendLayout().
		cast(this-object:ultraTextEditorLimitToList_EventLog, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboLimitToList, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabPage_Main_CardViewVertScrollbar:SuspendLayout().
		cast(this-object:ultraOptionSetCardVertScrollbar_CardViewBand, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraGridCardVertScrollbar, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabPage_Main_ComboSorting:SuspendLayout().
		cast(this-object:ultraDropDownSortInUC, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraGridSortInUC, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboSortInUC, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraTabControl_Main, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabControl_Main:SuspendLayout().
		cast(this-object:bindingSource1, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraGridColumnSizingArea, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraComboEditorColumnSizingArea, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabPage_Main_CellColSizing:SuspendLayout().
		this-object:SuspendLayout().
		/*  */
		/* ultraTabPage_PrintSettings_PrintDocument */
		/*  */
		this-object:ultraTabPage_PrintSettings_PrintDocument:Controls:Add(this-object:propertyGrid1).
		this-object:ultraTabPage_PrintSettings_PrintDocument:Controls:Add(this-object:propertyGridPrintDocument).
		this-object:ultraTabPage_PrintSettings_PrintDocument:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPage_PrintSettings_PrintDocument:Name = "ultraTabPage_PrintSettings_PrintDocument".
		this-object:ultraTabPage_PrintSettings_PrintDocument:Size = new System.Drawing.Size(296, 279).
		/*  */
		/* propertyGridPrintDocument */
		/*  */
		this-object:propertyGridPrintDocument:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:propertyGridPrintDocument:LineColor = System.Drawing.SystemColors:ScrollBar.
		this-object:propertyGridPrintDocument:Location = new System.Drawing.Point(0, 0).
		this-object:propertyGridPrintDocument:Name = "propertyGridPrintDocument".
		this-object:propertyGridPrintDocument:Size = new System.Drawing.Size(296, 279).
		this-object:propertyGridPrintDocument:TabIndex = 2.
		this-object:propertyGridPrintDocument:ToolbarVisible = false.
		this-object:propertyGridPrintDocument:UseCompatibleTextRendering = true.
		/*  */
		/* ultraTabPage_PrintSettings_PrintDialog */
		/*  */
		this-object:ultraTabPage_PrintSettings_PrintDialog:Controls:Add(this-object:propertyGrid2).
		this-object:ultraTabPage_PrintSettings_PrintDialog:Controls:Add(this-object:propertyGridPrintDialog).
		this-object:ultraTabPage_PrintSettings_PrintDialog:Location = new System.Drawing.Point(2, 19).
		this-object:ultraTabPage_PrintSettings_PrintDialog:Name = "ultraTabPage_PrintSettings_PrintDialog".
		this-object:ultraTabPage_PrintSettings_PrintDialog:Size = new System.Drawing.Size(296, 279).
		/*  */
		/* propertyGridPrintDialog */
		/*  */
		this-object:propertyGridPrintDialog:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:propertyGridPrintDialog:LineColor = System.Drawing.SystemColors:ScrollBar.
		this-object:propertyGridPrintDialog:Location = new System.Drawing.Point(0, 0).
		this-object:propertyGridPrintDialog:Name = "propertyGridPrintDialog".
		this-object:propertyGridPrintDialog:Size = new System.Drawing.Size(296, 279).
		this-object:propertyGridPrintDialog:TabIndex = 3.
		this-object:propertyGridPrintDialog:ToolbarVisible = false.
		this-object:propertyGridPrintDialog:UseCompatibleTextRendering = true.
		/*  */
		/* ultraTabPage_PrintSettings_PrintGrid */
		/*  */
		this-object:ultraTabPage_PrintSettings_PrintGrid:Controls:Add(this-object:propertyGridPrintUltraGrid).
		this-object:ultraTabPage_PrintSettings_PrintGrid:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPage_PrintSettings_PrintGrid:Name = "ultraTabPage_PrintSettings_PrintGrid".
		this-object:ultraTabPage_PrintSettings_PrintGrid:Size = new System.Drawing.Size(296, 279).
		/*  */
		/* propertyGridPrintUltraGrid */
		/*  */
		this-object:propertyGridPrintUltraGrid:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:propertyGridPrintUltraGrid:LineColor = System.Drawing.SystemColors:ScrollBar.
		this-object:propertyGridPrintUltraGrid:Location = new System.Drawing.Point(0, 0).
		this-object:propertyGridPrintUltraGrid:Name = "propertyGridPrintUltraGrid".
		this-object:propertyGridPrintUltraGrid:SelectedObject = this-object:ultraGridPrintGrid.
		this-object:propertyGridPrintUltraGrid:Size = new System.Drawing.Size(296, 279).
		this-object:propertyGridPrintUltraGrid:TabIndex = 3.
		this-object:propertyGridPrintUltraGrid:ToolbarVisible = false.
		this-object:propertyGridPrintUltraGrid:UseCompatibleTextRendering = true.
		/*  */
		/* ultraGridPrintGrid */
		/*  */
		this-object:ultraGridPrintGrid:Anchor = System.Windows.Forms.AnchorStyles:Top.
		appearance1:BackColor = System.Drawing.Color:White.
		appearance1:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance1:BackGradientStyle = Infragistics.Win.GradientStyle:ForwardDiagonal.
		this-object:ultraGridPrintGrid:DisplayLayout:Appearance = appearance1.
		this-object:ultraGridPrintGrid:DisplayLayout:InterBandSpacing = 10.
		appearance2:BackColor = System.Drawing.Color:Transparent.
		this-object:ultraGridPrintGrid:DisplayLayout:Override:CardAreaAppearance = appearance2.
		appearance3:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance3:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance3:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance3:ForeColor = System.Drawing.Color:White.
		appearance3:TextHAlignAsString = "Left".
		appearance3:ThemedElementAlpha = Infragistics.Win.Alpha:Transparent.
		this-object:ultraGridPrintGrid:DisplayLayout:Override:HeaderAppearance = appearance3.
		this-object:ultraGridPrintGrid:DisplayLayout:Override:HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction:SortMulti.
		appearance4:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		this-object:ultraGridPrintGrid:DisplayLayout:Override:RowAppearance = appearance4.
		appearance5:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance5:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance5:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		this-object:ultraGridPrintGrid:DisplayLayout:Override:RowSelectorAppearance = appearance5.
		this-object:ultraGridPrintGrid:DisplayLayout:Override:RowSelectorWidth = 12.
		appearance6:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(129)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(169)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(226))).
		appearance6:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(221)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(235)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(254))).
		appearance6:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance6:ForeColor = System.Drawing.Color:Black.
		this-object:ultraGridPrintGrid:DisplayLayout:Override:SelectedRowAppearance = appearance6.
		this-object:ultraGridPrintGrid:DisplayLayout:RowConnectorColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		this-object:ultraGridPrintGrid:DisplayLayout:RowConnectorStyle = Infragistics.Win.UltraWinGrid.RowConnectorStyle:Solid.
		this-object:ultraGridPrintGrid:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
		this-object:ultraGridPrintGrid:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:ultraGridPrintGrid:DisplayLayout:UseFixedHeaders = true.
		this-object:ultraGridPrintGrid:Location = new System.Drawing.Point(0, 32).
		this-object:ultraGridPrintGrid:Name = "ultraGridPrintGrid".
		this-object:ultraGridPrintGrid:Size = new System.Drawing.Size(400, 288).
		this-object:ultraGridPrintGrid:TabIndex = 13.
		/*  */
		/* ultraTabPage_Main_ComboButtons */
		/*  */
		this-object:ultraTabPage_Main_ComboButtons:Controls:Add(this-object:ultraLabel15).
		this-object:ultraTabPage_Main_ComboButtons:Controls:Add(this-object:ultraComboCustomButtons).
		this-object:ultraTabPage_Main_ComboButtons:Controls:Add(this-object:ultraLabel14).
		this-object:ultraTabPage_Main_ComboButtons:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPage_Main_ComboButtons:Name = "ultraTabPage_Main_ComboButtons".
		this-object:ultraTabPage_Main_ComboButtons:Size = new System.Drawing.Size(704, 348).
		/*  */
		/* ultraLabel15 */
		/*  */
		this-object:ultraLabel15:Location = new System.Drawing.Point(16, 88).
		this-object:ultraLabel15:Name = "ultraLabel15".
		this-object:ultraLabel15:Size = new System.Drawing.Size(104, 20).
		this-object:ultraLabel15:TabIndex = 16.
		this-object:ultraLabel15:Text = "UltraCombo:".
		/*  */
		/* ultraComboCustomButtons */
		/*  */
		stateEditorButton1:Key = "MyCheckBtn".
		editorButton1:Key = "MyEditorBtn".
		dropDownEditorButton1:Key = "MyDropDownBtn".
		spinEditorButton1:Key = "MyUpDownSpinBtn".
		this-object:ultraComboCustomButtons:ButtonsLeft:Add(stateEditorButton1).
		this-object:ultraComboCustomButtons:ButtonsLeft:Add(editorButton1).
		this-object:ultraComboCustomButtons:ButtonsLeft:Add(dropDownEditorButton1).
		this-object:ultraComboCustomButtons:ButtonsLeft:Add(spinEditorButton1).
		spinEditorButton2:Key = "MyLeftRightSpinBtn".
		spinEditorButton2:Orientation = System.Windows.Forms.Orientation:Horizontal.
		spinEditorButton2:SpinButtonType = Infragistics.Win.SpinButtonTypes:FirstOrLast.
		this-object:ultraComboCustomButtons:ButtonsRight:Add(spinEditorButton2).
		this-object:ultraComboCustomButtons:CharacterCasing = System.Windows.Forms.CharacterCasing:Normal.
		this-object:ultraComboCustomButtons:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
		this-object:ultraComboCustomButtons:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:ultraComboCustomButtons:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Default.
		this-object:ultraComboCustomButtons:Location = new System.Drawing.Point(120, 88).
		this-object:ultraComboCustomButtons:Name = "ultraComboCustomButtons".
		this-object:ultraComboCustomButtons:Size = new System.Drawing.Size(248, 22).
		this-object:ultraComboCustomButtons:TabIndex = 15.
		this-object:ultraComboCustomButtons:EditorSpinButtonClick:subscribe(this-object:ultraComboCustomButtons_EditorSpinButtonClick).
		this-object:ultraComboCustomButtons:EditorButtonClick:subscribe(this-object:ultraComboCustomButtons_EditorButtonClick).
		this-object:ultraComboCustomButtons:BeforeEditorButtonDropDown:subscribe(this-object:ultraComboCustomButtons_BeforeEditorButtonDropDown).
		this-object:ultraComboCustomButtons:BeforeEditorButtonCheckStateChanged:subscribe(this-object:ultraComboCustomButtons_BeforeEditorButtonCheckStateChanged).
		/*  */
		/* ultraLabel14 */
		/*  */
		this-object:ultraLabel14:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:ultraLabel14:Location = new System.Drawing.Point(0, 0).
		this-object:ultraLabel14:Name = "ultraLabel14".
		this-object:ultraLabel14:Size = new System.Drawing.Size(704, 64).
		this-object:ultraLabel14:TabIndex = 14.
		this-object:ultraLabel14:Text = resources:GetString("ultraLabel14.Text").
		/*  */
		/* ultraTabPage_Main_CardCompressEvents */
		/*  */
		this-object:ultraTabPage_Main_CardCompressEvents:Controls:Add(this-object:ultraCheckEditorCardCompressedStateChange_PreventCollapsing).
		this-object:ultraTabPage_Main_CardCompressEvents:Controls:Add(this-object:ultraCheckEditorCardCompressedStateChange_PreventExpanding).
		this-object:ultraTabPage_Main_CardCompressEvents:Controls:Add(this-object:ultraGridCardCompressedStateChange).
		this-object:ultraTabPage_Main_CardCompressEvents:Controls:Add(this-object:ultraLabelCardCompressedStateChange).
		this-object:ultraTabPage_Main_CardCompressEvents:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPage_Main_CardCompressEvents:Name = "ultraTabPage_Main_CardCompressEvents".
		this-object:ultraTabPage_Main_CardCompressEvents:Size = new System.Drawing.Size(704, 348).
		/*  */
		/* ultraCheckEditorCardCompressedStateChange_PreventCollapsing */
		/*  */
		this-object:ultraCheckEditorCardCompressedStateChange_PreventCollapsing:Location = new System.Drawing.Point(320, 56).
		this-object:ultraCheckEditorCardCompressedStateChange_PreventCollapsing:Name = "ultraCheckEditorCardCompressedStateChange_PreventCollapsing".
		this-object:ultraCheckEditorCardCompressedStateChange_PreventCollapsing:Size = new System.Drawing.Size(240, 20).
		this-object:ultraCheckEditorCardCompressedStateChange_PreventCollapsing:TabIndex = 5.
		this-object:ultraCheckEditorCardCompressedStateChange_PreventCollapsing:Text = "Prevent from collapsing cards".
		/*  */
		/* ultraCheckEditorCardCompressedStateChange_PreventExpanding */
		/*  */
		this-object:ultraCheckEditorCardCompressedStateChange_PreventExpanding:Location = new System.Drawing.Point(16, 56).
		this-object:ultraCheckEditorCardCompressedStateChange_PreventExpanding:Name = "ultraCheckEditorCardCompressedStateChange_PreventExpanding".
		this-object:ultraCheckEditorCardCompressedStateChange_PreventExpanding:Size = new System.Drawing.Size(240, 20).
		this-object:ultraCheckEditorCardCompressedStateChange_PreventExpanding:TabIndex = 4.
		this-object:ultraCheckEditorCardCompressedStateChange_PreventExpanding:Text = "Prevent from expanding cards".
		/*  */
		/* ultraGridCardCompressedStateChange */
		/*  */
		this-object:ultraGridCardCompressedStateChange:Anchor = System.Windows.Forms.AnchorStyles:Top.
		appearance7:BackColor = System.Drawing.Color:White.
		this-object:ultraGridCardCompressedStateChange:DisplayLayout:Appearance = appearance7.
		appearance8:BackColor = System.Drawing.Color:Transparent.
		this-object:ultraGridCardCompressedStateChange:DisplayLayout:Override:CardAreaAppearance = appearance8.
		appearance9:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(89)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(135)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(214))).
		appearance9:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(7)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(59)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(150))).
		appearance9:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance9:FontData:BoldAsString = "True".
		appearance9:FontData:Name = "Arial".
		appearance9:FontData:SizeInPoints = 10.
		appearance9:ForeColor = System.Drawing.Color:White.
		appearance9:ThemedElementAlpha = Infragistics.Win.Alpha:Transparent.
		this-object:ultraGridCardCompressedStateChange:DisplayLayout:Override:HeaderAppearance = appearance9.
		this-object:ultraGridCardCompressedStateChange:DisplayLayout:Override:HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction:SortMulti.
		appearance10:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(89)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(135)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(214))).
		appearance10:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(7)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(59)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(150))).
		appearance10:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		this-object:ultraGridCardCompressedStateChange:DisplayLayout:Override:RowSelectorAppearance = appearance10.
		appearance11:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(251)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(230)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(148))).
		appearance11:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(238)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(21))).
		appearance11:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		this-object:ultraGridCardCompressedStateChange:DisplayLayout:Override:SelectedRowAppearance = appearance11.
		this-object:ultraGridCardCompressedStateChange:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
		this-object:ultraGridCardCompressedStateChange:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:ultraGridCardCompressedStateChange:Location = new System.Drawing.Point(0, 88).
		this-object:ultraGridCardCompressedStateChange:Name = "ultraGridCardCompressedStateChange".
		this-object:ultraGridCardCompressedStateChange:Size = new System.Drawing.Size(704, 264).
		this-object:ultraGridCardCompressedStateChange:TabIndex = 3.
		this-object:ultraGridCardCompressedStateChange:AfterCardCompressedStateChanged:subscribe(this-object:ultraGridCardCompressedStateChange_AfterCardCompressedStateChanged).
		this-object:ultraGridCardCompressedStateChange:BeforeCardCompressedStateChanged:subscribe(this-object:ultraGridCardCompressedStateChange_BeforeCardCompressedStateChanged).
		/*  */
		/* ultraLabelCardCompressedStateChange */
		/*  */
		this-object:ultraLabelCardCompressedStateChange:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:ultraLabelCardCompressedStateChange:Location = new System.Drawing.Point(0, 0).
		this-object:ultraLabelCardCompressedStateChange:Name = "ultraLabelCardCompressedStateChange".
		this-object:ultraLabelCardCompressedStateChange:Size = new System.Drawing.Size(704, 40).
		this-object:ultraLabelCardCompressedStateChange:TabIndex = 2.
		this-object:ultraLabelCardCompressedStateChange:Text = "The UltraGrid exposes BeforeCardCompressedStateChanged and AfterCardCompressedStateChanged events. These events are raised when the user expands or collapses a card.".
		/*  */
		/* ultraTabPage_Main_HideHeaderRowLayout */
		/*  */
		this-object:ultraTabPage_Main_HideHeaderRowLayout:Controls:Add(this-object:ultraGridRowLayoutLabelPosition).
		this-object:ultraTabPage_Main_HideHeaderRowLayout:Controls:Add(this-object:ultraLabel11).
		this-object:ultraTabPage_Main_HideHeaderRowLayout:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPage_Main_HideHeaderRowLayout:Name = "ultraTabPage_Main_HideHeaderRowLayout".
		this-object:ultraTabPage_Main_HideHeaderRowLayout:Size = new System.Drawing.Size(704, 348).
		/*  */
		/* ultraGridRowLayoutLabelPosition */
		/*  */
		this-object:ultraGridRowLayoutLabelPosition:Anchor = cast(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
		appearance64:BackColor = System.Drawing.Color:LightYellow.
		appearance64:FontData:BoldAsString = "True".
		appearance64:FontData:SizeInPoints = 10.
		ultraGridColumn1:CellAppearance = appearance64.
		ultraGridColumn1:Header:VisiblePosition = 0.
		ultraGridColumn1:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:None.
		ultraGridColumn1:RowLayoutColumnInfo:OriginX = 0.
		ultraGridColumn1:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn1:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(0, 37).
		ultraGridColumn1:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn1:RowLayoutColumnInfo:SpanY = 6.
		ultraGridColumn2:Header:VisiblePosition = 1.
		ultraGridColumn2:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:None.
		ultraGridColumn2:RowLayoutColumnInfo:OriginX = 2.
		ultraGridColumn2:RowLayoutColumnInfo:OriginY = 2.
		ultraGridColumn2:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn2:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn3:Header:VisiblePosition = 2.
		ultraGridColumn3:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:None.
		ultraGridColumn3:RowLayoutColumnInfo:OriginX = 2.
		ultraGridColumn3:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn3:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(0, 21).
		ultraGridColumn3:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn3:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn4:Header:VisiblePosition = 3.
		ultraGridColumn4:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:None.
		ultraGridColumn4:RowLayoutColumnInfo:OriginX = 6.
		ultraGridColumn4:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn4:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(168, 21).
		ultraGridColumn4:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn4:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn5:Header:VisiblePosition = 4.
		ultraGridColumn5:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:None.
		ultraGridColumn5:RowLayoutColumnInfo:OriginX = 4.
		ultraGridColumn5:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn5:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(144, 21).
		ultraGridColumn5:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn5:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn6:Header:VisiblePosition = 5.
		ultraGridColumn6:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:None.
		ultraGridColumn6:RowLayoutColumnInfo:OriginX = 5.
		ultraGridColumn6:RowLayoutColumnInfo:OriginY = 2.
		ultraGridColumn6:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(129, 0).
		ultraGridColumn6:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn6:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn7:Header:VisiblePosition = 7.
		ultraGridColumn7:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:None.
		ultraGridColumn7:RowLayoutColumnInfo:OriginX = 4.
		ultraGridColumn7:RowLayoutColumnInfo:OriginY = 2.
		ultraGridColumn7:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(85, 0).
		ultraGridColumn7:RowLayoutColumnInfo:SpanX = 1.
		ultraGridColumn7:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn8:Header:VisiblePosition = 8.
		ultraGridColumn8:Hidden = true.
		ultraGridColumn8:RowLayoutColumnInfo:OriginX = 15.
		ultraGridColumn8:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn8:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn8:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn9:Header:VisiblePosition = 9.
		ultraGridColumn9:Hidden = true.
		ultraGridColumn9:RowLayoutColumnInfo:OriginX = 21.
		ultraGridColumn9:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn9:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn9:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn10:Header:VisiblePosition = 11.
		ultraGridColumn10:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:None.
		ultraGridColumn10:RowLayoutColumnInfo:OriginX = 8.
		ultraGridColumn10:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn10:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn10:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn11:Header:VisiblePosition = 13.
		ultraGridColumn11:Hidden = true.
		ultraGridColumn11:RowLayoutColumnInfo:OriginX = 4.
		ultraGridColumn11:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn11:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn11:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn12:Header:VisiblePosition = 15.
		ultraGridColumn12:Hidden = true.
		ultraGridColumn12:RowLayoutColumnInfo:OriginX = 10.
		ultraGridColumn12:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn12:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn12:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn13:Header:VisiblePosition = 17.
		ultraGridColumn13:Hidden = true.
		ultraGridColumn13:RowLayoutColumnInfo:OriginX = 17.
		ultraGridColumn13:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn13:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn13:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn14:Header:VisiblePosition = 18.
		ultraGridColumn14:Hidden = true.
		ultraGridColumn14:RowLayoutColumnInfo:OriginX = 19.
		ultraGridColumn14:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn14:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn14:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn15:Header:VisiblePosition = 19.
		ultraGridColumn15:Hidden = true.
		ultraGridColumn15:RowLayoutColumnInfo:OriginX = 11.
		ultraGridColumn15:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn15:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn15:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn16:Header:VisiblePosition = 20.
		ultraGridColumn16:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:None.
		ultraGridColumn16:RowLayoutColumnInfo:OriginX = 9.
		ultraGridColumn16:RowLayoutColumnInfo:OriginY = 2.
		ultraGridColumn16:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(0, 21).
		ultraGridColumn16:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn16:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn17:Header:VisiblePosition = 6.
		ultraGridColumn17:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:None.
		ultraGridColumn17:RowLayoutColumnInfo:OriginX = 7.
		ultraGridColumn17:RowLayoutColumnInfo:OriginY = 2.
		ultraGridColumn17:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(96, 0).
		ultraGridColumn17:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn17:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn18:Header:VisiblePosition = 21.
		ultraGridColumn18:Hidden = true.
		ultraGridColumn18:RowLayoutColumnInfo:OriginX = 23.
		ultraGridColumn18:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn18:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn18:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn19:Header:VisiblePosition = 22.
		ultraGridColumn19:Hidden = true.
		ultraGridColumn19:RowLayoutColumnInfo:OriginX = 13.
		ultraGridColumn19:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn19:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn19:RowLayoutColumnInfo:SpanY = 2.
		appearance35:FontData:BoldAsString = "True".
		ultraGridColumn20:Header:Appearance = appearance35.
		ultraGridColumn20:Header:Caption = "ID".
		ultraGridColumn20:Header:VisiblePosition = 10.
		ultraGridColumn20:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:LabelOnly.
		ultraGridColumn20:RowLayoutColumnInfo:OriginX = 0.
		ultraGridColumn20:RowLayoutColumnInfo:OriginY = 6.
		ultraGridColumn20:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn20:RowLayoutColumnInfo:SpanY = 2.
		appearance61:FontData:BoldAsString = "True".
		ultraGridColumn21:Header:Appearance = appearance61.
		ultraGridColumn21:Header:Caption = "Last, First Name".
		ultraGridColumn21:Header:VisiblePosition = 12.
		ultraGridColumn21:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:LabelOnly.
		ultraGridColumn21:RowLayoutColumnInfo:OriginX = 2.
		ultraGridColumn21:RowLayoutColumnInfo:OriginY = 6.
		ultraGridColumn21:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn21:RowLayoutColumnInfo:SpanY = 2.
		appearance62:FontData:BoldAsString = "True".
		ultraGridColumn22:Header:Appearance = appearance62.
		ultraGridColumn22:Header:Caption = "Adress".
		ultraGridColumn22:Header:VisiblePosition = 14.
		ultraGridColumn22:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:LabelOnly.
		ultraGridColumn22:RowLayoutColumnInfo:OriginX = 4.
		ultraGridColumn22:RowLayoutColumnInfo:OriginY = 6.
		ultraGridColumn22:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(268, 0).
		ultraGridColumn22:RowLayoutColumnInfo:SpanX = 4.
		ultraGridColumn22:RowLayoutColumnInfo:SpanY = 2.
		appearance63:FontData:BoldAsString = "True".
		ultraGridColumn23:Header:Appearance = appearance63.
		ultraGridColumn23:Header:Caption = "Phones".
		ultraGridColumn23:Header:VisiblePosition = 16.
		ultraGridColumn23:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:LabelOnly.
		ultraGridColumn23:RowLayoutColumnInfo:OriginX = 8.
		ultraGridColumn23:RowLayoutColumnInfo:OriginY = 6.
		ultraGridColumn23:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn23:RowLayoutColumnInfo:SpanY = 2.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		define variable arrayvar0 as System.Object extent 23 no-undo.
		arrayvar0[1] = ultraGridColumn1.
		arrayvar0[2] = ultraGridColumn2.
		arrayvar0[3] = ultraGridColumn3.
		arrayvar0[4] = ultraGridColumn4.
		arrayvar0[5] = ultraGridColumn5.
		arrayvar0[6] = ultraGridColumn6.
		arrayvar0[7] = ultraGridColumn7.
		arrayvar0[8] = ultraGridColumn8.
		arrayvar0[9] = ultraGridColumn9.
		arrayvar0[10] = ultraGridColumn10.
		arrayvar0[11] = ultraGridColumn11.
		arrayvar0[12] = ultraGridColumn12.
		arrayvar0[13] = ultraGridColumn13.
		arrayvar0[14] = ultraGridColumn14.
		arrayvar0[15] = ultraGridColumn15.
		arrayvar0[16] = ultraGridColumn16.
		arrayvar0[17] = ultraGridColumn17.
		arrayvar0[18] = ultraGridColumn18.
		arrayvar0[19] = ultraGridColumn19.
		arrayvar0[20] = ultraGridColumn20.
		arrayvar0[21] = ultraGridColumn21.
		arrayvar0[22] = ultraGridColumn22.
		arrayvar0[23] = ultraGridColumn23.
		ultraGridBand1:Columns:AddRange(arrayvar0).
		ultraGridBand1:UseRowLayout = true.
		this-object:ultraGridRowLayoutLabelPosition:DisplayLayout:BandsSerializer:Add(ultraGridBand1).
		this-object:ultraGridRowLayoutLabelPosition:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
		this-object:ultraGridRowLayoutLabelPosition:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:ultraGridRowLayoutLabelPosition:Location = new System.Drawing.Point(0, 96).
		this-object:ultraGridRowLayoutLabelPosition:Name = "ultraGridRowLayoutLabelPosition".
		this-object:ultraGridRowLayoutLabelPosition:Size = new System.Drawing.Size(704, 224).
		this-object:ultraGridRowLayoutLabelPosition:TabIndex = 9.
		/*  */
		/* ultraLabel11 */
		/*  */
		this-object:ultraLabel11:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:ultraLabel11:Location = new System.Drawing.Point(0, 0).
		this-object:ultraLabel11:Name = "ultraLabel11".
		this-object:ultraLabel11:Size = new System.Drawing.Size(704, 96).
		this-object:ultraLabel11:TabIndex = 8.
		this-object:ultraLabel11:Text = resources:GetString("ultraLabel11.Text").
		/*  */
		/* ultraTabPage_Main_SyncSort */
		/*  */
		this-object:ultraTabPage_Main_SyncSort:Controls:Add(this-object:ultraCheckEditorSyncrhonousSorting_ShowWaitCursor).
		this-object:ultraTabPage_Main_SyncSort:Controls:Add(this-object:ultraComboEditorSyncrhonousSorting_ProcessMode).
		this-object:ultraTabPage_Main_SyncSort:Controls:Add(this-object:ultraLabel13).
		this-object:ultraTabPage_Main_SyncSort:Controls:Add(this-object:ultraGridSyncrhonousSorting).
		this-object:ultraTabPage_Main_SyncSort:Controls:Add(this-object:ultraLabel12).
		this-object:ultraTabPage_Main_SyncSort:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPage_Main_SyncSort:Name = "ultraTabPage_Main_SyncSort".
		this-object:ultraTabPage_Main_SyncSort:Size = new System.Drawing.Size(704, 348).
		/*  */
		/* ultraCheckEditorSyncrhonousSorting_ShowWaitCursor */
		/*  */
		this-object:ultraCheckEditorSyncrhonousSorting_ShowWaitCursor:Checked = true.
		this-object:ultraCheckEditorSyncrhonousSorting_ShowWaitCursor:CheckState = System.Windows.Forms.CheckState:Checked.
		this-object:ultraCheckEditorSyncrhonousSorting_ShowWaitCursor:Location = new System.Drawing.Point(368, 88).
		this-object:ultraCheckEditorSyncrhonousSorting_ShowWaitCursor:Name = "ultraCheckEditorSyncrhonousSorting_ShowWaitCursor".
		this-object:ultraCheckEditorSyncrhonousSorting_ShowWaitCursor:Size = new System.Drawing.Size(312, 20).
		this-object:ultraCheckEditorSyncrhonousSorting_ShowWaitCursor:TabIndex = 14.
		this-object:ultraCheckEditorSyncrhonousSorting_ShowWaitCursor:Text = "Show Wait Cursor While Sorting/Filtering".
		/*  */
		/* ultraComboEditorSyncrhonousSorting_ProcessMode */
		/*  */
		this-object:ultraComboEditorSyncrhonousSorting_ProcessMode:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorSyncrhonousSorting_ProcessMode:Location = new System.Drawing.Point(144, 88).
		this-object:ultraComboEditorSyncrhonousSorting_ProcessMode:Name = "ultraComboEditorSyncrhonousSorting_ProcessMode".
		this-object:ultraComboEditorSyncrhonousSorting_ProcessMode:Size = new System.Drawing.Size(168, 21).
		this-object:ultraComboEditorSyncrhonousSorting_ProcessMode:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorSyncrhonousSorting_ProcessMode:TabIndex = 13.
		/*  */
		/* ultraLabel13 */
		/*  */
		this-object:ultraLabel13:Location = new System.Drawing.Point(16, 88).
		this-object:ultraLabel13:Name = "ultraLabel13".
		this-object:ultraLabel13:Size = new System.Drawing.Size(128, 23).
		this-object:ultraLabel13:TabIndex = 12.
		this-object:ultraLabel13:Text = "ProcessMode: ".
		/*  */
		/* ultraGridSyncrhonousSorting */
		/*  */
		appearance17:BackColor = System.Drawing.Color:WhiteSmoke.
		appearance17:BackColor2 = System.Drawing.Color:White.
		appearance17:BackHatchStyle = Infragistics.Win.BackHatchStyle:LightHorizontal.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:Appearance = appearance17.
		appearance18:BackColor = System.Drawing.Color:White.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:GroupByBox:Appearance = appearance18.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:GroupByBox:BorderStyle = Infragistics.Win.UIElementBorderStyle:Solid.
		appearance19:BackColor = System.Drawing.Color:White.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:GroupByBox:PromptAppearance = appearance19.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:InterBandSpacing = 10.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:Override:BorderStyleHeader = Infragistics.Win.UIElementBorderStyle:Etched.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:Override:BorderStyleRowSelector = Infragistics.Win.UIElementBorderStyle:Solid.
		appearance20:BackColor = System.Drawing.Color:Transparent.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:Override:CardAreaAppearance = appearance20.
		appearance21:BackColor = System.Drawing.Color:LightYellow.
		appearance21:BackColor2 = System.Drawing.Color:PaleGoldenrod.
		appearance21:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:Override:CellAppearance = appearance21.
		appearance22:BackColor = System.Drawing.Color:CornflowerBlue.
		appearance22:BackColor2 = System.Drawing.Color:RoyalBlue.
		appearance22:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance22:FontData:SizeInPoints = 10.
		appearance22:ForeColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(192))).
		appearance22:ThemedElementAlpha = Infragistics.Win.Alpha:Transparent.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:Override:HeaderAppearance = appearance22.
		appearance23:BackColor = System.Drawing.Color:Transparent.
		appearance23:ForeColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(0)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(0)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(192))).
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:Override:RowSelectorAppearance = appearance23.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:Override:RowSelectorWidth = 10.
		appearance24:BackColor = System.Drawing.Color:Navy.
		appearance24:BackGradientStyle = Infragistics.Win.GradientStyle:None.
		appearance24:BackHatchStyle = Infragistics.Win.BackHatchStyle:None.
		appearance24:ForeColor = System.Drawing.Color:White.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:Override:SelectedRowAppearance = appearance24.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:RowConnectorColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(0)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(0)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(192))).
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:RowConnectorStyle = Infragistics.Win.UltraWinGrid.RowConnectorStyle:Solid.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:UseFixedHeaders = true.
		this-object:ultraGridSyncrhonousSorting:DisplayLayout:ViewStyleBand = Infragistics.Win.UltraWinGrid.ViewStyleBand:OutlookGroupBy.
		this-object:ultraGridSyncrhonousSorting:Location = new System.Drawing.Point(0, 120).
		this-object:ultraGridSyncrhonousSorting:Name = "ultraGridSyncrhonousSorting".
		this-object:ultraGridSyncrhonousSorting:Size = new System.Drawing.Size(704, 200).
		this-object:ultraGridSyncrhonousSorting:TabIndex = 11.
		this-object:ultraGridSyncrhonousSorting:BeforeSortChange:subscribe(this-object:ultraGridSyncrhonousSorting_BeforeSortChange).
		this-object:ultraGridSyncrhonousSorting:AfterSortChange:subscribe(this-object:ultraGridSyncrhonousSorting_AfterSortChange).
		/*  */
		/* ultraLabel12 */
		/*  */
		this-object:ultraLabel12:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:ultraLabel12:Location = new System.Drawing.Point(0, 0).
		this-object:ultraLabel12:Name = "ultraLabel12".
		this-object:ultraLabel12:Size = new System.Drawing.Size(704, 80).
		this-object:ultraLabel12:TabIndex = 10.
		this-object:ultraLabel12:Text = resources:GetString("ultraLabel12.Text").
		/*  */
		/* ultraTabPage_Main_RowSelectorHeader */
		/*  */
		this-object:ultraTabPage_Main_RowSelectorHeader:Controls:Add(this-object:ultraButtonRowSelectorHeaderAppearance).
		this-object:ultraTabPage_Main_RowSelectorHeader:Controls:Add(this-object:ultraComboEditorRowSelectorHeaderStyle).
		this-object:ultraTabPage_Main_RowSelectorHeader:Controls:Add(this-object:ultraLabel9).
		this-object:ultraTabPage_Main_RowSelectorHeader:Controls:Add(this-object:ultraGridRowSelectorHeaderStyle).
		this-object:ultraTabPage_Main_RowSelectorHeader:Controls:Add(this-object:ultraLabel10).
		this-object:ultraTabPage_Main_RowSelectorHeader:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPage_Main_RowSelectorHeader:Name = "ultraTabPage_Main_RowSelectorHeader".
		this-object:ultraTabPage_Main_RowSelectorHeader:Size = new System.Drawing.Size(704, 348).
		/*  */
		/* ultraButtonRowSelectorHeaderAppearance */
		/*  */
		this-object:ultraButtonRowSelectorHeaderAppearance:Location = new System.Drawing.Point(360, 72).
		this-object:ultraButtonRowSelectorHeaderAppearance:Name = "ultraButtonRowSelectorHeaderAppearance".
		this-object:ultraButtonRowSelectorHeaderAppearance:Size = new System.Drawing.Size(248, 23).
		this-object:ultraButtonRowSelectorHeaderAppearance:TabIndex = 10.
		this-object:ultraButtonRowSelectorHeaderAppearance:Text = "Row Selector Header Appearance".
		this-object:ultraButtonRowSelectorHeaderAppearance:Click:subscribe(this-object:ultraButtonRowSelectorHeaderAppearance_Click).
		/*  */
		/* ultraComboEditorRowSelectorHeaderStyle */
		/*  */
		this-object:ultraComboEditorRowSelectorHeaderStyle:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorRowSelectorHeaderStyle:Location = new System.Drawing.Point(168, 72).
		this-object:ultraComboEditorRowSelectorHeaderStyle:Name = "ultraComboEditorRowSelectorHeaderStyle".
		this-object:ultraComboEditorRowSelectorHeaderStyle:Size = new System.Drawing.Size(168, 21).
		this-object:ultraComboEditorRowSelectorHeaderStyle:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorRowSelectorHeaderStyle:TabIndex = 9.
		this-object:ultraComboEditorRowSelectorHeaderStyle:ValueChanged:subscribe(this-object:ultraComboEditorRowSelectorHeaderStyle_ValueChanged).
		/*  */
		/* ultraLabel9 */
		/*  */
		this-object:ultraLabel9:Location = new System.Drawing.Point(8, 72).
		this-object:ultraLabel9:Name = "ultraLabel9".
		this-object:ultraLabel9:Size = new System.Drawing.Size(160, 23).
		this-object:ultraLabel9:TabIndex = 8.
		this-object:ultraLabel9:Text = "RowSelectorHeaderStyle:".
		/*  */
		/* ultraGridRowSelectorHeaderStyle */
		/*  */
		this-object:ultraGridRowSelectorHeaderStyle:Anchor = System.Windows.Forms.AnchorStyles:Top.
		appearance25:BackColor = System.Drawing.Color:White.
		this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:Appearance = appearance25.
		this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:InterBandSpacing = 10.
		appearance26:BackColor = System.Drawing.SystemColors:Control.
		appearance26:ThemedElementAlpha = Infragistics.Win.Alpha:Transparent.
		this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:Override:HeaderAppearance = appearance26.
		this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:Override:HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction:SortMulti.
		appearance27:ForeColor = System.Drawing.SystemColors:ActiveCaption.
		this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:Override:RowSelectorAppearance = appearance27.
		appearance28:BackColor = System.Drawing.SystemColors:InactiveCaption.
		this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:Override:SelectedRowAppearance = appearance28.
		this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:RowConnectorColor = System.Drawing.SystemColors:ControlDarkDark.
		this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:RowConnectorStyle = Infragistics.Win.UltraWinGrid.RowConnectorStyle:Dashed.
		this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
		this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:UseFixedHeaders = true.
		this-object:ultraGridRowSelectorHeaderStyle:Location = new System.Drawing.Point(0, 104).
		this-object:ultraGridRowSelectorHeaderStyle:Name = "ultraGridRowSelectorHeaderStyle".
		this-object:ultraGridRowSelectorHeaderStyle:Size = new System.Drawing.Size(704, 248).
		this-object:ultraGridRowSelectorHeaderStyle:TabIndex = 7.
		this-object:ultraGridRowSelectorHeaderStyle:Click:subscribe(this-object:ultraGridRowSelectorHeaderStyle_Click).
		/*  */
		/* ultraLabel10 */
		/*  */
		this-object:ultraLabel10:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:ultraLabel10:Location = new System.Drawing.Point(0, 0).
		this-object:ultraLabel10:Name = "ultraLabel10".
		this-object:ultraLabel10:Size = new System.Drawing.Size(704, 64).
		this-object:ultraLabel10:TabIndex = 6.
		this-object:ultraLabel10:Text = resources:GetString("ultraLabel10.Text").
		/*  */
		/* ultraTabPage_Main_PrintDocument */
		/*  */
		this-object:ultraTabPage_Main_PrintDocument:Controls:Add(this-object:ultraButton_ShowPrintDialog).
		this-object:ultraTabPage_Main_PrintDocument:Controls:Add(this-object:ultraGroupBoxUltraGridPrintDocument).
		this-object:ultraTabPage_Main_PrintDocument:Controls:Add(this-object:ultraGridPrintGrid).
		this-object:ultraTabPage_Main_PrintDocument:Controls:Add(this-object:ultraLabel16).
		this-object:ultraTabPage_Main_PrintDocument:Location = new System.Drawing.Point(0, 122).
		this-object:ultraTabPage_Main_PrintDocument:Name = "ultraTabPage_Main_PrintDocument".
		this-object:ultraTabPage_Main_PrintDocument:Size = new System.Drawing.Size(704, 348).
		/*  */
		/* ultraButton_ShowPrintDialog */
		/*  */
		this-object:ultraButton_ShowPrintDialog:Anchor = System.Windows.Forms.AnchorStyles:Bottom.
		this-object:ultraButton_ShowPrintDialog:Location = new System.Drawing.Point(8, 321).
		this-object:ultraButton_ShowPrintDialog:Name = "ultraButton_ShowPrintDialog".
		this-object:ultraButton_ShowPrintDialog:Size = new System.Drawing.Size(256, 22).
		this-object:ultraButton_ShowPrintDialog:TabIndex = 15.
		this-object:ultraButton_ShowPrintDialog:Text = "Show Print Dialog".
		this-object:ultraButton_ShowPrintDialog:Click:subscribe(this-object:ultraButton_ShowPrintDialog_Click).
		/*  */
		/* ultraGroupBoxUltraGridPrintDocument */
		/*  */
		this-object:ultraGroupBoxUltraGridPrintDocument:Controls:Add(this-object:ultraTabControl_PrintSettings).
		this-object:ultraGroupBoxUltraGridPrintDocument:Location = new System.Drawing.Point(400, 32).
		this-object:ultraGroupBoxUltraGridPrintDocument:Name = "ultraGroupBoxUltraGridPrintDocument".
		this-object:ultraGroupBoxUltraGridPrintDocument:Size = new System.Drawing.Size(304, 320).
		this-object:ultraGroupBoxUltraGridPrintDocument:TabIndex = 14.
		this-object:ultraGroupBoxUltraGridPrintDocument:Text = "Settings".
		this-object:ultraGroupBoxUltraGridPrintDocument:ViewStyle = Infragistics.Win.Misc.GroupBoxViewStyle:VisualStudio2005.
		/*  */
		/* ultraTabControl_PrintSettings */
		/*  */
		this-object:ultraTabControl_PrintSettings:Controls:Add(this-object:ultraTabSharedControlsPage2).
		this-object:ultraTabControl_PrintSettings:Controls:Add(this-object:ultraTabPage_PrintSettings_PrintDocument).
		this-object:ultraTabControl_PrintSettings:Controls:Add(this-object:ultraTabPage_PrintSettings_PrintDialog).
		this-object:ultraTabControl_PrintSettings:Controls:Add(this-object:ultraTabPage_PrintSettings_PrintGrid).
		this-object:ultraTabControl_PrintSettings:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:ultraTabControl_PrintSettings:Location = new System.Drawing.Point(2, 18).
		this-object:ultraTabControl_PrintSettings:Name = "ultraTabControl_PrintSettings".
		this-object:ultraTabControl_PrintSettings:ScrollButtons = Infragistics.Win.UltraWinTabs.TabScrollButtons:None.
		this-object:ultraTabControl_PrintSettings:SharedControlsPage = this-object:ultraTabSharedControlsPage2.
		this-object:ultraTabControl_PrintSettings:ShowTabListButton = Infragistics.Win.DefaultableBoolean:False.
		this-object:ultraTabControl_PrintSettings:Size = new System.Drawing.Size(300, 300).
		this-object:ultraTabControl_PrintSettings:TabIndex = 15.
		this-object:ultraTabControl_PrintSettings:TabLayoutStyle = Infragistics.Win.UltraWinTabs.TabLayoutStyle:SingleRowSizeToFit.
		this-object:ultraTabControl_PrintSettings:TabPadding = new System.Drawing.Size(0, 0).
		this-object:ultraTabControl_PrintSettings:TabPageMargins:Bottom = 0.
		this-object:ultraTabControl_PrintSettings:TabPageMargins:Left = 0.
		this-object:ultraTabControl_PrintSettings:TabPageMargins:Right = 0.
		this-object:ultraTabControl_PrintSettings:TabPageMargins:Top = 0.
		ultraTab1:TabPage = this-object:ultraTabPage_PrintSettings_PrintDocument.
		ultraTab1:Text = "Print Document".
		ultraTab1:ToolTipText = "UltraGridPrintDocument Settings".
		ultraTab2:TabPage = this-object:ultraTabPage_PrintSettings_PrintDialog.
		ultraTab2:Text = "Print Dialog".
		ultraTab2:ToolTipText = "UltraPrintPreviewDialog Settings".
		ultraTab3:TabPage = this-object:ultraTabPage_PrintSettings_PrintGrid.
		ultraTab3:Text = "UltraGrid".
		ultraTab3:ToolTipText = "UltraGrid Settings".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		define variable arrayvar1 as Infragistics.Win.UltraWinTabControl.UltraTab extent 3 no-undo.
		arrayvar1[1] = ultraTab1.
		arrayvar1[2] = ultraTab2.
		arrayvar1[3] = ultraTab3.
		this-object:ultraTabControl_PrintSettings:Tabs:AddRange(arrayvar1).
		this-object:ultraTabControl_PrintSettings:TabsPerRow = 1.
		this-object:ultraTabControl_PrintSettings:ViewStyle = Infragistics.Win.UltraWinTabControl.ViewStyle:VisualStudio2005.
		/*  */
		/* ultraTabSharedControlsPage2 */
		/*  */
		this-object:ultraTabSharedControlsPage2:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabSharedControlsPage2:Name = "ultraTabSharedControlsPage2".
		this-object:ultraTabSharedControlsPage2:Size = new System.Drawing.Size(296, 279).
		/*  */
		/* ultraLabel16 */
		/*  */
		this-object:ultraLabel16:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:ultraLabel16:Location = new System.Drawing.Point(0, 0).
		this-object:ultraLabel16:Name = "ultraLabel16".
		this-object:ultraLabel16:Size = new System.Drawing.Size(704, 32).
		this-object:ultraLabel16:TabIndex = 12.
		this-object:ultraLabel16:Text = "The UltraWinGrid includes the UltraGridPrintDocument as part of the UltraGrid assembly.".
		/*  */
		/* ultraTabPage_Main_LimitToList */
		/*  */
		this-object:ultraTabPage_Main_LimitToList:Controls:Add(this-object:ultraTextEditorLimitToList_EventLog).
		this-object:ultraTabPage_Main_LimitToList:Controls:Add(this-object:ultraButtonLimitToList_Btn1).
		this-object:ultraTabPage_Main_LimitToList:Controls:Add(this-object:ultraCheckEditorLimitToList_RetainFocus).
		this-object:ultraTabPage_Main_LimitToList:Controls:Add(this-object:ultraCheckEditorLimitToList_Enable).
		this-object:ultraTabPage_Main_LimitToList:Controls:Add(this-object:ultraLabel5).
		this-object:ultraTabPage_Main_LimitToList:Controls:Add(this-object:ultraComboLimitToList).
		this-object:ultraTabPage_Main_LimitToList:Controls:Add(this-object:ultraLabel6).
		this-object:ultraTabPage_Main_LimitToList:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPage_Main_LimitToList:Name = "ultraTabPage_Main_LimitToList".
		this-object:ultraTabPage_Main_LimitToList:Size = new System.Drawing.Size(704, 348).
		/*  */
		/* ultraTextEditorLimitToList_EventLog */
		/*  */
		this-object:ultraTextEditorLimitToList_EventLog:AlwaysInEditMode = true.
		this-object:ultraTextEditorLimitToList_EventLog:Anchor = System.Windows.Forms.AnchorStyles:Top.
		this-object:ultraTextEditorLimitToList_EventLog:Location = new System.Drawing.Point(8, 224).
		this-object:ultraTextEditorLimitToList_EventLog:Multiline = true.
		this-object:ultraTextEditorLimitToList_EventLog:Name = "ultraTextEditorLimitToList_EventLog".
		this-object:ultraTextEditorLimitToList_EventLog:Scrollbars = System.Windows.Forms.ScrollBars:Both.
		this-object:ultraTextEditorLimitToList_EventLog:Size = new System.Drawing.Size(688, 120).
		this-object:ultraTextEditorLimitToList_EventLog:TabIndex = 12.
		/*  */
		/* ultraButtonLimitToList_Btn1 */
		/*  */
		this-object:ultraButtonLimitToList_Btn1:Location = new System.Drawing.Point(360, 184).
		this-object:ultraButtonLimitToList_Btn1:Name = "ultraButtonLimitToList_Btn1".
		this-object:ultraButtonLimitToList_Btn1:Size = new System.Drawing.Size(136, 23).
		this-object:ultraButtonLimitToList_Btn1:TabIndex = 11.
		this-object:ultraButtonLimitToList_Btn1:Text = "Button".
		this-object:ultraButtonLimitToList_Btn1:Click:subscribe(this-object:ultraButtonLimitToList_Btn1_Click).
		/*  */
		/* ultraCheckEditorLimitToList_RetainFocus */
		/*  */
		this-object:ultraCheckEditorLimitToList_RetainFocus:Checked = true.
		this-object:ultraCheckEditorLimitToList_RetainFocus:CheckState = System.Windows.Forms.CheckState:Checked.
		this-object:ultraCheckEditorLimitToList_RetainFocus:Location = new System.Drawing.Point(16, 136).
		this-object:ultraCheckEditorLimitToList_RetainFocus:Name = "ultraCheckEditorLimitToList_RetainFocus".
		this-object:ultraCheckEditorLimitToList_RetainFocus:Size = new System.Drawing.Size(512, 20).
		this-object:ultraCheckEditorLimitToList_RetainFocus:TabIndex = 10.
		this-object:ultraCheckEditorLimitToList_RetainFocus:Text = "Retain focus when a value that does not exist in the drop down is entered".
		/*  */
		/* ultraCheckEditorLimitToList_Enable */
		/*  */
		this-object:ultraCheckEditorLimitToList_Enable:Checked = true.
		this-object:ultraCheckEditorLimitToList_Enable:CheckState = System.Windows.Forms.CheckState:Checked.
		this-object:ultraCheckEditorLimitToList_Enable:Location = new System.Drawing.Point(16, 112).
		this-object:ultraCheckEditorLimitToList_Enable:Name = "ultraCheckEditorLimitToList_Enable".
		this-object:ultraCheckEditorLimitToList_Enable:Size = new System.Drawing.Size(512, 20).
		this-object:ultraCheckEditorLimitToList_Enable:TabIndex = 9.
		this-object:ultraCheckEditorLimitToList_Enable:Text = "Enable Limit To List".
		this-object:ultraCheckEditorLimitToList_Enable:CheckedChanged:subscribe(this-object:ultraCheckEditorLimitToList_Enable_CheckedChanged).
		/*  */
		/* ultraLabel5 */
		/*  */
		this-object:ultraLabel5:Location = new System.Drawing.Point(8, 184).
		this-object:ultraLabel5:Name = "ultraLabel5".
		this-object:ultraLabel5:Size = new System.Drawing.Size(104, 20).
		this-object:ultraLabel5:TabIndex = 8.
		this-object:ultraLabel5:Text = "UltraCombo:".
		/*  */
		/* ultraComboLimitToList */
		/*  */
		this-object:ultraComboLimitToList:CharacterCasing = System.Windows.Forms.CharacterCasing:Normal.
		this-object:ultraComboLimitToList:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
		this-object:ultraComboLimitToList:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:ultraComboLimitToList:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Default.
		this-object:ultraComboLimitToList:Location = new System.Drawing.Point(112, 184).
		this-object:ultraComboLimitToList:Name = "ultraComboLimitToList".
		this-object:ultraComboLimitToList:Size = new System.Drawing.Size(216, 22).
		this-object:ultraComboLimitToList:TabIndex = 7.
		this-object:ultraComboLimitToList:ItemNotInList:subscribe(this-object:ultraComboLimitToList_ItemNotInList).
		/*  */
		/* ultraLabel6 */
		/*  */
		this-object:ultraLabel6:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:ultraLabel6:Location = new System.Drawing.Point(0, 0).
		this-object:ultraLabel6:Name = "ultraLabel6".
		this-object:ultraLabel6:Size = new System.Drawing.Size(704, 96).
		this-object:ultraLabel6:TabIndex = 6.
		this-object:ultraLabel6:Text = resources:GetString("ultraLabel6.Text").
		/*  */
		/* ultraTabPage_Main_CardViewVertScrollbar */
		/*  */
		this-object:ultraTabPage_Main_CardViewVertScrollbar:Controls:Add(this-object:ultraOptionSetCardVertScrollbar_CardViewBand).
		this-object:ultraTabPage_Main_CardViewVertScrollbar:Controls:Add(this-object:ultraLabel17).
		this-object:ultraTabPage_Main_CardViewVertScrollbar:Controls:Add(this-object:ultraGridCardVertScrollbar).
		this-object:ultraTabPage_Main_CardViewVertScrollbar:Controls:Add(this-object:ultraLabel2).
		this-object:ultraTabPage_Main_CardViewVertScrollbar:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPage_Main_CardViewVertScrollbar:Name = "ultraTabPage_Main_CardViewVertScrollbar".
		this-object:ultraTabPage_Main_CardViewVertScrollbar:Size = new System.Drawing.Size(704, 348).
		/*  */
		/* ultraOptionSetCardVertScrollbar_CardViewBand */
		/*  */
		this-object:ultraOptionSetCardVertScrollbar_CardViewBand:BorderStyle = Infragistics.Win.UIElementBorderStyle:None.
		this-object:ultraOptionSetCardVertScrollbar_CardViewBand:ItemSpacingHorizontal = 5.
		this-object:ultraOptionSetCardVertScrollbar_CardViewBand:ItemSpacingVertical = 4.
		this-object:ultraOptionSetCardVertScrollbar_CardViewBand:Location = new System.Drawing.Point(112, 80).
		this-object:ultraOptionSetCardVertScrollbar_CardViewBand:Name = "ultraOptionSetCardVertScrollbar_CardViewBand".
		this-object:ultraOptionSetCardVertScrollbar_CardViewBand:Size = new System.Drawing.Size(584, 24).
		this-object:ultraOptionSetCardVertScrollbar_CardViewBand:TabIndex = 11.
		this-object:ultraOptionSetCardVertScrollbar_CardViewBand:ValueChanged:subscribe(this-object:ultraOptionSetCardVertScrollbar_CardViewBand_ValueChanged).
		/*  */
		/* ultraLabel17 */
		/*  */
		this-object:ultraLabel17:Location = new System.Drawing.Point(0, 80).
		this-object:ultraLabel17:Name = "ultraLabel17".
		this-object:ultraLabel17:Size = new System.Drawing.Size(112, 23).
		this-object:ultraLabel17:TabIndex = 2.
		this-object:ultraLabel17:Text = "Card View Band:".
		/*  */
		/* ultraGridCardVertScrollbar */
		/*  */
		this-object:ultraGridCardVertScrollbar:Anchor = System.Windows.Forms.AnchorStyles:Top.
		appearance36:BackColor = System.Drawing.Color:White.
		appearance36:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance36:BackGradientStyle = Infragistics.Win.GradientStyle:ForwardDiagonal.
		this-object:ultraGridCardVertScrollbar:DisplayLayout:Appearance = appearance36.
		this-object:ultraGridCardVertScrollbar:DisplayLayout:InterBandSpacing = 10.
		this-object:ultraGridCardVertScrollbar:DisplayLayout:Override:AllowAddNew = Infragistics.Win.UltraWinGrid.AllowAddNew:TemplateOnBottom.
		appearance37:BackColor = System.Drawing.Color:Transparent.
		this-object:ultraGridCardVertScrollbar:DisplayLayout:Override:CardAreaAppearance = appearance37.
		appearance38:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance38:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		appearance38:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance38:ForeColor = System.Drawing.Color:Black.
		appearance38:TextHAlignAsString = "Left".
		appearance38:ThemedElementAlpha = Infragistics.Win.Alpha:Transparent.
		this-object:ultraGridCardVertScrollbar:DisplayLayout:Override:HeaderAppearance = appearance38.
		this-object:ultraGridCardVertScrollbar:DisplayLayout:Override:HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction:SortMulti.
		appearance39:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		this-object:ultraGridCardVertScrollbar:DisplayLayout:Override:RowAppearance = appearance39.
		appearance40:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance40:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		appearance40:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		this-object:ultraGridCardVertScrollbar:DisplayLayout:Override:RowSelectorAppearance = appearance40.
		this-object:ultraGridCardVertScrollbar:DisplayLayout:Override:RowSelectorWidth = 12.
		appearance41:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		appearance41:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance41:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance41:ForeColor = System.Drawing.Color:Black.
		this-object:ultraGridCardVertScrollbar:DisplayLayout:Override:SelectedRowAppearance = appearance41.
		this-object:ultraGridCardVertScrollbar:DisplayLayout:RowConnectorColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		this-object:ultraGridCardVertScrollbar:DisplayLayout:RowConnectorStyle = Infragistics.Win.UltraWinGrid.RowConnectorStyle:Solid.
		this-object:ultraGridCardVertScrollbar:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
		this-object:ultraGridCardVertScrollbar:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:ultraGridCardVertScrollbar:Location = new System.Drawing.Point(0, 104).
		this-object:ultraGridCardVertScrollbar:Name = "ultraGridCardVertScrollbar".
		this-object:ultraGridCardVertScrollbar:Size = new System.Drawing.Size(704, 248).
		this-object:ultraGridCardVertScrollbar:TabIndex = 1.
		/*  */
		/* ultraLabel2 */
		/*  */
		this-object:ultraLabel2:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:ultraLabel2:Location = new System.Drawing.Point(0, 0).
		this-object:ultraLabel2:Name = "ultraLabel2".
		this-object:ultraLabel2:Size = new System.Drawing.Size(704, 80).
		this-object:ultraLabel2:TabIndex = 0.
		this-object:ultraLabel2:Text = resources:GetString("ultraLabel2.Text").
		/*  */
		/* ultraTabPage_Main_ComboSorting */
		/*  */
		this-object:ultraTabPage_Main_ComboSorting:Controls:Add(this-object:ultraCheckEditorSortInUC_EnableColResizing).
		this-object:ultraTabPage_Main_ComboSorting:Controls:Add(this-object:ultraCheckEditorSortInUC_EnableFiltering).
		this-object:ultraTabPage_Main_ComboSorting:Controls:Add(this-object:ultraCheckEditorSortInUC_EnableSorting).
		this-object:ultraTabPage_Main_ComboSorting:Controls:Add(this-object:ultraCheckEditorSortInUC_AutoFit).
		this-object:ultraTabPage_Main_ComboSorting:Controls:Add(this-object:ultraDropDownSortInUC).
		this-object:ultraTabPage_Main_ComboSorting:Controls:Add(this-object:ultraLabel4).
		this-object:ultraTabPage_Main_ComboSorting:Controls:Add(this-object:ultraGridSortInUC).
		this-object:ultraTabPage_Main_ComboSorting:Controls:Add(this-object:ultraComboSortInUC).
		this-object:ultraTabPage_Main_ComboSorting:Controls:Add(this-object:ultraLabel3).
		this-object:ultraTabPage_Main_ComboSorting:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPage_Main_ComboSorting:Name = "ultraTabPage_Main_ComboSorting".
		this-object:ultraTabPage_Main_ComboSorting:Size = new System.Drawing.Size(704, 348).
		/*  */
		/* ultraCheckEditorSortInUC_EnableColResizing */
		/*  */
		this-object:ultraCheckEditorSortInUC_EnableColResizing:Checked = true.
		this-object:ultraCheckEditorSortInUC_EnableColResizing:CheckState = System.Windows.Forms.CheckState:Checked.
		this-object:ultraCheckEditorSortInUC_EnableColResizing:Location = new System.Drawing.Point(384, 96).
		this-object:ultraCheckEditorSortInUC_EnableColResizing:Name = "ultraCheckEditorSortInUC_EnableColResizing".
		this-object:ultraCheckEditorSortInUC_EnableColResizing:Size = new System.Drawing.Size(224, 20).
		this-object:ultraCheckEditorSortInUC_EnableColResizing:TabIndex = 13.
		this-object:ultraCheckEditorSortInUC_EnableColResizing:Text = "Enable column resizing in dropdowns".
		this-object:ultraCheckEditorSortInUC_EnableColResizing:CheckedChanged:subscribe(this-object:ultraCheckEditorSortInUC_EnableColResizing_CheckedChanged).
		/*  */
		/* ultraCheckEditorSortInUC_EnableFiltering */
		/*  */
		this-object:ultraCheckEditorSortInUC_EnableFiltering:Checked = true.
		this-object:ultraCheckEditorSortInUC_EnableFiltering:CheckState = System.Windows.Forms.CheckState:Checked.
		this-object:ultraCheckEditorSortInUC_EnableFiltering:Location = new System.Drawing.Point(384, 72).
		this-object:ultraCheckEditorSortInUC_EnableFiltering:Name = "ultraCheckEditorSortInUC_EnableFiltering".
		this-object:ultraCheckEditorSortInUC_EnableFiltering:Size = new System.Drawing.Size(224, 20).
		this-object:ultraCheckEditorSortInUC_EnableFiltering:TabIndex = 12.
		this-object:ultraCheckEditorSortInUC_EnableFiltering:Text = "Enable row filtering in dropdowns".
		this-object:ultraCheckEditorSortInUC_EnableFiltering:CheckedChanged:subscribe(this-object:ultraCheckEditorSortInUC_EnableFiltering_CheckedChanged).
		/*  */
		/* ultraCheckEditorSortInUC_EnableSorting */
		/*  */
		this-object:ultraCheckEditorSortInUC_EnableSorting:Checked = true.
		this-object:ultraCheckEditorSortInUC_EnableSorting:CheckState = System.Windows.Forms.CheckState:Checked.
		this-object:ultraCheckEditorSortInUC_EnableSorting:Location = new System.Drawing.Point(384, 48).
		this-object:ultraCheckEditorSortInUC_EnableSorting:Name = "ultraCheckEditorSortInUC_EnableSorting".
		this-object:ultraCheckEditorSortInUC_EnableSorting:Size = new System.Drawing.Size(224, 20).
		this-object:ultraCheckEditorSortInUC_EnableSorting:TabIndex = 11.
		this-object:ultraCheckEditorSortInUC_EnableSorting:Text = "Enable sorting in dropdowns".
		this-object:ultraCheckEditorSortInUC_EnableSorting:CheckedChanged:subscribe(this-object:ultraCheckEditorSortInUC_EnableSorting_CheckedChanged).
		/*  */
		/* ultraCheckEditorSortInUC_AutoFit */
		/*  */
		this-object:ultraCheckEditorSortInUC_AutoFit:Checked = true.
		this-object:ultraCheckEditorSortInUC_AutoFit:CheckState = System.Windows.Forms.CheckState:Checked.
		this-object:ultraCheckEditorSortInUC_AutoFit:Location = new System.Drawing.Point(16, 88).
		this-object:ultraCheckEditorSortInUC_AutoFit:Name = "ultraCheckEditorSortInUC_AutoFit".
		this-object:ultraCheckEditorSortInUC_AutoFit:Size = new System.Drawing.Size(224, 20).
		this-object:ultraCheckEditorSortInUC_AutoFit:TabIndex = 10.
		this-object:ultraCheckEditorSortInUC_AutoFit:Text = "Autofit columns in dropdowns".
		this-object:ultraCheckEditorSortInUC_AutoFit:CheckedChanged:subscribe(this-object:ultraCheckEditorSortInUC_AutoFit_CheckedChanged).
		/*  */
		/* ultraDropDownSortInUC */
		/*  */
		appearance42:BackColor = System.Drawing.Color:White.
		this-object:ultraDropDownSortInUC:DisplayLayout:Appearance = appearance42.
		this-object:ultraDropDownSortInUC:DisplayLayout:InterBandSpacing = 10.
		appearance43:BackColor = System.Drawing.Color:Transparent.
		this-object:ultraDropDownSortInUC:DisplayLayout:Override:CardAreaAppearance = appearance43.
		appearance44:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		this-object:ultraDropDownSortInUC:DisplayLayout:Override:RowAppearance = appearance44.
		appearance45:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance45:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance45:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		this-object:ultraDropDownSortInUC:DisplayLayout:Override:RowSelectorAppearance = appearance45.
		this-object:ultraDropDownSortInUC:DisplayLayout:Override:RowSelectorWidth = 12.
		this-object:ultraDropDownSortInUC:DisplayLayout:RowConnectorColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		this-object:ultraDropDownSortInUC:DisplayLayout:RowConnectorStyle = Infragistics.Win.UltraWinGrid.RowConnectorStyle:Solid.
		this-object:ultraDropDownSortInUC:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
		this-object:ultraDropDownSortInUC:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:ultraDropDownSortInUC:Location = new System.Drawing.Point(448, 160).
		this-object:ultraDropDownSortInUC:Name = "ultraDropDownSortInUC".
		this-object:ultraDropDownSortInUC:Size = new System.Drawing.Size(208, 64).
		this-object:ultraDropDownSortInUC:TabIndex = 6.
		this-object:ultraDropDownSortInUC:Visible = false.
		/*  */
		/* ultraLabel4 */
		/*  */
		this-object:ultraLabel4:Location = new System.Drawing.Point(8, 56).
		this-object:ultraLabel4:Name = "ultraLabel4".
		this-object:ultraLabel4:Size = new System.Drawing.Size(104, 23).
		this-object:ultraLabel4:TabIndex = 5.
		this-object:ultraLabel4:Text = "UltraCombo:".
		/*  */
		/* ultraGridSortInUC */
		/*  */
		this-object:ultraGridSortInUC:Anchor = System.Windows.Forms.AnchorStyles:Top.
		appearance46:BackColor = System.Drawing.Color:White.
		this-object:ultraGridSortInUC:DisplayLayout:Appearance = appearance46.
		this-object:ultraGridSortInUC:DisplayLayout:InterBandSpacing = 10.
		appearance47:BackColor = System.Drawing.Color:Transparent.
		this-object:ultraGridSortInUC:DisplayLayout:Override:CardAreaAppearance = appearance47.
		appearance48:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance48:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance48:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance48:ForeColor = System.Drawing.Color:White.
		appearance48:TextHAlignAsString = "Left".
		appearance48:ThemedElementAlpha = Infragistics.Win.Alpha:Transparent.
		this-object:ultraGridSortInUC:DisplayLayout:Override:HeaderAppearance = appearance48.
		this-object:ultraGridSortInUC:DisplayLayout:Override:HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction:SortMulti.
		appearance49:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		this-object:ultraGridSortInUC:DisplayLayout:Override:RowAppearance = appearance49.
		appearance50:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance50:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance50:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		this-object:ultraGridSortInUC:DisplayLayout:Override:RowSelectorAppearance = appearance50.
		this-object:ultraGridSortInUC:DisplayLayout:Override:RowSelectorWidth = 12.
		appearance51:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(129)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(169)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(226))).
		appearance51:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(221)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(235)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(254))).
		appearance51:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance51:ForeColor = System.Drawing.Color:Black.
		this-object:ultraGridSortInUC:DisplayLayout:Override:SelectedRowAppearance = appearance51.
		this-object:ultraGridSortInUC:DisplayLayout:RowConnectorColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		this-object:ultraGridSortInUC:DisplayLayout:RowConnectorStyle = Infragistics.Win.UltraWinGrid.RowConnectorStyle:Solid.
		this-object:ultraGridSortInUC:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
		this-object:ultraGridSortInUC:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:ultraGridSortInUC:Location = new System.Drawing.Point(0, 128).
		this-object:ultraGridSortInUC:Name = "ultraGridSortInUC".
		this-object:ultraGridSortInUC:Size = new System.Drawing.Size(704, 224).
		this-object:ultraGridSortInUC:TabIndex = 4.
		/*  */
		/* ultraComboSortInUC */
		/*  */
		this-object:ultraComboSortInUC:CharacterCasing = System.Windows.Forms.CharacterCasing:Normal.
		appearance52:BackColor = System.Drawing.Color:White.
		this-object:ultraComboSortInUC:DisplayLayout:Appearance = appearance52.
		this-object:ultraComboSortInUC:DisplayLayout:AutoFitStyle = Infragistics.Win.UltraWinGrid.AutoFitStyle:ResizeAllColumns.
		this-object:ultraComboSortInUC:DisplayLayout:InterBandSpacing = 10.
		appearance53:BackColor = System.Drawing.Color:Transparent.
		this-object:ultraComboSortInUC:DisplayLayout:Override:CardAreaAppearance = appearance53.
		appearance54:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		this-object:ultraComboSortInUC:DisplayLayout:Override:RowAppearance = appearance54.
		appearance55:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance55:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance55:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		this-object:ultraComboSortInUC:DisplayLayout:Override:RowSelectorAppearance = appearance55.
		this-object:ultraComboSortInUC:DisplayLayout:Override:RowSelectorWidth = 12.
		this-object:ultraComboSortInUC:DisplayLayout:RowConnectorColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		this-object:ultraComboSortInUC:DisplayLayout:RowConnectorStyle = Infragistics.Win.UltraWinGrid.RowConnectorStyle:Solid.
		this-object:ultraComboSortInUC:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
		this-object:ultraComboSortInUC:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:ultraComboSortInUC:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Default.
		this-object:ultraComboSortInUC:Location = new System.Drawing.Point(112, 56).
		this-object:ultraComboSortInUC:Name = "ultraComboSortInUC".
		this-object:ultraComboSortInUC:Size = new System.Drawing.Size(216, 22).
		this-object:ultraComboSortInUC:TabIndex = 3.
		/*  */
		/* ultraLabel3 */
		/*  */
		this-object:ultraLabel3:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:ultraLabel3:Location = new System.Drawing.Point(0, 0).
		this-object:ultraLabel3:Name = "ultraLabel3".
		this-object:ultraLabel3:Size = new System.Drawing.Size(704, 48).
		this-object:ultraLabel3:TabIndex = 2.
		this-object:ultraLabel3:Text = resources:GetString("ultraLabel3.Text").
		/*  */
		/* btnTitle */
		/*  */
		this-object:btnTitle:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:btnTitle:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		this-object:btnTitle:Font = new System.Drawing.Font("Arial", 14.25, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		this-object:btnTitle:Location = new System.Drawing.Point(0, 0).
		this-object:btnTitle:Name = "btnTitle".
		this-object:btnTitle:Size = new System.Drawing.Size(704, 32).
		this-object:btnTitle:TabIndex = 18.
		this-object:btnTitle:Text = "Miscellaneous new features in version 5.1".
		this-object:btnTitle:TextAlign = System.Drawing.ContentAlignment:MiddleLeft.
		this-object:btnTitle:UseCompatibleTextRendering = true.
		this-object:btnTitle:MouseUp:subscribe(this-object:btnTitle_MouseUp).
		/*  */
		/* ultraTabControl_Main */
		/*  */
		appearance56:BackColor = System.Drawing.SystemColors:Control.
		appearance56:BackGradientStyle = Infragistics.Win.GradientStyle:None.
		this-object:ultraTabControl_Main:ClientAreaAppearance = appearance56.
		this-object:ultraTabControl_Main:Controls:Add(this-object:ultraTabSharedControlsPage1).
		this-object:ultraTabControl_Main:Controls:Add(this-object:ultraTabPage_Main_CardViewVertScrollbar).
		this-object:ultraTabControl_Main:Controls:Add(this-object:ultraTabPage_Main_ComboSorting).
		this-object:ultraTabControl_Main:Controls:Add(this-object:ultraTabPage_Main_LimitToList).
		this-object:ultraTabControl_Main:Controls:Add(this-object:ultraTabPage_Main_ComboButtons).
		this-object:ultraTabControl_Main:Controls:Add(this-object:ultraTabPage_Main_SyncSort).
		this-object:ultraTabControl_Main:Controls:Add(this-object:ultraTabPage_Main_CardCompressEvents).
		this-object:ultraTabControl_Main:Controls:Add(this-object:ultraTabPage_Main_RowSelectorHeader).
		this-object:ultraTabControl_Main:Controls:Add(this-object:ultraTabPage_Main_CellColSizing).
		this-object:ultraTabControl_Main:Controls:Add(this-object:ultraTabPage_Main_HideHeaderRowLayout).
		this-object:ultraTabControl_Main:Controls:Add(this-object:ultraTabPage_Main_PrintDocument).
		this-object:ultraTabControl_Main:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:ultraTabControl_Main:InterRowSpacing = new Infragistics.Win.DefaultableInteger(3).
		this-object:ultraTabControl_Main:Location = new System.Drawing.Point(0, 32).
		this-object:ultraTabControl_Main:MaxVisibleTabRows = 5.
		this-object:ultraTabControl_Main:Name = "ultraTabControl_Main".
		this-object:ultraTabControl_Main:SharedControlsPage = this-object:ultraTabSharedControlsPage1.
		this-object:ultraTabControl_Main:ShowPartialTabs = Infragistics.Win.DefaultableBoolean:True.
		this-object:ultraTabControl_Main:Size = new System.Drawing.Size(704, 470).
		this-object:ultraTabControl_Main:Style = Infragistics.Win.UltraWinTabControl.UltraTabControlStyle:StateButtons.
		this-object:ultraTabControl_Main:TabIndex = 19.
		this-object:ultraTabControl_Main:TabLayoutStyle = Infragistics.Win.UltraWinTabs.TabLayoutStyle:MultiRowTabsPerRow.
		ultraTab4:TabPage = this-object:ultraTabPage_Main_ComboButtons.
		ultraTab4:Text = "Custom Buttons in UltraCombo".
		ultraTab5:TabPage = this-object:ultraTabPage_Main_CardCompressEvents.
		ultraTab5:Text = "Before/After Card Compress events".
		ultraTab6:TabPage = this-object:ultraTabPage_Main_HideHeaderRowLayout.
		ultraTab6:Text = "Hiding header or cells of a column in row-layout mode".
		ultraTab7:TabPage = this-object:ultraTabPage_Main_SyncSort.
		ultraTab7:Text = "Synchronous Sorting And Filtering".
		ultraTab8:TabPage = this-object:ultraTabPage_Main_RowSelectorHeader.
		ultraTab8:Text = "Row Selector Header".
		ultraTab9:TabPage = this-object:ultraTabPage_Main_PrintDocument.
		ultraTab9:Text = "UltraGrid Print Document".
		ultraTab10:TabPage = this-object:ultraTabPage_Main_LimitToList.
		ultraTab10:Text = "LimitToList support in UltraCombo".
		ultraTab11:TabPage = this-object:ultraTabPage_Main_CellColSizing.
		ultraTab11:Text = "Sizing Columns using Cells".
		ultraTab12:TabPage = this-object:ultraTabPage_Main_CardViewVertScrollbar.
		ultraTab12:Text = "CardView Vertical Scrollbar".
		ultraTab13:TabPage = this-object:ultraTabPage_Main_ComboSorting.
		ultraTab13:Text = "Sorting, Resizing and Filtering in UltraCombo/UltraDropDown".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		define variable arrayvar2 as Infragistics.Win.UltraWinTabControl.UltraTab extent 10 no-undo.
		arrayvar2[1] = ultraTab4.
		arrayvar2[2] = ultraTab5.
		arrayvar2[3] = ultraTab6.
		arrayvar2[4] = ultraTab7.
		arrayvar2[5] = ultraTab8.
		arrayvar2[6] = ultraTab9.
		arrayvar2[7] = ultraTab10.
		arrayvar2[8] = ultraTab11.
		arrayvar2[9] = ultraTab12.
		arrayvar2[10] = ultraTab13.
		this-object:ultraTabControl_Main:Tabs:AddRange(arrayvar2).
		this-object:ultraTabControl_Main:TabsPerRow = 2.
		this-object:ultraTabControl_Main:ViewStyle = Infragistics.Win.UltraWinTabControl.ViewStyle:VisualStudio2005.
		this-object:ultraTabControl_Main:SelectedTabChanged:subscribe(this-object:ultraTabControl_Main_SelectedTabChanged).
		/*  */
		/* ultraTabSharedControlsPage1 */
		/*  */
		this-object:ultraTabSharedControlsPage1:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabSharedControlsPage1:Name = "ultraTabSharedControlsPage1".
		this-object:ultraTabSharedControlsPage1:Size = new System.Drawing.Size(704, 348).
		/*  */
		/* bindingSource1 */
		/*  */
		tableDesc1:ChildTables = ?.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		define variable arrayvar3 as Progress.Data.ColumnPropDesc extent 19 no-undo.
		arrayvar3[1] = new Progress.Data.ColumnPropDesc("EmpNum", "Emp No", Progress.Data.DataType:INTEGER).
		arrayvar3[2] = new Progress.Data.ColumnPropDesc("FirstName", "First Name", Progress.Data.DataType:CHARACTER).
		arrayvar3[3] = new Progress.Data.ColumnPropDesc("LastName", "Last Name", Progress.Data.DataType:CHARACTER).
		arrayvar3[4] = new Progress.Data.ColumnPropDesc("Address", "Address", Progress.Data.DataType:CHARACTER).
		arrayvar3[5] = new Progress.Data.ColumnPropDesc("Address2", "Address2", Progress.Data.DataType:CHARACTER).
		arrayvar3[6] = new Progress.Data.ColumnPropDesc("City", "City", Progress.Data.DataType:CHARACTER).
		arrayvar3[7] = new Progress.Data.ColumnPropDesc("PostalCode", "Postal Code", Progress.Data.DataType:CHARACTER).
		arrayvar3[8] = new Progress.Data.ColumnPropDesc("Birthdate", "Birthdate", Progress.Data.DataType:DATE).
		arrayvar3[9] = new Progress.Data.ColumnPropDesc("DeptCode", "Dept Code", Progress.Data.DataType:CHARACTER).
		arrayvar3[10] = new Progress.Data.ColumnPropDesc("HomePhone", "Home Phone", Progress.Data.DataType:CHARACTER).
		arrayvar3[11] = new Progress.Data.ColumnPropDesc("position", "Position", Progress.Data.DataType:CHARACTER).
		arrayvar3[12] = new Progress.Data.ColumnPropDesc("SickDaysLeft", "Sick Days Left", Progress.Data.DataType:INTEGER).
		arrayvar3[13] = new Progress.Data.ColumnPropDesc("StartDate", "Start Date", Progress.Data.DataType:DATE).
		arrayvar3[14] = new Progress.Data.ColumnPropDesc("State", "State", Progress.Data.DataType:CHARACTER).
		arrayvar3[15] = new Progress.Data.ColumnPropDesc("VacationDaysLeft", "Vacation Days Left", Progress.Data.DataType:INTEGER).
		arrayvar3[16] = new Progress.Data.ColumnPropDesc("WorkPhone", "Work Phone", Progress.Data.DataType:CHARACTER).
		arrayvar3[17] = new Progress.Data.ColumnPropDesc("Country", "Country", Progress.Data.DataType:CHARACTER).
		arrayvar3[18] = new Progress.Data.ColumnPropDesc("Notes", "Notes", Progress.Data.DataType:CHARACTER).
		arrayvar3[19] = new Progress.Data.ColumnPropDesc("Photo", "Photo", Progress.Data.DataType:BLOB).
		tableDesc1:Columns = arrayvar3.
		this-object:bindingSource1:TableSchema = tableDesc1.
		/*  */
		/* ultraGridColumnSizingArea */
		/*  */
		this-object:ultraGridColumnSizingArea:Anchor = System.Windows.Forms.AnchorStyles:Top.
		appearance29:BackColor = System.Drawing.Color:White.
		appearance29:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(168)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(167)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(191))).
		appearance29:BackGradientStyle = Infragistics.Win.GradientStyle:ForwardDiagonal.
		this-object:ultraGridColumnSizingArea:DisplayLayout:Appearance = appearance29.
		this-object:ultraGridColumnSizingArea:DisplayLayout:InterBandSpacing = 10.
		appearance30:BackColor = System.Drawing.Color:Transparent.
		this-object:ultraGridColumnSizingArea:DisplayLayout:Override:CardAreaAppearance = appearance30.
		appearance31:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(247)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(247)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(249))).
		appearance31:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(168)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(167)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(191))).
		appearance31:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance31:ForeColor = System.Drawing.Color:Black.
		appearance31:TextHAlignAsString = "Left".
		appearance31:ThemedElementAlpha = Infragistics.Win.Alpha:Transparent.
		this-object:ultraGridColumnSizingArea:DisplayLayout:Override:HeaderAppearance = appearance31.
		this-object:ultraGridColumnSizingArea:DisplayLayout:Override:HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction:SortMulti.
		appearance32:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(168)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(167)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(191))).
		this-object:ultraGridColumnSizingArea:DisplayLayout:Override:RowAppearance = appearance32.
		appearance33:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(247)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(247)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(249))).
		appearance33:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(168)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(167)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(191))).
		appearance33:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		this-object:ultraGridColumnSizingArea:DisplayLayout:Override:RowSelectorAppearance = appearance33.
		this-object:ultraGridColumnSizingArea:DisplayLayout:Override:RowSelectorWidth = 12.
		appearance34:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(168)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(167)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(191))).
		appearance34:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(247)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(247)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(249))).
		appearance34:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance34:ForeColor = System.Drawing.Color:Black.
		this-object:ultraGridColumnSizingArea:DisplayLayout:Override:SelectedRowAppearance = appearance34.
		this-object:ultraGridColumnSizingArea:DisplayLayout:RowConnectorColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(168)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(167)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(191))).
		this-object:ultraGridColumnSizingArea:DisplayLayout:RowConnectorStyle = Infragistics.Win.UltraWinGrid.RowConnectorStyle:Solid.
		this-object:ultraGridColumnSizingArea:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
		this-object:ultraGridColumnSizingArea:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:ultraGridColumnSizingArea:DisplayLayout:UseFixedHeaders = true.
		this-object:ultraGridColumnSizingArea:Location = new System.Drawing.Point(0, 88).
		this-object:ultraGridColumnSizingArea:Name = "ultraGridColumnSizingArea".
		this-object:ultraGridColumnSizingArea:Size = new System.Drawing.Size(704, 264).
		this-object:ultraGridColumnSizingArea:TabIndex = 3.
		/*  */
		/* ultraLabel8 */
		/*  */
		this-object:ultraLabel8:Location = new System.Drawing.Point(8, 56).
		this-object:ultraLabel8:Name = "ultraLabel8".
		this-object:ultraLabel8:Size = new System.Drawing.Size(128, 23).
		this-object:ultraLabel8:TabIndex = 4.
		this-object:ultraLabel8:Text = "ColumnSizingArea: ".
		/*  */
		/* ultraComboEditorColumnSizingArea */
		/*  */
		this-object:ultraComboEditorColumnSizingArea:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		this-object:ultraComboEditorColumnSizingArea:Location = new System.Drawing.Point(136, 56).
		this-object:ultraComboEditorColumnSizingArea:Name = "ultraComboEditorColumnSizingArea".
		this-object:ultraComboEditorColumnSizingArea:Size = new System.Drawing.Size(168, 21).
		this-object:ultraComboEditorColumnSizingArea:SyncWithCurrencyManager = false.
		this-object:ultraComboEditorColumnSizingArea:TabIndex = 5.
		this-object:ultraComboEditorColumnSizingArea:ValueChanged:subscribe(this-object:ultraComboEditorColumnSizingArea_ValueChanged).
		/*  */
		/* ultraTabPage_Main_CellColSizing */
		/*  */
		this-object:ultraTabPage_Main_CellColSizing:Controls:Add(this-object:ultraComboEditorColumnSizingArea).
		this-object:ultraTabPage_Main_CellColSizing:Controls:Add(this-object:ultraLabel8).
		this-object:ultraTabPage_Main_CellColSizing:Controls:Add(this-object:ultraGridColumnSizingArea).
		this-object:ultraTabPage_Main_CellColSizing:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPage_Main_CellColSizing:Name = "ultraTabPage_Main_CellColSizing".
		this-object:ultraTabPage_Main_CellColSizing:Size = new System.Drawing.Size(704, 348).
		/*  */
		/* ultraGridPrintDocument1 */
		/*  */
		this-object:ultraGridPrintDocument1:Grid = this-object:ultraGridPrintGrid.
		/*  */
		/* propertyGrid1 */
		/*  */
		this-object:propertyGrid1:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:propertyGrid1:LineColor = System.Drawing.SystemColors:ScrollBar.
		this-object:propertyGrid1:Location = new System.Drawing.Point(0, 0).
		this-object:propertyGrid1:Name = "propertyGrid1".
		this-object:propertyGrid1:SelectedObject = this-object:ultraGridPrintDocument1.
		this-object:propertyGrid1:Size = new System.Drawing.Size(296, 279).
		this-object:propertyGrid1:TabIndex = 3.
		this-object:propertyGrid1:ToolbarVisible = false.
		/*  */
		/* ultraPrintPreviewDialog1 */
		/*  */
		this-object:ultraPrintPreviewDialog1:Document = this-object:ultraGridPrintDocument1.
		this-object:ultraPrintPreviewDialog1:Name = "ultraPrintPreviewDialog1".
		/*  */
		/* propertyGrid2 */
		/*  */
		this-object:propertyGrid2:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:propertyGrid2:LineColor = System.Drawing.SystemColors:ScrollBar.
		this-object:propertyGrid2:Location = new System.Drawing.Point(0, 0).
		this-object:propertyGrid2:Name = "propertyGrid2".
		this-object:propertyGrid2:SelectedObject = this-object:ultraPrintPreviewDialog1.
		this-object:propertyGrid2:Size = new System.Drawing.Size(296, 279).
		this-object:propertyGrid2:TabIndex = 4.
		this-object:propertyGrid2:ToolbarVisible = false.
		/*  */
		/* frmMiscFeatures1 */
		/*  */
		this-object:ClientSize = new System.Drawing.Size(704, 502).
		this-object:Controls:Add(this-object:ultraTabControl_Main).
		this-object:Controls:Add(this-object:btnTitle).
		this-object:Name = "frmMiscFeatures1".
		this-object:Text = "frmMiscFeatures1".
		this-object:ultraTabPage_PrintSettings_PrintDocument:ResumeLayout(false).
		this-object:ultraTabPage_PrintSettings_PrintDialog:ResumeLayout(false).
		this-object:ultraTabPage_PrintSettings_PrintGrid:ResumeLayout(false).
		cast(this-object:ultraGridPrintGrid, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabPage_Main_ComboButtons:ResumeLayout(false).
		this-object:ultraTabPage_Main_ComboButtons:PerformLayout().
		cast(this-object:ultraComboCustomButtons, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabPage_Main_CardCompressEvents:ResumeLayout(false).
		cast(this-object:ultraGridCardCompressedStateChange, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabPage_Main_HideHeaderRowLayout:ResumeLayout(false).
		cast(this-object:ultraGridRowLayoutLabelPosition, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabPage_Main_SyncSort:ResumeLayout(false).
		this-object:ultraTabPage_Main_SyncSort:PerformLayout().
		cast(this-object:ultraComboEditorSyncrhonousSorting_ProcessMode, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraGridSyncrhonousSorting, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabPage_Main_RowSelectorHeader:ResumeLayout(false).
		this-object:ultraTabPage_Main_RowSelectorHeader:PerformLayout().
		cast(this-object:ultraComboEditorRowSelectorHeaderStyle, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraGridRowSelectorHeaderStyle, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabPage_Main_PrintDocument:ResumeLayout(false).
		cast(this-object:ultraGroupBoxUltraGridPrintDocument, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraGroupBoxUltraGridPrintDocument:ResumeLayout(false).
		cast(this-object:ultraTabControl_PrintSettings, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabControl_PrintSettings:ResumeLayout(false).
		this-object:ultraTabPage_Main_LimitToList:ResumeLayout(false).
		this-object:ultraTabPage_Main_LimitToList:PerformLayout().
		cast(this-object:ultraTextEditorLimitToList_EventLog, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboLimitToList, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabPage_Main_CardViewVertScrollbar:ResumeLayout(false).
		cast(this-object:ultraOptionSetCardVertScrollbar_CardViewBand, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraGridCardVertScrollbar, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabPage_Main_ComboSorting:ResumeLayout(false).
		this-object:ultraTabPage_Main_ComboSorting:PerformLayout().
		cast(this-object:ultraDropDownSortInUC, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraGridSortInUC, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboSortInUC, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraTabControl_Main, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabControl_Main:ResumeLayout(false).
		cast(this-object:bindingSource1, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraGridColumnSizingArea, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraComboEditorColumnSizingArea, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabPage_Main_CellColSizing:ResumeLayout(false).
		this-object:ultraTabPage_Main_CellColSizing:PerformLayout().
		this-object:ResumeLayout(false).
	end method.

    /* implements ISamplesBase interface  */
    method public void ShowMe( owner as System.Windows.Forms.Form  ):
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
	
	method private UltraGridRow FindRowInBand( rows as RowsCollection, band as UltraGridBand ):
	    define variable row as UltraGridRow no-undo.
	    define variable tmp as UltraGridRow no-undo.
	    define variable iRow as integer no-undo.
	    define variable iBand as integer no-undo.
	    
	    do iRow = 0 to rows:count - 1:
	        row = rows[iRow].
	        if row:Band:Equals(band) then 
				return row.
            if valid-object(row:ChildBands) then
            do:	
				do iBand = 0 to row:ChildBands:Count - 1: 
					tmp = this-object:FindRowInBand(row:ChildBands[iBand]:Rows, band ).
				    if valid-object(tmp) then
						return tmp.
				end.
			end.	
		end.
    	return ?.
	end method.
	
	method private void CreateAppearancePicker():
	    if valid-object(fAppearancePickerForm ) then
		do:
		    fAppearancePickerForm:Close().
			fAppearancePickerForm:Dispose().
		end.
		
		fAppearancePickerForm = new AppearancePicker().
	end method. 
	
	method private Progress.Data.BindingSource GetStatesDataSource():
	    define variable binding as Progress.Data.BindingSource no-undo.
	    if not valid-object(StateService) then
        do:
	        StateService = new StateService().
	        StateService:fetchData().
        end.
        binding = new Progress.Data.BindingSource().
        binding:Handle = StateService:DatasetHandle.
        return binding.
	end.   
	
	method public Progress.Data.BindingSource GetEmployeeDataSource():
	    define variable binding as Progress.Data.BindingSource no-undo.
	    if not valid-object(EmployeeService) then
        do:
	        EmployeeService = new EmployeeService().
	        EmployeeService:fetchData().
        end.
        binding = new Progress.Data.BindingSource().
        binding:Handle = EmployeeService:DatasetHandle.
        return binding.
	end.   
	
	
	method public Progress.Data.BindingSource GetSampleDataSource():
	    define variable binding as Progress.Data.BindingSource no-undo.
	    if not valid-object(SampleService) then
        do:
            /* Add many rows with dummy data. */
	        SampleService = new SampleData(1,4,'integer',10000).
	        SampleService:fetchData().
        end.
        binding = new Progress.Data.BindingSource().
        binding:Handle = SampleService:DatasetHandle.
        return binding.
	end.
	
	method private Progress.Data.BindingSource GetCustomersDataSource():
	    define variable binding as Progress.Data.BindingSource no-undo.
	    if not valid-object(CustOrderService) then
        do:
    	    CustOrderService = new CustOrderService().
    	    CustOrderService:fetchData().
        end.
        binding = new Progress.Data.BindingSource().
        binding:Handle = CustOrderService:DatasetHandle.
        return binding.
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
	METHOD PRIVATE VOID ultraButton_ShowPrintDialog_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	   	/* To print using an UltraGridPrintDocument, associate a grid with the */
		/* document instance. This can be done at design time as well. */
		this-object:ultraGridPrintDocument1:Grid = this-object:ultraGridPrintGrid.

		/* To show print preivew using the UltraPrintPreviewDialog, associate */
		/* a print document with the dialog. this can be done at design time */
		/* as well. */
        this-object:ultraPrintPreviewDialog1:Document = this-object:ultraGridPrintDocument1.

		/* Call ShowDialog to show the print preview dialog. */
		wait-for this-object:ultraPrintPreviewDialog1:ShowDialog( this-object ).	
		RETURN.

	END METHOD.


  	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonRowSelectorHeaderAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		 CreateAppearancePicker(). 
		 
		 fAppearancePickerForm:ShowMe( 
				this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:Override:RowSelectorHeaderAppearance,
				"Row Selector Header Appearance" ).
		RETURN.

	END METHOD.

  	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraCheckEditorSortInUC_AutoFit_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable autoFitCols as logical no-undo.
	    autoFitCols = this-object:ultraCheckEditorSortInUC_AutoFit:Checked.
		this-object:ultraComboSortInUC:DisplayLayout:AutoFitStyle = if autoFitCols then AutoFitStyle:ResizeAllColumns else AutoFitStyle:None.
		this-object:ultraDropDownSortInUC:DisplayLayout:AutoFitStyle = if autoFitCols then AutoFitStyle:ResizeAllColumns else AutoFitStyle:None.
		RETURN.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraCheckEditorSortInUC_EnableColResizing_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable allow as AllowColSizing no-undo.
		if  this-object:ultraCheckEditorSortInUC_EnableColResizing:Checked  then
			allow = AllowColSizing:Free.
    	else
			allow = AllowColSizing:None.
		
		this-object:ultraComboSortInUC:DisplayLayout:Override:AllowColSizing = allow.
		this-object:ultraDropDownSortInUC:DisplayLayout:Override:AllowColSizing = allow.
		
		RETURN.

	END METHOD.

 	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraCheckEditorSortInUC_EnableFiltering_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable allowRowFiltering as DefaultableBoolean  no-undo.
		if  this-object:ultraCheckEditorSortInUC_EnableFiltering:Checked   then
			allowRowFiltering = DefaultableBoolean:True.
		else
			allowRowFiltering = DefaultableBoolean:Default.		 

		this-object:ultraComboSortInUC:DisplayLayout:Override:AllowRowFiltering = allowRowFiltering.
		this-object:ultraDropDownSortInUC:DisplayLayout:Override:AllowRowFiltering = allowRowFiltering.
		
		RETURN.

	END METHOD.

 	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraCheckEditorSortInUC_EnableSorting_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable clickAction as HeaderClickAction no-undo.
		 
		if this-object:ultraCheckEditorSortInUC_EnableSorting:Checked then
		 	/* Set the header click action to SortSingle or SortMulti to disable sorting. */
			clickAction = HeaderClickAction:SortMulti.
	    
		else 
		    /* Set the header click action to Select to disable sorting. */
			clickAction = HeaderClickAction:Select.	

		this-object:ultraComboSortInUC:DisplayLayout:Override:HeaderClickAction = clickAction.
		this-object:ultraDropDownSortInUC:DisplayLayout:Override:HeaderClickAction = clickAction.
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboCustomButtons_BeforeEditorButtonCheckStateChanged( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinEditors.BeforeCheckStateChangedEventArgs ):
		if "MyCheckBtn" = e:Button:Key then 
		do:
			if EnumHelper:AreEqual(CheckState:Checked,e:NewCheckState) then
				this-object:ultraComboCustomButtons:Appearance:BackColor = Color:Red.
	        else
				this-object:ultraComboCustomButtons:Appearance:ResetBackColor( ).
		end.	
		else 
			System.Diagnostics.Debug:Assert( false, "Unknown button was pressed." ).
			

		RETURN.

	END METHOD.


 	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboCustomButtons_BeforeEditorButtonDropDown( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinEditors.BeforeEditorButtonDropDownEventArgs ):
		if "MyDropDownBtn" = e:Button:Key then
        do:
			if this-object:ultraComboCustomButtons:IsDroppedDown then
				/* If the UltraCombo is dropped down then close it up. */
				this-object:ultraComboCustomButtons:PerformAction( UltraComboAction:CloseDropdown ).

			else
				/* Otherwise drop down the UltraCombo. */
				this-object:ultraComboCustomButtons:PerformAction( UltraComboAction:Dropdown ).
		end.             
		else 
			System.Diagnostics.Debug:Assert( false, "Unknown button was pressed." ).
			
		RETURN.

	END METHOD.


 	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboCustomButtons_EditorButtonClick( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinEditors.EditorButtonEventArgs ):	 
		if "MyEditorBtn" = e:Button:Key then 
			/* Clear the contents of the UltraCombo. */
			this-object:ultraComboCustomButtons:Value = ?.
		
		RETURN.

	END METHOD.


 	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboCustomButtons_EditorSpinButtonClick( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinEditors.SpinButtonClickEventArgs ):
		define variable rows as RowsCollection no-undo. 
		define variable currentSelectedRow as UltraGridRow no-undo. 
		define variable newSelectedRow as UltraGridRow no-undo. 
		
		assign
		    rows = this-object:ultraComboCustomButtons:Rows
            currentSelectedRow = this-object:ultraComboCustomButtons:SelectedRow.
		    newSelectedRow = ?.
		
		/* One way you can find out which button was clicked was by checking the Key property. */
		/* Key is something you'd normally set when you add a custom button. This sample project */
		/* sets the keys on all the custom buttons in the designer. */
		if "MyUpDownSpinBtn" = e:Button:Key then
		do:
			if  EnumHelper:AreEqual(SpinButtonItem:NextItem,e:ButtonType) then
            do: 
             	/* Select the next item.*/
				if not valid-object(currentSelectedRow) then
					/* If no row is currently selected, get the first row. */
					newSelectedRow = rows:GetRowAtVisibleIndex( 0 ).
			 
				else
					/* Get the row associated with the next item. */
					newSelectedRow = rows:GetRowAtVisibleIndexOffset( currentSelectedRow, 1 ).
                 
 			end.
 			else
		    do:
				/* Select the previousn item.*/
				if not valid-object(currentSelectedRow) then
				/* If no row is currently selected, get the last row. */
					newSelectedRow = rows:GetRowAtVisibleIndex(rows:VisibleRowCount - 1).
			 
				else
			        /* Get the row associated with the last item. */
					newSelectedRow = rows:GetRowAtVisibleIndexOffset( currentSelectedRow, -1).
   
			end.
		end. /* "MyUpDownSpinBtn" */
		else if "MyLeftRightSpinBtn" = e:Button:Key then
		do:
			if EnumHelper:AreEqual(SpinButtonItem:First,e:ButtonType) then 
				/* Select the first item. */
				newSelectedRow = rows:GetRowAtVisibleIndex( 0 ).
		 
			else	 
				/* Select the last item. */
				newSelectedRow = rows:GetRowAtVisibleIndex( rows:VisibleRowCount - 1 ).
			 
		end. /* "MyLeftRightSpinBtn" */
		else 
			System.Diagnostics.Debug:Assert( false, "Unknown button was pressed." ).
		

		if valid-object(newSelectedRow) then
			this-object:ultraComboCustomButtons:SelectedRow = newSelectedRow.
		
	
		RETURN.

	END METHOD.



	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorColumnSizingArea_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable colSizingArea as ColumnSizingArea no-undo.
		colSizingArea = cast(this-object:ultraComboEditorColumnSizingArea:Value,ColumnSizingArea).
	    this-object:ultraGridColumnSizingArea:DisplayLayout:Override:ColumnSizingArea = colSizingArea.
		RETURN.

	END METHOD.


  	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboEditorRowSelectorHeaderStyle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    define variable style as RowSelectorHeaderStyle no-undo.
	    style = cast(this-object:ultraComboEditorRowSelectorHeaderStyle:Value,RowSelectorHeaderStyle).
		this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:Override:RowSelectorHeaderStyle = style.
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraComboLimitToList_ItemNotInList( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinEditors.ValidationErrorEventArgs ):
		
		e:RetainFocus = this-object:ultraCheckEditorLimitToList_RetainFocus:Checked.
	
		fItemNotInListEventCount = fItemNotInListEventCount + 1.
		this-object:ultraTextEditorLimitToList_EventLog:Text = (if fItemNotInListEventCount = 1 then ""
		                                                        else this-object:ultraTextEditorLimitToList_EventLog:Text 
		                                                            +  "~r~n" )
		                                                       + string(fItemNotInListEventCount) + ": ItemNotInList fired.".
		this-object:ultraTextEditorLimitToList_EventLog:SelectionLength = 0.
		
		this-object:ultraTextEditorLimitToList_EventLog:SelectionStart = length(this-object:ultraTextEditorLimitToList_EventLog:Text).
		this-object:ultraTextEditorLimitToList_EventLog:ScrollToCaret( ).
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraCheckEditorLimitToList_Enable_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		this-object:ultraComboLimitToList:LimitToList = this-object:ultraCheckEditorLimitToList_Enable:Checked.
	
		RETURN.

	END METHOD.

    
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraButtonLimitToList_Btn1_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		DEFINE VARIABLE msg AS CHARACTER NO-UNDO.
		msg = this-object:ultraComboLimitToList:Text.

		if this-object:ultraComboLimitToList:IsItemInList( ) then	
			MessageBox:Show( this-object, "You have selected a valid item: " + msg, "Valid input." ).
		else
			MessageBox:Show( this-object, "You have selected an invalid item: " + msg, "Invalid input." ).
		
		RETURN.

	END METHOD.

    

  	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGridCardCompressedStateChange_AfterCardCompressedStateChanged( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.AfterCardCompressedStateChangedEventArgs ):
		if e:Row:IsCardCompressed then
           Debug:WriteLine( e:Row:CardCaption + " card is expanded." ).
        else  
	       Debug:WriteLine( e:Row:CardCaption + " card is collapsed." ).
     	RETURN.
	END METHOD.

              
 	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGridCardCompressedStateChange_BeforeCardCompressedStateChanged( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.BeforeCardCompressedStateChangedEventArgs ):

		if EnumHelper:AreEqual(CardCompressedState:Expanded,e:NewCompressedState) then
	    do:
			Debug:WriteLine( e:Row:CardCaption + " card is being expanded." ).

			if this-object:ultraCheckEditorCardCompressedStateChange_PreventExpanding:Checked then
				e:Cancel = true.
		end.
		else
		do:
			Debug:WriteLine( e:Row:CardCaption + " card is being collapsed." ).

			if this-object:ultraCheckEditorCardCompressedStateChange_PreventCollapsing:Checked then			
				e:Cancel = true.
		end.
	 
		RETURN.

	END METHOD.



	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGridRowSelectorHeaderStyle_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable mainElem as UIElement no-undo.
		define variable elem     as UIElement no-undo.
		define variable mousePos as Point no-undo.
		define variable result   as DialogResult no-undo.
		define variable  rowlist as System.Array no-undo.
		mainElem = this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:UIElement.
		mousePos = this-object:ultraGridRowSelectorHeaderStyle:PointToClient( Control:MousePosition ).
	    elem = mainElem:ElementFromPoint( mousePos ).
		if valid-object(elem) then
			elem = elem:GetAncestor(TypeHelper:GetType("Infragistics.Win.UltraWinGrid.RowSelectorHeaderUIElement")).
        
        if valid-object(elem) then
		do:
			result = MessageBox:Show( this-object, "Row Selector Header Clicked. Selecting all rows.", "", MessageBoxButtons:OKCancel ).
		 
    		if  EnumHelper:AreEqual(DialogResult:OK,result) then 
    		do: 
    			/* Select all rows. */
     			rowlist = ultraGridRowSelectorHeaderStyle:Rows:All.
     			this-object:ultraGridRowSelectorHeaderStyle:Selected:Rows:AddRange(        
     				cast(rowlist, "Infragistics.Win.UltraWinGrid.UltraGridRow[]")
                    ).
       	    end.
		end.
		 
		RETURN.

	END METHOD.


 	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGridSyncrhonousSorting_AfterSortChange( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.BandEventArgs ):
		System.Windows.Forms.Cursor:Current = System.Windows.Forms.Cursors:Default.
		RETURN.

	END METHOD.


 	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGridSyncrhonousSorting_BeforeSortChange( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.BeforeSortChangeEventArgs ):
		define variable mode as ProcessMode no-undo.
		/* If the ProcessMode is set to Synchronous or SynchronousExpanded then the */ 
		/* UltraGrid will sort the rows before firing AfterSortChange. This lets you */
		/* show a wait cursor. */
		
		mode = cast(this-object:ultraComboEditorSyncrhonousSorting_ProcessMode:Value,ProcessMode).
		e:ProcessMode = mode.

		if this-object:ultraCheckEditorSyncrhonousSorting_ShowWaitCursor:Checked then
			/* Change the cursor to WaitCursor. We are resetting the cursor in the */
			/* AfterSortChange event handler sets it back . */
			System.Windows.Forms.Cursor:Current = System.Windows.Forms.Cursors:WaitCursor.
			
		RETURN.

	END METHOD.


  	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraOptionSetCardVertScrollbar_CardViewBand_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable checkedItem as ValueListItem  no-undo.
		define variable selectedBand as UltraGridBand   no-undo.
		define variable cardBandRow as UltraGridRow   no-undo.
		define variable band0Row as UltraGridRow   no-undo.
		 
		define variable bands as BandsCollection no-undo.
        define variable i as integer no-undo.
        		
		checkedItem = this-object:ultraOptionSetCardVertScrollbar_CardViewBand:CheckedItem.
		selectedBand = cast(checkedItem:DataValue,UltraGridBand).
        bands = selectedBand:Layout:Bands.
		/* First turn off the card-view on all bands. */
		do i = 0 to bands:count - 1: 
			bands[i]:CardView = false.
		end.

		/* Then turn on the card-view on the band currently checked in the option set. */
		selectedBand:CardView = true.

		if valid-object(selectedBand:ParentBand) then
		do:
		    /* If the band selected for card-view is a child band then bring a row from */
			/* that band into view. */
			cardBandRow = this-object:FindRowInBand( selectedBand:Layout:Rows, selectedBand ).
			if valid-object(cardBandRow) then
            do:
			    cardBandRow:ExpandAncestors( ).

			    /* Scroll the top most row into view. */
 			    band0Row = cardBandRow.
 			    do while valid-object(band0Row:ParentRow):
				    band0Row = band0Row:ParentRow.
                end.
				/* Scroll the row into view. */
				selectedBand:Layout:Grid:ActiveRowScrollRegion:ScrollRowIntoView( band0Row ).			end.
		end.
		 
		RETURN.

	END METHOD.


     /*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraTabControl_Main_SelectedTabChanged( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinTabControl.SelectedTabChangedEventArgs ):
		define variable valueList as ValueList no-undo.
		define variable rootBand as UltraGridBand no-undo.
        define variable statesDS as Progress.Data.BindingSource no-undo. 
		define variable gridDS as Progress.Data.BindingSource no-undo. 
		define variable stateCodeColumn as UltraGridColumn no-undo. 
		define variable initialVal as RowSelectorHeaderStyle no-undo.   
		define variable queryHandle as handle no-undo.   
	    define variable bands as BandsCollection no-undo.
				 	 
	    define variable i as integer no-undo. 
		
		if  this-object:ultraTabPage_Main_CardCompressEvents:Equals(e:Tab:TabPage) then
        do:
            /* Initialize if not already initialized the tab that demonstates */ 
			/* BeforeCompressedCardStateChange and AfterCompressedCardStateChange events. */
			if not valid-object(e:Tab:Tag) then
			do:
				/* Initialize the tag of the tab to a non-null value. We are using that as an */
				/* indicator of whether the tab has already been initialized. */
				e:Tab:Tag = new System.object( ).

				/* Initialize the datasource on the grid. */
                this-object:ultraGridCardCompressedStateChange:SetDataBinding( this-object:GetCustomersDataSource( ), "" ).

				/* Get the root band. */
				rootBand = this-object:ultraGridCardCompressedStateChange:DisplayLayout:Bands[0].

				/* Enable card-view on the band. */
				rootBand:CardView = true.

				/* Set the card style to Compressed. This tyle lets you expand and  */
				/* collapse cards. */
				rootBand:CardSettings:Style = CardStyle:Compressed.
			end.
	  	
		end.
		else if this-object:ultraTabPage_Main_CardViewVertScrollbar:equals(e:Tab:TabPage) then
		do:
			/* Initialize if not already initialized the tab that demonstates */ 
			/* BeforeCompressedCardStateChange and AfterCompressedCardStateChange events. */
			if not valid-object(e:Tab:Tag) then
			do:
				/* Initialize the tag of the tab to a non-null value. We are using that as an */
				/* indicator of whether the tab has already been initialized. */
				e:Tab:Tag = new System.object( ).

				/* Initialize the datasource on the grid. */
				this-object:ultraGridCardVertScrollbar:SetDataBinding( this-object:GetCustomersDataSource( ), "" ).

				/* Populate the option set with the bands. This is used to select which */
				/* band has the card-view enabled. */
				valueList = this-object:ultraOptionSetCardVertScrollbar_CardViewBand:ValueList.
				valueList:ValueListItems:Clear( ).
				bands = this-object:ultraGridCardVertScrollbar:DisplayLayout:Bands.
				do i = 0 to bands:Count - 1:				    
				    valueList:ValueListItems:Add( bands[i], bands[i]:Key ) . 
				end.    
		 
				/* Check the first item in the option set. This will fire ValueChanged on the  */
				/* OptionSetEditor which will cause us to enable card-view on that band in */ 
				/* the event handler. */
				this-object:ultraOptionSetCardVertScrollbar_CardViewBand:CheckedIndex = 0.
			end.
		end.
		else if ( this-object:ultraTabPage_Main_CellColSizing:Equals(e:Tab:TabPage)) then
		do:
			/* Initialize if not already initialized the tab that demonstates */ 
			/* BeforeCompressedCardStateChange and AfterCompressedCardStateChange events. */
			if not valid-object(e:Tab:Tag) then
			do:
				/* Initialize the tag of the tab to a non-null value. We are using that as an */
				/* indicator of whether the tab has already been initialized. */
				e:Tab:Tag = new System.object( ).

				/* Initialize the datasource on the grid. */
				this-object:ultraGridColumnSizingArea:SetDataBinding( this-object:GetCustomersDataSource( ), "" ).

				/* Set the column sizing are to EntireColumn. */
				this-object:ultraGridColumnSizingArea:DisplayLayout:Override:ColumnSizingArea = ColumnSizingArea:EntireColumn.

				/* Load the ColumnSizingArea combo and initialize the combo's initial value. */
				this-object:LoadEnumCombo( this-object:ultraComboEditorColumnSizingArea,"Infragistics.Win.UltraWinGrid.ColumnSizingArea").
				this-object:ultraComboEditorColumnSizingArea:Value = this-object:ultraGridColumnSizingArea:DisplayLayout:Override:ColumnSizingArea.
			end.
		end.
		else if ( this-object:ultraTabPage_Main_ComboButtons:Equals(e:Tab:TabPage)) then 
		do:
			/* Initialize if not already initialized the tab that demonstates  */
			/* BeforeCompressedCardStateChange and AfterCompressedCardStateChange events. */
			if not valid-object(e:Tab:Tag) then
			do:
				/* Initialize the tag of the tab to a non-null value. We are using that as an */
				/* indicator of whether the tab has already been initialized. */
				e:Tab:Tag = new System.object( ).

				/* Initialize the datasource on the grid. */
				this-object:ultraComboCustomButtons:SetDataBinding( this-object:GetStatesDataSource( ), "" ).
				this-object:ultraComboCustomButtons:ValueMember = "State".
				this-object:ultraComboCustomButtons:DisplayMember = "StateName".

				/* Custom buttons in this UltraCombo are setup at design time. See ButtonsLeft */
				/* and ButtonsRight properties in the property grid of the ultraComboCustomButtons */
				/* in the designer for more info. Also we are hooking into the EditorButtonClick */
				/* and EditorSpinButtonClick events through the designer as well. The code for */
				/* the associated event handlers can be found below in this file. */
			end.
		end.
		else if ( this-object:ultraTabPage_Main_ComboSorting:Equals(e:Tab:TabPage)) then
		do:
			/* Initialize if not already initialized the tab that demonstates */ 
			/* BeforeCompressedCardStateChange and AfterCompressedCardStateChange events. */
			if not valid-object(e:Tab:Tag) then
			do:
				/* Initialize the tag of the tab to a non-null value. We are using that as an */
				/* indicator of whether the tab has already been initialized. */
				e:Tab:Tag = new System.object( ).
                
				/* Initialize the datasource on the combo and the the drop down to */
				/* the states data source which contains two columns, State and */
				/* StateCode. */
				
				statesDS = this-object:GetStatesDataSource( ).
				this-object:ultraComboSortInUC:SetDataBinding( statesDS, "" ).
				this-object:ultraDropDownSortInUC:SetDataBinding( statesDS, "" ).
 
				/* Initialize the ValueMember and the DisplayMember on the ultracombo */
				/* and the ultra drop down. DisplayMember field values are what gets  */
				/* displayed in the cells. ValueMember field values are what gets put  */
				/* in the datasource. */
				this-object:ultraComboSortInUC:ValueMember = "State".
				this-object:ultraComboSortInUC:DisplayMember = "StateName".
 
				this-object:ultraDropDownSortInUC:ValueMember = "State".
				this-object:ultraDropDownSortInUC:DisplayMember = "StateName".
                		 
                /* Add 5 rows and initialize their values to some random state codes. */
				do i  = 1 to 5:
                    create ttState.
                    state = this-object:ultraComboSortInUC:Rows[random(1,50)]:Cells["State"]:Value. 
                end.    
               
                create query queryHandle.
                queryHandle:add-buffer(buffer ttState:handle).
                queryHandle:query-prepare("preselect each ttState").
                queryHandle:query-open().
			    
				/* Bind it to the grid. */
				gridDs = new Progress.Data.BindingSource().
				gridDs:Handle = queryHandle.
				gridDs:AutoUpdate = true. /* store ui changes */
				this-object:ultraGridSortInUC:DataSource = gridDs.

				stateCodeColumn = this-object:ultraGridSortInUC:DisplayLayout:Bands[0]:Columns["State"].
				/* Attach the UltraDropDown we initialized above to the StateCode */ 
				/* column in the grid. */
				stateCodeColumn:ValueList = this-object:ultraDropDownSortInUC.

				/* Call the event handlers to initialize the properties in the grid based on */
				/* the checked state of the check editors. */
				this-object:ultraCheckEditorSortInUC_AutoFit_CheckedChanged( ?, ? ).
				this-object:ultraCheckEditorSortInUC_EnableColResizing_CheckedChanged( ?, ? ).
				this-object:ultraCheckEditorSortInUC_EnableFiltering_CheckedChanged( ?, ? ).
				this-object:ultraCheckEditorSortInUC_EnableSorting_CheckedChanged( ?, ? ).
			end.
		end.
		else if this-object:ultraTabPage_Main_HideHeaderRowLayout:Equals(e:Tab:TabPage) then 
		do:
			/* Initialize if not already initialized the tab that demonstates  */
			/* BeforeCompressedCardStateChange and AfterCompressedCardStateChange events. */
			if not valid-object(e:Tab:Tag) then
			do:
				/* Initialize the tag of the tab to a non-null value. We are using that as an */
				/* indicator of whether the tab has already been initialized. */
				e:Tab:Tag = new System.object( ).

				/* The layout on the ultraGridRowLayoutLabelPosition grid has been */
				/* defined at design time . */
                ultraGridRowLayoutLabelPosition:DataSource = GetEmployeeDataSource().
				
			end.
		end.
		else if  this-object:ultraTabPage_Main_LimitToList:Equals(e:Tab:TabPage)  then 
		do:
			/* Initialize if not already initialized the tab that demonstates  */
			/* BeforeCompressedCardStateChange and AfterCompressedCardStateChange events. */
			if not valid-object(e:Tab:Tag) then
			do:
				/* Initialize the tag of the tab to a non-null value. We are using that as an */
				/* indicator of whether the tab has already been initialized. */
				e:Tab:Tag = new System.object( ).
                
				/* Initialize the datasource on the combo to a data source that contains */
				/* two columns: StateCode and State. */
				this-object:ultraComboLimitToList:SetDataBinding( this-object:GetStatesDataSource( ), "" ).

				this-object:ultraComboLimitToList:ValueMember = "State".
				this-object:ultraComboLimitToList:DisplayMember = "StateName".

				/* Set LimitToList to true to prevent the user from typeing in a value that  */
				/* does not exist in the drop down list. UltraCombo will retain focus and not */
				/* let the user leave the control when this happens. You can override this */
				/* behavior by hooking into the ItemNotInList event of the UltraCombo. */
				this-object:ultraComboLimitToList:LimitToList = this-object:ultraCheckEditorLimitToList_Enable:Checked.
			end.
		end.
		else if  this-object:ultraTabPage_Main_PrintDocument:Equals(e:Tab:TabPage)  then
		do:
			/* Initialize if not already initialized the tab that demonstates  */
			/* BeforeCompressedCardStateChange and AfterCompressedCardStateChange events. */
			if not valid-object(e:Tab:Tag) then
			do:
				/* Initialize the tag of the tab to a non-null value. We are using that as an */
				/* indicator of whether the tab has already been initialized. */
				e:Tab:Tag = new System.object( ).
                
				/* Initialize the datasource on the grid. */
				this-object:ultraGridPrintGrid:SetDataBinding( this-object:GetCustomersDataSource( ), "" ).
			end.
		end.
		else if  this-object:ultraTabPage_Main_RowSelectorHeader:Equals(e:Tab:TabPage)  then
		do:
			/* Initialize if not already initialized the tab that demonstates */ 
			/* BeforeCompressedCardStateChange and AfterCompressedCardStateChange events. */
			if not valid-object(e:Tab:Tag) then
			do:
				/* Initialize the tag of the tab to a non-null value. We are using that as an */
				/* indicator of whether the tab has already been initialized. */
				e:Tab:Tag = new System.object( ).
                
				/* Initialize the datasource on the grid. */
				this-object:ultraGridRowSelectorHeaderStyle:SetDataBinding( this-object:GetStatesDataSource( ), "" ).

				/* Set the RowSelectorHeaderStyle to SeperateElement. */
				initialVal = RowSelectorHeaderStyle:SeparateElement.
				this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:Override:RowSelectorHeaderStyle = initialVal.

				/* Set the appearance of the row selector header element. This will only apply */
				/* if the RowSelectorHeaderStyle is set to SeperateElement like we've done above. */
				this-object:ultraGridRowSelectorHeaderStyle:DisplayLayout:Override:RowSelectorHeaderAppearance:BackColor = Color:Maroon.

				/* Initialize the combo. */
				this-object:LoadEnumCombo( this-object:ultraComboEditorRowSelectorHeaderStyle,"Infragistics.Win.UltraWinGrid.RowSelectorHeaderStyle").
				this-object:ultraComboEditorRowSelectorHeaderStyle:Value = initialVal.
			end.
		end.
		else if ( this-object:ultraTabPage_Main_SyncSort:Equals(e:Tab:TabPage)) then
		do:
			/* Initialize if not already initialized the tab that demonstrates  */
			/* BeforeCompressedCardStateChange and AfterCompressedCardStateChange events. */
			if not valid-object(e:Tab:Tag) then
			do:
				/* Initialize the tag of the tab to a non-null value. We are using that as an */
				/* indicator of whether the tab has already been initialized. */
				e:Tab:Tag = new System.object( ).
    			this-object:ultraGridSyncrhonousSorting:SetDataBinding( GetSampleDataSource(), "" ). 

				/* Enable row filtering and sorting. */
				this-object:ultraGridSyncrhonousSorting:DisplayLayout:Override:AllowRowFiltering = DefaultableBoolean:True.
				this-object:ultraGridSyncrhonousSorting:DisplayLayout:Override:HeaderClickAction = HeaderClickAction:SortMulti.
				this-object:ultraGridSyncrhonousSorting:DisplayLayout:Override:DefaultColWidth = 120.

				this-object:LoadEnumCombo( this-object:ultraComboEditorSyncrhonousSorting_ProcessMode, "Infragistics.Win.UltraWinGrid.ProcessMode" ).
				this-object:ultraComboEditorSyncrhonousSorting_ProcessMode:Value = ProcessMode:Synchronous.
			end.
		 
		end.		
    	RETURN.

	END METHOD.
	
	DESTRUCTOR PUBLIC frmMiscFeatures1 ( ):

		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.

	END DESTRUCTOR.

END CLASS.