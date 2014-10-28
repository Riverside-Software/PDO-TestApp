 
 /*------------------------------------------------------------------------
    File        : AxisLabelLayout
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Fri Sep 05 10:38:27 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.
USING Progress.Util.*.

USING System.Data.*.

USING Infragistics.UltraChart.Shared.Styles.*.
USING Infragistics.UltraChart.Resources.Appearance.*.

CLASS WinChart.Axis.AxisLabelLayout INHERITS Form   : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.

	DEFINE PRIVATE VARIABLE chart4_axisYLabelsLayoutBehavior AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE chart4_axisXSeriesLabelsLayoutBehavior AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE chart4_axisXLabelsLayoutBehavior AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE chart4_axisYExtent AS System.Windows.Forms.TrackBar NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraChart4 AS Infragistics.Win.UltraWinChart.UltraChart NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel17 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE chart4_axisXExtent AS System.Windows.Forms.TrackBar NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel18 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel19 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE chart3_axisYLabelsLayoutBehavior AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel20 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE chart3_axisXSeriesLabelsLayoutBehavior AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE tabPage4 AS System.Windows.Forms.TabPage NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel21 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE chart3_axisXLabelsLayoutBehavior AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE panel5 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraChart3 AS Infragistics.Win.UltraWinChart.UltraChart NO-UNDO.
	DEFINE PRIVATE VARIABLE panel7 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraChart2 AS Infragistics.Win.UltraWinChart.UltraChart NO-UNDO.
	DEFINE PRIVATE VARIABLE splitter2 AS System.Windows.Forms.Splitter NO-UNDO.
	DEFINE PRIVATE VARIABLE panel4 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraChart1 AS Infragistics.Win.UltraWinChart.UltraChart NO-UNDO.
	DEFINE PRIVATE VARIABLE panel2 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE splitter3 AS System.Windows.Forms.Splitter NO-UNDO.
	DEFINE PRIVATE VARIABLE splitter1 AS System.Windows.Forms.Splitter NO-UNDO.
	DEFINE PRIVATE VARIABLE panel1 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE panel3 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE panel6 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE tabPage3 AS System.Windows.Forms.TabPage NO-UNDO.
	DEFINE PRIVATE VARIABLE chart3_axisYExtent AS System.Windows.Forms.TrackBar NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel12 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE chart3_axisXExtent AS System.Windows.Forms.TrackBar NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel13 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel14 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel15 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel16 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE chart1_axisYLabelsLayoutBehavior AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE chart1_axisXSeriesLabelsLayoutBehavior AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE chart1_axisXLabelsLayoutBehavior AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE chart1_axisYExtent AS System.Windows.Forms.TrackBar NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel11 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel7 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE chart1_axisXExtent AS System.Windows.Forms.TrackBar NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel6 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel5 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel4 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBoxPanel1 AS Infragistics.Win.Misc.UltraExpandableGroupBoxPanel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel1 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraGroupBox1 AS Infragistics.Win.Misc.UltraGroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE tabControl1 AS System.Windows.Forms.TabControl NO-UNDO.
	DEFINE PRIVATE VARIABLE tabPage1 AS System.Windows.Forms.TabPage NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel3 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE tabPage2 AS System.Windows.Forms.TabPage NO-UNDO.
	DEFINE PRIVATE VARIABLE chart2_axisYLabelsLayoutBehavior AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE chart2_axisXSeriesLabelsLayoutBehavior AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE chart2_axisXLabelsLayoutBehavior AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE chart2_axisYExtent AS System.Windows.Forms.TrackBar NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel2 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE chart2_axisXExtent AS System.Windows.Forms.TrackBar NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel8 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel9 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel10 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBox1 AS Infragistics.Win.Misc.UltraExpandableGroupBox NO-UNDO.

    DEFINE PRIVATE VARIABLE fSalesrepService AS DataServices.IDataService NO-UNDO.
    DEFINE PRIVATE VARIABLE salesrepOrderDT  AS System.Data.DataTable     NO-UNDO.
		
	CONSTRUCTOR PUBLIC AxisLabelLayout (  ):
		SUPER().
		InitializeComponent().
		InitializeDataSource().
	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC AxisLabelLayout ( ):
		IF VALID-OBJECT(components) THEN DO:
            CAST(components, System.IDisposable):Dispose().
		END.
	END DESTRUCTOR.


	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID chart1editors_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
			IF sender = chart1_axisXLabelsLayoutBehavior THEN
				ultraChart1:Axis:X:Labels:Layout:Behavior = CAST(chart1_axisXLabelsLayoutBehavior:SelectedItem:DataValue,AxisLabelLayoutBehaviors).
			ELSE IF sender = chart1_axisXSeriesLabelsLayoutBehavior THEN
			    ultraChart1:Axis:X:Labels:SeriesLabels:Layout:Behavior = CAST(chart1_axisXSeriesLabelsLayoutBehavior:SelectedItem:DataValue,AxisLabelLayoutBehaviors).
			ELSE IF sender = chart1_axisYLabelsLayoutBehavior THEN
				ultraChart1:Axis:Y:Labels:Layout:Behavior = CAST(chart1_axisYLabelsLayoutBehavior:SelectedItem:DataValue,AxisLabelLayoutBehaviors).
			ELSE IF sender = chart1_axisXExtent THEN
				ultraChart1:Axis:X:Extent = chart1_axisXExtent:VALUE.
			ELSE IF sender = chart1_axisYExtent THEN
    			ultraChart1:Axis:Y:Extent = chart1_axisYExtent:VALUE.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID chart2editors_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
			IF sender = chart2_axisXLabelsLayoutBehavior THEN
				ultraChart3:Axis:X:Labels:Layout:Behavior = CAST(chart2_axisXLabelsLayoutBehavior:SelectedItem:DataValue,AxisLabelLayoutBehaviors).
			ELSE IF sender = chart2_axisXSeriesLabelsLayoutBehavior THEN
			    ultraChart3:Axis:X:Labels:SeriesLabels:Layout:Behavior = CAST(chart2_axisXSeriesLabelsLayoutBehavior:SelectedItem:DataValue,AxisLabelLayoutBehaviors).
			ELSE IF sender = chart2_axisYLabelsLayoutBehavior THEN
				ultraChart3:Axis:Y:Labels:Layout:Behavior = CAST(chart2_axisYLabelsLayoutBehavior:SelectedItem:DataValue,AxisLabelLayoutBehaviors).
			ELSE IF sender = chart2_axisXExtent THEN
				ultraChart3:Axis:X:Extent = chart2_axisXExtent:VALUE.
			ELSE IF sender = chart2_axisYExtent THEN
    			ultraChart3:Axis:Y:Extent = chart2_axisYExtent:VALUE.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID chart4editors_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
			IF sender = chart4_axisXLabelsLayoutBehavior THEN
				ultraChart2:Axis:X:Labels:Layout:Behavior = CAST(chart4_axisXLabelsLayoutBehavior:SelectedItem:DataValue,AxisLabelLayoutBehaviors).
			ELSE IF sender = chart4_axisXSeriesLabelsLayoutBehavior THEN
			    ultraChart2:Axis:X:Labels:SeriesLabels:Layout:Behavior = CAST(chart4_axisXSeriesLabelsLayoutBehavior:SelectedItem:DataValue,AxisLabelLayoutBehaviors).
			ELSE IF sender = chart4_axisYLabelsLayoutBehavior THEN
				ultraChart2:Axis:Y:Labels:Layout:Behavior = CAST(chart4_axisYLabelsLayoutBehavior:SelectedItem:DataValue,AxisLabelLayoutBehaviors).
			ELSE IF sender = chart4_axisXExtent THEN
				ultraChart2:Axis:X:Extent = chart4_axisXExtent:VALUE.
			ELSE IF sender = chart4_axisYExtent THEN
    			ultraChart2:Axis:Y:Extent = chart4_axisYExtent:VALUE.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID chart3editors_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
			IF sender = chart3_axisXLabelsLayoutBehavior THEN
				ultraChart4:Axis:X:Labels:Layout:Behavior = CAST(chart3_axisXLabelsLayoutBehavior:SelectedItem:DataValue,AxisLabelLayoutBehaviors).
			ELSE IF sender = chart3_axisXSeriesLabelsLayoutBehavior THEN
			    ultraChart4:Axis:X:Labels:SeriesLabels:Layout:Behavior = CAST(chart3_axisXSeriesLabelsLayoutBehavior:SelectedItem:DataValue,AxisLabelLayoutBehaviors).
			ELSE IF sender = chart3_axisYLabelsLayoutBehavior THEN
				ultraChart4:Axis:Y:Labels:Layout:Behavior = CAST(chart3_axisYLabelsLayoutBehavior:SelectedItem:DataValue,AxisLabelLayoutBehaviors).
			ELSE IF sender = chart3_axisXExtent THEN
				ultraChart4:Axis:X:Extent = chart3_axisXExtent:VALUE.
			ELSE IF sender = chart3_axisYExtent THEN
    			ultraChart4:Axis:Y:Extent = chart3_axisYExtent:VALUE.
	END METHOD.

   	METHOD PRIVATE VOID InitializeComponent(  ):
		
/*		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file.*/

		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement1 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement1 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement2 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement2 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement3 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement3 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement4 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement4 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement5 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement5 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement6 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement6 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance17 AS Infragistics.Win.Appearance NO-UNDO.
		appearance17 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance18 AS Infragistics.Win.Appearance NO-UNDO.
		appearance18 = NEW Infragistics.Win.Appearance().
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
		DEFINE VARIABLE paintElement7 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement7 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement8 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement8 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement9 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement9 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement10 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement10 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement11 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement11 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement12 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement12 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement13 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement13 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement14 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement14 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement15 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement15 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement16 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement16 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement17 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement17 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement18 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement18 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement19 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement19 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement20 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement20 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement21 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement21 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement22 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement22 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement23 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement23 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE paintElement24 AS Infragistics.UltraChart.Resources.Appearance.PaintElement NO-UNDO.
		paintElement24 = NEW Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance12 AS Infragistics.Win.Appearance NO-UNDO.
		appearance12 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance13 AS Infragistics.Win.Appearance NO-UNDO.
		appearance13 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance14 AS Infragistics.Win.Appearance NO-UNDO.
		appearance14 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance15 AS Infragistics.Win.Appearance NO-UNDO.
		appearance15 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance16 AS Infragistics.Win.Appearance NO-UNDO.
		appearance16 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance11 AS Infragistics.Win.Appearance NO-UNDO.
		appearance11 = NEW Infragistics.Win.Appearance().
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
		DEFINE VARIABLE appearance1 AS Infragistics.Win.Appearance NO-UNDO.
		appearance1 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE resources AS System.Resources.ResXResourceSet NO-UNDO.
		resources = Progress.Util.ResourceHelper:Load("WinChart\Axis\AxisLabelLayout.resx", PROPATH).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance6 AS Infragistics.Win.Appearance NO-UNDO.
		appearance6 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance7 AS Infragistics.Win.Appearance NO-UNDO.
		appearance7 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance8 AS Infragistics.Win.Appearance NO-UNDO.
		appearance8 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance9 AS Infragistics.Win.Appearance NO-UNDO.
		appearance9 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance10 AS Infragistics.Win.Appearance NO-UNDO.
		appearance10 = NEW Infragistics.Win.Appearance().
		THIS-OBJECT:chart4_axisYLabelsLayoutBehavior = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:chart4_axisXSeriesLabelsLayoutBehavior = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:chart4_axisXLabelsLayoutBehavior = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:chart4_axisYExtent = NEW System.Windows.Forms.TrackBar().
		THIS-OBJECT:ultraChart4 = NEW Infragistics.Win.UltraWinChart.UltraChart().
		THIS-OBJECT:ultraLabel17 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:chart4_axisXExtent = NEW System.Windows.Forms.TrackBar().
		THIS-OBJECT:ultraLabel18 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel19 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:chart3_axisYLabelsLayoutBehavior = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:ultraLabel20 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:chart3_axisXSeriesLabelsLayoutBehavior = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:tabPage4 = NEW System.Windows.Forms.TabPage().
		THIS-OBJECT:ultraLabel21 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:chart3_axisXLabelsLayoutBehavior = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:panel5 = NEW System.Windows.Forms.Panel().
		THIS-OBJECT:ultraChart3 = NEW Infragistics.Win.UltraWinChart.UltraChart().
		THIS-OBJECT:panel7 = NEW System.Windows.Forms.Panel().
		THIS-OBJECT:ultraChart2 = NEW Infragistics.Win.UltraWinChart.UltraChart().
		THIS-OBJECT:splitter2 = NEW System.Windows.Forms.Splitter().
		THIS-OBJECT:panel4 = NEW System.Windows.Forms.Panel().
		THIS-OBJECT:ultraChart1 = NEW Infragistics.Win.UltraWinChart.UltraChart().
		THIS-OBJECT:panel2 = NEW System.Windows.Forms.Panel().
		THIS-OBJECT:splitter3 = NEW System.Windows.Forms.Splitter().
		THIS-OBJECT:splitter1 = NEW System.Windows.Forms.Splitter().
		THIS-OBJECT:panel1 = NEW System.Windows.Forms.Panel().
		THIS-OBJECT:panel3 = NEW System.Windows.Forms.Panel().
		THIS-OBJECT:panel6 = NEW System.Windows.Forms.Panel().
		THIS-OBJECT:tabPage3 = NEW System.Windows.Forms.TabPage().
		THIS-OBJECT:chart3_axisYExtent = NEW System.Windows.Forms.TrackBar().
		THIS-OBJECT:ultraLabel12 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:chart3_axisXExtent = NEW System.Windows.Forms.TrackBar().
		THIS-OBJECT:ultraLabel13 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel14 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel15 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel16 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:chart1_axisYLabelsLayoutBehavior = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:chart1_axisXSeriesLabelsLayoutBehavior = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:chart1_axisXLabelsLayoutBehavior = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:chart1_axisYExtent = NEW System.Windows.Forms.TrackBar().
		THIS-OBJECT:ultraLabel11 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel7 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:chart1_axisXExtent = NEW System.Windows.Forms.TrackBar().
		THIS-OBJECT:ultraLabel6 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel5 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel4 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraExpandableGroupBoxPanel1 = NEW Infragistics.Win.Misc.UltraExpandableGroupBoxPanel().
		THIS-OBJECT:ultraLabel1 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraGroupBox1 = NEW Infragistics.Win.Misc.UltraGroupBox().
		THIS-OBJECT:tabControl1 = NEW System.Windows.Forms.TabControl().
		THIS-OBJECT:tabPage1 = NEW System.Windows.Forms.TabPage().
		THIS-OBJECT:ultraLabel3 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:tabPage2 = NEW System.Windows.Forms.TabPage().
		THIS-OBJECT:chart2_axisYLabelsLayoutBehavior = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:chart2_axisXSeriesLabelsLayoutBehavior = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:chart2_axisXLabelsLayoutBehavior = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:chart2_axisYExtent = NEW System.Windows.Forms.TrackBar().
		THIS-OBJECT:ultraLabel2 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:chart2_axisXExtent = NEW System.Windows.Forms.TrackBar().
		THIS-OBJECT:ultraLabel8 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel9 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel10 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraExpandableGroupBox1 = NEW Infragistics.Win.Misc.UltraExpandableGroupBox().
		CAST(THIS-OBJECT:chart4_axisYLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart4_axisXSeriesLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart4_axisXLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart4_axisYExtent, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraChart4, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart4_axisXExtent, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart3_axisYLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart3_axisXSeriesLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:tabPage4:SuspendLayout().
		CAST(THIS-OBJECT:chart3_axisXLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:panel5:SuspendLayout().
		CAST(THIS-OBJECT:ultraChart3, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:panel7:SuspendLayout().
		CAST(THIS-OBJECT:ultraChart2, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:panel4:SuspendLayout().
		CAST(THIS-OBJECT:ultraChart1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:panel2:SuspendLayout().
		THIS-OBJECT:panel1:SuspendLayout().
		THIS-OBJECT:panel3:SuspendLayout().
		THIS-OBJECT:panel6:SuspendLayout().
		THIS-OBJECT:tabPage3:SuspendLayout().
		CAST(THIS-OBJECT:chart3_axisYExtent, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart3_axisXExtent, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart1_axisYLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart1_axisXSeriesLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart1_axisXLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart1_axisYExtent, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart1_axisXExtent, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:SuspendLayout().
		CAST(THIS-OBJECT:ultraGroupBox1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraGroupBox1:SuspendLayout().
		THIS-OBJECT:tabControl1:SuspendLayout().
		THIS-OBJECT:tabPage1:SuspendLayout().
		THIS-OBJECT:tabPage2:SuspendLayout().
		CAST(THIS-OBJECT:chart2_axisYLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart2_axisXSeriesLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart2_axisXLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart2_axisYExtent, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:chart2_axisXExtent, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraExpandableGroupBox1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraExpandableGroupBox1:SuspendLayout().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* chart4_axisYLabelsLayoutBehavior */
		/*  */
		THIS-OBJECT:chart4_axisYLabelsLayoutBehavior:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:chart4_axisYLabelsLayoutBehavior:Location = NEW System.Drawing.Point(114, 32).
		THIS-OBJECT:chart4_axisYLabelsLayoutBehavior:Name = "chart4_axisYLabelsLayoutBehavior".
		THIS-OBJECT:chart4_axisYLabelsLayoutBehavior:Size = NEW System.Drawing.Size(123, 21).
		THIS-OBJECT:chart4_axisYLabelsLayoutBehavior:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:chart4_axisYLabelsLayoutBehavior:TabIndex = 25.
		THIS-OBJECT:chart4_axisYLabelsLayoutBehavior:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart4editors_ValueChanged).
		/*  */
		/* chart4_axisXSeriesLabelsLayoutBehavior */
		/*  */
		THIS-OBJECT:chart4_axisXSeriesLabelsLayoutBehavior:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:chart4_axisXSeriesLabelsLayoutBehavior:Location = NEW System.Drawing.Point(114, 58).
		THIS-OBJECT:chart4_axisXSeriesLabelsLayoutBehavior:Name = "chart4_axisXSeriesLabelsLayoutBehavior".
		THIS-OBJECT:chart4_axisXSeriesLabelsLayoutBehavior:Size = NEW System.Drawing.Size(122, 21).
		THIS-OBJECT:chart4_axisXSeriesLabelsLayoutBehavior:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:chart4_axisXSeriesLabelsLayoutBehavior:TabIndex = 24.
		THIS-OBJECT:chart4_axisXSeriesLabelsLayoutBehavior:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart4editors_ValueChanged).
		/*  */
		/* chart4_axisXLabelsLayoutBehavior */
		/*  */
		THIS-OBJECT:chart4_axisXLabelsLayoutBehavior:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:chart4_axisXLabelsLayoutBehavior:Location = NEW System.Drawing.Point(114, 6).
		THIS-OBJECT:chart4_axisXLabelsLayoutBehavior:Name = "chart4_axisXLabelsLayoutBehavior".
		THIS-OBJECT:chart4_axisXLabelsLayoutBehavior:Size = NEW System.Drawing.Size(123, 21).
		THIS-OBJECT:chart4_axisXLabelsLayoutBehavior:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:chart4_axisXLabelsLayoutBehavior:TabIndex = 23.
		THIS-OBJECT:chart4_axisXLabelsLayoutBehavior:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart4editors_ValueChanged).
		/*  */
		/* chart4_axisYExtent */
		/*  */
		THIS-OBJECT:chart4_axisYExtent:Location = NEW System.Drawing.Point(10, 260).
		THIS-OBJECT:chart4_axisYExtent:Maximum = 100.
		THIS-OBJECT:chart4_axisYExtent:Name = "chart4_axisYExtent".
		THIS-OBJECT:chart4_axisYExtent:Size = NEW System.Drawing.Size(220, 42).
		THIS-OBJECT:chart4_axisYExtent:TabIndex = 31.
		THIS-OBJECT:chart4_axisYExtent:TickFrequency = 5.
		THIS-OBJECT:chart4_axisYExtent:TickStyle = System.Windows.Forms.TickStyle:None.
		THIS-OBJECT:chart4_axisYExtent:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart4editors_ValueChanged).
		/*  */
		/* ultraChart4 */
		/*  */
		THIS-OBJECT:ultraChart4:Axis:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(248)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(220))).
		paintElement1:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:None.
		paintElement1:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(248)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(220))).
		THIS-OBJECT:ultraChart4:Axis:PE = paintElement1.
		THIS-OBJECT:ultraChart4:Axis:X:Extent = 60.
		THIS-OBJECT:ultraChart4:Axis:X:Labels:Font = NEW System.Drawing.Font("Tahoma", 14, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:ultraChart4:Axis:X:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart4:Axis:X:Labels:ItemFormatString = "<ITEM_LABEL>".
		THIS-OBJECT:ultraChart4:Axis:X:Labels:Layout:Behavior = Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors:Auto.
		THIS-OBJECT:ultraChart4:Axis:X:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart4:Axis:X:Labels:SeriesLabels:Font = NEW System.Drawing.Font("Tahoma", 14).
		THIS-OBJECT:ultraChart4:Axis:X:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart4:Axis:X:Labels:SeriesLabels:Layout:Behavior = Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors:Auto.
		THIS-OBJECT:ultraChart4:Axis:X:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart4:Axis:X:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart4:Axis:X:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart4:Axis:X:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart4:Axis:X:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart4:Axis:X:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart4:Axis:X:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart4:Axis:X:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart4:Axis:X:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart4:Axis:X:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart4:Axis:X:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart4:Axis:X:Visible = TRUE.
		THIS-OBJECT:ultraChart4:Axis:X2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		THIS-OBJECT:ultraChart4:Axis:X2:Labels:ItemFormatString = "<ITEM_LABEL>".
		THIS-OBJECT:ultraChart4:Axis:X2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart4:Axis:X2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart4:Axis:X2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart4:Axis:X2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart4:Axis:X2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart4:Axis:X2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart4:Axis:X2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart4:Axis:X2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart4:Axis:X2:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart4:Axis:X2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart4:Axis:X2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart4:Axis:X2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart4:Axis:X2:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart4:Axis:X2:Visible = FALSE.
		THIS-OBJECT:ultraChart4:Axis:Y:Extent = 20.
		THIS-OBJECT:ultraChart4:Axis:Y:Labels:Font = NEW System.Drawing.Font("Tahoma", 14).
		THIS-OBJECT:ultraChart4:Axis:Y:Labels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		THIS-OBJECT:ultraChart4:Axis:Y:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		THIS-OBJECT:ultraChart4:Axis:Y:Labels:Layout:Behavior = Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors:Auto.
		THIS-OBJECT:ultraChart4:Axis:Y:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart4:Axis:Y:Labels:SeriesLabels:FormatString = "".
		THIS-OBJECT:ultraChart4:Axis:Y:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart4:Axis:Y:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart4:Axis:Y:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart4:Axis:Y:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart4:Axis:Y:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart4:Axis:Y:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart4:Axis:Y:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart4:Axis:Y:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart4:Axis:Y:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart4:Axis:Y:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart4:Axis:Y:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart4:Axis:Y:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart4:Axis:Y:TickmarkInterval = 400.
		THIS-OBJECT:ultraChart4:Axis:Y:TickmarkStyle = Infragistics.UltraChart.Shared.Styles.AxisTickStyle:Smart.
		THIS-OBJECT:ultraChart4:Axis:Y:Visible = TRUE.
		THIS-OBJECT:ultraChart4:Axis:Y2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart4:Axis:Y2:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		THIS-OBJECT:ultraChart4:Axis:Y2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart4:Axis:Y2:Labels:SeriesLabels:FormatString = "".
		THIS-OBJECT:ultraChart4:Axis:Y2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart4:Axis:Y2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart4:Axis:Y2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart4:Axis:Y2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart4:Axis:Y2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart4:Axis:Y2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart4:Axis:Y2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart4:Axis:Y2:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart4:Axis:Y2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart4:Axis:Y2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart4:Axis:Y2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart4:Axis:Y2:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart4:Axis:Y2:Visible = FALSE.
		THIS-OBJECT:ultraChart4:Axis:Z:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart4:Axis:Z:Labels:ItemFormatString = "".
		THIS-OBJECT:ultraChart4:Axis:Z:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart4:Axis:Z:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart4:Axis:Z:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart4:Axis:Z:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart4:Axis:Z:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart4:Axis:Z:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart4:Axis:Z:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart4:Axis:Z:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart4:Axis:Z:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart4:Axis:Z:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart4:Axis:Z:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart4:Axis:Z:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart4:Axis:Z:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart4:Axis:Z:Visible = FALSE.
		THIS-OBJECT:ultraChart4:Axis:Z2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart4:Axis:Z2:Labels:ItemFormatString = "".
		THIS-OBJECT:ultraChart4:Axis:Z2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart4:Axis:Z2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart4:Axis:Z2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart4:Axis:Z2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart4:Axis:Z2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart4:Axis:Z2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart4:Axis:Z2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart4:Axis:Z2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart4:Axis:Z2:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart4:Axis:Z2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart4:Axis:Z2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart4:Axis:Z2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart4:Axis:Z2:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart4:Axis:Z2:Visible = FALSE.
		THIS-OBJECT:ultraChart4:BackgroundImageLayout = System.Windows.Forms.ImageLayout:Center.
		THIS-OBJECT:ultraChart4:Border:CornerRadius = 5.
		THIS-OBJECT:ultraChart4:ColorModel:AlphaLevel = Progress.Util.CastUtil:ToByte(150).
		THIS-OBJECT:ultraChart4:ColorModel:ModelStyle = Infragistics.UltraChart.Shared.Styles.ColorModels:CustomSkin.
		paintElement2:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement2:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(108)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(162)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(36))).
		paintElement2:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement2:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(148)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(244)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(17))).
		paintElement3:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement3:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(7)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(108)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(176))).
		paintElement3:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement3:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(53)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(200)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		paintElement4:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement4:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(215)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(0)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(5))).
		paintElement4:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement4:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(254)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(117)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(16))).
		paintElement5:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement5:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(230)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(190)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(2))).
		paintElement5:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement5:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(81))).
		paintElement6:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement6:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(252)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(122)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(10))).
		paintElement6:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement6:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(66))).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar0 AS Infragistics.UltraChart.Resources.Appearance.PaintElement EXTENT 5 NO-UNDO.
		arrayvar0[1] = paintElement2.
		arrayvar0[2] = paintElement3.
		arrayvar0[3] = paintElement4.
		arrayvar0[4] = paintElement5.
		arrayvar0[5] = paintElement6.
		THIS-OBJECT:ultraChart4:ColorModel:Skin:PEs:AddRange(arrayvar0).
		THIS-OBJECT:ultraChart4:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:ultraChart4:ForeColor = System.Drawing.SystemColors:ControlText.
		THIS-OBJECT:ultraChart4:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:ultraChart4:Name = "ultraChart4".
		THIS-OBJECT:ultraChart4:Size = NEW System.Drawing.Size(493, 176).
		THIS-OBJECT:ultraChart4:TabIndex = 29.
		THIS-OBJECT:ultraChart4:TitleTop:Text = "Chart 3".
		THIS-OBJECT:ultraChart4:Tooltips:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 7.8000002).
		/*  */
		/* ultraLabel17 */
		/*  */
		appearance17:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel17:Appearance = appearance17.
		THIS-OBJECT:ultraLabel17:Location = NEW System.Drawing.Point(10, 240).
		THIS-OBJECT:ultraLabel17:Name = "ultraLabel17".
		THIS-OBJECT:ultraLabel17:Size = NEW System.Drawing.Size(112, 16).
		THIS-OBJECT:ultraLabel17:TabIndex = 30.
		THIS-OBJECT:ultraLabel17:Text = "Y Axis Extent".
		/*  */
		/* chart4_axisXExtent */
		/*  */
		THIS-OBJECT:chart4_axisXExtent:Location = NEW System.Drawing.Point(10, 198).
		THIS-OBJECT:chart4_axisXExtent:Maximum = 100.
		THIS-OBJECT:chart4_axisXExtent:Name = "chart4_axisXExtent".
		THIS-OBJECT:chart4_axisXExtent:Size = NEW System.Drawing.Size(220, 42).
		THIS-OBJECT:chart4_axisXExtent:TabIndex = 32.
		THIS-OBJECT:chart4_axisXExtent:TickFrequency = 5.
		THIS-OBJECT:chart4_axisXExtent:TickStyle = System.Windows.Forms.TickStyle:None.
		THIS-OBJECT:chart4_axisXExtent:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart4editors_ValueChanged).
		/*  */
		/* ultraLabel18 */
		/*  */
		appearance18:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel18:Appearance = appearance18.
		THIS-OBJECT:ultraLabel18:Location = NEW System.Drawing.Point(10, 178).
		THIS-OBJECT:ultraLabel18:Name = "ultraLabel18".
		THIS-OBJECT:ultraLabel18:Size = NEW System.Drawing.Size(112, 16).
		THIS-OBJECT:ultraLabel18:TabIndex = 29.
		THIS-OBJECT:ultraLabel18:Text = "X Axis Extent".
		/*  */
		/* ultraLabel19 */
		/*  */
		appearance19:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel19:Appearance = appearance19.
		THIS-OBJECT:ultraLabel19:Location = NEW System.Drawing.Point(6, 36).
		THIS-OBJECT:ultraLabel19:Name = "ultraLabel19".
		THIS-OBJECT:ultraLabel19:Size = NEW System.Drawing.Size(112, 14).
		THIS-OBJECT:ultraLabel19:TabIndex = 27.
		THIS-OBJECT:ultraLabel19:Text = "Y Axis Labels".
		/*  */
		/* chart3_axisYLabelsLayoutBehavior */
		/*  */
		THIS-OBJECT:chart3_axisYLabelsLayoutBehavior:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:chart3_axisYLabelsLayoutBehavior:Location = NEW System.Drawing.Point(114, 32).
		THIS-OBJECT:chart3_axisYLabelsLayoutBehavior:Name = "chart3_axisYLabelsLayoutBehavior".
		THIS-OBJECT:chart3_axisYLabelsLayoutBehavior:Size = NEW System.Drawing.Size(123, 21).
		THIS-OBJECT:chart3_axisYLabelsLayoutBehavior:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:chart3_axisYLabelsLayoutBehavior:TabIndex = 25.
		THIS-OBJECT:chart3_axisYLabelsLayoutBehavior:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart3editors_ValueChanged).
		/*  */
		/* ultraLabel20 */
		/*  */
		appearance20:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel20:Appearance = appearance20.
		THIS-OBJECT:ultraLabel20:Location = NEW System.Drawing.Point(6, 62).
		THIS-OBJECT:ultraLabel20:Name = "ultraLabel20".
		THIS-OBJECT:ultraLabel20:Size = NEW System.Drawing.Size(112, 14).
		THIS-OBJECT:ultraLabel20:TabIndex = 28.
		THIS-OBJECT:ultraLabel20:Text = "X Axis Series Labels".
		/*  */
		/* chart3_axisXSeriesLabelsLayoutBehavior */
		/*  */
		THIS-OBJECT:chart3_axisXSeriesLabelsLayoutBehavior:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:chart3_axisXSeriesLabelsLayoutBehavior:Location = NEW System.Drawing.Point(114, 58).
		THIS-OBJECT:chart3_axisXSeriesLabelsLayoutBehavior:Name = "chart3_axisXSeriesLabelsLayoutBehavior".
		THIS-OBJECT:chart3_axisXSeriesLabelsLayoutBehavior:Size = NEW System.Drawing.Size(122, 21).
		THIS-OBJECT:chart3_axisXSeriesLabelsLayoutBehavior:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:chart3_axisXSeriesLabelsLayoutBehavior:TabIndex = 24.
		THIS-OBJECT:chart3_axisXSeriesLabelsLayoutBehavior:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart3editors_ValueChanged).
		/*  */
		/* tabPage4 */
		/*  */
		THIS-OBJECT:tabPage4:Controls:Add(THIS-OBJECT:chart4_axisYLabelsLayoutBehavior).
		THIS-OBJECT:tabPage4:Controls:Add(THIS-OBJECT:chart4_axisXSeriesLabelsLayoutBehavior).
		THIS-OBJECT:tabPage4:Controls:Add(THIS-OBJECT:chart4_axisXLabelsLayoutBehavior).
		THIS-OBJECT:tabPage4:Controls:Add(THIS-OBJECT:chart4_axisYExtent).
		THIS-OBJECT:tabPage4:Controls:Add(THIS-OBJECT:ultraLabel17).
		THIS-OBJECT:tabPage4:Controls:Add(THIS-OBJECT:chart4_axisXExtent).
		THIS-OBJECT:tabPage4:Controls:Add(THIS-OBJECT:ultraLabel18).
		THIS-OBJECT:tabPage4:Controls:Add(THIS-OBJECT:ultraLabel19).
		THIS-OBJECT:tabPage4:Controls:Add(THIS-OBJECT:ultraLabel20).
		THIS-OBJECT:tabPage4:Controls:Add(THIS-OBJECT:ultraLabel21).
		THIS-OBJECT:tabPage4:Location = NEW System.Drawing.Point(4, 22).
		THIS-OBJECT:tabPage4:Name = "tabPage4".
		THIS-OBJECT:tabPage4:Size = NEW System.Drawing.Size(240, 336).
		THIS-OBJECT:tabPage4:TabIndex = 3.
		THIS-OBJECT:tabPage4:Text = "Chart 4".
		/*  */
		/* ultraLabel21 */
		/*  */
		appearance21:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel21:Appearance = appearance21.
		THIS-OBJECT:ultraLabel21:Location = NEW System.Drawing.Point(6, 10).
		THIS-OBJECT:ultraLabel21:Name = "ultraLabel21".
		THIS-OBJECT:ultraLabel21:Size = NEW System.Drawing.Size(112, 14).
		THIS-OBJECT:ultraLabel21:TabIndex = 26.
		THIS-OBJECT:ultraLabel21:Text = "X Axis Labels".
		/*  */
		/* chart3_axisXLabelsLayoutBehavior */
		/*  */
		THIS-OBJECT:chart3_axisXLabelsLayoutBehavior:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:chart3_axisXLabelsLayoutBehavior:Location = NEW System.Drawing.Point(114, 6).
		THIS-OBJECT:chart3_axisXLabelsLayoutBehavior:Name = "chart3_axisXLabelsLayoutBehavior".
		THIS-OBJECT:chart3_axisXLabelsLayoutBehavior:Size = NEW System.Drawing.Size(123, 21).
		THIS-OBJECT:chart3_axisXLabelsLayoutBehavior:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:chart3_axisXLabelsLayoutBehavior:TabIndex = 23.
		THIS-OBJECT:chart3_axisXLabelsLayoutBehavior:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart3editors_ValueChanged).
		/*  */
		/* panel5 */
		/*  */
		THIS-OBJECT:panel5:Controls:Add(THIS-OBJECT:ultraChart3).
		THIS-OBJECT:panel5:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:panel5:Location = NEW System.Drawing.Point(0, 189).
		THIS-OBJECT:panel5:Name = "panel5".
		THIS-OBJECT:panel5:Size = NEW System.Drawing.Size(200, 203).
		THIS-OBJECT:panel5:TabIndex = 31.
		/*  */
		/* ultraChart3 */
		/*  */
		THIS-OBJECT:ultraChart3:Axis:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(248)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(220))).
		paintElement7:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:None.
		paintElement7:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(248)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(220))).
		THIS-OBJECT:ultraChart3:Axis:PE = paintElement7.
		THIS-OBJECT:ultraChart3:Axis:X:Extent = 60.
		THIS-OBJECT:ultraChart3:Axis:X:Labels:Font = NEW System.Drawing.Font("Tahoma", 14, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:ultraChart3:Axis:X:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart3:Axis:X:Labels:ItemFormatString = "<ITEM_LABEL>".
		THIS-OBJECT:ultraChart3:Axis:X:Labels:Layout:Behavior = Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors:Auto.
		THIS-OBJECT:ultraChart3:Axis:X:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart3:Axis:X:Labels:SeriesLabels:Font = NEW System.Drawing.Font("Tahoma", 14).
		THIS-OBJECT:ultraChart3:Axis:X:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart3:Axis:X:Labels:SeriesLabels:Layout:Behavior = Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors:Auto.
		THIS-OBJECT:ultraChart3:Axis:X:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart3:Axis:X:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart3:Axis:X:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart3:Axis:X:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart3:Axis:X:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart3:Axis:X:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart3:Axis:X:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart3:Axis:X:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart3:Axis:X:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart3:Axis:X:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart3:Axis:X:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart3:Axis:X:Visible = TRUE.
		THIS-OBJECT:ultraChart3:Axis:X2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		THIS-OBJECT:ultraChart3:Axis:X2:Labels:ItemFormatString = "<ITEM_LABEL>".
		THIS-OBJECT:ultraChart3:Axis:X2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart3:Axis:X2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart3:Axis:X2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart3:Axis:X2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart3:Axis:X2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart3:Axis:X2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart3:Axis:X2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart3:Axis:X2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart3:Axis:X2:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart3:Axis:X2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart3:Axis:X2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart3:Axis:X2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart3:Axis:X2:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart3:Axis:X2:Visible = FALSE.
		THIS-OBJECT:ultraChart3:Axis:Y:Extent = 20.
		THIS-OBJECT:ultraChart3:Axis:Y:Labels:Font = NEW System.Drawing.Font("Tahoma", 14).
		THIS-OBJECT:ultraChart3:Axis:Y:Labels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		THIS-OBJECT:ultraChart3:Axis:Y:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		THIS-OBJECT:ultraChart3:Axis:Y:Labels:Layout:Behavior = Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors:Auto.
		THIS-OBJECT:ultraChart3:Axis:Y:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart3:Axis:Y:Labels:SeriesLabels:FormatString = "".
		THIS-OBJECT:ultraChart3:Axis:Y:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart3:Axis:Y:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart3:Axis:Y:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart3:Axis:Y:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart3:Axis:Y:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart3:Axis:Y:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart3:Axis:Y:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart3:Axis:Y:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart3:Axis:Y:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart3:Axis:Y:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart3:Axis:Y:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart3:Axis:Y:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart3:Axis:Y:TickmarkInterval = 50.
		THIS-OBJECT:ultraChart3:Axis:Y:TickmarkStyle = Infragistics.UltraChart.Shared.Styles.AxisTickStyle:Smart.
		THIS-OBJECT:ultraChart3:Axis:Y:Visible = TRUE.
		THIS-OBJECT:ultraChart3:Axis:Y2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart3:Axis:Y2:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		THIS-OBJECT:ultraChart3:Axis:Y2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart3:Axis:Y2:Labels:SeriesLabels:FormatString = "".
		THIS-OBJECT:ultraChart3:Axis:Y2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart3:Axis:Y2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart3:Axis:Y2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart3:Axis:Y2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart3:Axis:Y2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart3:Axis:Y2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart3:Axis:Y2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart3:Axis:Y2:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart3:Axis:Y2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart3:Axis:Y2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart3:Axis:Y2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart3:Axis:Y2:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart3:Axis:Y2:Visible = FALSE.
		THIS-OBJECT:ultraChart3:Axis:Z:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart3:Axis:Z:Labels:ItemFormatString = "".
		THIS-OBJECT:ultraChart3:Axis:Z:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart3:Axis:Z:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart3:Axis:Z:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart3:Axis:Z:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart3:Axis:Z:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart3:Axis:Z:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart3:Axis:Z:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart3:Axis:Z:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart3:Axis:Z:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart3:Axis:Z:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart3:Axis:Z:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart3:Axis:Z:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart3:Axis:Z:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart3:Axis:Z:Visible = FALSE.
		THIS-OBJECT:ultraChart3:Axis:Z2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart3:Axis:Z2:Labels:ItemFormatString = "".
		THIS-OBJECT:ultraChart3:Axis:Z2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart3:Axis:Z2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart3:Axis:Z2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart3:Axis:Z2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart3:Axis:Z2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart3:Axis:Z2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart3:Axis:Z2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart3:Axis:Z2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart3:Axis:Z2:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart3:Axis:Z2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart3:Axis:Z2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart3:Axis:Z2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart3:Axis:Z2:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart3:Axis:Z2:Visible = FALSE.
		THIS-OBJECT:ultraChart3:BackgroundImageLayout = System.Windows.Forms.ImageLayout:Center.
		THIS-OBJECT:ultraChart3:Border:CornerRadius = 5.
		THIS-OBJECT:ultraChart3:ColorModel:AlphaLevel = Progress.Util.CastUtil:ToByte(150).
		THIS-OBJECT:ultraChart3:ColorModel:ModelStyle = Infragistics.UltraChart.Shared.Styles.ColorModels:CustomSkin.
		paintElement8:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement8:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(108)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(162)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(36))).
		paintElement8:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement8:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(148)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(244)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(17))).
		paintElement9:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement9:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(7)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(108)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(176))).
		paintElement9:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement9:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(53)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(200)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		paintElement10:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement10:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(215)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(0)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(5))).
		paintElement10:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement10:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(254)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(117)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(16))).
		paintElement11:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement11:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(230)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(190)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(2))).
		paintElement11:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement11:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(81))).
		paintElement12:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement12:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(252)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(122)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(10))).
		paintElement12:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement12:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(66))).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar1 AS Infragistics.UltraChart.Resources.Appearance.PaintElement EXTENT 5 NO-UNDO.
		arrayvar1[1] = paintElement8.
		arrayvar1[2] = paintElement9.
		arrayvar1[3] = paintElement10.
		arrayvar1[4] = paintElement11.
		arrayvar1[5] = paintElement12.
		THIS-OBJECT:ultraChart3:ColorModel:Skin:PEs:AddRange(arrayvar1).
		THIS-OBJECT:ultraChart3:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:ultraChart3:ForeColor = System.Drawing.SystemColors:ControlText.
		THIS-OBJECT:ultraChart3:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:ultraChart3:Name = "ultraChart3".
		THIS-OBJECT:ultraChart3:Size = NEW System.Drawing.Size(200, 203).
		THIS-OBJECT:ultraChart3:TabIndex = 28.
		THIS-OBJECT:ultraChart3:TitleTop:Text = "Chart 2".
		THIS-OBJECT:ultraChart3:Tooltips:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 7.8000002).
		/*  */
		/* panel7 */
		/*  */
		THIS-OBJECT:panel7:Controls:Add(THIS-OBJECT:ultraChart2).
		THIS-OBJECT:panel7:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:panel7:Location = NEW System.Drawing.Point(0, 181).
		THIS-OBJECT:panel7:Name = "panel7".
		THIS-OBJECT:panel7:Size = NEW System.Drawing.Size(493, 211).
		THIS-OBJECT:panel7:TabIndex = 32.
		/*  */
		/* ultraChart2 */
		/*  */
		THIS-OBJECT:ultraChart2:Axis:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(248)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(220))).
		paintElement13:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:None.
		paintElement13:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(248)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(220))).
		THIS-OBJECT:ultraChart2:Axis:PE = paintElement13.
		THIS-OBJECT:ultraChart2:Axis:X:Extent = 60.
		THIS-OBJECT:ultraChart2:Axis:X:Labels:Font = NEW System.Drawing.Font("Tahoma", 14, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:ultraChart2:Axis:X:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart2:Axis:X:Labels:ItemFormatString = "<ITEM_LABEL>".
		THIS-OBJECT:ultraChart2:Axis:X:Labels:Layout:Behavior = Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors:Auto.
		THIS-OBJECT:ultraChart2:Axis:X:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart2:Axis:X:Labels:SeriesLabels:Font = NEW System.Drawing.Font("Tahoma", 14).
		THIS-OBJECT:ultraChart2:Axis:X:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart2:Axis:X:Labels:SeriesLabels:Layout:Behavior = Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors:Auto.
		THIS-OBJECT:ultraChart2:Axis:X:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart2:Axis:X:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart2:Axis:X:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart2:Axis:X:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart2:Axis:X:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart2:Axis:X:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart2:Axis:X:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart2:Axis:X:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart2:Axis:X:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart2:Axis:X:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart2:Axis:X:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart2:Axis:X:Visible = TRUE.
		THIS-OBJECT:ultraChart2:Axis:X2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		THIS-OBJECT:ultraChart2:Axis:X2:Labels:ItemFormatString = "<ITEM_LABEL>".
		THIS-OBJECT:ultraChart2:Axis:X2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart2:Axis:X2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart2:Axis:X2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart2:Axis:X2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart2:Axis:X2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart2:Axis:X2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart2:Axis:X2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart2:Axis:X2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart2:Axis:X2:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart2:Axis:X2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart2:Axis:X2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart2:Axis:X2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart2:Axis:X2:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart2:Axis:X2:Visible = FALSE.
		THIS-OBJECT:ultraChart2:Axis:Y:Extent = 20.
		THIS-OBJECT:ultraChart2:Axis:Y:Labels:Font = NEW System.Drawing.Font("Tahoma", 14).
		THIS-OBJECT:ultraChart2:Axis:Y:Labels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		THIS-OBJECT:ultraChart2:Axis:Y:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		THIS-OBJECT:ultraChart2:Axis:Y:Labels:Layout:Behavior = Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors:Auto.
		THIS-OBJECT:ultraChart2:Axis:Y:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart2:Axis:Y:Labels:SeriesLabels:FormatString = "".
		THIS-OBJECT:ultraChart2:Axis:Y:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart2:Axis:Y:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart2:Axis:Y:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart2:Axis:Y:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart2:Axis:Y:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart2:Axis:Y:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart2:Axis:Y:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart2:Axis:Y:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart2:Axis:Y:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart2:Axis:Y:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart2:Axis:Y:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart2:Axis:Y:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart2:Axis:Y:TickmarkInterval = 50.
		THIS-OBJECT:ultraChart2:Axis:Y:TickmarkStyle = Infragistics.UltraChart.Shared.Styles.AxisTickStyle:Smart.
		THIS-OBJECT:ultraChart2:Axis:Y:Visible = TRUE.
		THIS-OBJECT:ultraChart2:Axis:Y2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart2:Axis:Y2:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		THIS-OBJECT:ultraChart2:Axis:Y2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart2:Axis:Y2:Labels:SeriesLabels:FormatString = "".
		THIS-OBJECT:ultraChart2:Axis:Y2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart2:Axis:Y2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart2:Axis:Y2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart2:Axis:Y2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart2:Axis:Y2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart2:Axis:Y2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart2:Axis:Y2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart2:Axis:Y2:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart2:Axis:Y2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart2:Axis:Y2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart2:Axis:Y2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart2:Axis:Y2:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart2:Axis:Y2:Visible = FALSE.
		THIS-OBJECT:ultraChart2:Axis:Z:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart2:Axis:Z:Labels:ItemFormatString = "".
		THIS-OBJECT:ultraChart2:Axis:Z:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart2:Axis:Z:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart2:Axis:Z:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart2:Axis:Z:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart2:Axis:Z:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart2:Axis:Z:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart2:Axis:Z:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart2:Axis:Z:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart2:Axis:Z:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart2:Axis:Z:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart2:Axis:Z:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart2:Axis:Z:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart2:Axis:Z:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart2:Axis:Z:Visible = FALSE.
		THIS-OBJECT:ultraChart2:Axis:Z2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart2:Axis:Z2:Labels:ItemFormatString = "".
		THIS-OBJECT:ultraChart2:Axis:Z2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart2:Axis:Z2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart2:Axis:Z2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart2:Axis:Z2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart2:Axis:Z2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart2:Axis:Z2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart2:Axis:Z2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart2:Axis:Z2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart2:Axis:Z2:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart2:Axis:Z2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart2:Axis:Z2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart2:Axis:Z2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart2:Axis:Z2:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart2:Axis:Z2:Visible = FALSE.
		THIS-OBJECT:ultraChart2:BackgroundImageLayout = System.Windows.Forms.ImageLayout:Center.
		THIS-OBJECT:ultraChart2:Border:CornerRadius = 5.
		THIS-OBJECT:ultraChart2:ColorModel:AlphaLevel = Progress.Util.CastUtil:ToByte(150).
		THIS-OBJECT:ultraChart2:ColorModel:ModelStyle = Infragistics.UltraChart.Shared.Styles.ColorModels:CustomSkin.
		paintElement14:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement14:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(108)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(162)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(36))).
		paintElement14:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement14:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(148)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(244)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(17))).
		paintElement15:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement15:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(7)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(108)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(176))).
		paintElement15:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement15:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(53)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(200)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		paintElement16:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement16:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(215)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(0)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(5))).
		paintElement16:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement16:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(254)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(117)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(16))).
		paintElement17:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement17:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(230)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(190)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(2))).
		paintElement17:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement17:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(81))).
		paintElement18:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement18:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(252)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(122)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(10))).
		paintElement18:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement18:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(66))).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar2 AS Infragistics.UltraChart.Resources.Appearance.PaintElement EXTENT 5 NO-UNDO.
		arrayvar2[1] = paintElement14.
		arrayvar2[2] = paintElement15.
		arrayvar2[3] = paintElement16.
		arrayvar2[4] = paintElement17.
		arrayvar2[5] = paintElement18.
		THIS-OBJECT:ultraChart2:ColorModel:Skin:PEs:AddRange(arrayvar2).
		THIS-OBJECT:ultraChart2:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:ultraChart2:ForeColor = System.Drawing.SystemColors:ControlText.
		THIS-OBJECT:ultraChart2:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:ultraChart2:Name = "ultraChart2".
		THIS-OBJECT:ultraChart2:Size = NEW System.Drawing.Size(493, 211).
		THIS-OBJECT:ultraChart2:TabIndex = 27.
		THIS-OBJECT:ultraChart2:TitleTop:Text = "Chart 4".
		THIS-OBJECT:ultraChart2:Tooltips:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 7.8000002).
		/*  */
		/* splitter2 */
		/*  */
		THIS-OBJECT:splitter2:Dock = System.Windows.Forms.DockStyle:Top.
		THIS-OBJECT:splitter2:Location = NEW System.Drawing.Point(0, 184).
		THIS-OBJECT:splitter2:Name = "splitter2".
		THIS-OBJECT:splitter2:Size = NEW System.Drawing.Size(200, 5).
		THIS-OBJECT:splitter2:TabIndex = 30.
		THIS-OBJECT:splitter2:TabStop = FALSE.
		/*  */
		/* panel4 */
		/*  */
		THIS-OBJECT:panel4:Controls:Add(THIS-OBJECT:ultraChart1).
		THIS-OBJECT:panel4:Dock = System.Windows.Forms.DockStyle:Top.
		THIS-OBJECT:panel4:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:panel4:Name = "panel4".
		THIS-OBJECT:panel4:Size = NEW System.Drawing.Size(200, 184).
		THIS-OBJECT:panel4:TabIndex = 29.
		/*  */
		/* ultraChart1 */
		/*  */
		THIS-OBJECT:ultraChart1:Axis:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(248)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(220))).
		paintElement19:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:None.
		paintElement19:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(248)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(220))).
		THIS-OBJECT:ultraChart1:Axis:PE = paintElement19.
		THIS-OBJECT:ultraChart1:Axis:X:Extent = 60.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:Font = NEW System.Drawing.Font("Tahoma", 14, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:ultraChart1:Axis:X:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:ItemFormatString = "<ITEM_LABEL>".
		THIS-OBJECT:ultraChart1:Axis:X:Labels:Layout:Behavior = Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors:Auto.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:SeriesLabels:Font = NEW System.Drawing.Font("Tahoma", 14).
		THIS-OBJECT:ultraChart1:Axis:X:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:SeriesLabels:Layout:Behavior = Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors:Auto.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:X:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:X:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart1:Axis:X:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:X:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart1:Axis:X:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:X:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart1:Axis:X:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:X:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart1:Axis:X:Visible = TRUE.
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:ItemFormatString = "<ITEM_LABEL>".
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:X2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:X2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart1:Axis:X2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:X2:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart1:Axis:X2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:X2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart1:Axis:X2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:X2:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart1:Axis:X2:Visible = FALSE.
		THIS-OBJECT:ultraChart1:Axis:Y:Extent = 20.
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:Font = NEW System.Drawing.Font("Tahoma", 14).
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:Layout:Behavior = Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors:Auto.
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:SeriesLabels:FormatString = "".
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:Y:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:Y:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart1:Axis:Y:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:Y:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart1:Axis:Y:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:Y:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart1:Axis:Y:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:Y:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart1:Axis:Y:TickmarkInterval = 200.
		THIS-OBJECT:ultraChart1:Axis:Y:TickmarkStyle = Infragistics.UltraChart.Shared.Styles.AxisTickStyle:Smart.
		THIS-OBJECT:ultraChart1:Axis:Y:Visible = TRUE.
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:SeriesLabels:FormatString = "".
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:Y2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:Y2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart1:Axis:Y2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:Y2:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart1:Axis:Y2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:Y2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart1:Axis:Y2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:Y2:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart1:Axis:Y2:Visible = FALSE.
		THIS-OBJECT:ultraChart1:Axis:Z:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart1:Axis:Z:Labels:ItemFormatString = "".
		THIS-OBJECT:ultraChart1:Axis:Z:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart1:Axis:Z:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart1:Axis:Z:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart1:Axis:Z:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:Z:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:Z:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:Z:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart1:Axis:Z:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:Z:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart1:Axis:Z:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:Z:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart1:Axis:Z:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:Z:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart1:Axis:Z:Visible = FALSE.
		THIS-OBJECT:ultraChart1:Axis:Z2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart1:Axis:Z2:Labels:ItemFormatString = "".
		THIS-OBJECT:ultraChart1:Axis:Z2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart1:Axis:Z2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart1:Axis:Z2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart1:Axis:Z2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:Z2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:Z2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:Z2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart1:Axis:Z2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:Z2:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart1:Axis:Z2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:Z2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart1:Axis:Z2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:Z2:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart1:Axis:Z2:Visible = FALSE.
		THIS-OBJECT:ultraChart1:BackgroundImageLayout = System.Windows.Forms.ImageLayout:Center.
		THIS-OBJECT:ultraChart1:Border:CornerRadius = 5.
		THIS-OBJECT:ultraChart1:ColorModel:AlphaLevel = Progress.Util.CastUtil:ToByte(150).
		THIS-OBJECT:ultraChart1:ColorModel:ModelStyle = Infragistics.UltraChart.Shared.Styles.ColorModels:CustomSkin.
		paintElement20:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement20:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(108)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(162)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(36))).
		paintElement20:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement20:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(148)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(244)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(17))).
		paintElement21:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement21:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(7)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(108)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(176))).
		paintElement21:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement21:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(53)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(200)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		paintElement22:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement22:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(215)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(0)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(5))).
		paintElement22:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement22:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(254)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(117)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(16))).
		paintElement23:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement23:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(230)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(190)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(2))).
		paintElement23:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement23:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(81))).
		paintElement24:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement24:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(252)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(122)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(10))).
		paintElement24:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement24:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(66))).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar3 AS Infragistics.UltraChart.Resources.Appearance.PaintElement EXTENT 5 NO-UNDO.
		arrayvar3[1] = paintElement20.
		arrayvar3[2] = paintElement21.
		arrayvar3[3] = paintElement22.
		arrayvar3[4] = paintElement23.
		arrayvar3[5] = paintElement24.
		THIS-OBJECT:ultraChart1:ColorModel:Skin:PEs:AddRange(arrayvar3).
		THIS-OBJECT:ultraChart1:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:ultraChart1:ForeColor = System.Drawing.SystemColors:ControlText.
		THIS-OBJECT:ultraChart1:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:ultraChart1:Name = "ultraChart1".
		THIS-OBJECT:ultraChart1:Size = NEW System.Drawing.Size(200, 184).
		THIS-OBJECT:ultraChart1:TabIndex = 26.
		THIS-OBJECT:ultraChart1:TitleTop:Text = "Chart 1".
		THIS-OBJECT:ultraChart1:Tooltips:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 7.8000002).
		/*  */
		/* panel2 */
		/*  */
		THIS-OBJECT:panel2:Controls:Add(THIS-OBJECT:panel5).
		THIS-OBJECT:panel2:Controls:Add(THIS-OBJECT:splitter2).
		THIS-OBJECT:panel2:Controls:Add(THIS-OBJECT:panel4).
		THIS-OBJECT:panel2:Dock = System.Windows.Forms.DockStyle:Left.
		THIS-OBJECT:panel2:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:panel2:Name = "panel2".
		THIS-OBJECT:panel2:Size = NEW System.Drawing.Size(200, 392).
		THIS-OBJECT:panel2:TabIndex = 30.
		/*  */
		/* splitter3 */
		/*  */
		THIS-OBJECT:splitter3:Dock = System.Windows.Forms.DockStyle:Top.
		THIS-OBJECT:splitter3:Location = NEW System.Drawing.Point(0, 176).
		THIS-OBJECT:splitter3:Name = "splitter3".
		THIS-OBJECT:splitter3:Size = NEW System.Drawing.Size(493, 5).
		THIS-OBJECT:splitter3:TabIndex = 31.
		THIS-OBJECT:splitter3:TabStop = FALSE.
		/*  */
		/* splitter1 */
		/*  */
		THIS-OBJECT:splitter1:Location = NEW System.Drawing.Point(200, 0).
		THIS-OBJECT:splitter1:Name = "splitter1".
		THIS-OBJECT:splitter1:Size = NEW System.Drawing.Size(5, 392).
		THIS-OBJECT:splitter1:TabIndex = 31.
		THIS-OBJECT:splitter1:TabStop = FALSE.
		/*  */
		/* panel1 */
		/*  */
		THIS-OBJECT:panel1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:panel1:Controls:Add(THIS-OBJECT:panel3).
		THIS-OBJECT:panel1:Controls:Add(THIS-OBJECT:splitter1).
		THIS-OBJECT:panel1:Controls:Add(THIS-OBJECT:panel2).
		THIS-OBJECT:panel1:Location = NEW System.Drawing.Point(14, 171).
		THIS-OBJECT:panel1:Name = "panel1".
		THIS-OBJECT:panel1:Size = NEW System.Drawing.Size(698, 392).
		THIS-OBJECT:panel1:TabIndex = 25.
		/*  */
		/* panel3 */
		/*  */
		THIS-OBJECT:panel3:Controls:Add(THIS-OBJECT:panel7).
		THIS-OBJECT:panel3:Controls:Add(THIS-OBJECT:splitter3).
		THIS-OBJECT:panel3:Controls:Add(THIS-OBJECT:panel6).
		THIS-OBJECT:panel3:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:panel3:Location = NEW System.Drawing.Point(205, 0).
		THIS-OBJECT:panel3:Name = "panel3".
		THIS-OBJECT:panel3:Size = NEW System.Drawing.Size(493, 392).
		THIS-OBJECT:panel3:TabIndex = 32.
		/*  */
		/* panel6 */
		/*  */
		THIS-OBJECT:panel6:Controls:Add(THIS-OBJECT:ultraChart4).
		THIS-OBJECT:panel6:Dock = System.Windows.Forms.DockStyle:Top.
		THIS-OBJECT:panel6:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:panel6:Name = "panel6".
		THIS-OBJECT:panel6:Size = NEW System.Drawing.Size(493, 176).
		THIS-OBJECT:panel6:TabIndex = 30.
		/*  */
		/* tabPage3 */
		/*  */
		THIS-OBJECT:tabPage3:Controls:Add(THIS-OBJECT:chart3_axisYLabelsLayoutBehavior).
		THIS-OBJECT:tabPage3:Controls:Add(THIS-OBJECT:chart3_axisXSeriesLabelsLayoutBehavior).
		THIS-OBJECT:tabPage3:Controls:Add(THIS-OBJECT:chart3_axisXLabelsLayoutBehavior).
		THIS-OBJECT:tabPage3:Controls:Add(THIS-OBJECT:chart3_axisYExtent).
		THIS-OBJECT:tabPage3:Controls:Add(THIS-OBJECT:ultraLabel12).
		THIS-OBJECT:tabPage3:Controls:Add(THIS-OBJECT:chart3_axisXExtent).
		THIS-OBJECT:tabPage3:Controls:Add(THIS-OBJECT:ultraLabel13).
		THIS-OBJECT:tabPage3:Controls:Add(THIS-OBJECT:ultraLabel14).
		THIS-OBJECT:tabPage3:Controls:Add(THIS-OBJECT:ultraLabel15).
		THIS-OBJECT:tabPage3:Controls:Add(THIS-OBJECT:ultraLabel16).
		THIS-OBJECT:tabPage3:Location = NEW System.Drawing.Point(4, 22).
		THIS-OBJECT:tabPage3:Name = "tabPage3".
		THIS-OBJECT:tabPage3:Size = NEW System.Drawing.Size(240, 336).
		THIS-OBJECT:tabPage3:TabIndex = 2.
		THIS-OBJECT:tabPage3:Text = "Chart 3".
		/*  */
		/* chart3_axisYExtent */
		/*  */
		THIS-OBJECT:chart3_axisYExtent:Location = NEW System.Drawing.Point(10, 260).
		THIS-OBJECT:chart3_axisYExtent:Maximum = 100.
		THIS-OBJECT:chart3_axisYExtent:Name = "chart3_axisYExtent".
		THIS-OBJECT:chart3_axisYExtent:Size = NEW System.Drawing.Size(220, 42).
		THIS-OBJECT:chart3_axisYExtent:TabIndex = 31.
		THIS-OBJECT:chart3_axisYExtent:TickFrequency = 5.
		THIS-OBJECT:chart3_axisYExtent:TickStyle = System.Windows.Forms.TickStyle:None.
		THIS-OBJECT:chart3_axisYExtent:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart3editors_ValueChanged).
		/*  */
		/* ultraLabel12 */
		/*  */
		appearance12:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel12:Appearance = appearance12.
		THIS-OBJECT:ultraLabel12:Location = NEW System.Drawing.Point(10, 240).
		THIS-OBJECT:ultraLabel12:Name = "ultraLabel12".
		THIS-OBJECT:ultraLabel12:Size = NEW System.Drawing.Size(112, 16).
		THIS-OBJECT:ultraLabel12:TabIndex = 30.
		THIS-OBJECT:ultraLabel12:Text = "Y Axis Extent".
		/*  */
		/* chart3_axisXExtent */
		/*  */
		THIS-OBJECT:chart3_axisXExtent:Location = NEW System.Drawing.Point(10, 198).
		THIS-OBJECT:chart3_axisXExtent:Maximum = 100.
		THIS-OBJECT:chart3_axisXExtent:Name = "chart3_axisXExtent".
		THIS-OBJECT:chart3_axisXExtent:Size = NEW System.Drawing.Size(220, 42).
		THIS-OBJECT:chart3_axisXExtent:TabIndex = 32.
		THIS-OBJECT:chart3_axisXExtent:TickFrequency = 5.
		THIS-OBJECT:chart3_axisXExtent:TickStyle = System.Windows.Forms.TickStyle:None.
		THIS-OBJECT:chart3_axisXExtent:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart3editors_ValueChanged).
		/*  */
		/* ultraLabel13 */
		/*  */
		appearance13:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel13:Appearance = appearance13.
		THIS-OBJECT:ultraLabel13:Location = NEW System.Drawing.Point(10, 178).
		THIS-OBJECT:ultraLabel13:Name = "ultraLabel13".
		THIS-OBJECT:ultraLabel13:Size = NEW System.Drawing.Size(112, 16).
		THIS-OBJECT:ultraLabel13:TabIndex = 29.
		THIS-OBJECT:ultraLabel13:Text = "X Axis Extent".
		/*  */
		/* ultraLabel14 */
		/*  */
		appearance14:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel14:Appearance = appearance14.
		THIS-OBJECT:ultraLabel14:Location = NEW System.Drawing.Point(6, 36).
		THIS-OBJECT:ultraLabel14:Name = "ultraLabel14".
		THIS-OBJECT:ultraLabel14:Size = NEW System.Drawing.Size(112, 14).
		THIS-OBJECT:ultraLabel14:TabIndex = 27.
		THIS-OBJECT:ultraLabel14:Text = "Y Axis Labels".
		/*  */
		/* ultraLabel15 */
		/*  */
		appearance15:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel15:Appearance = appearance15.
		THIS-OBJECT:ultraLabel15:Location = NEW System.Drawing.Point(6, 62).
		THIS-OBJECT:ultraLabel15:Name = "ultraLabel15".
		THIS-OBJECT:ultraLabel15:Size = NEW System.Drawing.Size(112, 14).
		THIS-OBJECT:ultraLabel15:TabIndex = 28.
		THIS-OBJECT:ultraLabel15:Text = "X Axis Series Labels".
		/*  */
		/* ultraLabel16 */
		/*  */
		appearance16:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel16:Appearance = appearance16.
		THIS-OBJECT:ultraLabel16:Location = NEW System.Drawing.Point(6, 10).
		THIS-OBJECT:ultraLabel16:Name = "ultraLabel16".
		THIS-OBJECT:ultraLabel16:Size = NEW System.Drawing.Size(112, 14).
		THIS-OBJECT:ultraLabel16:TabIndex = 26.
		THIS-OBJECT:ultraLabel16:Text = "X Axis Labels".
		/*  */
		/* chart1_axisYLabelsLayoutBehavior */
		/*  */
		THIS-OBJECT:chart1_axisYLabelsLayoutBehavior:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:chart1_axisYLabelsLayoutBehavior:Location = NEW System.Drawing.Point(114, 32).
		THIS-OBJECT:chart1_axisYLabelsLayoutBehavior:Name = "chart1_axisYLabelsLayoutBehavior".
		THIS-OBJECT:chart1_axisYLabelsLayoutBehavior:Size = NEW System.Drawing.Size(123, 21).
		THIS-OBJECT:chart1_axisYLabelsLayoutBehavior:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:chart1_axisYLabelsLayoutBehavior:TabIndex = 15.
		THIS-OBJECT:chart1_axisYLabelsLayoutBehavior:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart1editors_ValueChanged).
		/*  */
		/* chart1_axisXSeriesLabelsLayoutBehavior */
		/*  */
		THIS-OBJECT:chart1_axisXSeriesLabelsLayoutBehavior:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:chart1_axisXSeriesLabelsLayoutBehavior:Location = NEW System.Drawing.Point(114, 58).
		THIS-OBJECT:chart1_axisXSeriesLabelsLayoutBehavior:Name = "chart1_axisXSeriesLabelsLayoutBehavior".
		THIS-OBJECT:chart1_axisXSeriesLabelsLayoutBehavior:Size = NEW System.Drawing.Size(122, 21).
		THIS-OBJECT:chart1_axisXSeriesLabelsLayoutBehavior:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:chart1_axisXSeriesLabelsLayoutBehavior:TabIndex = 14.
		THIS-OBJECT:chart1_axisXSeriesLabelsLayoutBehavior:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart1editors_ValueChanged).
		/*  */
		/* chart1_axisXLabelsLayoutBehavior */
		/*  */
		THIS-OBJECT:chart1_axisXLabelsLayoutBehavior:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:chart1_axisXLabelsLayoutBehavior:Location = NEW System.Drawing.Point(114, 6).
		THIS-OBJECT:chart1_axisXLabelsLayoutBehavior:Name = "chart1_axisXLabelsLayoutBehavior".
		THIS-OBJECT:chart1_axisXLabelsLayoutBehavior:Size = NEW System.Drawing.Size(123, 21).
		THIS-OBJECT:chart1_axisXLabelsLayoutBehavior:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:chart1_axisXLabelsLayoutBehavior:TabIndex = 13.
		THIS-OBJECT:chart1_axisXLabelsLayoutBehavior:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart1editors_ValueChanged).
		/*  */
		/* chart1_axisYExtent */
		/*  */
		THIS-OBJECT:chart1_axisYExtent:Location = NEW System.Drawing.Point(10, 260).
		THIS-OBJECT:chart1_axisYExtent:Maximum = 100.
		THIS-OBJECT:chart1_axisYExtent:Name = "chart1_axisYExtent".
		THIS-OBJECT:chart1_axisYExtent:Size = NEW System.Drawing.Size(220, 42).
		THIS-OBJECT:chart1_axisYExtent:TabIndex = 21.
		THIS-OBJECT:chart1_axisYExtent:TickFrequency = 5.
		THIS-OBJECT:chart1_axisYExtent:TickStyle = System.Windows.Forms.TickStyle:None.
		THIS-OBJECT:chart1_axisYExtent:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart1editors_ValueChanged).
		/*  */
		/* ultraLabel11 */
		/*  */
		appearance11:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel11:Appearance = appearance11.
		THIS-OBJECT:ultraLabel11:Location = NEW System.Drawing.Point(6, 10).
		THIS-OBJECT:ultraLabel11:Name = "ultraLabel11".
		THIS-OBJECT:ultraLabel11:Size = NEW System.Drawing.Size(112, 14).
		THIS-OBJECT:ultraLabel11:TabIndex = 26.
		THIS-OBJECT:ultraLabel11:Text = "X Axis Labels".
		/*  */
		/* ultraLabel7 */
		/*  */
		appearance2:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel7:Appearance = appearance2.
		THIS-OBJECT:ultraLabel7:Location = NEW System.Drawing.Point(10, 240).
		THIS-OBJECT:ultraLabel7:Name = "ultraLabel7".
		THIS-OBJECT:ultraLabel7:Size = NEW System.Drawing.Size(112, 16).
		THIS-OBJECT:ultraLabel7:TabIndex = 20.
		THIS-OBJECT:ultraLabel7:Text = "Y Axis Extent".
		/*  */
		/* chart1_axisXExtent */
		/*  */
		THIS-OBJECT:chart1_axisXExtent:Location = NEW System.Drawing.Point(10, 198).
		THIS-OBJECT:chart1_axisXExtent:Maximum = 100.
		THIS-OBJECT:chart1_axisXExtent:Name = "chart1_axisXExtent".
		THIS-OBJECT:chart1_axisXExtent:Size = NEW System.Drawing.Size(220, 42).
		THIS-OBJECT:chart1_axisXExtent:TabIndex = 22.
		THIS-OBJECT:chart1_axisXExtent:TickFrequency = 5.
		THIS-OBJECT:chart1_axisXExtent:TickStyle = System.Windows.Forms.TickStyle:None.
		THIS-OBJECT:chart1_axisXExtent:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart1editors_ValueChanged).
		/*  */
		/* ultraLabel6 */
		/*  */
		appearance3:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel6:Appearance = appearance3.
		THIS-OBJECT:ultraLabel6:Location = NEW System.Drawing.Point(10, 178).
		THIS-OBJECT:ultraLabel6:Name = "ultraLabel6".
		THIS-OBJECT:ultraLabel6:Size = NEW System.Drawing.Size(112, 16).
		THIS-OBJECT:ultraLabel6:TabIndex = 19.
		THIS-OBJECT:ultraLabel6:Text = "X Axis Extent".
		/*  */
		/* ultraLabel5 */
		/*  */
		appearance4:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel5:Appearance = appearance4.
		THIS-OBJECT:ultraLabel5:Location = NEW System.Drawing.Point(6, 36).
		THIS-OBJECT:ultraLabel5:Name = "ultraLabel5".
		THIS-OBJECT:ultraLabel5:Size = NEW System.Drawing.Size(112, 14).
		THIS-OBJECT:ultraLabel5:TabIndex = 17.
		THIS-OBJECT:ultraLabel5:Text = "Y Axis Labels".
		/*  */
		/* ultraLabel4 */
		/*  */
		appearance5:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel4:Appearance = appearance5.
		THIS-OBJECT:ultraLabel4:Location = NEW System.Drawing.Point(6, 62).
		THIS-OBJECT:ultraLabel4:Name = "ultraLabel4".
		THIS-OBJECT:ultraLabel4:Size = NEW System.Drawing.Size(112, 14).
		THIS-OBJECT:ultraLabel4:TabIndex = 18.
		THIS-OBJECT:ultraLabel4:Text = "X Axis Series Labels".
		/*  */
		/* ultraExpandableGroupBoxPanel1 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:AutoScroll = TRUE.
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:AutoScrollMinSize = NEW System.Drawing.Size(0, 250).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Controls:Add(THIS-OBJECT:ultraLabel1).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Location = NEW System.Drawing.Point(7, 31).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Name = "ultraExpandableGroupBoxPanel1".
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Size = NEW System.Drawing.Size(964, 106).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:TabIndex = 0.
		/*  */
		/* ultraLabel1 */
		/*  */
		appearance1:BackColor = System.Drawing.Color:White.
		THIS-OBJECT:ultraLabel1:Appearance = appearance1.
		THIS-OBJECT:ultraLabel1:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:ultraLabel1:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:ultraLabel1:Name = "ultraLabel1".
		THIS-OBJECT:ultraLabel1:Size = NEW System.Drawing.Size(948, 250).
		THIS-OBJECT:ultraLabel1:TabIndex = 3.
		THIS-OBJECT:ultraLabel1:Text = resources:GetString("ultraLabel1.Text").
		/*  */
		/* ultraGroupBox1 */
		/*  */
		THIS-OBJECT:ultraGroupBox1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:tabControl1).
		THIS-OBJECT:ultraGroupBox1:Location = NEW System.Drawing.Point(720, 171).
		THIS-OBJECT:ultraGroupBox1:Name = "ultraGroupBox1".
		THIS-OBJECT:ultraGroupBox1:Size = NEW System.Drawing.Size(264, 392).
		THIS-OBJECT:ultraGroupBox1:TabIndex = 24.
		THIS-OBJECT:ultraGroupBox1:Text = "Anti-Collision Lables".
		/*  */
		/* tabControl1 */
		/*  */
		THIS-OBJECT:tabControl1:Controls:Add(THIS-OBJECT:tabPage1).
		THIS-OBJECT:tabControl1:Controls:Add(THIS-OBJECT:tabPage2).
		THIS-OBJECT:tabControl1:Controls:Add(THIS-OBJECT:tabPage3).
		THIS-OBJECT:tabControl1:Controls:Add(THIS-OBJECT:tabPage4).
		THIS-OBJECT:tabControl1:Location = NEW System.Drawing.Point(8, 22).
		THIS-OBJECT:tabControl1:Name = "tabControl1".
		THIS-OBJECT:tabControl1:SelectedIndex = 0.
		THIS-OBJECT:tabControl1:Size = NEW System.Drawing.Size(248, 362).
		THIS-OBJECT:tabControl1:TabIndex = 17.
		/*  */
		/* tabPage1 */
		/*  */
		THIS-OBJECT:tabPage1:Controls:Add(THIS-OBJECT:chart1_axisYLabelsLayoutBehavior).
		THIS-OBJECT:tabPage1:Controls:Add(THIS-OBJECT:chart1_axisXSeriesLabelsLayoutBehavior).
		THIS-OBJECT:tabPage1:Controls:Add(THIS-OBJECT:chart1_axisXLabelsLayoutBehavior).
		THIS-OBJECT:tabPage1:Controls:Add(THIS-OBJECT:chart1_axisYExtent).
		THIS-OBJECT:tabPage1:Controls:Add(THIS-OBJECT:ultraLabel7).
		THIS-OBJECT:tabPage1:Controls:Add(THIS-OBJECT:chart1_axisXExtent).
		THIS-OBJECT:tabPage1:Controls:Add(THIS-OBJECT:ultraLabel6).
		THIS-OBJECT:tabPage1:Controls:Add(THIS-OBJECT:ultraLabel5).
		THIS-OBJECT:tabPage1:Controls:Add(THIS-OBJECT:ultraLabel4).
		THIS-OBJECT:tabPage1:Controls:Add(THIS-OBJECT:ultraLabel3).
		THIS-OBJECT:tabPage1:Location = NEW System.Drawing.Point(4, 22).
		THIS-OBJECT:tabPage1:Name = "tabPage1".
		THIS-OBJECT:tabPage1:Size = NEW System.Drawing.Size(240, 336).
		THIS-OBJECT:tabPage1:TabIndex = 0.
		THIS-OBJECT:tabPage1:Text = "Chart 1".
		/*  */
		/* ultraLabel3 */
		/*  */
		appearance6:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel3:Appearance = appearance6.
		THIS-OBJECT:ultraLabel3:Location = NEW System.Drawing.Point(6, 10).
		THIS-OBJECT:ultraLabel3:Name = "ultraLabel3".
		THIS-OBJECT:ultraLabel3:Size = NEW System.Drawing.Size(112, 14).
		THIS-OBJECT:ultraLabel3:TabIndex = 16.
		THIS-OBJECT:ultraLabel3:Text = "X Axis Labels".
		/*  */
		/* tabPage2 */
		/*  */
		THIS-OBJECT:tabPage2:Controls:Add(THIS-OBJECT:chart2_axisYLabelsLayoutBehavior).
		THIS-OBJECT:tabPage2:Controls:Add(THIS-OBJECT:chart2_axisXSeriesLabelsLayoutBehavior).
		THIS-OBJECT:tabPage2:Controls:Add(THIS-OBJECT:chart2_axisXLabelsLayoutBehavior).
		THIS-OBJECT:tabPage2:Controls:Add(THIS-OBJECT:chart2_axisYExtent).
		THIS-OBJECT:tabPage2:Controls:Add(THIS-OBJECT:ultraLabel2).
		THIS-OBJECT:tabPage2:Controls:Add(THIS-OBJECT:chart2_axisXExtent).
		THIS-OBJECT:tabPage2:Controls:Add(THIS-OBJECT:ultraLabel8).
		THIS-OBJECT:tabPage2:Controls:Add(THIS-OBJECT:ultraLabel9).
		THIS-OBJECT:tabPage2:Controls:Add(THIS-OBJECT:ultraLabel10).
		THIS-OBJECT:tabPage2:Controls:Add(THIS-OBJECT:ultraLabel11).
		THIS-OBJECT:tabPage2:Location = NEW System.Drawing.Point(4, 22).
		THIS-OBJECT:tabPage2:Name = "tabPage2".
		THIS-OBJECT:tabPage2:Size = NEW System.Drawing.Size(240, 336).
		THIS-OBJECT:tabPage2:TabIndex = 1.
		THIS-OBJECT:tabPage2:Text = "Chart 2".
		/*  */
		/* chart2_axisYLabelsLayoutBehavior */
		/*  */
		THIS-OBJECT:chart2_axisYLabelsLayoutBehavior:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:chart2_axisYLabelsLayoutBehavior:Location = NEW System.Drawing.Point(114, 32).
		THIS-OBJECT:chart2_axisYLabelsLayoutBehavior:Name = "chart2_axisYLabelsLayoutBehavior".
		THIS-OBJECT:chart2_axisYLabelsLayoutBehavior:Size = NEW System.Drawing.Size(123, 21).
		THIS-OBJECT:chart2_axisYLabelsLayoutBehavior:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:chart2_axisYLabelsLayoutBehavior:TabIndex = 25.
		THIS-OBJECT:chart2_axisYLabelsLayoutBehavior:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart2editors_ValueChanged).
		/*  */
		/* chart2_axisXSeriesLabelsLayoutBehavior */
		/*  */
		THIS-OBJECT:chart2_axisXSeriesLabelsLayoutBehavior:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:chart2_axisXSeriesLabelsLayoutBehavior:Location = NEW System.Drawing.Point(114, 58).
		THIS-OBJECT:chart2_axisXSeriesLabelsLayoutBehavior:Name = "chart2_axisXSeriesLabelsLayoutBehavior".
		THIS-OBJECT:chart2_axisXSeriesLabelsLayoutBehavior:Size = NEW System.Drawing.Size(123, 21).
		THIS-OBJECT:chart2_axisXSeriesLabelsLayoutBehavior:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:chart2_axisXSeriesLabelsLayoutBehavior:TabIndex = 24.
		THIS-OBJECT:chart2_axisXSeriesLabelsLayoutBehavior:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart2editors_ValueChanged).
		/*  */
		/* chart2_axisXLabelsLayoutBehavior */
		/*  */
		THIS-OBJECT:chart2_axisXLabelsLayoutBehavior:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:chart2_axisXLabelsLayoutBehavior:Location = NEW System.Drawing.Point(114, 6).
		THIS-OBJECT:chart2_axisXLabelsLayoutBehavior:Name = "chart2_axisXLabelsLayoutBehavior".
		THIS-OBJECT:chart2_axisXLabelsLayoutBehavior:Size = NEW System.Drawing.Size(123, 21).
		THIS-OBJECT:chart2_axisXLabelsLayoutBehavior:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:chart2_axisXLabelsLayoutBehavior:TabIndex = 23.
		THIS-OBJECT:chart2_axisXLabelsLayoutBehavior:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart2editors_ValueChanged).
		/*  */
		/* chart2_axisYExtent */
		/*  */
		THIS-OBJECT:chart2_axisYExtent:Location = NEW System.Drawing.Point(10, 260).
		THIS-OBJECT:chart2_axisYExtent:Maximum = 100.
		THIS-OBJECT:chart2_axisYExtent:Name = "chart2_axisYExtent".
		THIS-OBJECT:chart2_axisYExtent:Size = NEW System.Drawing.Size(220, 42).
		THIS-OBJECT:chart2_axisYExtent:TabIndex = 31.
		THIS-OBJECT:chart2_axisYExtent:TickFrequency = 5.
		THIS-OBJECT:chart2_axisYExtent:TickStyle = System.Windows.Forms.TickStyle:None.
		THIS-OBJECT:chart2_axisYExtent:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart2editors_ValueChanged).
		/*  */
		/* ultraLabel2 */
		/*  */
		appearance7:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel2:Appearance = appearance7.
		THIS-OBJECT:ultraLabel2:Location = NEW System.Drawing.Point(10, 240).
		THIS-OBJECT:ultraLabel2:Name = "ultraLabel2".
		THIS-OBJECT:ultraLabel2:Size = NEW System.Drawing.Size(112, 16).
		THIS-OBJECT:ultraLabel2:TabIndex = 30.
		THIS-OBJECT:ultraLabel2:Text = "Y Axis Extent".
		/*  */
		/* chart2_axisXExtent */
		/*  */
		THIS-OBJECT:chart2_axisXExtent:Location = NEW System.Drawing.Point(10, 198).
		THIS-OBJECT:chart2_axisXExtent:Maximum = 100.
		THIS-OBJECT:chart2_axisXExtent:Name = "chart2_axisXExtent".
		THIS-OBJECT:chart2_axisXExtent:Size = NEW System.Drawing.Size(220, 42).
		THIS-OBJECT:chart2_axisXExtent:TabIndex = 32.
		THIS-OBJECT:chart2_axisXExtent:TickFrequency = 5.
		THIS-OBJECT:chart2_axisXExtent:TickStyle = System.Windows.Forms.TickStyle:None.
		THIS-OBJECT:chart2_axisXExtent:ValueChanged:SUBSCRIBE(THIS-OBJECT:chart2editors_ValueChanged).
		/*  */
		/* ultraLabel8 */
		/*  */
		appearance8:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel8:Appearance = appearance8.
		THIS-OBJECT:ultraLabel8:Location = NEW System.Drawing.Point(10, 178).
		THIS-OBJECT:ultraLabel8:Name = "ultraLabel8".
		THIS-OBJECT:ultraLabel8:Size = NEW System.Drawing.Size(112, 16).
		THIS-OBJECT:ultraLabel8:TabIndex = 29.
		THIS-OBJECT:ultraLabel8:Text = "X Axis Extent".
		/*  */
		/* ultraLabel9 */
		/*  */
		appearance9:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel9:Appearance = appearance9.
		THIS-OBJECT:ultraLabel9:Location = NEW System.Drawing.Point(6, 36).
		THIS-OBJECT:ultraLabel9:Name = "ultraLabel9".
		THIS-OBJECT:ultraLabel9:Size = NEW System.Drawing.Size(112, 14).
		THIS-OBJECT:ultraLabel9:TabIndex = 27.
		THIS-OBJECT:ultraLabel9:Text = "Y Axis Labels".
		/*  */
		/* ultraLabel10 */
		/*  */
		appearance10:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel10:Appearance = appearance10.
		THIS-OBJECT:ultraLabel10:Location = NEW System.Drawing.Point(6, 62).
		THIS-OBJECT:ultraLabel10:Name = "ultraLabel10".
		THIS-OBJECT:ultraLabel10:Size = NEW System.Drawing.Size(112, 14).
		THIS-OBJECT:ultraLabel10:TabIndex = 28.
		THIS-OBJECT:ultraLabel10:Text = "X Axis Series Labels".
		/*  */
		/* ultraExpandableGroupBox1 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBox1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraExpandableGroupBox1:ContentPadding:Bottom = 5.
		THIS-OBJECT:ultraExpandableGroupBox1:ContentPadding:Left = 5.
		THIS-OBJECT:ultraExpandableGroupBox1:ContentPadding:Right = 5.
		THIS-OBJECT:ultraExpandableGroupBox1:ContentPadding:Top = 5.
		THIS-OBJECT:ultraExpandableGroupBox1:Controls:Add(THIS-OBJECT:ultraExpandableGroupBoxPanel1).
		THIS-OBJECT:ultraExpandableGroupBox1:ExpandedSize = NEW System.Drawing.Size(978, 144).
		THIS-OBJECT:ultraExpandableGroupBox1:HeaderClickAction = Infragistics.Win.Misc.GroupBoxHeaderClickAction:None.
		THIS-OBJECT:ultraExpandableGroupBox1:HeaderPosition = Infragistics.Win.Misc.GroupBoxHeaderPosition:TopOutsideBorder.
		THIS-OBJECT:ultraExpandableGroupBox1:Location = NEW System.Drawing.Point(6, 19).
		THIS-OBJECT:ultraExpandableGroupBox1:Name = "ultraExpandableGroupBox1".
		THIS-OBJECT:ultraExpandableGroupBox1:Size = NEW System.Drawing.Size(978, 144).
		THIS-OBJECT:ultraExpandableGroupBox1:TabIndex = 23.
		THIS-OBJECT:ultraExpandableGroupBox1:Text = "Axis Label Layout".
		THIS-OBJECT:ultraExpandableGroupBox1:ViewStyle = Infragistics.Win.Misc.GroupBoxViewStyle:Office2003.
		/*  */
		/* AxisLabelLayout */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(991, 582).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:panel1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraGroupBox1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraExpandableGroupBox1).
		THIS-OBJECT:Name = "AxisLabelLayout".
		THIS-OBJECT:Text = "Axis Label Layout".
		THIS-OBJECT:Load:SUBSCRIBE(THIS-OBJECT:AxisLabelLayout_Load_1).
		CAST(THIS-OBJECT:chart4_axisYLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart4_axisXSeriesLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart4_axisXLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart4_axisYExtent, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraChart4, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart4_axisXExtent, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart3_axisYLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart3_axisXSeriesLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:tabPage4:ResumeLayout(FALSE).
		THIS-OBJECT:tabPage4:PerformLayout().
		CAST(THIS-OBJECT:chart3_axisXLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:panel5:ResumeLayout(FALSE).
		CAST(THIS-OBJECT:ultraChart3, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:panel7:ResumeLayout(FALSE).
		CAST(THIS-OBJECT:ultraChart2, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:panel4:ResumeLayout(FALSE).
		CAST(THIS-OBJECT:ultraChart1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:panel2:ResumeLayout(FALSE).
		THIS-OBJECT:panel1:ResumeLayout(FALSE).
		THIS-OBJECT:panel3:ResumeLayout(FALSE).
		THIS-OBJECT:panel6:ResumeLayout(FALSE).
		THIS-OBJECT:tabPage3:ResumeLayout(FALSE).
		THIS-OBJECT:tabPage3:PerformLayout().
		CAST(THIS-OBJECT:chart3_axisYExtent, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart3_axisXExtent, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart1_axisYLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart1_axisXSeriesLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart1_axisXLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart1_axisYExtent, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart1_axisXExtent, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:ResumeLayout(FALSE).
		CAST(THIS-OBJECT:ultraGroupBox1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraGroupBox1:ResumeLayout(FALSE).
		THIS-OBJECT:tabControl1:ResumeLayout(FALSE).
		THIS-OBJECT:tabPage1:ResumeLayout(FALSE).
		THIS-OBJECT:tabPage1:PerformLayout().
		THIS-OBJECT:tabPage2:ResumeLayout(FALSE).
		THIS-OBJECT:tabPage2:PerformLayout().
		CAST(THIS-OBJECT:chart2_axisYLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart2_axisXSeriesLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart2_axisXLabelsLayoutBehavior, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart2_axisYExtent, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:chart2_axisXExtent, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraExpandableGroupBox1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraExpandableGroupBox1:ResumeLayout(FALSE).
		THIS-OBJECT:ResumeLayout(FALSE).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC VOID InitializeDataSource(  ):
        fSalesrepService = new DataServices.SalesrepOrderService().                  
        fSalesrepService:fetchData().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID AxisLabelLayout_Load_1( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):

	    /* retrieve the dataset table as a DataTable */
        salesrepOrderDT = fSalesrepService:DataTable('eSalesrep',"","").

        InitalizeChart1().
		InitalizeChart2().
		InitalizeChart3().
		InitalizeChart4().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC VOID InitalizeChart1(  ):
	    DEFINE VARIABLE layoutBehaviors AS System.Array                    NO-UNDO.
	    DEFINE VARIABLE behavior        AS AxisLabelLayoutBehaviors        NO-UNDO.
	    DEFINE VARIABLE totalBehaviors  AS INTEGER                         NO-UNDO.
	    DEFINE VARIABLE currentBehavior AS INTEGER                         NO-UNDO.
	    define variable customBehaviors as "AxisLabelLayoutBehavior[]":u   no-undo.

        ultraChart1:Data:DataSource = salesrepOrderDT.
        ultraChart1:Data:DataBind().
        ultraChart1:BackgroundImage = System.Drawing.Image:FromFile(SEARCH("WinChart/images/chart_gray_bg.jpg")).

        /*populate dropdownlists*/
        layoutBehaviors = System.Enum:GetValues(TypeHelper:GetType("Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors")) .
        totalBehaviors  = layoutBehaviors:LENGTH - 1.

        REPEAT currentBehavior = 0 TO totalBehaviors:
            behavior = CAST(layoutBehaviors:GetValue(currentBehavior),AxisLabelLayoutBehaviors ).
        	chart1_axisXLabelsLayoutBehavior:Items:Add(behavior).
        	chart1_axisXSeriesLabelsLayoutBehavior:Items:Add(behavior).
        	chart1_axisYLabelsLayoutBehavior:Items:Add(behavior).        	
        END.

        /*initialize dropdownlists*/
        chart1_axisXLabelsLayoutBehavior:SelectedIndex = chart1_axisXLabelsLayoutBehavior:FindString(STRING(ultraChart1:Axis:X:Labels:Layout:Behavior)).
        chart1_axisXSeriesLabelsLayoutBehavior:SelectedIndex = chart1_axisXSeriesLabelsLayoutBehavior:FindString(STRING(ultraChart1:Axis:X:Labels:SeriesLabels:Layout:Behavior)).
        chart1_axisYLabelsLayoutBehavior:SelectedIndex = chart1_axisYLabelsLayoutBehavior:FindString(STRING(ultraChart1:Axis:Y:Labels:Layout:Behavior)).
        
        /*initialize trackbars*/
        chart1_axisXExtent:Value = ultraChart1:Axis:X:Extent.
        chart1_axisYExtent:Value = ultraChart1:Axis:Y:Extent.

        customBehaviors = GetCustomLayoutBehaviors().
        ultraChart1:Axis:X:Labels:Layout:BehaviorCollection:AddRange(customBehaviors).
        customBehaviors = GetCustomLayoutBehaviors().
        ultraChart1:Axis:X:Labels:SeriesLabels:Layout:BehaviorCollection:AddRange(customBehaviors).
        customBehaviors = GetCustomLayoutBehaviors().
        ultraChart1:Axis:Y:Labels:Layout:BehaviorCollection:AddRange(customBehaviors).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC VOID InitalizeChart2():
	    DEFINE VARIABLE layoutBehaviors AS System.Array                    NO-UNDO.
	    DEFINE VARIABLE behavior        AS AxisLabelLayoutBehaviors        NO-UNDO.
	    DEFINE VARIABLE totalBehaviors  AS INTEGER                         NO-UNDO.
	    DEFINE VARIABLE currentBehavior AS INTEGER                         NO-UNDO.
	    define variable customBehaviors as "AxisLabelLayoutBehavior[]":u   no-undo.

        ultraChart2:Data:DataSource = salesrepOrderDT.
        ultraChart2:Data:DataBind().
        ultraChart2:BackgroundImage = System.Drawing.Image:FromFile(SEARCH("WinChart/images/chart_gray_bg.jpg")).

        /*populate dropdownlists*/
        layoutBehaviors = System.Enum:GetValues(TypeHelper:GetType("Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors")) .
        totalBehaviors  = layoutBehaviors:LENGTH - 1.

        REPEAT currentBehavior = 0 TO totalBehaviors:
            behavior = CAST(layoutBehaviors:GetValue(currentBehavior),AxisLabelLayoutBehaviors ).
        	chart2_axisXLabelsLayoutBehavior:Items:Add(behavior).
        	chart2_axisXSeriesLabelsLayoutBehavior:Items:Add(behavior).
        	chart2_axisYLabelsLayoutBehavior:Items:Add(behavior).        	
        END.

        /*initialize dropdownlists*/
        chart2_axisXLabelsLayoutBehavior:SelectedIndex = chart2_axisXLabelsLayoutBehavior:FindString(STRING(ultraChart2:Axis:X:Labels:Layout:Behavior)).
        chart2_axisXSeriesLabelsLayoutBehavior:SelectedIndex = chart2_axisXSeriesLabelsLayoutBehavior:FindString(STRING(ultraChart2:Axis:X:Labels:SeriesLabels:Layout:Behavior)).
        chart2_axisYLabelsLayoutBehavior:SelectedIndex = chart2_axisYLabelsLayoutBehavior:FindString(STRING(ultraChart2:Axis:Y:Labels:Layout:Behavior)).
        
        /*initialize trackbars*/
        chart2_axisXExtent:Value = ultraChart2:Axis:X:Extent.
        chart2_axisYExtent:Value = ultraChart2:Axis:Y:Extent.

        customBehaviors = GetCustomLayoutBehaviors().
        ultraChart2:Axis:X:Labels:Layout:BehaviorCollection:AddRange(customBehaviors).
        customBehaviors = GetCustomLayoutBehaviors().
        ultraChart2:Axis:X:Labels:SeriesLabels:Layout:BehaviorCollection:AddRange(customBehaviors).
        customBehaviors = GetCustomLayoutBehaviors().
        ultraChart2:Axis:Y:Labels:Layout:BehaviorCollection:AddRange(customBehaviors).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC VOID InitalizeChart3():
	    DEFINE VARIABLE layoutBehaviors AS System.Array                    NO-UNDO.
	    DEFINE VARIABLE behavior        AS AxisLabelLayoutBehaviors        NO-UNDO.
	    DEFINE VARIABLE totalBehaviors  AS INTEGER                         NO-UNDO.
	    DEFINE VARIABLE currentBehavior AS INTEGER                         NO-UNDO.
        define variable customBehaviors as "AxisLabelLayoutBehavior[]":u   no-undo.
        
        ultraChart3:Data:DataSource = salesrepOrderDT.
        ultraChart3:Data:DataBind().
        ultraChart3:BackgroundImage = System.Drawing.Image:FromFile(SEARCH("WinChart/images/chart_gray_bg.jpg")).

        /*populate dropdownlists*/
        layoutBehaviors = System.Enum:GetValues(TypeHelper:GetType("Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors")) .
        totalBehaviors  = layoutBehaviors:LENGTH - 1.

        REPEAT currentBehavior = 0 TO totalBehaviors:
            behavior = CAST(layoutBehaviors:GetValue(currentBehavior),AxisLabelLayoutBehaviors ).
        	chart3_axisXLabelsLayoutBehavior:Items:Add(behavior).
        	chart3_axisXSeriesLabelsLayoutBehavior:Items:Add(behavior).
        	chart3_axisYLabelsLayoutBehavior:Items:Add(behavior).        	
        END.

        /*initialize dropdownlists*/
        chart3_axisXLabelsLayoutBehavior:SelectedIndex = chart3_axisXLabelsLayoutBehavior:FindString(STRING(ultraChart3:Axis:X:Labels:Layout:Behavior)).
        chart3_axisXSeriesLabelsLayoutBehavior:SelectedIndex = chart3_axisXSeriesLabelsLayoutBehavior:FindString(STRING(ultraChart3:Axis:X:Labels:SeriesLabels:Layout:Behavior)).
        chart3_axisYLabelsLayoutBehavior:SelectedIndex = chart3_axisYLabelsLayoutBehavior:FindString(STRING(ultraChart3:Axis:Y:Labels:Layout:Behavior)).
        
        /*initialize trackbars*/
        chart3_axisXExtent:Value = ultraChart3:Axis:X:Extent.
        chart3_axisYExtent:Value = ultraChart3:Axis:Y:Extent.

        customBehaviors = GetCustomLayoutBehaviors().
        ultraChart3:Axis:X:Labels:Layout:BehaviorCollection:AddRange(customBehaviors).
        customBehaviors = GetCustomLayoutBehaviors().
        ultraChart3:Axis:X:Labels:SeriesLabels:Layout:BehaviorCollection:AddRange(customBehaviors).
        customBehaviors = GetCustomLayoutBehaviors().
        ultraChart3:Axis:Y:Labels:Layout:BehaviorCollection:AddRange(customBehaviors).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC VOID InitalizeChart4():
	    DEFINE VARIABLE layoutBehaviors AS System.Array                    NO-UNDO.
	    DEFINE VARIABLE behavior        AS AxisLabelLayoutBehaviors        NO-UNDO.
	    DEFINE VARIABLE totalBehaviors  AS INTEGER                         NO-UNDO.
	    DEFINE VARIABLE currentBehavior AS INTEGER                         NO-UNDO.
	    define variable customBehaviors as "AxisLabelLayoutBehavior[]":u   no-undo.

        ultraChart4:Data:DataSource = salesrepOrderDT.
        ultraChart4:Data:DataBind().
        ultraChart4:BackgroundImage = System.Drawing.Image:FromFile(SEARCH("WinChart/images/chart_gray_bg.jpg")).

        /*populate dropdownlists*/
        layoutBehaviors = System.Enum:GetValues(TypeHelper:GetType("Infragistics.UltraChart.Shared.Styles.AxisLabelLayoutBehaviors")) .
        totalBehaviors  = layoutBehaviors:LENGTH - 1.

        REPEAT currentBehavior = 0 TO totalBehaviors:
            behavior = CAST(layoutBehaviors:GetValue(currentBehavior),AxisLabelLayoutBehaviors ).
        	chart4_axisXLabelsLayoutBehavior:Items:Add(behavior).
        	chart4_axisXSeriesLabelsLayoutBehavior:Items:Add(behavior).
        	chart4_axisYLabelsLayoutBehavior:Items:Add(behavior).        	
        END.

        /*initialize dropdownlists*/
        chart4_axisXLabelsLayoutBehavior:SelectedIndex = chart4_axisXLabelsLayoutBehavior:FindString(STRING(ultraChart4:Axis:X:Labels:Layout:Behavior)).
        chart4_axisXSeriesLabelsLayoutBehavior:SelectedIndex = chart4_axisXSeriesLabelsLayoutBehavior:FindString(STRING(ultraChart4:Axis:X:Labels:SeriesLabels:Layout:Behavior)).
        chart4_axisYLabelsLayoutBehavior:SelectedIndex = chart4_axisYLabelsLayoutBehavior:FindString(STRING(ultraChart4:Axis:Y:Labels:Layout:Behavior)).
        
        /*initialize trackbars*/
        chart4_axisXExtent:Value = ultraChart4:Axis:X:Extent.
        chart4_axisYExtent:Value = ultraChart4:Axis:Y:Extent.
        
        customBehaviors = GetCustomLayoutBehaviors().
        ultraChart4:Axis:X:Labels:Layout:BehaviorCollection:AddRange(customBehaviors).
        customBehaviors = GetCustomLayoutBehaviors().
        ultraChart4:Axis:X:Labels:SeriesLabels:Layout:BehaviorCollection:AddRange(customBehaviors).
        customBehaviors = GetCustomLayoutBehaviors().
        ultraChart4:Axis:Y:Labels:Layout:BehaviorCollection:AddRange(customBehaviors).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC AxisLabelLayoutBehavior extent GetCustomLayoutBehaviors():
		DEFINE VARIABLE returnValue  AS AxisLabelLayoutBehavior EXTENT 7   NO-UNDO. 		
		DEFINE VARIABLE fontScaling1 AS FontScalingAxisLabelLayoutBehavior NO-UNDO.
		DEFINE VARIABLE wrapText1    AS WrapTextAxisLabelLayoutBehavior    NO-UNDO.
        DEFINE VARIABLE rotation1    AS RotateAxisLabelLayoutBehavior      NO-UNDO.
        DEFINE VARIABLE rotation2    AS RotateAxisLabelLayoutBehavior      NO-UNDO.
        DEFINE VARIABLE stagger1     AS StaggerAxisLabelLayoutBehavior     NO-UNDO.
        DEFINE VARIABLE fontScaling2 AS FontScalingAxisLabelLayoutBehavior NO-UNDO.
        DEFINE VARIABLE clipText1    AS ClipTextAxisLabelLayoutBehavior    NO-UNDO.

        /*scale fonts down to 8pt if necessary.*/
        fontScaling1 = new FontScalingAxisLabelLayoutBehavior().
        fontScaling1:MaximumSize = -1.
        fontScaling1:MinimumSize = 8.
        fontScaling1:EnableRollback = FALSE.

        /*if collisions are detected, try wrapping the text.*/
        wrapText1 = new WrapTextAxisLabelLayoutBehavior().
        wrapText1:EnableRollback = TRUE.

        /*try rotating to 30 degrees*/
        rotation1 = new RotateAxisLabelLayoutBehavior().
        rotation1:RotationAngle = 30.
        rotation1:EnableRollback = TRUE.

        /*failing that, try rotating to 60 degrees*/
        rotation2 = new RotateAxisLabelLayoutBehavior().
        rotation2:RotationAngle = 60.
        rotation2:EnableRollback = TRUE.

        /*try staggering the labels*/
        stagger1 = new StaggerAxisLabelLayoutBehavior().
        stagger1:EnableRollback = TRUE.

        /*since none of the above worked, scale the fonts down to 6pt*/
        fontScaling2 = new FontScalingAxisLabelLayoutBehavior().
        fontScaling2:MaximumSize = -1.
        fontScaling2:MinimumSize = 6.
        fontScaling2:EnableRollback = FALSE.

        /*if collisions are still detected, just truncate the labels*/
        clipText1 = new ClipTextAxisLabelLayoutBehavior().
        clipText1:EnableRollback = FALSE.

        returnValue[1] = fontScaling1.
        returnValue[2] = wrapText1.
        returnValue[3] = rotation1.
        returnValue[4] = rotation2.
        returnValue[5] = stagger1.
        returnValue[6] = fontScaling2.
        returnValue[7] = clipText1.

        return returnValue.
	END METHOD.

END CLASS.