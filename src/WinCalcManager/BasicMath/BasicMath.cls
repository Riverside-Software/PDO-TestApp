 
 /*------------------------------------------------------------------------
    File        : BasicMath
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels copied from Infragsistics sample
    Created     : Thu Apr 24 16:36:17 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

CLASS WinCalcManager.BasicMath.BasicMath INHERITS Form   : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.



	DEFINE PRIVATE VARIABLE label2 AS System.Windows.Forms.Label NO-UNDO.
		

	DEFINE PRIVATE VARIABLE groupBox3 AS System.Windows.Forms.GroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE groupBox2 AS System.Windows.Forms.GroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE txtSumFunctionTotal AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtSumFunction4 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtSumFunction3 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtSumFunction2 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtSumFunction1 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE groupBox1 AS System.Windows.Forms.GroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE txtAdditionTotal AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtAddition4 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtAddition3 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtAddition2 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtAddition1 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.

	DEFINE PRIVATE VARIABLE groupBox4 AS System.Windows.Forms.GroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE label1 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE txtGrandTotal AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE groupBox5 AS System.Windows.Forms.GroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE txtSumFunctionRTTotal AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtSumFunctionRT4 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtSumFunctionRT3 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtSumFunctionRT2 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtSumFunctionRT1 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE groupBox6 AS System.Windows.Forms.GroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE txtAdditionRTTotal AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtAdditionRT4 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtAdditionRT3 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtAdditionRT2 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtAdditionRT1 AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.

	DEFINE PRIVATE VARIABLE ultraCalcManager1 AS Infragistics.Win.UltraWinCalcManager.UltraCalcManager NO-UNDO.
	CONSTRUCTOR PUBLIC BasicMath (  ):
		
		SUPER().
		InitializeComponent ( ).

	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC BasicMath ( ):

		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.

	END DESTRUCTOR.

	
























	METHOD PRIVATE VOID InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

		components = NEW System.ComponentModel.Container().
		label2 = NEW System.Windows.Forms.Label().
		groupBox3 = NEW System.Windows.Forms.GroupBox().
		groupBox2 = NEW System.Windows.Forms.GroupBox().
		txtSumFunctionTotal = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtSumFunction4 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtSumFunction3 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtSumFunction2 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtSumFunction1 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		groupBox1 = NEW System.Windows.Forms.GroupBox().
		txtAdditionTotal = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtAddition4 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtAddition3 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtAddition2 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtAddition1 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		groupBox4 = NEW System.Windows.Forms.GroupBox().
		label1 = NEW System.Windows.Forms.Label().
		txtGrandTotal = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		groupBox5 = NEW System.Windows.Forms.GroupBox().
		txtSumFunctionRTTotal = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtSumFunctionRT4 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtSumFunctionRT3 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtSumFunctionRT2 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtSumFunctionRT1 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		groupBox6 = NEW System.Windows.Forms.GroupBox().
		txtAdditionRTTotal = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtAdditionRT4 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtAdditionRT3 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtAdditionRT2 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		txtAdditionRT1 = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		ultraCalcManager1 = NEW Infragistics.Win.UltraWinCalcManager.UltraCalcManager(components).
		groupBox3:SuspendLayout().
		groupBox2:SuspendLayout().
		CAST(txtSumFunctionTotal, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtSumFunction4, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtSumFunction3, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtSumFunction2, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtSumFunction1, System.ComponentModel.ISupportInitialize):BeginInit().
		groupBox1:SuspendLayout().
		CAST(txtAdditionTotal, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtAddition4, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtAddition3, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtAddition2, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtAddition1, System.ComponentModel.ISupportInitialize):BeginInit().
		groupBox4:SuspendLayout().
		CAST(txtGrandTotal, System.ComponentModel.ISupportInitialize):BeginInit().
		groupBox5:SuspendLayout().
		CAST(txtSumFunctionRTTotal, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtSumFunctionRT4, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtSumFunctionRT3, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtSumFunctionRT2, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtSumFunctionRT1, System.ComponentModel.ISupportInitialize):BeginInit().
		groupBox6:SuspendLayout().
		CAST(txtAdditionRTTotal, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtAdditionRT4, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtAdditionRT3, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtAdditionRT2, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(txtAdditionRT1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(ultraCalcManager1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* label2 */
		/*  */
		label2:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 10, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		label2:Location = NEW System.Drawing.Point(13, 8).
		label2:Name = "label2".
		label2:Size = NEW System.Drawing.Size(552, 20).
		label2:TabIndex = 8.
		label2:Text = "Change the values in the textboxes to see the totals update automatically".
		label2:UseCompatibleTextRendering = TRUE.
		/*  */
		/* groupBox3 */
		/*  */
		groupBox3:Controls:Add(groupBox2).
		groupBox3:Controls:Add(groupBox1).
		groupBox3:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		groupBox3:Location = NEW System.Drawing.Point(26, 48).
		groupBox3:Name = "groupBox3".
		groupBox3:Size = NEW System.Drawing.Size(216, 176).
		groupBox3:TabIndex = 9.
		groupBox3:TabStop = FALSE.
		groupBox3:Text = "Formulas created at Design-time".
		groupBox3:UseCompatibleTextRendering = TRUE.
		/*  */
		/* groupBox2 */
		/*  */
		groupBox2:Controls:Add(txtSumFunctionTotal).
		groupBox2:Controls:Add(txtSumFunction4).
		groupBox2:Controls:Add(txtSumFunction3).
		groupBox2:Controls:Add(txtSumFunction2).
		groupBox2:Controls:Add(txtSumFunction1).
		groupBox2:Location = NEW System.Drawing.Point(112, 16).
		groupBox2:Name = "groupBox2".
		groupBox2:Size = NEW System.Drawing.Size(96, 152).
		groupBox2:TabIndex = 3.
		groupBox2:TabStop = FALSE.
		groupBox2:Text = "Sum Function".
		groupBox2:UseCompatibleTextRendering = TRUE.
		/*  */
		/* txtSumFunctionTotal */
		/*  */
		ultraCalcManager1:SetCalcSettings(txtSumFunctionTotal, NEW Infragistics.Win.UltraWinCalcManager.CalcSettings(?, ?, "sum( [//txtSumFunction1] , [//txtSumFunction2] , [//txtSumFunction3] , [//txtSumFunction4] )", "Text", Infragistics.Win.UltraWinCalcManager.CalcErrorIconAlignment:Default, ?)).
		txtSumFunctionTotal:Location = NEW System.Drawing.Point(8, 120).
		txtSumFunctionTotal:Name = "txtSumFunctionTotal".
		txtSumFunctionTotal:ReadOnly = TRUE.
		txtSumFunctionTotal:Size = NEW System.Drawing.Size(56, 21).
		txtSumFunctionTotal:TabIndex = 4.
		txtSumFunctionTotal:Text = "Total".
		/*  */
		/* txtSumFunction4 */
		/*  */
		ultraCalcManager1:SetCalcSettings(txtSumFunction4, NEW Infragistics.Win.UltraWinCalcManager.CalcSettings(?, ?, ?, "Text", Infragistics.Win.UltraWinCalcManager.CalcErrorIconAlignment:Default, ?)).
		txtSumFunction4:Location = NEW System.Drawing.Point(8, 88).
		txtSumFunction4:Name = "txtSumFunction4".
		txtSumFunction4:Size = NEW System.Drawing.Size(56, 21).
		txtSumFunction4:TabIndex = 3.
		txtSumFunction4:Text = "4".
		/*  */
		/* txtSumFunction3 */
		/*  */
		ultraCalcManager1:SetCalcSettings(txtSumFunction3, NEW Infragistics.Win.UltraWinCalcManager.CalcSettings(?, ?, ?, "Text", Infragistics.Win.UltraWinCalcManager.CalcErrorIconAlignment:Default, ?)).
		txtSumFunction3:Location = NEW System.Drawing.Point(8, 64).
		txtSumFunction3:Name = "txtSumFunction3".
		txtSumFunction3:Size = NEW System.Drawing.Size(56, 21).
		txtSumFunction3:TabIndex = 2.
		txtSumFunction3:Text = "3".
		/*  */
		/* txtSumFunction2 */
		/*  */
		ultraCalcManager1:SetCalcSettings(txtSumFunction2, NEW Infragistics.Win.UltraWinCalcManager.CalcSettings(?, ?, ?, "Text", Infragistics.Win.UltraWinCalcManager.CalcErrorIconAlignment:Default, ?)).
		txtSumFunction2:Location = NEW System.Drawing.Point(8, 40).
		txtSumFunction2:Name = "txtSumFunction2".
		txtSumFunction2:Size = NEW System.Drawing.Size(56, 21).
		txtSumFunction2:TabIndex = 1.
		txtSumFunction2:Text = "2".
		/*  */
		/* txtSumFunction1 */
		/*  */
		ultraCalcManager1:SetCalcSettings(txtSumFunction1, NEW Infragistics.Win.UltraWinCalcManager.CalcSettings(?, ?, ?, "Text", Infragistics.Win.UltraWinCalcManager.CalcErrorIconAlignment:Default, ?)).
		txtSumFunction1:Location = NEW System.Drawing.Point(8, 16).
		txtSumFunction1:Name = "txtSumFunction1".
		txtSumFunction1:Size = NEW System.Drawing.Size(56, 21).
		txtSumFunction1:TabIndex = 0.
		txtSumFunction1:Text = "1".
		/*  */
		/* groupBox1 */
		/*  */
		groupBox1:Controls:Add(txtAdditionTotal).
		groupBox1:Controls:Add(txtAddition4).
		groupBox1:Controls:Add(txtAddition3).
		groupBox1:Controls:Add(txtAddition2).
		groupBox1:Controls:Add(txtAddition1).
		groupBox1:Location = NEW System.Drawing.Point(8, 16).
		groupBox1:Name = "groupBox1".
		groupBox1:Size = NEW System.Drawing.Size(96, 152).
		groupBox1:TabIndex = 2.
		groupBox1:TabStop = FALSE.
		groupBox1:Text = "Addition".
		groupBox1:UseCompatibleTextRendering = TRUE.
		/*  */
		/* txtAdditionTotal */
		/*  */
		ultraCalcManager1:SetCalcSettings(txtAdditionTotal, NEW Infragistics.Win.UltraWinCalcManager.CalcSettings(?, ?, "[//txtAddition1] + [//txtAddition2] + [//txtAddition3] + [//txtAddition4]", "Text", Infragistics.Win.UltraWinCalcManager.CalcErrorIconAlignment:Default, ?)).
		txtAdditionTotal:Location = NEW System.Drawing.Point(8, 120).
		txtAdditionTotal:Name = "txtAdditionTotal".
		txtAdditionTotal:ReadOnly = TRUE.
		txtAdditionTotal:Size = NEW System.Drawing.Size(56, 21).
		txtAdditionTotal:TabIndex = 4.
		txtAdditionTotal:Text = "Total".
		/*  */
		/* txtAddition4 */
		/*  */
		ultraCalcManager1:SetCalcSettings(txtAddition4, NEW Infragistics.Win.UltraWinCalcManager.CalcSettings(?, ?, ?, "Text", Infragistics.Win.UltraWinCalcManager.CalcErrorIconAlignment:Default, ?)).
		txtAddition4:Location = NEW System.Drawing.Point(8, 88).
		txtAddition4:Name = "txtAddition4".
		txtAddition4:Size = NEW System.Drawing.Size(56, 21).
		txtAddition4:TabIndex = 3.
		txtAddition4:Text = "4".
		/*  */
		/* txtAddition3 */
		/*  */
		ultraCalcManager1:SetCalcSettings(txtAddition3, NEW Infragistics.Win.UltraWinCalcManager.CalcSettings(?, ?, ?, "Text", Infragistics.Win.UltraWinCalcManager.CalcErrorIconAlignment:Default, ?)).
		txtAddition3:Location = NEW System.Drawing.Point(8, 64).
		txtAddition3:Name = "txtAddition3".
		txtAddition3:Size = NEW System.Drawing.Size(56, 21).
		txtAddition3:TabIndex = 2.
		txtAddition3:Text = "3".
		/*  */
		/* txtAddition2 */
		/*  */
		ultraCalcManager1:SetCalcSettings(txtAddition2, NEW Infragistics.Win.UltraWinCalcManager.CalcSettings(?, ?, ?, "Text", Infragistics.Win.UltraWinCalcManager.CalcErrorIconAlignment:Default, ?)).
		txtAddition2:Location = NEW System.Drawing.Point(8, 40).
		txtAddition2:Name = "txtAddition2".
		txtAddition2:Size = NEW System.Drawing.Size(56, 21).
		txtAddition2:TabIndex = 1.
		txtAddition2:Text = "2".
		/*  */
		/* txtAddition1 */
		/*  */
		ultraCalcManager1:SetCalcSettings(txtAddition1, NEW Infragistics.Win.UltraWinCalcManager.CalcSettings(?, ?, ?, "Text", Infragistics.Win.UltraWinCalcManager.CalcErrorIconAlignment:Default, ?)).
		txtAddition1:Location = NEW System.Drawing.Point(8, 16).
		txtAddition1:Name = "txtAddition1".
		txtAddition1:Size = NEW System.Drawing.Size(56, 21).
		txtAddition1:TabIndex = 0.
		txtAddition1:Text = "1".
		/*  */
		/* groupBox4 */
		/*  */
		groupBox4:Controls:Add(label1).
		groupBox4:Controls:Add(txtGrandTotal).
		groupBox4:Controls:Add(groupBox5).
		groupBox4:Controls:Add(groupBox6).
		groupBox4:Location = NEW System.Drawing.Point(258, 48).
		groupBox4:Name = "groupBox4".
		groupBox4:Size = NEW System.Drawing.Size(320, 176).
		groupBox4:TabIndex = 10.
		groupBox4:TabStop = FALSE.
		groupBox4:Text = "Formulas created at Run-time".
		groupBox4:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label1 */
		/*  */
		label1:Location = NEW System.Drawing.Point(216, 120).
		label1:Name = "label1".
		label1:Size = NEW System.Drawing.Size(96, 16).
		label1:TabIndex = 8.
		label1:Text = "Grand Total".
		label1:UseCompatibleTextRendering = TRUE.
		/*  */
		/* txtGrandTotal */
		/*  */
		txtGrandTotal:Location = NEW System.Drawing.Point(216, 136).
		txtGrandTotal:Name = "txtGrandTotal".
		txtGrandTotal:ReadOnly = TRUE.
		txtGrandTotal:Size = NEW System.Drawing.Size(72, 21).
		txtGrandTotal:TabIndex = 7.
		txtGrandTotal:Text = "Total".
		/*  */
		/* groupBox5 */
		/*  */
		groupBox5:Controls:Add(txtSumFunctionRTTotal).
		groupBox5:Controls:Add(txtSumFunctionRT4).
		groupBox5:Controls:Add(txtSumFunctionRT3).
		groupBox5:Controls:Add(txtSumFunctionRT2).
		groupBox5:Controls:Add(txtSumFunctionRT1).
		groupBox5:Location = NEW System.Drawing.Point(112, 16).
		groupBox5:Name = "groupBox5".
		groupBox5:Size = NEW System.Drawing.Size(96, 152).
		groupBox5:TabIndex = 3.
		groupBox5:TabStop = FALSE.
		groupBox5:Text = "Sum Function".
		groupBox5:UseCompatibleTextRendering = TRUE.
		/*  */
		/* txtSumFunctionRTTotal */
		/*  */
		txtSumFunctionRTTotal:Location = NEW System.Drawing.Point(8, 120).
		txtSumFunctionRTTotal:Name = "txtSumFunctionRTTotal".
		txtSumFunctionRTTotal:ReadOnly = TRUE.
		txtSumFunctionRTTotal:Size = NEW System.Drawing.Size(56, 21).
		txtSumFunctionRTTotal:TabIndex = 4.
		txtSumFunctionRTTotal:Text = "Total".
		/*  */
		/* txtSumFunctionRT4 */
		/*  */
		txtSumFunctionRT4:Location = NEW System.Drawing.Point(8, 88).
		txtSumFunctionRT4:Name = "txtSumFunctionRT4".
		txtSumFunctionRT4:Size = NEW System.Drawing.Size(56, 21).
		txtSumFunctionRT4:TabIndex = 3.
		txtSumFunctionRT4:Text = "4".
		/*  */
		/* txtSumFunctionRT3 */
		/*  */
		txtSumFunctionRT3:Location = NEW System.Drawing.Point(8, 64).
		txtSumFunctionRT3:Name = "txtSumFunctionRT3".
		txtSumFunctionRT3:Size = NEW System.Drawing.Size(56, 21).
		txtSumFunctionRT3:TabIndex = 2.
		txtSumFunctionRT3:Text = "3".
		/*  */
		/* txtSumFunctionRT2 */
		/*  */
		txtSumFunctionRT2:Location = NEW System.Drawing.Point(8, 40).
		txtSumFunctionRT2:Name = "txtSumFunctionRT2".
		txtSumFunctionRT2:Size = NEW System.Drawing.Size(56, 21).
		txtSumFunctionRT2:TabIndex = 1.
		txtSumFunctionRT2:Text = "2".
		/*  */
		/* txtSumFunctionRT1 */
		/*  */
		txtSumFunctionRT1:Location = NEW System.Drawing.Point(8, 16).
		txtSumFunctionRT1:Name = "txtSumFunctionRT1".
		txtSumFunctionRT1:Size = NEW System.Drawing.Size(56, 21).
		txtSumFunctionRT1:TabIndex = 0.
		txtSumFunctionRT1:Text = "1".
		/*  */
		/* groupBox6 */
		/*  */
		groupBox6:Controls:Add(txtAdditionRTTotal).
		groupBox6:Controls:Add(txtAdditionRT4).
		groupBox6:Controls:Add(txtAdditionRT3).
		groupBox6:Controls:Add(txtAdditionRT2).
		groupBox6:Controls:Add(txtAdditionRT1).
		groupBox6:Location = NEW System.Drawing.Point(8, 16).
		groupBox6:Name = "groupBox6".
		groupBox6:Size = NEW System.Drawing.Size(96, 152).
		groupBox6:TabIndex = 2.
		groupBox6:TabStop = FALSE.
		groupBox6:Text = "Addition".
		groupBox6:UseCompatibleTextRendering = TRUE.
		/*  */
		/* txtAdditionRTTotal */
		/*  */
		txtAdditionRTTotal:Location = NEW System.Drawing.Point(8, 120).
		txtAdditionRTTotal:Name = "txtAdditionRTTotal".
		txtAdditionRTTotal:ReadOnly = TRUE.
		txtAdditionRTTotal:Size = NEW System.Drawing.Size(56, 21).
		txtAdditionRTTotal:TabIndex = 4.
		txtAdditionRTTotal:Text = "Total".
		/*  */
		/* txtAdditionRT4 */
		/*  */
		txtAdditionRT4:Location = NEW System.Drawing.Point(8, 88).
		txtAdditionRT4:Name = "txtAdditionRT4".
		txtAdditionRT4:Size = NEW System.Drawing.Size(56, 21).
		txtAdditionRT4:TabIndex = 3.
		txtAdditionRT4:Text = "4".
		/*  */
		/* txtAdditionRT3 */
		/*  */
		txtAdditionRT3:Location = NEW System.Drawing.Point(8, 64).
		txtAdditionRT3:Name = "txtAdditionRT3".
		txtAdditionRT3:Size = NEW System.Drawing.Size(56, 21).
		txtAdditionRT3:TabIndex = 2.
		txtAdditionRT3:Text = "3".
		/*  */
		/* txtAdditionRT2 */
		/*  */
		txtAdditionRT2:Location = NEW System.Drawing.Point(8, 40).
		txtAdditionRT2:Name = "txtAdditionRT2".
		txtAdditionRT2:Size = NEW System.Drawing.Size(56, 21).
		txtAdditionRT2:TabIndex = 1.
		txtAdditionRT2:Text = "2".
		/*  */
		/* txtAdditionRT1 */
		/*  */
		txtAdditionRT1:Location = NEW System.Drawing.Point(8, 16).
		txtAdditionRT1:Name = "txtAdditionRT1".
		txtAdditionRT1:Size = NEW System.Drawing.Size(56, 21).
		txtAdditionRT1:TabIndex = 0.
		txtAdditionRT1:Text = "1".
		/*  */
		/* ultraCalcManager1 */
		/*  */
		ultraCalcManager1:ContainingControl = THIS-OBJECT.
		/*  */
		/* BasicMath */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(630, 266).
		THIS-OBJECT:Controls:Add(groupBox4).
		THIS-OBJECT:Controls:Add(groupBox3).
		THIS-OBJECT:Controls:Add(label2).
		THIS-OBJECT:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:Name = "BasicMath".
		THIS-OBJECT:Text = "BasicMath".
		THIS-OBJECT:Load:SUBSCRIBE(THIS-OBJECT:BasicMath_Load).
		groupBox3:ResumeLayout(FALSE).
		groupBox2:ResumeLayout(FALSE).
		groupBox2:PerformLayout().
		CAST(txtSumFunctionTotal, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtSumFunction4, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtSumFunction3, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtSumFunction2, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtSumFunction1, System.ComponentModel.ISupportInitialize):EndInit().
		groupBox1:ResumeLayout(FALSE).
		groupBox1:PerformLayout().
		CAST(txtAdditionTotal, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtAddition4, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtAddition3, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtAddition2, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtAddition1, System.ComponentModel.ISupportInitialize):EndInit().
		groupBox4:ResumeLayout(FALSE).
		groupBox4:PerformLayout().
		CAST(txtGrandTotal, System.ComponentModel.ISupportInitialize):EndInit().
		groupBox5:ResumeLayout(FALSE).
		groupBox5:PerformLayout().
		CAST(txtSumFunctionRTTotal, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtSumFunctionRT4, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtSumFunctionRT3, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtSumFunctionRT2, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtSumFunctionRT1, System.ComponentModel.ISupportInitialize):EndInit().
		groupBox6:ResumeLayout(FALSE).
		groupBox6:PerformLayout().
		CAST(txtAdditionRTTotal, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtAdditionRT4, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtAdditionRT3, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtAdditionRT2, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(txtAdditionRT1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(ultraCalcManager1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ResumeLayout(FALSE).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose: subscribe to the form's Load event  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID BasicMath_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		createFormulas().
		RETURN.

	END METHOD.

    method private void CreateFormulas():
		CreateAdditionFormulas().
		CreateSumFunctionFormulas().
        SetPropertyName(txtGrandTotal, "Text").
		SetFormula(txtGrandTotal, "sum ( [//txtAdditionTotal] , [//txtSumFunctionTotal], [//txtAdditionRTTotal] , [//txtSumFunctionRTTotal] ) " ).
	end method.
   
	method private void CreateAdditionFormulas():
     
        /*	
        In order to use a simple control (which does not implement 
        IUltraCalcParticipant) in a formula, the PropertyName on the 
        CalcSettings extender property must first be set. */
		SetPropertyName(txtAdditionRT1, "Text").						
		SetPropertyName(txtAdditionRT2, "Text").
		SetPropertyName(txtAdditionRT3, "Text").
		SetPropertyName(txtAdditionRT4, "Text").
		SetPropertyName(txtAdditionRTTotal, "Text").

		/* Set the formula */
		SetFormula(txtAdditionRTTotal, "[//txtAdditionRT1] + [//txtAdditionRT2] + [//txtAdditionRT3] + [//txtAdditionRT4]").
    end.

	method private void CreateSumFunctionFormulas():
		/*
		In order to use a simple control (which does not 
		implement IUltraCalcParticipant) in a formula, the 
		PropertyName on the CalcSettings extender 
		property must first be set. */ 
		SetPropertyName(txtSumFunctionRT1, "Text").						
		SetPropertyName(txtSumFunctionRT2, "Text").
		SetPropertyName(txtSumFunctionRT3, "Text").
		SetPropertyName(txtSumFunctionRT4, "Text").
		SetPropertyName(txtSumFunctionRTTotal, "Text").

		/* Set the formula*/
		SetFormula(txtSumFunctionRTTotal, "sum( [//txtSumFunctionRT1] , [//txtSumFunctionRT2] , [//txtSumFunctionRT3] , [//txtSumFunctionRT4] )").
	end.
   
      
	method private void SetPropertyName(cntrl as System.Windows.Forms.Control, propertyName as char):
		define variable oCalcSettings as Infragistics.Win.UltraWinCalcManager.CalcSettings.
	    /*
		To acces the CalcManager extender properties, call the first get in 
		the GetCalcSettings method. */
		
		oCalcSettings = ultraCalcManager1:GetCalcSettings(cntrl). 

        /*
		Set the PropertyName. This will prepare the control to be 
		used in calculations. Note that in order for a control to
		function properly as the SOURCE value of a calculation, the
		property must also have a changed event. For example, if using
		the Text property, the control must have a TextChanged event. 
		Otherwise, the CalcManager cannot detect changes in the property.*/
		oCalcSettings:PropertyName = propertyName. 
	end.

	method private void SetFormula(cntrl as System.Windows.Forms.Control, formula as char):
		define variable oCalcSettings as Infragistics.Win.UltraWinCalcManager.CalcSettings.
	    /*
		To access the CalcManager extender properties, call the first get in 
		the GetCalcSettings method. */
		
		oCalcSettings = ultraCalcManager1:GetCalcSettings(cntrl). 
		oCalcSettings:Formula = formula.
	end.
 end class.