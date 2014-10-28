 
 /*------------------------------------------------------------------------
    File        : Form1
    Purpose     : 
    Syntax      : 
    Description : Real time updates of UltraWinGrid
    Author(s)   : vza
    Created     : Tue Jul 15 09:41:13 CEST 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

USING System.*.
USING System.Drawing.*.
USING System.Collections.*.
USING System.ComponentModel.*.
USING System.Windows.Forms.*.
USING System.Data.*.

USING Infragistics.Win.*.
USING Infragistics.Win.UltraWinGrid.*.
USING Infragistics.Win.UltraWinDataSource.*.
USING Infragistics.Win.UltraWinCalcManager.*.

USING WinCalcManager.RealTimeUpdating.CarStatsGenerator.

CLASS WinCalcManager.RealTimeUpdating.Form1 INHERITS Form   : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.

	DEFINE PRIVATE VARIABLE ultraDataSource1 AS Infragistics.Win.UltraWinDataSource.UltraDataSource NO-UNDO.

	DEFINE PRIVATE VARIABLE ultraExplorerBar1 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBar NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExplorerBarContainerControl1 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarContainerControl NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraButton1 AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraComboEditor1 AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraComboEditor2 AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel2 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel3 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExplorerBarContainerControl2 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarContainerControl NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel5 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE lblAverageSpeed AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraCalcManager1 AS Infragistics.Win.UltraWinCalcManager.UltraCalcManager NO-UNDO.
	DEFINE PRIVATE VARIABLE lblHiSpeed AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE lblLoSpeed AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel4 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel6 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE lblLeadingDriver AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel7 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE cmdNewRace AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE coRefreshInterval AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE coMilesInRace AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE cmdStartStopRace AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel1 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel8 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.

	DEFINE PRIVATE VARIABLE splitter1 AS System.Windows.Forms.Splitter NO-UNDO.

	DEFINE PRIVATE VARIABLE ultraGrid1 AS Infragistics.Win.UltraWinGrid.UltraGrid NO-UNDO.

	DEFINE PRIVATE VARIABLE label1 AS System.Windows.Forms.Label NO-UNDO.
	
	DEFINE PRIVATE VARIABLE vcarStatsGenerator AS WinCalcManager.RealTimeUpdating.CarStatsGenerator NO-UNDO.				
	
	DEFINE PUBLIC PROPERTY CarStatsGenerator AS  CarStatsGenerator  NO-UNDO 
	GET():
	  IF (THIS-OBJECT:vcarStatsGenerator  =  ?) THEN
  	    THIS-OBJECT:vcarStatsGenerator = NEW CarStatsGenerator(THIS-OBJECT:ultraGrid1, THIS-OBJECT:ultraDataSource1, THIS-OBJECT:ultraCalcManager1).
	  RETURN THIS-OBJECT:vcarStatsGenerator.
	END GET.
	SET.

 	CONSTRUCTOR PUBLIC Form1 (  ):
		DEFINE VARIABLE band    AS UltraGridBand NO-UNDO.
		DEFINE VARIABLE summary AS SummarySettings NO-UNDO.
		SUPER().
		InitializeComponent ( ).
        /* Set the grid's row and column selection styles.*/
        THIS-OBJECT:ultraGrid1:DisplayLayout:Override:SelectTypeRow = SelectType:Single.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:SelectTypeCol = SelectType:None.


        /* Set the SelectedRowAppearance so that the selected row stands out.  We automatically select the row that represents*/
        /* the leading driver (i.e., the driver with the most miles traveled)                                                 */
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:SelectedRowAppearance:BackGradientStyle	= GradientStyle:VerticalBump.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:SelectedRowAppearance:FontData:Bold		= DefaultableBoolean:TRUE.

        /* Set the sort order of the grid's rows (drivers) based on miles traveled, with the leading car at the top.*/
		THIS-OBJECT:ultraGrid1:DisplayLayout:Bands["Cars"]:SortedColumns:Add("MilesTraveled", true).


        /* Hide some data columns that aren't important for the display.*/
        band				= THIS-OBJECT:ultraGrid1:DisplayLayout:Bands[0].
		band:Columns["MaxSpeed"]:Hidden		= TRUE.
		band:Columns["FuelCapacity"]:Hidden	= TRUE.
		band:Columns["MPG"]:Hidden			= TRUE.


        /* Add a hidden summary column that uses a calc engine formula to calculate the maximum value for MilesTraveled across all rows (drivers).*/
        /* We will use this summary value to compare against MilesTraveled for each row (driver) to determine the driver that is in the lead      */
        summary			= band:Summaries:Add("MaxMilesTraveled", "max( [MilesTraveled] )", SummaryPosition:UseSummaryPositionColumn, band:Columns["MilesTraveled"]).
        summary:Hidden	= TRUE.


        /* Call our SetPropertyNameAndFormula helper function to set the PropertyName and Formula properties on the CalcSettings          */
        /* object for each of the label controls in our Race Statistics section.  These formulas calculate the average, min and max of the*/
        /* CurrentSpeed across all rows (drivers) in the grid.                                                                            */
        THIS-OBJECT:SetPropertyNameAndFormula(THIS-OBJECT:lblAverageSpeed, "Text", "if( sum( [//ultraGrid1/Cars/CurrentSpeed(*)] ) > 0 , average( [//ultraGrid1/Cars/CurrentSpeed(*)] ) , 0 )").
		THIS-OBJECT:SetPropertyNameAndFormula(THIS-OBJECT:lblHiSpeed, "Text", "max( [//ultraGrid1/Cars/CurrentSpeed(*)] )").
		THIS-OBJECT:SetPropertyNameAndFormula(THIS-OBJECT:lblLoSpeed, "Text", "min( [//ultraGrid1/Cars/CurrentSpeed(*)] )").


        /* Since we will be calulcating on a frequent basis, localize the '#Calculating" string to an empty string to*/
        /* reduce flicker.                                                                                           */
		Infragistics.Win.Resources:Customizer:SetCustomizedString("UltraCalc_StatusCode_Calculating", "").

	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC Form1 ( ):
		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.

	END DESTRUCTOR.


	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID Form1_FormClosing( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.FormClosingEventArgs ):
	    IF THIS-OBJECT:CarStatsGenerator:RaceInProgress = TRUE THEN
            cmdStartStopRace:PerformClick().
	END METHOD.


 	METHOD PRIVATE VOID InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

		THIS-OBJECT:components = NEW System.ComponentModel.Container().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE valueListItem1 AS Infragistics.Win.ValueListItem NO-UNDO.
		valueListItem1 = NEW Infragistics.Win.ValueListItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE valueListItem2 AS Infragistics.Win.ValueListItem NO-UNDO.
		valueListItem2 = NEW Infragistics.Win.ValueListItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE valueListItem3 AS Infragistics.Win.ValueListItem NO-UNDO.
		valueListItem3 = NEW Infragistics.Win.ValueListItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE valueListItem4 AS Infragistics.Win.ValueListItem NO-UNDO.
		valueListItem4 = NEW Infragistics.Win.ValueListItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE valueListItem5 AS Infragistics.Win.ValueListItem NO-UNDO.
		valueListItem5 = NEW Infragistics.Win.ValueListItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE valueListItem6 AS Infragistics.Win.ValueListItem NO-UNDO.
		valueListItem6 = NEW Infragistics.Win.ValueListItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance1 AS Infragistics.Win.Appearance NO-UNDO.
		appearance1 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance2 AS Infragistics.Win.Appearance NO-UNDO.
		appearance2 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance3 AS Infragistics.Win.Appearance NO-UNDO.
		appearance3 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance4 AS Infragistics.Win.Appearance NO-UNDO.
		appearance4 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance5 AS Infragistics.Win.Appearance NO-UNDO.
		appearance5 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance17 AS Infragistics.Win.Appearance NO-UNDO.
		appearance17 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE valueListItem7 AS Infragistics.Win.ValueListItem NO-UNDO.
		valueListItem7 = NEW Infragistics.Win.ValueListItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE valueListItem8 AS Infragistics.Win.ValueListItem NO-UNDO.
		valueListItem8 = NEW Infragistics.Win.ValueListItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE valueListItem9 AS Infragistics.Win.ValueListItem NO-UNDO.
		valueListItem9 = NEW Infragistics.Win.ValueListItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE valueListItem10 AS Infragistics.Win.ValueListItem NO-UNDO.
		valueListItem10 = NEW Infragistics.Win.ValueListItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE valueListItem11 AS Infragistics.Win.ValueListItem NO-UNDO.
		valueListItem11 = NEW Infragistics.Win.ValueListItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE valueListItem12 AS Infragistics.Win.ValueListItem NO-UNDO.
		valueListItem12 = NEW Infragistics.Win.ValueListItem().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraDataColumn1 AS Infragistics.Win.UltraWinDataSource.UltraDataColumn NO-UNDO.
		ultraDataColumn1 = NEW Infragistics.Win.UltraWinDataSource.UltraDataColumn("CarNumber").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraDataColumn2 AS Infragistics.Win.UltraWinDataSource.UltraDataColumn NO-UNDO.
		ultraDataColumn2 = NEW Infragistics.Win.UltraWinDataSource.UltraDataColumn("DriverName").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraDataColumn3 AS Infragistics.Win.UltraWinDataSource.UltraDataColumn NO-UNDO.
		ultraDataColumn3 = NEW Infragistics.Win.UltraWinDataSource.UltraDataColumn("CurrentSpeed").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraDataColumn4 AS Infragistics.Win.UltraWinDataSource.UltraDataColumn NO-UNDO.
		ultraDataColumn4 = NEW Infragistics.Win.UltraWinDataSource.UltraDataColumn("MaxSpeed").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraDataColumn5 AS Infragistics.Win.UltraWinDataSource.UltraDataColumn NO-UNDO.
		ultraDataColumn5 = NEW Infragistics.Win.UltraWinDataSource.UltraDataColumn("FuelCapacity").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraDataColumn6 AS Infragistics.Win.UltraWinDataSource.UltraDataColumn NO-UNDO.
		ultraDataColumn6 = NEW Infragistics.Win.UltraWinDataSource.UltraDataColumn("MPG").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraDataColumn7 AS Infragistics.Win.UltraWinDataSource.UltraDataColumn NO-UNDO.
		ultraDataColumn7 = NEW Infragistics.Win.UltraWinDataSource.UltraDataColumn("MilesTraveled").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarGroup1 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup NO-UNDO.
		ultraExplorerBarGroup1 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance18 AS Infragistics.Win.Appearance NO-UNDO.
		appearance18 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraExplorerBarGroup2 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup NO-UNDO.
		ultraExplorerBarGroup2 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance19 AS Infragistics.Win.Appearance NO-UNDO.
		appearance19 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance20 AS Infragistics.Win.Appearance NO-UNDO.
		appearance20 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance21 AS Infragistics.Win.Appearance NO-UNDO.
		appearance21 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance6 AS Infragistics.Win.Appearance NO-UNDO.
		appearance6 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE resources AS System.Resources.ResXResourceSet NO-UNDO.
		resources = Progress.Util.ResourceHelper:Load("WinCalcManager\RealTimeUpdating\Form1.resx", PROPATH).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraGridBand1 AS Infragistics.Win.UltraWinGrid.UltraGridBand NO-UNDO.
		ultraGridBand1 = NEW Infragistics.Win.UltraWinGrid.UltraGridBand("Cars", -1).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraGridColumn1 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
		ultraGridColumn1 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("CarNumber").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraGridColumn2 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
		ultraGridColumn2 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("DriverName").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraGridColumn3 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
		ultraGridColumn3 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("CurrentSpeed").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraGridColumn4 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
		ultraGridColumn4 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("MaxSpeed").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraGridColumn5 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
		ultraGridColumn5 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("FuelCapacity").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraGridColumn6 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
		ultraGridColumn6 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("MPG").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraGridColumn7 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
		ultraGridColumn7 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("MilesTraveled").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraGridColumn8 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
		ultraGridColumn8 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("MilesRemaining", 0).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance15 AS Infragistics.Win.Appearance NO-UNDO.
		appearance15 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraGridColumn9 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
		ultraGridColumn9 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("FuelRemaining", 1).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance16 AS Infragistics.Win.Appearance NO-UNDO.
		appearance16 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance9 AS Infragistics.Win.Appearance NO-UNDO.
		appearance9 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance10 AS Infragistics.Win.Appearance NO-UNDO.
		appearance10 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance11 AS Infragistics.Win.Appearance NO-UNDO.
		appearance11 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance12 AS Infragistics.Win.Appearance NO-UNDO.
		appearance12 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance13 AS Infragistics.Win.Appearance NO-UNDO.
		appearance13 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance14 AS Infragistics.Win.Appearance NO-UNDO.
		appearance14 = NEW Infragistics.Win.Appearance().
		THIS-OBJECT:ultraExplorerBarContainerControl1 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarContainerControl().
		THIS-OBJECT:label1 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:cmdStartStopRace = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:cmdNewRace = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:coMilesInRace = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:coRefreshInterval = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:ultraLabel2 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel3 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraExplorerBarContainerControl2 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarContainerControl().
		THIS-OBJECT:ultraLabel5 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblAverageSpeed = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblHiSpeed = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblLoSpeed = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel4 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel6 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblLeadingDriver = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel7 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraButton1 = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:ultraComboEditor1 = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:ultraComboEditor2 = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:ultraDataSource1 = NEW Infragistics.Win.UltraWinDataSource.UltraDataSource(THIS-OBJECT:components).
		THIS-OBJECT:ultraExplorerBar1 = NEW Infragistics.Win.UltraWinExplorerBar.UltraExplorerBar().
		THIS-OBJECT:ultraLabel1 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel8 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraCalcManager1 = NEW Infragistics.Win.UltraWinCalcManager.UltraCalcManager(THIS-OBJECT:components).
		THIS-OBJECT:splitter1 = NEW System.Windows.Forms.Splitter().
		THIS-OBJECT:ultraGrid1 = NEW Infragistics.Win.UltraWinGrid.UltraGrid().
		THIS-OBJECT:ultraExplorerBarContainerControl1:SuspendLayout().
		CAST(THIS-OBJECT:coMilesInRace, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:coRefreshInterval, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraExplorerBarContainerControl2:SuspendLayout().
		CAST(THIS-OBJECT:ultraComboEditor1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraComboEditor2, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraDataSource1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraExplorerBar1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraExplorerBar1:SuspendLayout().
		CAST(THIS-OBJECT:ultraCalcManager1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraGrid1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* ultraExplorerBarContainerControl1 */
		/*  */
		THIS-OBJECT:ultraExplorerBarContainerControl1:Controls:Add(THIS-OBJECT:label1).
		THIS-OBJECT:ultraExplorerBarContainerControl1:Controls:Add(THIS-OBJECT:cmdStartStopRace).
		THIS-OBJECT:ultraExplorerBarContainerControl1:Controls:Add(THIS-OBJECT:cmdNewRace).
		THIS-OBJECT:ultraExplorerBarContainerControl1:Controls:Add(THIS-OBJECT:coMilesInRace).
		THIS-OBJECT:ultraExplorerBarContainerControl1:Controls:Add(THIS-OBJECT:coRefreshInterval).
		THIS-OBJECT:ultraExplorerBarContainerControl1:Controls:Add(THIS-OBJECT:ultraLabel2).
		THIS-OBJECT:ultraExplorerBarContainerControl1:Controls:Add(THIS-OBJECT:ultraLabel3).
		THIS-OBJECT:ultraExplorerBarContainerControl1:Location = NEW System.Drawing.Point(28, 56).
		THIS-OBJECT:ultraExplorerBarContainerControl1:Name = "ultraExplorerBarContainerControl1".
		THIS-OBJECT:ultraExplorerBarContainerControl1:Size = NEW System.Drawing.Size(175, 200).
		THIS-OBJECT:ultraExplorerBarContainerControl1:TabIndex = 0.
		/*  */
		/* label1 */
		/*  */
		THIS-OBJECT:label1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:label1:BorderStyle = System.Windows.Forms.BorderStyle:FixedSingle.
		THIS-OBJECT:label1:Location = NEW System.Drawing.Point(3, 46).
		THIS-OBJECT:label1:Name = "label1".
		THIS-OBJECT:label1:Size = NEW System.Drawing.Size(168, 1).
		THIS-OBJECT:label1:TabIndex = 11.
		THIS-OBJECT:label1:UseCompatibleTextRendering = TRUE.
		/*  */
		/* cmdStartStopRace */
		/*  */
		THIS-OBJECT:cmdStartStopRace:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:cmdStartStopRace:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:cmdStartStopRace:Name = "cmdStartStopRace".
		THIS-OBJECT:cmdStartStopRace:Size = NEW System.Drawing.Size(168, 24).
		THIS-OBJECT:cmdStartStopRace:TabIndex = 3.
		THIS-OBJECT:cmdStartStopRace:Text = "Start Race".
		THIS-OBJECT:cmdStartStopRace:Click:SUBSCRIBE(THIS-OBJECT:cmdStartStopRace_Click).
		/*  */
		/* cmdNewRace */
		/*  */
		THIS-OBJECT:cmdNewRace:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:cmdNewRace:Location = NEW System.Drawing.Point(0, 64).
		THIS-OBJECT:cmdNewRace:Name = "cmdNewRace".
		THIS-OBJECT:cmdNewRace:Size = NEW System.Drawing.Size(168, 24).
		THIS-OBJECT:cmdNewRace:TabIndex = 3.
		THIS-OBJECT:cmdNewRace:Text = "Reset Race Data".
		THIS-OBJECT:cmdNewRace:Click:SUBSCRIBE(THIS-OBJECT:cmdNewRace_Click).
		/*  */
		/* coMilesInRace */
		/*  */
		THIS-OBJECT:coMilesInRace:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:coMilesInRace:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		valueListItem1:DataValue = 100.
		valueListItem1:DisplayText = "100".
		valueListItem2:DataValue = 250.
		valueListItem2:DisplayText = "250".
		valueListItem3:DataValue = 500.
		valueListItem3:DisplayText = "500".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar0 AS Infragistics.Win.ValueListItem EXTENT 3 NO-UNDO.
		arrayvar0[1] = valueListItem1.
		arrayvar0[2] = valueListItem2.
		arrayvar0[3] = valueListItem3.
		THIS-OBJECT:coMilesInRace:Items:AddRange(arrayvar0).
		THIS-OBJECT:coMilesInRace:Location = NEW System.Drawing.Point(0, 120).
		THIS-OBJECT:coMilesInRace:Name = "coMilesInRace".
		THIS-OBJECT:coMilesInRace:Size = NEW System.Drawing.Size(168, 21).
		THIS-OBJECT:coMilesInRace:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:coMilesInRace:TabIndex = 2.
		THIS-OBJECT:coMilesInRace:SelectionChanged:SUBSCRIBE(THIS-OBJECT:coMilesInRace_SelectionChanged).
		/*  */
		/* coRefreshInterval */
		/*  */
		THIS-OBJECT:coRefreshInterval:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:coRefreshInterval:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		valueListItem4:DataValue = 500.
		valueListItem4:DisplayText = "500ms".
		valueListItem5:DataValue = 750.
		valueListItem5:DisplayText = "750ms".
		valueListItem6:DataValue = 1000.
		valueListItem6:DisplayText = "1000ms".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar1 AS Infragistics.Win.ValueListItem EXTENT 3 NO-UNDO.
		arrayvar1[1] = valueListItem4.
		arrayvar1[2] = valueListItem5.
		arrayvar1[3] = valueListItem6.
		THIS-OBJECT:coRefreshInterval:Items:AddRange(arrayvar1).
		THIS-OBJECT:coRefreshInterval:Location = NEW System.Drawing.Point(0, 168).
		THIS-OBJECT:coRefreshInterval:Name = "coRefreshInterval".
		THIS-OBJECT:coRefreshInterval:Size = NEW System.Drawing.Size(168, 21).
		THIS-OBJECT:coRefreshInterval:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:coRefreshInterval:TabIndex = 2.
		THIS-OBJECT:coRefreshInterval:SelectionChanged:SUBSCRIBE(THIS-OBJECT:coRefreshInterval_SelectionChanged).
		/*  */
		/* ultraLabel2 */
		/*  */
		THIS-OBJECT:ultraLabel2:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance1:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance1:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance1:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance1:ForeColor = System.Drawing.Color:White.
		appearance1:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel2:Appearance = appearance1.
		THIS-OBJECT:ultraLabel2:Location = NEW System.Drawing.Point(0, 104).
		THIS-OBJECT:ultraLabel2:Name = "ultraLabel2".
		THIS-OBJECT:ultraLabel2:Size = NEW System.Drawing.Size(168, 16).
		THIS-OBJECT:ultraLabel2:TabIndex = 5.
		THIS-OBJECT:ultraLabel2:Text = "Total Miles In Race".
		/*  */
		/* ultraLabel3 */
		/*  */
		THIS-OBJECT:ultraLabel3:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance2:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance2:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance2:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance2:ForeColor = System.Drawing.Color:White.
		appearance2:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel3:Appearance = appearance2.
		THIS-OBJECT:ultraLabel3:Location = NEW System.Drawing.Point(0, 152).
		THIS-OBJECT:ultraLabel3:Name = "ultraLabel3".
		THIS-OBJECT:ultraLabel3:Size = NEW System.Drawing.Size(168, 16).
		THIS-OBJECT:ultraLabel3:TabIndex = 6.
		THIS-OBJECT:ultraLabel3:Text = "Refresh Interval".
		/*  */
		/* ultraExplorerBarContainerControl2 */
		/*  */
		THIS-OBJECT:ultraExplorerBarContainerControl2:Controls:Add(THIS-OBJECT:ultraLabel5).
		THIS-OBJECT:ultraExplorerBarContainerControl2:Controls:Add(THIS-OBJECT:lblAverageSpeed).
		THIS-OBJECT:ultraExplorerBarContainerControl2:Controls:Add(THIS-OBJECT:lblHiSpeed).
		THIS-OBJECT:ultraExplorerBarContainerControl2:Controls:Add(THIS-OBJECT:lblLoSpeed).
		THIS-OBJECT:ultraExplorerBarContainerControl2:Controls:Add(THIS-OBJECT:ultraLabel4).
		THIS-OBJECT:ultraExplorerBarContainerControl2:Controls:Add(THIS-OBJECT:ultraLabel6).
		THIS-OBJECT:ultraExplorerBarContainerControl2:Controls:Add(THIS-OBJECT:lblLeadingDriver).
		THIS-OBJECT:ultraExplorerBarContainerControl2:Controls:Add(THIS-OBJECT:ultraLabel7).
		THIS-OBJECT:ultraExplorerBarContainerControl2:Location = NEW System.Drawing.Point(28, 313).
		THIS-OBJECT:ultraExplorerBarContainerControl2:Name = "ultraExplorerBarContainerControl2".
		THIS-OBJECT:ultraExplorerBarContainerControl2:Size = NEW System.Drawing.Size(175, 180).
		THIS-OBJECT:ultraExplorerBarContainerControl2:TabIndex = 1.
		/*  */
		/* ultraLabel5 */
		/*  */
		THIS-OBJECT:ultraLabel5:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance3:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance3:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance3:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance3:ForeColor = System.Drawing.Color:White.
		appearance3:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel5:Appearance = appearance3.
		THIS-OBJECT:ultraLabel5:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:ultraLabel5:Name = "ultraLabel5".
		THIS-OBJECT:ultraLabel5:Size = NEW System.Drawing.Size(168, 16).
		THIS-OBJECT:ultraLabel5:TabIndex = 6.
		THIS-OBJECT:ultraLabel5:Text = "Average Speed".
		/*  */
		/* lblAverageSpeed */
		/*  */
		THIS-OBJECT:lblAverageSpeed:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraCalcManager1:SetCalcSettings(THIS-OBJECT:lblAverageSpeed, NEW Infragistics.Win.UltraWinCalcManager.CalcSettings(?, ?, "", "", Infragistics.Win.UltraWinCalcManager.CalcErrorIconAlignment:Default, ?)).
		THIS-OBJECT:lblAverageSpeed:Location = NEW System.Drawing.Point(0, 16).
		THIS-OBJECT:lblAverageSpeed:Name = "lblAverageSpeed".
		THIS-OBJECT:lblAverageSpeed:Size = NEW System.Drawing.Size(168, 16).
		THIS-OBJECT:lblAverageSpeed:TabIndex = 5.
		/*  */
		/* lblHiSpeed */
		/*  */
		THIS-OBJECT:lblHiSpeed:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraCalcManager1:SetCalcSettings(THIS-OBJECT:lblHiSpeed, NEW Infragistics.Win.UltraWinCalcManager.CalcSettings(?, ?, "", "", Infragistics.Win.UltraWinCalcManager.CalcErrorIconAlignment:Default, ?)).
		THIS-OBJECT:lblHiSpeed:Location = NEW System.Drawing.Point(0, 64).
		THIS-OBJECT:lblHiSpeed:Name = "lblHiSpeed".
		THIS-OBJECT:lblHiSpeed:Size = NEW System.Drawing.Size(168, 16).
		THIS-OBJECT:lblHiSpeed:TabIndex = 8.
		/*  */
		/* lblLoSpeed */
		/*  */
		THIS-OBJECT:lblLoSpeed:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraCalcManager1:SetCalcSettings(THIS-OBJECT:lblLoSpeed, NEW Infragistics.Win.UltraWinCalcManager.CalcSettings(?, ?, "", "", Infragistics.Win.UltraWinCalcManager.CalcErrorIconAlignment:Default, ?)).
		THIS-OBJECT:lblLoSpeed:Location = NEW System.Drawing.Point(0, 112).
		THIS-OBJECT:lblLoSpeed:Name = "lblLoSpeed".
		THIS-OBJECT:lblLoSpeed:Size = NEW System.Drawing.Size(168, 16).
		THIS-OBJECT:lblLoSpeed:TabIndex = 7.
		/*  */
		/* ultraLabel4 */
		/*  */
		THIS-OBJECT:ultraLabel4:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance4:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance4:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance4:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance4:ForeColor = System.Drawing.Color:White.
		appearance4:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel4:Appearance = appearance4.
		THIS-OBJECT:ultraLabel4:Location = NEW System.Drawing.Point(0, 48).
		THIS-OBJECT:ultraLabel4:Name = "ultraLabel4".
		THIS-OBJECT:ultraLabel4:Size = NEW System.Drawing.Size(168, 16).
		THIS-OBJECT:ultraLabel4:TabIndex = 2.
		THIS-OBJECT:ultraLabel4:Text = "Hi Speed".
		/*  */
		/* ultraLabel6 */
		/*  */
		THIS-OBJECT:ultraLabel6:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance5:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance5:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance5:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance5:ForeColor = System.Drawing.Color:White.
		appearance5:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel6:Appearance = appearance5.
		THIS-OBJECT:ultraLabel6:Location = NEW System.Drawing.Point(0, 98).
		THIS-OBJECT:ultraLabel6:Name = "ultraLabel6".
		THIS-OBJECT:ultraLabel6:Size = NEW System.Drawing.Size(168, 16).
		THIS-OBJECT:ultraLabel6:TabIndex = 1.
		THIS-OBJECT:ultraLabel6:Text = "Lo Speed".
		/*  */
		/* lblLeadingDriver */
		/*  */
		THIS-OBJECT:lblLeadingDriver:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraCalcManager1:SetCalcSettings(THIS-OBJECT:lblLeadingDriver, NEW Infragistics.Win.UltraWinCalcManager.CalcSettings(?, ?, "", "", Infragistics.Win.UltraWinCalcManager.CalcErrorIconAlignment:Default, ?)).
		THIS-OBJECT:lblLeadingDriver:Location = NEW System.Drawing.Point(0, 160).
		THIS-OBJECT:lblLeadingDriver:Name = "lblLeadingDriver".
		THIS-OBJECT:lblLeadingDriver:Size = NEW System.Drawing.Size(168, 16).
		THIS-OBJECT:lblLeadingDriver:TabIndex = 4.
		/*  */
		/* ultraLabel7 */
		/*  */
		THIS-OBJECT:ultraLabel7:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance17:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance17:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance17:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance17:ForeColor = System.Drawing.Color:White.
		appearance17:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel7:Appearance = appearance17.
		THIS-OBJECT:ultraLabel7:Location = NEW System.Drawing.Point(0, 144).
		THIS-OBJECT:ultraLabel7:Name = "ultraLabel7".
		THIS-OBJECT:ultraLabel7:Size = NEW System.Drawing.Size(168, 16).
		THIS-OBJECT:ultraLabel7:TabIndex = 3.
		THIS-OBJECT:ultraLabel7:Text = "Leading Driver".
		/*  */
		/* ultraButton1 */
		/*  */
		THIS-OBJECT:ultraButton1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraButton1:Location = NEW System.Drawing.Point(3, 70).
		THIS-OBJECT:ultraButton1:Name = "ultraButton1".
		THIS-OBJECT:ultraButton1:Size = NEW System.Drawing.Size(168, 24).
		THIS-OBJECT:ultraButton1:TabIndex = 9.
		THIS-OBJECT:ultraButton1:Text = "Reset Race Data".
		/*  */
		/* ultraComboEditor1 */
		/*  */
		THIS-OBJECT:ultraComboEditor1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraComboEditor1:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		valueListItem7:DataValue = 500.
		valueListItem7:DisplayText = "500ms".
		valueListItem8:DataValue = 750.
		valueListItem8:DisplayText = "750ms".
		valueListItem9:DataValue = 1000.
		valueListItem9:DisplayText = "1000ms".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar2 AS Infragistics.Win.ValueListItem EXTENT 3 NO-UNDO.
		arrayvar2[1] = valueListItem7.
		arrayvar2[2] = valueListItem8.
		arrayvar2[3] = valueListItem9.
		THIS-OBJECT:ultraComboEditor1:Items:AddRange(arrayvar2).
		THIS-OBJECT:ultraComboEditor1:Location = NEW System.Drawing.Point(3, 174).
		THIS-OBJECT:ultraComboEditor1:Name = "ultraComboEditor1".
		THIS-OBJECT:ultraComboEditor1:Size = NEW System.Drawing.Size(168, 21).
		THIS-OBJECT:ultraComboEditor1:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:ultraComboEditor1:TabIndex = 8.
		/*  */
		/* ultraComboEditor2 */
		/*  */
		THIS-OBJECT:ultraComboEditor2:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraComboEditor2:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		valueListItem10:DataValue = 100.
		valueListItem10:DisplayText = "100".
		valueListItem11:DataValue = 250.
		valueListItem11:DisplayText = "250".
		valueListItem12:DataValue = 500.
		valueListItem12:DisplayText = "500".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar3 AS Infragistics.Win.ValueListItem EXTENT 3 NO-UNDO.
		arrayvar3[1] = valueListItem10.
		arrayvar3[2] = valueListItem11.
		arrayvar3[3] = valueListItem12.
		THIS-OBJECT:ultraComboEditor2:Items:AddRange(arrayvar3).
		THIS-OBJECT:ultraComboEditor2:Location = NEW System.Drawing.Point(3, 126).
		THIS-OBJECT:ultraComboEditor2:Name = "ultraComboEditor2".
		THIS-OBJECT:ultraComboEditor2:Size = NEW System.Drawing.Size(168, 21).
		THIS-OBJECT:ultraComboEditor2:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:ultraComboEditor2:TabIndex = 7.
		/*  */
		/* ultraDataSource1 */
		/*  */
		ultraDataColumn3:DataType = Progress.Util.TypeHelper:GetType("System.Int32").
		ultraDataColumn4:DataType = Progress.Util.TypeHelper:GetType("System.Int32").
		ultraDataColumn5:DataType = Progress.Util.TypeHelper:GetType("System.Double").
		ultraDataColumn6:DataType = Progress.Util.TypeHelper:GetType("System.Double").
		ultraDataColumn7:DataType = Progress.Util.TypeHelper:GetType("System.Double").
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar4 AS System.Object EXTENT 7 NO-UNDO.
		arrayvar4[1] = ultraDataColumn1.
		arrayvar4[2] = ultraDataColumn2.
		arrayvar4[3] = ultraDataColumn3.
		arrayvar4[4] = ultraDataColumn4.
		arrayvar4[5] = ultraDataColumn5.
		arrayvar4[6] = ultraDataColumn6.
		arrayvar4[7] = ultraDataColumn7.
		THIS-OBJECT:ultraDataSource1:Band:Columns:AddRange(arrayvar4).
		THIS-OBJECT:ultraDataSource1:Band:Key = "Cars".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar5 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar5[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar5[2] = CAST(BOX("2"), System.Object).
		arrayvar5[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar5[4] = CAST(BOX("Rusty Wallace"), System.Object).
		arrayvar5[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar5[6] = CAST(BOX(0), System.Object).
		arrayvar5[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar5[8] = CAST(BOX(201), System.Object).
		arrayvar5[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar5[10] = CAST(BOX(22), System.Object).
		arrayvar5[11] = CAST(BOX("MPG"), System.Object).
		arrayvar5[12] = CAST(BOX(6.0999999), System.Object).
		arrayvar5[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar5[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar6 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar6[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar6[2] = CAST(BOX("5"), System.Object).
		arrayvar6[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar6[4] = CAST(BOX("Terry Labonte"), System.Object).
		arrayvar6[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar6[6] = CAST(BOX(0), System.Object).
		arrayvar6[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar6[8] = CAST(BOX(199), System.Object).
		arrayvar6[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar6[10] = CAST(BOX(23), System.Object).
		arrayvar6[11] = CAST(BOX("MPG"), System.Object).
		arrayvar6[12] = CAST(BOX(6.1999998), System.Object).
		arrayvar6[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar6[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar7 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar7[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar7[2] = CAST(BOX("6"), System.Object).
		arrayvar7[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar7[4] = CAST(BOX("Mark Martin"), System.Object).
		arrayvar7[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar7[6] = CAST(BOX(0), System.Object).
		arrayvar7[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar7[8] = CAST(BOX(203), System.Object).
		arrayvar7[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar7[10] = CAST(BOX(24), System.Object).
		arrayvar7[11] = CAST(BOX("MPG"), System.Object).
		arrayvar7[12] = CAST(BOX(6.0999999), System.Object).
		arrayvar7[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar7[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar8 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar8[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar8[2] = CAST(BOX("8"), System.Object).
		arrayvar8[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar8[4] = CAST(BOX("Dale Earnhardt Jr."), System.Object).
		arrayvar8[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar8[6] = CAST(BOX(0), System.Object).
		arrayvar8[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar8[8] = CAST(BOX(204), System.Object).
		arrayvar8[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar8[10] = CAST(BOX(22), System.Object).
		arrayvar8[11] = CAST(BOX("MPG"), System.Object).
		arrayvar8[12] = CAST(BOX(6.3000002), System.Object).
		arrayvar8[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar8[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar9 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar9[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar9[2] = CAST(BOX("15"), System.Object).
		arrayvar9[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar9[4] = CAST(BOX("Michael Waltrip"), System.Object).
		arrayvar9[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar9[6] = CAST(BOX(0), System.Object).
		arrayvar9[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar9[8] = CAST(BOX(202), System.Object).
		arrayvar9[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar9[10] = CAST(BOX(22), System.Object).
		arrayvar9[11] = CAST(BOX("MPG"), System.Object).
		arrayvar9[12] = CAST(BOX(6.0999999), System.Object).
		arrayvar9[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar9[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar10 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar10[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar10[2] = CAST(BOX("17"), System.Object).
		arrayvar10[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar10[4] = CAST(BOX("Matt Kenseth"), System.Object).
		arrayvar10[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar10[6] = CAST(BOX(0), System.Object).
		arrayvar10[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar10[8] = CAST(BOX(200), System.Object).
		arrayvar10[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar10[10] = CAST(BOX(23), System.Object).
		arrayvar10[11] = CAST(BOX("MPG"), System.Object).
		arrayvar10[12] = CAST(BOX(5.9000001), System.Object).
		arrayvar10[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar10[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar11 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar11[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar11[2] = CAST(BOX("18"), System.Object).
		arrayvar11[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar11[4] = CAST(BOX("Bobby Labonte"), System.Object).
		arrayvar11[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar11[6] = CAST(BOX(0), System.Object).
		arrayvar11[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar11[8] = CAST(BOX(203), System.Object).
		arrayvar11[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar11[10] = CAST(BOX(22), System.Object).
		arrayvar11[11] = CAST(BOX("MPG"), System.Object).
		arrayvar11[12] = CAST(BOX(6.0999999), System.Object).
		arrayvar11[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar11[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar12 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar12[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar12[2] = CAST(BOX("20"), System.Object).
		arrayvar12[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar12[4] = CAST(BOX("Tony Stewart"), System.Object).
		arrayvar12[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar12[6] = CAST(BOX(0), System.Object).
		arrayvar12[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar12[8] = CAST(BOX(204), System.Object).
		arrayvar12[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar12[10] = CAST(BOX(24), System.Object).
		arrayvar12[11] = CAST(BOX("MPG"), System.Object).
		arrayvar12[12] = CAST(BOX(6.4000001), System.Object).
		arrayvar12[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar12[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar13 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar13[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar13[2] = CAST(BOX("24"), System.Object).
		arrayvar13[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar13[4] = CAST(BOX("Jeff Gordon"), System.Object).
		arrayvar13[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar13[6] = CAST(BOX(0), System.Object).
		arrayvar13[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar13[8] = CAST(BOX(203), System.Object).
		arrayvar13[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar13[10] = CAST(BOX(22), System.Object).
		arrayvar13[11] = CAST(BOX("MPG"), System.Object).
		arrayvar13[12] = CAST(BOX(6.4000001), System.Object).
		arrayvar13[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar13[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar14 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar14[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar14[2] = CAST(BOX("29"), System.Object).
		arrayvar14[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar14[4] = CAST(BOX("Kevin Harvick"), System.Object).
		arrayvar14[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar14[6] = CAST(BOX(0), System.Object).
		arrayvar14[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar14[8] = CAST(BOX(200), System.Object).
		arrayvar14[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar14[10] = CAST(BOX(23), System.Object).
		arrayvar14[11] = CAST(BOX("MPG"), System.Object).
		arrayvar14[12] = CAST(BOX(6.1999998), System.Object).
		arrayvar14[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar14[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar15 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar15[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar15[2] = CAST(BOX("40"), System.Object).
		arrayvar15[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar15[4] = CAST(BOX("Sterling Marlin"), System.Object).
		arrayvar15[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar15[6] = CAST(BOX(0), System.Object).
		arrayvar15[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar15[8] = CAST(BOX(199), System.Object).
		arrayvar15[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar15[10] = CAST(BOX(22), System.Object).
		arrayvar15[11] = CAST(BOX("MPG"), System.Object).
		arrayvar15[12] = CAST(BOX(6.0999999), System.Object).
		arrayvar15[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar15[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar16 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar16[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar16[2] = CAST(BOX("45"), System.Object).
		arrayvar16[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar16[4] = CAST(BOX("Kyle Petty"), System.Object).
		arrayvar16[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar16[6] = CAST(BOX(0), System.Object).
		arrayvar16[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar16[8] = CAST(BOX(201), System.Object).
		arrayvar16[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar16[10] = CAST(BOX(24), System.Object).
		arrayvar16[11] = CAST(BOX("MPG"), System.Object).
		arrayvar16[12] = CAST(BOX(6.1999998), System.Object).
		arrayvar16[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar16[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar17 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar17[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar17[2] = CAST(BOX("48"), System.Object).
		arrayvar17[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar17[4] = CAST(BOX("Jimmy Johnson"), System.Object).
		arrayvar17[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar17[6] = CAST(BOX(0), System.Object).
		arrayvar17[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar17[8] = CAST(BOX(201), System.Object).
		arrayvar17[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar17[10] = CAST(BOX(24), System.Object).
		arrayvar17[11] = CAST(BOX("MPG"), System.Object).
		arrayvar17[12] = CAST(BOX(6.3000002), System.Object).
		arrayvar17[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar17[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar18 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar18[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar18[2] = CAST(BOX("88"), System.Object).
		arrayvar18[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar18[4] = CAST(BOX("Dale Jarrett"), System.Object).
		arrayvar18[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar18[6] = CAST(BOX(0), System.Object).
		arrayvar18[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar18[8] = CAST(BOX(203), System.Object).
		arrayvar18[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar18[10] = CAST(BOX(22), System.Object).
		arrayvar18[11] = CAST(BOX("MPG"), System.Object).
		arrayvar18[12] = CAST(BOX(6.0999999), System.Object).
		arrayvar18[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar18[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar19 AS System.Object EXTENT 14 NO-UNDO.
		arrayvar19[1] = CAST(BOX("CarNumber"), System.Object).
		arrayvar19[2] = CAST(BOX("97"), System.Object).
		arrayvar19[3] = CAST(BOX("DriverName"), System.Object).
		arrayvar19[4] = CAST(BOX("Kurt Busch"), System.Object).
		arrayvar19[5] = CAST(BOX("CurrentSpeed"), System.Object).
		arrayvar19[6] = CAST(BOX(0), System.Object).
		arrayvar19[7] = CAST(BOX("MaxSpeed"), System.Object).
		arrayvar19[8] = CAST(BOX(202), System.Object).
		arrayvar19[9] = CAST(BOX("FuelCapacity"), System.Object).
		arrayvar19[10] = CAST(BOX(23), System.Object).
		arrayvar19[11] = CAST(BOX("MPG"), System.Object).
		arrayvar19[12] = CAST(BOX(6), System.Object).
		arrayvar19[13] = CAST(BOX("MilesTraveled"), System.Object).
		arrayvar19[14] = CAST(BOX(0), System.Object).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar20 AS System.Object EXTENT 15 NO-UNDO.
		arrayvar20[1] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar5).
		arrayvar20[2] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar6).
		arrayvar20[3] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar7).
		arrayvar20[4] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar8).
		arrayvar20[5] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar9).
		arrayvar20[6] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar10).
		arrayvar20[7] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar11).
		arrayvar20[8] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar12).
		arrayvar20[9] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar13).
		arrayvar20[10] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar14).
		arrayvar20[11] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar15).
		arrayvar20[12] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar16).
		arrayvar20[13] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar17).
		arrayvar20[14] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar18).
		arrayvar20[15] = NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(arrayvar19).
		THIS-OBJECT:ultraDataSource1:Rows:AddRange(arrayvar20).
		/*  */
		/* ultraExplorerBar1 */
		/*  */
		THIS-OBJECT:ultraExplorerBar1:Controls:Add(THIS-OBJECT:ultraExplorerBarContainerControl1).
		THIS-OBJECT:ultraExplorerBar1:Controls:Add(THIS-OBJECT:ultraExplorerBarContainerControl2).
		THIS-OBJECT:ultraExplorerBar1:Dock = System.Windows.Forms.DockStyle:Left.
		ultraExplorerBarGroup1:Container = THIS-OBJECT:ultraExplorerBarContainerControl1.
		appearance18:Image = CAST(resources:GetObject("appearance18.Image"), System.Object).
		ultraExplorerBarGroup1:Settings:AppearancesLarge:HeaderAppearance = appearance18.
		ultraExplorerBarGroup1:Settings:ContainerHeight = 200.
		ultraExplorerBarGroup1:Settings:Style = Infragistics.Win.UltraWinExplorerBar.GroupStyle:ControlContainer.
		ultraExplorerBarGroup1:Text = "Race Options".
		ultraExplorerBarGroup2:Container = THIS-OBJECT:ultraExplorerBarContainerControl2.
		appearance19:Image = CAST(resources:GetObject("appearance19.Image"), System.Object).
		ultraExplorerBarGroup2:Settings:AppearancesLarge:HeaderAppearance = appearance19.
		ultraExplorerBarGroup2:Settings:ContainerHeight = 180.
		ultraExplorerBarGroup2:Settings:Style = Infragistics.Win.UltraWinExplorerBar.GroupStyle:ControlContainer.
		ultraExplorerBarGroup2:Text = "Race Statistics".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar21 AS Infragistics.Win.UltraWinExplorerBar.UltraExplorerBarGroup EXTENT 2 NO-UNDO.
		arrayvar21[1] = ultraExplorerBarGroup1.
		arrayvar21[2] = ultraExplorerBarGroup2.
		THIS-OBJECT:ultraExplorerBar1:Groups:AddRange(arrayvar21).
		THIS-OBJECT:ultraExplorerBar1:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:ultraExplorerBar1:Name = "ultraExplorerBar1".
		THIS-OBJECT:ultraExplorerBar1:Size = NEW System.Drawing.Size(224, 582).
		THIS-OBJECT:ultraExplorerBar1:TabIndex = 0.
		THIS-OBJECT:ultraExplorerBar1:UseLargeGroupHeaderImages = Infragistics.Win.DefaultableBoolean:True.
		/*  */
		/* ultraLabel1 */
		/*  */
		THIS-OBJECT:ultraLabel1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance20:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance20:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance20:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance20:ForeColor = System.Drawing.Color:White.
		appearance20:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel1:Appearance = appearance20.
		THIS-OBJECT:ultraLabel1:Location = NEW System.Drawing.Point(0, 104).
		THIS-OBJECT:ultraLabel1:Name = "ultraLabel1".
		THIS-OBJECT:ultraLabel1:Size = NEW System.Drawing.Size(168, 16).
		THIS-OBJECT:ultraLabel1:TabIndex = 0.
		THIS-OBJECT:ultraLabel1:Text = "Total Miles In Race".
		/*  */
		/* ultraLabel8 */
		/*  */
		THIS-OBJECT:ultraLabel8:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance21:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance21:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance21:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance21:ForeColor = System.Drawing.Color:White.
		appearance21:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel8:Appearance = appearance21.
		THIS-OBJECT:ultraLabel8:Location = NEW System.Drawing.Point(0, 152).
		THIS-OBJECT:ultraLabel8:Name = "ultraLabel8".
		THIS-OBJECT:ultraLabel8:Size = NEW System.Drawing.Size(168, 16).
		THIS-OBJECT:ultraLabel8:TabIndex = 0.
		THIS-OBJECT:ultraLabel8:Text = "Refresh Interval".
		/*  */
		/* ultraCalcManager1 */
		/*  */
		THIS-OBJECT:ultraCalcManager1:ContainingControl = THIS-OBJECT.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar22 AS System.Object EXTENT 2 NO-UNDO.
		arrayvar22[1] = NEW Infragistics.Win.UltraWinCalcManager.NamedReference("RefreshInterval", ?, ?, ?).
		arrayvar22[2] = NEW Infragistics.Win.UltraWinCalcManager.NamedReference("TotalMilesInRace", ?, ?, ?).
		THIS-OBJECT:ultraCalcManager1:NamedReferences:AddRange(arrayvar22).
		/*  */
		/* splitter1 */
		/*  */
		THIS-OBJECT:splitter1:Location = NEW System.Drawing.Point(224, 0).
		THIS-OBJECT:splitter1:Name = "splitter1".
		THIS-OBJECT:splitter1:Size = NEW System.Drawing.Size(6, 582).
		THIS-OBJECT:splitter1:TabIndex = 1.
		THIS-OBJECT:splitter1:TabStop = FALSE.
		/*  */
		/* ultraGrid1 */
		/*  */
		THIS-OBJECT:ultraGrid1:CalcManager = THIS-OBJECT:ultraCalcManager1.
		THIS-OBJECT:ultraGrid1:Cursor = System.Windows.Forms.Cursors:Default.
		THIS-OBJECT:ultraGrid1:DataSource = THIS-OBJECT:ultraDataSource1.
		appearance6:AlphaLevel = Progress.Util.CastUtil:ToInt16(30).
		appearance6:BackColor = System.Drawing.Color:White.
		appearance6:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance6:BackColorAlpha = Infragistics.Win.Alpha:Opaque.
		appearance6:BackGradientStyle = Infragistics.Win.GradientStyle:ForwardDiagonal.
		appearance6:BorderAlpha = Infragistics.Win.Alpha:Opaque.
		appearance6:ForegroundAlpha = Infragistics.Win.Alpha:Opaque.
		appearance6:ImageBackground = CAST(resources:GetObject("appearance6.ImageBackground"), System.Drawing.Image).
		appearance6:ImageBackgroundAlpha = Infragistics.Win.Alpha:UseAlphaLevel.
		appearance6:ImageBackgroundStyle = Infragistics.Win.ImageBackgroundStyle:Stretched.
		appearance6:ThemedElementAlpha = Infragistics.Win.Alpha:Opaque.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Appearance = appearance6.
		ultraGridBand1:AddButtonCaption = "Trades".
		ultraGridColumn1:Header:VisiblePosition = 0.
		ultraGridColumn2:Header:VisiblePosition = 1.
		ultraGridColumn3:Header:VisiblePosition = 2.
		ultraGridColumn4:Header:VisiblePosition = 3.
		ultraGridColumn5:Header:VisiblePosition = 4.
		ultraGridColumn6:Header:VisiblePosition = 5.
		ultraGridColumn7:Header:VisiblePosition = 6.
		appearance15:BorderColor = System.Drawing.Color:Yellow.
		appearance15:FontData:BoldAsString = "True".
		ultraGridColumn8:CellAppearance = appearance15.
		ultraGridColumn8:Format = "###,###.##".
		ultraGridColumn8:Formula = "[//TotalMilesInRace] -  [MilesTraveled]".
		ultraGridColumn8:Header:Caption = "Miles Remaining".
		ultraGridColumn8:Header:VisiblePosition = 7.
		ultraGridColumn8:RowLayoutColumnInfo:PreferredLabelSize = NEW System.Drawing.Size(0, 35).
		appearance16:BorderColor = System.Drawing.Color:Yellow.
		appearance16:FontData:BoldAsString = "True".
		ultraGridColumn9:CellAppearance = appearance16.
		ultraGridColumn9:Format = "###,###.##".
		ultraGridColumn9:Formula = "[FuelCapacity] - ( [MilesTraveled] /  [MPG] )".
		ultraGridColumn9:Header:Caption = "Fuel Remaining".
		ultraGridColumn9:Header:VisiblePosition = 8.
		ultraGridColumn9:RowLayoutColumnInfo:PreferredLabelSize = NEW System.Drawing.Size(0, 35).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar23 AS System.Object EXTENT 9 NO-UNDO.
		arrayvar23[1] = ultraGridColumn1.
		arrayvar23[2] = ultraGridColumn2.
		arrayvar23[3] = ultraGridColumn3.
		arrayvar23[4] = ultraGridColumn4.
		arrayvar23[5] = ultraGridColumn5.
		arrayvar23[6] = ultraGridColumn6.
		arrayvar23[7] = ultraGridColumn7.
		arrayvar23[8] = ultraGridColumn8.
		arrayvar23[9] = ultraGridColumn9.
		ultraGridBand1:Columns:AddRange(arrayvar23).
		ultraGridBand1:UseRowLayout = TRUE.
		THIS-OBJECT:ultraGrid1:DisplayLayout:BandsSerializer:Add(ultraGridBand1).
		THIS-OBJECT:ultraGrid1:DisplayLayout:InterBandSpacing = 10.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:AllowAddNew = Infragistics.Win.UltraWinGrid.AllowAddNew:No.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:AllowDelete = Infragistics.Win.DefaultableBoolean:False.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:AllowUpdate = Infragistics.Win.DefaultableBoolean:False.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:BorderStyleRow = Infragistics.Win.UIElementBorderStyle:None.
		appearance9:BackColor = System.Drawing.Color:Transparent.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:CardAreaAppearance = appearance9.
		appearance10:FontData:Name = "Lucida Sans Typewriter".
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:CellAppearance = appearance10.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:CellClickAction = Infragistics.Win.UltraWinGrid.CellClickAction:RowSelect.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:CellPadding = 1.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:CellSpacing = 1.
		appearance11:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance11:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance11:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance11:FontData:BoldAsString = "True".
		appearance11:ForeColor = System.Drawing.Color:White.
		appearance11:TextHAlignAsString = "Center".
		appearance11:ThemedElementAlpha = Infragistics.Win.Alpha:Transparent.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:HeaderAppearance = appearance11.
		appearance12:BackColor = System.Drawing.Color:Transparent.
		appearance12:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:RowAppearance = appearance12.
		appearance13:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(61)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(149)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance13:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		appearance13:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:RowSelectorAppearance = appearance13.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:RowSelectors = Infragistics.Win.DefaultableBoolean:False.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:RowSelectorWidth = 12.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:RowSpacingBefore = 2.
		appearance14:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(129)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(169)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(226))).
		appearance14:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(221)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(235)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(254))).
		appearance14:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance14:ForeColor = System.Drawing.Color:Black.
		THIS-OBJECT:ultraGrid1:DisplayLayout:Override:SelectedRowAppearance = appearance14.
		THIS-OBJECT:ultraGrid1:DisplayLayout:RowConnectorColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(1)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(68)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208))).
		THIS-OBJECT:ultraGrid1:DisplayLayout:RowConnectorStyle = Infragistics.Win.UltraWinGrid.RowConnectorStyle:Solid.
		THIS-OBJECT:ultraGrid1:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:ultraGrid1:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:ultraGrid1:Location = NEW System.Drawing.Point(230, 0).
		THIS-OBJECT:ultraGrid1:Name = "ultraGrid1".
		THIS-OBJECT:ultraGrid1:Size = NEW System.Drawing.Size(802, 582).
		THIS-OBJECT:ultraGrid1:TabIndex = 2.
		THIS-OBJECT:ultraGrid1:AfterSelectChange:SUBSCRIBE(THIS-OBJECT:ultraGrid1_AfterSelectChange).
		/*  */
		/* Form1 */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(1032, 582).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraGrid1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:splitter1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraExplorerBar1).
		THIS-OBJECT:Icon = CAST(resources:GetObject("$this.Icon"), System.Drawing.Icon).
		THIS-OBJECT:Name = "Form1".
		THIS-OBJECT:Text = "CalcRacer".
		THIS-OBJECT:Load:SUBSCRIBE(THIS-OBJECT:Form1_Load).
		THIS-OBJECT:FormClosing:SUBSCRIBE(THIS-OBJECT:Form1_FormClosing).
		THIS-OBJECT:ultraExplorerBarContainerControl1:ResumeLayout(FALSE).
		THIS-OBJECT:ultraExplorerBarContainerControl1:PerformLayout().
		CAST(THIS-OBJECT:coMilesInRace, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:coRefreshInterval, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraExplorerBarContainerControl2:ResumeLayout(FALSE).
		CAST(THIS-OBJECT:ultraComboEditor1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraComboEditor2, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraDataSource1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraExplorerBar1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraExplorerBar1:ResumeLayout(FALSE).
		CAST(THIS-OBJECT:ultraCalcManager1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraGrid1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ResumeLayout(FALSE).
	END METHOD.







	METHOD PRIVATE VOID SetPropertyNameAndFormula(icontrol AS Control , propertyName AS CHARACTER, formula AS CHARACTER):
      /* To access the extender properties placed on the control by the UltraCalcManager, call the UltraCalcManager's*/
      /* GetCalcSettings method passing in the control we're interested in.                                          */
      DEFINE VARIABLE objCalcSettings AS CalcSettings NO-UNDO.
	  objCalcSettings = THIS-OBJECT:ultraCalcManager1:GetCalcSettings(icontrol).


      /* Set the PropertyName. This will prepare the control to be        */
  	  /* used in calculations. Note that in order for a control to        */
  	  /* function properly as the SOURCE value of a calculation, the      */
  	  /* property must also have a changed event. For example, if using   */
  	  /* the Text property, the control must have a TextChanged event.    */
  	  /* Otherwise, the CalcManager cannot detect changes in the property.*/
  	  objCalcSettings:PropertyName = propertyName.


      /* Set the formula.*/
	  objCalcSettings:Formula = formula.
	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID Form1_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
      /* Pre-select values for a couple of the race options.*/
      THIS-OBJECT:coMilesInRace:SelectedIndex		= 2.
	  THIS-OBJECT:coRefreshInterval:SelectedIndex	= 0.
		
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cmdStartStopRace_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
     /* Toggle the stop/start status of the race*/
	  IF (THIS-OBJECT:CarStatsGenerator:RaceInProgress = false) THEN DO:
        /* Disable race options while the race is in progress.*/
		THIS-OBJECT:cmdStartStopRace:Text		= "Stop Race".
		THIS-OBJECT:coMilesInRace:Enabled		= FALSE.
		THIS-OBJECT:coRefreshInterval:Enabled	= FALSE.
		THIS-OBJECT:cmdNewRace:Enabled			= FALSE.

		THIS-OBJECT:CarStatsGenerator:Start().
	  END. /* If ..*/
	  ELSE DO:
	    THIS-OBJECT:CarStatsGenerator:Stop().

        /* Re-enable the race options.*/
        THIS-OBJECT:cmdStartStopRace:Text		= "Start Race".
		THIS-OBJECT:coMilesInRace:Enabled		= TRUE.
		THIS-OBJECT:coRefreshInterval:Enabled	= TRUE.
		THIS-OBJECT:cmdNewRace:Enabled			= TRUE.
      END. /* ELSE DO */
		
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cmdNewRace_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  THIS-OBJECT:CarStatsGenerator:Reset().		
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID coMilesInRace_SelectionChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  THIS-OBJECT:CarStatsGenerator:Reset().
	  THIS-OBJECT:ultraCalcManager1:ReCalc().
	  THIS-OBJECT:ultraCalcManager1:NamedReferences["TotalMilesInRace"]:Formula = THIS-OBJECT:coMilesInRace:Value:ToString().
      
      RETURN.
	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID coRefreshInterval_SelectionChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  THIS-OBJECT:ultraCalcManager1:NamedReferences["RefreshInterval"]:Formula = THIS-OBJECT:coRefreshInterval:Value:ToString().
	
	  RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGrid1_AfterSelectChange( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.AfterSelectChangeEventArgs ):
	  IF (THIS-OBJECT:ultraGrid1:Selected:Rows:Count > 0) THEN 
	    THIS-OBJECT:lblLeadingDriver:Text = THIS-OBJECT:ultraGrid1:Selected:Rows[0]:Cells["DriverName"]:Value:ToString().
		
		RETURN.

	END METHOD.

END CLASS.