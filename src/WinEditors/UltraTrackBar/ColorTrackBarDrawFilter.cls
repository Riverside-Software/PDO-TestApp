 
 /*------------------------------------------------------------------------
    File        : ColorTrackBarDrawFilter
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Wed May 21 17:21:48 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

USING Infragistics.Shared.*.
USING Infragistics.Win.IUIElementDrawFilter.
USING Infragistics.Win.UltraWinEditors.*.

USING WinEditors.UltraTrackBar.*.

USING System.Drawing.*.
USING System.Windows.Forms.*.
USING System.Drawing.Drawing2D.*.

CLASS WinEditors.UltraTrackBar.ColorTrackBarDrawFilter IMPLEMENTS Infragistics.Win.IUIElementDrawFilter: 

    DEFINE PUBLIC STATIC VARIABLE COLOR_PROPERTY_HUE        AS INTEGER INITIAL 0.
    DEFINE PUBLIC STATIC VARIABLE COLOR_PROPERTY_SATURATION AS INTEGER INITIAL 1.
    DEFINE PUBLIC STATIC VARIABLE COLOR_PROPERTY_BRIGHTNESS AS INTEGER INITIAL 2.

    DEFINE PRIVATE VARIABLE colorProperty AS INTEGER       NO-UNDO.
    DEFINE PRIVATE VARIABLE trackBar      AS Infragistics.Win.UltraWinEditors.UltraTrackBar NO-UNDO.

    /*Gets or sets the hue used for drawing colors when the ColorProperty is Saturation or Brightness. 
      Setting this property will automatically invalidate the control.
      This property is ignored when ColorProperty is Hue.*/ 
    DEFINE PUBLIC PROPERTY baseHue AS INTEGER NO-UNDO GET.
    SET (INPUT newValue AS INTEGER):
        if newValue < 0 OR newValue > 359 THEN
           UNDO, THROW new Progress.Lang.AppError("baseHue must be between 0 and 359").                

           trackBar:Invalidate().
    END SET.


    /*--------------------------------------------------------------------------------
			Purpose: Creates a new instance of the ColorTrackBarDrawFilter class.
			         This DrawFilter is intended for use with an UltraTrackBar control
			         and will draw the track with a range of colors represeting hues,
			         saturations, or brightnesses.  
			Notes: param trackBar: The TrackBar control to which the DrawFilter will
			                       apply. The DrawFilter needs this so that it can
			                       invalidate the control when the BaseHue is changed.
                   param colorProperty: Determines what type of color range is
                                        bring drawn.        
			    
	--------------------------------------------------------------------------------*/
	CONSTRUCTOR ColorTrackBarDrawFilter (INPUT newTrackBar AS UltraTrackBar, INPUT colorProperty AS INTEGER):
		THIS-OBJECT(newTrackBar,colorProperty,0).
	END CONSTRUCTOR.

	/*--------------------------------------------------------------------------------
			Purpose: Creates a new instance of the ColorTrackBarDrawFilter class.
			         This DrawFilter is intended for use with an UltraTrackBar control
			         and will draw the track with a range of colors represeting hues,
			         saturations, or brightnesses.  
			Notes: param trackBar: The TrackBar control to which the DrawFilter will
			                       apply. The DrawFilter needs this so that it can
			                       invalidate the control when the BaseHue is changed.
                   param colorProperty: Determines what type of color range is
                                        bring drawn.
                   param baseHue: The BaseHue determines the hue which which a
                                  Saturation or Brightness range is drawn.
                                 Is has no meaning for if ColorProperty is Hue.
	--------------------------------------------------------------------------------*/
	CONSTRUCTOR PUBLIC ColorTrackBarDrawFilter (INPUT newTrackBar AS UltraTrackBar, INPUT colorProperty AS INTEGER, INPUT baseHue AS INTEGER):
		SUPER ().
		
		IF newTrackBar = ? THEN UNDO,
                THROW NEW Progress.Lang.AppError("trackBar cannot be null.").

        ASSIGN THIS-OBJECT:trackBar      = newTrackBar
               THIS-OBJECT:colorProperty = colorProperty            
               THIS-OBJECT:baseHue       = baseHue.
	END CONSTRUCTOR.

	METHOD PUBLIC Infragistics.Win.DrawPhase GetPhasesToFilter(INPUT-OUTPUT drawParams AS Infragistics.Win.UIElementDrawParams ):
        /*Watch for the TrackUIElement*/
        IF TYPE-OF(drawParams:Element, TrackUIElement) THEN
            /*Return the BeforeDrawBackColor phase.*/ 
            RETURN Infragistics.Win.DrawPhase:BeforeDrawBackColor.

        /*For any other element, return none and let the control handle the drawing.*/ 
        RETURN Infragistics.Win.DrawPhase:NONE.
	END METHOD.

	METHOD PUBLIC LOGICAL DrawElement( INPUT drawPhase AS Infragistics.Win.DrawPhase, INPUT-OUTPUT drawParams AS Infragistics.Win.UIElementDrawParams ):
        DEFINE VARIABLE trackUIElement              AS TrackUIElement              NO-UNDO.
        DEFINE VARIABLE trackRect                   AS System.Drawing.Rectangle    NO-UNDO.
        DEFINE VARIABLE trackBarEmbeddableUIElement AS TrackBarEmbeddableUIElement NO-UNDO.
        DEFINE VARIABLE ORIENTATION                 AS System.Windows.Forms.Orientation NO-UNDO.
        DEFINE VARIABLE isHorizontal                AS LOGICAL                     NO-UNDO.
        DEFINE VARIABLE blend                       AS ColorBlend                  NO-UNDO.
        DEFINE VARIABLE step                        AS DECIMAL                     NO-UNDO.
        DEFINE VARIABLE stopLoop                    AS INTEGER                     NO-UNDO.
        DEFINE VARIABLE currPosition                AS DECIMAL                     NO-UNDO.
        DEFINE VARIABLE posX                        AS INTEGER                     NO-UNDO.
        DEFINE VARIABLE posY                        AS INTEGER                     NO-UNDO.
        DEFINE VARIABLE point                       AS Point                       NO-UNDO.
        DEFINE VARIABLE newColor                    AS System.Drawing.Color        NO-UNDO.
        DEFINE VARIABLE linearGradientMode          AS LinearGradientMode          NO-UNDO.
        DEFINE VARIABLE linearGradientBrush         AS LinearGradientBrush         NO-UNDO.

        /*Set the number of stops. Making this value higher will increase the number of
          stops drawn in the gradient and thus the colors on the track will be more accurate.
          Fewer stops will make the drawing more performant.*/
        DEFINE VARIABLE stops AS INTEGER NO-UNDO INITIAL 20.

        /*Create an array of positions and color.*/ 
        DEFINE VARIABLE positions AS System.Array NO-UNDO.
        DEFINE VARIABLE colors    AS System.Array NO-UNDO.

        /*Get the TrackUIElement.*/ 
        trackUIElement = CAST(drawParams:Element, TrackUIElement).

        IF trackUIElement NE ? AND Progress.Util.EnumHelper:AreEqual(drawPhase, Infragistics.Win.DrawPhase:BeforeDrawBackColor) THEN
        DO:
            /*Store the rect of the track element.*/ 
            trackRect = trackUIElement:Rect.

            /*Get the TrackBarEmbeddableUIElement. We will need this to determine the efective track area.*/ 
            trackBarEmbeddableUIElement = CAST(trackUIElement:GetAncestor(Progress.Util.TypeHelper:GetType("TrackBarEmbeddableUIElement")), TrackBarEmbeddableUIElement).

            IF trackBarEmbeddableUIElement = ? THEN
                RETURN FALSE .

            /*Clip the track area rect by the effective track area. 
              In a typical trackbar, the track extends beyond the effective area. In other words,
              there is an area of the track at each end that is there to contain the thumb, but 
              does not correspond to any real value. 
              For a color TrackBar, we don't want to draw in this area.*/ 
             trackRect = System.Drawing.Rectangle:Intersect(trackBarEmbeddableUIElement:EffectiveTrackArea, trackRect).

             /*Determine the orientation of the TrackBar.*/ 
             ASSIGN orientation = trackBar:Orientation
                    isHorizontal = (orientation = System.Windows.Forms.Orientation:Horizontal).

             /*Create the ColorBlend.*/ 
             blend = new ColorBlend().

             /*Determine how many pixels to step at each position.*/ 
             step = IF isHorizontal THEN DECIMAL(trackRect:Width)  / DECIMAL(stops)
                                    ELSE DECIMAL(trackRect:Height) / DECIMAL(stops).

             ASSIGN positions = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Single"), stops + 1).
                    colors    = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Drawing.Color"), stops + 1).

             /*Loop through each stop and determine the position and color.*/ 
             REPEAT stopLoop = 0 TO stops:
                 /*Set the position for this stop.*/ 
                 currPosition = stopLoop / stops.
                 positions:SetValue(currPosition, stopLoop).

                 /*Get a point at this stop location.*/ 
                 posX = IF isHorizontal THEN trackRect:Left + (step * stopLoop) ELSE trackRect:LEFT.
                 posY = IF isHorizontal THEN trackRect:TOP ELSE trackRect:Top + (step * stopLoop).

                 point = new Point(posX,posY).

                 /*Get the color at the point and assign it to the colors array.*/ 
                 newColor = GetColorFromPoint(trackBarEmbeddableUIElement, point).
                 colors:SetValue(newColor, stopLoop).
             END. /*REPEAT stopLoop = 0 TO stops:*/

             /*Set the positions and colors on the ColorBlend*/
             ASSIGN blend:Positions = CAST(positions, "System.Single[]")
                    blend:Colors    = CAST(colors, "System.Drawing.Color[]").

             /*Determine which linearGradientMode to use.*/ 
             linearGradientMode = IF isHorizontal THEN System.Drawing.Drawing2D.LinearGradientMode:HORIZONTAL ELSE System.Drawing.Drawing2D.LinearGradientMode:VERTICAL.

             /*Create the linear gradient brush and draw the background.*/ 
             linearGradientBrush = new LinearGradientBrush(System.Drawing.Rectangle:Inflate(trackRect, 1, 1), System.Drawing.Color:Black, System.Drawing.Color:Black, linearGradientMode).
             linearGradientBrush:InterpolationColors = blend.
             drawParams:Graphics:FillRectangle(linearGradientBrush, trackRect).

             /*Cancel the default drawing.*/ 
             RETURN TRUE.
        END. /*IF trackUIElement NE ? AND drawPhase = DrawPhase:BeforeDrawBackColor THEN*/

        RETURN FALSE.
	END METHOD. /*DrawElement*/

    /*--------------------------------------------------------------------------------
			Purpose: Determines the color that should be drawn at a particular point
			         on the Track.
			Notes: param trackBarEmbeddableUIElement: The trackBarEmbeddableUIElement
			       which contains the TrackUIElement.
                   param point: point        
	--------------------------------------------------------------------------------*/
    METHOD PUBLIC System.Drawing.Color GetColorFromPoint(INPUT trackBarEmbeddableUIElement AS TrackBarEmbeddableUIElement, INPUT point AS Point):
        DEFINE VARIABLE effectiveRect AS System.Drawing.Rectangle NO-UNDO.
        DEFINE VARIABLE newValue AS INTEGER NO-UNDO.

        /*Normally, the track is drawn a little bit beyond the actual range of values on 
          each end of the TrackBar. This is to allow the thumb to move all the way to the end of
          the track so select the min or max value. 
          While these ends are valid for the thumb, they are not valid for the colors we want to 
          draw here. So first, check to make sure the point is inside the EffectiveTrackArea. If
          it is not, return Color.Transparent to draw nothing.*/ 
        effectiveRect = trackBarEmbeddableUIElement:EffectiveTrackArea.
        effectiveRect:WIDTH = effectiveRect:WIDTH + 1.
        effectiveRect:HEIGHT = effectiveRect:HEIGHT + 1.            
        IF effectiveRect:Contains(point) = FALSE THEN
            RETURN System.Drawing.Color:TRANSPARENT.

        /*Get the Value of the TrackBar at the specified point.*/
        newValue = trackBarEmbeddableUIElement:GetValueFromPoint(point).

        /*Get a Color for that value.*/ 
        RETURN GetColorFromValue(newValue).
    END METHOD. /*GetColorFromPoint*/

    /*--------------------------------------------------------------------------------
			Purpose: Gets a color based on the specified trackbar value.
			Notes: param newValue: The value for which to calculate a color.  
			       returns: a color based on the specified trackbar value.      
	--------------------------------------------------------------------------------*/
    METHOD PUBLIC System.Drawing.Color GetColorFromValue(INPUT newValue AS INTEGER):
        /*Calculate a color based on the value.*/
        CASE colorProperty:
            WHEN COLOR_PROPERTY_HUE THEN
                /*For Hue, use the value as a the hue (0 to 359). Use medium brightness and full saturation.*/ 
                RETURN XPItemColor:ColorFromHLS(newValue, 1, 1).
            WHEN COLOR_PROPERTY_SATURATION THEN
                /*For Saturation, divide the value by 255 to get a value from 0 to 1. Use the baseHue as the hue and use medium brightness.*/ 
                RETURN XPItemColor:ColorFromHLS(baseHue, 1, newValue / 255).
            WHEN COLOR_PROPERTY_BRIGHTNESS THEN
                /*For Brightness, divide the value by 255 to get a value from 0 to 1. Use the baseHue as the hue and use full saturation.*/ 
                RETURN XPItemColor:ColorFromHLS(baseHue, newValue / 255, 1).
        END CASE.

        RETURN System.Drawing.Color:Black.
    END METHOD. /*METHOD PUBLIC System.Drawing.Color GetColorFromValue(INPUT newValue AS INTEGER):*/
END CLASS.