 
 /*------------------------------------------------------------------------
    File        : SetLegendLocation
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Wed Sep 10 16:54:03 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

USING Progress.Util.*.
USING Infragistics.UltraChart.Shared.Styles.*.

CLASS WinChart.Legends.SetLegendLocation INHERITS Form   : 

	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.

	DEFINE PRIVATE VARIABLE comboBox1 AS System.Windows.Forms.ComboBox NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraChart1 AS Infragistics.Win.UltraWinChart.UltraChart NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraGroupBox1 AS Infragistics.Win.Misc.UltraGroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE label1 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE checkBox1 AS System.Windows.Forms.CheckBox NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBox1 AS Infragistics.Win.Misc.UltraExpandableGroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBoxPanel1 AS Infragistics.Win.Misc.UltraExpandableGroupBoxPanel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel1 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.

    DEFINE PRIVATE VARIABLE fSalesrepService AS DataServices.IDataService NO-UNDO.
    DEFINE PRIVATE VARIABLE salesrepOrderDT  AS System.Data.DataTable     NO-UNDO.

	CONSTRUCTOR PUBLIC SetLegendLocation (  ):
		SUPER().
		InitializeComponent().
		InitializeDataSource().
	END CONSTRUCTOR.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID checkBox1_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        ultraChart1:Legend:Visible = checkBox1:Checked.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID comboBox1_SelectedIndexChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        ultraChart1:Legend:Location = CAST(comboBox1:SelectedItem,LegendLocation).
	END METHOD.

  	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC VOID InitializeDataSource(  ):
        fSalesrepService = NEW DataServices.SalesrepOrderService().                  
        fSalesrepService:fetchData().
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
		DEFINE VARIABLE resources AS System.Resources.ResXResourceSet NO-UNDO.
		resources = Progress.Util.ResourceHelper:Load("WinChart\Legends\SetLegendLocation.resx", PROPATH).
		THIS-OBJECT:comboBox1 = NEW System.Windows.Forms.ComboBox().
		THIS-OBJECT:ultraChart1 = NEW Infragistics.Win.UltraWinChart.UltraChart().
		THIS-OBJECT:ultraGroupBox1 = NEW Infragistics.Win.Misc.UltraGroupBox().
		THIS-OBJECT:label1 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:checkBox1 = NEW System.Windows.Forms.CheckBox().
		THIS-OBJECT:ultraExpandableGroupBox1 = NEW Infragistics.Win.Misc.UltraExpandableGroupBox().
		THIS-OBJECT:ultraExpandableGroupBoxPanel1 = NEW Infragistics.Win.Misc.UltraExpandableGroupBoxPanel().
		THIS-OBJECT:ultraLabel1 = NEW Infragistics.Win.Misc.UltraLabel().
		CAST(THIS-OBJECT:ultraChart1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraGroupBox1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraGroupBox1:SuspendLayout().
		CAST(THIS-OBJECT:ultraExpandableGroupBox1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraExpandableGroupBox1:SuspendLayout().
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:SuspendLayout().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* comboBox1 */
		/*  */
		THIS-OBJECT:comboBox1:DropDownStyle = System.Windows.Forms.ComboBoxStyle:DropDownList.
		THIS-OBJECT:comboBox1:Location = NEW System.Drawing.Point(62, 52).
		THIS-OBJECT:comboBox1:Name = "comboBox1".
		THIS-OBJECT:comboBox1:Size = NEW System.Drawing.Size(121, 21).
		THIS-OBJECT:comboBox1:TabIndex = 2.
		THIS-OBJECT:comboBox1:SelectedIndexChanged:SUBSCRIBE(THIS-OBJECT:comboBox1_SelectedIndexChanged).
		/*  */
		/* ultraChart1 */
		/*  */
		THIS-OBJECT:ultraChart1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraChart1:Axis:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(248)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(220))).
		paintElement1:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:None.
		paintElement1:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(248)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(220))).
		THIS-OBJECT:ultraChart1:Axis:PE = paintElement1.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:Font = NEW System.Drawing.Font("Verdana", 7).
		THIS-OBJECT:ultraChart1:Axis:X:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:ItemFormatString = "<ITEM_LABEL>".
		THIS-OBJECT:ultraChart1:Axis:X:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:SeriesLabels:Font = NEW System.Drawing.Font("Verdana", 7).
		THIS-OBJECT:ultraChart1:Axis:X:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:X:LineThickness = 1.
		THIS-OBJECT:ultraChart1:Axis:X:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:X:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart1:Axis:X:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:X:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart1:Axis:X:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:X:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart1:Axis:X:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:X:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart1:Axis:X:Visible = TRUE.
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:Font = NEW System.Drawing.Font("Verdana", 7).
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
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
		THIS-OBJECT:ultraChart1:Axis:Y:Extent = 30.
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:Font = NEW System.Drawing.Font("Verdana", 7).
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		THIS-OBJECT:ultraChart1:Axis:Y:LineThickness = 1.
		THIS-OBJECT:ultraChart1:Axis:Y:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:Y:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		THIS-OBJECT:ultraChart1:Axis:Y:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:Y:MajorGridLines:Visible = TRUE.
		THIS-OBJECT:ultraChart1:Axis:Y:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		THIS-OBJECT:ultraChart1:Axis:Y:MinorGridLines:Color = System.Drawing.Color:LightGray.
		THIS-OBJECT:ultraChart1:Axis:Y:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		THIS-OBJECT:ultraChart1:Axis:Y:MinorGridLines:Visible = FALSE.
		THIS-OBJECT:ultraChart1:Axis:Y:TickmarkInterval = 20.
		THIS-OBJECT:ultraChart1:Axis:Y:TickmarkStyle = Infragistics.UltraChart.Shared.Styles.AxisTickStyle:Smart.
		THIS-OBJECT:ultraChart1:Axis:Y:Visible = TRUE.
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:Font = NEW System.Drawing.Font("Verdana", 7).
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
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
		THIS-OBJECT:ultraChart1:Axis:Z:Labels:Font = NEW System.Drawing.Font("Verdana", 7).
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
		THIS-OBJECT:ultraChart1:Axis:Z2:Labels:Font = NEW System.Drawing.Font("Verdana", 7).
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
		THIS-OBJECT:ultraChart1:ColorModel:Skin:ApplyRowWise = FALSE.
		paintElement2:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement2:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(108)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(162)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(36))).
		paintElement2:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement2:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(148)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(244)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(17))).
		paintElement2:Stroke = System.Drawing.Color:Transparent.
		paintElement3:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement3:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(7)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(108)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(176))).
		paintElement3:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement3:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(53)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(200)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		paintElement3:Stroke = System.Drawing.Color:Transparent.
		paintElement4:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement4:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(215)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(0)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(5))).
		paintElement4:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement4:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(254)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(117)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(16))).
		paintElement4:Stroke = System.Drawing.Color:Transparent.
		paintElement5:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement5:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(230)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(190)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(2))).
		paintElement5:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement5:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(81))).
		paintElement5:Stroke = System.Drawing.Color:Transparent.
		paintElement6:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:Gradient.
		paintElement6:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(252)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(122)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(10))).
		paintElement6:FillGradientStyle = Infragistics.UltraChart.Shared.Styles.GradientStyle:Horizontal.
		paintElement6:FillStopColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(208)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(66))).
		paintElement6:Stroke = System.Drawing.Color:Transparent.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar0 AS Infragistics.UltraChart.Resources.Appearance.PaintElement EXTENT 5 NO-UNDO.
		arrayvar0[1] = paintElement2.
		arrayvar0[2] = paintElement3.
		arrayvar0[3] = paintElement4.
		arrayvar0[4] = paintElement5.
		arrayvar0[5] = paintElement6.
		THIS-OBJECT:ultraChart1:ColorModel:Skin:PEs:AddRange(arrayvar0).
		THIS-OBJECT:ultraChart1:Data:EmptyStyle:LineStyle:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dash.
		THIS-OBJECT:ultraChart1:ForeColor = System.Drawing.SystemColors:ControlText.
		THIS-OBJECT:ultraChart1:Legend:Font = NEW System.Drawing.Font("Verdana", 7).
		THIS-OBJECT:ultraChart1:Legend:Location = Infragistics.UltraChart.Shared.Styles.LegendLocation:Top.
		THIS-OBJECT:ultraChart1:Legend:Visible = TRUE.
		THIS-OBJECT:ultraChart1:Location = NEW System.Drawing.Point(15, 121).
		THIS-OBJECT:ultraChart1:Name = "ultraChart1".
		THIS-OBJECT:ultraChart1:Size = NEW System.Drawing.Size(416, 400).
		THIS-OBJECT:ultraChart1:TabIndex = 7.
		THIS-OBJECT:ultraChart1:Tooltips:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 7.8000002).
		THIS-OBJECT:ultraChart1:Tooltips:HighlightFillColor = System.Drawing.Color:DimGray.
		THIS-OBJECT:ultraChart1:Tooltips:HighlightOutlineColor = System.Drawing.Color:DarkGray.
		/*  */
		/* ultraGroupBox1 */
		/*  */
		THIS-OBJECT:ultraGroupBox1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:comboBox1).
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:label1).
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:checkBox1).
		THIS-OBJECT:ultraGroupBox1:Location = NEW System.Drawing.Point(439, 121).
		THIS-OBJECT:ultraGroupBox1:Name = "ultraGroupBox1".
		THIS-OBJECT:ultraGroupBox1:Size = NEW System.Drawing.Size(240, 400).
		THIS-OBJECT:ultraGroupBox1:TabIndex = 9.
		THIS-OBJECT:ultraGroupBox1:Text = "Change the Legend Location".
		/*  */
		/* label1 */
		/*  */
		THIS-OBJECT:label1:Location = NEW System.Drawing.Point(12, 56).
		THIS-OBJECT:label1:Name = "label1".
		THIS-OBJECT:label1:Size = NEW System.Drawing.Size(68, 14).
		THIS-OBJECT:label1:TabIndex = 1.
		THIS-OBJECT:label1:Text = "Position".
		THIS-OBJECT:label1:UseCompatibleTextRendering = TRUE.
		/*  */
		/* checkBox1 */
		/*  */
		THIS-OBJECT:checkBox1:Location = NEW System.Drawing.Point(12, 24).
		THIS-OBJECT:checkBox1:Name = "checkBox1".
		THIS-OBJECT:checkBox1:Size = NEW System.Drawing.Size(146, 24).
		THIS-OBJECT:checkBox1:TabIndex = 0.
		THIS-OBJECT:checkBox1:Text = "Show Chart Legend".
		THIS-OBJECT:checkBox1:UseCompatibleTextRendering = TRUE.
		THIS-OBJECT:checkBox1:CheckedChanged:SUBSCRIBE(THIS-OBJECT:checkBox1_CheckedChanged).
		/*  */
		/* ultraExpandableGroupBox1 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBox1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraExpandableGroupBox1:ContentPadding:Bottom = 5.
		THIS-OBJECT:ultraExpandableGroupBox1:ContentPadding:Left = 5.
		THIS-OBJECT:ultraExpandableGroupBox1:ContentPadding:Right = 5.
		THIS-OBJECT:ultraExpandableGroupBox1:ContentPadding:Top = 5.
		THIS-OBJECT:ultraExpandableGroupBox1:Controls:Add(THIS-OBJECT:ultraExpandableGroupBoxPanel1).
		THIS-OBJECT:ultraExpandableGroupBox1:ExpandedSize = NEW System.Drawing.Size(664, 96).
		THIS-OBJECT:ultraExpandableGroupBox1:HeaderClickAction = Infragistics.Win.Misc.GroupBoxHeaderClickAction:None.
		THIS-OBJECT:ultraExpandableGroupBox1:HeaderPosition = Infragistics.Win.Misc.GroupBoxHeaderPosition:TopOutsideBorder.
		THIS-OBJECT:ultraExpandableGroupBox1:Location = NEW System.Drawing.Point(15, 17).
		THIS-OBJECT:ultraExpandableGroupBox1:Name = "ultraExpandableGroupBox1".
		THIS-OBJECT:ultraExpandableGroupBox1:Size = NEW System.Drawing.Size(664, 96).
		THIS-OBJECT:ultraExpandableGroupBox1:TabIndex = 8.
		THIS-OBJECT:ultraExpandableGroupBox1:Text = "Legend Locations".
		THIS-OBJECT:ultraExpandableGroupBox1:ViewStyle = Infragistics.Win.Misc.GroupBoxViewStyle:Office2003.
		/*  */
		/* ultraExpandableGroupBoxPanel1 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Controls:Add(THIS-OBJECT:ultraLabel1).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Location = NEW System.Drawing.Point(7, 31).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Name = "ultraExpandableGroupBoxPanel1".
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Size = NEW System.Drawing.Size(650, 58).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:TabIndex = 0.
		/*  */
		/* ultraLabel1 */
		/*  */
		THIS-OBJECT:ultraLabel1:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:ultraLabel1:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:ultraLabel1:Name = "ultraLabel1".
		THIS-OBJECT:ultraLabel1:Size = NEW System.Drawing.Size(650, 58).
		THIS-OBJECT:ultraLabel1:TabIndex = 2.
		THIS-OBJECT:ultraLabel1:Text = resources:GetString("ultraLabel1.Text").
		/*  */
		/* SetLegendLocation */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(694, 538).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraChart1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraGroupBox1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraExpandableGroupBox1).
		THIS-OBJECT:Name = "SetLegendLocation".
		THIS-OBJECT:Text = "Legend Locations".
		THIS-OBJECT:Load:SUBSCRIBE(THIS-OBJECT:SetLegendLocation_Load).
		CAST(THIS-OBJECT:ultraChart1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraGroupBox1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraGroupBox1:ResumeLayout(FALSE).
		CAST(THIS-OBJECT:ultraExpandableGroupBox1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraExpandableGroupBox1:ResumeLayout(FALSE).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:ResumeLayout(FALSE).
		THIS-OBJECT:ResumeLayout(FALSE).
	END METHOD.

	DESTRUCTOR PUBLIC SetLegendLocation ( ):
		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.
	END DESTRUCTOR.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID SetLegendLocation_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE legendLocation  AS System.Array   NO-UNDO.
	    DEFINE VARIABLE currentLocation AS INTEGER           NO-UNDO.
	    DEFINE VARIABLE totalLocations  AS INTEGER           NO-UNDO.

	    /* retrieve the dataset table as a DataTable */
        salesrepOrderDT = fSalesrepService:DataTable('eSalesrep',"","").

        ultraChart1:Data:DataSource = salesrepOrderDT.
        ultraChart1:Data:DataBind().
        ultraChart1:BackgroundImage = System.Drawing.Image:FromFile(SEARCH("WinChart/images/chart_gray_bg.jpg")).

        ultraChart1:Tooltips:HighlightFillColor = System.Drawing.Color:DimGray.
        ultraChart1:Tooltips:HighlightOutlineColor = System.Drawing.Color:DarkGray.

        checkBox1:Checked = ultraChart1:Legend:Visible.

        legendLocation = System.Array:CreateInstance(TypeHelper:GetType("Infragistics.UltraChart.Shared.Styles.LegendLocation"), System.Enum:GetNames(TypeHelper:GetType("Infragistics.UltraChart.Shared.Styles.LegendLocation")):Length).
        legendLocation = System.Enum:GetValues(TypeHelper:GetType("Infragistics.UltraChart.Shared.Styles.LegendLocation")).
        totalLocations = legendLocation:LENGTH - 1.

        REPEAT currentLocation = 0 TO totalLocations:
        	comboBox1:Items:Add(legendLocation:GetValue(currentLocation)).
        END.

        comboBox1:SelectedItem = CAST(ultraChart1:Legend:Location,LegendLocation).
	END METHOD.
END CLASS.