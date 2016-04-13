 
 /*------------------------------------------------------------------------
    File        : frmRowLayout
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Thu Jul 17 12:54:57 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.
USING Infragistics.Win.UltraWinGrid.*. 
using WinGrid.SamplesExplorer.*.

CLASS WinGrid.SamplesExplorer.frmRowLayout INHERITS Form IMPLEMENTS ISamplesBase  : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.
	
   	define public variable btnTitle as System.Windows.Forms.Button no-undo.
	
	define private variable ultraTabControl1 as Infragistics.Win.UltraWinTabControl.UltraTabControl no-undo.
	define private variable ultraTabSharedControlsPage1 as Infragistics.Win.UltraWinTabControl.UltraTabSharedControlsPage no-undo.
	define private variable ultraTabPageControl1 as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraGridEmployeesDesignTime as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable ultraTabPageControl2 as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraGridEmployeesRuntime as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable ultraTabPageControl3 as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraGridCardViewDesignTime as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable ultraTabPageControl4 as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable ultraGridCardViewRuntime as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable ultraTabPageControl5 as Infragistics.Win.UltraWinTabControl.UltraTabPageControl no-undo.
	define private variable panel2 as System.Windows.Forms.Panel no-undo.
	define private variable ultraGridRegularView as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable panel1 as System.Windows.Forms.Panel no-undo.
	define private variable checkBoxWrapHeaderText as System.Windows.Forms.CheckBox no-undo.
	define private variable checkBoxRowAutoSizing as System.Windows.Forms.CheckBox no-undo.
	define private variable groupBoxSizing as System.Windows.Forms.GroupBox no-undo.
	define private variable checkBoxAllowSwapping as System.Windows.Forms.CheckBox no-undo.
	define private variable checkBoxAllowMoving as System.Windows.Forms.CheckBox no-undo.
	define private variable comboBoxCellSpanSizing as System.Windows.Forms.ComboBox no-undo.
	define private variable comboBoxLabelSpanSizing as System.Windows.Forms.ComboBox no-undo.
	define private variable label5 as System.Windows.Forms.Label no-undo.
	define private variable label6 as System.Windows.Forms.Label no-undo.
	define private variable comboBoxCellSizing as System.Windows.Forms.ComboBox no-undo.
	define private variable comboBoxLabelSizing as System.Windows.Forms.ComboBox no-undo.
	define private variable label4 as System.Windows.Forms.Label no-undo.
	define private variable label3 as System.Windows.Forms.Label no-undo.
	define private variable label2 as System.Windows.Forms.Label no-undo.
	define private variable checkBoxUseRowLayout as System.Windows.Forms.CheckBox no-undo.
	define private variable buttonCollapseAllRows as System.Windows.Forms.Button no-undo.
	define private variable buttonExpandAllRows as System.Windows.Forms.Button no-undo.
	define private variable groupBoxLabelStyle as System.Windows.Forms.GroupBox no-undo.
	define private variable label7 as System.Windows.Forms.Label no-undo.
	define private variable radioButtonSeparate as System.Windows.Forms.RadioButton no-undo.
	define private variable radioButtonWithCellData as System.Windows.Forms.RadioButton no-undo.
	define private variable comboBoxLabelPosition as System.Windows.Forms.ComboBox no-undo.
	define private variable label1 as System.Windows.Forms.Label no-undo.
	define private variable comboBoxBands as System.Windows.Forms.ComboBox no-undo.

	define private variable pbsEmployeeSource as Progress.Data.BindingSource no-undo.
	
	/* manual defs */
	define private variable fEmployeeDataSource as DataServices.IDataService no-undo.
	define private variable fCustOrderDataSource as DataServices.IDataService no-undo.
	
	define private variable pbsCustOrderSource as Progress.Data.BindingSource no-undo.
	
	
    /** ISamplesBase properties */
	
	/* Provides a description for the sample. */
	define public property Description as character no-undo 
	get:
	    return "This sample demonstrates the Row Layout functionality.".
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
        
/*        return System.Drawing.Image:FromFile(SamplesPath:GraphicsPath + "/Previews/RowLayout.jpg").*/
        return System.Drawing.Image:FromFile(SEARCH("WinGrid/SamplesExplorer/Graphics/Previews/RowLayout.jpg")).
    end.     

	define private variable ultraToolTipManager1 as Infragistics.Win.UltraWinToolTip.UltraToolTipManager no-undo.
		
	CONSTRUCTOR PUBLIC frmRowLayout (  ):
		
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
		define variable ultraGridBand1 as Infragistics.Win.UltraWinGrid.UltraGridBand no-undo.
		ultraGridBand1 = new Infragistics.Win.UltraWinGrid.UltraGridBand("eEmployee", -1).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn1 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn1 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("EmpNum").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn2 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn2 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("FirstName").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance2 as Infragistics.Win.Appearance no-undo.
		appearance2 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance3 as Infragistics.Win.Appearance no-undo.
		appearance3 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn3 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn3 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("LastName").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance4 as Infragistics.Win.Appearance no-undo.
		appearance4 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance5 as Infragistics.Win.Appearance no-undo.
		appearance5 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn4 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn4 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Address").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance6 as Infragistics.Win.Appearance no-undo.
		appearance6 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance7 as Infragistics.Win.Appearance no-undo.
		appearance7 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn5 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn5 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Address2").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn6 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn6 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("City").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance8 as Infragistics.Win.Appearance no-undo.
		appearance8 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance9 as Infragistics.Win.Appearance no-undo.
		appearance9 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn7 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn7 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("PostalCode").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance10 as Infragistics.Win.Appearance no-undo.
		appearance10 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance11 as Infragistics.Win.Appearance no-undo.
		appearance11 = new Infragistics.Win.Appearance().
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
		define variable appearance12 as Infragistics.Win.Appearance no-undo.
		appearance12 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance13 as Infragistics.Win.Appearance no-undo.
		appearance13 = new Infragistics.Win.Appearance().
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
		define variable appearance14 as Infragistics.Win.Appearance no-undo.
		appearance14 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance15 as Infragistics.Win.Appearance no-undo.
		appearance15 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn18 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn18 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Notes").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance16 as Infragistics.Win.Appearance no-undo.
		appearance16 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance17 as Infragistics.Win.Appearance no-undo.
		appearance17 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn19 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn19 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Photo").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance18 as Infragistics.Win.Appearance no-undo.
		appearance18 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance19 as Infragistics.Win.Appearance no-undo.
		appearance19 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable resources as System.Resources.ResXResourceSet no-undo.
		resources = Progress.Util.ResourceHelper:Load("WinGrid/SamplesExplorer/frmRowLayout.resx", PROPATH).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn20 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn20 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("personalInfo", 0).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance20 as Infragistics.Win.Appearance no-undo.
		appearance20 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn21 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn21 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("addressInfo", 1).
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
		define variable tableDesc1 as Progress.Data.TableDesc no-undo.
		tableDesc1 = new Progress.Data.TableDesc("eEmployee").
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
		define variable ultraGridBand2 as Infragistics.Win.UltraWinGrid.UltraGridBand no-undo.
		ultraGridBand2 = new Infragistics.Win.UltraWinGrid.UltraGridBand("eEmployee", -1).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn22 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn22 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("EmpNum").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn23 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn23 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("FirstName").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn24 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn24 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("LastName").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn25 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn25 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Address").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn26 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn26 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Address2").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn27 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn27 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("City").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn28 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn28 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("PostalCode").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn29 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn29 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Birthdate").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn30 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn30 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("DeptCode").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn31 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn31 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("HomePhone").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn32 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn32 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("position").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn33 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn33 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("SickDaysLeft").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn34 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn34 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("StartDate").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn35 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn35 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("State").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn36 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn36 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("VacationDaysLeft").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn37 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn37 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("WorkPhone").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn38 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn38 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Country").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn39 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn39 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Notes").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridColumn40 as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		ultraGridColumn40 = new Infragistics.Win.UltraWinGrid.UltraGridColumn("Photo").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance27 as Infragistics.Win.Appearance no-undo.
		appearance27 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance28 as Infragistics.Win.Appearance no-undo.
		appearance28 = new Infragistics.Win.Appearance().
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
		define variable appearance57 as Infragistics.Win.Appearance no-undo.
		appearance57 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance58 as Infragistics.Win.Appearance no-undo.
		appearance58 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance59 as Infragistics.Win.Appearance no-undo.
		appearance59 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance60 as Infragistics.Win.Appearance no-undo.
		appearance60 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance61 as Infragistics.Win.Appearance no-undo.
		appearance61 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance62 as Infragistics.Win.Appearance no-undo.
		appearance62 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance63 as Infragistics.Win.Appearance no-undo.
		appearance63 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance64 as Infragistics.Win.Appearance no-undo.
		appearance64 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraGridLayout1 as Infragistics.Win.UltraWinGrid.UltraGridLayout no-undo.
		ultraGridLayout1 = new Infragistics.Win.UltraWinGrid.UltraGridLayout("SampleLayout").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance65 as Infragistics.Win.Appearance no-undo.
		appearance65 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance66 as Infragistics.Win.Appearance no-undo.
		appearance66 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance67 as Infragistics.Win.Appearance no-undo.
		appearance67 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance68 as Infragistics.Win.Appearance no-undo.
		appearance68 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance69 as Infragistics.Win.Appearance no-undo.
		appearance69 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance70 as Infragistics.Win.Appearance no-undo.
		appearance70 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable appearance71 as Infragistics.Win.Appearance no-undo.
		appearance71 = new Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab1 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab1 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab2 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab2 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab3 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab3 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab4 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab4 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable ultraTab5 as Infragistics.Win.UltraWinTabControl.UltraTab no-undo.
		ultraTab5 = new Infragistics.Win.UltraWinTabControl.UltraTab().
		this-object:ultraTabPageControl1 = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraGridEmployeesDesignTime = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:pbsEmployeeSource = new Progress.Data.BindingSource().
		this-object:ultraTabPageControl2 = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraGridEmployeesRuntime = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:ultraTabPageControl3 = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraGridCardViewDesignTime = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:ultraTabPageControl4 = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:ultraGridCardViewRuntime = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:ultraTabPageControl5 = new Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		this-object:panel2 = new System.Windows.Forms.Panel().
		this-object:ultraGridRegularView = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:panel1 = new System.Windows.Forms.Panel().
		this-object:checkBoxWrapHeaderText = new System.Windows.Forms.CheckBox().
		this-object:checkBoxRowAutoSizing = new System.Windows.Forms.CheckBox().
		this-object:groupBoxSizing = new System.Windows.Forms.GroupBox().
		this-object:checkBoxAllowSwapping = new System.Windows.Forms.CheckBox().
		this-object:checkBoxAllowMoving = new System.Windows.Forms.CheckBox().
		this-object:comboBoxCellSpanSizing = new System.Windows.Forms.ComboBox().
		this-object:comboBoxLabelSpanSizing = new System.Windows.Forms.ComboBox().
		this-object:label5 = new System.Windows.Forms.Label().
		this-object:label6 = new System.Windows.Forms.Label().
		this-object:comboBoxCellSizing = new System.Windows.Forms.ComboBox().
		this-object:comboBoxLabelSizing = new System.Windows.Forms.ComboBox().
		this-object:label4 = new System.Windows.Forms.Label().
		this-object:label3 = new System.Windows.Forms.Label().
		this-object:label2 = new System.Windows.Forms.Label().
		this-object:checkBoxUseRowLayout = new System.Windows.Forms.CheckBox().
		this-object:buttonCollapseAllRows = new System.Windows.Forms.Button().
		this-object:buttonExpandAllRows = new System.Windows.Forms.Button().
		this-object:groupBoxLabelStyle = new System.Windows.Forms.GroupBox().
		this-object:label7 = new System.Windows.Forms.Label().
		this-object:radioButtonSeparate = new System.Windows.Forms.RadioButton().
		this-object:radioButtonWithCellData = new System.Windows.Forms.RadioButton().
		this-object:comboBoxLabelPosition = new System.Windows.Forms.ComboBox().
		this-object:label1 = new System.Windows.Forms.Label().
		this-object:comboBoxBands = new System.Windows.Forms.ComboBox().
		this-object:btnTitle = new System.Windows.Forms.Button().
		this-object:ultraTabControl1 = new Infragistics.Win.UltraWinTabControl.UltraTabControl().
		this-object:ultraTabSharedControlsPage1 = new Infragistics.Win.UltraWinTabControl.UltraTabSharedControlsPage().
		this-object:ultraToolTipManager1 = new Infragistics.Win.UltraWinToolTip.UltraToolTipManager(this-object:components).
		this-object:ultraTabPageControl1:SuspendLayout().
		cast(this-object:ultraGridEmployeesDesignTime, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:pbsEmployeeSource, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabPageControl2:SuspendLayout().
		cast(this-object:ultraGridEmployeesRuntime, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabPageControl3:SuspendLayout().
		cast(this-object:ultraGridCardViewDesignTime, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabPageControl4:SuspendLayout().
		cast(this-object:ultraGridCardViewRuntime, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabPageControl5:SuspendLayout().
		this-object:panel2:SuspendLayout().
		cast(this-object:ultraGridRegularView, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:panel1:SuspendLayout().
		this-object:groupBoxSizing:SuspendLayout().
		this-object:groupBoxLabelStyle:SuspendLayout().
		cast(this-object:ultraTabControl1, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraTabControl1:SuspendLayout().
		this-object:SuspendLayout().
		/*  */
		/* ultraTabPageControl1 */
		/*  */
		this-object:ultraTabPageControl1:Controls:Add(this-object:ultraGridEmployeesDesignTime).
		this-object:ultraTabPageControl1:Location = new System.Drawing.Point(2, 21).
		this-object:ultraTabPageControl1:Name = "ultraTabPageControl1".
		this-object:ultraTabPageControl1:Size = new System.Drawing.Size(956, 501).
		/*  */
		/* ultraGridEmployeesDesignTime */
		/*  */
		this-object:ultraGridEmployeesDesignTime:Cursor = System.Windows.Forms.Cursors:Hand.
		this-object:ultraGridEmployeesDesignTime:DataSource = this-object:pbsEmployeeSource.
		appearance1:BackColor = System.Drawing.Color:White.
		appearance1:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance1:BackGradientStyle = Infragistics.Win.GradientStyle:ForwardDiagonal.
		this-object:ultraGridEmployeesDesignTime:DisplayLayout:Appearance = appearance1.
		ultraGridColumn1:Header:VisiblePosition = 0.
		ultraGridColumn1:Hidden = true.
		ultraGridColumn1:RowLayoutColumnInfo:OriginX = 10.
		ultraGridColumn1:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn1:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn1:RowLayoutColumnInfo:SpanY = 2.
		appearance2:TextTrimming = Infragistics.Win.TextTrimming:EllipsisWord.
		ultraGridColumn2:CellAppearance = appearance2.
		appearance3:TextHAlignAsString = "Left".
		ultraGridColumn2:Header:Appearance = appearance3.
		ultraGridColumn2:Header:VisiblePosition = 2.
		ultraGridColumn2:RowLayoutColumnInfo:OriginX = 2.
		ultraGridColumn2:RowLayoutColumnInfo:OriginY = 2.
		ultraGridColumn2:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(120, 26).
		ultraGridColumn2:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn2:RowLayoutColumnInfo:SpanY = 2.
		appearance4:TextTrimming = Infragistics.Win.TextTrimming:EllipsisWord.
		ultraGridColumn3:CellAppearance = appearance4.
		appearance5:TextHAlignAsString = "Left".
		ultraGridColumn3:Header:Appearance = appearance5.
		ultraGridColumn3:Header:VisiblePosition = 1.
		ultraGridColumn3:RowLayoutColumnInfo:OriginX = 2.
		ultraGridColumn3:RowLayoutColumnInfo:OriginY = 4.
		ultraGridColumn3:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(120, 26).
		ultraGridColumn3:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn3:RowLayoutColumnInfo:SpanY = 2.
		appearance6:TextTrimming = Infragistics.Win.TextTrimming:EllipsisWord.
		ultraGridColumn4:CellAppearance = appearance6.
		ultraGridColumn4:CellMultiLine = Infragistics.Win.DefaultableBoolean:True.
		appearance7:TextHAlignAsString = "Left".
		ultraGridColumn4:Header:Appearance = appearance7.
		ultraGridColumn4:Header:VisiblePosition = 4.
		ultraGridColumn4:RowLayoutColumnInfo:OriginX = 4.
		ultraGridColumn4:RowLayoutColumnInfo:OriginY = 2.
		ultraGridColumn4:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(150, 0).
		ultraGridColumn4:RowLayoutColumnInfo:PreferredLabelSize = new System.Drawing.Size(0, 20).
		ultraGridColumn4:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn4:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn5:Header:VisiblePosition = 3.
		ultraGridColumn5:RowLayoutColumnInfo:OriginX = 4.
		ultraGridColumn5:RowLayoutColumnInfo:OriginY = 4.
		ultraGridColumn5:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn5:RowLayoutColumnInfo:SpanY = 2.
		appearance8:TextTrimming = Infragistics.Win.TextTrimming:EllipsisWord.
		ultraGridColumn6:CellAppearance = appearance8.
		appearance9:TextHAlignAsString = "Left".
		ultraGridColumn6:Header:Appearance = appearance9.
		ultraGridColumn6:Header:VisiblePosition = 6.
		ultraGridColumn6:RowLayoutColumnInfo:OriginX = 4.
		ultraGridColumn6:RowLayoutColumnInfo:OriginY = 6.
		ultraGridColumn6:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn6:RowLayoutColumnInfo:SpanY = 2.
		appearance10:TextTrimming = Infragistics.Win.TextTrimming:EllipsisWord.
		ultraGridColumn7:CellAppearance = appearance10.
		appearance11:TextHAlignAsString = "Left".
		ultraGridColumn7:Header:Appearance = appearance11.
		ultraGridColumn7:Header:VisiblePosition = 8.
		ultraGridColumn7:RowLayoutColumnInfo:OriginX = 6.
		ultraGridColumn7:RowLayoutColumnInfo:OriginY = 4.
		ultraGridColumn7:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn7:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn8:Header:VisiblePosition = 5.
		ultraGridColumn8:Hidden = true.
		ultraGridColumn8:RowLayoutColumnInfo:OriginX = 14.
		ultraGridColumn8:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn8:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn8:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn9:Header:VisiblePosition = 7.
		ultraGridColumn9:Hidden = true.
		ultraGridColumn9:RowLayoutColumnInfo:OriginX = 16.
		ultraGridColumn9:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn9:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn9:RowLayoutColumnInfo:SpanY = 2.
		appearance12:TextTrimming = Infragistics.Win.TextTrimming:EllipsisWord.
		ultraGridColumn10:CellAppearance = appearance12.
		appearance13:TextHAlignAsString = "Left".
		ultraGridColumn10:Header:Appearance = appearance13.
		ultraGridColumn10:Header:VisiblePosition = 12.
		ultraGridColumn10:RowLayoutColumnInfo:OriginX = 6.
		ultraGridColumn10:RowLayoutColumnInfo:OriginY = 2.
		ultraGridColumn10:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn10:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn11:Header:VisiblePosition = 9.
		ultraGridColumn11:RowLayoutColumnInfo:OriginX = 2.
		ultraGridColumn11:RowLayoutColumnInfo:OriginY = 6.
		ultraGridColumn11:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn11:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn12:Header:VisiblePosition = 10.
		ultraGridColumn12:Hidden = true.
		ultraGridColumn12:RowLayoutColumnInfo:OriginX = 20.
		ultraGridColumn12:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn12:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn12:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn13:Header:VisiblePosition = 13.
		ultraGridColumn13:Hidden = true.
		ultraGridColumn13:RowLayoutColumnInfo:OriginX = 22.
		ultraGridColumn13:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn13:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn13:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn14:Header:VisiblePosition = 14.
		ultraGridColumn14:Hidden = true.
		ultraGridColumn14:RowLayoutColumnInfo:OriginX = 24.
		ultraGridColumn14:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn14:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn14:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn15:Header:VisiblePosition = 15.
		ultraGridColumn15:Hidden = true.
		ultraGridColumn15:RowLayoutColumnInfo:OriginX = 26.
		ultraGridColumn15:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn15:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn15:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn16:Header:VisiblePosition = 17.
		ultraGridColumn16:Hidden = true.
		ultraGridColumn16:RowLayoutColumnInfo:OriginX = 28.
		ultraGridColumn16:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn16:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn16:RowLayoutColumnInfo:SpanY = 2.
		appearance14:TextTrimming = Infragistics.Win.TextTrimming:EllipsisWord.
		ultraGridColumn17:CellAppearance = appearance14.
		appearance15:TextHAlignAsString = "Left".
		ultraGridColumn17:Header:Appearance = appearance15.
		ultraGridColumn17:Header:VisiblePosition = 11.
		ultraGridColumn17:RowLayoutColumnInfo:OriginX = 6.
		ultraGridColumn17:RowLayoutColumnInfo:OriginY = 6.
		ultraGridColumn17:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn17:RowLayoutColumnInfo:SpanY = 2.
		appearance16:TextTrimming = Infragistics.Win.TextTrimming:EllipsisWord.
		ultraGridColumn18:CellAppearance = appearance16.
		ultraGridColumn18:CellMultiLine = Infragistics.Win.DefaultableBoolean:True.
		appearance17:TextHAlignAsString = "Left".
		ultraGridColumn18:Header:Appearance = appearance17.
		ultraGridColumn18:Header:VisiblePosition = 18.
		ultraGridColumn18:RowLayoutColumnInfo:OriginX = 8.
		ultraGridColumn18:RowLayoutColumnInfo:OriginY = 2.
		ultraGridColumn18:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(300, 80).
		ultraGridColumn18:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn18:RowLayoutColumnInfo:SpanY = 6.
		appearance18:ImageHAlign = Infragistics.Win.HAlign:Center.
		appearance18:ImageVAlign = Infragistics.Win.VAlign:Middle.
		appearance18:TextTrimming = Infragistics.Win.TextTrimming:EllipsisWord.
		ultraGridColumn19:CellAppearance = appearance18.
		appearance19:Image = cast(resources:GetObject("appearance19.Image"), System.Object).
		appearance19:ImageHAlign = Infragistics.Win.HAlign:Left.
		appearance19:ImageVAlign = Infragistics.Win.VAlign:Middle.
		appearance19:TextHAlignAsString = "Left".
		ultraGridColumn19:Header:Appearance = appearance19.
		ultraGridColumn19:Header:VisiblePosition = 16.
		ultraGridColumn19:RowLayoutColumnInfo:OriginX = 0.
		ultraGridColumn19:RowLayoutColumnInfo:OriginY = 2.
		ultraGridColumn19:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(90, 75).
		ultraGridColumn19:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn19:RowLayoutColumnInfo:SpanY = 6.
		ultraGridColumn19:SortIndicator = Infragistics.Win.UltraWinGrid.SortIndicator:Disabled.
		ultraGridColumn20:CellActivation = Infragistics.Win.UltraWinGrid.Activation:Disabled.
		appearance20:TextHAlignAsString = "Center".
		ultraGridColumn20:Header:Appearance = appearance20.
		ultraGridColumn20:Header:Caption = "Personal Info".
		ultraGridColumn20:Header:VisiblePosition = 19.
		ultraGridColumn20:RowLayoutColumnInfo:AllowCellSizing = Infragistics.Win.UltraWinGrid.RowLayoutSizing:None.
		ultraGridColumn20:RowLayoutColumnInfo:MinimumCellSize = new System.Drawing.Size(1, 1).
		ultraGridColumn20:RowLayoutColumnInfo:OriginX = 0.
		ultraGridColumn20:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn20:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(1, 1).
		ultraGridColumn20:RowLayoutColumnInfo:SpanX = 4.
		ultraGridColumn20:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn20:SortIndicator = Infragistics.Win.UltraWinGrid.SortIndicator:Disabled.
		ultraGridColumn21:CellActivation = Infragistics.Win.UltraWinGrid.Activation:Disabled.
		appearance21:TextHAlignAsString = "Center".
		ultraGridColumn21:Header:Appearance = appearance21.
		ultraGridColumn21:Header:Caption = "Address Info".
		ultraGridColumn21:Header:VisiblePosition = 20.
		ultraGridColumn21:RowLayoutColumnInfo:AllowCellSizing = Infragistics.Win.UltraWinGrid.RowLayoutSizing:None.
		ultraGridColumn21:RowLayoutColumnInfo:MinimumCellSize = new System.Drawing.Size(1, 1).
		ultraGridColumn21:RowLayoutColumnInfo:OriginX = 4.
		ultraGridColumn21:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn21:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(1, 1).
		ultraGridColumn21:RowLayoutColumnInfo:SpanX = 6.
		ultraGridColumn21:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn21:SortIndicator = Infragistics.Win.UltraWinGrid.SortIndicator:Disabled.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		define variable arrayvar0 as System.Object extent 21 no-undo.
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
		ultraGridBand1:Columns:AddRange(arrayvar0).
		ultraGridBand1:Override:RowSelectors = Infragistics.Win.DefaultableBoolean:False.
		ultraGridBand1:UseRowLayout = true.
		this-object:ultraGridEmployeesDesignTime:DisplayLayout:BandsSerializer:Add(ultraGridBand1).
		this-object:ultraGridEmployeesDesignTime:DisplayLayout:InterBandSpacing = 10.
		appearance22:BackColor = System.Drawing.Color:Transparent.
		this-object:ultraGridEmployeesDesignTime:DisplayLayout:Override:CardAreaAppearance = appearance22.
		appearance23:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance23:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		appearance23:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance23:ForeColor = System.Drawing.Color:Black.
		appearance23:TextHAlignAsString = "Left".
		appearance23:ThemedElementAlpha = Infragistics.Win.Alpha:Transparent.
		this-object:ultraGridEmployeesDesignTime:DisplayLayout:Override:HeaderAppearance = appearance23.
		this-object:ultraGridEmployeesDesignTime:DisplayLayout:Override:HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction:SortMulti.
		appearance24:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		this-object:ultraGridEmployeesDesignTime:DisplayLayout:Override:RowAppearance = appearance24.
		appearance25:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance25:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		appearance25:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		this-object:ultraGridEmployeesDesignTime:DisplayLayout:Override:RowSelectorAppearance = appearance25.
		this-object:ultraGridEmployeesDesignTime:DisplayLayout:Override:RowSelectorWidth = 12.
		this-object:ultraGridEmployeesDesignTime:DisplayLayout:Override:RowSpacingBefore = 2.
		appearance26:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		appearance26:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance26:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance26:ForeColor = System.Drawing.Color:Black.
		this-object:ultraGridEmployeesDesignTime:DisplayLayout:Override:SelectedRowAppearance = appearance26.
		this-object:ultraGridEmployeesDesignTime:DisplayLayout:RowConnectorColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		this-object:ultraGridEmployeesDesignTime:DisplayLayout:RowConnectorStyle = Infragistics.Win.UltraWinGrid.RowConnectorStyle:Solid.
		this-object:ultraGridEmployeesDesignTime:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:ultraGridEmployeesDesignTime:Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		this-object:ultraGridEmployeesDesignTime:Location = new System.Drawing.Point(0, 0).
		this-object:ultraGridEmployeesDesignTime:Name = "ultraGridEmployeesDesignTime".
		this-object:ultraGridEmployeesDesignTime:Size = new System.Drawing.Size(956, 501).
		this-object:ultraGridEmployeesDesignTime:TabIndex = 0.
		this-object:ultraGridEmployeesDesignTime:Text = "Employees (The row layout for this grid was created in the designer)".
		this-object:ultraGridEmployeesDesignTime:InitializeLayout:subscribe(this-object:ultraGridEmployeesDesignTime_InitializeLayout).
		/*  */
		/* pbsEmployeeSource */
		/*  */
		tableDesc1:ChildTables = ?.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		define variable arrayvar1 as Progress.Data.ColumnPropDesc extent 19 no-undo.
		arrayvar1[1] = new Progress.Data.ColumnPropDesc("EmpNum", "Emp No", Progress.Data.DataType:INTEGER).
		arrayvar1[2] = new Progress.Data.ColumnPropDesc("FirstName", "First Name", Progress.Data.DataType:CHARACTER).
		arrayvar1[3] = new Progress.Data.ColumnPropDesc("LastName", "Last Name", Progress.Data.DataType:CHARACTER).
		arrayvar1[4] = new Progress.Data.ColumnPropDesc("Address", "Address", Progress.Data.DataType:CHARACTER).
		arrayvar1[5] = new Progress.Data.ColumnPropDesc("Address2", "Address2", Progress.Data.DataType:CHARACTER).
		arrayvar1[6] = new Progress.Data.ColumnPropDesc("City", "City", Progress.Data.DataType:CHARACTER).
		arrayvar1[7] = new Progress.Data.ColumnPropDesc("PostalCode", "Postal Code", Progress.Data.DataType:CHARACTER).
		arrayvar1[8] = new Progress.Data.ColumnPropDesc("Birthdate", "Birthdate", Progress.Data.DataType:DATE).
		arrayvar1[9] = new Progress.Data.ColumnPropDesc("DeptCode", "Dept Code", Progress.Data.DataType:CHARACTER).
		arrayvar1[10] = new Progress.Data.ColumnPropDesc("HomePhone", "Home Phone", Progress.Data.DataType:CHARACTER).
		arrayvar1[11] = new Progress.Data.ColumnPropDesc("position", "Position", Progress.Data.DataType:CHARACTER).
		arrayvar1[12] = new Progress.Data.ColumnPropDesc("SickDaysLeft", "Sick Days Left", Progress.Data.DataType:INTEGER).
		arrayvar1[13] = new Progress.Data.ColumnPropDesc("StartDate", "Start Date", Progress.Data.DataType:DATE).
		arrayvar1[14] = new Progress.Data.ColumnPropDesc("State", "State", Progress.Data.DataType:CHARACTER).
		arrayvar1[15] = new Progress.Data.ColumnPropDesc("VacationDaysLeft", "Vacation Days Left", Progress.Data.DataType:INTEGER).
		arrayvar1[16] = new Progress.Data.ColumnPropDesc("WorkPhone", "Work Phone", Progress.Data.DataType:CHARACTER).
		arrayvar1[17] = new Progress.Data.ColumnPropDesc("Country", "Country", Progress.Data.DataType:CHARACTER).
		arrayvar1[18] = new Progress.Data.ColumnPropDesc("Notes", "Notes", Progress.Data.DataType:CHARACTER).
		arrayvar1[19] = new Progress.Data.ColumnPropDesc("Photo", "Photo", Progress.Data.DataType:BLOB).
		tableDesc1:Columns = arrayvar1.
		this-object:pbsEmployeeSource:TableSchema = tableDesc1.
		/*  */
		/* ultraTabPageControl2 */
		/*  */
		this-object:ultraTabPageControl2:Controls:Add(this-object:ultraGridEmployeesRuntime).
		this-object:ultraTabPageControl2:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPageControl2:Name = "ultraTabPageControl2".
		this-object:ultraTabPageControl2:Size = new System.Drawing.Size(956, 501).
		/*  */
		/* ultraGridEmployeesRuntime */
		/*  */
		this-object:ultraGridEmployeesRuntime:Cursor = System.Windows.Forms.Cursors:Default.
		appearance43:BackColor = System.Drawing.Color:White.
		appearance43:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance43:BackGradientStyle = Infragistics.Win.GradientStyle:ForwardDiagonal.
		this-object:ultraGridEmployeesRuntime:DisplayLayout:Appearance = appearance43.
		this-object:ultraGridEmployeesRuntime:DisplayLayout:InterBandSpacing = 10.
		appearance44:BackColor = System.Drawing.Color:Transparent.
		this-object:ultraGridEmployeesRuntime:DisplayLayout:Override:CardAreaAppearance = appearance44.
		appearance45:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance45:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		appearance45:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance45:ForeColor = System.Drawing.Color:Black.
		appearance45:TextHAlignAsString = "Left".
		appearance45:ThemedElementAlpha = Infragistics.Win.Alpha:Transparent.
		this-object:ultraGridEmployeesRuntime:DisplayLayout:Override:HeaderAppearance = appearance45.
		appearance46:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		this-object:ultraGridEmployeesRuntime:DisplayLayout:Override:RowAppearance = appearance46.
		appearance47:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance47:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		appearance47:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		this-object:ultraGridEmployeesRuntime:DisplayLayout:Override:RowSelectorAppearance = appearance47.
		this-object:ultraGridEmployeesRuntime:DisplayLayout:Override:RowSelectorWidth = 12.
		this-object:ultraGridEmployeesRuntime:DisplayLayout:Override:RowSpacingBefore = 2.
		appearance48:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		appearance48:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(242)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(199))).
		appearance48:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance48:ForeColor = System.Drawing.Color:Black.
		this-object:ultraGridEmployeesRuntime:DisplayLayout:Override:SelectedRowAppearance = appearance48.
		this-object:ultraGridEmployeesRuntime:DisplayLayout:RowConnectorColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(170)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(131))).
		this-object:ultraGridEmployeesRuntime:DisplayLayout:RowConnectorStyle = Infragistics.Win.UltraWinGrid.RowConnectorStyle:Solid.
		this-object:ultraGridEmployeesRuntime:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:ultraGridEmployeesRuntime:Location = new System.Drawing.Point(0, 0).
		this-object:ultraGridEmployeesRuntime:Name = "ultraGridEmployeesRuntime".
		this-object:ultraGridEmployeesRuntime:Size = new System.Drawing.Size(956, 501).
		this-object:ultraGridEmployeesRuntime:TabIndex = 0.
		this-object:ultraGridEmployeesRuntime:Text = "Employees (The row layout for this grid is created in code)".
		this-object:ultraGridEmployeesRuntime:InitializeLayout:subscribe(this-object:ultraGridEmployeesRuntime_InitializeLayout).
		/*  */
		/* ultraTabPageControl3 */
		/*  */
		this-object:ultraTabPageControl3:Controls:Add(this-object:ultraGridCardViewDesignTime).
		this-object:ultraTabPageControl3:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPageControl3:Name = "ultraTabPageControl3".
		this-object:ultraTabPageControl3:Size = new System.Drawing.Size(956, 501).
		/*  */
		/* ultraGridCardViewDesignTime */
		/*  */
		this-object:ultraGridCardViewDesignTime:Cursor = System.Windows.Forms.Cursors:Hand.
		this-object:ultraGridCardViewDesignTime:DataSource = this-object:pbsEmployeeSource.
		ultraGridBand2:CardSettings:Style = Infragistics.Win.UltraWinGrid.CardStyle:Compressed.
		ultraGridBand2:CardView = true.
		ultraGridColumn22:Header:VisiblePosition = 0.
		ultraGridColumn22:Hidden = true.
		ultraGridColumn22:RowLayoutColumnInfo:OriginX = 2.
		ultraGridColumn22:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn22:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn22:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn23:Header:VisiblePosition = 2.
		ultraGridColumn23:RowLayoutColumnInfo:OriginX = 2.
		ultraGridColumn23:RowLayoutColumnInfo:OriginY = 2.
		ultraGridColumn23:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(120, 26).
		ultraGridColumn23:RowLayoutColumnInfo:PreferredLabelSize = new System.Drawing.Size(72, 26).
		ultraGridColumn23:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn23:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn24:Header:VisiblePosition = 1.
		ultraGridColumn24:RowLayoutColumnInfo:OriginX = 2.
		ultraGridColumn24:RowLayoutColumnInfo:OriginY = 4.
		ultraGridColumn24:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(120, 26).
		ultraGridColumn24:RowLayoutColumnInfo:PreferredLabelSize = new System.Drawing.Size(72, 26).
		ultraGridColumn24:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn24:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn25:Header:VisiblePosition = 4.
		ultraGridColumn25:RowLayoutColumnInfo:OriginX = 0.
		ultraGridColumn25:RowLayoutColumnInfo:OriginY = 12.
		ultraGridColumn25:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(164, 22).
		ultraGridColumn25:RowLayoutColumnInfo:PreferredLabelSize = new System.Drawing.Size(75, 22).
		ultraGridColumn25:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn25:RowLayoutColumnInfo:SpanY = 1.
		ultraGridColumn26:Header:VisiblePosition = 3.
		ultraGridColumn26:RowLayoutColumnInfo:OriginX = 0.
		ultraGridColumn26:RowLayoutColumnInfo:OriginY = 13.
		ultraGridColumn26:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(0, 22).
		ultraGridColumn26:RowLayoutColumnInfo:PreferredLabelSize = new System.Drawing.Size(75, 22).
		ultraGridColumn26:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn26:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn27:Header:VisiblePosition = 6.
		ultraGridColumn27:RowLayoutColumnInfo:OriginX = 0.
		ultraGridColumn27:RowLayoutColumnInfo:OriginY = 15.
		ultraGridColumn27:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(164, 22).
		ultraGridColumn27:RowLayoutColumnInfo:PreferredLabelSize = new System.Drawing.Size(75, 22).
		ultraGridColumn27:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn27:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn28:Header:VisiblePosition = 8.
		ultraGridColumn28:RowLayoutColumnInfo:OriginX = 2.
		ultraGridColumn28:RowLayoutColumnInfo:OriginY = 15.
		ultraGridColumn28:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(120, 22).
		ultraGridColumn28:RowLayoutColumnInfo:PreferredLabelSize = new System.Drawing.Size(72, 22).
		ultraGridColumn28:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn28:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn29:Header:VisiblePosition = 5.
		ultraGridColumn29:Hidden = true.
		ultraGridColumn29:RowLayoutColumnInfo:OriginX = 6.
		ultraGridColumn29:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn29:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn29:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn30:Header:VisiblePosition = 7.
		ultraGridColumn30:Hidden = true.
		ultraGridColumn30:RowLayoutColumnInfo:OriginX = 8.
		ultraGridColumn30:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn30:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn30:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn31:Header:VisiblePosition = 12.
		ultraGridColumn31:RowLayoutColumnInfo:OriginX = 0.
		ultraGridColumn31:RowLayoutColumnInfo:OriginY = 10.
		ultraGridColumn31:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(164, 22).
		ultraGridColumn31:RowLayoutColumnInfo:PreferredLabelSize = new System.Drawing.Size(75, 22).
		ultraGridColumn31:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn31:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn32:Header:VisiblePosition = 9.
		ultraGridColumn32:RowLayoutColumnInfo:OriginX = 2.
		ultraGridColumn32:RowLayoutColumnInfo:OriginY = 6.
		ultraGridColumn32:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(120, 26).
		ultraGridColumn32:RowLayoutColumnInfo:PreferredLabelSize = new System.Drawing.Size(72, 26).
		ultraGridColumn32:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn32:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn33:Header:VisiblePosition = 10.
		ultraGridColumn33:Hidden = true.
		ultraGridColumn33:RowLayoutColumnInfo:OriginX = 12.
		ultraGridColumn33:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn33:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn33:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn34:Header:VisiblePosition = 13.
		ultraGridColumn34:RowLayoutColumnInfo:OriginX = 2.
		ultraGridColumn34:RowLayoutColumnInfo:OriginY = 8.
		ultraGridColumn34:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(120, 26).
		ultraGridColumn34:RowLayoutColumnInfo:PreferredLabelSize = new System.Drawing.Size(72, 26).
		ultraGridColumn34:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn34:RowLayoutColumnInfo:SpanY = 1.
		ultraGridColumn35:Header:VisiblePosition = 14.
		ultraGridColumn35:RowLayoutColumnInfo:OriginX = 0.
		ultraGridColumn35:RowLayoutColumnInfo:OriginY = 17.
		ultraGridColumn35:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(0, 22).
		ultraGridColumn35:RowLayoutColumnInfo:PreferredLabelSize = new System.Drawing.Size(75, 22).
		ultraGridColumn35:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn35:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn36:Header:VisiblePosition = 15.
		ultraGridColumn36:Hidden = true.
		ultraGridColumn36:RowLayoutColumnInfo:OriginX = 18.
		ultraGridColumn36:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn36:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn36:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn37:Header:VisiblePosition = 17.
		ultraGridColumn37:Hidden = true.
		ultraGridColumn37:RowLayoutColumnInfo:OriginX = 2.
		ultraGridColumn37:RowLayoutColumnInfo:OriginY = 10.
		ultraGridColumn37:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn37:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn38:Header:VisiblePosition = 11.
		ultraGridColumn38:RowLayoutColumnInfo:OriginX = 2.
		ultraGridColumn38:RowLayoutColumnInfo:OriginY = 17.
		ultraGridColumn38:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(120, 22).
		ultraGridColumn38:RowLayoutColumnInfo:PreferredLabelSize = new System.Drawing.Size(72, 22).
		ultraGridColumn38:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn38:RowLayoutColumnInfo:SpanY = 2.
		ultraGridColumn39:CellMultiLine = Infragistics.Win.DefaultableBoolean:True.
		ultraGridColumn39:Header:VisiblePosition = 18.
		ultraGridColumn39:RowLayoutColumnInfo:OriginX = 0.
		ultraGridColumn39:RowLayoutColumnInfo:OriginY = 19.
		ultraGridColumn39:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(356, 118).
		ultraGridColumn39:RowLayoutColumnInfo:PreferredLabelSize = new System.Drawing.Size(75, 118).
		ultraGridColumn39:RowLayoutColumnInfo:SpanX = 4.
		ultraGridColumn39:RowLayoutColumnInfo:SpanY = 6.
		ultraGridColumn40:Header:VisiblePosition = 16.
		ultraGridColumn40:RowLayoutColumnInfo:LabelPosition = Infragistics.Win.UltraWinGrid.LabelPosition:None.
		ultraGridColumn40:RowLayoutColumnInfo:OriginX = 0.
		ultraGridColumn40:RowLayoutColumnInfo:OriginY = 0.
		ultraGridColumn40:RowLayoutColumnInfo:PreferredCellSize = new System.Drawing.Size(233, 150).
		ultraGridColumn40:RowLayoutColumnInfo:SpanX = 2.
		ultraGridColumn40:RowLayoutColumnInfo:SpanY = 10.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		define variable arrayvar2 as System.Object extent 19 no-undo.
		arrayvar2[1] = ultraGridColumn22.
		arrayvar2[2] = ultraGridColumn23.
		arrayvar2[3] = ultraGridColumn24.
		arrayvar2[4] = ultraGridColumn25.
		arrayvar2[5] = ultraGridColumn26.
		arrayvar2[6] = ultraGridColumn27.
		arrayvar2[7] = ultraGridColumn28.
		arrayvar2[8] = ultraGridColumn29.
		arrayvar2[9] = ultraGridColumn30.
		arrayvar2[10] = ultraGridColumn31.
		arrayvar2[11] = ultraGridColumn32.
		arrayvar2[12] = ultraGridColumn33.
		arrayvar2[13] = ultraGridColumn34.
		arrayvar2[14] = ultraGridColumn35.
		arrayvar2[15] = ultraGridColumn36.
		arrayvar2[16] = ultraGridColumn37.
		arrayvar2[17] = ultraGridColumn38.
		arrayvar2[18] = ultraGridColumn39.
		arrayvar2[19] = ultraGridColumn40.
		ultraGridBand2:Columns:AddRange(arrayvar2).
		appearance27:TextHAlignAsString = "Left".
		appearance27:TextVAlignAsString = "Middle".
		ultraGridBand2:Override:CardCaptionAppearance = appearance27.
		appearance28:ImageHAlign = Infragistics.Win.HAlign:Center.
		appearance28:ImageVAlign = Infragistics.Win.VAlign:Middle.
		ultraGridBand2:Override:CellAppearance = appearance28.
		ultraGridBand2:UseRowLayout = true.
		this-object:ultraGridCardViewDesignTime:DisplayLayout:BandsSerializer:Add(ultraGridBand2).
		appearance51:BackColor = System.Drawing.Color:Red.
		this-object:ultraGridCardViewDesignTime:DisplayLayout:Override:ActiveCardCaptionAppearance = appearance51.
		appearance52:BackColor = System.Drawing.Color:White.
		appearance52:ForeColor = System.Drawing.Color:Black.
		this-object:ultraGridCardViewDesignTime:DisplayLayout:Override:ActiveRowAppearance = appearance52.
		appearance53:BackColor = System.Drawing.Color:White.
		this-object:ultraGridCardViewDesignTime:DisplayLayout:Override:CardAreaAppearance = appearance53.
		appearance54:TextTrimming = Infragistics.Win.TextTrimming:EllipsisCharacter.
		appearance54:TextVAlignAsString = "Middle".
		this-object:ultraGridCardViewDesignTime:DisplayLayout:Override:CellAppearance = appearance54.
		appearance55:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(240)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(240)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		this-object:ultraGridCardViewDesignTime:DisplayLayout:Override:HeaderAppearance = appearance55.
		appearance56:BackColor = System.Drawing.Color:Lime.
		this-object:ultraGridCardViewDesignTime:DisplayLayout:Override:SelectedCardCaptionAppearance = appearance56.
		appearance57:BackColor = System.Drawing.Color:White.
		appearance57:ForeColor = System.Drawing.Color:Black.
		this-object:ultraGridCardViewDesignTime:DisplayLayout:Override:SelectedRowAppearance = appearance57.
		this-object:ultraGridCardViewDesignTime:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:ultraGridCardViewDesignTime:Location = new System.Drawing.Point(0, 0).
		this-object:ultraGridCardViewDesignTime:Name = "ultraGridCardViewDesignTime".
		this-object:ultraGridCardViewDesignTime:Size = new System.Drawing.Size(956, 501).
		this-object:ultraGridCardViewDesignTime:TabIndex = 0.
		this-object:ultraGridCardViewDesignTime:Text = "Employees (The row layout for this grid was created in the designer)".
		this-object:ultraGridCardViewDesignTime:InitializeLayout:subscribe(this-object:ultraGridCardViewDesignTime_InitializeLayout).
		this-object:ultraGridCardViewDesignTime:InitializeRow:subscribe(this-object:ultraGridCardViewDesignTime_InitializeRow).
		/*  */
		/* ultraTabPageControl4 */
		/*  */
		this-object:ultraTabPageControl4:Controls:Add(this-object:ultraGridCardViewRuntime).
		this-object:ultraTabPageControl4:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPageControl4:Name = "ultraTabPageControl4".
		this-object:ultraTabPageControl4:Size = new System.Drawing.Size(956, 501).
		/*  */
		/* ultraGridCardViewRuntime */
		/*  */
		this-object:ultraGridCardViewRuntime:Cursor = System.Windows.Forms.Cursors:Default.
		appearance58:BackColor = System.Drawing.Color:Red.
		this-object:ultraGridCardViewRuntime:DisplayLayout:Override:ActiveCardCaptionAppearance = appearance58.
		appearance59:BackColor = System.Drawing.Color:White.
		appearance59:ForeColor = System.Drawing.Color:Black.
		this-object:ultraGridCardViewRuntime:DisplayLayout:Override:ActiveRowAppearance = appearance59.
		appearance60:BackColor = System.Drawing.Color:White.
		this-object:ultraGridCardViewRuntime:DisplayLayout:Override:CardAreaAppearance = appearance60.
		appearance61:TextTrimming = Infragistics.Win.TextTrimming:EllipsisCharacter.
		this-object:ultraGridCardViewRuntime:DisplayLayout:Override:CellAppearance = appearance61.
		appearance62:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(240)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(240)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		this-object:ultraGridCardViewRuntime:DisplayLayout:Override:HeaderAppearance = appearance62.
		appearance63:BackColor = System.Drawing.Color:Lime.
		this-object:ultraGridCardViewRuntime:DisplayLayout:Override:SelectedCardCaptionAppearance = appearance63.
		appearance64:BackColor = System.Drawing.Color:White.
		appearance64:ForeColor = System.Drawing.Color:Black.
		this-object:ultraGridCardViewRuntime:DisplayLayout:Override:SelectedRowAppearance = appearance64.
		this-object:ultraGridCardViewRuntime:Dock = System.Windows.Forms.DockStyle:Fill.
		ultraGridLayout1:Key = "SampleLayout".
		appearance65:BackColor = System.Drawing.Color:Red.
		ultraGridLayout1:Override:ActiveCardCaptionAppearance = appearance65.
		appearance66:BackColor = System.Drawing.Color:White.
		appearance66:ForeColor = System.Drawing.Color:Black.
		ultraGridLayout1:Override:ActiveRowAppearance = appearance66.
		appearance67:BackColor = System.Drawing.Color:White.
		ultraGridLayout1:Override:CardAreaAppearance = appearance67.
		appearance68:TextTrimming = Infragistics.Win.TextTrimming:EllipsisCharacter.
		ultraGridLayout1:Override:CellAppearance = appearance68.
		appearance69:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(240)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(240)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		ultraGridLayout1:Override:HeaderAppearance = appearance69.
		appearance70:BackColor = System.Drawing.Color:Lime.
		ultraGridLayout1:Override:SelectedCardCaptionAppearance = appearance70.
		appearance71:BackColor = System.Drawing.Color:White.
		appearance71:ForeColor = System.Drawing.Color:Black.
		ultraGridLayout1:Override:SelectedRowAppearance = appearance71.
		this-object:ultraGridCardViewRuntime:Layouts:Add(ultraGridLayout1).
		this-object:ultraGridCardViewRuntime:Location = new System.Drawing.Point(0, 0).
		this-object:ultraGridCardViewRuntime:Name = "ultraGridCardViewRuntime".
		this-object:ultraGridCardViewRuntime:Size = new System.Drawing.Size(956, 501).
		this-object:ultraGridCardViewRuntime:TabIndex = 18.
		this-object:ultraGridCardViewRuntime:Text = "Employees (The row layout for this grid is created in code)".
		this-object:ultraGridCardViewRuntime:InitializeLayout:subscribe(this-object:ultraGridCardViewRuntime_InitializeLayout).
		this-object:ultraGridCardViewRuntime:InitializeRow:subscribe(this-object:ultraGridCardViewRuntime_InitializeRow).
		/*  */
		/* ultraTabPageControl5 */
		/*  */
		this-object:ultraTabPageControl5:Controls:Add(this-object:panel2).
		this-object:ultraTabPageControl5:Controls:Add(this-object:panel1).
		this-object:ultraTabPageControl5:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabPageControl5:Name = "ultraTabPageControl5".
		this-object:ultraTabPageControl5:Size = new System.Drawing.Size(956, 501).
		/*  */
		/* panel2 */
		/*  */
		this-object:panel2:Controls:Add(this-object:ultraGridRegularView).
		this-object:panel2:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:panel2:Location = new System.Drawing.Point(320, 0).
		this-object:panel2:Name = "panel2".
		this-object:panel2:Padding = new System.Windows.Forms.Padding(5).
		this-object:panel2:Size = new System.Drawing.Size(636, 501).
		this-object:panel2:TabIndex = 21.
		/*  */
		/* ultraGridRegularView */
		/*  */
		this-object:ultraGridRegularView:Cursor = System.Windows.Forms.Cursors:Hand.
		this-object:ultraGridRegularView:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:ultraGridRegularView:Location = new System.Drawing.Point(5, 5).
		this-object:ultraGridRegularView:Name = "ultraGridRegularView".
		this-object:ultraGridRegularView:Size = new System.Drawing.Size(626, 491).
		this-object:ultraGridRegularView:TabIndex = 19.
		this-object:ultraGridRegularView:InitializeLayout:subscribe(this-object:ultraGridRegularView_InitializeLayout).
		/*  */
		/* panel1 */
		/*  */
		this-object:panel1:Controls:Add(this-object:checkBoxWrapHeaderText).
		this-object:panel1:Controls:Add(this-object:checkBoxRowAutoSizing).
		this-object:panel1:Controls:Add(this-object:groupBoxSizing).
		this-object:panel1:Controls:Add(this-object:label2).
		this-object:panel1:Controls:Add(this-object:checkBoxUseRowLayout).
		this-object:panel1:Controls:Add(this-object:buttonCollapseAllRows).
		this-object:panel1:Controls:Add(this-object:buttonExpandAllRows).
		this-object:panel1:Controls:Add(this-object:groupBoxLabelStyle).
		this-object:panel1:Controls:Add(this-object:label1).
		this-object:panel1:Controls:Add(this-object:comboBoxBands).
		this-object:panel1:Dock = System.Windows.Forms.DockStyle:Left.
		this-object:panel1:Location = new System.Drawing.Point(0, 0).
		this-object:panel1:Name = "panel1".
		this-object:panel1:Padding = new System.Windows.Forms.Padding(5).
		this-object:panel1:Size = new System.Drawing.Size(320, 501).
		this-object:panel1:TabIndex = 20.
		/*  */
		/* checkBoxWrapHeaderText */
		/*  */
		this-object:checkBoxWrapHeaderText:Location = new System.Drawing.Point(16, 128).
		this-object:checkBoxWrapHeaderText:Name = "checkBoxWrapHeaderText".
		this-object:checkBoxWrapHeaderText:Size = new System.Drawing.Size(216, 24).
		this-object:checkBoxWrapHeaderText:TabIndex = 12.
		this-object:checkBoxWrapHeaderText:Text = "Auto Wrap Header Text".
		this-object:checkBoxWrapHeaderText:UseCompatibleTextRendering = true.
		this-object:checkBoxWrapHeaderText:CheckedChanged:subscribe(this-object:checkBoxWrapHeaderText_CheckedChanged).
		/*  */
		/* checkBoxRowAutoSizing */
		/*  */
		this-object:checkBoxRowAutoSizing:Location = new System.Drawing.Point(16, 104).
		this-object:checkBoxRowAutoSizing:Name = "checkBoxRowAutoSizing".
		this-object:checkBoxRowAutoSizing:Size = new System.Drawing.Size(216, 24).
		this-object:checkBoxRowAutoSizing:TabIndex = 11.
		this-object:checkBoxRowAutoSizing:Text = "Row Auto-Sizing".
		this-object:checkBoxRowAutoSizing:UseCompatibleTextRendering = true.
		this-object:checkBoxRowAutoSizing:CheckedChanged:subscribe(this-object:checkBoxRowAutoSizing_CheckedChanged).
		/*  */
		/* groupBoxSizing */
		/*  */
		this-object:groupBoxSizing:Controls:Add(this-object:checkBoxAllowSwapping).
		this-object:groupBoxSizing:Controls:Add(this-object:checkBoxAllowMoving).
		this-object:groupBoxSizing:Controls:Add(this-object:comboBoxCellSpanSizing).
		this-object:groupBoxSizing:Controls:Add(this-object:comboBoxLabelSpanSizing).
		this-object:groupBoxSizing:Controls:Add(this-object:label5).
		this-object:groupBoxSizing:Controls:Add(this-object:label6).
		this-object:groupBoxSizing:Controls:Add(this-object:comboBoxCellSizing).
		this-object:groupBoxSizing:Controls:Add(this-object:comboBoxLabelSizing).
		this-object:groupBoxSizing:Controls:Add(this-object:label4).
		this-object:groupBoxSizing:Controls:Add(this-object:label3).
		this-object:groupBoxSizing:Enabled = false.
		this-object:groupBoxSizing:Location = new System.Drawing.Point(8, 272).
		this-object:groupBoxSizing:Name = "groupBoxSizing".
		this-object:groupBoxSizing:Size = new System.Drawing.Size(304, 184).
		this-object:groupBoxSizing:TabIndex = 7.
		this-object:groupBoxSizing:TabStop = false.
		this-object:groupBoxSizing:Text = "Allow Label/Cell Moving/Sizing".
		this-object:groupBoxSizing:UseCompatibleTextRendering = true.
		/*  */
		/* checkBoxAllowSwapping */
		/*  */
		this-object:checkBoxAllowSwapping:Location = new System.Drawing.Point(8, 101).
		this-object:checkBoxAllowSwapping:Name = "checkBoxAllowSwapping".
		this-object:checkBoxAllowSwapping:Size = new System.Drawing.Size(232, 24).
		this-object:checkBoxAllowSwapping:TabIndex = 11.
		this-object:checkBoxAllowSwapping:Text = "Allow Swapping".
		this-object:checkBoxAllowSwapping:UseCompatibleTextRendering = true.
		this-object:checkBoxAllowSwapping:CheckedChanged:subscribe(this-object:checkBoxAllowSwapping_CheckedChanged).
		/*  */
		/* checkBoxAllowMoving */
		/*  */
		this-object:checkBoxAllowMoving:Location = new System.Drawing.Point(8, 77).
		this-object:checkBoxAllowMoving:Name = "checkBoxAllowMoving".
		this-object:checkBoxAllowMoving:Size = new System.Drawing.Size(232, 24).
		this-object:checkBoxAllowMoving:TabIndex = 10.
		this-object:checkBoxAllowMoving:Text = "Allow Moving".
		this-object:checkBoxAllowMoving:UseCompatibleTextRendering = true.
		this-object:checkBoxAllowMoving:CheckedChanged:subscribe(this-object:checkBoxAllowMoving_CheckedChanged).
		/*  */
		/* comboBoxCellSpanSizing */
		/*  */
		this-object:comboBoxCellSpanSizing:DropDownStyle = System.Windows.Forms.ComboBoxStyle:DropDownList.
		this-object:comboBoxCellSpanSizing:Location = new System.Drawing.Point(144, 152).
		this-object:comboBoxCellSpanSizing:Name = "comboBoxCellSpanSizing".
		this-object:comboBoxCellSpanSizing:Size = new System.Drawing.Size(152, 21).
		this-object:comboBoxCellSpanSizing:TabIndex = 9.
		/*  */
		/* comboBoxLabelSpanSizing */
		/*  */
		this-object:comboBoxLabelSpanSizing:DropDownStyle = System.Windows.Forms.ComboBoxStyle:DropDownList.
		this-object:comboBoxLabelSpanSizing:Location = new System.Drawing.Point(144, 128).
		this-object:comboBoxLabelSpanSizing:Name = "comboBoxLabelSpanSizing".
		this-object:comboBoxLabelSpanSizing:Size = new System.Drawing.Size(152, 21).
		this-object:comboBoxLabelSpanSizing:TabIndex = 8.
		this-object:comboBoxLabelSpanSizing:SelectedIndexChanged:subscribe(this-object:comboBoxLabelSpanSizing_SelectedIndexChanged).
		/*  */
		/* label5 */
		/*  */
		this-object:label5:Location = new System.Drawing.Point(8, 152).
		this-object:label5:Name = "label5".
		this-object:label5:Size = new System.Drawing.Size(144, 14).
		this-object:label5:TabIndex = 7.
		this-object:label5:Text = "Cell Span Sizing:".
		this-object:label5:UseCompatibleTextRendering = true.
		/*  */
		/* label6 */
		/*  */
		this-object:label6:Location = new System.Drawing.Point(8, 128).
		this-object:label6:Name = "label6".
		this-object:label6:Size = new System.Drawing.Size(136, 16).
		this-object:label6:TabIndex = 6.
		this-object:label6:Text = "Label Span Sizing:".
		this-object:label6:UseCompatibleTextRendering = true.
		/*  */
		/* comboBoxCellSizing */
		/*  */
		this-object:comboBoxCellSizing:DropDownStyle = System.Windows.Forms.ComboBoxStyle:DropDownList.
		this-object:comboBoxCellSizing:Location = new System.Drawing.Point(112, 48).
		this-object:comboBoxCellSizing:Name = "comboBoxCellSizing".
		this-object:comboBoxCellSizing:Size = new System.Drawing.Size(176, 21).
		this-object:comboBoxCellSizing:TabIndex = 5.
		this-object:comboBoxCellSizing:SelectedIndexChanged:subscribe(this-object:comboBoxCellSizing_SelectedIndexChanged).
		/*  */
		/* comboBoxLabelSizing */
		/*  */
		this-object:comboBoxLabelSizing:DropDownStyle = System.Windows.Forms.ComboBoxStyle:DropDownList.
		this-object:comboBoxLabelSizing:Location = new System.Drawing.Point(112, 24).
		this-object:comboBoxLabelSizing:Name = "comboBoxLabelSizing".
		this-object:comboBoxLabelSizing:Size = new System.Drawing.Size(176, 21).
		this-object:comboBoxLabelSizing:TabIndex = 4.
		this-object:comboBoxLabelSizing:SelectedIndexChanged:subscribe(this-object:comboBoxLabelSizing_SelectedIndexChanged).
		/*  */
		/* label4 */
		/*  */
		this-object:label4:Location = new System.Drawing.Point(8, 50).
		this-object:label4:Name = "label4".
		this-object:label4:Size = new System.Drawing.Size(104, 14).
		this-object:label4:TabIndex = 3.
		this-object:label4:Text = "Cell Sizing:".
		this-object:label4:UseCompatibleTextRendering = true.
		/*  */
		/* label3 */
		/*  */
		this-object:label3:Location = new System.Drawing.Point(8, 26).
		this-object:label3:Name = "label3".
		this-object:label3:Size = new System.Drawing.Size(104, 16).
		this-object:label3:TabIndex = 2.
		this-object:label3:Text = "Label Sizing:".
		this-object:label3:UseCompatibleTextRendering = true.
		/*  */
		/* label2 */
		/*  */
		this-object:label2:Font = new System.Drawing.Font("Microsoft Sans Serif", 9, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		this-object:label2:Location = new System.Drawing.Point(8, 8).
		this-object:label2:Name = "label2".
		this-object:label2:Size = new System.Drawing.Size(264, 24).
		this-object:label2:TabIndex = 6.
		this-object:label2:Text = "Row Layout Related Band Settings:".
		this-object:label2:UseCompatibleTextRendering = true.
		/*  */
		/* checkBoxUseRowLayout */
		/*  */
		this-object:checkBoxUseRowLayout:Location = new System.Drawing.Point(16, 64).
		this-object:checkBoxUseRowLayout:Name = "checkBoxUseRowLayout".
		this-object:checkBoxUseRowLayout:Size = new System.Drawing.Size(224, 24).
		this-object:checkBoxUseRowLayout:TabIndex = 5.
		this-object:checkBoxUseRowLayout:Text = "Use Row Layout".
		this-object:checkBoxUseRowLayout:UseCompatibleTextRendering = true.
		this-object:checkBoxUseRowLayout:CheckedChanged:subscribe(this-object:checkBoxUseRowLayout_CheckedChanged).
		/*  */
		/* buttonCollapseAllRows */
		/*  */
		this-object:buttonCollapseAllRows:Anchor = System.Windows.Forms.AnchorStyles:Bottom.
		this-object:buttonCollapseAllRows:Location = new System.Drawing.Point(8, 465).
		this-object:buttonCollapseAllRows:Name = "buttonCollapseAllRows".
		this-object:buttonCollapseAllRows:Size = new System.Drawing.Size(112, 24).
		this-object:buttonCollapseAllRows:TabIndex = 4.
		this-object:buttonCollapseAllRows:Text = "Collapse All Rows".
		this-object:buttonCollapseAllRows:UseCompatibleTextRendering = true.
		this-object:buttonCollapseAllRows:Click:subscribe(this-object:buttonCollapseAllRows_Click).
		/*  */
		/* buttonExpandAllRows */
		/*  */
		this-object:buttonExpandAllRows:Anchor = System.Windows.Forms.AnchorStyles:Bottom.
		this-object:buttonExpandAllRows:Location = new System.Drawing.Point(136, 465).
		this-object:buttonExpandAllRows:Name = "buttonExpandAllRows".
		this-object:buttonExpandAllRows:Size = new System.Drawing.Size(104, 24).
		this-object:buttonExpandAllRows:TabIndex = 3.
		this-object:buttonExpandAllRows:Text = "Expand All Rows".
		this-object:buttonExpandAllRows:UseCompatibleTextRendering = true.
		this-object:buttonExpandAllRows:Click:subscribe(this-object:buttonExpandAllRows_Click).
		/*  */
		/* groupBoxLabelStyle */
		/*  */
		this-object:groupBoxLabelStyle:Controls:Add(this-object:label7).
		this-object:groupBoxLabelStyle:Controls:Add(this-object:radioButtonSeparate).
		this-object:groupBoxLabelStyle:Controls:Add(this-object:radioButtonWithCellData).
		this-object:groupBoxLabelStyle:Controls:Add(this-object:comboBoxLabelPosition).
		this-object:groupBoxLabelStyle:Enabled = false.
		this-object:groupBoxLabelStyle:Location = new System.Drawing.Point(8, 160).
		this-object:groupBoxLabelStyle:Name = "groupBoxLabelStyle".
		this-object:groupBoxLabelStyle:Size = new System.Drawing.Size(304, 104).
		this-object:groupBoxLabelStyle:TabIndex = 1.
		this-object:groupBoxLabelStyle:TabStop = false.
		this-object:groupBoxLabelStyle:Text = "Row Layout Label Style".
		this-object:groupBoxLabelStyle:UseCompatibleTextRendering = true.
		/*  */
		/* label7 */
		/*  */
		this-object:label7:Location = new System.Drawing.Point(32, 48).
		this-object:label7:Name = "label7".
		this-object:label7:Size = new System.Drawing.Size(104, 16).
		this-object:label7:TabIndex = 3.
		this-object:label7:Text = "Label Position".
		this-object:label7:UseCompatibleTextRendering = true.
		/*  */
		/* radioButtonSeparate */
		/*  */
		this-object:radioButtonSeparate:Location = new System.Drawing.Point(16, 80).
		this-object:radioButtonSeparate:Name = "radioButtonSeparate".
		this-object:radioButtonSeparate:Size = new System.Drawing.Size(216, 16).
		this-object:radioButtonSeparate:TabIndex = 1.
		this-object:radioButtonSeparate:Text = "Separate".
		this-object:radioButtonSeparate:UseCompatibleTextRendering = true.
		this-object:radioButtonSeparate:CheckedChanged:subscribe(this-object:radioButtonSeparate_CheckedChanged).
		/*  */
		/* radioButtonWithCellData */
		/*  */
		this-object:radioButtonWithCellData:Location = new System.Drawing.Point(16, 24).
		this-object:radioButtonWithCellData:Name = "radioButtonWithCellData".
		this-object:radioButtonWithCellData:Size = new System.Drawing.Size(216, 16).
		this-object:radioButtonWithCellData:TabIndex = 0.
		this-object:radioButtonWithCellData:Text = "With Cell Data".
		this-object:radioButtonWithCellData:UseCompatibleTextRendering = true.
		this-object:radioButtonWithCellData:CheckedChanged:subscribe(this-object:radioButtonWithCellData_CheckedChanged).
		/*  */
		/* comboBoxLabelPosition */
		/*  */
		this-object:comboBoxLabelPosition:DropDownStyle = System.Windows.Forms.ComboBoxStyle:DropDownList.
		this-object:comboBoxLabelPosition:Location = new System.Drawing.Point(136, 40).
		this-object:comboBoxLabelPosition:Name = "comboBoxLabelPosition".
		this-object:comboBoxLabelPosition:Size = new System.Drawing.Size(152, 21).
		this-object:comboBoxLabelPosition:TabIndex = 0.
		this-object:comboBoxLabelPosition:SelectedIndexChanged:subscribe(this-object:comboBoxLabelPosition_SelectedIndexChanged).
		/*  */
		/* label1 */
		/*  */
		this-object:label1:Location = new System.Drawing.Point(16, 40).
		this-object:label1:Name = "label1".
		this-object:label1:Size = new System.Drawing.Size(64, 24).
		this-object:label1:TabIndex = 1.
		this-object:label1:Text = "For Band:".
		this-object:label1:UseCompatibleTextRendering = true.
		/*  */
		/* comboBoxBands */
		/*  */
		this-object:comboBoxBands:DropDownStyle = System.Windows.Forms.ComboBoxStyle:DropDownList.
		this-object:comboBoxBands:Location = new System.Drawing.Point(80, 40).
		this-object:comboBoxBands:Name = "comboBoxBands".
		this-object:comboBoxBands:Size = new System.Drawing.Size(160, 21).
		this-object:comboBoxBands:TabIndex = 0.
		this-object:comboBoxBands:SelectedIndexChanged:subscribe(this-object:comboBoxBands_SelectedIndexChanged).
		/*  */
		/* btnTitle */
		/*  */
		this-object:btnTitle:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:btnTitle:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		this-object:btnTitle:Font = new System.Drawing.Font("Arial", 14.25, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		this-object:btnTitle:Location = new System.Drawing.Point(0, 0).
		this-object:btnTitle:Name = "btnTitle".
		this-object:btnTitle:Size = new System.Drawing.Size(960, 32).
		this-object:btnTitle:TabIndex = 17.
		this-object:btnTitle:Text = "Row Layout".
		this-object:btnTitle:TextAlign = System.Drawing.ContentAlignment:MiddleLeft.
		this-object:btnTitle:UseCompatibleTextRendering = true.
		this-object:btnTitle:Click:subscribe(this-object:btnTitle_Click).
		this-object:btnTitle:MouseUp:subscribe(this-object:btnTitle_MouseUp).
		/*  */
		/* ultraTabControl1 */
		/*  */
		this-object:ultraTabControl1:AllowTabMoving = true.
		this-object:ultraTabControl1:Controls:Add(this-object:ultraTabSharedControlsPage1).
		this-object:ultraTabControl1:Controls:Add(this-object:ultraTabPageControl1).
		this-object:ultraTabControl1:Controls:Add(this-object:ultraTabPageControl2).
		this-object:ultraTabControl1:Controls:Add(this-object:ultraTabPageControl3).
		this-object:ultraTabControl1:Controls:Add(this-object:ultraTabPageControl4).
		this-object:ultraTabControl1:Controls:Add(this-object:ultraTabPageControl5).
		this-object:ultraTabControl1:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:ultraTabControl1:Location = new System.Drawing.Point(0, 32).
		this-object:ultraTabControl1:Name = "ultraTabControl1".
		this-object:ultraTabControl1:SharedControlsPage = this-object:ultraTabSharedControlsPage1.
		this-object:ultraTabControl1:Size = new System.Drawing.Size(960, 524).
		this-object:ultraTabControl1:TabIndex = 21.
		this-object:ultraTabControl1:TabOrientation = Infragistics.Win.UltraWinTabs.TabOrientation:TopLeft.
		ultraTab1:Key = "Employees (design-time)".
		ultraTab1:TabPage = this-object:ultraTabPageControl1.
		ultraTab1:Text = "Employees (design-time)".
		ultraTab2:Key = "Employees (run-time)".
		ultraTab2:TabPage = this-object:ultraTabPageControl2.
		ultraTab2:Text = "Employees (run-time)".
		ultraTab3:Key = "Card View (design-time)".
		ultraTab3:TabPage = this-object:ultraTabPageControl3.
		ultraTab3:Text = "Card View (design-time)".
		ultraTab4:Key = "Card View (run-time)".
		ultraTab4:TabPage = this-object:ultraTabPageControl4.
		ultraTab4:Text = "Card View (run-time)".
		ultraTab5:Key = "Regular View".
		ultraTab5:TabPage = this-object:ultraTabPageControl5.
		ultraTab5:Text = "Regular View".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		define variable arrayvar3 as Infragistics.Win.UltraWinTabControl.UltraTab extent 5 no-undo.
		arrayvar3[1] = ultraTab1.
		arrayvar3[2] = ultraTab2.
		arrayvar3[3] = ultraTab3.
		arrayvar3[4] = ultraTab4.
		arrayvar3[5] = ultraTab5.
		this-object:ultraTabControl1:Tabs:AddRange(arrayvar3).
		this-object:ultraTabControl1:ViewStyle = Infragistics.Win.UltraWinTabControl.ViewStyle:VisualStudio2005.
		/*  */
		/* ultraTabSharedControlsPage1 */
		/*  */
		this-object:ultraTabSharedControlsPage1:Location = new System.Drawing.Point(-10000, -10000).
		this-object:ultraTabSharedControlsPage1:Name = "ultraTabSharedControlsPage1".
		this-object:ultraTabSharedControlsPage1:Size = new System.Drawing.Size(956, 501).
		/*  */
		/* ultraToolTipManager1 */
		/*  */
		this-object:ultraToolTipManager1:AutoPopDelay = 50000.
		this-object:ultraToolTipManager1:ContainingControl = this-object.
		/*  */
		/* frmRowLayout */
		/*  */
		this-object:ClientSize = new System.Drawing.Size(960, 556).
		this-object:Controls:Add(this-object:ultraTabControl1).
		this-object:Controls:Add(this-object:btnTitle).
		this-object:Name = "frmRowLayout".
		this-object:Text = "frmRowLayout".
		this-object:Load:subscribe(this-object:frmRowLayout_Load).
		this-object:FormClosing:subscribe(this-object:frmRowLayout_FormClosing).
		this-object:ultraTabPageControl1:ResumeLayout(false).
		cast(this-object:ultraGridEmployeesDesignTime, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:pbsEmployeeSource, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabPageControl2:ResumeLayout(false).
		cast(this-object:ultraGridEmployeesRuntime, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabPageControl3:ResumeLayout(false).
		cast(this-object:ultraGridCardViewDesignTime, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabPageControl4:ResumeLayout(false).
		cast(this-object:ultraGridCardViewRuntime, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabPageControl5:ResumeLayout(false).
		this-object:panel2:ResumeLayout(false).
		cast(this-object:ultraGridRegularView, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:panel1:ResumeLayout(false).
		this-object:groupBoxSizing:ResumeLayout(false).
		this-object:groupBoxLabelStyle:ResumeLayout(false).
		cast(this-object:ultraTabControl1, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraTabControl1:ResumeLayout(false).
		this-object:ResumeLayout(false).

	end method.

    method private void InitFieldsToSelectedBand( ):
		define variable band as Infragistics.Win.UltraWinGrid.UltraGridBand no-undo.
		define variable i as integer no-undo. 
		
		band = cast(comboBoxBands:SelectedItem,UltraGridBand).

		comboBoxLabelPosition:SelectedItem = band:RowLayoutLabelPosition.
		radioButtonSeparate:Checked = Progress.Util.EnumHelper:AreEqual(Infragistics.Win.UltraWinGrid.RowLayoutLabelStyle:Separate,band:RowLayoutLabelStyle).
		radioButtonWithCellData:Checked = Progress.Util.EnumHelper:AreEqual(Infragistics.Win.UltraWinGrid.RowLayoutLabelStyle:WithCellData,band:RowLayoutLabelStyle).
		radioButtonSeparate:Checked = Progress.Util.EnumHelper:AreEqual(Infragistics.Win.UltraWinGrid.RowLayoutLabelStyle:Separate,band:RowLayoutLabelStyle).
        radioButtonWithCellData_CheckedChanged( ?, ? ).      
		checkBoxUseRowLayout:Checked = band:UseRowLayout.
		comboBoxLabelSizing:SelectedItem = band:Override:AllowRowLayoutLabelSizing.
		comboBoxCellSizing:SelectedItem  = band:Override:AllowRowLayoutCellSizing.
		comboBoxLabelSpanSizing:SelectedItem = band:Override:AllowRowLayoutLabelSpanSizing.
		comboBoxCellSpanSizing:SelectedItem = band:Override:AllowRowLayoutCellSpanSizing.
		checkBoxAllowMoving:Checked = Progress.Util.EnumHelper:AreEqual(Infragistics.Win.UltraWinGrid.AllowColMoving:WithinBand,band:Override:AllowColMoving).
		checkBoxAllowSwapping:Checked = Progress.Util.EnumHelper:AreEqual(Infragistics.Win.UltraWinGrid.AllowColSwapping:WithinBand,band:Override:AllowColSwapping).
		checkBoxRowAutoSizing:Checked = Progress.Util.EnumHelper:AreEqual(Infragistics.Win.UltraWinGrid.RowSizing:AutoFree,band:Override:RowSizing) 
		                                or 
		                                Progress.Util.EnumHelper:AreEqual(Infragistics.Win.UltraWinGrid.RowSizing:AutoFixed,band:Override:RowSizing).
		checkBoxWrapHeaderText:Checked = Progress.Util.EnumHelper:AreEqual(Infragistics.Win.DefaultableBoolean:True,band:Override:WrapHeaderText).

		/* Highlight the band that's currently selected. */
		band:Override:CellAppearance:BackColor = System.Drawing.Color:LightYellow.
		do i = 0 to band:Layout:Bands:Count - 1:
			if not band:equals(band:Layout:Bands[i]) then
				band:Layout:Bands[i]:Override:CellAppearance:ResetBackColor( ).
		end.  
    end method.
    
	method private void FillBandsCombo( ):
		define variable bands as BandsCollection no-undo.
		define variable i as integer no-undo.
		
		comboBoxBands:Items:Clear( ).
        bands = ultraGridRegularView:DisplayLayout:Bands.
        do i = 0 to bands:Count - 1:
            comboBoxBands:Items:Add( bands[i] ).
        end.    
	 
		comboBoxBands:SelectedItem = bands[0].
	end method.
	
	method private void LoadEnumCombo(ultraCombo as System.Windows.Forms.ComboBox, enumTypeName as char ):
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
	
	method protected Progress.Data.BindingSource GetEmployeeSource(pbs as Progress.Data.BindingSource):   
        if not valid-object(fEmployeeDataSource) then
        do:
            fEmployeeDataSource = new DataServices.EmployeeService().                  
            fEmployeeDataSource:fetchData().                                                 
        end.
        /* we have one pbs that are added to the form in order to be imported
           in the designer while the others are not defined */  
        if not valid-object(pbs) then
            pbs = new Progress.Data.BindingSource().
        pbs:Handle = fEmployeeDataSource:DataSetHandle.
        return pbs.
    end method.
    
    method protected Progress.Data.BindingSource GetCustOrderSource( ):   
        define variable pbs as Progress.Data.BindingSource no-undo.
        
        if not valid-object(fCustOrderDataSource) then
        do:
            fCustOrderDataSource = new DataServices.CustOrderService().                  
            fCustOrderDataSource:fetchData().                                                 
        end.
        pbs = new Progress.Data.BindingSource().
        pbs:Handle = fCustOrderDataSource:DataSetHandle.
        return pbs.
    end method.
	
	method private void SetupRowLayoutForEmployeesRuntimeGrid():
    	/********************************************************************* 
    	Here is the arrangement of the columns that we are going to setup in this method.
		The size of the cells in the diagram are rough estimates.
		
		**************************************************************************************************
		*       PERSONAL INFO       |	                    A D D R E S S	I N F O	   	                 *
		**************************************************************************************************
		*           |FIRST NAME     |ADDRESS		       |HOME PHONE      |                            *
		*           |***************|********************* |****************|                            *
		*PHOTO      |LAST NAME      |ADDRESS2              |POSTAL CODE     |NOTES                       *
		*           |***************|**********************|****************|                            *				
		*           |TITLE          |CITY                  |COUNTRY	        |		                     *
		**************************************************************************************************

		Here is a table containing all of the span/origin data we will be using during this method.
		The SpanX/SpanY sizes used are multiples of 2, so if later we want to make one column half the  
		width or height of its neighboring columns then we can set its Span values to odd numbers.
		Another benefit of using multiples of 2 for the SpanX/SpanY is if you decide to use the merge mode
		for the labels and cells.  In that case, the layout of the column headers will appear identical to the
		layout of the default "non-merged mode", only if we base our span values on multiples of 2.
		
						SpanX	SpanY	OriginX    OriginY
		             ----------------------------------
		Photo		  2       6        0          2
		FirstName     2       2        2          2
		LastName      2       2        2          4
		Title         2       2        2          6
		PersonalInfo  4       2        0          0
		Address       2       2        4          2
		Address2      2       2        4          4
		City          2       2        4	      6
		HomePhone     2       2        6          2
		PostalCode    2	      2	       6          4
		Country	      2       2        6          6
		Notes         2       6        8          2
		AddressInfo   6       2        4          0 

		For an in depth explanation of constructing row layouts in code you should read the 
		tutorial called "Using Row Layouts" in the WinGrid documentation.
		In the WinGrid documentation, open the "Contents" view and you will find the file here:
		-Tutorials: Learn To Use WinGrid
		  -Filtering, Summarizing & Data Presentation
			 -Using Row Layouts 
			 
		**********************************************************************/
		
        define variable band    as UltraGridBand no-undo.
        define variable gridCol as UltraGridColumn no-undo. 
	    define variable i       as integer no-undo. 
        define variable info    as RowLayoutColumnInfo no-undo. 
	     
		/* Get a reference to the first band and tell it to use row layouts. */
		band = ultraGridEmployeesRuntime:DisplayLayout:Bands[0].
		band:UseRowLayout  = true.

		/* We want all of the columns, except for PersonalInfo and AddressInfo, to have their
		   header's caption be left aligned and their overflowing text to be represented by an ellipsis.  
		   Since we have not added the PersonalInfo and AddressInfo columns to the band yet, 
		   we can simply iterate over all of the columns already in the band to achieve this. */
		
		do i = 0 to band:Columns:Count - 1:
		    gridCol = band:Columns[i]. 
	        gridCol:Header:Appearance:TextHAlign = Infragistics.Win.HAlign:Left.
			gridCol:CellAppearance:TextTrimming  = Infragistics.Win.TextTrimming:EllipsisWord.

			/* It does not make any sense to sort a column of images... */
			if( gridCol:Key = "Photo" ) then
				gridCol:SortIndicator = SortIndicator:Disabled.
		end.

		/* Prevent the row selectors from being displayed, just for aesthetic reasons.*/
		band:Override:RowSelectors = Infragistics.Win.DefaultableBoolean:False.

		/* In this sample, we do not want to see the following columns. */
		band:Columns[ "EmpNum"           ]:Hidden = true.
		band:Columns[ "DeptCode"         ]:Hidden = true.
		band:Columns[ "WorkPhone"        ]:Hidden = true.
		band:Columns[ "BirthDate"        ]:Hidden = true.
		band:Columns[ "StartDate"        ]:Hidden = true.
		band:Columns[ "VacationDaysLeft" ]:Hidden = true.
		band:Columns[ "SickDaysLeft"     ]:Hidden = true.
		band:Columns[ "State"            ]:Hidden = true.

		/* Allow the columns to be sorted by default. */
		band:Layout:Override:HeaderClickAction = HeaderClickAction:SortMulti.

		/***** Photo column */
		info         = band:Columns[ "Photo" ]:RowLayoutColumnInfo.
		info:SpanX   = 2.
		info:SpanY   = 6.
		info:OriginX = 0.
		info:OriginY = 2.

		/* Request that, if possible, the cells in the "Photo" column should 
		   be 90 pixels wide by 75 pixels high. */
		info:PreferredCellSize = new System.Drawing.Size( 90, 75 ).
		
	    /**** FirstName Column ***/

		info         = band:Columns[ "FirstName" ]:RowLayoutColumnInfo.
		info:SpanX   = 2.
		info:SpanY   = 2.
		info:OriginX = 2.
		info:OriginY = 2.

		info:PreferredCellSize = new System.Drawing.Size( 120, 26 ).
		
		/**** LastName Column ****/

		info         = band:Columns[ "LastName" ]:RowLayoutColumnInfo.
		info:SpanX   = 2.
		info:SpanY   = 2.
		info:OriginX = 2.
		info:OriginY = 4.

		info:PreferredCellSize = new System.Drawing.Size( 120, 26 ).
		
		/****** Position Column ***/

		info         = band:Columns[ "Position" ]:RowLayoutColumnInfo.
		info:SpanX   = 2.
		info:SpanY   = 2.
		info:OriginX = 2.
		info:OriginY = 6.
		
		info:PreferredCellSize = new System.Drawing.Size( 120, 26 ).

	    /**** PersonalInfo Column ****/

		/* Add an unbound column so that we can use it's header to visually group */ 
		/* together the Photo, FirstName, LastName, and Title columns. */
		gridCol				   = band:Columns:Add( "personalInfo", "Personal Info" ).
		gridCol:SortIndicator   = SortIndicator:Disabled.
		/* Prevent the user from being able to tab into cells of this column (the cells are not visible).*/
		gridCol:CellActivation  = Activation:Disabled.
		/* Center the text in the column header. */
		gridCol:Header:Appearance:TextHAlign = Infragistics.Win.HAlign:Center.
		info				   = gridCol:RowLayoutColumnInfo.
		/* Setting the PreferredCellSize to (1,1) makes the cells for this column not visible. */
		info:PreferredCellSize = new System.Drawing.Size( 1, 1 ).
		info:MinimumCellSize   = new System.Drawing.Size( 1, 1).
		info:AllowCellSizing   = RowLayoutSizing:None.
		info:SpanX			   = 4.
		info:SpanY			   = 2.
		info:OriginX		   = 0.
		info:OriginY		   = 0.

		/***** Address Column ****/

		gridCol       = band:Columns[ "Address" ].
		info         = gridCol:RowLayoutColumnInfo.
		info:SpanX   = 2.
		info:SpanY   = 2.
		info:OriginX = 4.
		info:OriginY = 2.

		/* Request that, if possible, the cells in the "Address" column should be 150 pixels wide.*/
		/* Specifying a height of 0 means that there is no preferred height for the cells in this column. */
		info:PreferredCellSize = new System.Drawing.Size( 150, 0 ).
		
        /***** Address2 Column ****/

		gridCol       = band:Columns[ "Address2" ].
		info         = gridCol:RowLayoutColumnInfo.
		info:SpanX   = 2.
		info:SpanY   = 2.
		info:OriginX = 4.
		info:OriginY = 4.

		/* Request that, if possible, the cells in the "Address2" column should be 150 pixels wide.*/
		/* Specifying a height of 0 means that there is no preferred height for the cells in this column. */
		info:PreferredCellSize = new System.Drawing.Size( 150, 0 ).

		/******* City Column *****/

		info         = band:Columns[ "City" ]:RowLayoutColumnInfo.
		info:SpanX   = 2.
		info:SpanY   = 2.
		info:OriginX = 4.
		info:OriginY = 6.
		
		/******* HomePhone Column ****/

		info         = band:Columns[ "HomePhone" ]:RowLayoutColumnInfo.
		info:SpanX   = 2.
		info:SpanY   = 2.
		info:OriginX = 6.
		info:OriginY = 2.
		
		/******* PostalCode Column *****/

		info         = band:Columns[ "PostalCode" ]:RowLayoutColumnInfo.
		info:SpanX   = 2.
		info:SpanY   = 2.
		info:OriginX = 6.
		info:OriginY = 4.
		
		/****** Country Column *******/

		info         = band:Columns[ "Country" ]:RowLayoutColumnInfo.
		info:SpanX   = 2.
		info:SpanY   = 2.
		info:OriginX = 6.
		info:OriginY = 6.
		
		/******* Notes Column *******/

		gridCol       = band:Columns[ "Notes" ].			
		info         = gridCol:RowLayoutColumnInfo.
		info:SpanX   = 2.
		info:SpanY   = 6.
		info:OriginX = 8.
		info:OriginY = 2.

		/* Allow the "Notes" cells to show their text on more than one line. */
		gridCol:CellMultiLine = Infragistics.Win.DefaultableBoolean:True.

		/* Request that, if possible, the cells in the "Notes" column should 
		   be 300 pixels wide and 80 pixels high. */
		info:PreferredCellSize = new System.Drawing.Size( 300, 80 ).
		
		/******* AddressInfo Column ******/

		/* Add an unbound column so that we can use it's header to visually group */ 
		/* together the Address, City, HomePhone, PostalCode, Country, and Notes columns. */
		gridCol				   = band:Columns:Add( "addressInfo", "Address Info" ).
		gridCol:SortIndicator   = SortIndicator:Disabled.
		/* Prevent the user from being able to tab into cells of this column (the cells are not visible).*/
		gridCol:CellActivation  = Activation:Disabled.
		/* Center the text in the column header. */
		gridCol:Header:Appearance:TextHAlign = Infragistics.Win.HAlign:Center.
		info				   = gridCol:RowLayoutColumnInfo.
		/* Setting the PreferredCellSize to (1,1) makes the cells for this column not visible. */
		info:PreferredCellSize = new System.Drawing.Size( 1, 1 ).
		info:MinimumCellSize   = new System.Drawing.Size( 1, 1 ).
		info:AllowCellSizing   = RowLayoutSizing:None.
		info:SpanX			   = 6.
		info:SpanY			   = 2.
		info:OriginX		   = 4.
		info:OriginY		   = 0.	
	end method.
	
	method private void SetupRowLayoutForCardViewRuntimeGrid():
		
		/******************************************************************************** 
		Here is the arrangement of the columns that we are going to setup in this method.
		The size of the cells in the diagram are rough estimates.
		
		*********************************************************************************
		* <<<SUMMARY INFO>>>	   									 (Expansion Button) *
		**********************************************|**********************************
		* PHOTO                                       | FIRSTNAME                       *
		*	                                          |**********************************
		*                                             | LASTNAME                        *
		*	                                          |**********************************
		*                                             | TITLE                           *
		*	                                          |**********************************
		*                                             | STARTDATE                       *
		*	                                          |**********************************
		*                                             |                                 *
		**********************************************|**********************************
		* HOMEPHONE                                   |                                 *
		**********************************************|**********************************
		* ADDRESS                                     |                                 *
		**********************************************|**********************************
		* ADDRESS2                                    |                                 *
		**********************************************|**********************************
		* CITY                                        | POSTALCODE                      *
		**********************************************|**********************************
		* REGION                                      | COUNTRY                         *
		**********************************************|**********************************
		* NOTES                                                                         *
		*                                                                               *
		*                                                                               *
		*                                                                               *
		*                                                                               *
		*********************************************************************************

		
		The SpanX/SpanY sizes used are multiples of 2, so if later we want to make one column half the  
		width or height of its neighboring columns then we can set its Span values to odd numbers.
		Another benefit of using multiples of 2 for the SpanX/SpanY is if you decide to use the merge mode
		for the labels and cells.  In that case, the layout of the column headers will appear identical to the
		layout of the default "non-merged mode", only if we base our span values on multiples of 2.
		
		For an in depth explanation of constructing row layouts in code you should read the 
		tutorial called "Using Row Layouts" in the WinGrid documentation.
		In the WinGrid documentation, open the "Contents" view and you will find the file here:
		-Tutorials: Learn To Use WinGrid
			  -Filtering, Summarizing & Data Presentation
				 -Using Row Layouts
		**********************************************************************/
		
		define variable band    as UltraGridBand no-undo.
        define variable gridCol as UltraGridColumn no-undo. 
	    define variable i       as integer no-undo. 
        define variable info    as RowLayoutColumnInfo no-undo.
		
		/* Get a reference to the band and set it to use row layouts and the "compressed" style of card view. */
		band  = ultraGridCardViewRuntime:DisplayLayout:Bands[0].
		band:UseRowLayout       = true.
		band:CardView           = true.
		band:CardSettings:Style = CardStyle:Compressed.

		/* Allow the photo column of a row to display the pictures in the data as opposed to the text representation of those images */
		band:Columns["Photo"]:Editor = new Infragistics.Win.EmbeddableImageRenderer().
		/* Allow the notes cell text to span multiple lines */
		band:Columns["Notes"]:CellMultiLine = Infragistics.Win.DefaultableBoolean:True.
		/* Align the names of the Employess centered vertically and left aligned horizontally */
		band:Override:CardCaptionAppearance:TextVAlign = Infragistics.Win.VAlign:Middle.
		band:Override:CardCaptionAppearance:TextHAlign = Infragistics.Win.HAlign:Left.
		/* Center the images in the cells of the "Photo" column. */
		band:Override:CellAppearance:ImageVAlign = Infragistics.Win.VAlign:Middle.
		band:Override:CellAppearance:ImageHAlign = Infragistics.Win.HAlign:Center.

		/* Hide the columns that we don't want to see. */
        band:Columns[ "EmpNum"           ]:Hidden = true.
		band:Columns[ "DeptCode"         ]:Hidden = true.
		band:Columns[ "WorkPhone"        ]:Hidden = true.
		band:Columns[ "BirthDate"        ]:Hidden = true.
		band:Columns[ "VacationDaysLeft" ]:Hidden = true.
		band:Columns[ "SickDaysLeft"     ]:Hidden = true.
		
		/****  Photo Column ******/

		info                   = band:Columns[ "Photo" ]:RowLayoutColumnInfo.
		/* Don't show a label for the Photo column. */
		info:LabelPosition     = LabelPosition:None.
		info:SpanX             =  2.
		info:SpanY             = 10.
		info:OriginX           =  0.
		info:OriginY		   =  0.
		info:PreferredCellSize = new System.Drawing.Size( 233, 150 ).

		/******* HomePhone Column *******/

		info                    = band:Columns[ "HomePhone" ]:RowLayoutColumnInfo.
		info:SpanX              =  2.
		info:SpanY              =  2.
		info:OriginX            =  0.
		info:OriginY		    = 10.
		info:PreferredCellSize  = new System.Drawing.Size( 164, 22 ).
		info:PreferredLabelSize = new System.Drawing.Size(  75, 22 ).

		/******* Address Column *****/

		info                    = band:Columns[ "Address" ]:RowLayoutColumnInfo.
		info:SpanX              =  2.
		info:SpanY              =  2.
		info:OriginX            =  0.
		info:OriginY		    = 12.
		info:PreferredCellSize  = new System.Drawing.Size( 164, 22 ).
		info:PreferredLabelSize = new System.Drawing.Size(  71, 22 ).

        /******* Address2 Column *****/

		info                    = band:Columns[ "Address2" ]:RowLayoutColumnInfo.
		info:SpanX              =  2.
		info:SpanY              =  2.
		info:OriginX            =  0.
		info:OriginY		    = 14.
		info:PreferredCellSize  = new System.Drawing.Size( 164, 22 ).
		info:PreferredLabelSize = new System.Drawing.Size(  71, 22 ).
		
		/****** City Column ******/
		info                    = band:Columns[ "City" ]:RowLayoutColumnInfo.
		info:SpanX              =  2.
		info:SpanY              =  2.
		info:OriginX            =  0.
		info:OriginY		    = 16.
		info:PreferredCellSize  = new System.Drawing.Size( 164, 22 ).
		info:PreferredLabelSize = new System.Drawing.Size(  65, 16 ).

		/****** State Column *******/
		info                    = band:Columns[ "State" ]:RowLayoutColumnInfo.
		info:SpanX              =  2.
		info:SpanY              =  2.
		info:OriginX            =  0.
		info:OriginY		    = 18.
		info:PreferredCellSize  = new System.Drawing.Size( 164, 22 ).
		info:PreferredLabelSize = new System.Drawing.Size( 65, 16 ).

		/**** Notes Column *******/

		info                    = band:Columns[ "Notes" ]:RowLayoutColumnInfo.
		info:SpanX              =  4.
		info:SpanY              =  6.
		info:OriginX            =  0.
		info:OriginY		    = 20.
		info:PreferredCellSize  = new System.Drawing.Size( 285, 118 ).
		info:PreferredLabelSize = new System.Drawing.Size(  65, 118 ).

		/********* FirstName Column *******/

		info                    = band:Columns[ "FirstName" ]:RowLayoutColumnInfo.
		info:SpanX              = 2.
		info:SpanY              = 2.
		info:OriginX            = 2.
		info:OriginY		    = 0.
		info:PreferredCellSize  = new System.Drawing.Size( 115, 26 ).
		info:PreferredLabelSize = new System.Drawing.Size(  72, 26 ).

		/******* LastName Column *****/

		info                    = band:Columns[ "LastName" ]:RowLayoutColumnInfo.
		info:SpanX              = 2.
		info:SpanY              = 2.
		info:OriginX            = 2.
		info:OriginY		    = 2.
		info:PreferredCellSize  = new System.Drawing.Size( 120, 26).
		info:PreferredLabelSize = new System.Drawing.Size(  72, 26 ).

		/********* Position Column *******/

		info                    = band:Columns[ "Position" ]:RowLayoutColumnInfo.
		info:SpanX              = 2.
		info:SpanY              = 2.
		info:OriginX            = 2.
		info:OriginY		    = 6.
		info:PreferredCellSize  = new System.Drawing.Size( 120, 26 ).
		info:PreferredLabelSize = new System.Drawing.Size(  45, 26 ).

		/******* StartDate Column *******/

		info                    = band:Columns[ "StartDate" ]:RowLayoutColumnInfo.
		info:SpanX              = 2.
		
		/* SpanY 2 should be ok, but causes this column to fill the rest of the */ 
		/* space and adjust with the photo even if it has SpanY 10. */
		/* this is not an issue in the design time version; the properties are */
		/* not exact match so there is likely some difference elsewhere that */ 
		/* can explain this  */
		info:SpanY              = 1. 	
		info:OriginX            = 2.
		info:OriginY		    = 8.
		info:PreferredCellSize  = new System.Drawing.Size( 91, 26 ).
		info:PreferredLabelSize = new System.Drawing.Size( 51, 26 ).

		
		/******* PostalCode Column *******/

		info                    = band:Columns[ "PostalCode" ]:RowLayoutColumnInfo.
		info:SpanX              =  2.
		info:SpanY              =  2.
		info:OriginX            =  2.
		info:OriginY		    = 16.
		info:PreferredCellSize  = new System.Drawing.Size( 100, 22 ).
		info:PreferredLabelSize = new System.Drawing.Size(  65, 16 ).

		/******** Country Column *******/

		info                    = band:Columns[ "Country" ]:RowLayoutColumnInfo.
		info:SpanX              =  2.
		info:SpanY              =  2.
		info:OriginX            =  2.
		info:OriginY		    = 18.
		info:PreferredCellSize  = new System.Drawing.Size( 100, 22 ).
		info:PreferredLabelSize = new System.Drawing.Size(  46, 16 ).
    end method.	
	
    /*------------------------------------------------------------------------------
			Purpose: Called from both Employee CardView ultragrid InitializeRow 
			         event handlers 																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/	
    method protected void EmployeeCardViewInitializeRow(eventArgs AS Infragistics.Win.UltraWinGrid.InitializeRowEventArgs): 
        define variable eir as Infragistics.Win.EmbeddableImageRenderer no-undo.
	 
	    /* Set the Caption of each card to be the Full Name of the Employee in that row */
		eventArgs:Row:CardCaption = "Employee: " 
		                  + eventArgs:Row:Cells["FirstName"]:Text + " "
		                  + eventArgs:Row:Cells["LastName"]:Text.

		/* Expand two rows when the form loads based on the last name of the employee in that row */
		if(eventArgs:Row:Cells["LastName"]:Text = "Fuller" or eventArgs:Row:Cells["LastName"]:Text = "Callahan") then 
			eventArgs:Row:IsCardCompressed = false.

		if(eventArgs:Row:Cells["LastName"]:Text = "Fuller") then
		do:
			/* For one of the rows, create a new EmbeddableImageRenderer for the Photo cell */
			eir = new Infragistics.Win.EmbeddableImageRenderer().
	    
			/* Change the color and depth of the shadow under the photo */
			eir:BorderShadowColor = System.Drawing.Color:FromArgb(255,128,128).
			eir:BorderShadowDepth = 12.

			/* Set the ImageRenderer as the editor for the cell */
			eventArgs:Row:Cells["Photo"]:Editor = eir.
		end.
		RETURN.
    end method.
   
    /* implements ISamplesBase interface  */
    method public void ShowMe( owner as System.Windows.Forms.Form  ):
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
	METHOD PRIVATE VOID btnTitle_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        if valid-object(this-object:Owner) then
            HideMe().
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
	METHOD PRIVATE VOID frmRowLayout_FormClosing( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.FormClosingEventArgs ):
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
	METHOD PRIVATE VOID frmRowLayout_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
    	/* Set the data source of the UltraGrids */
    	assign
		    ultraGridEmployeesDesignTime:DataSource = GetEmployeeSource(pbsEmployeeSource) 
		    ultraGridEmployeesRuntime:DataSource    = GetEmployeeSource(?) 
		    ultraGridCardViewDesignTime:DataSource  = GetEmployeeSource(?) 
		    ultraGridCardViewRuntime:DataSource     = GetEmployeeSource(?) 
		    ultraGridRegularView:DataSource         = GetCustOrderSource().		

		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGridRegularView_InitializeLayout( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.InitializeLayoutEventArgs ):
        /* Load the saved layout. */				
		e:Layout:Load( "WinGrid/SamplesExplorer/RowLayout2.lyt" ).	
		
		LoadEnumCombo(comboBoxCellSizing,"Infragistics.Win.UltraWinGrid.RowLayoutSizing").
		LoadEnumCombo(comboBoxLabelSizing,"Infragistics.Win.UltraWinGrid.RowLayoutSizing").
		LoadEnumCombo(comboBoxLabelSpanSizing, "Infragistics.Win.Layout.GridBagLayoutAllowSpanSizing").
		LoadEnumCombo(comboBoxCellSpanSizing, "Infragistics.Win.Layout.GridBagLayoutAllowSpanSizing").
		LoadEnumCombo(comboBoxLabelPosition,"Infragistics.Win.UltraWinGrid.LabelPosition").
 
		FillBandsCombo( ).

        /*
		this.ultraGridRegularView.Rows.ExpandAll( true ).
        */
        /* Expand the first band to reveal its first band row. */
		if ( ultraGridRegularView:Rows:Count > 0 ) then
        do: 
            ultraGridRegularView:Rows[0]:Expanded = true.
            if ultraGridRegularView:Rows[0]:ChildBands[0]:Rows:Count > 0 then
                ultraGridRegularView:Rows[0]:ChildBands[0]:Rows[0]:Expanded = true.
        end.
		/* Set some scrolling related properties. */
		e:Layout:ScrollStyle = ScrollStyle:Immediate.
		 
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID comboBoxBands_SelectedIndexChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		InitFieldsToSelectedBand( ). 
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID checkBoxUseRowLayout_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable band as Infragistics.Win.UltraWinGrid.UltraGridBand no-undo.
	
		band = cast(comboBoxBands:SelectedItem,UltraGridBand).
		band:UseRowLayout = checkBoxUseRowLayout:Checked.		
		groupBoxLabelStyle:Enabled = band:UseRowLayout.
		groupBoxSizing:Enabled = band:UseRowLayout.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID radioButtonWithCellData_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable band as Infragistics.Win.UltraWinGrid.UltraGridBand no-undo.
	
		band = cast(comboBoxBands:SelectedItem,UltraGridBand).
		
		if radioButtonSeparate:Checked then
			band:RowLayoutLabelStyle = Infragistics.Win.UltraWinGrid.RowLayoutLabelStyle:Separate.
		else
			band:RowLayoutLabelStyle = Infragistics.Win.UltraWinGrid.RowLayoutLabelStyle:WithCellData.

		comboBoxLabelPosition:Enabled = Progress.Util.EnumHelper:AreEqual(band:RowLayoutLabelStyle,Infragistics.Win.UltraWinGrid.RowLayoutLabelStyle:WithCellData).
		
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID comboBoxLabelPosition_SelectedIndexChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable band as UltraGridBand no-undo.
	    define variable labelPos as LabelPosition no-undo.
		band = cast(comboBoxBands:SelectedItem,UltraGridBand).
	    labelPos = cast(comboBoxLabelPosition:SelectedItem,LabelPosition).

		band:RowLayoutLabelPosition = labelPos.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID buttonExpandAllRows_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		ultraGridRegularView:Rows:ExpandAll( true ).
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID buttonCollapseAllRows_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		ultraGridRegularView:Rows:CollapseAll( true ).
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID comboBoxLabelSizing_SelectedIndexChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    define variable band as UltraGridBand no-undo.
		define variable sizingMode as RowLayoutSizing no-undo.
	    
	    band = cast(comboBoxBands:SelectedItem,UltraGridBand).
	    sizingMode = cast(comboBoxLabelSizing:SelectedItem,RowLayoutSizing).

		band:Override:AllowRowLayoutLabelSizing = sizingMode.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID comboBoxCellSizing_SelectedIndexChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    define variable band as UltraGridBand no-undo.
		define variable sizingMode as RowLayoutSizing no-undo.
	    
	    band = cast(comboBoxBands:SelectedItem,UltraGridBand).
	    sizingMode = cast(comboBoxCellSizing:SelectedItem,RowLayoutSizing).

		band:Override:AllowRowLayoutCellSizing = sizingMode.
		
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID radioButtonSeparate_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		radioButtonWithCellData_CheckedChanged( ?, ? ).
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID checkBoxAllowMoving_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable band as UltraGridBand no-undo.
		band = cast(comboBoxBands:SelectedItem,UltraGridBand).
		if checkBoxAllowMoving:Checked then
			band:Override:AllowColMoving = AllowColMoving:WithinBand.    
		else
	    	band:Override:AllowColMoving = AllowColMoving:NotAllowed.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID checkBoxAllowSwapping_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable band as UltraGridBand no-undo.
		band = cast(comboBoxBands:SelectedItem,UltraGridBand).
		if checkBoxAllowSwapping:Checked then
			band:Override:AllowColSwapping = AllowColSwapping:WithinBand.
		else
			band:Override:AllowColSwapping = AllowColSwapping:NotAllowed.
		
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID comboBoxLabelSpanSizing_SelectedIndexChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable band as UltraGridBand no-undo.
		define variable val as Infragistics.Win.Layout.GridBagLayoutAllowSpanSizing no-undo.

		band = cast(comboBoxBands:SelectedItem,UltraGridBand).
		val = cast(comboBoxLabelSpanSizing:SelectedItem,Infragistics.Win.Layout.GridBagLayoutAllowSpanSizing).
	    band:Override:AllowRowLayoutLabelSpanSizing = val.
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID checkBoxRowAutoSizing_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable band as UltraGridBand no-undo.
	
	    band = cast(comboBoxBands:SelectedItem,UltraGridBand).
		
		if checkBoxRowAutoSizing:Checked then
		 	/* Setting the RowSizing to AutoFree or AutoFixed will cause the WinGrid to
			   automatically size rows so the multiline cell contents fit. Note in order to
			   take advantage of this functionality you have to have multi-line columns
			   in UltraGrid. A column can be made multi-line by setting its CellMultiLine
			   property. This will cause the cells of the column to auto-wrap the text. */
			band:Override:RowSizing = RowSizing:AutoFree.
		 
		else
			band:Override:RowSizing = RowSizing:Default.
			
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID checkBoxWrapHeaderText_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable band as UltraGridBand no-undo.
	
	    band = cast(comboBoxBands:SelectedItem,UltraGridBand).
		if checkBoxWrapHeaderText:Checked then
			/* Setting the WrapHeaderText to True will cause the WinGrid to wrap header
			   caption if not enough width is available to fully display the header caption.
			   The height of the header will also be increased to accomodate the wrapped text. */
			band:Override:WrapHeaderText = Infragistics.Win.DefaultableBoolean:True.		 
		else
			band:Override:WrapHeaderText = Infragistics.Win.DefaultableBoolean:False.
		 
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGridEmployeesDesignTime_InitializeLayout( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.InitializeLayoutEventArgs ):
		define variable imgEditor as Infragistics.Win.EmbeddableImageRenderer no-undo.
		/* Allow the photo column of a row to display the picture in the BLOB */
		imgEditor = new Infragistics.Win.EmbeddableImageRenderer().

		/* Give the images a slim grayish border. */
		imgEditor:BorderShadowColor = System.Drawing.Color:FromArgb(255,128,128).
		imgEditor:BorderShadowDepth = 2.
		e:Layout:Bands[0]:Columns["Photo"]:Editor = imgEditor.
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGridCardViewDesignTime_InitializeLayout( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.InitializeLayoutEventArgs ):
		define variable imgEditor as Infragistics.Win.EmbeddableImageRenderer no-undo.
		/* Allow the photo column of a row to display the picture in the BLOB */
		imgEditor = new Infragistics.Win.EmbeddableImageRenderer().

		/* Give the images a slim grayish border. */
		imgEditor:BorderShadowColor = System.Drawing.Color:FromArgb(255,128,128).

		e:Layout:Bands[0]:Columns["Photo"]:Editor = imgEditor.
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGridEmployeesRuntime_InitializeLayout( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.InitializeLayoutEventArgs ):
			define variable imgEditor as Infragistics.Win.EmbeddableImageRenderer no-undo.
		    define variable imageFile as character no-undo.
		    define variable appearance as Infragistics.Win.AppearanceBase no-undo.
		           
		    /* Allow the photo column of a row to display the picture in the BLOB */
	        imgEditor = new Infragistics.Win.EmbeddableImageRenderer().
	        
			/* Give the images a slim grayish border and align them to be in the middle of the cell. */
			imgEditor:BorderShadowColor = System.Drawing.Color:FromArgb(255,128,128).
			imgEditor:BorderShadowDepth = 2.
			e:Layout:Bands[0]:Columns["Photo"]:Editor = imgEditor.
			e:Layout:Bands[0]:Columns["Photo"]:CellAppearance:ImageHAlign = Infragistics.Win.HAlign:Center.
			e:Layout:Bands[0]:Columns["Photo"]:CellAppearance:ImageVAlign = Infragistics.Win.VAlign:Middle.

			/* Give the "Photo" column header an image of a camera to show. */
			imageFile = "Graphics/Pictures/camera.gif".
			if search(imageFile) <> ? then
			do: 
				appearance = e:Layout:Bands[0]:Columns[ "Photo" ]:Header:Appearance.
				appearance:Image          = System.Drawing.Bitmap:FromFile(imageFile).
				appearance:ImageHAlign    = Infragistics.Win.HAlign:Left.
				appearance:ImageVAlign    = Infragistics.Win.VAlign:Middle.					  
			end.

			/* Call the helper method that will setup the row layout. */
			SetupRowLayoutForEmployeesRuntimeGrid().  
		RETURN.

	END METHOD.
	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGridCardViewRuntime_InitializeLayout( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.InitializeLayoutEventArgs ):
 	    SetupRowLayoutForCardViewRuntimeGrid(). 
		e:Layout:Override:CellAppearance:TextVAlign = Infragistics.Win.VAlign:Middle.
		
		RETURN.

	END METHOD.

	
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGridCardViewRuntime_InitializeRow( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.InitializeRowEventArgs ):
		EmployeeCardViewInitializeRow(e).
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGridCardViewDesignTime_InitializeRow( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.InitializeRowEventArgs ):
		EmployeeCardViewInitializeRow(e).
		RETURN.

	END METHOD. 

	DESTRUCTOR PUBLIC frmRowLayout ( ):

		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.

	END DESTRUCTOR.

END CLASS.