 
 /*------------------------------------------------------------------------
    File        : FormSpinWrap
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Fri May 16 18:01:23 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

USING Infragistics.Win.*.
USING Infragistics.Win.UltraWinEditors.*.
USING Infragistics.Win.UltraWinEditors.*.
USING Infragistics.Win.UltraWinSchedule.*.
USING Infragistics.Win.UltraWinMaskedEdit.*.
USING Infragistics.Win.SpinButtonDisplayStyle.

CLASS WinEditors.SpinWrap.FormSpinWrap INHERITS Form   : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.


	DEFINE PRIVATE VARIABLE toolTip1 AS System.Windows.Forms.ToolTip NO-UNDO.
	DEFINE PRIVATE VARIABLE label10 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label6 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label7 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE lblMaxUltraCalendarCombo AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE lblMinUltraCalendarCombo AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE lblMaxUltraMaskedEdit AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE lblMinUltraMaskedEdit AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE lblMaxUltraDateTimeEditor AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE lblMinUltraDateTimeEditor AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE lblMaxUltraCurrencyEditor AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE lblMinUltraCurrencyEditor AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE lblMaxUltraNumericEditor AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE lblMinUltraNumericEditor AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label5 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label4 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label3 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label2 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label1 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraCalendarCombo1 AS Infragistics.Win.UltraWinSchedule.UltraCalendarCombo NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraMaskedEdit1 AS Infragistics.Win.UltraWinMaskedEdit.UltraMaskedEdit NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraDateTimeEditor1 AS Infragistics.Win.UltraWinEditors.UltraDateTimeEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraNumericEditor1 AS Infragistics.Win.UltraWinEditors.UltraNumericEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraCurrencyEditor1 AS Infragistics.Win.UltraWinEditors.UltraCurrencyEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE ckUltraCalendarCombo AS Infragistics.Win.UltraWinEditors.UltraCheckEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE ckUltraMaskedEdit AS Infragistics.Win.UltraWinEditors.UltraCheckEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE ckUltraDateTimeEditor AS Infragistics.Win.UltraWinEditors.UltraCheckEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE ckUltraCurrencyEditor AS Infragistics.Win.UltraWinEditors.UltraCheckEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE ckUltraNumericEditor AS Infragistics.Win.UltraWinEditors.UltraCheckEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBox1 AS Infragistics.Win.Misc.UltraExpandableGroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBoxPanel1 AS Infragistics.Win.Misc.UltraExpandableGroupBoxPanel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraNumericEditorMax AS Infragistics.Win.UltraWinEditors.UltraNumericEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE label19 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label20 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraNumericEditorMin AS Infragistics.Win.UltraWinEditors.UltraNumericEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBox2 AS Infragistics.Win.Misc.UltraExpandableGroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBoxPanel2 AS Infragistics.Win.Misc.UltraExpandableGroupBoxPanel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraCurrencyEditorMax AS Infragistics.Win.UltraWinEditors.UltraCurrencyEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraCurrencyEditorMin AS Infragistics.Win.UltraWinEditors.UltraCurrencyEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE label21 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label22 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBox3 AS Infragistics.Win.Misc.UltraExpandableGroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBoxPanel3 AS Infragistics.Win.Misc.UltraExpandableGroupBoxPanel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraDateTimeEditorMax AS Infragistics.Win.UltraWinEditors.UltraDateTimeEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraDateTimeEditorMin AS Infragistics.Win.UltraWinEditors.UltraDateTimeEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE label23 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label24 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBox4 AS Infragistics.Win.Misc.UltraExpandableGroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBoxPanel4 AS Infragistics.Win.Misc.UltraExpandableGroupBoxPanel NO-UNDO.
	DEFINE PRIVATE VARIABLE maskedEditMax AS Infragistics.Win.UltraWinEditors.UltraDateTimeEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE maskedEditMin AS Infragistics.Win.UltraWinEditors.UltraDateTimeEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE label25 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label26 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBox5 AS Infragistics.Win.Misc.UltraExpandableGroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraExpandableGroupBoxPanel5 AS Infragistics.Win.Misc.UltraExpandableGroupBoxPanel NO-UNDO.
	DEFINE PRIVATE VARIABLE calendarComboMax AS Infragistics.Win.UltraWinEditors.UltraDateTimeEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE calendarComboMin AS Infragistics.Win.UltraWinEditors.UltraDateTimeEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE label27 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label28 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraCalendarInfo1 AS Infragistics.Win.UltraWinSchedule.UltraCalendarInfo NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabelSummary AS Infragistics.Win.Misc.UltraLabel NO-UNDO.

    DEFINE PRIVATE VARIABLE spinnableControlsInitialized AS LOGICAL INITIAL FALSE NO-UNDO.

	CONSTRUCTOR PUBLIC FormSpinWrap (  ):
		
		SUPER().
		InitializeComponent ( ).

	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC FormSpinWrap ( ):

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
		DEFINE VARIABLE dateButton1 AS Infragistics.Win.UltraWinSchedule.CalendarCombo.DateButton NO-UNDO.
		dateButton1 = NEW Infragistics.Win.UltraWinSchedule.CalendarCombo.DateButton().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance1 AS Infragistics.Win.Appearance NO-UNDO.
		appearance1 = NEW Infragistics.Win.Appearance().
		THIS-OBJECT:toolTip1 = NEW System.Windows.Forms.ToolTip(THIS-OBJECT:components).
		THIS-OBJECT:label10 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:label6 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:label7 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:lblMaxUltraCalendarCombo = NEW System.Windows.Forms.Label().
		THIS-OBJECT:lblMinUltraCalendarCombo = NEW System.Windows.Forms.Label().
		THIS-OBJECT:lblMaxUltraMaskedEdit = NEW System.Windows.Forms.Label().
		THIS-OBJECT:lblMinUltraMaskedEdit = NEW System.Windows.Forms.Label().
		THIS-OBJECT:lblMaxUltraDateTimeEditor = NEW System.Windows.Forms.Label().
		THIS-OBJECT:lblMinUltraDateTimeEditor = NEW System.Windows.Forms.Label().
		THIS-OBJECT:lblMaxUltraCurrencyEditor = NEW System.Windows.Forms.Label().
		THIS-OBJECT:lblMinUltraCurrencyEditor = NEW System.Windows.Forms.Label().
		THIS-OBJECT:lblMaxUltraNumericEditor = NEW System.Windows.Forms.Label().
		THIS-OBJECT:lblMinUltraNumericEditor = NEW System.Windows.Forms.Label().
		THIS-OBJECT:label5 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:label4 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:label3 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:label2 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:label1 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:ultraCalendarCombo1 = NEW Infragistics.Win.UltraWinSchedule.UltraCalendarCombo().
		THIS-OBJECT:ultraMaskedEdit1 = NEW Infragistics.Win.UltraWinMaskedEdit.UltraMaskedEdit().
		THIS-OBJECT:ultraDateTimeEditor1 = NEW Infragistics.Win.UltraWinEditors.UltraDateTimeEditor().
		THIS-OBJECT:ultraNumericEditor1 = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
		THIS-OBJECT:ultraCurrencyEditor1 = NEW Infragistics.Win.UltraWinEditors.UltraCurrencyEditor().
		THIS-OBJECT:ckUltraCalendarCombo = NEW Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		THIS-OBJECT:ckUltraMaskedEdit = NEW Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		THIS-OBJECT:ckUltraDateTimeEditor = NEW Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		THIS-OBJECT:ckUltraCurrencyEditor = NEW Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		THIS-OBJECT:ckUltraNumericEditor = NEW Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		THIS-OBJECT:ultraExpandableGroupBox1 = NEW Infragistics.Win.Misc.UltraExpandableGroupBox().
		THIS-OBJECT:ultraExpandableGroupBoxPanel1 = NEW Infragistics.Win.Misc.UltraExpandableGroupBoxPanel().
		THIS-OBJECT:ultraNumericEditorMax = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
		THIS-OBJECT:label19 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:label20 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:ultraNumericEditorMin = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
		THIS-OBJECT:ultraExpandableGroupBox2 = NEW Infragistics.Win.Misc.UltraExpandableGroupBox().
		THIS-OBJECT:ultraExpandableGroupBoxPanel2 = NEW Infragistics.Win.Misc.UltraExpandableGroupBoxPanel().
		THIS-OBJECT:ultraCurrencyEditorMax = NEW Infragistics.Win.UltraWinEditors.UltraCurrencyEditor().
		THIS-OBJECT:ultraCurrencyEditorMin = NEW Infragistics.Win.UltraWinEditors.UltraCurrencyEditor().
		THIS-OBJECT:label21 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:label22 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:ultraExpandableGroupBox3 = NEW Infragistics.Win.Misc.UltraExpandableGroupBox().
		THIS-OBJECT:ultraExpandableGroupBoxPanel3 = NEW Infragistics.Win.Misc.UltraExpandableGroupBoxPanel().
		THIS-OBJECT:ultraDateTimeEditorMax = NEW Infragistics.Win.UltraWinEditors.UltraDateTimeEditor().
		THIS-OBJECT:ultraDateTimeEditorMin = NEW Infragistics.Win.UltraWinEditors.UltraDateTimeEditor().
		THIS-OBJECT:label23 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:label24 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:ultraExpandableGroupBox4 = NEW Infragistics.Win.Misc.UltraExpandableGroupBox().
		THIS-OBJECT:ultraExpandableGroupBoxPanel4 = NEW Infragistics.Win.Misc.UltraExpandableGroupBoxPanel().
		THIS-OBJECT:maskedEditMax = NEW Infragistics.Win.UltraWinEditors.UltraDateTimeEditor().
		THIS-OBJECT:maskedEditMin = NEW Infragistics.Win.UltraWinEditors.UltraDateTimeEditor().
		THIS-OBJECT:label25 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:label26 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:ultraExpandableGroupBox5 = NEW Infragistics.Win.Misc.UltraExpandableGroupBox().
		THIS-OBJECT:ultraExpandableGroupBoxPanel5 = NEW Infragistics.Win.Misc.UltraExpandableGroupBoxPanel().
		THIS-OBJECT:calendarComboMax = NEW Infragistics.Win.UltraWinEditors.UltraDateTimeEditor().
		THIS-OBJECT:calendarComboMin = NEW Infragistics.Win.UltraWinEditors.UltraDateTimeEditor().
		THIS-OBJECT:label27 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:label28 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:ultraCalendarInfo1 = NEW Infragistics.Win.UltraWinSchedule.UltraCalendarInfo(THIS-OBJECT:components).
		THIS-OBJECT:ultraLabelSummary = NEW Infragistics.Win.Misc.UltraLabel().
		CAST(THIS-OBJECT:ultraCalendarCombo1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraDateTimeEditor1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraNumericEditor1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraCurrencyEditor1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraExpandableGroupBox1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraExpandableGroupBox1:SuspendLayout().
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:SuspendLayout().
		CAST(THIS-OBJECT:ultraNumericEditorMax, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraNumericEditorMin, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraExpandableGroupBox2, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraExpandableGroupBox2:SuspendLayout().
		THIS-OBJECT:ultraExpandableGroupBoxPanel2:SuspendLayout().
		CAST(THIS-OBJECT:ultraCurrencyEditorMax, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraCurrencyEditorMin, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraExpandableGroupBox3, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraExpandableGroupBox3:SuspendLayout().
		THIS-OBJECT:ultraExpandableGroupBoxPanel3:SuspendLayout().
		CAST(THIS-OBJECT:ultraDateTimeEditorMax, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraDateTimeEditorMin, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraExpandableGroupBox4, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraExpandableGroupBox4:SuspendLayout().
		THIS-OBJECT:ultraExpandableGroupBoxPanel4:SuspendLayout().
		CAST(THIS-OBJECT:maskedEditMax, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:maskedEditMin, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraExpandableGroupBox5, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraExpandableGroupBox5:SuspendLayout().
		THIS-OBJECT:ultraExpandableGroupBoxPanel5:SuspendLayout().
		CAST(THIS-OBJECT:calendarComboMax, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:calendarComboMin, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* label10 */
		/*  */
		THIS-OBJECT:label10:Font = NEW System.Drawing.Font("Tahoma", 8.25, CAST(Progress.Util.EnumHelper:Or(System.Drawing.FontStyle:Bold, System.Drawing.FontStyle:Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label10:Location = NEW System.Drawing.Point(617, 106).
		THIS-OBJECT:label10:Name = "label10".
		THIS-OBJECT:label10:Size = NEW System.Drawing.Size(304, 23).
		THIS-OBJECT:label10:TabIndex = 49.
		THIS-OBJECT:label10:Text = "Set Min and Max Values:".
		THIS-OBJECT:label10:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label6 */
		/*  */
		THIS-OBJECT:label6:Font = NEW System.Drawing.Font("Tahoma", 8.25, CAST(Progress.Util.EnumHelper:Or(System.Drawing.FontStyle:Bold, System.Drawing.FontStyle:Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label6:Location = NEW System.Drawing.Point(521, 106).
		THIS-OBJECT:label6:Name = "label6".
		THIS-OBJECT:label6:Size = NEW System.Drawing.Size(72, 23).
		THIS-OBJECT:label6:TabIndex = 40.
		THIS-OBJECT:label6:Text = "Max Value:".
		THIS-OBJECT:label6:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label7 */
		/*  */
		THIS-OBJECT:label7:Font = NEW System.Drawing.Font("Tahoma", 8.25, CAST(Progress.Util.EnumHelper:Or(System.Drawing.FontStyle:Bold, System.Drawing.FontStyle:Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label7:Location = NEW System.Drawing.Point(441, 106).
		THIS-OBJECT:label7:Name = "label7".
		THIS-OBJECT:label7:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:label7:TabIndex = 34.
		THIS-OBJECT:label7:Text = "Min Value:".
		THIS-OBJECT:label7:UseCompatibleTextRendering = TRUE.
		/*  */
		/* lblMaxUltraCalendarCombo */
		/*  */
		THIS-OBJECT:lblMaxUltraCalendarCombo:Location = NEW System.Drawing.Point(529, 338).
		THIS-OBJECT:lblMaxUltraCalendarCombo:Name = "lblMaxUltraCalendarCombo".
		THIS-OBJECT:lblMaxUltraCalendarCombo:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:lblMaxUltraCalendarCombo:TabIndex = 45.
		THIS-OBJECT:lblMaxUltraCalendarCombo:Text = "Max".
		THIS-OBJECT:lblMaxUltraCalendarCombo:UseCompatibleTextRendering = TRUE.
		/*  */
		/* lblMinUltraCalendarCombo */
		/*  */
		THIS-OBJECT:lblMinUltraCalendarCombo:Location = NEW System.Drawing.Point(449, 338).
		THIS-OBJECT:lblMinUltraCalendarCombo:Name = "lblMinUltraCalendarCombo".
		THIS-OBJECT:lblMinUltraCalendarCombo:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:lblMinUltraCalendarCombo:TabIndex = 39.
		THIS-OBJECT:lblMinUltraCalendarCombo:Text = "Min".
		THIS-OBJECT:lblMinUltraCalendarCombo:UseCompatibleTextRendering = TRUE.
		/*  */
		/* lblMaxUltraMaskedEdit */
		/*  */
		THIS-OBJECT:lblMaxUltraMaskedEdit:Location = NEW System.Drawing.Point(529, 290).
		THIS-OBJECT:lblMaxUltraMaskedEdit:Name = "lblMaxUltraMaskedEdit".
		THIS-OBJECT:lblMaxUltraMaskedEdit:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:lblMaxUltraMaskedEdit:TabIndex = 44.
		THIS-OBJECT:lblMaxUltraMaskedEdit:Text = "Max".
		THIS-OBJECT:lblMaxUltraMaskedEdit:UseCompatibleTextRendering = TRUE.
		/*  */
		/* lblMinUltraMaskedEdit */
		/*  */
		THIS-OBJECT:lblMinUltraMaskedEdit:Location = NEW System.Drawing.Point(449, 290).
		THIS-OBJECT:lblMinUltraMaskedEdit:Name = "lblMinUltraMaskedEdit".
		THIS-OBJECT:lblMinUltraMaskedEdit:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:lblMinUltraMaskedEdit:TabIndex = 38.
		THIS-OBJECT:lblMinUltraMaskedEdit:Text = "Min".
		THIS-OBJECT:lblMinUltraMaskedEdit:UseCompatibleTextRendering = TRUE.
		/*  */
		/* lblMaxUltraDateTimeEditor */
		/*  */
		THIS-OBJECT:lblMaxUltraDateTimeEditor:Location = NEW System.Drawing.Point(529, 242).
		THIS-OBJECT:lblMaxUltraDateTimeEditor:Name = "lblMaxUltraDateTimeEditor".
		THIS-OBJECT:lblMaxUltraDateTimeEditor:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:lblMaxUltraDateTimeEditor:TabIndex = 43.
		THIS-OBJECT:lblMaxUltraDateTimeEditor:Text = "Max".
		THIS-OBJECT:lblMaxUltraDateTimeEditor:UseCompatibleTextRendering = TRUE.
		/*  */
		/* lblMinUltraDateTimeEditor */
		/*  */
		THIS-OBJECT:lblMinUltraDateTimeEditor:Location = NEW System.Drawing.Point(449, 242).
		THIS-OBJECT:lblMinUltraDateTimeEditor:Name = "lblMinUltraDateTimeEditor".
		THIS-OBJECT:lblMinUltraDateTimeEditor:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:lblMinUltraDateTimeEditor:TabIndex = 37.
		THIS-OBJECT:lblMinUltraDateTimeEditor:Text = "Min".
		THIS-OBJECT:lblMinUltraDateTimeEditor:UseCompatibleTextRendering = TRUE.
		/*  */
		/* lblMaxUltraCurrencyEditor */
		/*  */
		THIS-OBJECT:lblMaxUltraCurrencyEditor:Location = NEW System.Drawing.Point(529, 194).
		THIS-OBJECT:lblMaxUltraCurrencyEditor:Name = "lblMaxUltraCurrencyEditor".
		THIS-OBJECT:lblMaxUltraCurrencyEditor:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:lblMaxUltraCurrencyEditor:TabIndex = 42.
		THIS-OBJECT:lblMaxUltraCurrencyEditor:Text = "Max".
		THIS-OBJECT:lblMaxUltraCurrencyEditor:UseCompatibleTextRendering = TRUE.
		/*  */
		/* lblMinUltraCurrencyEditor */
		/*  */
		THIS-OBJECT:lblMinUltraCurrencyEditor:Location = NEW System.Drawing.Point(449, 194).
		THIS-OBJECT:lblMinUltraCurrencyEditor:Name = "lblMinUltraCurrencyEditor".
		THIS-OBJECT:lblMinUltraCurrencyEditor:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:lblMinUltraCurrencyEditor:TabIndex = 36.
		THIS-OBJECT:lblMinUltraCurrencyEditor:Text = "Min".
		THIS-OBJECT:lblMinUltraCurrencyEditor:UseCompatibleTextRendering = TRUE.
		/*  */
		/* lblMaxUltraNumericEditor */
		/*  */
		THIS-OBJECT:lblMaxUltraNumericEditor:Location = NEW System.Drawing.Point(529, 146).
		THIS-OBJECT:lblMaxUltraNumericEditor:Name = "lblMaxUltraNumericEditor".
		THIS-OBJECT:lblMaxUltraNumericEditor:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:lblMaxUltraNumericEditor:TabIndex = 41.
		THIS-OBJECT:lblMaxUltraNumericEditor:Text = "Max".
		THIS-OBJECT:lblMaxUltraNumericEditor:UseCompatibleTextRendering = TRUE.
		/*  */
		/* lblMinUltraNumericEditor */
		/*  */
		THIS-OBJECT:lblMinUltraNumericEditor:Location = NEW System.Drawing.Point(449, 146).
		THIS-OBJECT:lblMinUltraNumericEditor:Name = "lblMinUltraNumericEditor".
		THIS-OBJECT:lblMinUltraNumericEditor:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:lblMinUltraNumericEditor:TabIndex = 35.
		THIS-OBJECT:lblMinUltraNumericEditor:Text = "Min".
		THIS-OBJECT:lblMinUltraNumericEditor:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label5 */
		/*  */
		THIS-OBJECT:label5:Font = NEW System.Drawing.Font("Tahoma", 8.25, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label5:Location = NEW System.Drawing.Point(17, 338).
		THIS-OBJECT:label5:Name = "label5".
		THIS-OBJECT:label5:Size = NEW System.Drawing.Size(136, 23).
		THIS-OBJECT:label5:TabIndex = 33.
		THIS-OBJECT:label5:Text = "UltraCalendarCombo:".
		THIS-OBJECT:label5:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label4 */
		/*  */
		THIS-OBJECT:label4:Font = NEW System.Drawing.Font("Tahoma", 8.25, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label4:Location = NEW System.Drawing.Point(17, 290).
		THIS-OBJECT:label4:Name = "label4".
		THIS-OBJECT:label4:Size = NEW System.Drawing.Size(136, 23).
		THIS-OBJECT:label4:TabIndex = 32.
		THIS-OBJECT:label4:Text = "UltraMaskedEdit:".
		THIS-OBJECT:label4:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label3 */
		/*  */
		THIS-OBJECT:label3:Font = NEW System.Drawing.Font("Tahoma", 8.25, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label3:Location = NEW System.Drawing.Point(17, 242).
		THIS-OBJECT:label3:Name = "label3".
		THIS-OBJECT:label3:Size = NEW System.Drawing.Size(136, 23).
		THIS-OBJECT:label3:TabIndex = 31.
		THIS-OBJECT:label3:Text = "UltraDateTimeEditor:".
		THIS-OBJECT:label3:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label2 */
		/*  */
		THIS-OBJECT:label2:Font = NEW System.Drawing.Font("Tahoma", 8.25, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label2:Location = NEW System.Drawing.Point(17, 194).
		THIS-OBJECT:label2:Name = "label2".
		THIS-OBJECT:label2:Size = NEW System.Drawing.Size(136, 23).
		THIS-OBJECT:label2:TabIndex = 30.
		THIS-OBJECT:label2:Text = "UltraCurrencyEditor:".
		THIS-OBJECT:label2:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label1 */
		/*  */
		THIS-OBJECT:label1:Font = NEW System.Drawing.Font("Tahoma", 8.25, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label1:Location = NEW System.Drawing.Point(17, 146).
		THIS-OBJECT:label1:Name = "label1".
		THIS-OBJECT:label1:Size = NEW System.Drawing.Size(136, 23).
		THIS-OBJECT:label1:TabIndex = 29.
		THIS-OBJECT:label1:Text = "UltraNumericEditor:".
		THIS-OBJECT:label1:UseCompatibleTextRendering = TRUE.
		/*  */
		/* ultraCalendarCombo1 */
		/*  */
		THIS-OBJECT:ultraCalendarCombo1:BackColor = System.Drawing.SystemColors:Window.
		THIS-OBJECT:ultraCalendarCombo1:DateButtons:Add(dateButton1).
		THIS-OBJECT:ultraCalendarCombo1:Location = NEW System.Drawing.Point(159, 334).
		THIS-OBJECT:ultraCalendarCombo1:Name = "ultraCalendarCombo1".
		THIS-OBJECT:ultraCalendarCombo1:NonAutoSizeHeight = 23.
		THIS-OBJECT:ultraCalendarCombo1:Size = NEW System.Drawing.Size(184, 21).
		THIS-OBJECT:ultraCalendarCombo1:TabIndex = 62.
		/*  */
		/* ultraMaskedEdit1 */
		/*  */
		THIS-OBJECT:ultraMaskedEdit1:Location = NEW System.Drawing.Point(159, 286).
		THIS-OBJECT:ultraMaskedEdit1:Name = "ultraMaskedEdit1".
		THIS-OBJECT:ultraMaskedEdit1:Size = NEW System.Drawing.Size(184, 20).
		THIS-OBJECT:ultraMaskedEdit1:TabIndex = 61.
		THIS-OBJECT:ultraMaskedEdit1:Text = "ultraMaskedEdit1".
		/*  */
		/* ultraDateTimeEditor1 */
		/*  */
		THIS-OBJECT:ultraDateTimeEditor1:Location = NEW System.Drawing.Point(159, 238).
		THIS-OBJECT:ultraDateTimeEditor1:MaskInput = "~{LOC~}mm/dd/yyyy hh:mm:ss tt".
		THIS-OBJECT:ultraDateTimeEditor1:Name = "ultraDateTimeEditor1".
		THIS-OBJECT:ultraDateTimeEditor1:Size = NEW System.Drawing.Size(184, 21).
		THIS-OBJECT:ultraDateTimeEditor1:TabIndex = 60.
		/*  */
		/* ultraNumericEditor1 */
		/*  */
		THIS-OBJECT:ultraNumericEditor1:Location = NEW System.Drawing.Point(159, 142).
		THIS-OBJECT:ultraNumericEditor1:Name = "ultraNumericEditor1".
		THIS-OBJECT:ultraNumericEditor1:Size = NEW System.Drawing.Size(184, 21).
		THIS-OBJECT:ultraNumericEditor1:TabIndex = 58.
		/*  */
		/* ultraCurrencyEditor1 */
		/*  */
		THIS-OBJECT:ultraCurrencyEditor1:Location = NEW System.Drawing.Point(159, 190).
		THIS-OBJECT:ultraCurrencyEditor1:Name = "ultraCurrencyEditor1".
		THIS-OBJECT:ultraCurrencyEditor1:Size = NEW System.Drawing.Size(184, 21).
		THIS-OBJECT:ultraCurrencyEditor1:TabIndex = 59.
		/*  */
		/* ckUltraCalendarCombo */
		/*  */
		THIS-OBJECT:ckUltraCalendarCombo:Checked = TRUE.
		THIS-OBJECT:ckUltraCalendarCombo:CheckState = System.Windows.Forms.CheckState:Checked.
		THIS-OBJECT:ckUltraCalendarCombo:Location = NEW System.Drawing.Point(349, 335).
		THIS-OBJECT:ckUltraCalendarCombo:Name = "ckUltraCalendarCombo".
		THIS-OBJECT:ckUltraCalendarCombo:Size = NEW System.Drawing.Size(80, 20).
		THIS-OBJECT:ckUltraCalendarCombo:TabIndex = 67.
		THIS-OBJECT:ckUltraCalendarCombo:Text = "SpinWrap".
		THIS-OBJECT:ckUltraCalendarCombo:CheckedChanged:SUBSCRIBE(THIS-OBJECT:CheckEditor_CheckedChanged).
		/*  */
		/* ckUltraMaskedEdit */
		/*  */
		THIS-OBJECT:ckUltraMaskedEdit:Checked = TRUE.
		THIS-OBJECT:ckUltraMaskedEdit:CheckState = System.Windows.Forms.CheckState:Checked.
		THIS-OBJECT:ckUltraMaskedEdit:Location = NEW System.Drawing.Point(349, 287).
		THIS-OBJECT:ckUltraMaskedEdit:Name = "ckUltraMaskedEdit".
		THIS-OBJECT:ckUltraMaskedEdit:Size = NEW System.Drawing.Size(80, 20).
		THIS-OBJECT:ckUltraMaskedEdit:TabIndex = 66.
		THIS-OBJECT:ckUltraMaskedEdit:Text = "SpinWrap".
		THIS-OBJECT:ckUltraMaskedEdit:CheckedChanged:SUBSCRIBE(THIS-OBJECT:CheckEditor_CheckedChanged).
		/*  */
		/* ckUltraDateTimeEditor */
		/*  */
		THIS-OBJECT:ckUltraDateTimeEditor:Checked = TRUE.
		THIS-OBJECT:ckUltraDateTimeEditor:CheckState = System.Windows.Forms.CheckState:Checked.
		THIS-OBJECT:ckUltraDateTimeEditor:Location = NEW System.Drawing.Point(349, 239).
		THIS-OBJECT:ckUltraDateTimeEditor:Name = "ckUltraDateTimeEditor".
		THIS-OBJECT:ckUltraDateTimeEditor:Size = NEW System.Drawing.Size(80, 20).
		THIS-OBJECT:ckUltraDateTimeEditor:TabIndex = 65.
		THIS-OBJECT:ckUltraDateTimeEditor:Text = "SpinWrap".
		THIS-OBJECT:ckUltraDateTimeEditor:CheckedChanged:SUBSCRIBE(THIS-OBJECT:CheckEditor_CheckedChanged).
		/*  */
		/* ckUltraCurrencyEditor */
		/*  */
		THIS-OBJECT:ckUltraCurrencyEditor:Checked = TRUE.
		THIS-OBJECT:ckUltraCurrencyEditor:CheckState = System.Windows.Forms.CheckState:Checked.
		THIS-OBJECT:ckUltraCurrencyEditor:Location = NEW System.Drawing.Point(349, 191).
		THIS-OBJECT:ckUltraCurrencyEditor:Name = "ckUltraCurrencyEditor".
		THIS-OBJECT:ckUltraCurrencyEditor:Size = NEW System.Drawing.Size(80, 20).
		THIS-OBJECT:ckUltraCurrencyEditor:TabIndex = 64.
		THIS-OBJECT:ckUltraCurrencyEditor:Text = "SpinWrap".
		THIS-OBJECT:ckUltraCurrencyEditor:CheckedChanged:SUBSCRIBE(THIS-OBJECT:CheckEditor_CheckedChanged).
		/*  */
		/* ckUltraNumericEditor */
		/*  */
		THIS-OBJECT:ckUltraNumericEditor:Checked = TRUE.
		THIS-OBJECT:ckUltraNumericEditor:CheckState = System.Windows.Forms.CheckState:Checked.
		THIS-OBJECT:ckUltraNumericEditor:Location = NEW System.Drawing.Point(349, 143).
		THIS-OBJECT:ckUltraNumericEditor:Name = "ckUltraNumericEditor".
		THIS-OBJECT:ckUltraNumericEditor:Size = NEW System.Drawing.Size(80, 20).
		THIS-OBJECT:ckUltraNumericEditor:TabIndex = 63.
		THIS-OBJECT:ckUltraNumericEditor:Text = "SpinWrap".
		THIS-OBJECT:ckUltraNumericEditor:CheckedChanged:SUBSCRIBE(THIS-OBJECT:CheckEditor_CheckedChanged).
		/*  */
		/* ultraExpandableGroupBox1 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBox1:Controls:Add(THIS-OBJECT:ultraExpandableGroupBoxPanel1).
		THIS-OBJECT:ultraExpandableGroupBox1:Expanded = FALSE.
		THIS-OBJECT:ultraExpandableGroupBox1:ExpandedSize = NEW System.Drawing.Size(328, 120).
		THIS-OBJECT:ultraExpandableGroupBox1:HeaderPosition = Infragistics.Win.Misc.GroupBoxHeaderPosition:TopOnBorder.
		THIS-OBJECT:ultraExpandableGroupBox1:Location = NEW System.Drawing.Point(617, 144).
		THIS-OBJECT:ultraExpandableGroupBox1:Name = "ultraExpandableGroupBox1".
		THIS-OBJECT:ultraExpandableGroupBox1:Size = NEW System.Drawing.Size(328, 21).
		THIS-OBJECT:ultraExpandableGroupBox1:TabIndex = 68.
		THIS-OBJECT:ultraExpandableGroupBox1:Text = "UltraNumericEditor".
		/*  */
		/* ultraExpandableGroupBoxPanel1 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Controls:Add(THIS-OBJECT:ultraNumericEditorMax).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Controls:Add(THIS-OBJECT:label19).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Controls:Add(THIS-OBJECT:label20).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Controls:Add(THIS-OBJECT:ultraNumericEditorMin).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Location = NEW System.Drawing.Point(-10000, -10000).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Name = "ultraExpandableGroupBoxPanel1".
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Size = NEW System.Drawing.Size(201, 170).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:TabIndex = 0.
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:Visible = FALSE.
		/*  */
		/* ultraNumericEditorMax */
		/*  */
		THIS-OBJECT:ultraNumericEditorMax:Location = NEW System.Drawing.Point(120, 56).
		THIS-OBJECT:ultraNumericEditorMax:Name = "ultraNumericEditorMax".
		THIS-OBJECT:ultraNumericEditorMax:Size = NEW System.Drawing.Size(184, 21).
		THIS-OBJECT:ultraNumericEditorMax:TabIndex = 1.
		THIS-OBJECT:ultraNumericEditorMax:ValueChanged:SUBSCRIBE(THIS-OBJECT:ultraNumericEditorMax_ValueChanged).
		/*  */
		/* label19 */
		/*  */
		THIS-OBJECT:label19:Font = NEW System.Drawing.Font("Tahoma", 8.25, CAST(Progress.Util.EnumHelper:Or(System.Drawing.FontStyle:Bold, System.Drawing.FontStyle:Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label19:Location = NEW System.Drawing.Point(32, 56).
		THIS-OBJECT:label19:Name = "label19".
		THIS-OBJECT:label19:Size = NEW System.Drawing.Size(72, 23).
		THIS-OBJECT:label19:TabIndex = 28.
		THIS-OBJECT:label19:Text = "Max Value:".
		THIS-OBJECT:label19:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label20 */
		/*  */
		THIS-OBJECT:label20:Font = NEW System.Drawing.Font("Tahoma", 8.25, CAST(Progress.Util.EnumHelper:Or(System.Drawing.FontStyle:Bold, System.Drawing.FontStyle:Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label20:Location = NEW System.Drawing.Point(32, 16).
		THIS-OBJECT:label20:Name = "label20".
		THIS-OBJECT:label20:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:label20:TabIndex = 27.
		THIS-OBJECT:label20:Text = "Min Value:".
		THIS-OBJECT:label20:UseCompatibleTextRendering = TRUE.
		/*  */
		/* ultraNumericEditorMin */
		/*  */
		THIS-OBJECT:ultraNumericEditorMin:Location = NEW System.Drawing.Point(120, 16).
		THIS-OBJECT:ultraNumericEditorMin:Name = "ultraNumericEditorMin".
		THIS-OBJECT:ultraNumericEditorMin:Size = NEW System.Drawing.Size(184, 21).
		THIS-OBJECT:ultraNumericEditorMin:TabIndex = 0.
		THIS-OBJECT:ultraNumericEditorMin:ValueChanged:SUBSCRIBE(THIS-OBJECT:ultraNumericEditorMin_ValueChanged).
		/*  */
		/* ultraExpandableGroupBox2 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBox2:Controls:Add(THIS-OBJECT:ultraExpandableGroupBoxPanel2).
		THIS-OBJECT:ultraExpandableGroupBox2:Expanded = FALSE.
		THIS-OBJECT:ultraExpandableGroupBox2:ExpandedSize = NEW System.Drawing.Size(328, 120).
		THIS-OBJECT:ultraExpandableGroupBox2:HeaderPosition = Infragistics.Win.Misc.GroupBoxHeaderPosition:TopOnBorder.
		THIS-OBJECT:ultraExpandableGroupBox2:Location = NEW System.Drawing.Point(617, 192).
		THIS-OBJECT:ultraExpandableGroupBox2:Name = "ultraExpandableGroupBox2".
		THIS-OBJECT:ultraExpandableGroupBox2:Size = NEW System.Drawing.Size(328, 21).
		THIS-OBJECT:ultraExpandableGroupBox2:TabIndex = 69.
		THIS-OBJECT:ultraExpandableGroupBox2:Text = "UltraCurrencyEditor".
		/*  */
		/* ultraExpandableGroupBoxPanel2 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBoxPanel2:Controls:Add(THIS-OBJECT:ultraCurrencyEditorMax).
		THIS-OBJECT:ultraExpandableGroupBoxPanel2:Controls:Add(THIS-OBJECT:ultraCurrencyEditorMin).
		THIS-OBJECT:ultraExpandableGroupBoxPanel2:Controls:Add(THIS-OBJECT:label21).
		THIS-OBJECT:ultraExpandableGroupBoxPanel2:Controls:Add(THIS-OBJECT:label22).
		THIS-OBJECT:ultraExpandableGroupBoxPanel2:Location = NEW System.Drawing.Point(-10000, -10000).
		THIS-OBJECT:ultraExpandableGroupBoxPanel2:Name = "ultraExpandableGroupBoxPanel2".
		THIS-OBJECT:ultraExpandableGroupBoxPanel2:Size = NEW System.Drawing.Size(327, 103).
		THIS-OBJECT:ultraExpandableGroupBoxPanel2:TabIndex = 0.
		THIS-OBJECT:ultraExpandableGroupBoxPanel2:Visible = FALSE.
		/*  */
		/* ultraCurrencyEditorMax */
		/*  */
		THIS-OBJECT:ultraCurrencyEditorMax:Location = NEW System.Drawing.Point(120, 56).
		THIS-OBJECT:ultraCurrencyEditorMax:Name = "ultraCurrencyEditorMax".
		THIS-OBJECT:ultraCurrencyEditorMax:Size = NEW System.Drawing.Size(184, 21).
		THIS-OBJECT:ultraCurrencyEditorMax:TabIndex = 1.
		THIS-OBJECT:ultraCurrencyEditorMax:ValueChanged:SUBSCRIBE(THIS-OBJECT:ultraCurrencyEditorMax_ValueChanged).
		/*  */
		/* ultraCurrencyEditorMin */
		/*  */
		THIS-OBJECT:ultraCurrencyEditorMin:Location = NEW System.Drawing.Point(120, 16).
		THIS-OBJECT:ultraCurrencyEditorMin:Name = "ultraCurrencyEditorMin".
		THIS-OBJECT:ultraCurrencyEditorMin:Size = NEW System.Drawing.Size(184, 21).
		THIS-OBJECT:ultraCurrencyEditorMin:TabIndex = 0.
		THIS-OBJECT:ultraCurrencyEditorMin:ValueChanged:SUBSCRIBE(THIS-OBJECT:ultraCurrencyEditorMin_ValueChanged).
		/*  */
		/* label21 */
		/*  */
		THIS-OBJECT:label21:Font = NEW System.Drawing.Font("Tahoma", 8.25, CAST(Progress.Util.EnumHelper:Or(System.Drawing.FontStyle:Bold, System.Drawing.FontStyle:Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label21:Location = NEW System.Drawing.Point(32, 56).
		THIS-OBJECT:label21:Name = "label21".
		THIS-OBJECT:label21:Size = NEW System.Drawing.Size(72, 23).
		THIS-OBJECT:label21:TabIndex = 28.
		THIS-OBJECT:label21:Text = "Max Value:".
		THIS-OBJECT:label21:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label22 */
		/*  */
		THIS-OBJECT:label22:Font = NEW System.Drawing.Font("Tahoma", 8.25, CAST(Progress.Util.EnumHelper:Or(System.Drawing.FontStyle:Bold, System.Drawing.FontStyle:Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label22:Location = NEW System.Drawing.Point(32, 16).
		THIS-OBJECT:label22:Name = "label22".
		THIS-OBJECT:label22:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:label22:TabIndex = 27.
		THIS-OBJECT:label22:Text = "Min Value:".
		THIS-OBJECT:label22:UseCompatibleTextRendering = TRUE.
		/*  */
		/* ultraExpandableGroupBox3 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBox3:Controls:Add(THIS-OBJECT:ultraExpandableGroupBoxPanel3).
		THIS-OBJECT:ultraExpandableGroupBox3:Expanded = FALSE.
		THIS-OBJECT:ultraExpandableGroupBox3:ExpandedSize = NEW System.Drawing.Size(328, 120).
		THIS-OBJECT:ultraExpandableGroupBox3:HeaderPosition = Infragistics.Win.Misc.GroupBoxHeaderPosition:TopOnBorder.
		THIS-OBJECT:ultraExpandableGroupBox3:Location = NEW System.Drawing.Point(617, 240).
		THIS-OBJECT:ultraExpandableGroupBox3:Name = "ultraExpandableGroupBox3".
		THIS-OBJECT:ultraExpandableGroupBox3:Size = NEW System.Drawing.Size(328, 21).
		THIS-OBJECT:ultraExpandableGroupBox3:TabIndex = 70.
		THIS-OBJECT:ultraExpandableGroupBox3:Text = "UltraDateTimeEditor".
		/*  */
		/* ultraExpandableGroupBoxPanel3 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBoxPanel3:Controls:Add(THIS-OBJECT:ultraDateTimeEditorMax).
		THIS-OBJECT:ultraExpandableGroupBoxPanel3:Controls:Add(THIS-OBJECT:ultraDateTimeEditorMin).
		THIS-OBJECT:ultraExpandableGroupBoxPanel3:Controls:Add(THIS-OBJECT:label23).
		THIS-OBJECT:ultraExpandableGroupBoxPanel3:Controls:Add(THIS-OBJECT:label24).
		THIS-OBJECT:ultraExpandableGroupBoxPanel3:Location = NEW System.Drawing.Point(-10000, -10000).
		THIS-OBJECT:ultraExpandableGroupBoxPanel3:Name = "ultraExpandableGroupBoxPanel3".
		THIS-OBJECT:ultraExpandableGroupBoxPanel3:Size = NEW System.Drawing.Size(323, 99).
		THIS-OBJECT:ultraExpandableGroupBoxPanel3:TabIndex = 0.
		THIS-OBJECT:ultraExpandableGroupBoxPanel3:Visible = FALSE.
		/*  */
		/* ultraDateTimeEditorMax */
		/*  */
		THIS-OBJECT:ultraDateTimeEditorMax:Location = NEW System.Drawing.Point(120, 56).
		THIS-OBJECT:ultraDateTimeEditorMax:MaskInput = "~{LOC~}mm/dd/yyyy hh:mm:ss tt".
		THIS-OBJECT:ultraDateTimeEditorMax:Name = "ultraDateTimeEditorMax".
		THIS-OBJECT:ultraDateTimeEditorMax:Size = NEW System.Drawing.Size(184, 21).
		THIS-OBJECT:ultraDateTimeEditorMax:TabIndex = 1.
		THIS-OBJECT:ultraDateTimeEditorMax:ValueChanged:SUBSCRIBE(THIS-OBJECT:ultraDateTimeEditorMax_ValueChanged).
		/*  */
		/* ultraDateTimeEditorMin */
		/*  */
		THIS-OBJECT:ultraDateTimeEditorMin:Location = NEW System.Drawing.Point(120, 16).
		THIS-OBJECT:ultraDateTimeEditorMin:MaskInput = "~{LOC~}mm/dd/yyyy hh:mm:ss tt".
		THIS-OBJECT:ultraDateTimeEditorMin:Name = "ultraDateTimeEditorMin".
		THIS-OBJECT:ultraDateTimeEditorMin:Size = NEW System.Drawing.Size(184, 21).
		THIS-OBJECT:ultraDateTimeEditorMin:TabIndex = 0.
		THIS-OBJECT:ultraDateTimeEditorMin:ValueChanged:SUBSCRIBE(THIS-OBJECT:ultraDateTimeEditorMin_ValueChanged).
		/*  */
		/* label23 */
		/*  */
		THIS-OBJECT:label23:Font = NEW System.Drawing.Font("Tahoma", 8.25, CAST(Progress.Util.EnumHelper:Or(System.Drawing.FontStyle:Bold, System.Drawing.FontStyle:Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label23:Location = NEW System.Drawing.Point(32, 56).
		THIS-OBJECT:label23:Name = "label23".
		THIS-OBJECT:label23:Size = NEW System.Drawing.Size(72, 23).
		THIS-OBJECT:label23:TabIndex = 28.
		THIS-OBJECT:label23:Text = "Max Value:".
		THIS-OBJECT:label23:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label24 */
		/*  */
		THIS-OBJECT:label24:Font = NEW System.Drawing.Font("Tahoma", 8.25, CAST(Progress.Util.EnumHelper:Or(System.Drawing.FontStyle:Bold, System.Drawing.FontStyle:Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label24:Location = NEW System.Drawing.Point(32, 16).
		THIS-OBJECT:label24:Name = "label24".
		THIS-OBJECT:label24:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:label24:TabIndex = 27.
		THIS-OBJECT:label24:Text = "Min Value:".
		THIS-OBJECT:label24:UseCompatibleTextRendering = TRUE.
		/*  */
		/* ultraExpandableGroupBox4 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBox4:Controls:Add(THIS-OBJECT:ultraExpandableGroupBoxPanel4).
		THIS-OBJECT:ultraExpandableGroupBox4:Expanded = FALSE.
		THIS-OBJECT:ultraExpandableGroupBox4:ExpandedSize = NEW System.Drawing.Size(328, 120).
		THIS-OBJECT:ultraExpandableGroupBox4:HeaderPosition = Infragistics.Win.Misc.GroupBoxHeaderPosition:TopOnBorder.
		THIS-OBJECT:ultraExpandableGroupBox4:Location = NEW System.Drawing.Point(617, 288).
		THIS-OBJECT:ultraExpandableGroupBox4:Name = "ultraExpandableGroupBox4".
		THIS-OBJECT:ultraExpandableGroupBox4:Size = NEW System.Drawing.Size(328, 21).
		THIS-OBJECT:ultraExpandableGroupBox4:TabIndex = 71.
		THIS-OBJECT:ultraExpandableGroupBox4:Text = "UltraMaskedEdit".
		/*  */
		/* ultraExpandableGroupBoxPanel4 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBoxPanel4:Controls:Add(THIS-OBJECT:maskedEditMax).
		THIS-OBJECT:ultraExpandableGroupBoxPanel4:Controls:Add(THIS-OBJECT:maskedEditMin).
		THIS-OBJECT:ultraExpandableGroupBoxPanel4:Controls:Add(THIS-OBJECT:label25).
		THIS-OBJECT:ultraExpandableGroupBoxPanel4:Controls:Add(THIS-OBJECT:label26).
		THIS-OBJECT:ultraExpandableGroupBoxPanel4:Location = NEW System.Drawing.Point(-10000, -10000).
		THIS-OBJECT:ultraExpandableGroupBoxPanel4:Name = "ultraExpandableGroupBoxPanel4".
		THIS-OBJECT:ultraExpandableGroupBoxPanel4:Size = NEW System.Drawing.Size(325, 101).
		THIS-OBJECT:ultraExpandableGroupBoxPanel4:TabIndex = 0.
		THIS-OBJECT:ultraExpandableGroupBoxPanel4:Visible = FALSE.
		/*  */
		/* maskedEditMax */
		/*  */
		THIS-OBJECT:maskedEditMax:Location = NEW System.Drawing.Point(120, 56).
		THIS-OBJECT:maskedEditMax:Name = "maskedEditMax".
		THIS-OBJECT:maskedEditMax:Size = NEW System.Drawing.Size(184, 21).
		THIS-OBJECT:maskedEditMax:TabIndex = 1.
		THIS-OBJECT:maskedEditMax:ValueChanged:SUBSCRIBE(THIS-OBJECT:maskedEditMax_ValueChanged).
		/*  */
		/* maskedEditMin */
		/*  */
		THIS-OBJECT:maskedEditMin:Location = NEW System.Drawing.Point(120, 16).
		THIS-OBJECT:maskedEditMin:Name = "maskedEditMin".
		THIS-OBJECT:maskedEditMin:Size = NEW System.Drawing.Size(184, 21).
		THIS-OBJECT:maskedEditMin:TabIndex = 0.
		THIS-OBJECT:maskedEditMin:ValueChanged:SUBSCRIBE(THIS-OBJECT:maskedEditMin_ValueChanged).
		/*  */
		/* label25 */
		/*  */
		THIS-OBJECT:label25:Font = NEW System.Drawing.Font("Tahoma", 8.25, CAST(Progress.Util.EnumHelper:Or(System.Drawing.FontStyle:Bold, System.Drawing.FontStyle:Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label25:Location = NEW System.Drawing.Point(32, 56).
		THIS-OBJECT:label25:Name = "label25".
		THIS-OBJECT:label25:Size = NEW System.Drawing.Size(72, 23).
		THIS-OBJECT:label25:TabIndex = 28.
		THIS-OBJECT:label25:Text = "Max Value:".
		THIS-OBJECT:label25:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label26 */
		/*  */
		THIS-OBJECT:label26:Font = NEW System.Drawing.Font("Tahoma", 8.25, CAST(Progress.Util.EnumHelper:Or(System.Drawing.FontStyle:Bold, System.Drawing.FontStyle:Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label26:Location = NEW System.Drawing.Point(32, 16).
		THIS-OBJECT:label26:Name = "label26".
		THIS-OBJECT:label26:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:label26:TabIndex = 27.
		THIS-OBJECT:label26:Text = "Min Value:".
		THIS-OBJECT:label26:UseCompatibleTextRendering = TRUE.
		/*  */
		/* ultraExpandableGroupBox5 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBox5:Controls:Add(THIS-OBJECT:ultraExpandableGroupBoxPanel5).
		THIS-OBJECT:ultraExpandableGroupBox5:Expanded = FALSE.
		THIS-OBJECT:ultraExpandableGroupBox5:ExpandedSize = NEW System.Drawing.Size(328, 120).
		THIS-OBJECT:ultraExpandableGroupBox5:HeaderPosition = Infragistics.Win.Misc.GroupBoxHeaderPosition:TopOnBorder.
		THIS-OBJECT:ultraExpandableGroupBox5:Location = NEW System.Drawing.Point(617, 336).
		THIS-OBJECT:ultraExpandableGroupBox5:Name = "ultraExpandableGroupBox5".
		THIS-OBJECT:ultraExpandableGroupBox5:Size = NEW System.Drawing.Size(328, 21).
		THIS-OBJECT:ultraExpandableGroupBox5:TabIndex = 72.
		THIS-OBJECT:ultraExpandableGroupBox5:Text = "UltraCalendarCombo".
		/*  */
		/* ultraExpandableGroupBoxPanel5 */
		/*  */
		THIS-OBJECT:ultraExpandableGroupBoxPanel5:Controls:Add(THIS-OBJECT:calendarComboMax).
		THIS-OBJECT:ultraExpandableGroupBoxPanel5:Controls:Add(THIS-OBJECT:calendarComboMin).
		THIS-OBJECT:ultraExpandableGroupBoxPanel5:Controls:Add(THIS-OBJECT:label27).
		THIS-OBJECT:ultraExpandableGroupBoxPanel5:Controls:Add(THIS-OBJECT:label28).
		THIS-OBJECT:ultraExpandableGroupBoxPanel5:Location = NEW System.Drawing.Point(-10000, -10000).
		THIS-OBJECT:ultraExpandableGroupBoxPanel5:Name = "ultraExpandableGroupBoxPanel5".
		THIS-OBJECT:ultraExpandableGroupBoxPanel5:Size = NEW System.Drawing.Size(322, 98).
		THIS-OBJECT:ultraExpandableGroupBoxPanel5:TabIndex = 0.
		THIS-OBJECT:ultraExpandableGroupBoxPanel5:Visible = FALSE.
		/*  */
		/* calendarComboMax */
		/*  */
		THIS-OBJECT:calendarComboMax:Location = NEW System.Drawing.Point(120, 56).
		THIS-OBJECT:calendarComboMax:Name = "calendarComboMax".
		THIS-OBJECT:calendarComboMax:Size = NEW System.Drawing.Size(184, 21).
		THIS-OBJECT:calendarComboMax:TabIndex = 1.
		THIS-OBJECT:calendarComboMax:ValueChanged:SUBSCRIBE(THIS-OBJECT:calendarComboMax_ValueChanged).
		/*  */
		/* calendarComboMin */
		/*  */
		THIS-OBJECT:calendarComboMin:Location = NEW System.Drawing.Point(120, 16).
		THIS-OBJECT:calendarComboMin:Name = "calendarComboMin".
		THIS-OBJECT:calendarComboMin:Size = NEW System.Drawing.Size(184, 21).
		THIS-OBJECT:calendarComboMin:TabIndex = 0.
		THIS-OBJECT:calendarComboMin:ValueChanged:SUBSCRIBE(THIS-OBJECT:calendarComboMin_ValueChanged).
		/*  */
		/* label27 */
		/*  */
		THIS-OBJECT:label27:Font = NEW System.Drawing.Font("Tahoma", 8.25, CAST(Progress.Util.EnumHelper:Or(System.Drawing.FontStyle:Bold, System.Drawing.FontStyle:Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label27:Location = NEW System.Drawing.Point(32, 56).
		THIS-OBJECT:label27:Name = "label27".
		THIS-OBJECT:label27:Size = NEW System.Drawing.Size(72, 23).
		THIS-OBJECT:label27:TabIndex = 28.
		THIS-OBJECT:label27:Text = "Max Value:".
		THIS-OBJECT:label27:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label28 */
		/*  */
		THIS-OBJECT:label28:Font = NEW System.Drawing.Font("Tahoma", 8.25, CAST(Progress.Util.EnumHelper:Or(System.Drawing.FontStyle:Bold, System.Drawing.FontStyle:Underline), System.Drawing.FontStyle), System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:label28:Location = NEW System.Drawing.Point(32, 16).
		THIS-OBJECT:label28:Name = "label28".
		THIS-OBJECT:label28:Size = NEW System.Drawing.Size(64, 23).
		THIS-OBJECT:label28:TabIndex = 27.
		THIS-OBJECT:label28:Text = "Min Value:".
		THIS-OBJECT:label28:UseCompatibleTextRendering = TRUE.
		/*  */
		/* ultraCalendarInfo1 */
		/*  */
		THIS-OBJECT:ultraCalendarInfo1:DataBindingsForAppointments:BindingContextControl = THIS-OBJECT.
		THIS-OBJECT:ultraCalendarInfo1:DataBindingsForOwners:BindingContextControl = THIS-OBJECT.
		/*  */
		/* ultraLabelSummary */
		/*  */
		THIS-OBJECT:ultraLabelSummary:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance1:FontData:Name = "Tahoma".
		THIS-OBJECT:ultraLabelSummary:Appearance = appearance1.
		THIS-OBJECT:ultraLabelSummary:Location = NEW System.Drawing.Point(12, 12).
		THIS-OBJECT:ultraLabelSummary:Name = "ultraLabelSummary".
		THIS-OBJECT:ultraLabelSummary:Size = NEW System.Drawing.Size(863, 64).
		THIS-OBJECT:ultraLabelSummary:TabIndex = 73.
		THIS-OBJECT:ultraLabelSummary:Text = "SpinWrap Summary".
		/*  */
		/* FormSpinWrap */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(959, 445).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraLabelSummary).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraExpandableGroupBox1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraExpandableGroupBox2).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraExpandableGroupBox3).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraExpandableGroupBox4).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraExpandableGroupBox5).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ckUltraCalendarCombo).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ckUltraMaskedEdit).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ckUltraDateTimeEditor).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ckUltraCurrencyEditor).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ckUltraNumericEditor).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraCalendarCombo1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraMaskedEdit1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraDateTimeEditor1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraNumericEditor1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraCurrencyEditor1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:label10).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:label6).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:label7).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:lblMaxUltraCalendarCombo).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:lblMinUltraCalendarCombo).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:lblMaxUltraMaskedEdit).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:lblMinUltraMaskedEdit).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:lblMaxUltraDateTimeEditor).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:lblMinUltraDateTimeEditor).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:lblMaxUltraCurrencyEditor).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:lblMinUltraCurrencyEditor).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:lblMaxUltraNumericEditor).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:lblMinUltraNumericEditor).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:label5).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:label4).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:label3).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:label2).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:label1).
		THIS-OBJECT:Name = "FormSpinWrap".
		THIS-OBJECT:Text = "Spin Wrap".
		THIS-OBJECT:Load:SUBSCRIBE(THIS-OBJECT:FormSpinWrap_Load).
		CAST(THIS-OBJECT:ultraCalendarCombo1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraDateTimeEditor1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraNumericEditor1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraCurrencyEditor1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraExpandableGroupBox1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraExpandableGroupBox1:ResumeLayout(FALSE).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:ResumeLayout(FALSE).
		THIS-OBJECT:ultraExpandableGroupBoxPanel1:PerformLayout().
		CAST(THIS-OBJECT:ultraNumericEditorMax, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraNumericEditorMin, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraExpandableGroupBox2, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraExpandableGroupBox2:ResumeLayout(FALSE).
		THIS-OBJECT:ultraExpandableGroupBoxPanel2:ResumeLayout(FALSE).
		THIS-OBJECT:ultraExpandableGroupBoxPanel2:PerformLayout().
		CAST(THIS-OBJECT:ultraCurrencyEditorMax, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraCurrencyEditorMin, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraExpandableGroupBox3, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraExpandableGroupBox3:ResumeLayout(FALSE).
		THIS-OBJECT:ultraExpandableGroupBoxPanel3:ResumeLayout(FALSE).
		THIS-OBJECT:ultraExpandableGroupBoxPanel3:PerformLayout().
		CAST(THIS-OBJECT:ultraDateTimeEditorMax, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraDateTimeEditorMin, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraExpandableGroupBox4, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraExpandableGroupBox4:ResumeLayout(FALSE).
		THIS-OBJECT:ultraExpandableGroupBoxPanel4:ResumeLayout(FALSE).
		THIS-OBJECT:ultraExpandableGroupBoxPanel4:PerformLayout().
		CAST(THIS-OBJECT:maskedEditMax, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:maskedEditMin, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraExpandableGroupBox5, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraExpandableGroupBox5:ResumeLayout(FALSE).
		THIS-OBJECT:ultraExpandableGroupBoxPanel5:ResumeLayout(FALSE).
		THIS-OBJECT:ultraExpandableGroupBoxPanel5:PerformLayout().
		CAST(THIS-OBJECT:calendarComboMax, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:calendarComboMin, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ResumeLayout(FALSE).
		THIS-OBJECT:PerformLayout().

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID FormSpinWrap_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    /*initialize controls*/
	    ASSIGN ultraNumericEditor1:SpinButtonDisplayStyle = ButtonDisplayStyle:Always
               ultraNumericEditor1:SpinButtonAlignment    = ButtonAlignment:Right
               ultraNumericEditor1:SpinWrap               = TRUE
               ultraNumericEditor1:NumericType            = NumericType:Double 
               ultraNumericEditor1:MinValue               = 10.15
               ultraNumericEditor1:MaxValue               = 10.30
               ultraNumericEditor1:Value                  = 10.20.

       ASSIGN ultraCurrencyEditor1:SpinButtonDisplayStyle = ButtonDisplayStyle:Always
              ultraCurrencyEditor1:SpinButtonAlignment    = ButtonAlignment:Right
              ultraCurrencyEditor1:SpinWrap               = TRUE
              ultraCurrencyEditor1:MaskInput              = "$nn.nn"
              ultraCurrencyEditor1:MaskDisplayMode        = MaskMode:IncludeLiterals      
              ultraCurrencyEditor1:MinValue               = 9.00
              ultraCurrencyEditor1:MaxValue               = 9.50
              ultraCurrencyEditor1:Value                  = 9.25.

       ASSIGN ultraDateTimeEditor1:SpinButtonDisplayStyle = ButtonDisplayStyle:Always
              ultraDateTimeEditor1:SpinButtonAlignment    = ButtonAlignment:Right
              ultraDateTimeEditor1:SpinWrap               = TRUE
              ultraDateTimeEditor1:MaskInput              = CHR(123) + "LOC" + CHR(125) + "mm/dd/yyyy hh:mm:ss tt"
              ultraDateTimeEditor1:MinDate                = BOX(DATETIME(6,1,1990,0,0))
              ultraDateTimeEditor1:MaxDate                = BOX(DATETIME(8,15,2010,0,0))          
              ultraDateTimeEditor1:Value                  = NOW.

       ASSIGN ultraMaskedEdit1:SpinButtonDisplayStyle = SpinButtonDisplayStyle:OnRight
              ultraMaskedEdit1:SpinWrap               = TRUE
              ultraMaskedEdit1:InputMask              = "mm/dd/yyyy"
              ultraMaskedEdit1:MinValue               = BOX(DATETIME(1,1,1990,0,0 ))
              ultraMaskedEdit1:MaxValue               = BOX(DATETIME(12,31,2012,0,0))
              ultraMaskedEdit1:Value                  = BOX(NOW).

       ASSIGN ultraCalendarCombo1:SpinButtonsVisible       = TRUE
              ultraCalendarCombo1:SpinButtonIncrement      = SpinIncrementUnit:Days
              ultraCalendarCombo1:SpinButtonIncrementValue = 1
              ultraCalendarCombo1:SpinWrap                 = TRUE
              ultraCalendarInfo1:MinDate                   = BOX(DATETIME(6,1,2000,0,0))
              ultraCalendarInfo1:MaxDate                   = BOX(DATETIME(8,15,2010,0,0))
              ultraCalendarCombo1:Value                    = BOX(Now)
              ultraCalendarCombo1:CalendarInfo             = ultraCalendarInfo1.

       spinnableControlsInitialized = TRUE.

       InitializeMinMaxEditors().
       InitializeLabels().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC VOID InitializeMinMaxEditors(  ):
		IF spinnableControlsInitialized = FALSE THEN
            RETURN.

        InitializeMinMaxUltraNumericEditor().
        InitializeMinMaxUltraCurrencyEditor().
        InitializeMinMaxUltraDateTimeEditor().
        InitializeMinMaxUltraWinMaskedEdit().
        InitializeMinMaxUltraCalendarCombo().
		
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID InitializeMinMaxUltraNumericEditor():
        ASSIGN ultraNumericEditorMin:SpinButtonDisplayStyle = ultraNumericEditor1:SpinButtonDisplayStyle
               ultraNumericEditorMax:SpinButtonDisplayStyle = ultraNumericEditor1:SpinButtonDisplayStyle
               ultraNumericEditorMin:SpinButtonAlignment    = ultraNumericEditor1:SpinButtonAlignment
               ultraNumericEditorMax:SpinButtonAlignment    = ultraNumericEditor1:SpinButtonAlignment
               ultraNumericEditorMin:SpinWrap               = FALSE
               ultraNumericEditorMax:SpinWrap               = FALSE
               ultraNumericEditorMin:NumericType            = ultraNumericEditor1:NumericType
               ultraNumericEditorMax:NumericType            = ultraNumericEditor1:NumericType
               ultraNumericEditorMin:Value                  = ultraNumericEditor1:MinValue
               ultraNumericEditorMax:Value                  = ultraNumericEditor1:MaxValue
               /*synchronize min/max editors*/
               ultraNumericEditorMin:MaxValue               = ultraNumericEditorMax:Value
               ultraNumericEditorMax:MinValue               = ultraNumericEditorMin:Value.
    END METHOD. /*InitializeMinMaxUltraNumericEditor*/

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID InitializeMinMaxUltraCurrencyEditor():
        ASSIGN ultraCurrencyEditorMin:SpinButtonDisplayStyle = ultraCurrencyEditor1:SpinButtonDisplayStyle
               ultraCurrencyEditorMax:SpinButtonDisplayStyle = ultraCurrencyEditor1:SpinButtonDisplayStyle
               ultraCurrencyEditorMin:SpinButtonAlignment    = ultraCurrencyEditor1:SpinButtonAlignment
               ultraCurrencyEditorMax:SpinButtonAlignment    = ultraCurrencyEditor1:SpinButtonAlignment
               ultraCurrencyEditorMin:SpinWrap               = FALSE
               ultraCurrencyEditorMax:SpinWrap               = FALSE
               ultraCurrencyEditorMin:MaskInput              = ultraCurrencyEditor1:MaskInput
               ultraCurrencyEditorMax:MaskInput              = ultraCurrencyEditor1:MaskInput
               ultraCurrencyEditorMin:MaskDisplayMode        = ultraCurrencyEditor1:MaskDisplayMode
               ultraCurrencyEditorMax:MaskDisplayMode        = ultraCurrencyEditor1:MaskDisplayMode
               ultraCurrencyEditorMin:Value                  = ultraCurrencyEditor1:MinValue
               ultraCurrencyEditorMax:Value                  = ultraCurrencyEditor1:MaxValue
               /*synchronize min/max editors*/
               ultraCurrencyEditorMin:MaxValue               = ultraCurrencyEditorMax:Value
               ultraCurrencyEditorMax:MinValue               = ultraCurrencyEditorMin:Value.
    END METHOD. /*InitializeMinMaxUltraCurrencyEditor*/

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID InitializeMinMaxUltraDateTimeEditor():
        ASSIGN ultraDateTimeEditorMin:SpinButtonDisplayStyle = ultraDateTimeEditor1:SpinButtonDisplayStyle
               ultraDateTimeEditorMax:SpinButtonDisplayStyle = ultraDateTimeEditor1:SpinButtonDisplayStyle
               ultraDateTimeEditorMin:SpinButtonAlignment    = ultraDateTimeEditor1:SpinButtonAlignment
               ultraDateTimeEditorMax:SpinButtonAlignment    = ultraDateTimeEditor1:SpinButtonAlignment
               ultraDateTimeEditorMin:SpinWrap               = FALSE
               ultraDateTimeEditorMax:SpinWrap               = FALSE
               ultraDateTimeEditorMin:MaskInput              = ultraDateTimeEditor1:MaskInput
               ultraDateTimeEditorMax:MaskInput              = ultraDateTimeEditor1:MaskInput
               ultraDateTimeEditorMin:Value                  = ultraDateTimeEditor1:MinDate
               ultraDateTimeEditorMax:Value                  = ultraDateTimeEditor1:MaxDate.
    END METHOD. /*InitializeMinMaxUltraDateTimeEditor*/

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID InitializeMinMaxUltraWinMaskedEdit():
        ASSIGN maskedEditMin:SpinButtonDisplayStyle = ButtonDisplayStyle:Always
               maskedEditMax:SpinButtonDisplayStyle = ButtonDisplayStyle:Always
               maskedEditMin:SpinButtonAlignment    = ButtonAlignment:Right
               maskedEditMax:SpinButtonAlignment    = ButtonAlignment:Right
               maskedEditMin:SpinWrap               = FALSE
               maskedEditMax:SpinWrap               = FALSE
               maskedEditMin:MaskInput              = ultraMaskedEdit1:InputMask
               maskedEditMax:MaskInput              = ultraMaskedEdit1:InputMask
               maskedEditMin:Value                  = ultraMaskedEdit1:MinValue
               maskedEditMax:Value                  = ultraMaskedEdit1:MaxValue.
    END METHOD. /*InitializeMinMaxUltraWinMaskedEdit*/

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID InitializeMinMaxUltraCalendarCombo():
        ASSIGN calendarComboMin:SpinButtonDisplayStyle = ButtonDisplayStyle:Always
               calendarComboMax:SpinButtonDisplayStyle = ButtonDisplayStyle:Always
               calendarComboMin:SpinButtonAlignment    = ButtonAlignment:Right
               calendarComboMax:SpinButtonAlignment    = ButtonAlignment:Right
               calendarComboMin:SpinWrap               = FALSE
               calendarComboMax:SpinWrap               = FALSE
               calendarComboMin:MaskInput              = "mm/dd/yyyy"
               calendarComboMax:MaskInput              = "mm/dd/yyyy"
               calendarComboMin:Value                  = ultraCalendarInfo1:MinDate
               calendarComboMax:Value                  = ultraCalendarInfo1:MaxDate.
    END METHOD. /*InitializeMinMaxUltraCalendarCombo*/

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID InitializeLabels():
        ASSIGN lblMinUltraNumericEditor:Text  = CAST(ultraNumericEditor1:MinValue, "System.Decimal"):ToString("f")
               lblMaxUltraNumericEditor:Text  = CAST(ultraNumericEditor1:MaxValue, "System.Decimal"):ToString("f")
               lblMinUltraCurrencyEditor:Text = STRING(ultraCurrencyEditor1:MinValue)
               lblMaxUltraCurrencyEditor:Text = STRING(ultraCurrencyEditor1:MaxValue)
               lblMinUltraDateTimeEditor:Text = STRING(ultraDateTimeEditor1:MinDate, "99/99/9999").
               
               toolTip1:SetToolTip(lblMinUltraDateTimeEditor,STRING(ultraDateTimeEditor1:MinDate, "99/99/9999 hh:mm:ss")).
               lblMaxUltraDateTimeEditor:Text = STRING(ultraDateTimeEditor1:MaxDate, "99/99/9999").
               toolTip1:SetToolTip(lblMaxUltraDateTimeEditor,STRING(ultraDateTimeEditor1:MaxDate, "99/99/9999 hh:mm:ss")).
               lblMinUltraMaskedEdit:Text = STRING(ultraMaskedEdit1:MinValue, "99/99/9999").
               toolTip1:SetToolTip(lblMinUltraMaskedEdit,STRING(ultraMaskedEdit1:MinValue, "99/99/9999 hh:mm:ss")).
               lblMaxUltraMaskedEdit:Text = STRING(ultraMaskedEdit1:MaxValue, "99/99/9999").
               toolTip1:SetToolTip(lblMaxUltraMaskedEdit, STRING(ultraMaskedEdit1:MaxValue, "99/99/9999 hh:mm:ss")).
               lblMinUltraCalendarCombo:Text = STRING(ultraCalendarInfo1:MinDate, "99/99/9999").
               lblMaxUltraCalendarCombo:Text = STRING(ultraCalendarInfo1:MaxDate, "99/99/9999").
               /*summary description*/
               ultraLabelSummary:Text =
               "The UltraNumericEditor, UltraCurrencyEditor, UltraDateTimeEditor, UltraWinMaskedEdit, and " +
               "UltraCalendarCombo controls expose a SpinWrap property that gets/sets a value indicating whether " +
               "the control's spin button should wrap the value of a spinnable section.  If true the spin button " +
               "will wrap the value incremented/decremented based on its Min/Max value.  The UltraCalendarCombo " +
               "determines the appropriate spinnable section based on it's SpinButtonIncrement property.".

    END METHOD. /*InitializeLabels*/

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID ultraNumericEditorMin_ValueChanged(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
        ASSIGN ultraNumericEditor1:MinValue   = ultraNumericEditorMin:VALUE
               lblMinUltraNumericEditor:Text  = UNBOX(ultraNumericEditor1:MinValue)
               ultraNumericEditorMax:MinValue = ultraNumericEditorMin:VALUE.

        IF UNBOX(ultraNumericEditor1:Value) < UNBOX(ultraNumericEditor1:MinValue) THEN
            ultraNumericEditor1:Value = ultraNumericEditor1:MinValue.
    END METHOD. /*ultraNumericEditorMin_ValueChanged*/

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID ultraNumericEditorMax_ValueChanged(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
        DEFINE VARIABLE minValue AS System.Object NO-UNDO.

        minValue = ultraNumericEditorMax:MinValue.
        ultraNumericEditor1:MaxValue   = ultraNumericEditorMax:VALUE.
        lblMaxUltraNumericEditor:Text  = STRING(ultraNumericEditor1:MaxValue).
        ultraNumericEditorMin:MaxValue = ultraNumericEditorMax:Value.

        IF ultraNumericEditor1:Value > ultraNumericEditor1:MaxValue THEN
            ultraNumericEditor1:Value = ultraNumericEditor1:MaxValue.

        CATCH err AS Progress.Lang.Error :
            ultraNumericEditorMax:Value = minValue.        		
        END CATCH.
    END METHOD. /*ultraNumericEditorMax_ValueChanged*/

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID ultraCurrencyEditorMin_ValueChanged(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
        ASSIGN ultraCurrencyEditor1:MinValue = ultraCurrencyEditorMin:Value
               lblMinUltraCurrencyEditor:Text  = STRING(ultraCurrencyEditor1:MinValue)
               ultraCurrencyEditorMax:MinValue = ultraCurrencyEditorMin:Value.

        IF ultraCurrencyEditor1:Value < ultraCurrencyEditor1:MinValue THEN
            ultraCurrencyEditor1:Value = ultraCurrencyEditor1:MinValue.
    END METHOD. /*ultraCurrencyEditorMin_ValueChanged*/

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID ultraCurrencyEditorMax_ValueChanged(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
        DEFINE VARIABLE initValue AS DECIMAL NO-UNDO.

        IF ultraCurrencyEditorMax:Value > ultraCurrencyEditorMin:Value THEN
            initValue = ultraCurrencyEditorMax:VALUE.
        ELSE
            ASSIGN initValue = ultraCurrencyEditorMin:Value
                   ultraCurrencyEditorMax:Value = initValue.

        ASSIGN ultraCurrencyEditor1:MaxValue   = initValue
               ultraCurrencyEditor1:MaxValue   = ultraCurrencyEditorMax:Value
               lblMaxUltraCurrencyEditor:Text  = STRING(ultraCurrencyEditor1:MaxValue)
               ultraCurrencyEditorMin:MaxValue = ultraCurrencyEditorMax:VALUE.

        IF ultraCurrencyEditor1:Value > ultraCurrencyEditor1:MaxValue THEN
           ultraCurrencyEditor1:Value = ultraCurrencyEditor1:MaxValue.        

        CATCH err AS Progress.Lang.Error :
             ultraCurrencyEditorMax:Value = ultraCurrencyEditorMin:Value.         		
        END CATCH.
    END METHOD. /*ultraCurrencyEditorMax_ValueChanged*/

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID ultraDateTimeEditorMin_ValueChanged(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
        ASSIGN ultraDateTimeEditor1:MinDate = UNBOX(ultraDateTimeEditorMin:Value)
               lblMinUltraDateTimeEditor:Text  = STRING(ultraDateTimeEditor1:MinDate).
               toolTip1:SetToolTip(lblMinUltraDateTimeEditor, STRING(ultraDateTimeEditor1:MinDate)).
               ultraDateTimeEditorMax:MinDate = UNBOX(ultraDateTimeEditorMin:Value).

        IF UNBOX(ultraDateTimeEditor1:Value) < ultraDateTimeEditor1:MinDate THEN
            ultraDateTimeEditor1:Value = ultraDateTimeEditor1:MinDate.        
    END METHOD. /*ultraDateTimeEditorMin_ValueChanged*/

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID ultraDateTimeEditorMax_ValueChanged(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
        ultraDateTimeEditor1:MaxDate = ultraDateTimeEditorMax:Value.
        lblMaxUltraDateTimeEditor:Text  = STRING(ultraDateTimeEditor1:MaxDate, "99/99/9999").
        toolTip1:SetToolTip(lblMaxUltraDateTimeEditor, STRING(ultraDateTimeEditor1:MaxDate)).    
        ultraDateTimeEditorMin:MaxDate = ultraDateTimeEditorMax:Value.

        IF UNBOX(ultraDateTimeEditor1:Value) > ultraDateTimeEditor1:MaxDate THEN
            ultraDateTimeEditor1:Value = ultraDateTimeEditor1:MaxDate.           

        CATCH err AS Progress.Lang.Error :
            ultraDateTimeEditorMax:Value = ultraDateTimeEditorMin:Value.        		
        END CATCH.
    END METHOD. /*ultraDateTimeEditorMax_ValueChanged*/

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID maskedEditMin_ValueChanged(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
        ASSIGN ultraMaskedEdit1:MinValue = maskedEditMin:VALUE
               lblMinUltraMaskedEdit:Text  = STRING(ultraMaskedEdit1:MinValue).
               toolTip1:SetToolTip(lblMinUltraMaskedEdit, STRING(ultraMaskedEdit1:MinValue)).
               maskedEditMax:MinDate = UNBOX(maskedEditMin:Value).

        IF ultraMaskedEdit1:Value < ultraMaskedEdit1:MinValue THEN
            ultraMaskedEdit1:Value = ultraMaskedEdit1:MinValue.
    END METHOD. /*maskedEditMin_ValueChanged*/

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID maskedEditMax_ValueChanged(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
        DEFINE VARIABLE minValue AS System.Object NO-UNDO.

        minValue = maskedEditMax:MinDate.
        ultraMaskedEdit1:MaxValue = maskedEditMax:VALUE.
        lblMaxUltraMaskedEdit:Text  = STRING(ultraMaskedEdit1:MaxValue, "99/99/9999").
        toolTip1:SetToolTip(lblMaxUltraMaskedEdit, STRING(ultraMaskedEdit1:MaxValue)).    
        maskedEditMin:MaxDate = maskedEditMax:Value.

        IF UNBOX(ultraMaskedEdit1:Value) > UNBOX(ultraMaskedEdit1:MaxValue) THEN
            ultraMaskedEdit1:Value = ultraMaskedEdit1:MaxValue.        

        CATCH err AS Progress.Lang.Error :
            maskedEditMax:Value = minValue.        		
        END CATCH.
    END METHOD. /*maskedEditMax_ValueChanged*/

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID calendarComboMin_ValueChanged(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
        ASSIGN ultraCalendarInfo1:MinDate = calendarComboMin:Value
               lblMinUltraCalendarCombo:Text = STRING(ultraCalendarInfo1:MinDate, "99/99/9999").
        toolTip1:SetToolTip(lblMinUltraCalendarCombo, STRING(ultraCalendarInfo1:MinDate)).
        calendarComboMax:MinDate = UNBOX(calendarComboMin:Value).

        IF UNBOX(ultraCalendarCombo1:Value) < ultraCalendarInfo1:MinDate THEN
            ultraCalendarCombo1:Value = ultraCalendarInfo1:MinDate.        
    END METHOD. /*calendarComboMin_ValueChanged*/

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID calendarComboMax_ValueChanged(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
        DEFINE VARIABLE minValue AS System.Object NO-UNDO.

        minValue = calendarComboMax:MinDate.
        ultraCalendarInfo1:MaxDate = UNBOX(calendarComboMax:Value).
        lblMaxUltraCalendarCombo:Text  = STRING(ultraCalendarInfo1:MaxDate, "99/99/99").
        toolTip1:SetToolTip(lblMaxUltraCalendarCombo, STRING(ultraCalendarInfo1:MaxDate, "99/99/9999")).    
        calendarComboMin:MaxDate = UNBOX(calendarComboMax:Value). 

        IF UNBOX(ultraCalendarCombo1:Value) > ultraCalendarInfo1:MaxDate THEN
            ultraCalendarCombo1:Value = ultraCalendarInfo1:MaxDate.           
        
        CATCH err AS Progress.Lang.Error :
            calendarComboMax:Value = minValue.        		
        END CATCH.
    END METHOD. /*calendarComboMax_ValueChanged*/

    /*------------------------------------------------------------------------------
			Purpose: toggles spin wrap property of controls
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID CheckEditor_CheckedChanged(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
        DEFINE VARIABLE checkEditor AS UltraCheckEditor NO-UNDO.
        DEFINE VARIABLE isChecked   AS LOGICAL          NO-UNDO.
        DEFINE VARIABLE editorName  AS CHARACTER        NO-UNDO.

        checkEditor = CAST(sender,UltraCheckEditor).
        
        IF checkEditor = ? THEN
            RETURN.

        isChecked = checkEditor:CHECKED.

        editorName = GetEditorNameFromControlName(checkEditor:Name, Progress.Util.TypeHelper:GetType("UltraCheckEditor")).

        CASE editorName:
            WHEN "UltraNumericEditor":U  THEN ultraNumericEditor1:SpinWrap  = isChecked.
            WHEN "UltraCurrencyEditor":U THEN ultraCurrencyEditor1:SpinWrap = isChecked.
            WHEN "UltraDateTimeEditor":U THEN ultraDateTimeEditor1:SpinWrap = isChecked.
            WHEN "UltraMaskedEdit":U     THEN ultraMaskedEdit1:SpinWrap     = isChecked.
            WHEN "UltraCalendarCombo":U  THEN ultraCalendarCombo1:SpinWrap  = isChecked.
        END CASE.
    END METHOD. /*CheckEditor_CheckedChanged*/

    /*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
    METHOD PRIVATE CHARACTER GetEditorNameFromControlName(INPUT controlName AS CHARACTER, INPUT newType AS System.Type):
        DEFINE VARIABLE editorName AS CHARACTER NO-UNDO.

        IF newType = Progress.Util.TypeHelper:GetType("UltraCheckEditor") THEN
            editorName = SUBSTRING(controlName,3).

        RETURN editorName.
    END METHOD. /*GetEditorNameFromControlName*/
END CLASS.