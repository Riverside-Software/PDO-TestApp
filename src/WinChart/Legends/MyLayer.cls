 
 /*------------------------------------------------------------------------
    File        : MyLayer
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Tue Sep 09 11:04:18 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Infragistics.UltraChart.Core.Layers.ILayer.

USING Progress.Util.*.

USING System.Collections.*.
USING System.ComponentModel.*.
USING System.Drawing.*.
USING System.Drawing.Design.*.

USING Infragistics.UltraChart.Core.ColorModel.*.
USING Infragistics.UltraChart.Core.*.
USING Infragistics.UltraChart.Core.Layers.*.
USING Infragistics.UltraChart.Core.Primitives.*.
USING Infragistics.UltraChart.Data.*.
USING Infragistics.UltraChart.Resources.*.
USING Infragistics.UltraChart.Resources.Editor.*.
USING Infragistics.UltraChart.Shared.Styles.*.
USING Infragistics.UltraChart.Resources.Appearance.*.

CLASS WinChart.Legends.MyLayer INHERITS System.Object IMPLEMENTS ILayer  : 
	DEFINE PROTECTED VARIABLE fOuterBounds AS System.Drawing.Rectangle NO-UNDO.
	DEFINE PROTECTED VARIABLE fInnerBounds AS System.Drawing.Rectangle NO-UNDO.

	DEFINE PUBLIC PROPERTY LayerID AS CHARACTER  
	GET.
	SET.
 	
	DEFINE PUBLIC PROPERTY Visible AS LOGICAL  
	GET.
	SET.
 	
	DEFINE PUBLIC PROPERTY ChartCore AS Infragistics.UltraChart.Core.ChartCore 
	GET.
	SET.
 	
	DEFINE PUBLIC PROPERTY Grid AS System.Collections.Hashtable 
	GET.
	SET.
 	
	DEFINE PUBLIC PROPERTY ChartColorModel AS Infragistics.UltraChart.Core.ColorModel.IColorModel 
	GET.
	SET.
 	
	DEFINE PUBLIC PROPERTY ChartData AS Infragistics.UltraChart.Data.IChartData 
	GET.
	SET.
 	
	DEFINE PUBLIC PROPERTY OuterBound AS System.Drawing.Rectangle 
	GET:
	    RETURN fOuterBounds.
	END GET.
	SET (INPUT newValue AS System.Drawing.Rectangle):
	    fOuterBounds = newValue.
	    fInnerBounds = NEW System.Drawing.Rectangle(fOuterBounds:X, fOuterBounds:Y, fOuterBounds:Width, fOuterBounds:Height).
    END SET.
	
	DEFINE PUBLIC PROPERTY ChartComponent AS Infragistics.UltraChart.Resources.IChartComponent 
	GET.
	SET.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
		
	CONSTRUCTOR PUBLIC MyLayer (  ):
		SUPER ().
		fOuterBounds = NEW System.Drawing.Rectangle(0,0,0,0).
	    fInnerBounds = NEW System.Drawing.Rectangle(0,0,0,0).
	END CONSTRUCTOR.

	METHOD PUBLIC System.Drawing.Rectangle GetInnerBounds():
	    RETURN fInnerBounds.
	END METHOD.

	METHOD PUBLIC VOID FillSceneGraph( INPUT scene AS Infragistics.UltraChart.Core.SceneGraph ):
		/*Two different implementations of FillSceneGraph exist in this class, one
		  for ScatterCharts and one for LineCharts.  Depending on the current ChartType,
		  only one of these two will be called.*/
		IF EnumHelper:AreEqual(ChartComponent:ChartType,ChartType:ScatterChart) THEN
            FillSceneGraphScatter(scene).
		ELSE FillSceneGraphLine(scene).

		/*Now draw a custom-made legend to the scene 
		 using the FillSceneGraphLegend method of this layer.*/
		FillSceneGraphLegend(scene).
	END METHOD.

	METHOD PUBLIC CHARACTER GetDataInvalidMessage(  ):
		RETURN "My Layer".
	END METHOD.
	
	METHOD PUBLIC VOID FillSceneGraphLegend(INPUT scene AS SceneGraph):
	    DEFINE VARIABLE legendLeft         AS INTEGER                                                 NO-UNDO.
	    DEFINE VARIABLE legendWidth        AS INTEGER                                                 NO-UNDO.
	    DEFINE VARIABLE legendTop          AS INTEGER                                                 NO-UNDO.
	    DEFINE VARIABLE legendHeight       AS INTEGER                                                 NO-UNDO.
	    DEFINE VARIABLE legendBounds       AS System.Drawing.Rectangle                                NO-UNDO.
	    DEFINE VARIABLE gc                 AS Infragistics.UltraChart.Core.Primitives.GraphicsContext NO-UNDO.
	    DEFINE VARIABLE legendBox          AS Infragistics.UltraChart.Core.Primitives.Box             NO-UNDO.
	    DEFINE VARIABLE legendEntryBoxY    AS Infragistics.UltraChart.Core.Primitives.Box             NO-UNDO.
	    DEFINE VARIABLE legendEntryBoxY2   AS Infragistics.UltraChart.Core.Primitives.Box             NO-UNDO.
	    DEFINE VARIABLE legendPE           AS PaintElement                                            NO-UNDO.
	    DEFINE VARIABLE legendEntryTextY   AS Infragistics.UltraChart.Core.Primitives.Text            NO-UNDO.
	    DEFINE VARIABLE legendEntryTextY2  AS Infragistics.UltraChart.Core.Primitives.Text            NO-UNDO.

		/*key points and sizes on the chart, accessed through the Chart Core or 
		  directly through this layer's bounds, are used to place the legend:*/
		legendLeft = ChartCore:GridLayerBounds:Right + 45.
		legendWidth = ChartCore:GetBorderLayer():OuterBound:Width - legendLeft - 5.
		legendTop = 20.
		legendHeight = OuterBound:Height - (legendTop * 2).
		/*build a rectangle out of these numbers:*/
		legendBounds = NEW System.Drawing.Rectangle(legendLeft, legendTop, legendWidth, legendHeight).
		/*a GraphicsContext Primitive will be used here to reset the clipping area of this*/
		/*layer, so that it is possible to draw over on the right side of the chart, outside
		  of the grid area (which is the default clipping area for a custom layer)*/
		gc = NEW Infragistics.UltraChart.Core.Primitives.GraphicsContext().
		gc:ResetClip().
		/*the GraphicsContext is added to the scene just like any other primitive:*/
		scene:Add(gc).

		/*A box is used for the legend frame:*/
		legendBox = NEW Infragistics.UltraChart.Core.Primitives.Box(legendBounds, NEW LineStyle()).
		/*A PaintElement is used to make this box look nice:  This PaintElement uses a gradient:*/
		legendPE = NEW PaintElement().
		legendPE:ElementType = PaintElementType:Gradient.
		legendPE:Fill =  System.Drawing.Color:White.
		legendPE:FillStopColor = System.Drawing.Color:Silver.
		legendPE:FillOpacity = 255.
		legendPE:FillStopOpacity = 255.
		legendPE:FillGradientStyle = GradientStyle:Horizontal.
		legendBox:PE = legendPE.
		scene:Add(legendBox).
		/*There will be two entries in this legend: one for Y, the other for Y2:
		  This means 4 primitives must be drawn:  One colored Box and one Text label for each legend entry:*/
		legendEntryBoxY = NEW Infragistics.UltraChart.Core.Primitives.Box(NEW Point(legendBounds:X + 10,legendBounds:Y + 10), 20, 20, NEW LineStyle()).
		legendEntryBoxY:PE:Fill   = System.Drawing.Color:Blue.
		scene:Add(legendEntryBoxY).
		/*the hard part here is always finding the right spot to place the primitives in:
		  This requires some trial and error:*/
		legendEntryTextY = NEW Infragistics.UltraChart.Core.Primitives.Text(NEW Point(legendBounds:X + 35,legendBounds:Y + 20), "Plotted on Y Axis").
		legendEntryTextY:labelStyle:Font = NEW Font("Arial", 11).
		legendEntryTextY:labelStyle:FontColor = System.Drawing.Color:Blue.
		scene:Add(legendEntryTextY).

		legendEntryBoxY2 = NEW Infragistics.UltraChart.Core.Primitives.Box(NEW Point(legendBounds:X + 10,legendBounds:Y + 35), 20, 20, NEW LineStyle()).
		/*A Hatch PaintElement is used for the Y2 legend entry colored box:*/
		legendEntryBoxY2:PE = NEW PaintElement().
		legendEntryBoxY2:PE:ElementType = PaintElementType:Hatch.
		legendEntryBoxY2:PE:Fill = System.Drawing.Color:Red.
		legendEntryBoxY2:PE:FillStopColor = System.Drawing.Color:Transparent.
		legendEntryBoxY2:PE:Hatch = FillHatchStyle:DashedHorizontal.
		scene:Add(legendEntryBoxY2).

		legendEntryTextY2 = NEW Infragistics.UltraChart.Core.Primitives.Text(NEW Point(legendBounds:X + 35,legendBounds:Y + 45), "Plotted on Y2 Axis").
		legendEntryTextY2:labelStyle:Font = NEW Font("Arial", 11).
		legendEntryTextY2:labelStyle:FontColor = System.Drawing.Color:Red.
		scene:Add(legendEntryTextY2).
	END METHOD.

	METHOD PUBLIC VOID FillSceneGraphLine(INPUT scene AS SceneGraph):
	    DEFINE VARIABLE Y                AS IAdvanceAxis   NO-UNDO.
	    DEFINE VARIABLE X                AS IAdvanceAxis   NO-UNDO.
	    DEFINE VARIABLE Y2               AS IAdvanceAxis   NO-UNDO.
	    DEFINE VARIABLE appearanceY      AS AxisAppearance NO-UNDO.
	    DEFINE VARIABLE appearanceY2     AS AxisAppearance NO-UNDO.
	    DEFINE VARIABLE p                AS Primitive      NO-UNDO.
	    DEFINE VARIABLE currentPrimitive AS INTEGER        NO-UNDO.
	    DEFINE VARIABLE totalPrimitives  AS INTEGER        NO-UNDO.
	    DEFINE VARIABLE pL               AS Polyline       NO-UNDO.
	    DEFINE VARIABLE dP               AS DataPoint      NO-UNDO.
	    DEFINE VARIABLE dP2              AS DataPoint      NO-UNDO.
	    DEFINE VARIABLE currentPoint     AS INTEGER        NO-UNDO.
	    DEFINE VARIABLE totalPoints      AS INTEGER        NO-UNDO. 
	    DEFINE VARIABLE Y3 AS Infragistics.UltraChart.Core.IScrollScaleWindow NO-UNDO.  

		/*To Map points on the axes in this layer, we must first reference them.*/		
		Y = CAST(Grid["Y"],IAdvanceAxis).
		/*Additionally, it is possible to reference the appearance objects contained by
		  other layers (such as axis layers).  Cast the value in the Grid Hashtable to
		  an object derived from Layer (such as Axis), and call its GetAppearance() method
		  to get the right Appearance Object.*/
		appearanceY = CAST(CAST(Grid["Y"],Axis):GetAppearance(),AxisAppearance).
		Y2 = CAST(Grid["Y2"],IAdvanceAxis).
		appearanceY2 = CAST(CAST(Grid["Y2"],Axis):GetAppearance(),AxisAppearance).	
		X = CAST(Grid["X"],IAdvanceAxis).

		/*Some of the calculations made in this method were coming through incorrectly.
		  so we correct the Minimum and Maximum values on the Y2 axis:
		  In the case of a Custom Range Type, this is as easy as setting these properties
		  equal to the specified RangeMin and RangeMax:*/

		IF EnumHelper:AreEqual(appearanceY2:RangeType,AxisRangeType:Custom) THEN
        do:
            /* Workaround for lack of interface inheritance */ 
            Y3 = CAST(y2,Infragistics.UltraChart.Core.IScrollScaleWindow).
		     
            ASSIGN Y3:Minimum = cast(Y2,Infragistics.UltraChart.Core.IRangeType):RangeMin
			       Y3:Maximum = cast(Y2,Infragistics.UltraChart.Core.IRangeType):RangeMax.
        end.
        
		/* Existing primitives in the scene will be looped through: This is so we can
		   reference the lines from the chart layer:*/
        totalPrimitives = scene:COUNT - 1.
		REPEAT currentPrimitive = 0 TO totalPrimitives:
		    p = scene:ITEM[currentPrimitive].

			IF TYPE-OF(p,PolyLine) THEN /*if the found primitive is a Polyline*/
			DO:
			    pL = CAST(p,PolyLine).
			    dp2 = CAST(pL:points:GetValue(0),DataPoint).
				/*if the row label in the underlying data is "Y2"*/
				IF STRING(ChartData:GetRowLabel(dp2:Row)) = "Y2" THEN
                DO: 
					/*set this primitive's line color and style equal to the line color and style of the Y2 axis:*/
					pL:PE:Stroke = appearanceY2:LineColor.
					pL:PE:Fill   = appearanceY2:LineColor.
					pL:lineStyle:DrawStyle = appearanceY2:LineDrawStyle.
					/*loop through the collection of DataPoints in this Polyline,
					  changing each of their locations by mapping them on the Y2 axis:*/
					totalPoints = pL:points:Length - 1.
					REPEAT currentPoint = 0 TO totalPoints:
					    dP = CAST(pL:points:GetValue(currentPoint),DataPoint).
					    dP:point:Y = INTEGER(Y2:MAP(dP:Value)).
					END.
				END.
				ELSE DO: /*if the row label in the underlying data is not "Y2"*/
					/*set this primitive's line color and style equal to the line
					  color and style of the Y axis:*/
					pL:PE:Stroke = appearanceY:LineColor.
					pL:PE:Fill   = appearanceY:LineColor.
					pL:lineStyle:DrawStyle = appearanceY:LineDrawStyle.
				END.
			END. /*IF TYPE-OF(pL,PolyLine)*/
		END. /*REPEAT currentPrimitive = 0 TO totalPrimitives:*/
	END METHOD.

	METHOD PUBLIC VOID FillSceneGraphScatter(INPUT scene AS SceneGraph):
	    DEFINE VARIABLE scatterApp       AS ScatterChartAppearance NO-UNDO.
	    DEFINE VARIABLE colX             AS INTEGER                NO-UNDO.
	    DEFINE VARIABLE colY             AS INTEGER                NO-UNDO.
	    DEFINE VARIABLE Y                AS IAdvanceAxis           NO-UNDO.
	    DEFINE VARIABLE X                AS IAdvanceAxis           NO-UNDO.
	    DEFINE VARIABLE Y2               AS IAdvanceAxis           NO-UNDO.
	    DEFINE VARIABLE appearanceY      AS AxisAppearance         NO-UNDO.
	    DEFINE VARIABLE appearanceY2     AS AxisAppearance         NO-UNDO.
	    DEFINE VARIABLE p                AS Primitive              NO-UNDO.
	    DEFINE VARIABLE currentPoint     AS INTEGER                NO-UNDO.
	    DEFINE VARIABLE totalPoints      AS INTEGER                NO-UNDO.
	    DEFINE VARIABLE pS               AS PointSet               NO-UNDO.
	    DEFINE VARIABLE dP2              AS DataPoint              NO-UNDO.
	    DEFINE VARIABLE dP               AS DataPoint              NO-UNDO.
	    DEFINE VARIABLE currentPrimitive AS INTEGER                NO-UNDO.
	    DEFINE VARIABLE totalPrimitives  AS INTEGER                NO-UNDO.
	    DEFINE VARIABLE valX             AS DECIMAL                NO-UNDO.
	    DEFINE VARIABLE valY             AS DECIMAL                NO-UNDO.

	    /*In order to know what values the calling Chart has set for ScatterChart.ColumnX
		  and ScatterApp.ColumnY, it is necessary to reference the ScatterChartAppearance
		  object, which is owned by the chart layer.
		  Get the Chart Layer through the Chart Core, call its GetAppearance() method, and
		  cast this return value to a ScatterChartAppearance.*/
		scatterApp = CAST(ChartCore:GetChartLayer():GetAppearance(),ScatterChartAppearance).
		colX = scatterApp:ColumnX.
		colY = scatterApp:ColumnY.

		/*To Map points on the axes in this layer, we must first reference them.*/	
		Y = CAST(Grid["Y"],IAdvanceAxis).
		/*and their corresponding appearance objects...*/
		appearanceY = CAST(CAST(Grid["Y"],Axis):GetAppearance(),AxisAppearance).
		Y2 = CAST(Grid["Y2"],IAdvanceAxis).
		appearanceY2 = CAST(CAST(Grid["Y2"],Axis):GetAppearance(),AxisAppearance).	
		X = CAST(Grid["X"],IAdvanceAxis).

		/*Existing primitives in the scene will be looped through.  This is so we can
		  reference the Point Sets from the chart layer.*/
		totalPrimitives = scene:COUNT - 1.
		REPEAT currentPrimitive = 0 TO totalPrimitives:
		    p = scene:ITEM[currentPrimitive].

			IF TYPE-OF(p,PointSet) THEN
            DO:
                ps = CAST(p,PointSet).
                
                IF pS:points:GetValue(0) NE ? THEN
                DO:
				    /*if this primitive is a PointSet with points in it that are connected with lines*/
				
				    /* if the first point in this PointSet is labeled Y2,
				       it can be inferred that all these points belong to the Y2 group.*/
				    dp2 = CAST(pS:points:GetValue(0),DataPoint).

				    IF STRING(ChartData:GetRowLabel(pS:Row)) = "Y2" THEN
				    DO:
					    /* the appearance of a PointSet that is connected with lines
					       will be determined by the "PolylineParent" of all points.
					       Here we will set the appearance of this "PolylineParent"
					       to match the appearance of the Y2 axis */
					    CAST(pS:points:GetValue(0),DataPoint):PolylineParent:PE:Fill = appearanceY2:LineColor.
					    CAST(pS:points:GetValue(0),DataPoint):PolylineParent:PE:Stroke = appearanceY2:LineColor.
					    CAST(pS:points:GetValue(0),DataPoint):PolylineParent:lineStyle:DrawStyle = appearanceY2:LineDrawStyle.

					    /*loop through the DataPoints contained in this PointSet, and change
					      their locations by mapping them on the Y2 axis.*/
					    totalPoints = pS:points:Length - 1.
					    REPEAT currentPoint = 0 TO totalPoints:
					        dP = CAST(pS:points:GetValue(currentPoint),DataPoint).

						    IF dP NE ? THEN
                            DO:
						 	    valX = DECIMAL(ChartData:GetValue(dP:Row, colX)).
							    valY = DECIMAL(ChartData:GetValue(dP:Row, colY)).

							    dP:point = NEW System.Drawing.Point(INTEGER(X:Map(valX)), INTEGER(Y2:Map(valY))).
						    END.
						END.
				    END. /*IF STRING(ChartData:GetRowLabel(pS:points:GetValue(0):Row)) = "Y2" THEN*/
				    ELSE DO: /*if the Row Label for this pointset is not "Y2"*/
					    /* Use the Y axis to set the appearance for this PointSet */
					    CAST(pS:points:GetValue(0),DataPoint):PolylineParent:PE:Fill = appearanceY:LineColor.
					    CAST(pS:points:GetValue(0),DataPoint):PolylineParent:PE:Stroke = appearanceY:LineColor.
				    END.
				END. /*IF pS.points[0] NE ? THEN*/
			END. /*IF TYPE-OF(p,PointSet) THEN*/
		END. /*REPEAT*/
	END METHOD.
END CLASS.