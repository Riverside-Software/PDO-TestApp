 
 /*------------------------------------------------------------------------
    File        : frmUltraToolTipsBasicFeatures
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : vza
    Created     : Tue Jun 10 15:04:23 CEST 2008
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
USING Infragistics.Win.UltraWinEditors.*.
USING Infragistics.Win.UltraWinToolTip.*.
USING Infragistics.Win.FormattedLinkLabel.*.

using WinMisc.ToolTipManager.frmUltraToolTipsBasicFeatures.

CLASS WinMisc.ToolTipManager.frmUltraToolTipsBasicFeatures INHERITS Form   : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.


	DEFINE PRIVATE VARIABLE openFileDialog1 AS System.Windows.Forms.OpenFileDialog NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraToolTipManager2 AS Infragistics.Win.UltraWinToolTip.UltraToolTipManager NO-UNDO.
	DEFINE PRIVATE VARIABLE lblToolTip2 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraToolTipManager1 AS Infragistics.Win.UltraWinToolTip.UltraToolTipManager NO-UNDO.
	DEFINE PRIVATE VARIABLE grpTooltipBehavior AS Infragistics.Win.Misc.UltraGroupBox NO-UNDO.
	DEFINE PUBLIC VARIABLE lblToolTipTextStyle AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PUBLIC VARIABLE cboToolTipTextStyle AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PUBLIC VARIABLE lblOffice2007ColorScheme AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PUBLIC VARIABLE cboOffice2007ColorScheme AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PUBLIC VARIABLE lblDisplayStyle AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PUBLIC VARIABLE cboDisplayStyle AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE uneAutoPopDelay AS Infragistics.Win.UltraWinEditors.UltraNumericEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE lblAutoPopDelay AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE uneInitialDelay AS Infragistics.Win.UltraWinEditors.UltraNumericEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE lblInitialDelay AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE grpToolTipAppearance AS Infragistics.Win.Misc.UltraGroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE lblHatchStyle AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE cboHatchStyle AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE lblGradientStyle AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE cboGradientStyle AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE lblBackColor2 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ucpBackColor2 AS Infragistics.Win.UltraWinEditors.UltraColorPicker NO-UNDO.
	DEFINE PRIVATE VARIABLE lblBackColor AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ucpBackColor AS Infragistics.Win.UltraWinEditors.UltraColorPicker NO-UNDO.
	DEFINE PRIVATE VARIABLE lblToolTipBorderColor AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ucpToolTipBorderColor AS Infragistics.Win.UltraWinEditors.UltraColorPicker NO-UNDO.
	DEFINE PRIVATE VARIABLE lblForeColor AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ucpForeColor AS Infragistics.Win.UltraWinEditors.UltraColorPicker NO-UNDO.
	DEFINE PRIVATE VARIABLE ucpTitleForeColor AS Infragistics.Win.UltraWinEditors.UltraColorPicker NO-UNDO.
	DEFINE PRIVATE VARIABLE lblTitleForeColor AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE grpToolTipContents AS Infragistics.Win.Misc.UltraGroupBox NO-UNDO.
	DEFINE PUBLIC VARIABLE fteFormattedToolTipText AS Infragistics.Win.FormattedLinkLabel.UltraFormattedTextEditor NO-UNDO.
	DEFINE PUBLIC VARIABLE lblToolTipTextFormatted AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE lblImage AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE txtTitle AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE lbCustomImage AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE lblText AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE cboImage AS Infragistics.Win.UltraWinEditors.UltraComboEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtCustomImage AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE lblTitle AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE txtText AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE lblToolTip AS Infragistics.Win.Misc.UltraLabel NO-UNDO.

		
	CONSTRUCTOR PUBLIC frmUltraToolTipsBasicFeatures (  ):
		
		SUPER().
		InitializeComponent ( ).

	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC frmUltraToolTipsBasicFeatures ( ):

		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.

	END DESTRUCTOR.


	METHOD PRIVATE VOID InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

		THIS-OBJECT:components = NEW System.ComponentModel.Container().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo2 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo2 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE resources AS System.Resources.ResXResourceSet NO-UNDO.
		resources = Progress.Util.ResourceHelper:Load("WinMisc/ToolTipManager/frmUltraToolTipsBasicFeatures.resx", PROPATH).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo3 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo3 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("This determines the display style of the tooltip.", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo4 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo4 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("AutoPopDelay determines how much time (in milliseconds) before the tooltip automatically times out and disappears.", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo5 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo5 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo(resources:GetString("uneInitialDelay.UltraToolTip"), Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo6 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo6 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo(resources:GetString("cboHatchStyle.UltraToolTip"), Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo7 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo7 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("Choosing a Gradient Style will make the tooltip background display with a gradient. Be sure to set both BackColor and BackColor2 for this to work.", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo8 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo8 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("This is a second BackColor for the tooltip. It will be used only if either GradientStyle or HatchStyle are set.", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo9 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo9 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("Choose a BackColor for the tooltip.", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo10 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo10 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("Determines the color of the tooltip border.", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo11 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo11 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("Choose the color of the tooltip text. The title will use the same color, unless you choose a color from the ~"Title ForeColor~" box below.", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo12 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo12 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("This determines the color of the title text. By default, the title text will be the same as the ForeColor above. But you can make it a different color.", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo13 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo13 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("This is the formatted tooltip text. It will take precedence over the ToolTip Text unless TextStyle is set to Raw.", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo14 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo14 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("This is the tooltip title. The title appears above the text and will be in bold by default. The phrase ~"What does this do?~" above is the title of this tooltip.", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo15 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo15 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("This determines the image that will be displayed in the tooltip title. You can choose a predefined image, or choose custom and choose any image file you like.", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE editorButton1 AS Infragistics.Win.UltraWinEditors.EditorButton NO-UNDO.
		editorButton1 = NEW Infragistics.Win.UltraWinEditors.EditorButton().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo16 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo16 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("If the ToolTipImage property is set to Custom (or Default) you can click the ellipsis button and choose a file to display in the tooltip title.", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo17 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo17 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("This is the text of the tooltip.", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance2 AS Infragistics.Win.Appearance NO-UNDO.
		appearance2 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo1 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo1 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:False).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance1 AS Infragistics.Win.Appearance NO-UNDO.
		appearance1 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraToolTipInfo18 AS Infragistics.Win.UltraWinToolTip.UltraToolTipInfo NO-UNDO.
		ultraToolTipInfo18 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipInfo("This text will appear in the tooltip.", Infragistics.Win.ToolTipImage:Default, ?, Infragistics.Win.DefaultableBoolean:Default).
		THIS-OBJECT:openFileDialog1 = NEW System.Windows.Forms.OpenFileDialog().
		THIS-OBJECT:ultraToolTipManager2 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipManager(THIS-OBJECT:components).
		THIS-OBJECT:cboToolTipTextStyle = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:cboDisplayStyle = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:uneAutoPopDelay = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
		THIS-OBJECT:uneInitialDelay = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
		THIS-OBJECT:cboHatchStyle = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:cboGradientStyle = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:ucpBackColor2 = NEW Infragistics.Win.UltraWinEditors.UltraColorPicker().
		THIS-OBJECT:ucpBackColor = NEW Infragistics.Win.UltraWinEditors.UltraColorPicker().
		THIS-OBJECT:ucpToolTipBorderColor = NEW Infragistics.Win.UltraWinEditors.UltraColorPicker().
		THIS-OBJECT:ucpForeColor = NEW Infragistics.Win.UltraWinEditors.UltraColorPicker().
		THIS-OBJECT:ucpTitleForeColor = NEW Infragistics.Win.UltraWinEditors.UltraColorPicker().
		THIS-OBJECT:fteFormattedToolTipText = NEW Infragistics.Win.FormattedLinkLabel.UltraFormattedTextEditor().
		THIS-OBJECT:txtTitle = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		THIS-OBJECT:cboImage = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:txtCustomImage = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		THIS-OBJECT:txtText = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		THIS-OBJECT:ultraToolTipManager1 = NEW Infragistics.Win.UltraWinToolTip.UltraToolTipManager(THIS-OBJECT:components).
		THIS-OBJECT:lblToolTip2 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblToolTip = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:grpTooltipBehavior = NEW Infragistics.Win.Misc.UltraGroupBox().
		THIS-OBJECT:lblToolTipTextStyle = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblOffice2007ColorScheme = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:cboOffice2007ColorScheme = NEW Infragistics.Win.UltraWinEditors.UltraComboEditor().
		THIS-OBJECT:lblDisplayStyle = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblAutoPopDelay = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblInitialDelay = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:grpToolTipAppearance = NEW Infragistics.Win.Misc.UltraGroupBox().
		THIS-OBJECT:lblHatchStyle = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblGradientStyle = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblBackColor2 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblBackColor = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblToolTipBorderColor = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblForeColor = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblTitleForeColor = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:grpToolTipContents = NEW Infragistics.Win.Misc.UltraGroupBox().
		THIS-OBJECT:lblToolTipTextFormatted = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblImage = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lbCustomImage = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblText = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblTitle = NEW Infragistics.Win.Misc.UltraLabel().
		CAST(THIS-OBJECT:cboToolTipTextStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:cboDisplayStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:uneAutoPopDelay, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:uneInitialDelay, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:cboHatchStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:cboGradientStyle, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ucpBackColor2, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ucpBackColor, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ucpToolTipBorderColor, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ucpForeColor, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ucpTitleForeColor, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:txtTitle, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:cboImage, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:txtCustomImage, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:txtText, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:grpTooltipBehavior, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:grpTooltipBehavior:SuspendLayout().
		CAST(THIS-OBJECT:cboOffice2007ColorScheme, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:grpToolTipAppearance, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:grpToolTipAppearance:SuspendLayout().
		CAST(THIS-OBJECT:grpToolTipContents, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:grpToolTipContents:SuspendLayout().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* openFileDialog1 */
		/*  */
		THIS-OBJECT:openFileDialog1:DefaultExt = "bmp".
		THIS-OBJECT:openFileDialog1:Filter = "All image files(*.BMP;*.GIF;*.JPG;*.JPEG;*.PNG;*.ICO;*.EMF;*.WMF;)|*.BMP;*.GIF;*.JPG;*.JPEG;*.PNG;*.ICO;*.EMF;*.WMF".
		THIS-OBJECT:openFileDialog1:Title = "Choose an image file".
		THIS-OBJECT:openFileDialog1:FileOk:SUBSCRIBE(THIS-OBJECT:openFileDialog1_FileOk).
		/*  */
		/* ultraToolTipManager2 */
		/*  */
		THIS-OBJECT:ultraToolTipManager2:AutoPopDelay = 20000.
		THIS-OBJECT:ultraToolTipManager2:ContainingControl = THIS-OBJECT.
		THIS-OBJECT:ultraToolTipManager2:ToolTipImage = Infragistics.Win.ToolTipImage:Info.
		THIS-OBJECT:ultraToolTipManager2:ToolTipTitle = "What does this do?".
		/*  */
		/* cboToolTipTextStyle */
		/*  */
		THIS-OBJECT:cboToolTipTextStyle:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:cboToolTipTextStyle:Location = NEW System.Drawing.Point(16, 272).
		THIS-OBJECT:cboToolTipTextStyle:Name = "cboToolTipTextStyle".
		THIS-OBJECT:cboToolTipTextStyle:Size = NEW System.Drawing.Size(88, 21).
		THIS-OBJECT:cboToolTipTextStyle:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:cboToolTipTextStyle:TabIndex = 19.
		ultraToolTipInfo2:ToolTipTextFormatted = resources:GetString("ultraToolTipInfo2.ToolTipTextFormatted").
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:cboToolTipTextStyle, ultraToolTipInfo2).
		THIS-OBJECT:cboToolTipTextStyle:ValueChanged:SUBSCRIBE(THIS-OBJECT:cboToolTipTextStyle_ValueChanged).
		/*  */
		/* cboDisplayStyle */
		/*  */
		THIS-OBJECT:cboDisplayStyle:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:cboDisplayStyle:Location = NEW System.Drawing.Point(16, 40).
		THIS-OBJECT:cboDisplayStyle:Name = "cboDisplayStyle".
		THIS-OBJECT:cboDisplayStyle:Size = NEW System.Drawing.Size(88, 21).
		THIS-OBJECT:cboDisplayStyle:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:cboDisplayStyle:TabIndex = 15.
		ultraToolTipInfo3:ToolTipText = "This determines the display style of the tooltip.".
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:cboDisplayStyle, ultraToolTipInfo3).
		THIS-OBJECT:cboDisplayStyle:ValueChanged:SUBSCRIBE(THIS-OBJECT:cboDisplayStyle_ValueChanged).
		/*  */
		/* uneAutoPopDelay */
		/*  */
		THIS-OBJECT:uneAutoPopDelay:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:uneAutoPopDelay:Location = NEW System.Drawing.Point(16, 216).
		THIS-OBJECT:uneAutoPopDelay:MaskDisplayMode = Infragistics.Win.UltraWinMaskedEdit.MaskMode:Raw.
		THIS-OBJECT:uneAutoPopDelay:MaskInput = "nnnn".
		THIS-OBJECT:uneAutoPopDelay:MaxValue = BOX(9999).
		THIS-OBJECT:uneAutoPopDelay:MinValue = BOX(0).
		THIS-OBJECT:uneAutoPopDelay:Name = "uneAutoPopDelay".
		THIS-OBJECT:uneAutoPopDelay:Size = NEW System.Drawing.Size(88, 21).
		THIS-OBJECT:uneAutoPopDelay:SpinButtonDisplayStyle = Infragistics.Win.ButtonDisplayStyle:Always.
		THIS-OBJECT:uneAutoPopDelay:SpinWrap = TRUE.
		THIS-OBJECT:uneAutoPopDelay:TabIndex = 8.
		ultraToolTipInfo4:ToolTipText = "AutoPopDelay determines how much time (in milliseconds) before the tooltip automatically times out and disappears.".
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:uneAutoPopDelay, ultraToolTipInfo4).
		THIS-OBJECT:uneAutoPopDelay:Value = BOX(5000).
		THIS-OBJECT:uneAutoPopDelay:ValueChanged:SUBSCRIBE(THIS-OBJECT:uneAutoPopDelay_ValueChanged).
		/*  */
		/* uneInitialDelay */
		/*  */
		THIS-OBJECT:uneInitialDelay:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:uneInitialDelay:Location = NEW System.Drawing.Point(16, 160).
		THIS-OBJECT:uneInitialDelay:MaskDisplayMode = Infragistics.Win.UltraWinMaskedEdit.MaskMode:Raw.
		THIS-OBJECT:uneInitialDelay:MaskInput = "nnnn".
		THIS-OBJECT:uneInitialDelay:MaxValue = BOX(9999).
		THIS-OBJECT:uneInitialDelay:MinValue = BOX(0).
		THIS-OBJECT:uneInitialDelay:Name = "uneInitialDelay".
		THIS-OBJECT:uneInitialDelay:Size = NEW System.Drawing.Size(88, 21).
		THIS-OBJECT:uneInitialDelay:SpinButtonDisplayStyle = Infragistics.Win.ButtonDisplayStyle:Always.
		THIS-OBJECT:uneInitialDelay:SpinWrap = TRUE.
		THIS-OBJECT:uneInitialDelay:TabIndex = 6.
		ultraToolTipInfo5:ToolTipText = resources:GetString("ultraToolTipInfo5.ToolTipText").
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:uneInitialDelay, ultraToolTipInfo5).
		THIS-OBJECT:uneInitialDelay:Value = BOX(500).
		THIS-OBJECT:uneInitialDelay:ValueChanged:SUBSCRIBE(THIS-OBJECT:uneInitialDelay_ValueChanged).
		/*  */
		/* cboHatchStyle */
		/*  */
		THIS-OBJECT:cboHatchStyle:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:cboHatchStyle:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:cboHatchStyle:Location = NEW System.Drawing.Point(16, 240).
		THIS-OBJECT:cboHatchStyle:Name = "cboHatchStyle".
		THIS-OBJECT:cboHatchStyle:Size = NEW System.Drawing.Size(176, 21).
		THIS-OBJECT:cboHatchStyle:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:cboHatchStyle:TabIndex = 13.
		ultraToolTipInfo6:ToolTipText = resources:GetString("ultraToolTipInfo6.ToolTipText").
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:cboHatchStyle, ultraToolTipInfo6).
		THIS-OBJECT:cboHatchStyle:ValueChanged:SUBSCRIBE(THIS-OBJECT:cboHatchStyle_ValueChanged).
		/*  */
		/* cboGradientStyle */
		/*  */
		THIS-OBJECT:cboGradientStyle:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:cboGradientStyle:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:cboGradientStyle:Location = NEW System.Drawing.Point(16, 192).
		THIS-OBJECT:cboGradientStyle:Name = "cboGradientStyle".
		THIS-OBJECT:cboGradientStyle:Size = NEW System.Drawing.Size(176, 21).
		THIS-OBJECT:cboGradientStyle:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:cboGradientStyle:TabIndex = 11.
		ultraToolTipInfo7:ToolTipText = "Choosing a Gradient Style will make the tooltip background display with a gradient. Be sure to set both BackColor and BackColor2 for this to work.".
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:cboGradientStyle, ultraToolTipInfo7).
		THIS-OBJECT:cboGradientStyle:ValueChanged:SUBSCRIBE(THIS-OBJECT:cboGradientStyle_ValueChanged).
		/*  */
		/* ucpBackColor2 */
		/*  */
		THIS-OBJECT:ucpBackColor2:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ucpBackColor2:DefaultColor = System.Drawing.Color:Transparent.
		THIS-OBJECT:ucpBackColor2:Location = NEW System.Drawing.Point(16, 144).
		THIS-OBJECT:ucpBackColor2:Name = "ucpBackColor2".
		THIS-OBJECT:ucpBackColor2:Size = NEW System.Drawing.Size(176, 21).
		THIS-OBJECT:ucpBackColor2:TabIndex = 8.
		THIS-OBJECT:ucpBackColor2:Text = "Transparent".
		ultraToolTipInfo8:ToolTipText = "This is a second BackColor for the tooltip. It will be used only if either GradientStyle or HatchStyle are set.".
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:ucpBackColor2, ultraToolTipInfo8).
		THIS-OBJECT:ucpBackColor2:ColorChanged:SUBSCRIBE(THIS-OBJECT:ucpBackColor2_ColorChanged).
		/*  */
		/* ucpBackColor */
		/*  */
		THIS-OBJECT:ucpBackColor:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ucpBackColor:DefaultColor = System.Drawing.SystemColors:Info.
		THIS-OBJECT:ucpBackColor:Location = NEW System.Drawing.Point(16, 96).
		THIS-OBJECT:ucpBackColor:Name = "ucpBackColor".
		THIS-OBJECT:ucpBackColor:Size = NEW System.Drawing.Size(176, 21).
		THIS-OBJECT:ucpBackColor:TabIndex = 6.
		THIS-OBJECT:ucpBackColor:Text = "Info".
		ultraToolTipInfo9:ToolTipText = "Choose a BackColor for the tooltip.".
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:ucpBackColor, ultraToolTipInfo9).
		THIS-OBJECT:ucpBackColor:ColorChanged:SUBSCRIBE(THIS-OBJECT:ucpBackColor_ColorChanged).
		THIS-OBJECT:ucpBackColor:ValueChanged:SUBSCRIBE(THIS-OBJECT:ucpBackColor_ValueChanged).
		/*  */
		/* ucpToolTipBorderColor */
		/*  */
		THIS-OBJECT:ucpToolTipBorderColor:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ucpToolTipBorderColor:DefaultColor = System.Drawing.SystemColors:WindowFrame.
		THIS-OBJECT:ucpToolTipBorderColor:Location = NEW System.Drawing.Point(16, 304).
		THIS-OBJECT:ucpToolTipBorderColor:Name = "ucpToolTipBorderColor".
		THIS-OBJECT:ucpToolTipBorderColor:Size = NEW System.Drawing.Size(176, 21).
		THIS-OBJECT:ucpToolTipBorderColor:TabIndex = 4.
		THIS-OBJECT:ucpToolTipBorderColor:Text = "WindowFrame".
		ultraToolTipInfo10:ToolTipText = "Determines the color of the tooltip border.".
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:ucpToolTipBorderColor, ultraToolTipInfo10).
		THIS-OBJECT:ucpToolTipBorderColor:ColorChanged:SUBSCRIBE(THIS-OBJECT:ucpToolTipBorderColor_ColorChanged).
		/*  */
		/* ucpForeColor */
		/*  */
		THIS-OBJECT:ucpForeColor:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ucpForeColor:DefaultColor = System.Drawing.SystemColors:InfoText.
		THIS-OBJECT:ucpForeColor:Location = NEW System.Drawing.Point(16, 40).
		THIS-OBJECT:ucpForeColor:Name = "ucpForeColor".
		THIS-OBJECT:ucpForeColor:Size = NEW System.Drawing.Size(176, 21).
		THIS-OBJECT:ucpForeColor:TabIndex = 0.
		THIS-OBJECT:ucpForeColor:Text = "InfoText".
		ultraToolTipInfo11:ToolTipText = "Choose the color of the tooltip text. The title will use the same color, unless you choose a color from the ~"Title ForeColor~" box below.".
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:ucpForeColor, ultraToolTipInfo11).
		THIS-OBJECT:ucpForeColor:ColorChanged:SUBSCRIBE(THIS-OBJECT:ucpForeColor_ColorChanged).
		/*  */
		/* ucpTitleForeColor */
		/*  */
		THIS-OBJECT:ucpTitleForeColor:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ucpTitleForeColor:DefaultColor = System.Drawing.SystemColors:InfoText.
		THIS-OBJECT:ucpTitleForeColor:Location = NEW System.Drawing.Point(16, 368).
		THIS-OBJECT:ucpTitleForeColor:Name = "ucpTitleForeColor".
		THIS-OBJECT:ucpTitleForeColor:Size = NEW System.Drawing.Size(176, 21).
		THIS-OBJECT:ucpTitleForeColor:TabIndex = 0.
		THIS-OBJECT:ucpTitleForeColor:Text = "InfoText".
		ultraToolTipInfo12:ToolTipText = "This determines the color of the title text. By default, the title text will be the same as the ForeColor above. But you can make it a different color.".
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:ucpTitleForeColor, ultraToolTipInfo12).
		THIS-OBJECT:ucpTitleForeColor:ColorChanged:SUBSCRIBE(THIS-OBJECT:ucpTitleForeColor_ColorChanged).
		/*  */
		/* fteFormattedToolTipText */
		/*  */
		THIS-OBJECT:fteFormattedToolTipText:Location = NEW System.Drawing.Point(16, 144).
		THIS-OBJECT:fteFormattedToolTipText:Name = "fteFormattedToolTipText".
		THIS-OBJECT:fteFormattedToolTipText:Size = NEW System.Drawing.Size(144, 72).
		THIS-OBJECT:fteFormattedToolTipText:TabIndex = 16.
		ultraToolTipInfo13:ToolTipText = "This is the formatted tooltip text. It will take precedence over the ToolTip Text unless TextStyle is set to Raw.".
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:fteFormattedToolTipText, ultraToolTipInfo13).
		THIS-OBJECT:fteFormattedToolTipText:Value = BOX("This text will display in the tooltip when <span style=~"font-weight:bold;~">formatted</span>!").
		THIS-OBJECT:fteFormattedToolTipText:ValueChanged:SUBSCRIBE(THIS-OBJECT:fteFormattedToolTipText_ValueChanged).
		/*  */
		/* txtTitle */
		/*  */
		THIS-OBJECT:txtTitle:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:txtTitle:Location = NEW System.Drawing.Point(16, 248).
		THIS-OBJECT:txtTitle:Multiline = TRUE.
		THIS-OBJECT:txtTitle:Name = "txtTitle".
		THIS-OBJECT:txtTitle:Size = NEW System.Drawing.Size(144, 21).
		THIS-OBJECT:txtTitle:TabIndex = 5.
		ultraToolTipInfo14:ToolTipText = "This is the tooltip title. The title appears above the text and will be in bold by default. The phrase ~"What does this do?~" above is the title of this tooltip.".
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:txtTitle, ultraToolTipInfo14).
		THIS-OBJECT:txtTitle:ValueChanged:SUBSCRIBE(THIS-OBJECT:txtTitle_ValueChanged).
		/*  */
		/* cboImage */
		/*  */
		THIS-OBJECT:cboImage:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:cboImage:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:cboImage:Location = NEW System.Drawing.Point(16, 320).
		THIS-OBJECT:cboImage:Name = "cboImage".
		THIS-OBJECT:cboImage:Size = NEW System.Drawing.Size(144, 21).
		THIS-OBJECT:cboImage:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:cboImage:TabIndex = 7.
		ultraToolTipInfo15:ToolTipText = "This determines the image that will be displayed in the tooltip title. You can choose a predefined image, or choose custom and choose any image file you like.".
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:cboImage, ultraToolTipInfo15).
		THIS-OBJECT:cboImage:ValueChanged:SUBSCRIBE(THIS-OBJECT:cboImage_ValueChanged).
		/*  */
		/* txtCustomImage */
		/*  */
		THIS-OBJECT:txtCustomImage:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		editorButton1:Text = "...".
		THIS-OBJECT:txtCustomImage:ButtonsRight:Add(editorButton1).
		THIS-OBJECT:txtCustomImage:Location = NEW System.Drawing.Point(16, 368).
		THIS-OBJECT:txtCustomImage:Multiline = TRUE.
		THIS-OBJECT:txtCustomImage:Name = "txtCustomImage".
		THIS-OBJECT:txtCustomImage:ReadOnly = TRUE.
		THIS-OBJECT:txtCustomImage:Size = NEW System.Drawing.Size(144, 21).
		THIS-OBJECT:txtCustomImage:TabIndex = 8.
		ultraToolTipInfo16:ToolTipText = "If the ToolTipImage property is set to Custom (or Default) you can click the ellipsis button and choose a file to display in the tooltip title.".
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:txtCustomImage, ultraToolTipInfo16).
		THIS-OBJECT:txtCustomImage:EditorButtonClick:SUBSCRIBE(THIS-OBJECT:txtCustomImage_EditorButtonClick).
		/*  */
		/* txtText */
		/*  */
		THIS-OBJECT:txtText:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:txtText:Location = NEW System.Drawing.Point(16, 40).
		THIS-OBJECT:txtText:Multiline = TRUE.
		THIS-OBJECT:txtText:Name = "txtText".
		THIS-OBJECT:txtText:Size = NEW System.Drawing.Size(144, 80).
		THIS-OBJECT:txtText:TabIndex = 3.
		THIS-OBJECT:txtText:Text = "This text will appear in the tooltip.".
		ultraToolTipInfo17:ToolTipText = "This is the text of the tooltip.".
		THIS-OBJECT:ultraToolTipManager2:SetUltraToolTip(THIS-OBJECT:txtText, ultraToolTipInfo17).
		THIS-OBJECT:txtText:ValueChanged:SUBSCRIBE(THIS-OBJECT:txtText_ValueChanged).
		/*  */
		/* ultraToolTipManager1 */
		/*  */
		THIS-OBJECT:ultraToolTipManager1:ContainingControl = THIS-OBJECT.
		/*  */
		/* lblToolTip2 */
		/*  */
		THIS-OBJECT:lblToolTip2:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance2:TextHAlignAsString = "Center".
		appearance2:TextVAlignAsString = "Middle".
		THIS-OBJECT:lblToolTip2:Appearance = appearance2.
		THIS-OBJECT:lblToolTip2:BorderStyleOuter = Infragistics.Win.UIElementBorderStyle:Solid.
		THIS-OBJECT:lblToolTip2:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 12, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:lblToolTip2:Location = NEW System.Drawing.Point(536, 199).
		THIS-OBJECT:lblToolTip2:Name = "lblToolTip2".
		THIS-OBJECT:lblToolTip2:Size = NEW System.Drawing.Size(208, 184).
		THIS-OBJECT:lblToolTip2:TabIndex = 9.
		THIS-OBJECT:lblToolTip2:Text = "Click the mouse on this label to see the tooltip displayed manually via the ShowToolTip method.".
		ultraToolTipInfo1:Enabled = Infragistics.Win.DefaultableBoolean:False.
		THIS-OBJECT:ultraToolTipManager1:SetUltraToolTip(THIS-OBJECT:lblToolTip2, ultraToolTipInfo1).
		THIS-OBJECT:lblToolTip2:Click:SUBSCRIBE(THIS-OBJECT:lblToolTip2_Click).
		/*  */
		/* lblToolTip */
		/*  */
		THIS-OBJECT:lblToolTip:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance1:TextHAlignAsString = "Center".
		appearance1:TextVAlignAsString = "Middle".
		THIS-OBJECT:lblToolTip:Appearance = appearance1.
		THIS-OBJECT:lblToolTip:BorderStyleOuter = Infragistics.Win.UIElementBorderStyle:Solid.
		THIS-OBJECT:lblToolTip:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 12, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:lblToolTip:Location = NEW System.Drawing.Point(536, 7).
		THIS-OBJECT:lblToolTip:Name = "lblToolTip".
		THIS-OBJECT:lblToolTip:Size = NEW System.Drawing.Size(208, 184).
		THIS-OBJECT:lblToolTip:TabIndex = 6.
		THIS-OBJECT:lblToolTip:Text = "Hover the mouse over this label to see your tooltip. This tooltip is displayed automatically by the UltraToolTipManager by use of the UltraToolTip extender property.".
		ultraToolTipInfo18:ToolTipText = "This text will appear in the tooltip.".
		ultraToolTipInfo18:ToolTipTextFormatted = "This text will display in the tooltip when <span style=~"font-weight:bold;~">formatted</span>!".
		THIS-OBJECT:ultraToolTipManager1:SetUltraToolTip(THIS-OBJECT:lblToolTip, ultraToolTipInfo18).
		THIS-OBJECT:lblToolTip:Click:SUBSCRIBE(THIS-OBJECT:lblToolTip_Click).
		/*  */
		/* grpTooltipBehavior */
		/*  */
		THIS-OBJECT:grpTooltipBehavior:Controls:Add(THIS-OBJECT:lblToolTipTextStyle).
		THIS-OBJECT:grpTooltipBehavior:Controls:Add(THIS-OBJECT:cboToolTipTextStyle).
		THIS-OBJECT:grpTooltipBehavior:Controls:Add(THIS-OBJECT:lblOffice2007ColorScheme).
		THIS-OBJECT:grpTooltipBehavior:Controls:Add(THIS-OBJECT:cboOffice2007ColorScheme).
		THIS-OBJECT:grpTooltipBehavior:Controls:Add(THIS-OBJECT:lblDisplayStyle).
		THIS-OBJECT:grpTooltipBehavior:Controls:Add(THIS-OBJECT:cboDisplayStyle).
		THIS-OBJECT:grpTooltipBehavior:Controls:Add(THIS-OBJECT:uneAutoPopDelay).
		THIS-OBJECT:grpTooltipBehavior:Controls:Add(THIS-OBJECT:lblAutoPopDelay).
		THIS-OBJECT:grpTooltipBehavior:Controls:Add(THIS-OBJECT:uneInitialDelay).
		THIS-OBJECT:grpTooltipBehavior:Controls:Add(THIS-OBJECT:lblInitialDelay).
		THIS-OBJECT:grpTooltipBehavior:Location = NEW System.Drawing.Point(8, 7).
		THIS-OBJECT:grpTooltipBehavior:Name = "grpTooltipBehavior".
		THIS-OBJECT:grpTooltipBehavior:Size = NEW System.Drawing.Size(120, 400).
		THIS-OBJECT:grpTooltipBehavior:TabIndex = 8.
		THIS-OBJECT:grpTooltipBehavior:Text = "ToolTip Behavior".
		/*  */
		/* lblToolTipTextStyle */
		/*  */
		THIS-OBJECT:lblToolTipTextStyle:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblToolTipTextStyle:Location = NEW System.Drawing.Point(16, 256).
		THIS-OBJECT:lblToolTipTextStyle:Name = "lblToolTipTextStyle".
		THIS-OBJECT:lblToolTipTextStyle:Size = NEW System.Drawing.Size(88, 16).
		THIS-OBJECT:lblToolTipTextStyle:TabIndex = 20.
		THIS-OBJECT:lblToolTipTextStyle:Text = "TextStyle".
		/*  */
		/* lblOffice2007ColorScheme */
		/*  */
		THIS-OBJECT:lblOffice2007ColorScheme:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblOffice2007ColorScheme:Location = NEW System.Drawing.Point(16, 72).
		THIS-OBJECT:lblOffice2007ColorScheme:Name = "lblOffice2007ColorScheme".
		THIS-OBJECT:lblOffice2007ColorScheme:Size = NEW System.Drawing.Size(88, 24).
		THIS-OBJECT:lblOffice2007ColorScheme:TabIndex = 18.
		THIS-OBJECT:lblOffice2007ColorScheme:Text = "Office 2007 Color Scheme".
		/*  */
		/* cboOffice2007ColorScheme */
		/*  */
		THIS-OBJECT:cboOffice2007ColorScheme:DropDownStyle = Infragistics.Win.DropDownStyle:DropDownList.
		THIS-OBJECT:cboOffice2007ColorScheme:Location = NEW System.Drawing.Point(16, 104).
		THIS-OBJECT:cboOffice2007ColorScheme:Name = "cboOffice2007ColorScheme".
		THIS-OBJECT:cboOffice2007ColorScheme:Size = NEW System.Drawing.Size(88, 21).
		THIS-OBJECT:cboOffice2007ColorScheme:SyncWithCurrencyManager = FALSE.
		THIS-OBJECT:cboOffice2007ColorScheme:TabIndex = 17.
		THIS-OBJECT:cboOffice2007ColorScheme:ValueChanged:SUBSCRIBE(THIS-OBJECT:cboOffice2007ColorScheme_ValueChanged).
		/*  */
		/* lblDisplayStyle */
		/*  */
		THIS-OBJECT:lblDisplayStyle:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblDisplayStyle:Location = NEW System.Drawing.Point(16, 24).
		THIS-OBJECT:lblDisplayStyle:Name = "lblDisplayStyle".
		THIS-OBJECT:lblDisplayStyle:Size = NEW System.Drawing.Size(88, 16).
		THIS-OBJECT:lblDisplayStyle:TabIndex = 16.
		THIS-OBJECT:lblDisplayStyle:Text = "DisplayStyle".
		/*  */
		/* lblAutoPopDelay */
		/*  */
		THIS-OBJECT:lblAutoPopDelay:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblAutoPopDelay:Location = NEW System.Drawing.Point(16, 200).
		THIS-OBJECT:lblAutoPopDelay:Name = "lblAutoPopDelay".
		THIS-OBJECT:lblAutoPopDelay:Size = NEW System.Drawing.Size(88, 16).
		THIS-OBJECT:lblAutoPopDelay:TabIndex = 7.
		THIS-OBJECT:lblAutoPopDelay:Text = "AutoPop Delay".
		/*  */
		/* lblInitialDelay */
		/*  */
		THIS-OBJECT:lblInitialDelay:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblInitialDelay:Location = NEW System.Drawing.Point(16, 144).
		THIS-OBJECT:lblInitialDelay:Name = "lblInitialDelay".
		THIS-OBJECT:lblInitialDelay:Size = NEW System.Drawing.Size(88, 16).
		THIS-OBJECT:lblInitialDelay:TabIndex = 5.
		THIS-OBJECT:lblInitialDelay:Text = "Initial Delay".
		/*  */
		/* grpToolTipAppearance */
		/*  */
		THIS-OBJECT:grpToolTipAppearance:Controls:Add(THIS-OBJECT:lblHatchStyle).
		THIS-OBJECT:grpToolTipAppearance:Controls:Add(THIS-OBJECT:cboHatchStyle).
		THIS-OBJECT:grpToolTipAppearance:Controls:Add(THIS-OBJECT:lblGradientStyle).
		THIS-OBJECT:grpToolTipAppearance:Controls:Add(THIS-OBJECT:cboGradientStyle).
		THIS-OBJECT:grpToolTipAppearance:Controls:Add(THIS-OBJECT:lblBackColor2).
		THIS-OBJECT:grpToolTipAppearance:Controls:Add(THIS-OBJECT:ucpBackColor2).
		THIS-OBJECT:grpToolTipAppearance:Controls:Add(THIS-OBJECT:lblBackColor).
		THIS-OBJECT:grpToolTipAppearance:Controls:Add(THIS-OBJECT:ucpBackColor).
		THIS-OBJECT:grpToolTipAppearance:Controls:Add(THIS-OBJECT:lblToolTipBorderColor).
		THIS-OBJECT:grpToolTipAppearance:Controls:Add(THIS-OBJECT:ucpToolTipBorderColor).
		THIS-OBJECT:grpToolTipAppearance:Controls:Add(THIS-OBJECT:lblForeColor).
		THIS-OBJECT:grpToolTipAppearance:Controls:Add(THIS-OBJECT:ucpForeColor).
		THIS-OBJECT:grpToolTipAppearance:Controls:Add(THIS-OBJECT:ucpTitleForeColor).
		THIS-OBJECT:grpToolTipAppearance:Controls:Add(THIS-OBJECT:lblTitleForeColor).
		THIS-OBJECT:grpToolTipAppearance:Location = NEW System.Drawing.Point(320, 7).
		THIS-OBJECT:grpToolTipAppearance:Name = "grpToolTipAppearance".
		THIS-OBJECT:grpToolTipAppearance:Size = NEW System.Drawing.Size(208, 400).
		THIS-OBJECT:grpToolTipAppearance:TabIndex = 7.
		THIS-OBJECT:grpToolTipAppearance:Text = "ToolTip Appearance".
		/*  */
		/* lblHatchStyle */
		/*  */
		THIS-OBJECT:lblHatchStyle:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblHatchStyle:Location = NEW System.Drawing.Point(16, 224).
		THIS-OBJECT:lblHatchStyle:Name = "lblHatchStyle".
		THIS-OBJECT:lblHatchStyle:Size = NEW System.Drawing.Size(176, 16).
		THIS-OBJECT:lblHatchStyle:TabIndex = 12.
		THIS-OBJECT:lblHatchStyle:Text = "Hatch Style".
		/*  */
		/* lblGradientStyle */
		/*  */
		THIS-OBJECT:lblGradientStyle:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblGradientStyle:Location = NEW System.Drawing.Point(16, 176).
		THIS-OBJECT:lblGradientStyle:Name = "lblGradientStyle".
		THIS-OBJECT:lblGradientStyle:Size = NEW System.Drawing.Size(176, 16).
		THIS-OBJECT:lblGradientStyle:TabIndex = 10.
		THIS-OBJECT:lblGradientStyle:Text = "Gradient Style".
		/*  */
		/* lblBackColor2 */
		/*  */
		THIS-OBJECT:lblBackColor2:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblBackColor2:Location = NEW System.Drawing.Point(16, 128).
		THIS-OBJECT:lblBackColor2:Name = "lblBackColor2".
		THIS-OBJECT:lblBackColor2:Size = NEW System.Drawing.Size(176, 16).
		THIS-OBJECT:lblBackColor2:TabIndex = 9.
		THIS-OBJECT:lblBackColor2:Text = "BackColor2".
		/*  */
		/* lblBackColor */
		/*  */
		THIS-OBJECT:lblBackColor:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblBackColor:Location = NEW System.Drawing.Point(16, 80).
		THIS-OBJECT:lblBackColor:Name = "lblBackColor".
		THIS-OBJECT:lblBackColor:Size = NEW System.Drawing.Size(176, 16).
		THIS-OBJECT:lblBackColor:TabIndex = 7.
		THIS-OBJECT:lblBackColor:Text = "BackColor".
		/*  */
		/* lblToolTipBorderColor */
		/*  */
		THIS-OBJECT:lblToolTipBorderColor:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblToolTipBorderColor:Location = NEW System.Drawing.Point(16, 288).
		THIS-OBJECT:lblToolTipBorderColor:Name = "lblToolTipBorderColor".
		THIS-OBJECT:lblToolTipBorderColor:Size = NEW System.Drawing.Size(176, 16).
		THIS-OBJECT:lblToolTipBorderColor:TabIndex = 5.
		THIS-OBJECT:lblToolTipBorderColor:Text = "BorderColor".
		/*  */
		/* lblForeColor */
		/*  */
		THIS-OBJECT:lblForeColor:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblForeColor:Location = NEW System.Drawing.Point(16, 24).
		THIS-OBJECT:lblForeColor:Name = "lblForeColor".
		THIS-OBJECT:lblForeColor:Size = NEW System.Drawing.Size(176, 16).
		THIS-OBJECT:lblForeColor:TabIndex = 3.
		THIS-OBJECT:lblForeColor:Text = "ForeColor".
		/*  */
		/* lblTitleForeColor */
		/*  */
		THIS-OBJECT:lblTitleForeColor:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblTitleForeColor:Location = NEW System.Drawing.Point(16, 352).
		THIS-OBJECT:lblTitleForeColor:Name = "lblTitleForeColor".
		THIS-OBJECT:lblTitleForeColor:Size = NEW System.Drawing.Size(176, 16).
		THIS-OBJECT:lblTitleForeColor:TabIndex = 3.
		THIS-OBJECT:lblTitleForeColor:Text = "Title ForeColor".
		/*  */
		/* grpToolTipContents */
		/*  */
		THIS-OBJECT:grpToolTipContents:Controls:Add(THIS-OBJECT:fteFormattedToolTipText).
		THIS-OBJECT:grpToolTipContents:Controls:Add(THIS-OBJECT:lblToolTipTextFormatted).
		THIS-OBJECT:grpToolTipContents:Controls:Add(THIS-OBJECT:lblImage).
		THIS-OBJECT:grpToolTipContents:Controls:Add(THIS-OBJECT:txtTitle).
		THIS-OBJECT:grpToolTipContents:Controls:Add(THIS-OBJECT:lbCustomImage).
		THIS-OBJECT:grpToolTipContents:Controls:Add(THIS-OBJECT:lblText).
		THIS-OBJECT:grpToolTipContents:Controls:Add(THIS-OBJECT:cboImage).
		THIS-OBJECT:grpToolTipContents:Controls:Add(THIS-OBJECT:txtCustomImage).
		THIS-OBJECT:grpToolTipContents:Controls:Add(THIS-OBJECT:lblTitle).
		THIS-OBJECT:grpToolTipContents:Controls:Add(THIS-OBJECT:txtText).
		THIS-OBJECT:grpToolTipContents:Location = NEW System.Drawing.Point(136, 7).
		THIS-OBJECT:grpToolTipContents:Name = "grpToolTipContents".
		THIS-OBJECT:grpToolTipContents:Size = NEW System.Drawing.Size(176, 400).
		THIS-OBJECT:grpToolTipContents:TabIndex = 5.
		THIS-OBJECT:grpToolTipContents:Text = "ToolTip Contents".
		/*  */
		/* lblToolTipTextFormatted */
		/*  */
		THIS-OBJECT:lblToolTipTextFormatted:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblToolTipTextFormatted:Location = NEW System.Drawing.Point(16, 128).
		THIS-OBJECT:lblToolTipTextFormatted:Name = "lblToolTipTextFormatted".
		THIS-OBJECT:lblToolTipTextFormatted:Size = NEW System.Drawing.Size(144, 16).
		THIS-OBJECT:lblToolTipTextFormatted:TabIndex = 15.
		THIS-OBJECT:lblToolTipTextFormatted:Text = "Formatted ToolTip Text".
		/*  */
		/* lblImage */
		/*  */
		THIS-OBJECT:lblImage:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblImage:Location = NEW System.Drawing.Point(16, 304).
		THIS-OBJECT:lblImage:Name = "lblImage".
		THIS-OBJECT:lblImage:Size = NEW System.Drawing.Size(144, 16).
		THIS-OBJECT:lblImage:TabIndex = 6.
		THIS-OBJECT:lblImage:Text = "ToolTip Image".
		/*  */
		/* lbCustomImage */
		/*  */
		THIS-OBJECT:lbCustomImage:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lbCustomImage:Location = NEW System.Drawing.Point(16, 352).
		THIS-OBJECT:lbCustomImage:Name = "lbCustomImage".
		THIS-OBJECT:lbCustomImage:Size = NEW System.Drawing.Size(144, 16).
		THIS-OBJECT:lbCustomImage:TabIndex = 9.
		THIS-OBJECT:lbCustomImage:Text = "Custom Image".
		/*  */
		/* lblText */
		/*  */
		THIS-OBJECT:lblText:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblText:Location = NEW System.Drawing.Point(16, 24).
		THIS-OBJECT:lblText:Name = "lblText".
		THIS-OBJECT:lblText:Size = NEW System.Drawing.Size(144, 16).
		THIS-OBJECT:lblText:TabIndex = 2.
		THIS-OBJECT:lblText:Text = "ToolTip Text".
		/*  */
		/* lblTitle */
		/*  */
		THIS-OBJECT:lblTitle:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lblTitle:Location = NEW System.Drawing.Point(16, 232).
		THIS-OBJECT:lblTitle:Name = "lblTitle".
		THIS-OBJECT:lblTitle:Size = NEW System.Drawing.Size(144, 16).
		THIS-OBJECT:lblTitle:TabIndex = 4.
		THIS-OBJECT:lblTitle:Text = "ToolTip Title".
		/*  */
		/* frmUltraToolTipsBasicFeatures */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(752, 414).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:lblToolTip2).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:grpTooltipBehavior).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:grpToolTipAppearance).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:grpToolTipContents).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:lblToolTip).
		THIS-OBJECT:Name = "frmUltraToolTipsBasicFeatures".
		THIS-OBJECT:Text = "UltraToolTips Basic Features".
		THIS-OBJECT:Load:SUBSCRIBE(THIS-OBJECT:frmUltraToolTipsBasicFeatures_Load).
		CAST(THIS-OBJECT:cboToolTipTextStyle, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:cboDisplayStyle, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:uneAutoPopDelay, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:uneInitialDelay, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:cboHatchStyle, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:cboGradientStyle, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ucpBackColor2, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ucpBackColor, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ucpToolTipBorderColor, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ucpForeColor, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ucpTitleForeColor, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:txtTitle, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:cboImage, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:txtCustomImage, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:txtText, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:grpTooltipBehavior, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:grpTooltipBehavior:ResumeLayout(FALSE).
		THIS-OBJECT:grpTooltipBehavior:PerformLayout().
		CAST(THIS-OBJECT:cboOffice2007ColorScheme, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:grpToolTipAppearance, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:grpToolTipAppearance:ResumeLayout(FALSE).
		THIS-OBJECT:grpToolTipAppearance:PerformLayout().
		CAST(THIS-OBJECT:grpToolTipContents, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:grpToolTipContents:ResumeLayout(FALSE).
		THIS-OBJECT:grpToolTipContents:PerformLayout().
		THIS-OBJECT:ResumeLayout(FALSE).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cboDisplayStyle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE uce AS UltraComboEditor NO-UNDO.
	  DEFINE VARIABLE toolTipDisplayStyle AS ToolTipDisplayStyle NO-UNDO.
	  
	  
	  uce = CAST(sender, UltraComboEditor).
	  toolTipDisplayStyle= CAST(uce:VALUE, ToolTipDisplayStyle).
	  THIS-OBJECT:ultraToolTipManager1:DisplayStyle = toolTipDisplayStyle.
	  
      /* enums cannot be comapred directly. Compare either the string values - as shown in the CASE example         */
      /* or use EnumHelper:AreEqueal() as in the following IF expression -                                          */
      /* IF Progress.Util.EnumHelper:AreEqual(toolTipDisplayStyle, Infragistics.Win.ToolTipDisplayStyle:Office2007 )*/
	  CASE (toolTipDisplayStyle:ToString()):
	    WHEN Infragistics.Win.ToolTipDisplayStyle:Office2007:ToString() THEN DO:
	      THIS-OBJECT:cboOffice2007ColorScheme:Enabled = TRUE.
	    END.
	    WHEN Infragistics.Win.ToolTipDisplayStyle:BalloonTip:ToString() OR 
	    WHEN Infragistics.Win.ToolTipDisplayStyle:Standard:ToString() THEN DO:
	      THIS-OBJECT:cboOffice2007ColorScheme:Enabled = FALSE.
	    END.  
	    OTHERWISE THIS-OBJECT:cboOffice2007ColorScheme:Enabled = FALSE.
	  END CASE.
	  
	  RETURN.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cboGradientStyle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE uce AS UltraComboEditor NO-UNDO.
	  DEFINE VARIABLE gradientStyle AS GradientStyle NO-UNDO.
	  
	  uce = CAST(sender, UltraComboEditor).
	  gradientStyle = CAST(uce:Value, GradientStyle).			
	  THIS-OBJECT:ultraToolTipManager1:Appearance:BackGradientStyle = gradientStyle.
	  
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cboHatchStyle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	
	  DEFINE VARIABLE uce AS UltraComboEditor NO-UNDO.
	  DEFINE VARIABLE backHatchStyle AS BackHatchStyle NO-UNDO.
	  
	  uce = CAST(sender, UltraComboEditor).
	  backHatchStyle = CAST(uce:Value, BackHatchStyle).			
	  THIS-OBJECT:ultraToolTipManager1:Appearance:BackHatchStyle = backHatchStyle.
	
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cboImage_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE uce AS UltraComboEditor NO-UNDO.
	  DEFINE VARIABLE toolTipImage AS ToolTipImage NO-UNDO.
	  
	  uce = CAST(sender, UltraComboEditor).
	  toolTipImage = CAST(uce:Value, ToolTipImage).			
	  
	  THIS-OBJECT:ultraToolTipManager1:ToolTipImage = toolTipImage.

	  CASE (toolTipImage):
	    WHEN Infragistics.Win.ToolTipImage:NONE OR 
	    WHEN Infragistics.Win.ToolTipImage:ERROR OR 
	    WHEN Infragistics.Win.ToolTipImage:INFO OR
        WHEN Infragistics.Win.ToolTipImage:WARNING THEN DO:
          THIS-OBJECT:txtCustomImage:Enabled = FALSE.
        END.
        WHEN Infragistics.Win.ToolTipImage:Custom THEN THIS-OBJECT:txtCustomImage:Enabled = TRUE.
        OTHERWISE THIS-OBJECT:txtCustomImage:Enabled = TRUE.
      END CASE.
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cboOffice2007ColorScheme_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):

	  DEFINE VARIABLE uce AS UltraComboEditor NO-UNDO.
	  DEFINE VARIABLE office2007ColorScheme AS Office2007ColorScheme NO-UNDO.
	  
	  uce = CAST(sender, UltraComboEditor).
	  office2007ColorScheme = CAST(uce:Value, Office2007ColorScheme).			
	  
	  Infragistics.Win.Office2007ColorTable:ColorScheme = office2007ColorScheme.


	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cboToolTipTextStyle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):

	  DEFINE VARIABLE uce AS UltraComboEditor NO-UNDO.
	  DEFINE VARIABLE toolTipTextStyle AS ToolTipTextStyle NO-UNDO.
	  
	  uce = CAST(sender, UltraComboEditor).
	  toolTipTextStyle = CAST(uce:Value, ToolTipTextStyle).			
	  
	  THIS-OBJECT:ultraToolTipManager1:ToolTipTextStyle = toolTipTextStyle.
	  
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID chkBaloonTips_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE cb AS UltraCheckEditor NO-UNDO.
	  
	  cb = CAST(sender, UltraCheckEditor).
	  IF (cb:Checked) THEN THIS-OBJECT:ultraToolTipManager1:DisplayStyle = ToolTipDisplayStyle:BalloonTip.
	  ELSE THIS-OBJECT:ultraToolTipManager1:DisplayStyle = ToolTipDisplayStyle:Standard.
	  RETURN.
	END METHOD.	

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	METHOD PUBLIC STATIC  VOID FillComboFromEnum(INPUT combo AS UltraComboEditor, INPUT enumValue AS System.Enum  ):
		FillComboFromEnum( combo, enumValue, TRUE ).
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	METHOD PUBLIC STATIC  VOID FillComboFromEnum(INPUT combo AS UltraComboEditor, INPUT enumValue AS System.Enum, INPUT setDefaultValue AS LOGICAL  ):
      DEFINE VARIABLE enumValues AS System.Array NO-UNDO.
      DEFINE VARIABLE singleEnum AS System.Object NO-UNDO.
      DEFINE VARIABLE eValues AS System.Collections.IEnumerator NO-UNDO.
      
	  combo:Items:Clear().
	  enumValues = System.Enum:GetValues(enumValue:GetType()).
	  eValues = enumValues:GetEnumerator().
	  REPEAT:
	    IF NOT eValues:MoveNext() THEN LEAVE.
	    singleEnum = eValues:CURRENT.
	    combo:Items:Add(singleEnum).
	  END.  

	  IF ( setDefaultValue ) THEN combo:Value = enumValue.
	  RETURN.			
    END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID frmUltraToolTipsBasicFeatures_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
      /* Populate ComboBoxes and default values and such. */
	  THIS-OBJECT:InitializeUI().
	  
	  RETURN.

	END METHOD.


	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	
	METHOD PRIVATE VOID InitializeUI(  ):
      /* Populate ComboBoxes */
      frmUltraToolTipsBasicFeatures:FillComboFromEnum(THIS-OBJECT:cboGradientStyle, GradientStyle:Default).
      frmUltraToolTipsBasicFeatures:FillComboFromEnum(THIS-OBJECT:cboHatchStyle, BackHatchStyle:Default).
	  frmUltraToolTipsBasicFeatures:FillComboFromEnum(THIS-OBJECT:cboImage, ToolTipImage:Default).
	  frmUltraToolTipsBasicFeatures:FillComboFromEnum(THIS-OBJECT:cboDisplayStyle, ToolTipDisplayStyle:Default).
	  frmUltraToolTipsBasicFeatures:FillComboFromEnum(THIS-OBJECT:cboOffice2007ColorScheme, Office2007ColorScheme:Blue).
	  frmUltraToolTipsBasicFeatures:FillComboFromEnum(THIS-OBJECT:cboToolTipTextStyle, ToolTipTextStyle:Default).

      /* Set the default empty colors */
	  THIS-OBJECT:ucpBackColor:DefaultColor = Color:EMPTY.
	  THIS-OBJECT:ucpBackColor:Color = Color:EMPTY.
	  THIS-OBJECT:ucpBackColor2:DefaultColor = Color:EMPTY.
	  THIS-OBJECT:ucpBackColor2:Color = Color:EMPTY.
	  THIS-OBJECT:ucpTitleForeColor:DefaultColor = Color:EMPTY.
	  THIS-OBJECT:ucpTitleForeColor:Color = Color:EMPTY.
	  THIS-OBJECT:ucpForeColor:DefaultColor = Color:EMPTY.
	  THIS-OBJECT:ucpForeColor:Color = Color:EMPTY.
	  THIS-OBJECT:ucpToolTipBorderColor:DefaultColor = Color:EMPTY.
	  THIS-OBJECT:ucpToolTipBorderColor:Color = Color:EMPTY.
		
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID fteFormattedToolTipText_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE fte AS UltraFormattedTextEditor NO-UNDO.
	  DEFINE VARIABLE toolTipInfo AS UltraToolTipInfo NO-UNDO.
	  fte = CAST (sender, UltraFormattedTextEditor).
		
      /* Get the ULtraToolTipInfo for the label */
      toolTipInfo = THIS-OBJECT:ultraToolTipManager1:GetUltraToolTip(this-object:lblToolTip).

      IF (fte:Value <> ?) THEN 
        toolTipInfo:ToolTipTextFormatted = fte:Value:ToString().
      ELSE toolTipInfo:ToolTipTextFormatted = ?.
      
      RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID lblToolTip_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE tooltipInfo AS UltraToolTipInfo NO-UNDO.
      /* Get the UltraToolTipInfo for the label */
      tooltipInfo = THIS-OBJECT:ultraToolTipManager1:GetUltraToolTip(THIS-OBJECT:lblToolTip2).

      /* Set the ToolTipText */
      tooltipInfo:ToolTipText = this-object:txtText:Text.

      /* Set the ToolTipTextFormatted */
      IF (THIS-OBJECT:fteFormattedToolTipText:Value <> ?) THEN 
        tooltipInfo:ToolTipTextFormatted = THIS-OBJECT:fteFormattedToolTipText:Value:ToString().
      ELSE tooltipInfo:ToolTipTextFormatted = ?.

      /* Show the tooltip. */
	  THIS-OBJECT:ultraToolTipManager1:ShowToolTip(this-object:lblToolTip2).		
	  
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID openFileDialog1_FileOk( INPUT sender AS System.Object, INPUT e AS System.ComponentModel.CancelEventArgs ):
	  DEFINE VARIABLE ofd AS OpenFileDialog NO-UNDO.
	  DEFINE VARIABLE img AS Image NO-UNDO.
	  DEFINE VARIABLE errorString AS CHARACTER NO-UNDO.
	  
	  ofd = CAST(sender, OpenFileDialog).
	  DO ON ERROR UNDO, LEAVE:
	    img = Image:FromFile(ofd:FileName).
	    THIS-OBJECT:ultraToolTipManager1:Appearance:Image = img.
	    THIS-OBJECT:txtCustomImage:Text = ofd:FILENAME.
	    
		CATCH ex AS System.Exception :
	      errorString = "Could not load image." + "~n" +  ex:GetMessage(1).
		  MESSAGE errorString VIEW-AS ALERT-BOX Error BUTTONS OK TITLE "Error".
        		
        END CATCH. 
      END.  
		
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID txtCustomImage_EditorButtonClick( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinEditors.EditorButtonEventArgs ):
	  WAIT-FOR THIS-OBJECT:openFileDialog1:ShowDialog(THIS-OBJECT).
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID txtText_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE ute AS UltraTextEditor NO-UNDO.
	  DEFINE VARIABLE toolTipInfo AS UltraToolTipInfo NO-UNDO.
	  
	  ute = CAST(sender, UltraTextEditor).

      /* Get the ULtraToolTipInfo for the label */
      toolTipInfo = THIS-OBJECT:ultraToolTipManager1:GetUltraToolTip(THIS-OBJECT:lblToolTip).
      
      /* Set the ToolTipText */
      toolTipInfo:ToolTipText = ute:TEXT.
      
      RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID txtTitle_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE ute AS UltraTextEditor NO-UNDO.
	  
	  ute = CAST(sender, UltraTextEditor).			
	  THIS-OBJECT:ultraToolTipManager1:ToolTipTitle = ute:Text.
	  
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ucpBackColor_ColorChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ucpBackColor_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE ucp AS UltraColorPicker NO-UNDO.
	  
	  ucp = CAST(sender, UltraColorPicker).			
	  THIS-OBJECT:ultraToolTipManager1:Appearance:BackColor = ucp:COLOR.
		
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ucpBackColor2_ColorChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):

	  DEFINE VARIABLE ucp AS UltraColorPicker NO-UNDO.
	  
	  ucp = CAST(sender, UltraColorPicker).			
	  THIS-OBJECT:ultraToolTipManager1:Appearance:BackColor2 = ucp:COLOR.
		
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ucpForeColor_ColorChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE ucp AS UltraColorPicker NO-UNDO.
	  
	  ucp = CAST(sender, UltraColorPicker).			
	  THIS-OBJECT:ultraToolTipManager1:Appearance:ForeColor = ucp:COLOR.
		
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ucpTitleForeColor_ColorChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE ucp AS UltraColorPicker NO-UNDO.
	  
	  ucp = CAST(sender, UltraColorPicker).			
	  THIS-OBJECT:ultraToolTipManager1:ToolTipTitleAppearance:ForeColor  = ucp:COLOR.
	  
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ucpToolTipBorderColor_ColorChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE ucp AS UltraColorPicker NO-UNDO.
	  
	  ucp = CAST(sender, UltraColorPicker).			
	  THIS-OBJECT:ultraToolTipManager1:Appearance:BorderColor = ucp:COLOR.
	  RETURN.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID uneAutoPopDelay_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE une AS UltraNumericEditor NO-UNDO.
	  
	  une = CAST(sender, UltraNumericEditor).
	  THIS-OBJECT:ultraToolTipManager1:AutoPopDelay = une:VALUE.
		
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID uneInitialDelay_ValueChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE une AS UltraNumericEditor NO-UNDO.
	  une = CAST(sender, UltraNumericEditor).
	  THIS-OBJECT:ultraToolTipManager1:InitialDelay = une:VALUE.
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID lblToolTip2_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE tooltipInfo AS UltraToolTipInfo NO-UNDO.
      /* Get the UltraToolTipInfo for the label */
      tooltipInfo = THIS-OBJECT:ultraToolTipManager1:GetUltraToolTip(THIS-OBJECT:lblToolTip2).

      /* Set the ToolTipText */
      tooltipInfo:ToolTipText = THIS-OBJECT:txtText:Text.

      /* Set the ToolTipTextFormatted */
      IF (THIS-OBJECT:fteFormattedToolTipText:Value <> ?) THEN 
        tooltipInfo:ToolTipTextFormatted = THIS-OBJECT:fteFormattedToolTipText:Value:ToString().
	  ELSE tooltipInfo:ToolTipTextFormatted = ?.

      /* Show the tooltip. */
      THIS-OBJECT:ultraToolTipManager1:ShowToolTip(THIS-OBJECT:lblToolTip2).		
		
      RETURN.

	END METHOD.
 
 
END CLASS.