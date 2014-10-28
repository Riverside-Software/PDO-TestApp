/* Databinding.cls - This sample demonstrates how to use the ProBindingSource
   with several of the Infragistics Controls and requires the Sports2000 db */
USING System.Windows.Forms.*.
USING System.Drawing.*.
USING Infragistics.Win.UltraWinTree.*. 
USING Progress.Util.*.
 

CLASS DataBindingExample.Databinding:

    DEFINE VARIABLE pbs AS Progress.Data.BindingSource.
    DEFINE VARIABLE form1 AS Progress.Windows.Form.
    DEFINE VARIABLE controls AS Control+ControlCollection.
    DEFINE VARIABLE ultragrid AS Infragistics.Win.UltraWinGrid.UltraGrid.
    DEFINE VARIABLE ultracurrencyedit AS Infragistics.Win.UltraWinEditors.UltraCurrencyEditor.
    DEFINE VARIABLE ultranumericeditor AS Infragistics.Win.UltraWinEditors.UltraNumericEditor.
    DEFINE VARIABLE ultratexteditor AS Infragistics.Win.UltraWinEditors.UltraTextEditor.
    DEFINE VARIABLE ultracombo AS Infragistics.Win.UltraWinGrid.UltraCombo.
    DEFINE VARIABLE ultramaskededit AS Infragistics.Win.UltraWinMaskedEdit.UltraMaskedEdit.
    DEFINE VARIABLE ultrascrollbar AS Infragistics.Win.UltraWinScrollBar.UltraScrollBar.
    DEFINE VARIABLE ultraprogressbar AS Infragistics.Win.UltraWinProgressBar.UltraProgressBar.
    DEFINE VARIABLE ultracalendarcombo AS Infragistics.Win.UltraWinSchedule.UltraCalendarCombo.
    DEFINE VARIABLE ultrapicturebox AS Infragistics.Win.UltraWinEditors.UltraPictureBox.
    DEFINE VARIABLE btnNext AS Infragistics.Win.Misc.UltraButton. 
    DEFINE VARIABLE btnPrev AS Infragistics.Win.Misc.UltraButton. 
    DEFINE VARIABLE btnDefault AS Infragistics.Win.Misc.UltraButton.
    DEFINE VARIABLE btnStandard AS Infragistics.Win.Misc.UltraButton.
    DEFINE VARIABLE btnOutlook AS Infragistics.Win.Misc.UltraButton.
    DEFINE VARIABLE btnGrid AS Infragistics.Win.Misc.UltraButton.
    DEFINE VARIABLE btnFree AS Infragistics.Win.Misc.UltraButton.
    DEFINE VARIABLE ultratree AS Infragistics.Win.UltraWinTree.UltraTree.
    DEFINE VARIABLE ultrastatusbar AS Infragistics.Win.UltraWinStatusBar.UltraStatusBar.  
    DEFINE VARIABLE ulblCurrEdit AS Infragistics.Win.Misc.UltraLabel. 
    DEFINE VARIABLE ulblDtEdit AS Infragistics.Win.Misc.UltraLabel. 
    DEFINE VARIABLE ulblNumEdit AS Infragistics.Win.Misc.UltraLabel. 
    DEFINE VARIABLE ulblTextEdit AS Infragistics.Win.Misc.UltraLabel. 
    DEFINE VARIABLE ulblMaskEdit AS Infragistics.Win.Misc.UltraLabel. 
    DEFINE VARIABLE ulblCombo AS Infragistics.Win.Misc.UltraLabel.  
    DEFINE VARIABLE ulblScroll AS Infragistics.Win.Misc.UltraLabel. 
    DEFINE VARIABLE ulblPrgs AS Infragistics.Win.Misc.UltraLabel. 
    DEFINE VARIABLE ulblCalendarCombo AS Infragistics.Win.Misc.UltraLabel. 
    DEFINE VARIABLE ulblTree AS Infragistics.Win.Misc.UltraLabel.
    DEFINE VARIABLE pic AS System.Drawing.Bitmap.

    CONSTRUCTOR Databinding (pbs1 AS Progress.Data.BindingSource):
        pbs = pbs1.
        InitializeComponent().    
    END CONSTRUCTOR.

    DEFINE PUBLIC PROPERTY FormObject AS Progress.Windows.Form 
          GET:
              RETURN form1.
          END.

    METHOD PRIVATE VOID InitializeComponent():
        form1 = NEW Progress.Windows.Form().
        ultragrid = NEW Infragistics.Win.UltraWinGrid.UltraGrid().
        ultracurrencyedit = NEW Infragistics.Win.UltraWinEditors.UltraCurrencyEditor().
        ultranumericeditor = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
        ultratexteditor = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        ultracombo = NEW Infragistics.Win.UltraWinGrid.UltraCombo().
        ultramaskededit = NEW Infragistics.Win.UltraWinMaskedEdit.UltraMaskedEdit().
        ultrascrollbar = NEW Infragistics.Win.UltraWinScrollBar.UltraScrollBar().
        ultraprogressbar = NEW Infragistics.Win.UltraWinProgressBar.UltraProgressBar().
        ultracalendarcombo = NEW Infragistics.Win.UltraWinSchedule.UltraCalendarCombo().
        ultratree = NEW Infragistics.Win.UltraWinTree.UltraTree().
        ultrastatusbar = NEW Infragistics.Win.UltraWinStatusBar.UltraStatusBar().
        ultrapicturebox = NEW Infragistics.Win.UltraWinEditors.UltraPictureBox().
        btnNext = NEW Infragistics.Win.Misc.UltraButton().
        btnPrev = NEW Infragistics.Win.Misc.UltraButton().
        ulblCurrEdit = NEW Infragistics.Win.Misc.UltraLabel().
        ulblDtEdit = NEW Infragistics.Win.Misc.UltraLabel().
        ulblNumEdit = NEW Infragistics.Win.Misc.UltraLabel().
        ulblTextEdit = NEW Infragistics.Win.Misc.UltraLabel().
        ulblMaskEdit = NEW Infragistics.Win.Misc.UltraLabel().
        ulblCombo = NEW Infragistics.Win.Misc.UltraLabel().
        ulblScroll = NEW Infragistics.Win.Misc.UltraLabel().
        ulblPrgs = NEW Infragistics.Win.Misc.UltraLabel().
        ulblCalendarCombo = NEW Infragistics.Win.Misc.UltraLabel().
        ulblTree = NEW Infragistics.Win.Misc.UltraLabel().
        btnDefault = NEW Infragistics.Win.Misc.UltraButton(). 
        btnStandard = NEW Infragistics.Win.Misc.UltraButton(). 
        btnOutlook = NEW Infragistics.Win.Misc.UltraButton(). 
        btnGrid = NEW Infragistics.Win.Misc.UltraButton(). 
        btnFree = NEW Infragistics.Win.Misc.UltraButton(). 

        DEFINE VARIABLE controllist AS System.Array no-undo.
        controllist = System.Array:CreateInstance(TypeHelper:GetType("System.Windows.Forms.Control"), 29).
        controllist:SetValue(ultragrid, 0).
        controllist:SetValue(ultracurrencyedit, 1).
        controllist:SetValue(ultrapicturebox, 2).
        controllist:SetValue(ultranumericeditor, 3).
        controllist:SetValue(ultratexteditor, 4).
        controllist:SetValue(ultracombo, 5).
        controllist:SetValue(ultramaskededit, 6).
        controllist:SetValue(ultrascrollbar, 7).
        controllist:SetValue(ultraprogressbar, 8).
        controllist:SetValue(ultracalendarcombo, 9).
        controllist:SetValue(ultratree, 10).
        controllist:SetValue(ultrastatusbar, 11).
        controllist:SetValue(btnNext, 12).
        controllist:SetValue(btnPrev, 13).
        controllist:SetValue(ulblCurrEdit, 14).
        controllist:SetValue(ulblDtEdit, 15).
        controllist:SetValue(ulblNumEdit, 16).
        controllist:SetValue(ulblTextEdit, 17).
        controllist:SetValue(ulblMaskEdit, 18).
        controllist:SetValue(ulblCombo, 19).
        controllist:SetValue(ulblScroll, 20).
        controllist:SetValue(ulblPrgs, 21).
        controllist:SetValue(ulblCalendarCombo, 22).
        controllist:SetValue(btnDefault, 23).
        controllist:SetValue(btnStandard, 24).
        controllist:SetValue(btnOutlook, 25).
        controllist:SetValue(btnGrid, 26).
        controllist:SetValue(btnFree, 27).
        controllist:SetValue(ulblTree, 28).
        form1:Controls:AddRange(CAST (controllist, "System.Windows.Forms.Control[]") ).

        /* Form */
        form1:Width = 850.
        form1:Height = 800.
        form1:Text = "Data Binding Example".

        /* Ultra Grid */
        ultragrid:Location = NEW Point(3, 25).
        ultragrid:TabIndex = 1.
        ultragrid:Width = 700.
        ultragrid:Height = 200.
        ultragrid:DataSource = pbs. 

        /* Ultra Text Editor */
        ultratexteditor:Location = NEW Point(3, 250).
        ultratexteditor:TabIndex = 2.
        ultratexteditor:DataBindings:ADD("Text", pbs, "Name").

        ulblTextEdit:Location = NEW Point(3, 235).
        ulblTextEdit:TEXT = "Name".

        /* Ultra Masked Edit */
        ultramaskededit:Location = NEW Point(125, 250).
        ultramaskededit:TabIndex = 3.
        ultramaskededit:DataBindings:ADD("Text", pbs, "Address").
        ultramaskededit:FormatString = "".

        ulblMaskEdit:Location = NEW Point(125, 235).
        ulblMaskEdit:TEXT = "Address".
                                                                    
        /* Ultra Currency Editor */
        ultracurrencyedit:Location = NEW Point(250, 250).
        ultracurrencyedit:TabIndex = 4.
        ultracurrencyedit:DataBindings:ADD("Value", pbs, "Balance").

        ulblCurrEdit:Location = NEW Point(250, 235).
        ulblCurrEdit:TEXT = "Balance".

        /* Ultra Numeric Editor */
        ultranumericeditor:Location = NEW Point(400, 250).
        ultranumericeditor:TabIndex = 5.
        ultranumericeditor:DataBindings:ADD("Value", pbs, "Discount").

        ulblNumEdit:Location = NEW Point(400, 235).
        ulblNumEdit:TEXT = "Discount".   

        /* Ultra Scroll Bar */
        ultrascrollbar:Location = NEW Point(550, 250). 
        ultrascrollbar:SIZE = NEW Size(100, 25).
        ultrascrollbar:TabIndex = 6.
        ultrascrollbar:DataBindings:ADD("Value", pbs, "Discount").
 
        ulblScroll:Location = NEW Point(600, 235).
        ulblScroll:TEXT = "Discount".

        /* Ultra Progress Bar */
        ultraprogressbar:Location = NEW Point(700, 250).        
        ultraprogressbar:SIZE = NEW Size(100, 50). 
        ultraprogressbar:TabIndex = 7.
        ultraprogressbar:DataBindings:ADD("Value", pbs, "Discount").
 
        ulblPrgs:Location = NEW Point(700, 235).
        ulblPrgs:TEXT = "Discount".

        /* Ultra Calendar Combo */
        ultracalendarcombo:Location = NEW Point(3, 300).
        ultracalendarcombo:TabIndex = 8.
        ultracalendarcombo:TEXT = "Enter date".
        ultracalendarcombo:DataBindings:ADD("Value", pbs, "ttOrder.Orderdate").

        ulblCalendarCombo:Location = NEW Point(3, 285).
        ulblCalendarCombo:TEXT = "Orderdate".

        /* Ultra Picture Box */
        ultrapicturebox:Location = NEW Point(450, 300). 
        ultrapicturebox:SIZE = NEW Size(175, 100). 
        pic = NEW System.Drawing.Bitmap("./DataBindingExample/SplashScreen.bmp").
        ultrapicturebox:Image = pic.

        /* UltraTree */
        ultraTree:Location = NEW Point(10, 400).
        ultraTree:Size = NEW Size(750, 150).
        ultraTree:TabIndex = 15.
        ultraTree:ViewStyle = ViewStyle:OutlookExpress.
        ultraTree:Name = "ultraTree1".
        ultratree:DataSource = pbs.

        ulblTree:Location = NEW Point(10, 335).
        ulblTree:SIZE = NEW Size(200, 23).
        ulblTree:TEXT = "UltraTree - Change ViewStyle".

        /* UltraCombo */
        ultracombo:Location = NEW Point(3, 700).
        ultracombo:TabIndex = 16.
        ultracombo:DataSource = pbs.
        ultracombo:DisplayMember = "Name".

        ulblCombo:Location = NEW Point(3, 685).
        ulblCombo:TEXT = "UltraCombo".

        /* Ultra StatusBar */
        ultrastatusbar:Location = NEW Point(0, 550).
        ultrastatusbar:SIZE = NEW Size(200, 30). 
        ultrastatusbar:DataBindings:ADD("Text", pbs, "Name"). 

        /* Navigational Buttons */
        btnNext:Location = NEW Point(750, 25).
        btnNext:TEXT = "Next".
        btnNext:TabIndex = 17.
        btnNext:Click:Subscribe(NextRec).

        btnPrev:Location = NEW Point(750, 50).
        btnPrev:TEXT = "Prev".
        btnPrev:TabIndex = 18.
        btnPrev:Click:Subscribe(PrevRec).

        /* UltraTree Buttons */
        btnDefault:Location = NEW Point(10, 360).
        btnDefault:TEXT = "Default".
        btnDefault:TabIndex = 10.
        btnDefault:Click:Subscribe(mDefault).

        btnStandard :Location = NEW Point(85, 360).
        btnStandard :TEXT = "Standard".
        btnStandard:TabIndex = 11.
        btnStandard :Click:Subscribe(mStd).

        btnOutlook :Location = NEW Point(165, 360).
        btnOutlook :TEXT = "Outlook".
        btnOutlook:TabIndex = 12.
        btnOutlook :Click:Subscribe(mOutlk).

        btnGrid :Location = NEW Point(245, 360).
        btnGrid :TEXT = "Grid".
        btnGrid:TabIndex = 13.
        btnGrid :Click:Subscribe(mGrid).

        btnFree:Location = NEW Point(325,360).
        btnFree:TEXT = "FreeForm".
        btnFree:TabIndex = 14.
        btnFree:Click:Subscribe(mFree).
    END.

    /* Navigational Button Events */
    METHOD PRIVATE VOID NextRec(INPUT sender AS System.Object, 
                                INPUT args AS System.EventArgs):
            pbs:POSITION = pbs:POSITION + 1.
    END.

    METHOD PRIVATE VOID PrevRec(INPUT sender AS System.Object,
                                INPUT args AS System.EventArgs):
            pbs:POSITION = pbs:POSITION - 1.  
    END.

    /* UltraTree Button Events for changing ViewStyle */
    METHOD PRIVATE VOID mDefault(INPUT sender AS System.Object,
                                 INPUT args AS System.EventArgs):
        ultraTree:ViewStyle = ViewStyle:Default.
    END.

    METHOD PRIVATE VOID mStd(INPUT sender AS System.Object,
                             INPUT args AS System.EventArgs):
        ultraTree:ViewStyle = ViewStyle:Standard.
    END.

    METHOD PRIVATE VOID mOutlk(INPUT sender AS System.Object,
                               INPUT args AS System.EventArgs):
        ultraTree:ViewStyle = ViewStyle:OutlookExpress.
    END.

    METHOD PRIVATE VOID mGrid(INPUT sender AS System.Object,
                              INPUT args AS System.EventArgs):
        ultraTree:ViewStyle = ViewStyle:Grid.
    END.

    METHOD PRIVATE VOID mFree(INPUT sender AS System.Object,
                              INPUT args AS System.EventArgs):
        ultraTree:ViewStyle = ViewStyle:FreeForm.
    END.
    
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	DESTRUCTOR PUBLIC Databinding ( ):

	END DESTRUCTOR.


END. 
