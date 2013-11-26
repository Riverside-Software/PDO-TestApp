 
 /*------------------------------------------------------------------------
    File        : CustomChartIcons
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Tue Sep 09 10:46:30 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

USING Progress.Util.*.

USING Infragistics.UltraChart.Shared.Styles.*.

CLASS WinChart.Legends.CustomChartIcons INHERITS Form   : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.

	DEFINE PRIVATE VARIABLE cmbChartType AS System.Windows.Forms.ComboBox NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraChart1 AS Infragistics.Win.UltraWinChart.UltraChart NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraGroupBox1 AS Infragistics.Win.Misc.UltraGroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE label1 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE chkbxToggleLayer AS System.Windows.Forms.CheckBox NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBox1 AS Infragistics.Win.Misc.UltraExpandableGroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBoxPanel1 AS Infragistics.Win.Misc.UltraExpandableGroupBoxPanel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel1 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.

    DEFINE PRIVATE VARIABLE fMaxMinData AS DataServices.IDataService NO-UNDO.
    DEFINE PRIVATE VARIABLE MaxMinDT    AS System.Data.DataTable     NO-UNDO.
    DEFINE PRIVATE VARIABLE myLayer     AS WinChart.Legends.MyLayer  NO-UNDO.
		
	CONSTRUCTOR PUBLIC CustomChartIcons():
		SUPER().
		InitializeComponent().
		InitializeDataSource().
	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC CustomChartIcons ( ):
		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.
	END DESTRUCTOR.

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID chkbxToggleLayer_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE layers AS CHARACTER EXTENT 2 NO-UNDO INITIAL ["Default","My Layer"].
	    DEFINE VARIABLE dlayer AS CHARACTER EXTENT 1 NO-UNDO INITIAL ["Default"].
	    IF chkbxToggleLayer:CHECKED THEN
        DO:
			/*UltraChart.Layer is a Hashtable, and you add key and value pairs to
			  it when you add layers.  The value part of this is an actual instance of a layer.*/
			ultraChart1:Layer:Add("My Layer", myLayer).
			/*Set up the UserLayerIndex correctly so that Chart knows to render your layer and when.*/
			ultraChart1:UserLayerIndex = layers.
		END.
		ELSE DO:
			ultraChart1:Layer:Remove("My Layer").
			ultraChart1:UserLayerIndex = dlayer.
		END.
		/*Calling InvalidateLayers() is a good idea if you want your layer(s)(or the Chart's own layers) to refresh.*/
		ultraChart1:InvalidateLayers().
	END METHOD.


 	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cmbChartType_SelectedIndexChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        DEFINE VARIABLE dt AS System.Data.DataTable NO-UNDO.

        dt = NEW System.Data.DataTable().
        /*SelectedItem in this ComboBox can be cast directly to a ChartType.*/
        ultraChart1:ChartType = CAST(cmbChartType:SelectedItem,ChartType).
        IF EnumHelper:AreEqual(ultraChart1:ChartType,ChartType:ScatterChart) THEN
        DO:
        	ultraChart1:Data:SwapRowsAndColumns = FALSE.
        	
            /* retrieve the dataset table as a DataTable */
            dt = fMaxMinData:DataTable('eScatterData',"","").
            /*set initial DataSource for scatter data:*/
            ultraChart1:Data:DataSource = dt.
            ultraChart1:DataBind().
        END.
        ELSE DO:
            ultraChart1:Data:SwapRowsAndColumns = TRUE.
            dt = fMaxMinData:DataTable('eLineData',"","").
            /*set initial DataSource for scatter data:*/
            ultraChart1:Data:DataSource = dt.
            ultraChart1:DataBind().
        END.
        
        /*Reconfigure the Axis properties (changing ChartType will 
          change some of these properties back to their default values)*/     
        SetupAxisProperties().
 
        /*Calli ng InvalidateLayers() is a good idea if you want your layer(s) (or the Chart's own layers) to refresh.*/
        ultraChart1:InvalidateLayers().
 
	END METHOD.


 	/*------------------------------------------------------------------------------
        Purpose:
        Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC VOID InitializeDataSource():
        fMaxMinData = NEW DataServices.LinesData().                  
        fMaxMinData:fetchData().
	END METHOD.

	/*------------------------------------------------------------------------------
        Purpose:                                          		  
        Notes:                                          		  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID CustomChartIcons_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        ultraChart1:BackgroundImage = System.Drawing.Image:FromFile(SEARCH("WinChart/images/chart_gray_bg.jpg")).

		/*populate ComboBox for chart type selection*/
		cmbChartType:Items:Add(ChartType:LineChart).
		cmbChartType:SelectedIndex = cmbChartType:Items:Add(ChartType:ScatterChart).

		/*initialize chart*/
		InitializeChartProperties().
		SetupAxisProperties().

		/*instantiate myLayer*/
		myLayer = NEW WinChart.Legends.MyLayer().

		/*checkBox1 will default to checked, since by default the layer is visible.*/
		chkbxToggleLayer:Checked = TRUE.
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
		DEFINE VARIABLE resources AS System.Resources.ResXResourceSet NO-UNDO.
		resources = Progress.Util.ResourceHelper:Load("WinChart\Legends\CustomChartIcons.resx", PROPATH).
		THIS-OBJECT:cmbChartType = NEW System.Windows.Forms.ComboBox().
		THIS-OBJECT:ultraChart1 = NEW Infragistics.Win.UltraWinChart.UltraChart().
		THIS-OBJECT:ultraGroupBox1 = NEW Infragistics.Win.Misc.UltraGroupBox().
		THIS-OBJECT:label1 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:chkbxToggleLayer = NEW System.Windows.Forms.CheckBox().
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
		/* cmbChartType */
		/*  */
		THIS-OBJECT:cmbChartType:DropDownStyle = System.Windows.Forms.ComboBoxStyle:DropDownList.
		THIS-OBJECT:cmbChartType:Location = NEW System.Drawing.Point(32, 80).
		THIS-OBJECT:cmbChartType:Name = "cmbChartType".
		THIS-OBJECT:cmbChartType:Size = NEW System.Drawing.Size(121, 21).
		THIS-OBJECT:cmbChartType:TabIndex = 2.
		THIS-OBJECT:cmbChartType:SelectedIndexChanged:SUBSCRIBE(THIS-OBJECT:cmbChartType_SelectedIndexChanged).
		/* 
			'UltraChart' properties's serialization: Since 'ChartType' changes the way axes look,
			'ChartType' must be persisted ahead of any Axes change made in design time.
		 */
		THIS-OBJECT:ultraChart1:ChartType = Infragistics.UltraChart.Shared.Styles.ChartType:ScatterChart.
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
		THIS-OBJECT:ultraChart1:Axis:X:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		THIS-OBJECT:ultraChart1:Axis:X:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:SeriesLabels:Font = NEW System.Drawing.Font("Verdana", 7).
		THIS-OBJECT:ultraChart1:Axis:X:Labels:SeriesLabels:FormatString = "".
		THIS-OBJECT:ultraChart1:Axis:X:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart1:Axis:X:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
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
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:SeriesLabels:FormatString = "".
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		THIS-OBJECT:ultraChart1:Axis:X2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
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
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:SeriesLabels:FormatString = "".
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		THIS-OBJECT:ultraChart1:Axis:Y:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
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
		THIS-OBJECT:ultraChart1:Axis:Y:TickmarkInterval = 40.
		THIS-OBJECT:ultraChart1:Axis:Y:TickmarkStyle = Infragistics.UltraChart.Shared.Styles.AxisTickStyle:Smart.
		THIS-OBJECT:ultraChart1:Axis:Y:Visible = TRUE.
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:Font = NEW System.Drawing.Font("Verdana", 7).
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:SeriesLabels:FormatString = "".
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		THIS-OBJECT:ultraChart1:Axis:Y2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
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
		THIS-OBJECT:ultraChart1:Data:EmptyStyle:LineStyle:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dash.
		THIS-OBJECT:ultraChart1:ForeColor = System.Drawing.SystemColors:ControlText.
		THIS-OBJECT:ultraChart1:Legend:Font = NEW System.Drawing.Font("Verdana", 7).
		THIS-OBJECT:ultraChart1:Legend:Location = Infragistics.UltraChart.Shared.Styles.LegendLocation:Top.
		THIS-OBJECT:ultraChart1:Location = NEW System.Drawing.Point(2, 117).
		THIS-OBJECT:ultraChart1:Name = "ultraChart1".
		THIS-OBJECT:ultraChart1:Size = NEW System.Drawing.Size(712, 349).
		THIS-OBJECT:ultraChart1:TabIndex = 7.
		THIS-OBJECT:ultraChart1:Tooltips:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 7.8000002).
		THIS-OBJECT:ultraChart1:Tooltips:HighlightFillColor = System.Drawing.Color:DimGray.
		THIS-OBJECT:ultraChart1:Tooltips:HighlightOutlineColor = System.Drawing.Color:DarkGray.
		/*  */
		/* ultraGroupBox1 */
		/*  */
		THIS-OBJECT:ultraGroupBox1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:cmbChartType).
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:label1).
		THIS-OBJECT:ultraGroupBox1:Controls:Add(THIS-OBJECT:chkbxToggleLayer).
		THIS-OBJECT:ultraGroupBox1:Location = NEW System.Drawing.Point(722, 117).
		THIS-OBJECT:ultraGroupBox1:Name = "ultraGroupBox1".
		THIS-OBJECT:ultraGroupBox1:Size = NEW System.Drawing.Size(240, 349).
		THIS-OBJECT:ultraGroupBox1:TabIndex = 9.
		THIS-OBJECT:ultraGroupBox1:Text = "Change the ChartType or Turn Off Layers".
		/*  */
		/* label1 */
		/*  */
		THIS-OBJECT:label1:Location = NEW System.Drawing.Point(12, 56).
		THIS-OBJECT:label1:Name = "label1".
		THIS-OBJECT:label1:Size = NEW System.Drawing.Size(68, 14).
		THIS-OBJECT:label1:TabIndex = 1.
		THIS-OBJECT:label1:Text = "ChartType".
		THIS-OBJECT:label1:UseCompatibleTextRendering = TRUE.
		/*  */
		/* chkbxToggleLayer */
		/*  */
		THIS-OBJECT:chkbxToggleLayer:Location = NEW System.Drawing.Point(12, 24).
		THIS-OBJECT:chkbxToggleLayer:Name = "chkbxToggleLayer".
		THIS-OBJECT:chkbxToggleLayer:Size = NEW System.Drawing.Size(146, 24).
		THIS-OBJECT:chkbxToggleLayer:TabIndex = 0.
		THIS-OBJECT:chkbxToggleLayer:Text = "Toggle Layer".
		THIS-OBJECT:chkbxToggleLayer:UseCompatibleTextRendering = TRUE.
		THIS-OBJECT:chkbxToggleLayer:CheckedChanged:SUBSCRIBE(THIS-OBJECT:chkbxToggleLayer_CheckedChanged).
		/*  */
		/* ultraExpandableGroupBox1 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBox1:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraExpandableGroupBox1:ContentPadding:Bottom = 5.
		THIS-OBJECT:ultraExpandableGroupBox1:ContentPadding:Left = 5.
		THIS-OBJECT:ultraExpandableGroupBox1:ContentPadding:Right = 5.
		THIS-OBJECT:ultraExpandableGroupBox1:ContentPadding:Top = 5.
		THIS-OBJECT:ultraExpandableGroupBox1:Controls:Add(THIS-OBJECT:ultraExpandableGroupBoxPanel1).
		THIS-OBJECT:ultraExpandableGroupBox1:ExpandedSize = NEW System.Drawing.Size(960, 96).
		THIS-OBJECT:ultraExpandableGroupBox1:HeaderClickAction = Infragistics.Win.Misc.GroupBoxHeaderClickAction:None.
		THIS-OBJECT:ultraExpandableGroupBox1:HeaderPosition = Infragistics.Win.Misc.GroupBoxHeaderPosition:TopOutsideBorder.
		THIS-OBJECT:ultraExpandableGroupBox1:Location = NEW System.Drawing.Point(2, 13).
		THIS-OBJECT:ultraExpandableGroupBox1:Name = "ultraExpandableGroupBox1".
		THIS-OBJECT:ultraExpandableGroupBox1:Size = NEW System.Drawing.Size(960, 96).
		THIS-OBJECT:ultraExpandableGroupBox1:TabIndex = 8.
		THIS-OBJECT:ultraExpandableGroupBox1:Text = "Custom Chart Icons".
		THIS-OBJECT:ultraExpandableGroupBox1:ViewStyle = Infragistics.Win.Misc.GroupBoxViewStyle:Office2003.
		/*  */
		/* ultraExpandableGroupBoxPanel1 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Controls:Add(THIS-OBJECT:ultraLabel1).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Location = NEW System.Drawing.Point(7, 31).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Name = "ultraExpandableGroupBoxPanel1".
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Size = NEW System.Drawing.Size(946, 58).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:TabIndex = 0.
		/*  */
		/* ultraLabel1 */
		/*  */
		THIS-OBJECT:ultraLabel1:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:ultraLabel1:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:ultraLabel1:Name = "ultraLabel1".
		THIS-OBJECT:ultraLabel1:Size = NEW System.Drawing.Size(946, 58).
		THIS-OBJECT:ultraLabel1:TabIndex = 2.
		THIS-OBJECT:ultraLabel1:Text = resources:GetString("ultraLabel1.Text").
		/*  */
		/* CustomChartIcons */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(965, 479).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraChart1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraGroupBox1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraExpandableGroupBox1).
		THIS-OBJECT:Name = "CustomChartIcons".
		THIS-OBJECT:Text = "Custom Chart Icons".
		THIS-OBJECT:Load:SUBSCRIBE(THIS-OBJECT:CustomChartIcons_Load).
		CAST(THIS-OBJECT:ultraChart1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraGroupBox1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraGroupBox1:ResumeLayout(FALSE).
		CAST(THIS-OBJECT:ultraExpandableGroupBox1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraExpandableGroupBox1:ResumeLayout(FALSE).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:ResumeLayout(FALSE).
		THIS-OBJECT:ResumeLayout(FALSE).
	END METHOD.

	/*------------------------------------------------------------------------------
        Purpose:
        Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC VOID InitializeChartProperties(  ):
        ultraChart1:ChartType = ChartType:ScatterChart.

        /*ScatterChart-specific properties*/
        ultraChart1:ScatterChart:ColumnX = 0.
        ultraChart1:ScatterChart:ColumnY = 1.
        /*GroupByColumn is used to set up different groups of ScatterPoints*/
        ultraChart1:ScatterChart:GroupByColumn = 2.
        ultraChart1:ScatterChart:UseGroupByColumn = TRUE.
        /*ConnectWithLines makes this ScatterChart very much like a LineChart:
          The fundamental difference is that in ScatterChart, the X axis is a numeric
          range, whereas in LineChart, the X axis is a set of labels:*/
        ultraChart1:ScatterChart:ConnectWithLines = TRUE.

	    /* retrieve the dataset table as a DataTable */
        MaxMinDT = fMaxMinData:DataTable('eScatterData',"","").
        /*set initial DataSource for scatter data:*/
        ultraChart1:Data:DataSource = MaxMinDT.
        ultraChart1:DataBind().

        /*remove TitleTop from this chart*/
        ultraChart1:TitleTop:Visible = FALSE.

        /*set up a nice-looking TitleBottom*/
        ultraChart1:TitleBottom:Margins:Top = 0.
        ultraChart1:TitleBottom:Margins:Bottom = 0.
        ultraChart1:TitleBottom:Extent = 40.
        ultraChart1:TitleBottom:Font = NEW System.Drawing.Font("Courier New", 24).
        ultraChart1:TitleBottom:FontColor = System.Drawing.Color:DarkKhaki.
        ultraChart1:TitleBottom:Visible = TRUE.
	END METHOD.

	/*------------------------------------------------------------------------------
        Purpose:
        Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC VOID SetupAxisProperties(  ):
        /*values on the X axis are not very important in this demo, so there's no need for gridlines on the X axis:*/
        ultraChart1:Axis:X:MajorGridLines:Visible = FALSE.
        /*Y and Y2 axis will have different ranges, and will be distinguished from each other by line color and style:*/
        ultraChart1:Axis:Y:Visible = TRUE.
        ultraChart1:Axis:Y:LineDrawStyle = LineDrawStyle:Solid.
        ultraChart1:Axis:Y:LineColor = System.Drawing.Color:Blue.
        ultraChart1:Axis:Y:Labels:FontColor = System.Drawing.Color:Blue.
        ultraChart1:Axis:Y:RangeType = AxisRangeType:Custom.

        ultraChart1:Axis:Y:RangeMin = -1.
  
        ultraChart1:Axis:Y:RangeMax = 1.
        ultraChart1:Axis:Y2:Visible = TRUE.
        ultraChart1:Axis:Y2:LineDrawStyle = LineDrawStyle:DashDotDot.
        ultraChart1:Axis:Y2:LineColor = System.Drawing.Color:Red.
        ultraChart1:Axis:Y2:Labels:FontColor = System.Drawing.Color:Red.
        ultraChart1:Axis:Y2:RangeType = AxisRangeType:Custom.
        ultraChart1:Axis:Y2:RangeMin = -2.
        ultraChart1:Axis:Y2:RangeMax = 2.
        /*make space for the custom drawn legend included in MyLayer.*/
        ultraChart1:Axis:Y2:Extent = 200.
	END METHOD.
END CLASS.