 
 /*------------------------------------------------------------------------
    File        : Form1
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Tue Jun 03 11:43:57 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

USING Infragistics.Win.UltraWinTree.*.
USING Infragistics.Win.UltraWinGrid.*.

using DataServices.EmpFamilyService.

CLASS WinTree.DataBindingNavigation.Form1 INHERITS Form   : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.


	DEFINE PRIVATE VARIABLE panel4 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE txtFirstName AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE lblFirstName AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel3 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE splitter2 AS System.Windows.Forms.Splitter NO-UNDO.
	DEFINE PRIVATE VARIABLE panel3 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel1 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE panel1 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE splitter1 AS System.Windows.Forms.Splitter NO-UNDO.
	DEFINE PRIVATE VARIABLE panel2 AS System.Windows.Forms.Panel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel2 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.


	DEFINE PRIVATE VARIABLE bindingSource1 AS Progress.Data.BindingSource NO-UNDO.
		

	DEFINE PRIVATE VARIABLE ultraTreeEmployee AS Infragistics.Win.UltraWinTree.UltraTree NO-UNDO.

	DEFINE PRIVATE VARIABLE ultraTreeFamily AS Infragistics.Win.UltraWinTree.UltraTree NO-UNDO.

	DEFINE PRIVATE VARIABLE lblBirthDate AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE lblRelation AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE lblBenefits AS Infragistics.Win.Misc.UltraLabel NO-UNDO.

	DEFINE PRIVATE VARIABLE chkCovered AS Infragistics.Win.UltraWinEditors.UltraCheckEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtRelation AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtBenefitDate AS Infragistics.Win.UltraWinEditors.UltraDateTimeEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE txtBirthDate AS Infragistics.Win.UltraWinEditors.UltraDateTimeEditor NO-UNDO.

    DEFINE VARIABLE empFamilyService AS EmpFamilyService NO-UNDO.

	CONSTRUCTOR PUBLIC Form1 (  ):
    	SUPER().
		InitializeComponent ( ).
	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC Form1 ( ):
        IF VALID-OBJECT(empFamilyService) THEN
            DELETE OBJECT empFamilyService.

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
		DEFINE VARIABLE tableDesc1 AS Progress.Data.TableDesc NO-UNDO.
		tableDesc1 = NEW Progress.Data.TableDesc("eEmployee").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE tableDesc2 AS Progress.Data.TableDesc NO-UNDO.
		tableDesc2 = NEW Progress.Data.TableDesc("eFamily").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance1 AS Infragistics.Win.Appearance NO-UNDO.
		appearance1 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance9 AS Infragistics.Win.Appearance NO-UNDO.
		appearance9 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance8 AS Infragistics.Win.Appearance NO-UNDO.
		appearance8 = NEW Infragistics.Win.Appearance().
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
		DEFINE VARIABLE appearance6 AS Infragistics.Win.Appearance NO-UNDO.
		appearance6 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance7 AS Infragistics.Win.Appearance NO-UNDO.
		appearance7 = NEW Infragistics.Win.Appearance().
		THIS-OBJECT:splitter2 = NEW System.Windows.Forms.Splitter().
		THIS-OBJECT:panel3 = NEW System.Windows.Forms.Panel().
		THIS-OBJECT:panel1 = NEW System.Windows.Forms.Panel().
		THIS-OBJECT:splitter1 = NEW System.Windows.Forms.Splitter().
		THIS-OBJECT:panel2 = NEW System.Windows.Forms.Panel().
		THIS-OBJECT:bindingSource1 = NEW Progress.Data.BindingSource().
		THIS-OBJECT:ultraLabel1 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraTreeEmployee = NEW Infragistics.Win.UltraWinTree.UltraTree().
		THIS-OBJECT:ultraLabel2 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraTreeFamily = NEW Infragistics.Win.UltraWinTree.UltraTree().
		THIS-OBJECT:panel4 = NEW System.Windows.Forms.Panel().
		THIS-OBJECT:txtBirthDate = NEW Infragistics.Win.UltraWinEditors.UltraDateTimeEditor().
		THIS-OBJECT:txtBenefitDate = NEW Infragistics.Win.UltraWinEditors.UltraDateTimeEditor().
		THIS-OBJECT:lblBenefits = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:lblBirthDate = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:chkCovered = NEW Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		THIS-OBJECT:txtRelation = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		THIS-OBJECT:lblRelation = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:txtFirstName = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		THIS-OBJECT:lblFirstName = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:ultraLabel3 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:panel3:SuspendLayout().
		THIS-OBJECT:panel1:SuspendLayout().
		THIS-OBJECT:panel2:SuspendLayout().
		CAST(THIS-OBJECT:bindingSource1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraTreeEmployee, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraTreeFamily, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:panel4:SuspendLayout().
		CAST(THIS-OBJECT:txtBirthDate, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:txtBenefitDate, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:txtRelation, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:txtFirstName, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* splitter2 */
		/*  */
		THIS-OBJECT:splitter2:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:splitter2:Name = "splitter2".
		THIS-OBJECT:splitter2:Size = NEW System.Drawing.Size(3, 366).
		THIS-OBJECT:splitter2:TabIndex = 5.
		THIS-OBJECT:splitter2:TabStop = FALSE.
		/*  */
		/* panel3 */
		/*  */
		THIS-OBJECT:panel3:Controls:Add(THIS-OBJECT:splitter2).
		THIS-OBJECT:panel3:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:panel3:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:panel3:Name = "panel3".
		THIS-OBJECT:panel3:Size = NEW System.Drawing.Size(703, 366).
		THIS-OBJECT:panel3:TabIndex = 6.
		/*  */
		/* panel1 */
		/*  */
		THIS-OBJECT:panel1:Controls:Add(THIS-OBJECT:splitter1).
		THIS-OBJECT:panel1:Controls:Add(THIS-OBJECT:panel2).
		THIS-OBJECT:panel1:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:panel1:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:panel1:Name = "panel1".
		THIS-OBJECT:panel1:Size = NEW System.Drawing.Size(703, 366).
		THIS-OBJECT:panel1:TabIndex = 4.
		/*  */
		/* splitter1 */
		/*  */
		THIS-OBJECT:splitter1:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:splitter1:Name = "splitter1".
		THIS-OBJECT:splitter1:Size = NEW System.Drawing.Size(3, 366).
		THIS-OBJECT:splitter1:TabIndex = 5.
		THIS-OBJECT:splitter1:TabStop = FALSE.
		/*  */
		/* panel2 */
		/*  */
		THIS-OBJECT:panel2:Controls:Add(THIS-OBJECT:panel3).
		THIS-OBJECT:panel2:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:panel2:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:panel2:Name = "panel2".
		THIS-OBJECT:panel2:Size = NEW System.Drawing.Size(703, 366).
		THIS-OBJECT:panel2:TabIndex = 4.
		/*  */
		/* bindingSource1 */
		/*  */
		THIS-OBJECT:bindingSource1:AllowEdit = FALSE.
		THIS-OBJECT:bindingSource1:AllowNew = FALSE.
		THIS-OBJECT:bindingSource1:AllowRemove = FALSE.
		THIS-OBJECT:bindingSource1:Position = 0.
		tableDesc2:ChildTables = ?.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar0 AS System.Array NO-UNDO.
		arrayvar0 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Progress.Data.ColumnPropDesc"), 6).
		arrayvar0:SetValue(NEW Progress.Data.ColumnPropDesc("EmpNum", "Emp No", Progress.Data.DataType:INTEGER), 0).
		arrayvar0:SetValue(NEW Progress.Data.ColumnPropDesc("RelativeName", "Relative Name", Progress.Data.DataType:CHARACTER), 1).
		arrayvar0:SetValue(NEW Progress.Data.ColumnPropDesc("Relation", "Relation", Progress.Data.DataType:CHARACTER), 2).
		arrayvar0:SetValue(NEW Progress.Data.ColumnPropDesc("Birthdate", "Birthdate", Progress.Data.DataType:DATE), 3).
		arrayvar0:SetValue(NEW Progress.Data.ColumnPropDesc("CoveredOnBenefits", "Covered On Benefits", Progress.Data.DataType:LOGICAL), 4).
		arrayvar0:SetValue(NEW Progress.Data.ColumnPropDesc("BenefitDate", "Benefit Date", Progress.Data.DataType:DATE), 5).
		tableDesc2:Columns = CAST(arrayvar0, "Progress.Data.ColumnPropDesc[]").
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar1 AS System.Array NO-UNDO.
		arrayvar1 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Progress.Data.TableDesc"), 1).
		arrayvar1:SetValue(tableDesc2, 0).
		tableDesc1:ChildTables = CAST(arrayvar1, "Progress.Data.TableDesc[]").
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar2 AS System.Array NO-UNDO.
		arrayvar2 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Progress.Data.ColumnPropDesc"), 4).
		arrayvar2:SetValue(NEW Progress.Data.ColumnPropDesc("EmpNum", "Emp No", Progress.Data.DataType:INTEGER), 0).
		arrayvar2:SetValue(NEW Progress.Data.ColumnPropDesc("LastName", "Last Name", Progress.Data.DataType:CHARACTER), 1).
		arrayvar2:SetValue(NEW Progress.Data.ColumnPropDesc("FirstName", "First Name", Progress.Data.DataType:CHARACTER), 2).
		arrayvar2:SetValue(NEW Progress.Data.ColumnPropDesc("FullName", "Name", Progress.Data.DataType:CHARACTER), 3).
		tableDesc1:Columns = CAST(arrayvar2, "Progress.Data.ColumnPropDesc[]").
		THIS-OBJECT:bindingSource1:TableSchema = tableDesc1.
		/*  */
		/* ultraLabel1 */
		/*  */
		appearance1:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(95)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(129)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(216))).
		appearance1:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(15)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(53)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(134))).
		appearance1:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance1:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(18)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(46)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(109))).
		appearance1:FontData:BoldAsString = "True".
		appearance1:FontData:SizeInPoints = 14.
		appearance1:ForeColor = System.Drawing.Color:White.
		appearance1:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel1:Appearance = appearance1.
		THIS-OBJECT:ultraLabel1:BorderStyleOuter = Infragistics.Win.UIElementBorderStyle:Solid.
		THIS-OBJECT:ultraLabel1:Dock = System.Windows.Forms.DockStyle:Top.
		THIS-OBJECT:ultraLabel1:Font = NEW System.Drawing.Font("Arial", 14, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:ultraLabel1:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:ultraLabel1:Name = "ultraLabel1".
		THIS-OBJECT:ultraLabel1:RightToLeft = System.Windows.Forms.RightToLeft:No.
		THIS-OBJECT:ultraLabel1:Size = NEW System.Drawing.Size(703, 30).
		THIS-OBJECT:ultraLabel1:TabIndex = 5.
		THIS-OBJECT:ultraLabel1:Text = " Employee".
		/*  */
		/* ultraTreeEmployee */
		/*  */
		appearance9:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(213)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(236)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance9:BackColor2 = System.Drawing.Color:White.
		appearance9:BackGradientStyle = Infragistics.Win.GradientStyle:Horizontal.
		THIS-OBJECT:ultraTreeEmployee:Appearance = appearance9.
		THIS-OBJECT:ultraTreeEmployee:Dock = System.Windows.Forms.DockStyle:Left.
		THIS-OBJECT:ultraTreeEmployee:Location = NEW System.Drawing.Point(0, 30).
		THIS-OBJECT:ultraTreeEmployee:Name = "ultraTreeEmployee".
		THIS-OBJECT:ultraTreeEmployee:RightToLeft = System.Windows.Forms.RightToLeft:No.
		THIS-OBJECT:ultraTreeEmployee:SettingsKey = "Form1.ultraTreeEmployee".
		THIS-OBJECT:ultraTreeEmployee:Size = NEW System.Drawing.Size(192, 336).
		THIS-OBJECT:ultraTreeEmployee:TabIndex = 6.
		THIS-OBJECT:ultraTreeEmployee:ViewStyle = Infragistics.Win.UltraWinTree.ViewStyle:Standard.
		THIS-OBJECT:ultraTreeEmployee:ColumnSetGenerated:SUBSCRIBE(THIS-OBJECT:ultraTreeEmployee_ColumnSetGenerated).
		/*  */
		/* ultraLabel2 */
		/*  */
		appearance8:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(236)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(216))).
		appearance8:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(171)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(167)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(155))).
		appearance8:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance8:FontData:BoldAsString = "True".
		appearance8:FontData:SizeInPoints = 10.
		appearance8:ForeColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(65)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(64)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(52))).
		appearance8:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel2:Appearance = appearance8.
		THIS-OBJECT:ultraLabel2:Dock = System.Windows.Forms.DockStyle:Top.
		THIS-OBJECT:ultraLabel2:Font = NEW System.Drawing.Font("Arial", 8.25, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:ultraLabel2:Location = NEW System.Drawing.Point(192, 30).
		THIS-OBJECT:ultraLabel2:Name = "ultraLabel2".
		THIS-OBJECT:ultraLabel2:RightToLeft = System.Windows.Forms.RightToLeft:Yes.
		THIS-OBJECT:ultraLabel2:Size = NEW System.Drawing.Size(511, 35).
		THIS-OBJECT:ultraLabel2:TabIndex = 7.
		THIS-OBJECT:ultraLabel2:Text = "  Family members".
		/*  */
		/* ultraTreeFamily */
		/*  */
		THIS-OBJECT:ultraTreeFamily:Dock = System.Windows.Forms.DockStyle:Left.
		THIS-OBJECT:ultraTreeFamily:Location = NEW System.Drawing.Point(192, 65).
		THIS-OBJECT:ultraTreeFamily:Name = "ultraTreeFamily".
		THIS-OBJECT:ultraTreeFamily:RightToLeft = System.Windows.Forms.RightToLeft:No.
		THIS-OBJECT:ultraTreeFamily:SettingsKey = "Form1.ultraTreeFamily".
		THIS-OBJECT:ultraTreeFamily:Size = NEW System.Drawing.Size(192, 301).
		THIS-OBJECT:ultraTreeFamily:TabIndex = 8.
		THIS-OBJECT:ultraTreeFamily:ViewStyle = Infragistics.Win.UltraWinTree.ViewStyle:Standard.
		THIS-OBJECT:ultraTreeFamily:ColumnSetGenerated:SUBSCRIBE(THIS-OBJECT:ultraTreeFamily_ColumnSetGenerated).
		/*  */
		/* panel4 */
		/*  */
		THIS-OBJECT:panel4:BackColor = System.Drawing.Color:White.
		THIS-OBJECT:panel4:Controls:Add(THIS-OBJECT:txtBirthDate).
		THIS-OBJECT:panel4:Controls:Add(THIS-OBJECT:txtBenefitDate).
		THIS-OBJECT:panel4:Controls:Add(THIS-OBJECT:lblBenefits).
		THIS-OBJECT:panel4:Controls:Add(THIS-OBJECT:lblBirthDate).
		THIS-OBJECT:panel4:Controls:Add(THIS-OBJECT:chkCovered).
		THIS-OBJECT:panel4:Controls:Add(THIS-OBJECT:txtRelation).
		THIS-OBJECT:panel4:Controls:Add(THIS-OBJECT:lblRelation).
		THIS-OBJECT:panel4:Controls:Add(THIS-OBJECT:txtFirstName).
		THIS-OBJECT:panel4:Controls:Add(THIS-OBJECT:lblFirstName).
		THIS-OBJECT:panel4:Controls:Add(THIS-OBJECT:ultraLabel3).
		THIS-OBJECT:panel4:Dock = System.Windows.Forms.DockStyle:Right.
		THIS-OBJECT:panel4:Location = NEW System.Drawing.Point(384, 65).
		THIS-OBJECT:panel4:Name = "panel4".
		THIS-OBJECT:panel4:Size = NEW System.Drawing.Size(319, 301).
		THIS-OBJECT:panel4:TabIndex = 9.
		/*  */
		/* txtBirthDate */
		/*  */
		THIS-OBJECT:txtBirthDate:Location = NEW System.Drawing.Point(160, 115).
		THIS-OBJECT:txtBirthDate:Name = "txtBirthDate".
		THIS-OBJECT:txtBirthDate:ReadOnly = TRUE.
		THIS-OBJECT:txtBirthDate:Size = NEW System.Drawing.Size(136, 21).
		THIS-OBJECT:txtBirthDate:TabIndex = 25.
		/*  */
		/* txtBenefitDate */
		/*  */
		THIS-OBJECT:txtBenefitDate:Location = NEW System.Drawing.Point(160, 180).
		THIS-OBJECT:txtBenefitDate:Name = "txtBenefitDate".
		THIS-OBJECT:txtBenefitDate:ReadOnly = TRUE.
		THIS-OBJECT:txtBenefitDate:Size = NEW System.Drawing.Size(132, 21).
		THIS-OBJECT:txtBenefitDate:TabIndex = 24.
		/*  */
		/* lblBenefits */
		/*  */
		appearance2:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(190)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(226)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance2:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(121)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(159)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(222))).
		appearance2:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance2:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(18)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(46)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(109))).
		appearance2:FontData:BoldAsString = "True".
		appearance2:FontData:SizeInPoints = 10.
		appearance2:ForeColor = System.Drawing.Color:White.
		appearance2:TextHAlignAsString = "Left".
		appearance2:TextVAlignAsString = "Middle".
		THIS-OBJECT:lblBenefits:Appearance = appearance2.
		THIS-OBJECT:lblBenefits:BorderStyleOuter = Infragistics.Win.UIElementBorderStyle:RaisedSoft.
		THIS-OBJECT:lblBenefits:Font = NEW System.Drawing.Font("Arial", 9.75).
		THIS-OBJECT:lblBenefits:InnerBorderPadding = NEW System.Drawing.Size(5, 0).
		THIS-OBJECT:lblBenefits:Location = NEW System.Drawing.Point(0, 147).
		THIS-OBJECT:lblBenefits:Name = "lblBenefits".
		THIS-OBJECT:lblBenefits:Size = NEW System.Drawing.Size(304, 24).
		THIS-OBJECT:lblBenefits:TabIndex = 22.
		THIS-OBJECT:lblBenefits:Text = "Benefits".
		/*  */
		/* lblBirthDate */
		/*  */
		appearance3:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(190)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(226)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance3:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(121)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(159)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(222))).
		appearance3:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance3:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(18)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(46)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(109))).
		appearance3:FontData:BoldAsString = "True".
		appearance3:FontData:SizeInPoints = 10.
		appearance3:ForeColor = System.Drawing.Color:White.
		appearance3:TextHAlignAsString = "Left".
		appearance3:TextVAlignAsString = "Middle".
		THIS-OBJECT:lblBirthDate:Appearance = appearance3.
		THIS-OBJECT:lblBirthDate:BorderStyleOuter = Infragistics.Win.UIElementBorderStyle:RaisedSoft.
		THIS-OBJECT:lblBirthDate:Font = NEW System.Drawing.Font("Arial", 9.75, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:lblBirthDate:InnerBorderPadding = NEW System.Drawing.Size(5, 0).
		THIS-OBJECT:lblBirthDate:Location = NEW System.Drawing.Point(152, 83).
		THIS-OBJECT:lblBirthDate:Name = "lblBirthDate".
		THIS-OBJECT:lblBirthDate:Size = NEW System.Drawing.Size(152, 24).
		THIS-OBJECT:lblBirthDate:TabIndex = 21.
		THIS-OBJECT:lblBirthDate:Text = "BirthDate".
		/*  */
		/* chkCovered */
		/*  */
		THIS-OBJECT:chkCovered:Location = NEW System.Drawing.Point(9, 177).
		THIS-OBJECT:chkCovered:Name = "chkCovered".
		THIS-OBJECT:chkCovered:Size = NEW System.Drawing.Size(98, 24).
		THIS-OBJECT:chkCovered:TabIndex = 20.
		THIS-OBJECT:chkCovered:Text = "Covered".
		/*  */
		/* txtRelation */
		/*  */
		THIS-OBJECT:txtRelation:Location = NEW System.Drawing.Point(8, 115).
		THIS-OBJECT:txtRelation:Name = "txtRelation".
		THIS-OBJECT:txtRelation:Size = NEW System.Drawing.Size(136, 21).
		THIS-OBJECT:txtRelation:TabIndex = 18.
		/*  */
		/* lblRelation */
		/*  */
		appearance4:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(190)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(226)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance4:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(121)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(159)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(222))).
		appearance4:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance4:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(18)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(46)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(109))).
		appearance4:FontData:BoldAsString = "True".
		appearance4:FontData:SizeInPoints = 10.
		appearance4:ForeColor = System.Drawing.Color:White.
		appearance4:TextHAlignAsString = "Left".
		appearance4:TextVAlignAsString = "Middle".
		THIS-OBJECT:lblRelation:Appearance = appearance4.
		THIS-OBJECT:lblRelation:BorderStyleOuter = Infragistics.Win.UIElementBorderStyle:RaisedSoft.
		THIS-OBJECT:lblRelation:Font = NEW System.Drawing.Font("Arial", 9.75, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:lblRelation:InnerBorderPadding = NEW System.Drawing.Size(5, 0).
		THIS-OBJECT:lblRelation:Location = NEW System.Drawing.Point(3, 83).
		THIS-OBJECT:lblRelation:Name = "lblRelation".
		THIS-OBJECT:lblRelation:Size = NEW System.Drawing.Size(149, 24).
		THIS-OBJECT:lblRelation:TabIndex = 17.
		THIS-OBJECT:lblRelation:Text = "Relation".
		/*  */
		/* txtFirstName */
		/*  */
		THIS-OBJECT:txtFirstName:Location = NEW System.Drawing.Point(8, 56).
		THIS-OBJECT:txtFirstName:Name = "txtFirstName".
		THIS-OBJECT:txtFirstName:Size = NEW System.Drawing.Size(284, 21).
		THIS-OBJECT:txtFirstName:TabIndex = 15.
		/*  */
		/* lblFirstName */
		/*  */
		appearance6:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(190)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(226)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(255))).
		appearance6:BackColor2 = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(121)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(159)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(222))).
		appearance6:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
		appearance6:BorderColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(18)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(46)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(109))).
		appearance6:FontData:BoldAsString = "True".
		appearance6:FontData:SizeInPoints = 10.
		appearance6:ForeColor = System.Drawing.Color:White.
		appearance6:TextHAlignAsString = "Left".
		appearance6:TextVAlignAsString = "Middle".
		THIS-OBJECT:lblFirstName:Appearance = appearance6.
		THIS-OBJECT:lblFirstName:BorderStyleOuter = Infragistics.Win.UIElementBorderStyle:RaisedSoft.
		THIS-OBJECT:lblFirstName:Font = NEW System.Drawing.Font("Arial", 9.75, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:lblFirstName:InnerBorderPadding = NEW System.Drawing.Size(5, 0).
		THIS-OBJECT:lblFirstName:Location = NEW System.Drawing.Point(0, 23).
		THIS-OBJECT:lblFirstName:Name = "lblFirstName".
		THIS-OBJECT:lblFirstName:Size = NEW System.Drawing.Size(304, 24).
		THIS-OBJECT:lblFirstName:TabIndex = 13.
		THIS-OBJECT:lblFirstName:Text = "Name".
		/*  */
		/* ultraLabel3 */
		/*  */
		appearance7:BackColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(236)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(233)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(216))).
		appearance7:BackGradientStyle = Infragistics.Win.GradientStyle:None.
		appearance7:BorderColor3DBase = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(196)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(193)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(184))).
		appearance7:FontData:BoldAsString = "True".
		appearance7:FontData:SizeInPoints = 9.
		appearance7:ForeColor = System.Drawing.Color:FromArgb(Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(67)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(90)), Progress.Util.CastUtil:ToInt32(Progress.Util.CastUtil:ToByte(142))).
		appearance7:TextVAlignAsString = "Middle".
		THIS-OBJECT:ultraLabel3:Appearance = appearance7.
		THIS-OBJECT:ultraLabel3:Dock = System.Windows.Forms.DockStyle:Top.
		THIS-OBJECT:ultraLabel3:Font = NEW System.Drawing.Font("Arial", 9.75, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:ultraLabel3:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:ultraLabel3:Name = "ultraLabel3".
		THIS-OBJECT:ultraLabel3:Size = NEW System.Drawing.Size(319, 23).
		THIS-OBJECT:ultraLabel3:TabIndex = 6.
		THIS-OBJECT:ultraLabel3:Text = " Member Details".
		/*  */
		/* Form1 */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(703, 366).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:panel4).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraTreeFamily).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraLabel2).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraTreeEmployee).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraLabel1).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:panel1).
		THIS-OBJECT:Name = "Form1".
		THIS-OBJECT:Text = "DataBindingNavigation".
		THIS-OBJECT:Load:SUBSCRIBE(THIS-OBJECT:Form1_Load).
		THIS-OBJECT:panel3:ResumeLayout(FALSE).
		THIS-OBJECT:panel1:ResumeLayout(FALSE).
		THIS-OBJECT:panel2:ResumeLayout(FALSE).
		CAST(THIS-OBJECT:bindingSource1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraTreeEmployee, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraTreeFamily, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:panel4:ResumeLayout(FALSE).
		THIS-OBJECT:panel4:PerformLayout().
		CAST(THIS-OBJECT:txtBirthDate, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:txtBenefitDate, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:txtRelation, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:txtFirstName, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ResumeLayout(FALSE).
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID Form1_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
			/*Initialize the DataSet*/
			InitializeDataSet().

			/*Bind the Flights tree to the Flights table.*/ 
			ultraTreeEmployee:SetDataBinding(bindingSource1, "").

			/*Bind the Passengers tree to the "Flights - Passengers" relationship.*/
			ultraTreeFamily:SetDataBinding(bindingSource1, "eFamily").

			/*Set both tree to Synchronize with the CurrencyManager so that
			  changing the Active Node in the tree will set the position of
			  the CurrencyManager and vice versa.*/
			ASSIGN ultraTreeEmployee:SynchronizeCurrencyManager = TRUE
			       ultraTreeFamily:SynchronizeCurrencyManager   = TRUE.

			/*Set the ActiveNodeAppearance on each tree to highlight the active Flight/Passenger.*/ 
			ASSIGN
			ultraTreeEmployee:OVERRIDE:ActiveNodeAppearance:BackColor = System.Drawing.Color:FromArgb(190,226,255)
			ultraTreeEmployee:OVERRIDE:ActiveNodeAppearance:BackColor = System.Drawing.Color:Chartreuse
			ultraTreeEmployee:OVERRIDE:ActiveNodeAppearance:ForeColor = System.Drawing.Color:Black
			ultraTreeFamily:OVERRIDE:ActiveNodeAppearance:BackColor = System.Drawing.Color:FromArgb(236,233,216)
			ultraTreeFamily:OVERRIDE:ActiveNodeAppearance:ForeColor = System.Drawing.Color:Black.

			/*When bound, the ShowExpansionIndicator property will 
			  default to CheckOnExpand. However, in this sample, the
			  Pasengers tree will not be showing any child data. So 
			  turn the ExpansionIndicators off.*/ 
			ultraTreeFamily:OVERRIDE:ShowExpansionIndicator = ShowExpansionIndicator:Never.

			/*For the Flights tree, we will use a setting of CheckOnDisplay.
			  This is less efficient, because it means that the tree has
			  to check every node for child nodes every time it displays.
			  But with such a small set of Data, it will not matter much.*/
			ultraTreeEmployee:OVERRIDE:ShowExpansionIndicator = ShowExpansionIndicator:CheckOnDisplay.

			/*Set the tree to Standard style, so it shows only nodes
			  with no columns. Each node will display data from the 
			  dataset based on the NodeTextColumn of the ColumnSet.*/
			ASSIGN ultraTreeEmployee:ViewStyle = ViewStyle:Standard
			       ultraTreeFamily:ViewStyle   = ViewStyle:Standard.

			/*Bind all the detail controls.*/ 
			txtFirstName:DataBindings:Add("Text", bindingSource1, "eFamily.RelativeName").
			txtRelation:DataBindings:Add("Text", bindingSource1, "eFamily.Relation").
			txtBirthDate:DataBindings:Add("Text", bindingSource1, "eFamily.BirthDate").
			chkCovered:DataBindings:Add("CheckedValue", bindingSource1, "eFamily.CoveredOnBenefits").
			txtBenefitDate:DataBindings:Add("Text", bindingSource1, "eFamily.BenefitDate").
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	METHOD PRIVATE VOID InitializeDataSet(  ):
        empFamilyService = NEW empFamilyService().
        empFamilyService:fetchData().
        bindingSource1:HANDLE = empFamilyService:DatasetHandle.
	END METHOD. 

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraTreeEmployee_ColumnSetGenerated( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinTree.ColumnSetGeneratedEventArgs ):
        CASE e:ColumnSet:Key:
            WHEN "" THEN
			    /*We want Employee nodes to show the Employee Name, so set the NodeTextColumn.*/
				e:ColumnSet:NodeTextColumn = e:ColumnSet:Columns["FullName"].
			WHEN "eFamily" THEN
				e:ColumnSet:NodeTextColumn = e:ColumnSet:Columns["RelativeName"].
        END CASE.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraTreeFamily_ColumnSetGenerated( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinTree.ColumnSetGeneratedEventArgs ):
		e:ColumnSet:NodeTextColumn = e:ColumnSet:Columns["RelativeName"].
	END METHOD.

 END CLASS.