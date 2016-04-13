 
 /*------------------------------------------------------------------------
    File        : DataBind
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Wed Aug 20 04:21:46 EDT 2008    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.
using System.Data.DataTable.
using System.Drawing.Rectangle. 
using Infragistics.UltraChart.Resources.Appearance.*.
USING Infragistics.UltraChart.Shared.Styles.*.
USING Infragistics.UltraChart.Core.Layers.SetLabelAxisType.
 
using DataServices.*.

CLASS WinChart.Composite.DataBind INHERITS Form   : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.

	define private variable splitter2 as System.Windows.Forms.Splitter no-undo.

	define private variable splitter1 as System.Windows.Forms.Splitter no-undo.
	define private variable axisBox as Infragistics.Win.Misc.UltraGroupBox no-undo.
	define private variable ultraGroupBox1 as Infragistics.Win.Misc.UltraGroupBox no-undo.
	define private variable ultraGrid2 as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable ultraGroupBox5 as Infragistics.Win.Misc.UltraGroupBox no-undo.
	define private variable ultraGrid1 as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
	define private variable ultraChart1 as Infragistics.Win.UltraWinChart.UltraChart no-undo.
	define private variable ultraExpandableGroupBox1 as Infragistics.Win.Misc.UltraExpandableGroupBox no-undo.
	define private variable ultraExpandableGroupBoxPanel1 as Infragistics.Win.Misc.UltraExpandableGroupBoxPanel no-undo.
	define private variable ultraLabel1 as Infragistics.Win.Misc.UltraLabel no-undo.

    define private variable fSalesrepService as DataServices.IDataService no-undo.
    define private variable fCustOrderService as DataServices.CustOrderService no-undo.
	
	CONSTRUCTOR PUBLIC DataBind (  ):
		
		SUPER().
		InitializeComponent ( ).
		InitDataSources().

	END CONSTRUCTOR.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID DataBind_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        define variable seriesOrders as NumericSeries no-undo.
        define variable seriesCountries as NumericSeries no-undo.
        define variable salesrepOrderDT as DataTable no-undo.
        define variable countryDT  as DataTable no-undo.
        define variable myChartArea  as ChartArea no-undo.
        define variable myChartArea2 as ChartArea no-undo.
        define variable chartLayer   as ChartLayerAppearance no-undo.
        define variable chartLayer2  as ChartLayerAppearance no-undo.
        define variable xAxis        as AxisItem no-undo.
        define variable yAxis        as AxisItem no-undo.

         
        /* retrieve the dataset table as a DataTable */
        salesrepOrderDT = fSalesrepService:DataTable('eSalesrep',"","").
        
        /* retrieve a DataTable from a dedicated report method */
        countryDT = fCustOrderService:CountryExportSales().
		/* Create 'Orders' series from data table */
        seriesOrders = new NumericSeries().
		seriesOrders:DataBind( salesrepOrderDT, "NumOrders", "Salesrep" ).

		/* Create 'Countries' series from data table */
        seriesCountries = new NumericSeries().            
 		seriesCountries:DataBind( countryDT, "Sales", "Country" ). 
 		                                                                   
		/* Set composite charts */
		this-object:ultraChart1:ChartType = ChartType:Composite.

		/* Create the first ChartArea */
		myChartArea = new ChartArea().

		/* Add the first Chart Area to the ChartAreas collection */
		this-object:ultraChart1:CompositeChart:ChartAreas:Add( myChartArea ).

		/* Set the chart area position */
		myChartArea:BoundsMeasureType = MeasureType:Percentage.
		myChartArea:Bounds =  new Rectangle( 0, 0, 100, 50 ).
		myChartArea:Border:Thickness = 0.
		
		/* Create the second ChartArea */
		myChartArea2 = new ChartArea().

		/* Set the chart area position */
		myChartArea2:BoundsMeasureType = MeasureType:Percentage.
		myChartArea2:Bounds =  new Rectangle( 0, 45, 100, 55 ).
		myChartArea2:Border:Thickness = 0.

		/* Add the second Chart Area to the ChartAreas collection */
		this-object:ultraChart1:CompositeChart:ChartAreas:Add( myChartArea2 ).

		/* Create an X axis */
		xAxis = new AxisItem().
		xAxis:axisNumber = AxisNumber:X_Axis.
		xAxis:Labels:Orientation = TextOrientation:VerticalLeftFacing.
		xAxis:DataType = AxisDataType:String.
		xAxis:SetLabelAxisType = SetLabelAxisType:GroupBySeries.
 		xAxis:Labels:ItemFormatString = "<ITEM_LABEL>". 
		xAxis:Extent = 90.
		/* Create an Y axis */
		yAxis = new AxisItem().
		yAxis:axisNumber = AxisNumber:Y_Axis.
		yAxis:DataType = AxisDataType:Numeric.
		yAxis:SetLabelAxisType = SetLabelAxisType:GroupBySeries.
		yAxis:Labels:ItemFormatString = "<DATA_VALUE:#.#>".
 		yAxis:TickmarkStyle = AxisTickStyle:Smart. 
		/* Add the axes to the first ChartArea */
		myChartArea:Axes:Add(xAxis).
		myChartArea:Axes:Add(yAxis).
 
		/* Add the axes to the second ChartArea */
		myChartArea2:Axes:Add(xAxis).
		myChartArea2:Axes:Add(yAxis).
		
		/* Create the first ChartLayer */
		chartLayer = new ChartLayerAppearance().

		/* Set the ChartType */
		chartLayer:ChartType = ChartType:ColumnChart.
		
    	/* Set the ChartArea */
		chartLayer:ChartArea = myChartArea.

		/* Set the axes */
		chartLayer:AxisX = xAxis.
		chartLayer:AxisY = yAxis.
		
		/* Add the first ChartLayer to the ChartLayers collection */
		this-object:ultraChart1:CompositeChart:ChartLayers:Add( chartLayer ).

		/* Add the first series to the chart's Series collection: */
		this-object:ultraChart1:Series:Add( seriesOrders ).
		seriesOrders:Label = "Orders".
 
		/* Add the first series to the ChartLayer's Series collection: */
		chartLayer:Series:Add( seriesOrders ).

		/* Create the second ChartLayer */
		chartLayer2 = new ChartLayerAppearance().
 

		/* Set the ChartType */
		chartLayer2:ChartType = ChartType:ColumnChart.
		
		/* Set the ChartArea */
		chartLayer2:ChartArea = myChartArea2.

		/* Set the axes */
		chartLayer2:AxisX = xAxis.
		chartLayer2:AxisY = yAxis.
 
		/* Add the second ChartLayer to the ChartLayers collection */
 		this-object:ultraChart1:CompositeChart:ChartLayers:Add( chartLayer2 ). 

		/* Add the second series to the chart's Series collection: */
 		this-object:ultraChart1:Series:Add( seriesCountries ). 
 		seriesCountries:Label = "Country". 

		/* Add the second series to the ChartLayer's Series collection: */
 		chartLayer2:Series:Add( seriesCountries ). 
 
        this-object:ultraGrid1:DataSource = salesrepOrderDT.
        this-object:ultraGrid1:DisplayLayout:Bands[0]:Columns["RepName"]:Hidden = true.
		this-object:ultraGrid1:DataBind().
 		this-object:ultraGrid2:DataSource = countryDT. 
 	    this-object:ultraGrid2:DataBind().           
		RETURN.

	END METHOD.
    
    method protected void InitDataSources():   
        fSalesrepService = new DataServices.SalesrepOrderService().                  
        fSalesrepService:fetchData().                                                 
        fCustOrderService = new DataServices.CustOrderService().                  
        fCustOrderService:fetchData().                                                 
    end method. 
    
 	METHOD PRIVATE VOID InitializeComponent(  ):
		
/*		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file.*/

		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable paintElement1 as Infragistics.UltraChart.Resources.Appearance.PaintElement no-undo.
		paintElement1 = new Infragistics.UltraChart.Resources.Appearance.PaintElement().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable gradientEffect1 as Infragistics.UltraChart.Resources.Appearance.GradientEffect no-undo.
		gradientEffect1 = new Infragistics.UltraChart.Resources.Appearance.GradientEffect().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		define variable resources as System.Resources.ResXResourceSet no-undo.
		resources = Progress.Util.ResourceHelper:Load("WinChart\Composite\DataBind.resx", PROPATH).
		this-object:splitter2 = new System.Windows.Forms.Splitter().
		this-object:splitter1 = new System.Windows.Forms.Splitter().
		this-object:axisBox = new Infragistics.Win.Misc.UltraGroupBox().
		this-object:ultraGroupBox1 = new Infragistics.Win.Misc.UltraGroupBox().
		this-object:ultraGrid2 = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:ultraGroupBox5 = new Infragistics.Win.Misc.UltraGroupBox().
		this-object:ultraGrid1 = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:ultraChart1 = new Infragistics.Win.UltraWinChart.UltraChart().
		this-object:ultraExpandableGroupBox1 = new Infragistics.Win.Misc.UltraExpandableGroupBox().
		this-object:ultraExpandableGroupBoxPanel1 = new Infragistics.Win.Misc.UltraExpandableGroupBoxPanel().
		this-object:ultraLabel1 = new Infragistics.Win.Misc.UltraLabel().
		cast(this-object:axisBox, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:axisBox:SuspendLayout().
		cast(this-object:ultraGroupBox1, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraGroupBox1:SuspendLayout().
		cast(this-object:ultraGrid2, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraGroupBox5, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraGroupBox5:SuspendLayout().
		cast(this-object:ultraGrid1, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraChart1, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraExpandableGroupBox1, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:ultraExpandableGroupBox1:SuspendLayout().
		this-object:ultraExpandableGroupBoxPanel1:SuspendLayout().
		this-object:SuspendLayout().
		/*  */
		/* splitter2 */
		/*  */
		this-object:splitter2:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:splitter2:Location = new System.Drawing.Point(0, 0).
		this-object:splitter2:Name = "splitter2".
		this-object:splitter2:Size = new System.Drawing.Size(756, 3).
		this-object:splitter2:TabIndex = 27.
		this-object:splitter2:TabStop = false.
		/*  */
		/* splitter1 */
		/*  */
		this-object:splitter1:Dock = System.Windows.Forms.DockStyle:Right.
		this-object:splitter1:Location = new System.Drawing.Point(753, 3).
		this-object:splitter1:Name = "splitter1".
		this-object:splitter1:Size = new System.Drawing.Size(3, 523).
		this-object:splitter1:TabIndex = 28.
		this-object:splitter1:TabStop = false.
		/*  */
		/* axisBox */
		/*  */
		this-object:axisBox:Anchor = cast(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		this-object:axisBox:Controls:Add(this-object:ultraGroupBox1).
		this-object:axisBox:Controls:Add(this-object:ultraGroupBox5).
		this-object:axisBox:Location = new System.Drawing.Point(513, 136).
		this-object:axisBox:Name = "axisBox".
		this-object:axisBox:Size = new System.Drawing.Size(235, 376).
		this-object:axisBox:TabIndex = 29.
		/*  */
		/* ultraGroupBox1 */
		/*  */
		this-object:ultraGroupBox1:Controls:Add(this-object:ultraGrid2).
		this-object:ultraGroupBox1:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:ultraGroupBox1:Location = new System.Drawing.Point(3, 166).
		this-object:ultraGroupBox1:Name = "ultraGroupBox1".
		this-object:ultraGroupBox1:Size = new System.Drawing.Size(229, 207).
		this-object:ultraGroupBox1:TabIndex = 22.
		this-object:ultraGroupBox1:Text = "Export Sales by Country".
		/*  */
		/* ultraGrid2 */
		/*  */
		this-object:ultraGrid2:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:ultraGrid2:Location = new System.Drawing.Point(3, 16).
		this-object:ultraGrid2:Name = "ultraGrid2".
		this-object:ultraGrid2:Size = new System.Drawing.Size(223, 188).
		this-object:ultraGrid2:TabIndex = 1.
		/*  */
		/* ultraGroupBox5 */
		/*  */
		this-object:ultraGroupBox5:Controls:Add(this-object:ultraGrid1).
		this-object:ultraGroupBox5:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:ultraGroupBox5:Location = new System.Drawing.Point(3, 0).
		this-object:ultraGroupBox5:Name = "ultraGroupBox5".
		this-object:ultraGroupBox5:Size = new System.Drawing.Size(229, 166).
		this-object:ultraGroupBox5:TabIndex = 21.
		this-object:ultraGroupBox5:Text = "Number of Orders per Sales Rep".
		/*  */
		/* ultraGrid1 */
		/*  */
		this-object:ultraGrid1:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:ultraGrid1:Location = new System.Drawing.Point(3, 16).
		this-object:ultraGrid1:Name = "ultraGrid1".
		this-object:ultraGrid1:Size = new System.Drawing.Size(223, 147).
		this-object:ultraGrid1:TabIndex = 0.
		/*  */
		/* ultraChart1 */
		/*  */
		this-object:ultraChart1:Anchor = cast(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		this-object:ultraChart1:Axis:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(248)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(220))).
		paintElement1:ElementType = Infragistics.UltraChart.Shared.Styles.PaintElementType:None.
		paintElement1:Fill = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(248)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(220))).
		this-object:ultraChart1:Axis:PE = paintElement1.
		this-object:ultraChart1:Axis:X:Labels:Font = new System.Drawing.Font("Verdana", 7).
		this-object:ultraChart1:Axis:X:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		this-object:ultraChart1:Axis:X:Labels:ItemFormatString = "<ITEM_LABEL>".
		this-object:ultraChart1:Axis:X:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		this-object:ultraChart1:Axis:X:Labels:SeriesLabels:FormatString = "".
		this-object:ultraChart1:Axis:X:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		this-object:ultraChart1:Axis:X:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		this-object:ultraChart1:Axis:X:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		this-object:ultraChart1:Axis:X:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		this-object:ultraChart1:Axis:X:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		this-object:ultraChart1:Axis:X:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		this-object:ultraChart1:Axis:X:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		this-object:ultraChart1:Axis:X:MajorGridLines:Visible = true.
		this-object:ultraChart1:Axis:X:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		this-object:ultraChart1:Axis:X:MinorGridLines:Color = System.Drawing.Color:LightGray.
		this-object:ultraChart1:Axis:X:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		this-object:ultraChart1:Axis:X:MinorGridLines:Visible = false.
		this-object:ultraChart1:Axis:X:Visible = true.
		this-object:ultraChart1:Axis:X2:Labels:Font = new System.Drawing.Font("Verdana", 7).
		this-object:ultraChart1:Axis:X2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		this-object:ultraChart1:Axis:X2:Labels:ItemFormatString = "<ITEM_LABEL>".
		this-object:ultraChart1:Axis:X2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		this-object:ultraChart1:Axis:X2:Labels:SeriesLabels:FormatString = "".
		this-object:ultraChart1:Axis:X2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		this-object:ultraChart1:Axis:X2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:VerticalLeftFacing.
		this-object:ultraChart1:Axis:X2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		this-object:ultraChart1:Axis:X2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		this-object:ultraChart1:Axis:X2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		this-object:ultraChart1:Axis:X2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		this-object:ultraChart1:Axis:X2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		this-object:ultraChart1:Axis:X2:MajorGridLines:Visible = true.
		this-object:ultraChart1:Axis:X2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		this-object:ultraChart1:Axis:X2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		this-object:ultraChart1:Axis:X2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		this-object:ultraChart1:Axis:X2:MinorGridLines:Visible = false.
		this-object:ultraChart1:Axis:X2:Visible = false.
		this-object:ultraChart1:Axis:Y:Labels:Font = new System.Drawing.Font("Verdana", 7).
		this-object:ultraChart1:Axis:Y:Labels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		this-object:ultraChart1:Axis:Y:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		this-object:ultraChart1:Axis:Y:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		this-object:ultraChart1:Axis:Y:Labels:SeriesLabels:FormatString = "".
		this-object:ultraChart1:Axis:Y:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Far.
		this-object:ultraChart1:Axis:Y:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		this-object:ultraChart1:Axis:Y:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		this-object:ultraChart1:Axis:Y:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		this-object:ultraChart1:Axis:Y:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		this-object:ultraChart1:Axis:Y:MajorGridLines:Color = System.Drawing.Color:Transparent.
		this-object:ultraChart1:Axis:Y:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		this-object:ultraChart1:Axis:Y:MajorGridLines:Visible = true.
		this-object:ultraChart1:Axis:Y:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		this-object:ultraChart1:Axis:Y:MinorGridLines:Color = System.Drawing.Color:Transparent.
		this-object:ultraChart1:Axis:Y:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		this-object:ultraChart1:Axis:Y:MinorGridLines:Visible = true.
		this-object:ultraChart1:Axis:Y:TickmarkInterval = 50.
		this-object:ultraChart1:Axis:Y:TickmarkStyle = Infragistics.UltraChart.Shared.Styles.AxisTickStyle:Smart.
		this-object:ultraChart1:Axis:Y:Visible = true.
		this-object:ultraChart1:Axis:Y2:Labels:Font = new System.Drawing.Font("Verdana", 7).
		this-object:ultraChart1:Axis:Y2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		this-object:ultraChart1:Axis:Y2:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		this-object:ultraChart1:Axis:Y2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		this-object:ultraChart1:Axis:Y2:Labels:SeriesLabels:FormatString = "".
		this-object:ultraChart1:Axis:Y2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		this-object:ultraChart1:Axis:Y2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		this-object:ultraChart1:Axis:Y2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		this-object:ultraChart1:Axis:Y2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		this-object:ultraChart1:Axis:Y2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		this-object:ultraChart1:Axis:Y2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		this-object:ultraChart1:Axis:Y2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		this-object:ultraChart1:Axis:Y2:MajorGridLines:Visible = true.
		this-object:ultraChart1:Axis:Y2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		this-object:ultraChart1:Axis:Y2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		this-object:ultraChart1:Axis:Y2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		this-object:ultraChart1:Axis:Y2:MinorGridLines:Visible = false.
		this-object:ultraChart1:Axis:Y2:Visible = false.
		this-object:ultraChart1:Axis:Z:Labels:Font = new System.Drawing.Font("Verdana", 7).
		this-object:ultraChart1:Axis:Z:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		this-object:ultraChart1:Axis:Z:Labels:ItemFormatString = "<DATA_VALUE:00.##>".
		this-object:ultraChart1:Axis:Z:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		this-object:ultraChart1:Axis:Z:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		this-object:ultraChart1:Axis:Z:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		this-object:ultraChart1:Axis:Z:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		this-object:ultraChart1:Axis:Z:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		this-object:ultraChart1:Axis:Z:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		this-object:ultraChart1:Axis:Z:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		this-object:ultraChart1:Axis:Z:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		this-object:ultraChart1:Axis:Z:MajorGridLines:Visible = true.
		this-object:ultraChart1:Axis:Z:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		this-object:ultraChart1:Axis:Z:MinorGridLines:Color = System.Drawing.Color:LightGray.
		this-object:ultraChart1:Axis:Z:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		this-object:ultraChart1:Axis:Z:MinorGridLines:Visible = false.
		this-object:ultraChart1:Axis:Z:Visible = false.
		this-object:ultraChart1:Axis:Z2:Labels:Font = new System.Drawing.Font("Verdana", 7).
		this-object:ultraChart1:Axis:Z2:Labels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		this-object:ultraChart1:Axis:Z2:Labels:ItemFormatString = "".
		this-object:ultraChart1:Axis:Z2:Labels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		this-object:ultraChart1:Axis:Z2:Labels:SeriesLabels:HorizontalAlign = System.Drawing.StringAlignment:Near.
		this-object:ultraChart1:Axis:Z2:Labels:SeriesLabels:Orientation = Infragistics.UltraChart.Shared.Styles.TextOrientation:Horizontal.
		this-object:ultraChart1:Axis:Z2:Labels:SeriesLabels:VerticalAlign = System.Drawing.StringAlignment:Center.
		this-object:ultraChart1:Axis:Z2:Labels:VerticalAlign = System.Drawing.StringAlignment:Center.
		this-object:ultraChart1:Axis:Z2:MajorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		this-object:ultraChart1:Axis:Z2:MajorGridLines:Color = System.Drawing.Color:Gainsboro.
		this-object:ultraChart1:Axis:Z2:MajorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		this-object:ultraChart1:Axis:Z2:MajorGridLines:Visible = true.
		this-object:ultraChart1:Axis:Z2:MinorGridLines:AlphaLevel = Progress.Util.CastUtil:ToByte(255).
		this-object:ultraChart1:Axis:Z2:MinorGridLines:Color = System.Drawing.Color:LightGray.
		this-object:ultraChart1:Axis:Z2:MinorGridLines:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dot.
		this-object:ultraChart1:Axis:Z2:MinorGridLines:Visible = false.
		this-object:ultraChart1:Axis:Z2:Visible = false.
		this-object:ultraChart1:BackgroundImageLayout = System.Windows.Forms.ImageLayout:Center.
		this-object:ultraChart1:Border:CornerRadius = 5.
		this-object:ultraChart1:ChartType = Infragistics.UltraChart.Shared.Styles.ChartType:Composite.
		this-object:ultraChart1:ColorModel:AlphaLevel = Progress.Util.CastUtil:ToByte(150).
		this-object:ultraChart1:Data:EmptyStyle:LineStyle:DrawStyle = Infragistics.UltraChart.Shared.Styles.LineDrawStyle:Dash.
		this-object:ultraChart1:Effects:Effects:Add(gradientEffect1).
		this-object:ultraChart1:ForeColor = System.Drawing.SystemColors:ControlText.
		this-object:ultraChart1:Location = new System.Drawing.Point(8, 136).
		this-object:ultraChart1:Name = "ultraChart1".
		this-object:ultraChart1:Size = new System.Drawing.Size(499, 376).
		this-object:ultraChart1:TabIndex = 31.
		this-object:ultraChart1:Tooltips:Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8000002).
		this-object:ultraChart1:Tooltips:HighlightDataPoint = false.
		/*  */
		/* ultraExpandableGroupBox1 */
		/*  */
		this-object:ultraExpandableGroupBox1:Anchor = cast(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		this-object:ultraExpandableGroupBox1:ContentPadding:Bottom = 5.
		this-object:ultraExpandableGroupBox1:ContentPadding:Left = 5.
		this-object:ultraExpandableGroupBox1:ContentPadding:Right = 5.
		this-object:ultraExpandableGroupBox1:ContentPadding:Top = 5.
		this-object:ultraExpandableGroupBox1:Controls:Add(this-object:ultraExpandableGroupBoxPanel1).
		this-object:ultraExpandableGroupBox1:ExpandedSize = new System.Drawing.Size(740, 120).
		this-object:ultraExpandableGroupBox1:HeaderClickAction = Infragistics.Win.Misc.GroupBoxHeaderClickAction:None.
		this-object:ultraExpandableGroupBox1:HeaderPosition = Infragistics.Win.Misc.GroupBoxHeaderPosition:TopOutsideBorder.
		this-object:ultraExpandableGroupBox1:Location = new System.Drawing.Point(8, 9).
		this-object:ultraExpandableGroupBox1:Name = "ultraExpandableGroupBox1".
		this-object:ultraExpandableGroupBox1:Size = new System.Drawing.Size(740, 120).
		this-object:ultraExpandableGroupBox1:TabIndex = 32.
		this-object:ultraExpandableGroupBox1:Text = "Multi-Source Data Binding".
		this-object:ultraExpandableGroupBox1:ViewStyle = Infragistics.Win.Misc.GroupBoxViewStyle:Office2003.
		/*  */
		/* ultraExpandableGroupBoxPanel1 */
		/*  */
		this-object:ultraExpandableGroupBoxPanel1:Controls:Add(this-object:ultraLabel1).
		this-object:ultraExpandableGroupBoxPanel1:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:ultraExpandableGroupBoxPanel1:Location = new System.Drawing.Point(7, 31).
		this-object:ultraExpandableGroupBoxPanel1:Name = "ultraExpandableGroupBoxPanel1".
		this-object:ultraExpandableGroupBoxPanel1:Size = new System.Drawing.Size(726, 82).
		this-object:ultraExpandableGroupBoxPanel1:TabIndex = 0.
		/*  */
		/* ultraLabel1 */
		/*  */
		this-object:ultraLabel1:Dock = System.Windows.Forms.DockStyle:Fill.
		this-object:ultraLabel1:Location = new System.Drawing.Point(0, 0).
		this-object:ultraLabel1:Name = "ultraLabel1".
		this-object:ultraLabel1:Size = new System.Drawing.Size(726, 82).
		this-object:ultraLabel1:TabIndex = 1.
		this-object:ultraLabel1:Text = resources:GetString("ultraLabel1.Text").
		/*  */
		/* DataBind */
		/*  */
		this-object:BackColor = System.Drawing.Color:White.
		this-object:ClientSize = new System.Drawing.Size(756, 526).
		this-object:Controls:Add(this-object:ultraExpandableGroupBox1).
		this-object:Controls:Add(this-object:axisBox).
		this-object:Controls:Add(this-object:ultraChart1).
		this-object:Controls:Add(this-object:splitter1).
		this-object:Controls:Add(this-object:splitter2).
		this-object:Name = "DataBind".
		this-object:Text = "DataBind".
		this-object:Load:subscribe(this-object:DataBind_Load).
		cast(this-object:axisBox, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:axisBox:ResumeLayout(false).
		cast(this-object:ultraGroupBox1, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraGroupBox1:ResumeLayout(false).
		cast(this-object:ultraGrid2, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraGroupBox5, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraGroupBox5:ResumeLayout(false).
		cast(this-object:ultraGrid1, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraChart1, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraExpandableGroupBox1, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ultraExpandableGroupBox1:ResumeLayout(false).
		this-object:ultraExpandableGroupBoxPanel1:ResumeLayout(false).
		this-object:ResumeLayout(false).
	END METHOD.

	DESTRUCTOR PUBLIC DataBind ( ):
		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.
	END DESTRUCTOR.

END CLASS.