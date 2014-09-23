 
 /*------------------------------------------------------------------------
    File        : Form1
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : vza
    Created     : Wed May 28 11:16:54 CEST 2008
    Notes       : 
  ----------------------------------------------------------------------*/
USING Progress.Util.*.
USING Progress.Lang.*.
USING Progress.Windows.Form.
USING System.IO.*.
USING System.Draing.*.
USING System.Windows.Forms.*.
USING Infragistics.Win.UltraWinSpellChecker.*.
USING Infragistics.Win.UltraWinListView.*.

using WinSpellChecker.SimpleSpellChecking.*.

CLASS WinSpellChecker.SimpleSpellChecking.Form1 INHERITS Form   : 
	
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.


	DEFINE PRIVATE VARIABLE ultraTabControl1 AS Infragistics.Win.UltraWinTabControl.UltraTabControl NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraTabSharedControlsPage1 AS Infragistics.Win.UltraWinTabControl.UltraTabSharedControlsPage NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraTabPageControl1 AS Infragistics.Win.UltraWinTabControl.UltraTabPageControl NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraTabPageControl2 AS Infragistics.Win.UltraWinTabControl.UltraTabPageControl NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraTabPageControl3 AS Infragistics.Win.UltraWinTabControl.UltraTabPageControl NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraTabPageControl4 AS Infragistics.Win.UltraWinTabControl.UltraTabPageControl NO-UNDO.


	DEFINE PRIVATE VARIABLE btSpellCheckRtbNonModally AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE btSpellCheckRtbModally AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE btRemoveFromUserDictionary AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE btRemoveAutoCorrection AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE btAddToUserDictionary AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE btAddAutoCorrection AS Infragistics.Win.Misc.UltraButton NO-UNDO.
		

	DEFINE PRIVATE VARIABLE btSpellCheckTbModally AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel2 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraLabel1 AS Infragistics.Win.Misc.UltraLabel NO-UNDO.
	DEFINE PRIVATE VARIABLE btSpellCheckUgModally AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE ultraSpellChecker1 AS Infragistics.Win.UltraWinSpellChecker.UltraSpellChecker NO-UNDO.

	DEFINE PRIVATE VARIABLE uteSpellChecked AS Infragistics.Win.UltraWinEditors.UltraTextEditor NO-UNDO.

	DEFINE PRIVATE VARIABLE pnlUserDictionary AS Infragistics.Win.Misc.UltraGroupBox NO-UNDO.
	DEFINE PRIVATE VARIABLE lvAutoCorrections AS Infragistics.Win.UltraWinListView.UltraListView NO-UNDO.
	DEFINE PRIVATE VARIABLE lbUserDictionary AS Infragistics.Win.UltraWinListView.UltraListView NO-UNDO.
	DEFINE PRIVATE VARIABLE cbUserDictionary AS Infragistics.Win.UltraWinEditors.UltraCheckEditor NO-UNDO.
	DEFINE PRIVATE VARIABLE btSpellCheckUteNonModally AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE btSpellCheckUteModally AS Infragistics.Win.Misc.UltraButton NO-UNDO.

	DEFINE PRIVATE VARIABLE rtbSpellChecked AS System.Windows.Forms.RichTextBox NO-UNDO.

	DEFINE PRIVATE VARIABLE tbSpellChecked AS System.Windows.Forms.TextBox NO-UNDO.


	DEFINE PRIVATE VARIABLE btSpellCheckTbNonModally AS Infragistics.Win.Misc.UltraButton NO-UNDO.
	DEFINE PRIVATE VARIABLE ugSpellChecked AS Infragistics.Win.UltraWinGrid.UltraGrid NO-UNDO.

	DEFINE PRIVATE VARIABLE spellingContextMenu AS System.Windows.Forms.ContextMenu NO-UNDO.

	DEFINE PRIVATE VARIABLE isNonModalDialogShowing AS LOGICAL NO-UNDO.
	
	DEFINE PRIVATE VARIABLE autoCorrections AS System.Collections.Hashtable NO-UNDO.
	
	/* A reference to the last clicked control */
	DEFINE PRIVATE VARIABLE lastClickedControl AS System.Object NO-UNDO.
	/* A reference to the last clicked error in the rich text box (null if no error was clicked last) */
	DEFINE PRIVATE VARIABLE lastClickedError AS Infragistics.Win.UltraWinSpellChecker.Error NO-UNDO.
	DEFINE PRIVATE VARIABLE gridEditorTextBox AS  System.Windows.Forms.TextBox NO-UNDO.
	
	DEFINE private VARIABLE MaxSuggestionsInContextMenu AS INTEGER NO-UNDO INIT 5.
	

	DEFINE PRIVATE VARIABLE ultraDataSource1 AS Infragistics.Win.UltraWinDataSource.UltraDataSource NO-UNDO.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	

 	CONSTRUCTOR PUBLIC Form1 (  ):
		
		SUPER().
		InitializeComponent ( ).
		autoCorrections = new System.Collections.Hashtable().
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

		THIS-OBJECT:components = NEW System.ComponentModel.Container().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance1 AS Infragistics.Win.Appearance NO-UNDO.
		appearance1 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE resources AS System.Resources.ResXResourceSet NO-UNDO.
		resources = Progress.Util.ResourceHelper:Load("WinSpellChecker/SimpleSpellChecking/Form1.resx", PROPATH).
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
		DEFINE VARIABLE appearance8 AS Infragistics.Win.Appearance NO-UNDO.
		appearance8 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance9 AS Infragistics.Win.Appearance NO-UNDO.
		appearance9 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance10 AS Infragistics.Win.Appearance NO-UNDO.
		appearance10 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance11 AS Infragistics.Win.Appearance NO-UNDO.
		appearance11 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraListViewSubItemColumn1 AS Infragistics.Win.UltraWinListView.UltraListViewSubItemColumn NO-UNDO.
		ultraListViewSubItemColumn1 = NEW Infragistics.Win.UltraWinListView.UltraListViewSubItemColumn("SubItemColumn 0").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance5 AS Infragistics.Win.Appearance NO-UNDO.
		appearance5 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance6 AS Infragistics.Win.Appearance NO-UNDO.
		appearance6 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE appearance7 AS Infragistics.Win.Appearance NO-UNDO.
		appearance7 = NEW Infragistics.Win.Appearance().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraGridBand1 AS Infragistics.Win.UltraWinGrid.UltraGridBand NO-UNDO.
		ultraGridBand1 = NEW Infragistics.Win.UltraWinGrid.UltraGridBand("Band 0", -1).
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraGridColumn1 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
		ultraGridColumn1 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Index").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraGridColumn2 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
		ultraGridColumn2 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Checked Text").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraDataColumn1 AS Infragistics.Win.UltraWinDataSource.UltraDataColumn NO-UNDO.
		ultraDataColumn1 = NEW Infragistics.Win.UltraWinDataSource.UltraDataColumn("Index").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraDataColumn2 AS Infragistics.Win.UltraWinDataSource.UltraDataColumn NO-UNDO.
		ultraDataColumn2 = NEW Infragistics.Win.UltraWinDataSource.UltraDataColumn("Checked Text").
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraTab1 AS Infragistics.Win.UltraWinTabControl.UltraTab NO-UNDO.
		ultraTab1 = NEW Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraTab2 AS Infragistics.Win.UltraWinTabControl.UltraTab NO-UNDO.
		ultraTab2 = NEW Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraTab3 AS Infragistics.Win.UltraWinTabControl.UltraTab NO-UNDO.
		ultraTab3 = NEW Infragistics.Win.UltraWinTabControl.UltraTab().
		@VisualDesigner.FormMember (NeedsInitialize="true").
		DEFINE VARIABLE ultraTab4 AS Infragistics.Win.UltraWinTabControl.UltraTab NO-UNDO.
		ultraTab4 = NEW Infragistics.Win.UltraWinTabControl.UltraTab().
		THIS-OBJECT:ultraSpellChecker1 = NEW Infragistics.Win.UltraWinSpellChecker.UltraSpellChecker(THIS-OBJECT:components).
		THIS-OBJECT:tbSpellChecked = NEW System.Windows.Forms.TextBox().
		THIS-OBJECT:spellingContextMenu = NEW System.Windows.Forms.ContextMenu().
		THIS-OBJECT:ultraTabPageControl1 = NEW Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		THIS-OBJECT:btSpellCheckRtbModally = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:rtbSpellChecked = NEW System.Windows.Forms.RichTextBox().
		THIS-OBJECT:btSpellCheckRtbNonModally = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:ultraTabPageControl2 = NEW Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		THIS-OBJECT:btSpellCheckTbModally = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:btSpellCheckTbNonModally = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:pnlUserDictionary = NEW Infragistics.Win.Misc.UltraGroupBox().
		THIS-OBJECT:btAddToUserDictionary = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:lbUserDictionary = NEW Infragistics.Win.UltraWinListView.UltraListView().
		THIS-OBJECT:ultraLabel2 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:btRemoveFromUserDictionary = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:ultraLabel1 = NEW Infragistics.Win.Misc.UltraLabel().
		THIS-OBJECT:btRemoveAutoCorrection = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:cbUserDictionary = NEW Infragistics.Win.UltraWinEditors.UltraCheckEditor().
		THIS-OBJECT:btAddAutoCorrection = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:lvAutoCorrections = NEW Infragistics.Win.UltraWinListView.UltraListView().
		THIS-OBJECT:ultraTabPageControl3 = NEW Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		THIS-OBJECT:btSpellCheckUteModally = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:btSpellCheckUteNonModally = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:uteSpellChecked = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
		THIS-OBJECT:ultraTabPageControl4 = NEW Infragistics.Win.UltraWinTabControl.UltraTabPageControl().
		THIS-OBJECT:btSpellCheckUgModally = NEW Infragistics.Win.Misc.UltraButton().
		THIS-OBJECT:ugSpellChecked = NEW Infragistics.Win.UltraWinGrid.UltraGrid().
		THIS-OBJECT:ultraDataSource1 = NEW Infragistics.Win.UltraWinDataSource.UltraDataSource(THIS-OBJECT:components).
		THIS-OBJECT:ultraTabControl1 = NEW Infragistics.Win.UltraWinTabControl.UltraTabControl().
		THIS-OBJECT:ultraTabSharedControlsPage1 = NEW Infragistics.Win.UltraWinTabControl.UltraTabSharedControlsPage().
		CAST(THIS-OBJECT:ultraSpellChecker1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraTabPageControl1:SuspendLayout().
		THIS-OBJECT:ultraTabPageControl2:SuspendLayout().
		CAST(THIS-OBJECT:pnlUserDictionary, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:pnlUserDictionary:SuspendLayout().
		CAST(THIS-OBJECT:lbUserDictionary, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:lvAutoCorrections, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraTabPageControl3:SuspendLayout().
		CAST(THIS-OBJECT:uteSpellChecked, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraTabPageControl4:SuspendLayout().
		CAST(THIS-OBJECT:ugSpellChecked, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraDataSource1, System.ComponentModel.ISupportInitialize):BeginInit().
		CAST(THIS-OBJECT:ultraTabControl1, System.ComponentModel.ISupportInitialize):BeginInit().
		THIS-OBJECT:ultraTabControl1:SuspendLayout().
		THIS-OBJECT:SuspendLayout().
		/*  */
		/* ultraSpellChecker1 */
		/*  */
		THIS-OBJECT:ultraSpellChecker1:ContainingControl = THIS-OBJECT.
		THIS-OBJECT:ultraSpellChecker1:Mode = Infragistics.Win.UltraWinSpellChecker.SpellCheckingMode:AsYouType.
		THIS-OBJECT:ultraSpellChecker1:ShowDialogsModal = FALSE.
		THIS-OBJECT:ultraSpellChecker1:NoErrorsFound:SUBSCRIBE(THIS-OBJECT:ultraSpellChecker1_NoErrorsFound).
		THIS-OBJECT:ultraSpellChecker1:SpellError:SUBSCRIBE(THIS-OBJECT:ultraSpellChecker1_SpellError).
		THIS-OBJECT:ultraSpellChecker1:SpellCheckDialogClosed:SUBSCRIBE(THIS-OBJECT:ultraSpellChecker1_SpellCheckDialogClosed).
		/*  */
		/* tbSpellChecked */
		/*  */
		THIS-OBJECT:tbSpellChecked:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:tbSpellChecked:ContextMenu = THIS-OBJECT:spellingContextMenu.
		THIS-OBJECT:tbSpellChecked:Location = NEW System.Drawing.Point(216, 8).
		THIS-OBJECT:tbSpellChecked:Multiline = TRUE.
		THIS-OBJECT:tbSpellChecked:Name = "tbSpellChecked".
		THIS-OBJECT:tbSpellChecked:Size = NEW System.Drawing.Size(600, 280).
		THIS-OBJECT:ultraSpellChecker1:SetSpellCheckerSettings(THIS-OBJECT:tbSpellChecked, NEW Infragistics.Win.UltraWinSpellChecker.SpellCheckerSettings(TRUE)).
		THIS-OBJECT:tbSpellChecked:TabIndex = 25.
		THIS-OBJECT:tbSpellChecked:Text = resources:GetString("tbSpellChecked.Text").
		THIS-OBJECT:tbSpellChecked:MouseDown:SUBSCRIBE(THIS-OBJECT:spellCheckedControl_MouseDown).
		/*  */
		/* spellingContextMenu */
		/*  */
		THIS-OBJECT:spellingContextMenu:Popup:SUBSCRIBE(THIS-OBJECT:spellingContextMenu_Popup).
		/*  */
		/* ultraTabPageControl1 */
		/*  */
		THIS-OBJECT:ultraTabPageControl1:Controls:Add(THIS-OBJECT:btSpellCheckRtbModally).
		THIS-OBJECT:ultraTabPageControl1:Controls:Add(THIS-OBJECT:rtbSpellChecked).
		THIS-OBJECT:ultraTabPageControl1:Controls:Add(THIS-OBJECT:btSpellCheckRtbNonModally).
		THIS-OBJECT:ultraTabPageControl1:Location = NEW System.Drawing.Point(-10000, -10000).
		THIS-OBJECT:ultraTabPageControl1:Name = "ultraTabPageControl1".
		THIS-OBJECT:ultraTabPageControl1:Size = NEW System.Drawing.Size(820, 535).
		/*  */
		/* btSpellCheckRtbModally */
		/*  */
		THIS-OBJECT:btSpellCheckRtbModally:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance1:BackColor = System.Drawing.Color:Transparent.
		THIS-OBJECT:btSpellCheckRtbModally:Appearance = appearance1.
		THIS-OBJECT:btSpellCheckRtbModally:Location = NEW System.Drawing.Point(632, 296).
		THIS-OBJECT:btSpellCheckRtbModally:Name = "btSpellCheckRtbModally".
		THIS-OBJECT:btSpellCheckRtbModally:Size = NEW System.Drawing.Size(184, 24).
		THIS-OBJECT:btSpellCheckRtbModally:TabIndex = 13.
		THIS-OBJECT:btSpellCheckRtbModally:Text = "Spell Check in Modal dialog".
		THIS-OBJECT:btSpellCheckRtbModally:Click:SUBSCRIBE(THIS-OBJECT:btSpellCheckRtbModally_Click).
		/*  */
		/* rtbSpellChecked */
		/*  */
		THIS-OBJECT:rtbSpellChecked:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:rtbSpellChecked:ContextMenu = THIS-OBJECT:spellingContextMenu.
		THIS-OBJECT:rtbSpellChecked:Location = NEW System.Drawing.Point(216, 8).
		THIS-OBJECT:rtbSpellChecked:Name = "rtbSpellChecked".
		THIS-OBJECT:rtbSpellChecked:Size = NEW System.Drawing.Size(600, 280).
		THIS-OBJECT:rtbSpellChecked:TabIndex = 11.
		THIS-OBJECT:rtbSpellChecked:Text = resources:GetString("rtbSpellChecked.Text").
		THIS-OBJECT:rtbSpellChecked:MouseDown:SUBSCRIBE(THIS-OBJECT:spellCheckedControl_MouseDown).
		/*  */
		/* btSpellCheckRtbNonModally */
		/*  */
		THIS-OBJECT:btSpellCheckRtbNonModally:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance2:BackColor = System.Drawing.Color:Transparent.
		THIS-OBJECT:btSpellCheckRtbNonModally:Appearance = appearance2.
		THIS-OBJECT:btSpellCheckRtbNonModally:Location = NEW System.Drawing.Point(440, 296).
		THIS-OBJECT:btSpellCheckRtbNonModally:Name = "btSpellCheckRtbNonModally".
		THIS-OBJECT:btSpellCheckRtbNonModally:Size = NEW System.Drawing.Size(184, 24).
		THIS-OBJECT:btSpellCheckRtbNonModally:TabIndex = 12.
		THIS-OBJECT:btSpellCheckRtbNonModally:Text = "Spell Check in Non-Modal dialog".
		THIS-OBJECT:btSpellCheckRtbNonModally:Click:SUBSCRIBE(THIS-OBJECT:btSpellCheckRtbNonModally_Click).
		/*  */
		/* ultraTabPageControl2 */
		/*  */
		THIS-OBJECT:ultraTabPageControl2:Controls:Add(THIS-OBJECT:btSpellCheckTbModally).
		THIS-OBJECT:ultraTabPageControl2:Controls:Add(THIS-OBJECT:btSpellCheckTbNonModally).
		THIS-OBJECT:ultraTabPageControl2:Controls:Add(THIS-OBJECT:tbSpellChecked).
		THIS-OBJECT:ultraTabPageControl2:Controls:Add(THIS-OBJECT:pnlUserDictionary).
		THIS-OBJECT:ultraTabPageControl2:Controls:Add(THIS-OBJECT:ultraLabel1).
		THIS-OBJECT:ultraTabPageControl2:Controls:Add(THIS-OBJECT:btRemoveAutoCorrection).
		THIS-OBJECT:ultraTabPageControl2:Controls:Add(THIS-OBJECT:cbUserDictionary).
		THIS-OBJECT:ultraTabPageControl2:Controls:Add(THIS-OBJECT:btAddAutoCorrection).
		THIS-OBJECT:ultraTabPageControl2:Controls:Add(THIS-OBJECT:lvAutoCorrections).
		THIS-OBJECT:ultraTabPageControl2:Location = NEW System.Drawing.Point(-10000, -10000).
		THIS-OBJECT:ultraTabPageControl2:Name = "ultraTabPageControl2".
		THIS-OBJECT:ultraTabPageControl2:Size = NEW System.Drawing.Size(820, 535).
		/*  */
		/* btSpellCheckTbModally */
		/*  */
		THIS-OBJECT:btSpellCheckTbModally:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance3:BackColor = System.Drawing.Color:Transparent.
		THIS-OBJECT:btSpellCheckTbModally:Appearance = appearance3.
		THIS-OBJECT:btSpellCheckTbModally:Location = NEW System.Drawing.Point(632, 296).
		THIS-OBJECT:btSpellCheckTbModally:Name = "btSpellCheckTbModally".
		THIS-OBJECT:btSpellCheckTbModally:Size = NEW System.Drawing.Size(184, 24).
		THIS-OBJECT:btSpellCheckTbModally:TabIndex = 27.
		THIS-OBJECT:btSpellCheckTbModally:Text = "Spell Check in Modal dialog".
		THIS-OBJECT:btSpellCheckTbModally:Click:SUBSCRIBE(THIS-OBJECT:btSpellCheckTbModally_Click).
		/*  */
		/* btSpellCheckTbNonModally */
		/*  */
		THIS-OBJECT:btSpellCheckTbNonModally:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance4:BackColor = System.Drawing.Color:Transparent.
		THIS-OBJECT:btSpellCheckTbNonModally:Appearance = appearance4.
		THIS-OBJECT:btSpellCheckTbNonModally:Location = NEW System.Drawing.Point(440, 296).
		THIS-OBJECT:btSpellCheckTbNonModally:Name = "btSpellCheckTbNonModally".
		THIS-OBJECT:btSpellCheckTbNonModally:Size = NEW System.Drawing.Size(184, 24).
		THIS-OBJECT:btSpellCheckTbNonModally:TabIndex = 26.
		THIS-OBJECT:btSpellCheckTbNonModally:Text = "Spell Check in Non-Modal dialog".
		THIS-OBJECT:btSpellCheckTbNonModally:Click:SUBSCRIBE(THIS-OBJECT:btSpellCheckTbNonModally_Click).
		/*  */
		/* pnlUserDictionary */
		/*  */
		THIS-OBJECT:pnlUserDictionary:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
		appearance8:BackColor = System.Drawing.Color:Transparent.
		THIS-OBJECT:pnlUserDictionary:Appearance = appearance8.
		THIS-OBJECT:pnlUserDictionary:BorderStyle = Infragistics.Win.Misc.GroupBoxBorderStyle:None.
		THIS-OBJECT:pnlUserDictionary:Controls:Add(THIS-OBJECT:btAddToUserDictionary).
		THIS-OBJECT:pnlUserDictionary:Controls:Add(THIS-OBJECT:lbUserDictionary).
		THIS-OBJECT:pnlUserDictionary:Controls:Add(THIS-OBJECT:ultraLabel2).
		THIS-OBJECT:pnlUserDictionary:Controls:Add(THIS-OBJECT:btRemoveFromUserDictionary).
		THIS-OBJECT:pnlUserDictionary:Location = NEW System.Drawing.Point(0, 32).
		THIS-OBJECT:pnlUserDictionary:Name = "pnlUserDictionary".
		THIS-OBJECT:pnlUserDictionary:Size = NEW System.Drawing.Size(216, 510).
		THIS-OBJECT:pnlUserDictionary:TabIndex = 23.
		/*  */
		/* btAddToUserDictionary */
		/*  */
		THIS-OBJECT:btAddToUserDictionary:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:btAddToUserDictionary:Location = NEW System.Drawing.Point(8, 478).
		THIS-OBJECT:btAddToUserDictionary:Name = "btAddToUserDictionary".
		THIS-OBJECT:btAddToUserDictionary:Size = NEW System.Drawing.Size(96, 23).
		THIS-OBJECT:btAddToUserDictionary:TabIndex = 2.
		THIS-OBJECT:btAddToUserDictionary:Text = "Add Word".
		THIS-OBJECT:btAddToUserDictionary:Click:SUBSCRIBE(THIS-OBJECT:btAddToUserDictionary_Click).
		/*  */
		/* lbUserDictionary */
		/*  */
		THIS-OBJECT:lbUserDictionary:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lbUserDictionary:Location = NEW System.Drawing.Point(8, 32).
		THIS-OBJECT:lbUserDictionary:Name = "lbUserDictionary".
		THIS-OBJECT:lbUserDictionary:Size = NEW System.Drawing.Size(200, 438).
		THIS-OBJECT:lbUserDictionary:TabIndex = 1.
		THIS-OBJECT:lbUserDictionary:Text = "ultraListView1".
		THIS-OBJECT:lbUserDictionary:View = Infragistics.Win.UltraWinListView.UltraListViewStyle:List.
		THIS-OBJECT:lbUserDictionary:ViewSettingsList:ImageSize = NEW System.Drawing.Size(0, 0).
		/*  */
		/* ultraLabel2 */
		/*  */
		THIS-OBJECT:ultraLabel2:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ultraLabel2:Location = NEW System.Drawing.Point(8, 8).
		THIS-OBJECT:ultraLabel2:Name = "ultraLabel2".
		THIS-OBJECT:ultraLabel2:Size = NEW System.Drawing.Size(200, 23).
		THIS-OBJECT:ultraLabel2:TabIndex = 0.
		THIS-OBJECT:ultraLabel2:Text = "User dictionary contents:".
		/*  */
		/* btRemoveFromUserDictionary */
		/*  */
		THIS-OBJECT:btRemoveFromUserDictionary:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:btRemoveFromUserDictionary:Location = NEW System.Drawing.Point(112, 478).
		THIS-OBJECT:btRemoveFromUserDictionary:Name = "btRemoveFromUserDictionary".
		THIS-OBJECT:btRemoveFromUserDictionary:Size = NEW System.Drawing.Size(96, 23).
		THIS-OBJECT:btRemoveFromUserDictionary:TabIndex = 2.
		THIS-OBJECT:btRemoveFromUserDictionary:Text = "Remove Word".
		THIS-OBJECT:btRemoveFromUserDictionary:Click:SUBSCRIBE(THIS-OBJECT:btRemoveFromUserDictionary_Click).
		/*  */
		/* ultraLabel1 */
		/*  */
		THIS-OBJECT:ultraLabel1:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
		appearance9:BackColor = System.Drawing.Color:Transparent.
		THIS-OBJECT:ultraLabel1:Appearance = appearance9.
		THIS-OBJECT:ultraLabel1:Location = NEW System.Drawing.Point(216, 318).
		THIS-OBJECT:ultraLabel1:Name = "ultraLabel1".
		THIS-OBJECT:ultraLabel1:Size = NEW System.Drawing.Size(176, 23).
		THIS-OBJECT:ultraLabel1:TabIndex = 19.
		THIS-OBJECT:ultraLabel1:Text = "Auto Corrections:".
		/*  */
		/* btRemoveAutoCorrection */
		/*  */
		THIS-OBJECT:btRemoveAutoCorrection:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance10:BackColor = System.Drawing.Color:Transparent.
		THIS-OBJECT:btRemoveAutoCorrection:Appearance = appearance10.
		THIS-OBJECT:btRemoveAutoCorrection:Location = NEW System.Drawing.Point(656, 510).
		THIS-OBJECT:btRemoveAutoCorrection:Name = "btRemoveAutoCorrection".
		THIS-OBJECT:btRemoveAutoCorrection:Size = NEW System.Drawing.Size(160, 23).
		THIS-OBJECT:btRemoveAutoCorrection:TabIndex = 20.
		THIS-OBJECT:btRemoveAutoCorrection:Text = "Remove Auto Correction".
		THIS-OBJECT:btRemoveAutoCorrection:Click:SUBSCRIBE(THIS-OBJECT:btRemoveAutoCorrection_Click).
		/*  */
		/* cbUserDictionary */
		/*  */
		THIS-OBJECT:cbUserDictionary:BackColor = System.Drawing.Color:Transparent.
		THIS-OBJECT:cbUserDictionary:BackColorInternal = System.Drawing.Color:Transparent.
		THIS-OBJECT:cbUserDictionary:Location = NEW System.Drawing.Point(8, 8).
		THIS-OBJECT:cbUserDictionary:Name = "cbUserDictionary".
		THIS-OBJECT:cbUserDictionary:Size = NEW System.Drawing.Size(200, 24).
		THIS-OBJECT:cbUserDictionary:TabIndex = 22.
		THIS-OBJECT:cbUserDictionary:Text = "Use a user dictionary".
		THIS-OBJECT:cbUserDictionary:CheckedChanged:SUBSCRIBE(THIS-OBJECT:cbUserDictionary_CheckedChanged).
		/*  */
		/* btAddAutoCorrection */
		/*  */
		THIS-OBJECT:btAddAutoCorrection:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance11:BackColor = System.Drawing.Color:Transparent.
		THIS-OBJECT:btAddAutoCorrection:Appearance = appearance11.
		THIS-OBJECT:btAddAutoCorrection:Location = NEW System.Drawing.Point(488, 510).
		THIS-OBJECT:btAddAutoCorrection:Name = "btAddAutoCorrection".
		THIS-OBJECT:btAddAutoCorrection:Size = NEW System.Drawing.Size(160, 23).
		THIS-OBJECT:btAddAutoCorrection:TabIndex = 21.
		THIS-OBJECT:btAddAutoCorrection:Text = "Add Auto Correction".
		THIS-OBJECT:btAddAutoCorrection:Click:SUBSCRIBE(THIS-OBJECT:btAddAutoCorrection_Click).
		/*  */
		/* lvAutoCorrections */
		/*  */
		THIS-OBJECT:lvAutoCorrections:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:lvAutoCorrections:Location = NEW System.Drawing.Point(216, 342).
		THIS-OBJECT:lvAutoCorrections:MainColumn:Sorting = Infragistics.Win.UltraWinListView.Sorting:Ascending.
		THIS-OBJECT:lvAutoCorrections:MainColumn:Text = "Error".
		THIS-OBJECT:lvAutoCorrections:MainColumn:Width = 200.
		THIS-OBJECT:lvAutoCorrections:Name = "lvAutoCorrections".
		THIS-OBJECT:lvAutoCorrections:Size = NEW System.Drawing.Size(600, 160).
		ultraListViewSubItemColumn1:Key = "SubItemColumn 0".
		ultraListViewSubItemColumn1:Text = "Replacement Word".
		ultraListViewSubItemColumn1:Width = 200.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar0 AS System.Array NO-UNDO.
		arrayvar0 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinListView.UltraListViewSubItemColumn"), 1).
		arrayvar0:SetValue(ultraListViewSubItemColumn1, 0).
		THIS-OBJECT:lvAutoCorrections:SubItemColumns:AddRange(CAST(arrayvar0, "Infragistics.Win.UltraWinListView.UltraListViewSubItemColumn[]")).
		THIS-OBJECT:lvAutoCorrections:TabIndex = 24.
		THIS-OBJECT:lvAutoCorrections:Text = "ultraListView1".
		THIS-OBJECT:lvAutoCorrections:View = Infragistics.Win.UltraWinListView.UltraListViewStyle:Details.
		THIS-OBJECT:lvAutoCorrections:ViewSettingsDetails:AllowColumnMoving = FALSE.
		THIS-OBJECT:lvAutoCorrections:ViewSettingsDetails:FullRowSelect = TRUE.
		THIS-OBJECT:lvAutoCorrections:ViewSettingsDetails:ImageSize = NEW System.Drawing.Size(0, 0).
		/*  */
		/* ultraTabPageControl3 */
		/*  */
		THIS-OBJECT:ultraTabPageControl3:Controls:Add(THIS-OBJECT:btSpellCheckUteModally).
		THIS-OBJECT:ultraTabPageControl3:Controls:Add(THIS-OBJECT:btSpellCheckUteNonModally).
		THIS-OBJECT:ultraTabPageControl3:Controls:Add(THIS-OBJECT:uteSpellChecked).
		THIS-OBJECT:ultraTabPageControl3:Location = NEW System.Drawing.Point(-10000, -10000).
		THIS-OBJECT:ultraTabPageControl3:Name = "ultraTabPageControl3".
		THIS-OBJECT:ultraTabPageControl3:Size = NEW System.Drawing.Size(820, 535).
		/*  */
		/* btSpellCheckUteModally */
		/*  */
		THIS-OBJECT:btSpellCheckUteModally:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance5:BackColor = System.Drawing.Color:Transparent.
		THIS-OBJECT:btSpellCheckUteModally:Appearance = appearance5.
		THIS-OBJECT:btSpellCheckUteModally:Location = NEW System.Drawing.Point(632, 296).
		THIS-OBJECT:btSpellCheckUteModally:Name = "btSpellCheckUteModally".
		THIS-OBJECT:btSpellCheckUteModally:Size = NEW System.Drawing.Size(184, 24).
		THIS-OBJECT:btSpellCheckUteModally:TabIndex = 23.
		THIS-OBJECT:btSpellCheckUteModally:Text = "Spell Check in Modal dialog".
		THIS-OBJECT:btSpellCheckUteModally:Click:SUBSCRIBE(THIS-OBJECT:btSpellCheckUteModally_Click).
		/*  */
		/* btSpellCheckUteNonModally */
		/*  */
		THIS-OBJECT:btSpellCheckUteNonModally:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance6:BackColor = System.Drawing.Color:Transparent.
		THIS-OBJECT:btSpellCheckUteNonModally:Appearance = appearance6.
		THIS-OBJECT:btSpellCheckUteNonModally:Location = NEW System.Drawing.Point(440, 296).
		THIS-OBJECT:btSpellCheckUteNonModally:Name = "btSpellCheckUteNonModally".
		THIS-OBJECT:btSpellCheckUteNonModally:Size = NEW System.Drawing.Size(184, 24).
		THIS-OBJECT:btSpellCheckUteNonModally:TabIndex = 22.
		THIS-OBJECT:btSpellCheckUteNonModally:Text = "Spell Check in Non-Modal dialog".
		THIS-OBJECT:btSpellCheckUteNonModally:Click:SUBSCRIBE(THIS-OBJECT:btSpellCheckUteNonModally_Click).
		/*  */
		/* uteSpellChecked */
		/*  */
		THIS-OBJECT:uteSpellChecked:AlwaysInEditMode = TRUE.
		THIS-OBJECT:uteSpellChecked:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:uteSpellChecked:ContextMenu = THIS-OBJECT:spellingContextMenu.
		THIS-OBJECT:uteSpellChecked:Location = NEW System.Drawing.Point(216, 8).
		THIS-OBJECT:uteSpellChecked:Multiline = TRUE.
		THIS-OBJECT:uteSpellChecked:Name = "uteSpellChecked".
		THIS-OBJECT:uteSpellChecked:Size = NEW System.Drawing.Size(600, 278).
		THIS-OBJECT:uteSpellChecked:SpellChecker = THIS-OBJECT:ultraSpellChecker1.
		THIS-OBJECT:uteSpellChecked:TabIndex = 21.
		THIS-OBJECT:uteSpellChecked:Text = resources:GetString("uteSpellChecked.Text").
		/*  */
		/* ultraTabPageControl4 */
		/*  */
		THIS-OBJECT:ultraTabPageControl4:Controls:Add(THIS-OBJECT:btSpellCheckUgModally).
		THIS-OBJECT:ultraTabPageControl4:Controls:Add(THIS-OBJECT:ugSpellChecked).
		THIS-OBJECT:ultraTabPageControl4:Location = NEW System.Drawing.Point(2, 21).
		THIS-OBJECT:ultraTabPageControl4:Name = "ultraTabPageControl4".
		THIS-OBJECT:ultraTabPageControl4:Size = NEW System.Drawing.Size(820, 535).
		/*  */
		/* btSpellCheckUgModally */
		/*  */
		THIS-OBJECT:btSpellCheckUgModally:Anchor = CAST(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		appearance7:BackColor = System.Drawing.Color:Transparent.
		THIS-OBJECT:btSpellCheckUgModally:Appearance = appearance7.
		THIS-OBJECT:btSpellCheckUgModally:Enabled = FALSE.
		THIS-OBJECT:btSpellCheckUgModally:Location = NEW System.Drawing.Point(632, 296).
		THIS-OBJECT:btSpellCheckUgModally:Name = "btSpellCheckUgModally".
		THIS-OBJECT:btSpellCheckUgModally:Size = NEW System.Drawing.Size(184, 24).
		THIS-OBJECT:btSpellCheckUgModally:TabIndex = 23.
		THIS-OBJECT:btSpellCheckUgModally:Text = "Spell Check in Modal dialog".
		THIS-OBJECT:btSpellCheckUgModally:Click:SUBSCRIBE(THIS-OBJECT:btSpellCheckUgModally_Click).
		/*  */
		/* ugSpellChecked */
		/*  */
		THIS-OBJECT:ugSpellChecked:Anchor = CAST(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		THIS-OBJECT:ugSpellChecked:DataSource = THIS-OBJECT:ultraDataSource1.
        THIS-OBJECT:ugSpellChecked:ContextMenu = THIS-OBJECT:spellingContextMenu.		
		ultraGridColumn1:Header:VisiblePosition = 0.
		ultraGridColumn2:Header:VisiblePosition = 1.
		ultraGridColumn2:SpellChecker = THIS-OBJECT:ultraSpellChecker1.
		ultraGridColumn2:Width = 388.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar1 AS System.Array NO-UNDO.
		arrayvar1 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Object"), 2).
		arrayvar1:SetValue(ultraGridColumn1, 0).
		arrayvar1:SetValue(ultraGridColumn2, 1).
		ultraGridBand1:Columns:AddRange(CAST(arrayvar1, "System.Object[]")).
		THIS-OBJECT:ugSpellChecked:DisplayLayout:BandsSerializer:Add(ultraGridBand1).
		THIS-OBJECT:ugSpellChecked:Font = NEW System.Drawing.Font("Microsoft Sans Serif", 8.25, System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		THIS-OBJECT:ugSpellChecked:Location = NEW System.Drawing.Point(216, 8).
		THIS-OBJECT:ugSpellChecked:Name = "ugSpellChecked".
		THIS-OBJECT:ugSpellChecked:Size = NEW System.Drawing.Size(600, 280).
		THIS-OBJECT:ugSpellChecked:TabIndex = 22.
		THIS-OBJECT:ugSpellChecked:Text = "ultraGrid1".
		THIS-OBJECT:ugSpellChecked:MouseDown:SUBSCRIBE(THIS-OBJECT:spellCheckedControl_MouseDown).
		THIS-OBJECT:ugSpellChecked:AfterExitEditMode:SUBSCRIBE(THIS-OBJECT:ugSpellChecked_AfterExitEditMode).
		THIS-OBJECT:ugSpellChecked:AfterEnterEditMode:SUBSCRIBE(THIS-OBJECT:ugSpellChecked_AfterEnterEditMode).
		THIS-OBJECT:ugSpellChecked:AfterCellActivate:SUBSCRIBE(THIS-OBJECT:ugSpellChecked_AfterCellActivate).
		/*  */
		/* ultraDataSource1 */
		/*  */
		ultraDataColumn1:DataType = Progress.Util.TypeHelper:GetType("System.Int32").
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar2 AS System.Array NO-UNDO.
		arrayvar2 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Object"), 2).
		arrayvar2:SetValue(ultraDataColumn1, 0).
		arrayvar2:SetValue(ultraDataColumn2, 1).
		THIS-OBJECT:ultraDataSource1:Band:Columns:AddRange(CAST(arrayvar2, "System.Object[]")).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar3 AS System.Array NO-UNDO.
		arrayvar3 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Object"), 4).
		arrayvar3:SetValue(CAST(BOX("Index"), System.Object), 0).
		arrayvar3:SetValue(CAST(BOX(1), System.Object), 1).
		arrayvar3:SetValue(CAST(BOX("Checked Text"), System.Object), 2).
		arrayvar3:SetValue(CAST(BOX("This sampel will help you create a context memu to use on an ultragrid that will offer speling sugestions and other spelling related feachures when a mispelled word is right-clicked. The context menu "), System.Object), 3).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar4 AS System.Array NO-UNDO.
		arrayvar4 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Object"), 4).
		arrayvar4:SetValue(CAST(BOX("Index"), System.Object), 0).
		arrayvar4:SetValue(CAST(BOX(2), System.Object), 1).
		arrayvar4:SetValue(CAST(BOX("Checked Text"), System.Object), 2).
		arrayvar4:SetValue(CAST(BOX("This sampel will help you create a context memu to use on an ultragrid that will offer speling sugestions and other spelling related feachures when a mispelled word is right-clicked. The context menu "), System.Object), 3).
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar5 AS System.Array NO-UNDO.
		arrayvar5 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Object"), 2).
		arrayvar5:SetValue(NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(CAST(arrayvar3, "System.Object[]")), 0).
		arrayvar5:SetValue(NEW Infragistics.Win.UltraWinDataSource.UltraDataRow(CAST(arrayvar4, "System.Object[]")), 1).
		THIS-OBJECT:ultraDataSource1:Rows:AddRange(CAST(arrayvar5, "System.Object[]")).
		/*  */
		/* ultraTabControl1 */
		/*  */
		THIS-OBJECT:ultraTabControl1:Controls:Add(THIS-OBJECT:ultraTabSharedControlsPage1).
		THIS-OBJECT:ultraTabControl1:Controls:Add(THIS-OBJECT:ultraTabPageControl1).
		THIS-OBJECT:ultraTabControl1:Controls:Add(THIS-OBJECT:ultraTabPageControl2).
		THIS-OBJECT:ultraTabControl1:Controls:Add(THIS-OBJECT:ultraTabPageControl3).
		THIS-OBJECT:ultraTabControl1:Controls:Add(THIS-OBJECT:ultraTabPageControl4).
		THIS-OBJECT:ultraTabControl1:Dock = System.Windows.Forms.DockStyle:Fill.
		THIS-OBJECT:ultraTabControl1:Location = NEW System.Drawing.Point(0, 0).
		THIS-OBJECT:ultraTabControl1:Name = "ultraTabControl1".
		THIS-OBJECT:ultraTabControl1:SharedControlsPage = THIS-OBJECT:ultraTabSharedControlsPage1.
		THIS-OBJECT:ultraTabControl1:Size = NEW System.Drawing.Size(824, 558).
		THIS-OBJECT:ultraTabControl1:TabIndex = 0.
		ultraTab1:TabPage = THIS-OBJECT:ultraTabPageControl1.
		ultraTab1:Text = "RichTextBox".
		ultraTab2:TabPage = THIS-OBJECT:ultraTabPageControl2.
		ultraTab2:Text = "TextBox".
		ultraTab3:TabPage = THIS-OBJECT:ultraTabPageControl3.
		ultraTab3:Text = "UltraTextEditor".
		ultraTab4:TabPage = THIS-OBJECT:ultraTabPageControl4.
		ultraTab4:Text = "UltraGrid".
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		DEFINE VARIABLE arrayvar6 AS System.Array NO-UNDO.
		arrayvar6 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinTabControl.UltraTab"), 4).
		arrayvar6:SetValue(ultraTab1, 0).
		arrayvar6:SetValue(ultraTab2, 1).
		arrayvar6:SetValue(ultraTab3, 2).
		arrayvar6:SetValue(ultraTab4, 3).
		THIS-OBJECT:ultraTabControl1:Tabs:AddRange(CAST(arrayvar6, "Infragistics.Win.UltraWinTabControl.UltraTab[]")).
		THIS-OBJECT:ultraTabControl1:ViewStyle = Infragistics.Win.UltraWinTabControl.ViewStyle:VisualStudio2005.
		/*  */
		/* ultraTabSharedControlsPage1 */
		/*  */
		THIS-OBJECT:ultraTabSharedControlsPage1:Location = NEW System.Drawing.Point(-10000, -10000).
		THIS-OBJECT:ultraTabSharedControlsPage1:Name = "ultraTabSharedControlsPage1".
		THIS-OBJECT:ultraTabSharedControlsPage1:Size = NEW System.Drawing.Size(820, 535).
		/*  */
		/* Form1 */
		/*  */
		THIS-OBJECT:ClientSize = NEW System.Drawing.Size(824, 558).
		THIS-OBJECT:Controls:Add(THIS-OBJECT:ultraTabControl1).
		THIS-OBJECT:Name = "Form1".
		THIS-OBJECT:Text = "Simple Spell Checking".
		THIS-OBJECT:Load:SUBSCRIBE(THIS-OBJECT:Form1_Load).
		THIS-OBJECT:Activated:SUBSCRIBE(THIS-OBJECT:Form1_Activated).
		CAST(THIS-OBJECT:ultraSpellChecker1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraTabPageControl1:ResumeLayout(FALSE).
		THIS-OBJECT:ultraTabPageControl2:ResumeLayout(FALSE).
		THIS-OBJECT:ultraTabPageControl2:PerformLayout().
		CAST(THIS-OBJECT:pnlUserDictionary, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:pnlUserDictionary:ResumeLayout(FALSE).
		CAST(THIS-OBJECT:lbUserDictionary, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:lvAutoCorrections, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraTabPageControl3:ResumeLayout(FALSE).
		THIS-OBJECT:ultraTabPageControl3:PerformLayout().
		CAST(THIS-OBJECT:uteSpellChecked, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraTabPageControl4:ResumeLayout(FALSE).
		CAST(THIS-OBJECT:ugSpellChecked, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraDataSource1, System.ComponentModel.ISupportInitialize):EndInit().
		CAST(THIS-OBJECT:ultraTabControl1, System.ComponentModel.ISupportInitialize):EndInit().
		THIS-OBJECT:ultraTabControl1:ResumeLayout(FALSE).
		THIS-OBJECT:ResumeLayout(FALSE).

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	
	METHOD PUBLIC VOID InitializeAutoCorrections(  ):
	  autoCorrections:Add( "acheive","achieve" ).
	  autoCorrections:Add( "begining","beginning" ).
	  autoCorrections:Add( "differant","different" ).
	  autoCorrections:Add( "mroe","more" ).
	  autoCorrections:Add( "ocur","occur" ).
	  autoCorrections:Add( "saidthe","said the" ).
	  autoCorrections:Add( "seance","séance" ).
	  autoCorrections:Add( "writting","writing" ).
	  autoCorrections:Add( "youve","you've" ).
		
		RETURN.

	END METHOD.

  /*------------------------------------------------------------------------------
          Purpose:  																	  
          Notes:  																	  
  ------------------------------------------------------------------------------*/
  @VisualDesigner.
  METHOD PRIVATE VOID btSpellCheckRtbNonModally_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
    /* Only show the non-modal dialog if there is no other non-modal dialog showing */
    IF (NOT THIS-OBJECT:isNonModalDialogShowing ) THEN DO:
      /* Show the spell check dialog for the rich text box non-modally */
      IF THIS-OBJECT:ultraSpellChecker1:ShowSpellCheck( THIS-OBJECT:rtbSpellChecked ) <> ? THEN
					THIS-OBJECT:isNonModalDialogShowing = TRUE.
    END.		
	RETURN.

  END METHOD.

  /*------------------------------------------------------------------------------
          Purpose:  																	  
          Notes:  																	  
  ------------------------------------------------------------------------------*/
  @VisualDesigner.
  METHOD PRIVATE VOID btSpellCheckRtbModally_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
    /* Show the spell check dialog for the text box modally */
    THIS-OBJECT:ultraSpellChecker1:ShowSpellCheckDialog( THIS-OBJECT:tbSpellChecked ).
    RETURN.

  END METHOD.

  /*------------------------------------------------------------------------------
          Purpose:  																	  
          Notes:  																	  
  ------------------------------------------------------------------------------*/
  @VisualDesigner.
  METHOD PRIVATE VOID btSpellCheckTbNonModally_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	/*Only show the non-modal dialog if there is no other non-modal dialog showing */
	IF (NOT THIS-OBJECT:isNonModalDialogShowing ) THEN DO:
	  /* Show the spell check dialog for the text box non-modally */
	  IF THIS-OBJECT:ultraSpellChecker1:ShowSpellCheck( THIS-OBJECT:tbSpellChecked ) <> ? THEN
	    THIS-OBJECT:isNonModalDialogShowing = TRUE.
	END.    
	RETURN.

  END METHOD.

  /*------------------------------------------------------------------------------
          Purpose:  																	  
          Notes:  																	  
  ------------------------------------------------------------------------------*/
  @VisualDesigner.
  METHOD PRIVATE VOID btSpellCheckTbModally_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	/* Show the spell check dialog for the text box modally */
	THIS-OBJECT:ultraSpellChecker1:ShowSpellCheckDialog( THIS-OBJECT:tbSpellChecked ).
		
	RETURN.

  END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
    METHOD PRIVATE VOID cbUserDictionary_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  IF ( THIS-OBJECT:cbUserDictionary:Checked = true ) THEN DO:
	    /* Set the user dictionay of the spell checker */
	    THIS-OBJECT:ultraSpellChecker1:UserDictionary = "UserDictionary.txt".

		/* Repopulate the user dictionary list */
		THIS-OBJECT:RepopulateUserDictionaryList().

        /* Show the panel containing the user dictionary information */
		THIS-OBJECT:pnlUserDictionary:Visible = TRUE.
	  END.
	  ELSE DO:
        /* Clear the path to the user dictionary so it is not used */
		THIS-OBJECT:ultraSpellChecker1:UserDictionary = "".
		/* Hide the panel containing the user dictionary information */
		THIS-OBJECT:pnlUserDictionary:Visible = FALSE.
	  END.		
		
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	
	METHOD PRIVATE VOID RepopulateUserDictionaryList(  ):
	  DEFINE VARIABLE fullPath AS CHARACTER NO-UNDO.
	  DEFINE VARIABLE line AS CHARACTER NO-UNDO.
	  DEFINE VARIABLE reader AS System.IO.StreamReader NO-UNDO.
	  /* Clear the items currently in the list */
	  THIS-OBJECT:lbUserDictionary:Items:Clear().

      /* If the user dictionary is not set, there is no list to populate */
	  IF (ultraSpellChecker1:UserDictionary = ?) OR LENGTH(ultraSpellChecker1:UserDictionary ) = 0 THEN RETURN.

	  /* Get the full path to the user dictionary */
	  fullPath = Path:GetFullPath( THIS-OBJECT:ultraSpellChecker1:UserDictionary ).

      /*If the user dictionary file exists... */
	  IF ( File:Exists( fullPath ) ) THEN DO:
	    /* Open the user dictionary file */
	    reader = new StreamReader( fullPath ).
	    
	    DO WHILE ( true ):

		  /* Read the next line of the file */
		  line = reader:ReadLine().

		  /* If the file had no more lines, exit the loop */
		  IF ( line = ?) THEN LEAVE.
		  /* Trim off white space from the begin and end of the line */
		  line = TRIM(line).

		  /* If the line contains a word, add the word to the user dictionary list */
		  IF ( line <> "" ) THEN THIS-OBJECT:lbUserDictionary:Items:Add( line, line ).
		END.
		
		/* Close the user dictionary file */
		reader:Close().
      END.
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID btAddToUserDictionary_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  /* Create a dialog to add the new word to the user dictionary */
	  DEFINE VARIABLE awd AS AddWordDialog NO-UNDO.
	  awd = new AddWordDialog().

	  /* Show the dialog to the user */
	  awd:ShowModalDialog().
	  IF EnumHelper:AreEqual( awd:DialogResult, System.Windows.Forms.dialogResult:OK ) THEN DO:
		/* If the user has entered a valid word... */
		
		IF ( awd:NewWord <> "" ) THEN DO:
		  /* Add the new word to the user dictionary */
		  THIS-OBJECT:ultraSpellChecker1:AddWordToUserDictionary( awd:NewWord ).
		  /* Add the new word to the list of words in the user dictionary */
		  THIS-OBJECT:lbUserDictionary:Items:Add( awd:NewWord, awd:NewWord ).
	    END.
      END.
	  /* Dispose the dialog */
	  awd:Dispose().
      RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID btRemoveFromUserDictionary_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
      DEFINE VARIABLE eItems AS System.Collections.IEnumerator NO-UNDO.
	  DEFINE VARIABLE selectedWords      AS System.Collections.ArrayList NO-UNDO.
	  DEFINE VARIABLE userDictionaryWord AS Infragistics.Win.UltraWinListView.UltraListViewItem NO-UNDO.

	  /* Create a copy of the selected items in the user dictionary list */
	  ASSIGN
         selectedWords = new System.Collections.ArrayList( THIS-OBJECT:lbUserDictionary:SelectedItems )
         eItems = selectedWords:GetEnumerator().
      REPEAT:
        IF NOT eItems:MoveNext() THEN LEAVE.
        userDictionaryWord = CAST(eItems:CURRENT, Infragistics.Win.UltraWinListView.UltraListViewItem).
		/* Remove the word from the user dictionary */
		THIS-OBJECT:ultraSpellChecker1:RemoveWordFromUserDictionary( STRING(userDictionaryWord:Value )).
		/* Remove the word from the list of words in the user dictionary */
		THIS-OBJECT:lbUserDictionary:Items:Remove( userDictionaryWord ).
	  END.
	  	
      RETURN.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID btAddAutoCorrection_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  /* Create a dialog to add the new auto correction */
	  DEFINE VARIABLE auc AS AddAutoCorrection NO-UNDO.
	  DEFINE VARIABLE autoCorrections AS Infragistics.Win.UltraWinListView.UltraListViewItem NO-UNDO.
	  auc = new AddAutoCorrection().
      
      DEFINE VARIABLE arrayobj1 AS System.Array NO-UNDO.
	  arrayobj1 = System.Array:CreateInstance(Progress.Util.TypeHelper:GetType("System.Object"), 1).

      /* Show the dialog to the user */
      auc:ShowModalDialog().
	  IF EnumHelper:AreEqual( auc:DialogResult, System.Windows.Forms.dialogResult:OK ) THEN DO:            
        /* If the user has entered valid input... */
		IF ( auc:Correction <> "") AND (auc:ErrorToBeCorrected <> "" ) THEN DO:
		  /* Add the new auto correction to the hashtable of corrections */
		  THIS-OBJECT:autoCorrections:Add( auc:ErrorToBeCorrected, auc:Correction ).
					
		  /* Add the new auto correction to the list view displaying the corrections */
		  arrayobj1:SetValue(auc:Correction, 0).
		  autoCorrections = new Infragistics.Win.UltraWinListView.UltraListViewItem( auc:ErrorToBeCorrected, CAST(arrayobj1, "System.Object[]") ).
		  THIS-OBJECT:lvAutoCorrections:Items:Add( autoCorrections ).
		END.
	  END.	  
      /* Dispose the dialog */
	  auc:Dispose().
		
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID Form1_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE uteEdit AS Infragistics.Win.EditorWithText NO-UNDO.
	  
	  /* The extender property must be set for the rich text box so that it may */
	  /* be spell checked.  This can also be done through the property grid */
	  /* in the forms designer */
	  THIS-OBJECT:ultraSpellChecker1:SetSpellCheckerSettings( THIS-OBJECT:rtbSpellChecked, new SpellCheckerSettings( true ) ).
	  
	  THIS-OBJECT:cbUserDictionary:Checked = TRUE.

	  /* Initialize the auto corrections hashtable with some common errors and their replacements */
	  THIS-OBJECT:InitializeAutoCorrections().

	  /* Populate the auto corrections list view with the auto correction values */
	  THIS-OBJECT:RepopulateAutoCorrectionList().

      autoCorrections = new System.Collections.Hashtable().
      uteEdit = CAST(this-Object:uteSpellChecked:Editor, "Infragistics.Win.EditorWithText" ).
      uteEdit:TextBox:MouseDown:SUBSCRIBE( THIS-OBJECT:spellCheckedControl_MouseDown ). 
/*      THIS-OBJECT:uteSpellChecked:ContextMenu = THIS-OBJECT:spellingContextMenu.*/
	  
	  RETURN.
	END METHOD.

    METHOD PRIVATE VOID RepopulateAutoCorrectionList():
      DEFINE VARIABLE eItems AS System.Collections.IEnumerator NO-UNDO.
      DEFINE VARIABLE autoCorrection AS Infragistics.Win.UltraWinListView.UltraListViewItem NO-UNDO.
      DEFINE VARIABLE acEntry AS System.Collections.DictionaryEntry NO-UNDO.
      DEFINE VARIABLE arrayvar AS System.Array NO-UNDO.
      
      ASSIGN eItems = THIS-OBJECT:autoCorrections:GetEnumerator().
      
      /* For each entry in the auto corrections hashtable */
      REPEAT:
        IF NOT eItems:MoveNext() THEN LEAVE.
        acEntry = CAST(eItems:CURRENT, System.Collections.DictionaryEntry).
        arrayvar = System.Array:CreateInstance(TypeHelper:GetType("System.Object"), 1).
        arrayvar:SetValue(acEntry:Value, 0).
        autoCorrection = new UltraListViewItem( acEntry:Key, CAST(arrayvar, "System.Object[]" )).
        lvAutoCorrections:Items:Add( autoCorrection ).
      END.  
      
    END METHOD.


	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID btRemoveAutoCorrection_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
      DEFINE VARIABLE eItems AS System.Collections.IEnumerator NO-UNDO.
	  DEFINE VARIABLE selectedCorrections AS System.Collections.ArrayList NO-UNDO.
	  DEFINE VARIABLE autoCorrection      AS Infragistics.Win.UltraWinListView.UltraListViewItem NO-UNDO.
	  
	  /* Create a copy of the selected items in the auto correction list */
	  ASSIGN
         selectedCorrections = new System.Collections.ArrayList( THIS-OBJECT:lvAutoCorrections:SelectedItems )
         eItems = selectedCorrections:GetEnumerator().
      REPEAT:
        IF NOT eItems:MoveNext() THEN LEAVE.
        autocorrection = CAST(eItems:CURRENT, Infragistics.Win.UltraWinListView.UltraListViewItem).
        
        /* Remove the auto correction from the hashtable of corrections */
        THIS-OBJECT:autoCorrections:Remove( autoCorrection:Value ).
        /* Remove the auto correction from the list of corrections */
        THIS-OBJECT:lvAutoCorrections:Items:Remove( autoCorrection ).
      END.
	  RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID btSpellCheckUteNonModally_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
      /*Only show the non-modal dialog if there is no other non-modal dialog showing */
  	  IF (NOT THIS-OBJECT:isNonModalDialogShowing ) THEN DO:
  	    /* Show the spell check dialog for the text box non-modally */
  	    IF THIS-OBJECT:ultraSpellChecker1:ShowSpellCheck( THIS-OBJECT:uteSpellChecked ) <> ? THEN
  	      THIS-OBJECT:isNonModalDialogShowing = TRUE.
  	  END.    
      RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID btSpellCheckUteModally_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  /* Show the spell check dialog for the text editor modally */
	  THIS-OBJECT:ultraSpellChecker1:ShowSpellCheckDialog( THIS-OBJECT:uteSpellChecked ).
      RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID btSpellCheckUgModally_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  /* Enter edit mode on the active cell */
	  THIS-OBJECT:ugSpellChecked:PerformAction( Infragistics.Win.UltraWinGrid.UltraGridAction:EnterEditMode ).
	  
	  /* Show the spell check dialog for the active cell modally */
	  THIS-OBJECT:ultraSpellChecker1:ShowSpellCheckDialog( this-object:ugSpellChecked:ActiveCell:EditorResolved ).
      RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraSpellChecker1_NoErrorsFound( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinSpellChecker.NoErrorsFoundEventArgs ):
	  /* Notify the user that no errors were found in the text. */
	  MESSAGE "No errors were found" VIEW-AS ALERT-BOX.
      RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraSpellChecker1_SpellCheckDialogClosed( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinSpellChecker.SpellCheckDialogClosedEventArgs ):
	  /* Repopulate user dictionary list because words could have been added in the dialog */
	  THIS-OBJECT:RepopulateUserDictionaryList().
	  
	  /* The non-modal dialog has closed if it was showing */
	  THIS-OBJECT:isNonModalDialogShowing = FALSE.
      
      RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ultraSpellChecker1_SpellError( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinSpellChecker.SpellErrorEventArgs ):
	  /* If the erroneous word is in the list of auto corrections... */
	  IF autoCorrections:ContainsKey( e:SpellingError:CheckedWord ) THEN DO:
	    /* Set the action to replace */
	    e:Action = SpellErrorAction:Replace.
		/* Set the replacement word */
		e:ReplaceWord = STRING(autoCorrections[ e:SpellingError:CheckedWord ]).
	  END.
	  	
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID spellingContextMenu_Popup( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE mItem       AS MenuItem NO-UNDO.
	  DEFINE VARIABLE eItems      AS System.Collections.IEnumerator NO-UNDO.
	  DEFINE VARIABLE removeItems AS System.Collections.ArrayList NO-UNDO.
	  DEFINE VARIABLE noSuggestionsItem AS MenuItem  NO-UNDO.
	  DEFINE VARIABLE addItem AS MenuItem NO-UNDO. 
	  DEFINE VARIABLE i AS INTEGER NO-UNDO.
	  	  
	  ASSIGN 
         removeItems = new System.Collections.ArrayList( THIS-OBJECT:spellingContextMenu:MenuItems )
         eItems = removeItems:GetEnumerator().

	 /* Dispose all menu items that were previously added to the context MENU */
     REPEAT:
       IF NOT eItems:MoveNext() THEN LEAVE.
       mItem = CAST(eItems:CURRENT, "MenuItem").
       IF ( mItem <> ? ) THEN 
         mItem:Dispose().
     END.
     
     /* Clear the menu items previously added to the context menu */
	 THIS-OBJECT:spellingContextMenu:MenuItems:Clear().
	 
	 /* If the last clicked spot on the rich text box was over an error... */
	 IF ( THIS-OBJECT:lastClickedError <> ? ) THEN DO:
	   /* If there are no suggestions... */
	   IF ( THIS-OBJECT:lastClickedError:Suggestions:Count = 0 ) THEN DO:
	     /* Add the "no spelling suggestions" menu item and disable it */
		 noSuggestionsItem = THIS-OBJECT:spellingContextMenu:MenuItems:Add( "(no spelling suggestions)" ).
		 noSuggestionsItem:Enabled = FALSE.
	   END.
	   /* Otherwise, if there are suggestions... */
	   ELSE DO:
	     /* Add suggestion menu items to the context menu */
	     DO i = 0 TO THIS-OBJECT:lastClickedError:Suggestions:Count - 1 :
			IF i >= MaxSuggestionsInContextMenu THEN LEAVE.
			addItem = THIS-OBJECT:spellingContextMenu:MenuItems:Add( 
			    THIS-OBJECT:lastClickedError:Suggestions[ i ]). /* ,
				new EventHandler( THIS-OBJECT:contextMenuSuggestion_Click ) ). */
			addItem:Click:Subscribe( THIS-OBJECT:contextMenuSuggestion_Click ).	
         END.
       END.
       
       /* Add a separator item to the context menu */
       THIS-OBJECT:spellingContextMenu:MenuItems:Add( "-" ).
       /* Add the "Add to Dictionary" menu item */
       addItem = THIS-OBJECT:spellingContextMenu:MenuItems:Add(
                   "Add to Dictionary"). /* , 
				   new EventHandler( THIS-OBJECT:contextMenuAddToDictionary_Click ) ). */
	   addItem:Click:Subscribe(THIS-OBJECT:contextMenuAddToDictionary_Click).

	   /* Only enable the "Add to Dictionary" menu item if the user dictionary is being used */
	   addItem:Enabled = THIS-OBJECT:cbUserDictionary:Checked.
	   /* Add the "Ignore All" menu item */
	   
	   addItem = THIS-OBJECT:spellingContextMenu:MenuItems:Add( 
		  "Ignore All"). /* ,
		   new EventHandler( THIS-OBJECT:contextMenuIgnoreAll_Click ) ). */
	   addItem:Click:Subscribe(THIS-OBJECT:contextMenuIgnoreAll_Click ).
	   
	 END.  
     RETURN.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID Form1_Activated( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  /* If a non-modal spell check dialog is showing... */
	  IF ( THIS-OBJECT:isNonModalDialogShowing ) THEN DO:
	    /* Repopulate the user dictionary list because words could have been */
	    /* added to it. */
	    THIS-OBJECT:RepopulateUserDictionaryList().
	  END.
      RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID spellCheckedControl_MouseDown( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.MouseEventArgs ):
	  DEFINE VARIABLE point AS System.Drawing.Point NO-UNDO.
	  DEFINE VARIABLE eEdit AS Infragistics.Win.EditorWithText NO-UNDO.
	  eEdit = CAST(this-object:uteSpellChecked:Editor, "Infragistics.Win.EditorWithText").
	  
	  IF ( sender = THIS-OBJECT:rtbSpellChecked ) OR (sender = THIS-OBJECT:tbSpellChecked ) THEN 
	    THIS-OBJECT:lastClickedControl = sender.
	  /* If the text box shown by the UltraTextEditor was clicked, make the last clicked control the UltraTextEditor */
	  ELSE IF ( sender = eEdit:TextBox ) THEN THIS-OBJECT:lastClickedControl = this-object:uteSpellChecked.                                       
      /* If the text box shown by the active cell in the UltraGrid was clicked, make the last clicked control the */
      /* editor of the active cell */
	  ELSE IF (THIS-OBJECT:ugSpellChecked:ActiveCell <> ?) AND (THIS-OBJECT:ugSpellChecked:ActiveCell:IsInEditMode ) THEN
        THIS-OBJECT:lastClickedControl = THIS-OBJECT:ugSpellChecked:ActiveCell:EditorResolved.
      ELSE RETURN.
      
      /* Get the error at the point where the user clicked in the spell checked control */
	  point = new System.Drawing.Point( e:X, e:Y ).
	  THIS-OBJECT:lastClickedError = THIS-OBJECT:ultraSpellChecker1:GetErrorAtPoint( this-object:lastClickedControl, point ).

		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ugSpellChecked_AfterCellActivate( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  IF ( THIS-OBJECT:ugSpellChecked:ActiveCell:Column:SpellChecker <> ? ) THEN 
	    THIS-OBJECT:btSpellCheckUgModally:Enabled = TRUE.
      ELSE 
        THIS-OBJECT:btSpellCheckUgModally:Enabled = FALSE. 
		
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ugSpellChecked_AfterEnterEditMode( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE gridEdit AS Infragistics.Win.EditorWithText NO-UNDO. 
	  IF ( THIS-OBJECT:ugSpellChecked:ActiveCell <> ?) AND 
	     ( THIS-OBJECT:ugSpellChecked:ActiveCell:IsInEditMode ) AND 
         TYPE-OF( THIS-OBJECT:ugSpellChecked:ActiveCell:EditorResolved,  "Infragistics.Win.EditorWithText" ) THEN DO:
     
	    IF (THIS-OBJECT:gridEditorTextBox <> ?) THEN
          THIS-OBJECT:gridEditorTextBox:MouseDown:UNSUBSCRIBE( this-object:spellCheckedControl_MouseDown ).

        gridEdit = CAST(THIS-OBJECT:ugSpellChecked:ActiveCell:EditorResolved, "Infragistics.Win.EditorWithText").
		THIS-OBJECT:gridEditorTextBox = gridEdit:TextBox.

		/* Hook the MouseDown event of the text box shown by the active cell */
		this-object:gridEditorTextBox:MouseDown:subscribe(THIS-OBJECT:spellCheckedControl_MouseDown ).
	  END.
	  RETURN.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID ugSpellChecked_AfterExitEditMode( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	  /* Only enable the check button for the grid if the active cell can be checked */
	  IF ( THIS-OBJECT:ugSpellChecked:ActiveCell:Column:SpellChecker <> ? ) THEN
        THIS-OBJECT:btSpellCheckUgModally:Enabled = TRUE.
      ELSE 
        THIS-OBJECT:btSpellCheckUgModally:Enabled = FALSE.
		
		RETURN.

	END METHOD.

	METHOD PRIVATE void contextMenuSuggestion_Click(INPUT sender AS System.Object , INPUT e AS System.EventArgs ):
	  DEFINE VARIABLE suggestionItem AS MenuItem NO-UNDO.
	  
	  /* Get the menu item that was clicked */
	  suggestionItem = CAST(sender, "MenuItem").
	  IF ( THIS-OBJECT:lastClickedControl = THIS-OBJECT:rtbSpellChecked )
	  THEN DO:
	    /* Select the error in the rich text box */
		THIS-OBJECT:rtbSpellChecked:Select(
		  THIS-OBJECT:lastClickedError:StartIndex,
		  THIS-OBJECT:lastClickedError:EndIndex - this-object:lastClickedError:StartIndex + 1 ).

		/* Replace the selected error with the suggestion that was clicked */
		THIS-OBJECT:rtbSpellChecked:SelectedText = suggestionItem:Text.
	    
	  END. /* :lastClickedControl = */   
	  ELSE IF ( THIS-OBJECT:lastClickedControl = THIS-OBJECT:tbSpellChecked ) THEN DO:
		/* Select the error in the text box */
		THIS-OBJECT:tbSpellChecked:Select(
		    THIS-OBJECT:lastClickedError:StartIndex,
			THIS-OBJECT:lastClickedError:EndIndex - THIS-OBJECT:lastClickedError:StartIndex + 1 ).

		/* Replace the selected error with the suggestion that was clicked */
		THIS-OBJECT:tbSpellChecked:SelectedText = suggestionItem:Text.
	  END.
	  ELSE IF ( THIS-OBJECT:lastClickedControl = THIS-OBJECT:uteSpellChecked ) THEN DO:
	    /* Select the error in the text editor */
		THIS-OBJECT:uteSpellChecked:Select(
		    THIS-OBJECT:lastClickedError:StartIndex,
			THIS-OBJECT:lastClickedError:EndIndex - THIS-OBJECT:lastClickedError:StartIndex + 1 ).

		/* Replace the selected error with the suggestion that was clicked */
		THIS-OBJECT:uteSpellChecked:SelectedText = suggestionItem:Text.
      END.
      ELSE IF(THIS-OBJECT:ugSpellChecked:ActiveCell <> ?) AND 
			 (THIS-OBJECT:ugSpellChecked:ActiveCell:EditorResolved <> ?) AND
			 (THIS-OBJECT:lastClickedControl = THIS-OBJECT:ugSpellChecked:ActiveCell:EditorResolved ) THEN DO:
    	  /* Select the error in the text editor */
	      THIS-OBJECT:ugSpellChecked:ActiveCell:EditorResolved:SelectionStart = THIS-OBJECT:lastClickedError:StartIndex.
	      THIS-OBJECT:ugSpellChecked:ActiveCell:EditorResolved:SelectionLength = THIS-OBJECT:lastClickedError:EndIndex - THIS-OBJECT:lastClickedError:StartIndex + 1.

		  /* Replace the selected error with the suggestion that was clicked */
		  THIS-OBJECT:ugSpellChecked:ActiveCell:EditorResolved:SelectedText = suggestionItem:Text.
      END.
	  		
	  
	  RETURN.
	END METHOD.  

	METHOD PRIVATE void contextMenuAddToDictionary_Click(INPUT sender AS System.Object , INPUT e AS System.EventArgs ):
	  /* Add the last clicked error to the user dictionary */
	  THIS-OBJECT:ultraSpellChecker1:AddWordToUserDictionary( THIS-OBJECT:lastClickedError:CheckedWord ).
	  /* Add the last clicked error to the list box displaying the contents of the user dictionary */
	  THIS-OBJECT:lbUserDictionary:Items:Add( THIS-OBJECT:lastClickedError:CheckedWord, THIS-OBJECT:lastClickedError:CheckedWord ).
	  
	  RETURN.
	END METHOD.  
	METHOD PRIVATE void contextMenuIgnoreAll_Click(INPUT sender AS System.Object , INPUT e AS System.EventArgs ):
	  /* Ignore all instances of the last clicked error */
	  THIS-OBJECT:ultraSpellChecker1:IgnoreAll( THIS-OBJECT:lastClickedError:CheckedWord ).
	  
	  RETURN.
	END METHOD.  


 END CLASS.

 