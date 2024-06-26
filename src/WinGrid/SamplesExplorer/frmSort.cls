/* 
ABL example derived from Infragistics source, copyright �1992-2008 Infragistics, 
Inc., Windsor Corporate Park, 50 Millstone Road, Building 200 Suite 150, East 
Windsor, NJ 08520. All rights reserved.
*/ 
 /*------------------------------------------------------------------------
    File        : frmSort
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels -  - copied/transformed from Infragistic sample
    Created     : Tue May 20 18:25:53 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

using WinGrid.SamplesExplorer.*.

CLASS WinGrid.SamplesExplorer.frmSort INHERITS Form implements ISamplesBase : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.


	define public variable btnTitle as System.Windows.Forms.Button no-undo.
	define public variable lblDescription as System.Windows.Forms.Label no-undo.
	define public variable UltraGrid1 as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.

		
	CONSTRUCTOR PUBLIC frmSort (  ):
		
		SUPER().
		InitializeComponent ( ).
        initializeForm().
	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC frmSort ( ):

		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.

	END DESTRUCTOR.


    define private variable fDeptEmployeeBindingSource as Progress.Data.BindingSource no-undo.    
    define private variable fDeptEmployeeDataSource as DataServices.IDataService no-undo.
        
		/* Provides a description for the sample. */
	define public property Description as character no-undo 
	get:
	    return lblDescription:Text.
	end.
	
    /* Name of the sample. */
	define public property SampleName as character no-undo
    get:
        return btnTitle:Text. 
    end.
	
    /* Type of sample. */
	define public property SampleType as character no-undo
	get:
	    return "Feature".
	end.    

	/* Preview Picture for Sample */
	define public property PreviewPicture as System.Drawing.Image no-undo
    get:
        return System.Drawing.Image:FromFile(SamplesPath:GraphicsPath + "/Previews/PreloadSorting.png").
    end.   

	method private void InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

		this-object:btnTitle = new System.Windows.Forms.Button().
		this-object:lblDescription = new System.Windows.Forms.Label().
		this-object:UltraGrid1 = new Infragistics.Win.UltraWinGrid.UltraGrid().
		cast(this-object:UltraGrid1, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:SuspendLayout().
		/*  */
		/* btnTitle */
		/*  */
		this-object:btnTitle:Anchor = cast(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		this-object:btnTitle:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		this-object:btnTitle:Font = new System.Drawing.Font("Arial", 14.25, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		this-object:btnTitle:Location = new System.Drawing.Point(8, 8).
		this-object:btnTitle:Name = "btnTitle".
		this-object:btnTitle:Size = new System.Drawing.Size(704, 32).
		this-object:btnTitle:TabIndex = 7.
		this-object:btnTitle:Text = "Sorting ".
		this-object:btnTitle:TextAlign = System.Drawing.ContentAlignment:MiddleLeft.
		this-object:btnTitle:UseCompatibleTextRendering = true.
		this-object:btnTitle:Click:subscribe(this-object:btnTitle_Click).
		this-object:btnTitle:MouseUp:subscribe(this-object:btnTitle_MouseUp).
		/*  */
		/* lblDescription */
		/*  */
		this-object:lblDescription:Anchor = cast(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		this-object:lblDescription:Location = new System.Drawing.Point(8, 48).
		this-object:lblDescription:Name = "lblDescription".
		this-object:lblDescription:Size = new System.Drawing.Size(552, 16).
		this-object:lblDescription:TabIndex = 8.
		this-object:lblDescription:Text = "This sample demonstrates the automatic sorting capabilities of the UltraGrid.".
		this-object:lblDescription:UseCompatibleTextRendering = true.
		/*  */
		/* UltraGrid1 */
		/*  */
		this-object:UltraGrid1:Anchor = cast(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		this-object:UltraGrid1:DisplayLayout:Override:AllowColSizing = Infragistics.Win.UltraWinGrid.AllowColSizing:Free.
		this-object:UltraGrid1:DisplayLayout:Override:HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction:SortMulti.
		this-object:UltraGrid1:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
		this-object:UltraGrid1:Location = new System.Drawing.Point(8, 80).
		this-object:UltraGrid1:Name = "UltraGrid1".
		this-object:UltraGrid1:Size = new System.Drawing.Size(704, 320).
		this-object:UltraGrid1:TabIndex = 9.
		this-object:UltraGrid1:Text = "Prototype Grid".
		this-object:UltraGrid1:InitializeLayout:subscribe(this-object:UltraGrid1_InitializeLayout).
		/*  */
		/* frmSort */
		/*  */
		this-object:ClientSize = new System.Drawing.Size(720, 409).
		this-object:Controls:Add(this-object:UltraGrid1).
		this-object:Controls:Add(this-object:lblDescription).
		this-object:Controls:Add(this-object:btnTitle).
		this-object:Name = "frmSort".
		this-object:Text = "Sorting".
		this-object:FormClosing:subscribe(this-object:frmSort_FormClosing).
		cast(this-object:UltraGrid1, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ResumeLayout(false).

	end method.


    method protected Progress.Data.BindingSource getDeptEmployeeSource():   
        if not valid-object(fDeptEmployeeBindingSource) then
        do:
            fDeptEmployeeDataSource = new DataServices.DeptEmployeeService().                  
            fDeptEmployeeDataSource:fetchData().                                                 
       
            fDeptEmployeeBindingSource = new Progress.Data.BindingSource().
            fDeptEmployeeBindingSource:Handle = fDeptEmployeeDataSource:DataSetHandle.
        end.
        return fDeptEmployeeBindingSource. 
    end method.   
    
    method private void initializeForm():
        UltraGrid1:DataSource = getDeptEmployeeSource().
    end method.
    
     /* implements ISamplesBase interface  */
    method public void ShowMe( owner as System.Windows.Forms.Form  ):
/*		InitializeForm().*/
	    if (owner <> ?) then
			this-object:Owner = owner.
		this-object:Show().
	    this-object:CancelButton = btnTitle.
        this-object:CenterToScreen().
		this-object:MaximizeBox = true.
	end.	

    /* implements ISamplesBase interface  */
    method public void HideMe( ):
        this-object:Hide().   
    end.
    

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID btnTitle_MouseUp( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.MouseEventArgs ):
		if valid-object(this-object:Owner) then
		    (cast (this-object:Owner,frmMain)):Navigation(e:Button).
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID btnTitle_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
        if valid-object(this-object:Owner) then
            HideMe().
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID UltraGrid1_InitializeLayout( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.InitializeLayoutEventArgs ):
		/*  Hide some key and parent columns */
		e:Layout:Bands[1]:Columns["DeptCode"]:Hidden = true.
        e:Layout:Bands[1]:Columns["EmpNum"]:Hidden = true.
		
		e:Layout:Bands[2]:Columns["EmpNum"]:Hidden = true.
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID frmSort_FormClosing( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.FormClosingEventArgs ):
		if valid-object(this-object:Owner) then 
	    do:
	        e:Cancel = true.
		    this-object:Visible = false.
		end.
		RETURN.

	END METHOD.


 


 

 

 

 
END CLASS.