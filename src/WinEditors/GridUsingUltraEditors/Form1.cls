 
 /*------------------------------------------------------------------------
    File        : Form1
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Wed May 14 16:03:43 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

USING System.Drawing.*.
USING Infragistics.Win.*.
USING Infragistics.Win.UltraWinGrid.*.
USING Infragistics.Win.UltraWinEditors.*.
USING Infragistics.Win.UltraWinEditors.UltraWinCalc.*.

USING Progress.Util.TypeHelper.*.

CLASS WinEditors.GridUsingUltraEditors.Form1 INHERITS Form   : 

	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.

	DEFINE PRIVATE VARIABLE label3 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE label1 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraGrid1 AS Infragistics.Win.UltraWinGrid.UltraGrid NO-UNDO.
	DEFINE PRIVATE VARIABLE chkSupportThemes AS System.Windows.Forms.CheckBox NO-UNDO.
	DEFINE PRIVATE VARIABLE label2 AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE lblDisplayStyle AS System.Windows.Forms.Label NO-UNDO.
	DEFINE PRIVATE VARIABLE groupBox1 AS System.Windows.Forms.GroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE cboDisplayStyle AS System.Windows.Forms.ComboBox NO-UNDO.

    DEFINE PRIVATE VARIABLE tblOrders   AS System.Data.DataTable NO-UNDO.
    DEFINE PRIVATE PROPERTY OrdersTable AS System.Data.DataTable NO-UNDO
	GET:
	    DEFINE VARIABLE record AS System.Array NO-UNDO.

	    IF tblOrders = ? THEN
        DO:
            record = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Object"), 7).
		    /*Create Table*/
			tblOrders = new System.Data.DataTable("tblOrders").
			tblOrders:Columns:Add("Item",Progress.Util.TypeHelper:GetType("System.String")).
			tblOrders:Columns:Add("ItemPrice",Progress.Util.TypeHelper:GetType("System.Decimal")).
			tblOrders:Columns:Add("OrderBudget",Progress.Util.TypeHelper:GetType("System.Int32")).
			tblOrders:Columns:Add("Par",Progress.Util.TypeHelper:GetType("System.Int32")).
			tblOrders:Columns:Add("CurrentCount",Progress.Util.TypeHelper:GetType("System.Int32")).
			tblOrders:Columns:Add("AutoOrder",Progress.Util.TypeHelper:GetType("System.Boolean")).
			tblOrders:Columns:Add("OrderedAmount",Progress.Util.TypeHelper:GetType("System.Decimal")).

            /*Add Simulation Data*/

			/*Meat 0*/
			record:SetValue("Buffalo Wings",0).
			record:SetValue(4,1).
			record:SetValue(0,2).
			record:SetValue(5,3).
			record:SetValue(3,4).
			record:SetValue(true,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Stuffed Chicken",0).
			record:SetValue(12,1).
			record:SetValue(0,2).
			record:SetValue(10,3).
			record:SetValue(4,4).
			record:SetValue(false,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Steaks",0).
			record:SetValue(18,1).
			record:SetValue(0,2).
			record:SetValue(6,3).
			record:SetValue(2,4).
			record:SetValue(true,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Ribs",0).
			record:SetValue(12,1).
			record:SetValue(0,2).
			record:SetValue(18,3).
			record:SetValue(12,4).
			record:SetValue(true,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).

			/*Produce 1*/
			record:SetValue("Lettuce",0).
			record:SetValue(3,1).
			record:SetValue(1,2).
			record:SetValue(6,3).
			record:SetValue(0,4).
			record:SetValue(false,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Carrots",0).
			record:SetValue(2,1).
			record:SetValue(1,2).
			record:SetValue(10,3).
			record:SetValue(7,4).
			record:SetValue(false,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Red Peppers",0).
			record:SetValue(2,1).
			record:SetValue(1,2).
			record:SetValue(20,3).
			record:SetValue(10,4).
			record:SetValue(true,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Green Peppers",0).
			record:SetValue(3,1).
			record:SetValue(1,2).
			record:SetValue(22,3).
			record:SetValue(8,4).
			record:SetValue(false,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).

			/*Dairy 2*/
			record:SetValue("Milk",0).
			record:SetValue(3,1).
			record:SetValue(2,2).
			record:SetValue(12,3).
			record:SetValue(2,4).
			record:SetValue(false,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Heavy Cream",0).
			record:SetValue(3,1).
			record:SetValue(2,2).
			record:SetValue(6,3).
			record:SetValue(2,4).
			record:SetValue(false,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Sour Cream",0).
			record:SetValue(4,1).
			record:SetValue(2,2).
			record:SetValue(8,3).
			record:SetValue(3,4).
			record:SetValue(true,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Ice Cream",0).
			record:SetValue(5,1).
			record:SetValue(2,2).
			record:SetValue(16,3).
			record:SetValue(10,4).
			record:SetValue(false,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Mozzarella",0).
			record:SetValue(3,1).
			record:SetValue(2,2).
			record:SetValue(15,3).
			record:SetValue(0,4).
			record:SetValue(true,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Parmesan",0).
			record:SetValue(2,1).
			record:SetValue(2,2).
			record:SetValue(7,3).
			record:SetValue(5,4).
			record:SetValue(true,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Monterey Jack",0).
			record:SetValue(6,1).
			record:SetValue(2,2).
			record:SetValue(4,3).
			record:SetValue(3,4).
			record:SetValue(true,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).

			/*MiscFood 3*/
			record:SetValue("Cookie Crumbs",0).
			record:SetValue(25,1).
			record:SetValue(3,2).
			record:SetValue(1,3).
			record:SetValue(1,4).
			record:SetValue(false,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Snickers Bar",0).
			record:SetValue(1,1).
			record:SetValue(3,2).
			record:SetValue(30,3).
			record:SetValue(12,4).
			record:SetValue(false,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Garlic Bread",0).
			record:SetValue(10,1).
			record:SetValue(3,2).
			record:SetValue(30,3).
			record:SetValue(4,4).
			record:SetValue(true,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).

			/*Non Food Items 4*/
			record:SetValue("Glass Cleaner",0).
			record:SetValue(4,1).
			record:SetValue(4,2).
			record:SetValue(6,3).
			record:SetValue(3,4).
			record:SetValue(true,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Vacuum Cleaners",0).
			record:SetValue(235,1).
			record:SetValue(4,2).
			record:SetValue(1,3).
			record:SetValue(1,4).
			record:SetValue(false,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Towels",0).
			record:SetValue(0.25,1).
			record:SetValue(4,2).
			record:SetValue(40,3).
			record:SetValue(10,4).
			record:SetValue(true,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).
			record:SetValue("Napkins",0).
			record:SetValue(0.10,1).
			record:SetValue(4,2).
			record:SetValue(400,3).
			record:SetValue(12,4).
			record:SetValue(true,5).
			record:SetValue(0,6).
			tblOrders:Rows:Add(CAST(record, "System.Object[]")).

        END. /*IF this.tblOrders = ? THEN*/
        RETURN tblOrders.
	END. 

    DEFINE PRIVATE VARIABLE nonFoodTotalBudget      AS Infragistics.Win.UltraWinEditors.UltraCurrencyEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE dairyTotalBudget        AS Infragistics.Win.UltraWinEditors.UltraCurrencyEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE miscFoodTotalBudget     AS Infragistics.Win.UltraWinEditors.UltraCurrencyEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE meatTotalBudget         AS Infragistics.Win.UltraWinEditors.UltraCurrencyEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE produceTotalBudget      AS Infragistics.Win.UltraWinEditors.UltraCurrencyEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE nonFoodAvailableBudget  AS Infragistics.Win.UltraWinEditors.UltraCurrencyEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE dairyAvailableBudget    AS Infragistics.Win.UltraWinEditors.UltraCurrencyEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE miscFoodAvailableBudget AS Infragistics.Win.UltraWinEditors.UltraCurrencyEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE meatAvailableBudget     AS Infragistics.Win.UltraWinEditors.UltraCurrencyEditor NO-UNDO.
    DEFINE PRIVATE VARIABLE produceAvailableBudget  AS Infragistics.Win.UltraWinEditors.UltraCurrencyEditor NO-UNDO.

    DEFINE PRIVATE VARIABLE ultraOptionSet1 AS Infragistics.Win.UltraWinEditors.UltraOptionSet NO-UNDO.

    DEFINE PRIVATE VARIABLE ultraCalculatorDropDown1 AS Infragistics.Win.UltraWinEditors.UltraWinCalc.UltraCalculatorDropDown NO-UNDO.
/*GET DEFINE PRIVATE PROPERTY System.Data.DataTable OrdersTable*/

	CONSTRUCTOR PUBLIC Form1 (  ):
		
		SUPER().
		InitializeComponent ( ).

	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC Form1 ( ):

		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.

	END DESTRUCTOR.

	METHOD PRIVATE VOID InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE valueListItem1 AS Infragistics.Win.ValueListItem NO-UNDO.
		valueListItem1 = NEW Infragistics.Win.ValueListItem().
		THIS-OBJECT:label3 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:label1 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:ultraGrid1 = NEW Infragistics.Win.UltraWinGrid.UltraGrid().
		THIS-OBJECT:chkSupportThemes = NEW System.Windows.Forms.CheckBox().
		THIS-OBJECT:label2 = NEW System.Windows.Forms.Label().
		THIS-OBJECT:lblDisplayStyle = NEW System.Windows.Forms.Label().
		THIS-OBJECT:groupBox1 = NEW System.Windows.Forms.GroupBox().
		THIS-OBJECT:nonFoodTotalBudget = NEW Infragistics.Win.UltraWinEditors.UltraCurrencyEditor().
		THIS-OBJECT:dairyTotalBudget = NEW Infragistics.Win.UltraWinEditors.UltraCurrencyEditor().
		THIS-OBJECT:miscFoodTotalBudget = NEW Infragistics.Win.UltraWinEditors.UltraCurrencyEditor().
		THIS-OBJECT:meatTotalBudget = NEW Infragistics.Win.UltraWinEditors.UltraCurrencyEditor().
		THIS-OBJECT:produceTotalBudget = NEW Infragistics.Win.UltraWinEditors.UltraCurrencyEditor().
		THIS-OBJECT:nonFoodAvailableBudget = NEW Infragistics.Win.UltraWinEditors.UltraCurrencyEditor().
		THIS-OBJECT:dairyAvailableBudget = NEW Infragistics.Win.UltraWinEditors.UltraCurrencyEditor().
		THIS-OBJECT:miscFoodAvailableBudget = NEW Infragistics.Win.UltraWinEditors.UltraCurrencyEditor().
		THIS-OBJECT:meatAvailableBudget = NEW Infragistics.Win.UltraWinEditors.UltraCurrencyEditor().
		THIS-OBJECT:produceAvailableBudget = NEW Infragistics.Win.UltraWinEditors.UltraCurrencyEditor().
		THIS-OBJECT:cboDisplayStyle = NEW System.Windows.Forms.ComboBox().
		THIS-OBJECT:ultraOptionSet1 = NEW Infragistics.Win.UltraWinEditors.UltraOptionSet().
		THIS-OBJECT:ultraCalculatorDropDown1 = NEW Infragistics.Win.UltraWinEditors.UltraWinCalc.UltraCalculatorDropDown().
		CAST(THIS-OBJECT:ultraGrid1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:groupBox1:SuspendLayout().
		CAST(THIS-OBJECT:nonFoodTotalBudget, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:dairyTotalBudget, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:miscFoodTotalBudget, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:meatTotalBudget, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:produceTotalBudget, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:nonFoodAvailableBudget, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:dairyAvailableBudget, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:miscFoodAvailableBudget, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:meatAvailableBudget, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:produceAvailableBudget, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraOptionSet1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraCalculatorDropDown1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* label3 */
		/*  */
		THIS-OBJECT:label3:Location = NEW System.Drawing.Point(400, 77).
		THIS-OBJECT:label3:Name = "label3".
		THIS-OBJECT:label3:Size = NEW System.Drawing.Size(56, 16).
		THIS-OBJECT:label3:TabIndex = 18.
		THIS-OBJECT:label3:Text = "Available".
		THIS-OBJECT:label3:UseCompatibleTextRendering = TRUE.
		/*  */
		/* label1 */
		/*  */
		THIS-OBJECT:label1:Location = NEW System.Drawing.Point(398, 45).
		THIS-OBJECT:label1:Name = "label1".
		THIS-OBJECT:label1:Size = NEW System.Drawing.Size(48, 16).
		THIS-OBJECT:label1:TabIndex = 17.
		THIS-OBJECT:label1:Text = "Total".
		THIS-OBJECT:label1:UseCompatibleTextRendering = TRUE.
		/*  */
		/* ultraGrid1 */
		/*  */
		THIS-OBJECT:ultraGrid1:Location = NEW System.Drawing.Point(12, 12).
		THIS-OBJECT:ultraGrid1:Name = "ultraGrid1".
		THIS-OBJECT:ultraGrid1:Size = NEW System.Drawing.Size(704, 288).
		THIS-OBJECT:ultraGrid1:TabIndex = 17.
		THIS-OBJECT:ultraGrid1:Text = "Food Inventory".
		THIS-OBJECT:ultraGrid1:InitializeLayout:SUBSCRIBE(THIS-OBJECT:ultraGrid1_InitializeLayout).
		THIS-OBJECT:ultraGrid1:InitializeRow:SUBSCRIBE(THIS-OBJECT:ultraGrid1_InitializeRow).
		THIS-OBJECT:ultraGrid1:AfterRowUpdate:SUBSCRIBE(THIS-OBJECT:ultraGrid1_AfterRowUpdate).
		THIS-OBJECT:ultraGrid1:CellChange:SUBSCRIBE(THIS-OBJECT:ultraGrid1_CellChange).
		/*  */
		/* chkSupportThemes */
		/*  */
		THIS-OBJECT:chkSupportThemes:Location = NEW System.Drawing.Point(492, 348).
		THIS-OBJECT:chkSupportThemes:Name = "chkSupportThemes".
		THIS-OBJECT:chkSupportThemes:Size = NEW System.Drawing.Size(176, 24).
		THIS-OBJECT:chkSupportThemes:TabIndex = 21.
		THIS-OBJECT:chkSupportThemes:Text = "SupportThemes".
		THIS-OBJECT:chkSupportThemes:UseCompatibleTextRendering = TRUE.
		THIS-OBJECT:chkSupportThemes:CheckedChanged:SUBSCRIBE(THIS-OBJECT:chkSupportThemes_CheckedChanged).
		/*  */
		/* label2 */
		/*  */
		THIS-OBJECT:label2:Location = NEW System.Drawing.Point(8, 24).
		THIS-OBJECT:label2:Name = "label2".
		THIS-OBJECT:label2:Size = NEW System.Drawing.Size(448, 16).
		THIS-OBJECT:label2:TabIndex = 13.
		THIS-OBJECT:label2:Text = "Meat                  Produce             Dairy                   Misc. Food         Non Food".
		THIS-OBJECT:label2:UseCompatibleTextRendering = TRUE.
		/*  */
		/* lblDisplayStyle */
		/*  */
		THIS-OBJECT:lblDisplayStyle:AutoSize = TRUE.
		THIS-OBJECT:lblDisplayStyle:Location = NEW System.Drawing.Point(492, 316).
		THIS-OBJECT:lblDisplayStyle:Name = "lblDisplayStyle".
		THIS-OBJECT:lblDisplayStyle:Size = NEW System.Drawing.Size(67, 17).
		THIS-OBJECT:lblDisplayStyle:TabIndex = 20.
		THIS-OBJECT:lblDisplayStyle:Text = "DisplayStyle".
		THIS-OBJECT:lblDisplayStyle:UseCompatibleTextRendering = TRUE.
		/*  */
		/* groupBox1 */
		/*  */
		THIS-OBJECT:groupBox1:Controls:Add(THIS-OBJECT:nonFoodTotalBudget).
		THIS-OBJECT:groupBox1:Controls:Add(THIS-OBJECT:dairyTotalBudget).
		THIS-OBJECT:groupBox1:Controls:Add(THIS-OBJECT:miscFoodTotalBudget).
		THIS-OBJECT:groupBox1:Controls:Add(THIS-OBJECT:meatTotalBudget).
		THIS-OBJECT:groupBox1:Controls:Add(THIS-OBJECT:produceTotalBudget).
		THIS-OBJECT:groupBox1:Controls:Add(THIS-OBJECT:nonFoodAvailableBudget).
		THIS-OBJECT:groupBox1:Controls:Add(THIS-OBJECT:dairyAvailableBudget).
		THIS-OBJECT:groupBox1:Controls:Add(THIS-OBJECT:miscFoodAvailableBudget).
		THIS-OBJECT:groupBox1:Controls:Add(THIS-OBJECT:meatAvailableBudget).
		THIS-OBJECT:groupBox1:Controls:Add(THIS-OBJECT:produceAvailableBudget).
		THIS-OBJECT:groupBox1:Controls:Add(THIS-OBJECT:label3).
		THIS-OBJECT:groupBox1:Controls:Add(THIS-OBJECT:label1).
		THIS-OBJECT:groupBox1:Controls:Add(THIS-OBJECT:label2).
		THIS-OBJECT:groupBox1:Location = NEW System.Drawing.Point(12, 308).
		THIS-OBJECT:groupBox1:Name = "groupBox1".
		THIS-OBJECT:groupBox1:Size = NEW System.Drawing.Size(464, 104).
		THIS-OBJECT:groupBox1:TabIndex = 18.
		THIS-OBJECT:groupBox1:TabStop = FALSE.
		THIS-OBJECT:groupBox1:Text = "Weekly Order Budgets".
		THIS-OBJECT:groupBox1:UseCompatibleTextRendering = TRUE.
		/*  */
		/* nonFoodTotalBudget */
		/*  */
		THIS-OBJECT:nonFoodTotalBudget:Location = NEW System.Drawing.Point(328, 41).
		THIS-OBJECT:nonFoodTotalBudget:MaskInput = "$-nnnn.nn".
		THIS-OBJECT:nonFoodTotalBudget:Name = "nonFoodTotalBudget".
		THIS-OBJECT:nonFoodTotalBudget:Size = NEW System.Drawing.Size(64, 21).
		THIS-OBJECT:nonFoodTotalBudget:TabIndex = 36.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true", Type="System.Int32").
		DEFINE VARIABLE arrayvar0 AS INTEGER EXTENT 4 NO-UNDO.
		arrayvar0[1] = 50.
		arrayvar0[2] = 0.
		arrayvar0[3] = 0.
		arrayvar0[4] = 0.
		THIS-OBJECT:nonFoodTotalBudget:Value = Progress.Util.DecimalHelper:Create(arrayvar0).
		/*  */
		/* dairyTotalBudget */
		/*  */
		THIS-OBJECT:dairyTotalBudget:Location = NEW System.Drawing.Point(168, 41).
		THIS-OBJECT:dairyTotalBudget:MaskInput = "$-nnnn.nn".
		THIS-OBJECT:dairyTotalBudget:Name = "dairyTotalBudget".
		THIS-OBJECT:dairyTotalBudget:Size = NEW System.Drawing.Size(64, 21).
		THIS-OBJECT:dairyTotalBudget:TabIndex = 35.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true", Type="System.Int32").
		DEFINE VARIABLE arrayvar1 AS INTEGER EXTENT 4 NO-UNDO.
		arrayvar1[1] = 60.
		arrayvar1[2] = 0.
		arrayvar1[3] = 0.
		arrayvar1[4] = 0.
		THIS-OBJECT:dairyTotalBudget:Value = Progress.Util.DecimalHelper:Create(arrayvar1).
		/*  */
		/* miscFoodTotalBudget */
		/*  */
		THIS-OBJECT:miscFoodTotalBudget:Location = NEW System.Drawing.Point(248, 41).
		THIS-OBJECT:miscFoodTotalBudget:MaskInput = "$-nnnn.nn".
		THIS-OBJECT:miscFoodTotalBudget:Name = "miscFoodTotalBudget".
		THIS-OBJECT:miscFoodTotalBudget:Size = NEW System.Drawing.Size(64, 21).
		THIS-OBJECT:miscFoodTotalBudget:TabIndex = 34.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true", Type="System.Int32").
		DEFINE VARIABLE arrayvar2 AS INTEGER EXTENT 4 NO-UNDO.
		arrayvar2[1] = 220.
		arrayvar2[2] = 0.
		arrayvar2[3] = 0.
		arrayvar2[4] = 0.
		THIS-OBJECT:miscFoodTotalBudget:Value = Progress.Util.DecimalHelper:Create(arrayvar2).
		/*  */
		/* meatTotalBudget */
		/*  */
		THIS-OBJECT:meatTotalBudget:Location = NEW System.Drawing.Point(8, 41).
		THIS-OBJECT:meatTotalBudget:MaskInput = "$-nnnn.nn".
		THIS-OBJECT:meatTotalBudget:Name = "meatTotalBudget".
		THIS-OBJECT:meatTotalBudget:Size = NEW System.Drawing.Size(64, 21).
		THIS-OBJECT:meatTotalBudget:TabIndex = 33.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true", Type="System.Int32").
		DEFINE VARIABLE arrayvar3 AS INTEGER EXTENT 4 NO-UNDO.
		arrayvar3[1] = 200.
		arrayvar3[2] = 0.
		arrayvar3[3] = 0.
		arrayvar3[4] = 0.
		THIS-OBJECT:meatTotalBudget:Value = Progress.Util.DecimalHelper:Create(arrayvar3).
		/*  */
		/* produceTotalBudget */
		/*  */
		THIS-OBJECT:produceTotalBudget:Location = NEW System.Drawing.Point(88, 41).
		THIS-OBJECT:produceTotalBudget:MaskInput = "$-nnnn.nn".
		THIS-OBJECT:produceTotalBudget:Name = "produceTotalBudget".
		THIS-OBJECT:produceTotalBudget:Size = NEW System.Drawing.Size(64, 21).
		THIS-OBJECT:produceTotalBudget:TabIndex = 32.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true", Type="System.Int32").
		DEFINE VARIABLE arrayvar4 AS INTEGER EXTENT 4 NO-UNDO.
		arrayvar4[1] = 40.
		arrayvar4[2] = 0.
		arrayvar4[3] = 0.
		arrayvar4[4] = 0.
		THIS-OBJECT:produceTotalBudget:Value = Progress.Util.DecimalHelper:Create(arrayvar4).
		/*  */
		/* nonFoodAvailableBudget */
		/*  */
		THIS-OBJECT:nonFoodAvailableBudget:Location = NEW System.Drawing.Point(328, 73).
		THIS-OBJECT:nonFoodAvailableBudget:MaskInput = "$-nnnn.nn".
		THIS-OBJECT:nonFoodAvailableBudget:Name = "nonFoodAvailableBudget".
		THIS-OBJECT:nonFoodAvailableBudget:Size = NEW System.Drawing.Size(64, 21).
		THIS-OBJECT:nonFoodAvailableBudget:TabIndex = 31.
		/*  */
		/* dairyAvailableBudget */
		/*  */
		THIS-OBJECT:dairyAvailableBudget:Location = NEW System.Drawing.Point(168, 73).
		THIS-OBJECT:dairyAvailableBudget:MaskInput = "$-nnnn.nn".
		THIS-OBJECT:dairyAvailableBudget:Name = "dairyAvailableBudget".
		THIS-OBJECT:dairyAvailableBudget:Size = NEW System.Drawing.Size(64, 21).
		THIS-OBJECT:dairyAvailableBudget:TabIndex = 30.
		/*  */
		/* miscFoodAvailableBudget */
		/*  */
		THIS-OBJECT:miscFoodAvailableBudget:Location = NEW System.Drawing.Point(248, 73).
		THIS-OBJECT:miscFoodAvailableBudget:MaskInput = "$-nnnn.nn".
		THIS-OBJECT:miscFoodAvailableBudget:Name = "miscFoodAvailableBudget".
		THIS-OBJECT:miscFoodAvailableBudget:Size = NEW System.Drawing.Size(64, 21).
		THIS-OBJECT:miscFoodAvailableBudget:TabIndex = 29.
		/*  */
		/* meatAvailableBudget */
		/*  */
		THIS-OBJECT:meatAvailableBudget:Location = NEW System.Drawing.Point(8, 73).
		THIS-OBJECT:meatAvailableBudget:MaskInput = "$-nnnn.nn".
		THIS-OBJECT:meatAvailableBudget:Name = "meatAvailableBudget".
		THIS-OBJECT:meatAvailableBudget:Size = NEW System.Drawing.Size(64, 21).
		THIS-OBJECT:meatAvailableBudget:TabIndex = 28.
		/*  */
		/* produceAvailableBudget */
		/*  */
		THIS-OBJECT:produceAvailableBudget:Location = NEW System.Drawing.Point(88, 73).
		THIS-OBJECT:produceAvailableBudget:MaskInput = "$-nnnn.nn".
		THIS-OBJECT:produceAvailableBudget:Name = "produceAvailableBudget".
		THIS-OBJECT:produceAvailableBudget:Size = NEW System.Drawing.Size(64, 21).
		THIS-OBJECT:produceAvailableBudget:TabIndex = 27.
		/*  */
		/* cboDisplayStyle */
		/*  */
		THIS-OBJECT:cboDisplayStyle:Location = NEW System.Drawing.Point(564, 312).
		THIS-OBJECT:cboDisplayStyle:Name = "cboDisplayStyle".
		THIS-OBJECT:cboDisplayStyle:Size = NEW System.Drawing.Size(128, 21).
		THIS-OBJECT:cboDisplayStyle:TabIndex = 19.
		THIS-OBJECT:cboDisplayStyle:Text = "DisplayStyle".
		THIS-OBJECT:cboDisplayStyle:SelectedIndexChanged:SUBSCRIBE(THIS-OBJECT:cboDisplayStyle_SelectedIndexChanged).
		/*  */
		/* ultraOptionSet1 */
		/*  */
		THIS-OBJECT:ultraOptionSet1:BorderStyle = Infragistics.Win.UIElementBorderStyle:None.
		valueListItem1:DataValue = "Default Item".
		valueListItem1:DisplayText = "Default Item".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar5 AS Infragistics.Win.ValueListItem EXTENT 1 NO-UNDO.
		arrayvar5[1] = valueListItem1.
		THIS-OBJECT:ultraOptionSet1:Items:AddRange(arrayvar5).
		THIS-OBJECT:ultraOptionSet1:Location = NEW System.Drawing.Point(332, 200).
		THIS-OBJECT:ultraOptionSet1:Name = "ultraOptionSet1".
		THIS-OBJECT:ultraOptionSet1:Size = NEW System.Drawing.Size(64, 24).
		THIS-OBJECT:ultraOptionSet1:TabIndex = 22.
		THIS-OBJECT:ultraOptionSet1:Visible = FALSE.
		/*  */
		/* ultraCalculatorDropDown1 */
		/*  */
		THIS-OBJECT:ultraCalculatorDropDown1:Location = NEW System.Drawing.Point(197, 169).
		THIS-OBJECT:ultraCalculatorDropDown1:Name = "ultraCalculatorDropDown1".
		THIS-OBJECT:ultraCalculatorDropDown1:Size = NEW System.Drawing.Size(144, 21).
		THIS-OBJECT:ultraCalculatorDropDown1:TabIndex = 23.
		THIS-OBJECT:ultraCalculatorDropDown1:Text = "ultraCalculatorDropDown1".
		THIS-OBJECT:ultraCalculatorDropDown1:Visible = FALSE.
		/*  */
		/* Form1 */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(722, 419).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraCalculatorDropDown1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraOptionSet1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraGrid1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:chkSupportThemes).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:lblDisplayStyle).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:cboDisplayStyle).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:groupBox1).
		THIS-OBJECT:Name = "Form1".
		THIS-OBJECT:Text = "Grid Using Ultra Editors".
		THIS-OBJECT:Load:SUBSCRIBE(THIS-OBJECT:Form1_Load).
		CAST(THIS-OBJECT:ultraGrid1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:groupBox1:ResumeLayout(FALSE).
		THIS-OBJECT:groupBox1:PerformLayout().
		CAST(THIS-OBJECT:nonFoodTotalBudget, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:dairyTotalBudget, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:miscFoodTotalBudget, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:meatTotalBudget, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:produceTotalBudget, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:nonFoodAvailableBudget, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:dairyAvailableBudget, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:miscFoodAvailableBudget, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:meatAvailableBudget, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:produceAvailableBudget, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraOptionSet1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraCalculatorDropDown1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ResumeLayout(FALSE).
		THIS-OBJECT:PerformLayout().
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID Form1_Load(INPUT sender AS System.Object, INPUT e AS System.EventArgs):
	    DEFINE VARIABLE currencyEditor AS UltraCurrencyEditor NO-UNDO.
 
		cboDisplayStyle:Items:Add(EmbeddableElementDisplayStyle:Office2000).
		cboDisplayStyle:Items:Add(EmbeddableElementDisplayStyle:OfficeXP).
		cboDisplayStyle:Items:Add(EmbeddableElementDisplayStyle:Office2003).
		cboDisplayStyle:Items:Add(EmbeddableElementDisplayStyle:Standard).
		cboDisplayStyle:SelectedIndex = 2.

		chkSupportThemes_CheckedChanged(THIS-OBJECT, new System.EventArgs()).

		/*Bind Grid*/
		ultraGrid1:DataSource = OrdersTable.
		SetupGridMetrics().
		/*Set up optionset editor*/
		SetUpUltraOptionSet().
		ultraGrid1:DisplayLayout:Bands[0]:Columns[2]:EditorControl = ultraOptionSet1.

		ultraGrid1:DisplayLayout:Bands[0]:Columns[6]:EditorControl = ultraCalculatorDropDown1.

		ultraGrid1:DisplayLayout:Bands[0]:Columns[0]:CellAppearance:TextVAlign = VAlign:Middle.
		ultraGrid1:DisplayLayout:Bands[0]:Columns[1]:CellAppearance:TextVAlign = VAlign:Middle.
		ultraGrid1:DisplayLayout:Bands[0]:Columns[3]:CellAppearance:TextVAlign = VAlign:Middle.
		ultraGrid1:DisplayLayout:Bands[0]:Columns[4]:CellAppearance:TextVAlign = VAlign:Middle.
		ultraGrid1:DisplayLayout:Bands[0]:Columns[5]:CellAppearance:TextVAlign = VAlign:Middle.
		ultraGrid1:DisplayLayout:Bands[0]:Columns[6]:CellAppearance:TextVAlign = VAlign:Middle.

		currencyEditor = new UltraCurrencyEditor().
		ultraGrid1:DisplayLayout:Bands[0]:Columns[1]:EditorControl = currencyEditor.

		AutoSizeGridColumns (ultraGrid1).
		UpdateBudgets().
	END METHOD. /*Form1_Load*/

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID chkSupportThemes_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE ctrl     AS System.Windows.Forms.Control   NO-UNDO.
	    DEFINE VARIABLE Controls AS System.Collections.IEnumerator NO-UNDO.

	    ASSIGN controls = THIS-OBJECT:Controls:GetEnumerator().

	    REPEAT:
	        IF NOT controls:MoveNext() THEN LEAVE.
	        ctrl = CAST(controls:current, System.Windows.Forms.Control).

	        IF TYPE-OF(ctrl, Infragistics.Win.UltraControlBase) THEN 
	        CAST(ctrl,Infragistics.Win.UltraControlBase):SupportThemes = chkSupportThemes:Checked.
	    END.
	END METHOD. /*chkSupportThemes_CheckedChanged*/

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	
	METHOD PRIVATE VOID SetupGridMetrics(  ):
	    DEFINE VARIABLE gridColumns AS ColumnsCollection NO-UNDO.

	    ultraGrid1:DisplayLayout:Override:DefaultRowHeight = 42.

	    gridColumns = ultraGrid1:DisplayLayout:Bands[0]:Columns.
		gridColumns[1]:Width = 40.
	    gridColumns[1]:Header:Caption = "Price".
		gridColumns[2]:Width = 190.
		gridColumns[2]:Header:Caption = "Budget".
		gridColumns[3]:Width = 30.
		gridColumns[4]:Header:Caption = "Current Count".
	    gridColumns[5]:Header:Caption = "Auto Order".
		gridColumns[6]:Header:Caption = "Ordered".
	END METHOD. /*SetupGridMetrics*/

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID SetUpUltraOptionSet(  ):
	    ultraOptionSet1:Items:Clear().
		ultraOptionSet1:Items:Add(0,"Meat and Poultry").
		ultraOptionSet1:Items:Add(1,"Produce").
		ultraOptionSet1:Items:Add(2,"Dairy").
		ultraOptionSet1:Items:Add(3,"Misc. Food").
		ultraOptionSet1:Items:Add(4,"Non Food").
	END METHOD. /*SetUpUltraOptionSet*/

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID AutoSizeGridColumns(INPUT grid AS Infragistics.Win.UltraWinGrid.UltraGrid):
	    DEFINE VARIABLE bands         AS BandsCollection   NO-UNDO.
	    DEFINE VARIABLE band          AS UltraGridBand     NO-UNDO.
	    DEFINE VARIABLE bandColumns   AS ColumnsCollection NO-UNDO.
	    DEFINE VARIABLE columnObject  AS UltraGridColumn   NO-UNDO.
	    DEFINE VARIABLE totalBands    AS INTEGER           NO-UNDO.
	    DEFINE VARIABLE currentBand   AS INTEGER           NO-UNDO.
	    DEFINE VARIABLE totalColumns  AS INTEGER           NO-UNDO.
	    DEFINE VARIABLE currentColumn AS INTEGER           NO-UNDO.

	    ASSIGN bands      = grid:DisplayLayout:Bands
	           totalBands = bands:COUNT - 1.

        REPEAT currentBand = 0 TO totalBands:
            ASSIGN band = CAST(bands:GetItem(currentBand), UltraGridBand)
                   bandColumns = band:COLUMNS
                   totalColumns = bandColumns:COUNT - 1.

            REPEAT currentColumn = 0 TO totalColumns:
                columnObject = CAST(bandColumns:GetItem(currentColumn), UltraGridColumn).

                IF NOT columnObject:IsChaptered THEN
                    columnObject:PerformAutoResize(PerformAutoSizeType:AllRowsInBand).
            END. /*REPEAT currentColumn = 0 TO totalColumns:*/
        END. /*REPEAT currentBand = 0 TO totalBands:*/
	END METHOD. /*AutoSizeGridColumns*/

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID UpdateBudgets(  ):
        DEFINE VARIABLE meat       AS DECIMAL NO-UNDO.
        DEFINE VARIABLE dairy      AS DECIMAL NO-UNDO.
        DEFINE VARIABLE produce    AS DECIMAL NO-UNDO.
        DEFINE VARIABLE miscFood   AS DECIMAL NO-UNDO.
        DEFINE VARIABLE nonFood    AS DECIMAL NO-UNDO.
        DEFINE VARIABLE difference AS DECIMAL NO-UNDO.
        DEFINE VARIABLE currentRow AS UltraGridRow NO-UNDO.
        DEFINE VARIABLE col2Value  AS INTEGER NO-UNDO.

        ASSIGN meat     = meatTotalBudget:Value
	           dairy    = dairyTotalBudget:Value
	           produce  = produceTotalBudget:Value
	           miscFood = miscFoodTotalBudget:Value
		       nonFood  = nonFoodTotalBudget:Value.

		/*loop thru all the rows in the grid*/
		currentRow = ultraGrid1:GetRow(ChildRow:First).

		REPEAT WHILE(currentRow NE ?):
			ASSIGN difference = DECIMAL(currentRow:Cells[1]:Value:ToString()) * DECIMAL(currentRow:Cells[6]:Value:ToString())
                   col2Value  = currentRow:Cells[2]:Value. 

			CASE col2Value:
				WHEN 0 THEN ASSIGN meat     = meat     - difference.
                WHEN 1 THEN ASSIGN produce  = produce  - difference.
                WHEN 2 THEN ASSIGN dairy    = dairy    - difference.
                WHEN 3 THEN ASSIGN miscFood = miscFood - difference.
                WHEN 4 THEN ASSIGN nonFood  = nonFood  - difference.
			END CASE.

		    currentRow = currentRow:GetSibling(SiblingRow:Next).
		END. /*REPEAT WHILE*/

		/*update remaining values*/
		ASSIGN meatAvailableBudget:Value     = meat
		       dairyAvailableBudget:Value    = dairy
		       produceAvailableBudget:Value  = produce
		       nonFoodAvailableBudget:Value  = nonFood
		       miscFoodAvailableBudget:Value = miscFood.

		IF meat < 0 THEN
		    meatAvailableBudget:Appearance:ForeColor = Color:Red.
		ELSE 
			meatAvailableBudget:Appearance:ForeColor = Color:Black.

		IF dairy < 0 THEN
			dairyAvailableBudget:Appearance:ForeColor = Color:Red.
		ELSE
			dairyAvailableBudget:Appearance:ForeColor = Color:Black.

		IF produce < 0 THEN
			produceAvailableBudget:Appearance:ForeColor = Color:Red.
		ELSE
			produceAvailableBudget:Appearance:ForeColor = Color:Black.

		IF nonFood < 0 THEN
			nonFoodAvailableBudget:Appearance:ForeColor = Color:Red.
		ELSE
			nonFoodAvailableBudget:Appearance:ForeColor = Color:Black.

		IF miscFood < 0 THEN
			miscFoodAvailableBudget:Appearance:ForeColor = Color:Red.
		ELSE
			miscFoodAvailableBudget:Appearance:ForeColor = Color:Black.
	END METHOD. /*UpdateBudgets*/

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGrid1_AfterRowUpdate( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.RowEventArgs ):
	    UpdateBudgets().
	END METHOD. /*ultraGrid1_AfterRowUpdate*/

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGrid1_CellChange( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.CellEventArgs ):
	    DEFINE VARIABLE autoOrder AS LOGICAL NO-UNDO.

	    IF e:Cell:Column:Index = 5 THEN
        DO:
		    autoOrder = LOGICAL(e:Cell:Row:Cells[5]:Column:Editor:Value).
			IF autoOrder THEN
                ASSIGN e:Cell:Row:Cells[6]:Value = INT(e:Cell:Row:Cells[3]:Text) - INT(e:Cell:Row:Cells[4]:Text).
		END.
		IF e:Cell:Column:Index = 2 THEN
        DO:
    		e:Cell:Row:Cells[2]:Value = e:Cell:Row:Cells[2]:Column:Editor:Value.
    		e:Cell:Row:Update().
		END.
	END METHOD. /*ultraGrid1_CellChange*/

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGrid1_InitializeRow( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.InitializeRowEventArgs ):
        DEFINE VARIABLE autoOrder AS LOGICAL NO-UNDO.

		ASSIGN autoOrder = LOGICAL(e:ROW:Cells[5]:Value).			

		IF autoOrder THEN
        DO: 
			ultraGrid1:EventManager:SetEnabled(GridEventIds:InitializeRow,false).
			e:ROW:Cells[6]:Value = INT(e:ROW:Cells[3]:Text) - INT(e:ROW:Cells[4]:Text).
			e:Row:Update().
			ultraGrid1:EventManager:SetEnabled(GridEventIds:InitializeRow,true).
		END.
	END METHOD. /*ultraGrid1_InitializeRow*/

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraGrid1_InitializeLayout( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.InitializeLayoutEventArgs ):
        DEFINE VARIABLE app AS Appearance NO-UNDO.

        ASSIGN app = e:Layout:Appearances:Add("Currency")
  		       app:TextHAlign = HAlign:Right
	           e:Layout:Override:RowSizing = RowSizing:AutoFree
		       e:Layout:Bands[0]:Columns[1]:CellAppearance = app
		       e:Layout:Bands[0]:Columns[1]:Format = "c"
    		   e:Layout:Bands[0]:Columns[3]:CellAppearance = app.
		       e:Layout:Bands[0]:Columns[4]:CellAppearance = app.
	END METHOD. /*ultraGrid1_InitializeLayout*/

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cboDisplayStyle_SelectedIndexChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    DEFINE VARIABLE displayStyle AS EmbeddableElementDisplayStyle NO-UNDO.
        DEFINE VARIABLE ctrl     AS System.Windows.Forms.Control   NO-UNDO.
	    DEFINE VARIABLE Controls AS System.Collections.IEnumerator NO-UNDO.

	    ASSIGN controls     = THIS-OBJECT:Controls:GetEnumerator()
               displayStyle = CAST(cboDisplayStyle:SelectedItem, EmbeddableElementDisplayStyle).

        controls:Reset().
	    REPEAT:
	        IF NOT controls:MoveNext() THEN LEAVE.
	        ctrl = CAST(controls:current, System.Windows.Forms.Control).

	        IF TYPE-OF(ctrl, UltraCurrencyEditor) THEN
                CAST(ctrl, UltraCurrencyEditor):DisplayStyle = displayStyle.

			IF TYPE-OF(ctrl, UltraCalculatorDropDown) THEN
                CAST(ctrl, UltraCalculatorDropDown):DisplayStyle = displayStyle.
	    END.

	    ASSIGN controls = groupBox1:Controls:GetEnumerator().
        controls:Reset().

	    REPEAT:
	        IF NOT controls:MoveNext() THEN LEAVE.
	        ctrl = CAST(controls:current, System.Windows.Forms.Control).

	        IF TYPE-OF(ctrl, UltraCurrencyEditor) THEN
                CAST(ctrl, UltraCurrencyEditor):DisplayStyle = displayStyle.

			IF TYPE-OF(ctrl, UltraCalculator) THEN
                CAST(ctrl, UltraCurrencyEditor):DisplayStyle = displayStyle.
	    END.
	    IF ultraGrid1:DisplayLayout:UIElement NE ? THEN
		    ultraGrid1:DisplayLayout:UIElement:DirtyChildElements(TRUE).
	END METHOD. /*cboDisplayStyle_SelectedIndexChanged*/

  END CLASS.