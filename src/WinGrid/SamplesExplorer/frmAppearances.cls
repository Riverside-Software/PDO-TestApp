 /* 
ABL example derived from Infragistics source, copyright ©1992-2008 Infragistics, 
Inc., Windsor Corporate Park, 50 Millstone Road, Building 200 Suite 150, East 
Windsor, NJ 08520. All rights reserved.
*/
 /*------------------------------------------------------------------------
    File        : frmAppearances
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels - copied/transformed from Infragistic sample
    Created     : Sun May 25 19:04:27 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

using WinGrid.SamplesExplorer.*.

CLASS WinGrid.SamplesExplorer.frmAppearances INHERITS Form implements ISamplesBase  : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.


	define private variable checkBox1 as System.Windows.Forms.CheckBox no-undo.
	define public variable lblDescription as System.Windows.Forms.Label no-undo.
	define public variable btnTitle as System.Windows.Forms.Button no-undo.


	define public variable Panel1 as System.Windows.Forms.Panel no-undo.
	define public variable tvwAppearances as System.Windows.Forms.TreeView no-undo.
	define public variable Splitter1 as System.Windows.Forms.Splitter no-undo.
	define public variable gridAppearances as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.
		
	
	define public variable ContextMenu1 as System.Windows.Forms.ContextMenu no-undo.
	define public variable mnuCellAppearance as System.Windows.Forms.MenuItem no-undo.
	define public variable mnuRowAppearances as System.Windows.Forms.MenuItem no-undo.
	define public variable mnuRowAppearance as System.Windows.Forms.MenuItem no-undo.
	define public variable mnuRowSelectorAppearance as System.Windows.Forms.MenuItem no-undo.
	define public variable mnuRowPreviewAppearance as System.Windows.Forms.MenuItem no-undo.
	define public variable mnuColumnAppearances as System.Windows.Forms.MenuItem no-undo.
	define public variable mnuHeaderAppearance as System.Windows.Forms.MenuItem no-undo.
	define public variable mnuColCellAppearance as System.Windows.Forms.MenuItem no-undo.

 /* manual defs */
	define private variable m_RootNode as System.Windows.Forms.TreeNode no-undo.
	define private variable m_ControlAppearanceNode as System.Windows.Forms.TreeNode no-undo.
	define private variable m_OverrideNode as System.Windows.Forms.TreeNode no-undo.

	define private variable m_CellAppearanceNode as System.Windows.Forms.TreeNode no-undo.
	define private variable m_ActiveCellAppearanceNode as System.Windows.Forms.TreeNode no-undo.
	define private variable m_SelectedCellAppearanceNode as System.Windows.Forms.TreeNode no-undo.
	define private variable m_RowAppearanceNode as System.Windows.Forms.TreeNode no-undo.
	define private variable m_ActiveRowAppearanceNode as System.Windows.Forms.TreeNode no-undo.
	define private variable m_SelectedRowAppearanceNode as System.Windows.Forms.TreeNode no-undo.
	define private variable m_AltRowAppearanceNode as System.Windows.Forms.TreeNode no-undo.
	define private variable m_RowSelectorAppearanceNode as System.Windows.Forms.TreeNode no-undo.
	define private variable m_RowPreviewAppearanceNode as System.Windows.Forms.TreeNode no-undo.
	define private variable m_HeaderAppearanceNode as System.Windows.Forms.TreeNode no-undo.

	define private variable m_ScrollbarLookNode as System.Windows.Forms.TreeNode no-undo.
	define private variable m_ScrollbarLookAppearance as System.Windows.Forms.TreeNode no-undo.
	define private variable m_ScrollbarLookButtonAppearance as System.Windows.Forms.TreeNode no-undo.
	define private variable m_ScrollbarLookThumbAppearance as System.Windows.Forms.TreeNode no-undo.
	define private variable m_ScrollbarLookTrackAppearance as System.Windows.Forms.TreeNode no-undo.

	define private variable m_CellContext as Infragistics.Win.UltraWinGrid.UltraGridCell no-undo.
	define private variable m_RowContext as Infragistics.Win.UltraWinGrid.UltraGridRow no-undo.
	define private variable m_ColumnContext as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
	/*define private variable m_BandContext as Infragistics.Win.UltraWinGrid.UltraGridBand no-undo. */
	define private variable m_ColumnHeaderContext as Infragistics.Win.UltraWinGrid.ColumnHeader no-undo. 
	 
	define private variable fEmployeeDataSource as DataServices.IDataService no-undo.

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
        return System.Drawing.Image:FromFile( SamplesPath:GraphicsPath + "/Previews/Appearances.png").
    end.   
    	

	CONSTRUCTOR PUBLIC frmAppearances (  ):
		
		SUPER().
		InitializeComponent ( ).

	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC frmAppearances ( ):

		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.

	END DESTRUCTOR.

	method private void InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

		this-object:Panel1 = new System.Windows.Forms.Panel().
		this-object:checkBox1 = new System.Windows.Forms.CheckBox().
		this-object:lblDescription = new System.Windows.Forms.Label().
		this-object:btnTitle = new System.Windows.Forms.Button().
		this-object:tvwAppearances = new System.Windows.Forms.TreeView().
		this-object:Splitter1 = new System.Windows.Forms.Splitter().
		this-object:gridAppearances = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:ContextMenu1 = new System.Windows.Forms.ContextMenu().
		this-object:mnuCellAppearance = new System.Windows.Forms.MenuItem().
		this-object:mnuRowAppearances = new System.Windows.Forms.MenuItem().
		this-object:mnuRowAppearance = new System.Windows.Forms.MenuItem().
		this-object:mnuRowSelectorAppearance = new System.Windows.Forms.MenuItem().
		this-object:mnuRowPreviewAppearance = new System.Windows.Forms.MenuItem().
		this-object:mnuColumnAppearances = new System.Windows.Forms.MenuItem().
		this-object:mnuHeaderAppearance = new System.Windows.Forms.MenuItem().
		this-object:mnuColCellAppearance = new System.Windows.Forms.MenuItem().
		this-object:Panel1:SuspendLayout().
		cast(this-object:gridAppearances, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:SuspendLayout().
		/*  */
		/* Panel1 */
		/*  */
		this-object:Panel1:Controls:Add(this-object:checkBox1).
		this-object:Panel1:Controls:Add(this-object:lblDescription).
		this-object:Panel1:Controls:Add(this-object:btnTitle).
		this-object:Panel1:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:Panel1:Location = new System.Drawing.Point(0, 0).
		this-object:Panel1:Name = "Panel1".
		this-object:Panel1:Size = new System.Drawing.Size(748, 98).
		this-object:Panel1:TabIndex = 27.
		/*  */
		/* checkBox1 */
		/*  */
		this-object:checkBox1:Location = new System.Drawing.Point(15, 71).
		this-object:checkBox1:Name = "checkBox1".
		this-object:checkBox1:Size = new System.Drawing.Size(138, 20).
		this-object:checkBox1:TabIndex = 15.
		this-object:checkBox1:Text = "Support Themes".
		this-object:checkBox1:UseCompatibleTextRendering = true.
		this-object:checkBox1:CheckedChanged:subscribe(this-object:checkBox1_CheckedChanged).
		/*  */
		/* lblDescription */
		/*  */
		this-object:lblDescription:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:lblDescription:Location = new System.Drawing.Point(0, 37).
		this-object:lblDescription:Name = "lblDescription".
		this-object:lblDescription:Size = new System.Drawing.Size(748, 28).
		this-object:lblDescription:TabIndex = 14.
		this-object:lblDescription:Text = "Demonstrates the UltraWinGrid's extensive appearance hierarchy. Double Click on an appearance node to adjust it.".
		this-object:lblDescription:UseCompatibleTextRendering = true.
		/*  */
		/* btnTitle */
		/*  */
		this-object:btnTitle:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:btnTitle:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		this-object:btnTitle:Font = new System.Drawing.Font("Arial", 14.25, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		this-object:btnTitle:Location = new System.Drawing.Point(0, 0).
		this-object:btnTitle:Name = "btnTitle".
		this-object:btnTitle:Size = new System.Drawing.Size(748, 37).
		this-object:btnTitle:TabIndex = 13.
		this-object:btnTitle:Text = "Appearances".
		this-object:btnTitle:TextAlign = System.Drawing.ContentAlignment:MiddleLeft.
		this-object:btnTitle:UseCompatibleTextRendering = true.
		this-object:btnTitle:Click:subscribe(this-object:btnTitle_Click).
		this-object:btnTitle:MouseUp:subscribe(this-object:btnTitle_MouseUp).
		/*  */
		/* tvwAppearances */
		/*  */
		this-object:tvwAppearances:Dock = System.Windows.Forms.DockStyle:Left.
		this-object:tvwAppearances:Location = new System.Drawing.Point(9, 98).
		this-object:tvwAppearances:Name = "tvwAppearances".
		this-object:tvwAppearances:Size = new System.Drawing.Size(253, 421).
		this-object:tvwAppearances:TabIndex = 30.
		this-object:tvwAppearances:DoubleClick:subscribe(this-object:tvwAppearances_DoubleClick).
		this-object:tvwAppearances:BeforeCollapse:subscribe(this-object:tvwAppearances_BeforeCollapse).
		/*  */
		/* Splitter1 */
		/*  */
		this-object:Splitter1:Location = new System.Drawing.Point(0, 98).
		this-object:Splitter1:Name = "Splitter1".
		this-object:Splitter1:Size = new System.Drawing.Size(9, 421).
		this-object:Splitter1:TabIndex = 31.
		this-object:Splitter1:TabStop = false.
		/*  */
		/* gridAppearances */
		/*  */
		this-object:gridAppearances:Anchor = cast(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		this-object:gridAppearances:Location = new System.Drawing.Point(271, 98).
		this-object:gridAppearances:Name = "gridAppearances".
		this-object:gridAppearances:Size = new System.Drawing.Size(477, 419).
		this-object:gridAppearances:TabIndex = 32.
		this-object:gridAppearances:Text = "UltraGrid1".
		this-object:gridAppearances:UseOsThemes = Infragistics.Win.DefaultableBoolean:False.
		this-object:gridAppearances:MouseDown:subscribe(this-object:gridAppearances_MouseDown).
		this-object:gridAppearances:InitializeLayout:subscribe(this-object:gridAppearances_InitializeLayout).
		this-object:gridAppearances:InitializeRow:subscribe(this-object:gridAppearances_InitializeRow).
		/*  */
		/* ContextMenu1 */
		/*  */
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		define variable arrayvar0 as System.Windows.Forms.MenuItem extent 3 no-undo.
		arrayvar0[1] = this-object:mnuCellAppearance.
		arrayvar0[2] = this-object:mnuRowAppearances.
		arrayvar0[3] = this-object:mnuColumnAppearances.
		this-object:ContextMenu1:MenuItems:AddRange(arrayvar0).
		/*  */
		/* mnuCellAppearance */
		/*  */
		this-object:mnuCellAppearance:Index = 0.
		this-object:mnuCellAppearance:Text = "Cell Appearance".
		this-object:mnuCellAppearance:Click:subscribe(this-object:mnuCellAppearance_Click).
		/*  */
		/* mnuRowAppearances */
		/*  */
		this-object:mnuRowAppearances:Index = 1.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		define variable arrayvar1 as System.Windows.Forms.MenuItem extent 3 no-undo.
		arrayvar1[1] = this-object:mnuRowAppearance.
		arrayvar1[2] = this-object:mnuRowSelectorAppearance.
		arrayvar1[3] = this-object:mnuRowPreviewAppearance.
		this-object:mnuRowAppearances:MenuItems:AddRange(arrayvar1).
		this-object:mnuRowAppearances:Text = "Row Appearances".
		/*  */
		/* mnuRowAppearance */
		/*  */
		this-object:mnuRowAppearance:Index = 0.
		this-object:mnuRowAppearance:Text = "RowAppearance".
		this-object:mnuRowAppearance:Click:subscribe(this-object:mnuRowAppearance_Click).
		/*  */
		/* mnuRowSelectorAppearance */
		/*  */
		this-object:mnuRowSelectorAppearance:Index = 1.
		this-object:mnuRowSelectorAppearance:Text = "RowSelectorAppearance".
		this-object:mnuRowSelectorAppearance:Click:subscribe(this-object:mnuRowSelectorAppearance_Click).
		/*  */
		/* mnuRowPreviewAppearance */
		/*  */
		this-object:mnuRowPreviewAppearance:Index = 2.
		this-object:mnuRowPreviewAppearance:Text = "RowPreviewAppearance".
		this-object:mnuRowPreviewAppearance:Click:subscribe(this-object:mnuRowPreviewAppearance_Click).
		/*  */
		/* mnuColumnAppearances */
		/*  */
		this-object:mnuColumnAppearances:Index = 2.
		@VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
		define variable arrayvar2 as System.Windows.Forms.MenuItem extent 2 no-undo.
		arrayvar2[1] = this-object:mnuHeaderAppearance.
		arrayvar2[2] = this-object:mnuColCellAppearance.
		this-object:mnuColumnAppearances:MenuItems:AddRange(arrayvar2).
		this-object:mnuColumnAppearances:Text = "Column Appearances".
		/*  */
		/* mnuHeaderAppearance */
		/*  */
		this-object:mnuHeaderAppearance:Index = 0.
		this-object:mnuHeaderAppearance:Text = "HeaderAppearance".
		this-object:mnuHeaderAppearance:Click:subscribe(this-object:mnuHeaderAppearance_Click).
		/*  */
		/* mnuColCellAppearance */
		/*  */
		this-object:mnuColCellAppearance:Index = 1.
		this-object:mnuColCellAppearance:Text = "CellAppearance".
		this-object:mnuColCellAppearance:Click:subscribe(this-object:mnuColCellAppearance_Click).
		/*  */
		/* frmAppearances */
		/*  */
		this-object:ClientSize = new System.Drawing.Size(748, 519).
		this-object:Controls:Add(this-object:tvwAppearances).
		this-object:Controls:Add(this-object:Splitter1).
		this-object:Controls:Add(this-object:gridAppearances).
		this-object:Controls:Add(this-object:Panel1).
		this-object:Name = "frmAppearances".
		this-object:Text = "Appearances".
		this-object:Load:subscribe(this-object:frmAppearances_Load).
		this-object:FormClosing:subscribe(this-object:frmAppearances_FormClosing).
		this-object:Panel1:ResumeLayout(false).
		cast(this-object:gridAppearances, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ResumeLayout(false).

	end method.


    method private void DisableAllContextMenuItems():
		assign
    		mnuCellAppearance:Enabled = false
    		mnuColCellAppearance:Enabled = false
    		mnuColumnAppearances:Enabled = false
    		mnuHeaderAppearance:Enabled = false
    		mnuRowAppearances:Enabled = false
    		mnuRowAppearance:Enabled = false
    		mnuRowPreviewAppearance:Enabled = false
    		mnuRowSelectorAppearance:Enabled = false.
	end method.

	method private void NullifyAllContextObjects():
		assign
            m_CellContext = ?
			m_ColumnContext = ?
			m_ColumnHeaderContext = ?
			m_RowContext = ?.
	end method.
    
    method private void PopulateTree():
	    define variable objNode as System.Windows.Forms.TreeNode no-undo.

		tvwAppearances:Nodes:Clear().

		m_RootNode = tvwAppearances:Nodes:Add("The UltraWinGrid Appearance Hierarchy").
		m_ControlAppearanceNode = m_RootNode:Nodes:Add("Control-level Appearance").
		m_ControlAppearanceNode:Tag = gridAppearances:DisplayLayout:Appearance.

		m_OverrideNode = m_ControlAppearanceNode:Nodes:Add("Override").
		m_OverrideNode:Tag = ?.

        m_ScrollbarLookNode = m_ControlAppearanceNode:Nodes:Add("ScrollbarLook").
        m_ScrollbarLookNode:Tag = ?.

        m_ScrollbarLookAppearance = m_ScrollbarLookNode:Nodes:Add("Appearance").
        m_ScrollbarLookAppearance:Tag = gridAppearances:DisplayLayout:ScrollBarLook:Appearance.

        m_ScrollbarLookButtonAppearance = m_ScrollbarLookNode:Nodes:Add("ButtonAppearance").
        m_ScrollbarLookButtonAppearance:Tag = gridAppearances:DisplayLayout:ScrollBarLook:ButtonAppearance.

        m_ScrollbarLookThumbAppearance = m_ScrollbarLookNode:Nodes:Add("ThumbAppearance").
        m_ScrollbarLookThumbAppearance:Tag = gridAppearances:DisplayLayout:ScrollBarLook:ThumbAppearance.

        m_ScrollbarLookTrackAppearance = m_ScrollbarLookNode:Nodes:Add("TrackAppearance").
        m_ScrollbarLookTrackAppearance:Tag = gridAppearances:DisplayLayout:ScrollBarLook:TrackAppearance.


		objNode = m_OverrideNode:Nodes:Add("Cell Appearances").

		m_ActiveCellAppearanceNode = objNode:Nodes:Add("ActiveCellAppearance").
		m_ActiveCellAppearanceNode:Tag = gridAppearances:DisplayLayout:Override:ActiveCellAppearance.

		m_SelectedCellAppearanceNode = objNode:Nodes:Add("SelectedCellAppearance").
		m_SelectedCellAppearanceNode:Tag = gridAppearances:DisplayLayout:Override:SelectedCellAppearance.

		m_CellAppearanceNode = objNode:Nodes:Add("CellAppearance").
		m_CellAppearanceNode:Tag = gridAppearances:DisplayLayout:Override:CellAppearance.

		m_HeaderAppearanceNode = m_OverrideNode:Nodes:Add("HeaderAppearance").
		m_HeaderAppearanceNode:Tag = gridAppearances:DisplayLayout:Override:HeaderAppearance.

		objNode = m_OverrideNode:Nodes:Add("Row Appearances").

		m_ActiveRowAppearanceNode = objNode:Nodes:Add("ActiveRowAppearance").
		m_ActiveRowAppearanceNode:Tag = gridAppearances:DisplayLayout:Override:ActiveRowAppearance.

		m_SelectedRowAppearanceNode = objNode:Nodes:Add("SelectedRowAppearance").
		m_SelectedRowAppearanceNode:Tag = gridAppearances:DisplayLayout:Override:SelectedRowAppearance.

		m_RowAppearanceNode = objNode:Nodes:Add("RowAppearance").
		m_RowAppearanceNode:Tag = gridAppearances:DisplayLayout:Override:RowAppearance.

		m_RowSelectorAppearanceNode = m_RowAppearanceNode:Nodes:Add("RowSelectorAppearance").
		m_RowSelectorAppearanceNode:Tag = gridAppearances:DisplayLayout:Override:RowSelectorAppearance.

		m_RowPreviewAppearanceNode = m_RowAppearanceNode:Nodes:Add("RowPreviewAppearance").
		m_RowPreviewAppearanceNode:Tag = gridAppearances:DisplayLayout:Override:RowPreviewAppearance.

		m_AltRowAppearanceNode = m_RowAppearanceNode:Nodes:Add("RowAlternateAppearance").
		m_AltRowAppearanceNode:Tag = gridAppearances:DisplayLayout:Override:RowAlternateAppearance.

		tvwAppearances:ExpandAll().

	end method.
	
	/* call from menu item events */
	method private void LaunchAppearancePicker (objAppearance as System.Object, controlName as char):
	    define variable frmAppPicker as AppearancePicker no-undo.
		frmAppPicker = new AppearancePicker().
		frmAppPicker:ShowMe(objAppearance, controlName). 
	end method. 
	
	method protected Progress.Data.BindingSource GetEmployeeSource():   
        if not valid-object(fEmployeeDataSource) then
        do:
            fEmployeeDataSource = new DataServices.EmployeeService().                  
            fEmployeeDataSource:fetchData().                                                 
        end.
        return new Progress.Data.BindingSource(fEmployeeDataSource:DataSetHandle).
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
	METHOD Protected VOID btnTitle_MouseUp( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.MouseEventArgs ):
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
	METHOD PRIVATE VOID checkBox1_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		gridAppearances:SupportThemes = checkBox1:Checked.
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID frmAppearances_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		gridAppearances:Text = "".
		gridAppearances:DataSource = GetEmployeeSource().

		PopulateTree().		
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID gridAppearances_InitializeLayout( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.InitializeLayoutEventArgs ):
		e:Layout:Override:CellPadding = 5.
		e:Layout:Override:CellSpacing = 5.
		e:Layout:Override:RowSpacingBefore = 10.
		e:Layout:Bands[0]:Indentation = 5.
		e:Layout:Override:CellClickAction = Infragistics.Win.UltraWinGrid.CellClickAction:CellSelect.

		e:Layout:Bands[0]:Columns:Add("AutoPreview").
		e:Layout:Bands[0]:AutoPreviewEnabled = true.
		e:Layout:Bands[0]:AutoPreviewField = "AutoPreview".
		e:Layout:Bands[0]:Columns["AutoPreview"]:Hidden = true.

		/*   Turn off selection so changes to  the Appearance properties */
		/*   are immediately apparent */
		gridAppearances:DisplayLayout:Override:SelectTypeCell = Infragistics.Win.UltraWinGrid.SelectType:None.
		gridAppearances:DisplayLayout:Override:SelectTypeRow = Infragistics.Win.UltraWinGrid.SelectType:None.
		gridAppearances:DisplayLayout:Override:SelectTypeCol = Infragistics.Win.UltraWinGrid.SelectType:None.
	
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID tvwAppearances_DoubleClick( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		define variable frmAppPicker as AppearancePicker no-undo.
		define variable point as System.Drawing.Point no-undo.
		define variable objNode as System.Windows.Forms.TreeNode no-undo.
		
		point = System.Windows.Forms.Cursor:Position.
		point = tvwAppearances:PointToClient(point).
	    objNode = tvwAppearances:GetNodeAt(point).
	    
		if not valid-object(objNode) or not valid-object(objNode:Tag) then
			return.

		/*   If the user clicked one of the 'Selected' nodes, reenable selection */
		if ( objNode:Text = "SelectedCellAppearance" ) then
			gridAppearances:DisplayLayout:Override:SelectTypeCell = Infragistics.Win.UltraWinGrid.SelectType:Default.

		if ( objNode:Text = "SelectedRowAppearance" ) then
			gridAppearances:DisplayLayout:Override:SelectTypeRow = Infragistics.Win.UltraWinGrid.SelectType:Default.
        frmAppPicker = new AppearancePicker().
		frmAppPicker:ShowMe(objNode:Tag, objNode:Text).
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID gridAppearances_InitializeRow( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.InitializeRowEventArgs ):		
		e:Row:Cells["AutoPreview"]:Value = "This is the RowPreview area".
		RETURN.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID tvwAppearances_BeforeCollapse( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.TreeViewCancelEventArgs ):
		/*   Double-clicks, even on expansion indicators, collapse */
		/*   expanded nodes, which can be pretty annoying for this sample */
		e:Cancel = true.
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID gridAppearances_MouseDown( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.MouseEventArgs ):
		define variable point          as System.Drawing.Point no-undo.
 		define variable mouseLoc       as System.Drawing.Point no-undo.                                  
 		define variable objUIElement   as Infragistics.Win.UIElement no-undo.                            
 		define variable objNode        as System.Windows.Forms.TreeNode no-undo.                         
    	define variable objCell        as Infragistics.Win.UltraWinGrid.UltraGridCell no-undo.           
		define variable objCol         as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		define variable objCol2        as Infragistics.Win.UltraWinGrid.UltraGridColumn no-undo.
		define variable objHeader      as Infragistics.Win.UltraWinGrid.ColumnHeader no-undo.
 		define variable objRow         as Infragistics.Win.UltraWinGrid.UltraGridRow no-undo.           
 		define variable objRowPreview  as Infragistics.Win.UltraWinGrid.RowAutoPreviewUIElement no-undo. 
 	/** comoiler internal error
 		define variable objRowSelector as Infragistics.Win.UltraWinGrid.RowSelectorUIElement no-undo.    
    **/
 		if not Progress.Util.EnumHelper:AreEqual(e:Button,System.Windows.Forms.MouseButtons:Right) then      
			return.

	    point = new System.Drawing.Point(e:X, e:Y).

        /*  Disable all all the items on the context menu, and then enable the applicable ones */
        DisableAllContextMenuItems().                                                    

		/*  Set all of the context-related member variables to Nothing */
		NullifyAllContextObjects().
 
		/*   Get the UIElement */
		objUIElement = gridAppearances:DisplayLayout:UIElement:ElementFromPoint(point).
		if not valid-object(objUIElement) then
			return.

		/*   See if we are over a cell */
		objCell =  cast(objUIElement:GetContext(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinGrid.UltraGridCell")),Infragistics.Win.UltraWinGrid.UltraGridCell).

		if valid-object(objCell) then
		do:
			m_CellContext = objCell.
			mnuCellAppearance:Enabled = true.
		end.
 
		/*   See if we are over a column */
		objCol =  cast(objUIElement:GetContext(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinGrid.UltraGridColumn")),Infragistics.Win.UltraWinGrid.UltraGridColumn).
		if valid-object(objCol) then
		do:
			m_ColumnContext = objCol.
			mnuColumnAppearances:Enabled = true.
			mnuColCellAppearance:Enabled = true.
		end.
      
        objHeader = cast(objUIElement:GetContext(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinGrid.ColumnHeader")),Infragistics.Win.UltraWinGrid.ColumnHeader).
		if valid-object(objHeader) then
		do:
            m_ColumnHeaderContext = objHeader.
			mnuHeaderAppearance:Enabled = true.
            
			/*   Get the column's context as well */
			objCol2 = objHeader:Column.
			if valid-object( objCol2 ) then
			do:
				m_ColumnContext = objCol2.
				mnuColumnAppearances:Enabled = true.
				mnuColCellAppearance:Enabled = true.
			end.
		end.
 
 		/*  See if we are over a row */
        objRow = cast(objUIElement:GetContext(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinGrid.UltraGridRow")),Infragistics.Win.UltraWinGrid.UltraGridRow).
		if valid-object(objRow) then
		do:
			m_RowContext = objRow.
			mnuRowAppearances:Enabled = true.
			mnuRowAppearance:Enabled = true.
		end.
 
		/*  See if we are over the row's AutoPreview area */
		objRowPreview = cast(objUIElement:GetContext(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinGrid.RowAutoPreviewUIElement")),Infragistics.Win.UltraWinGrid.RowAutoPreviewUIElement).
		if valid-object(objRowPreview) then
		do:
			mnuRowPreviewAppearance:Enabled = true.
		end.
   /*  
        /*  See if we are over the RowSelector area */
		objRowSelector = cast(objUIElement:GetContext(Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinGrid.RowSelectorUIElement")),Infragistics.Win.UltraWinGrid.RowSelectorUIElement).
		if valid-object(objRowSelector) then
		do:
			mnuRowSelectorAppearance:Enabled = true.
		end.
	*/ 
 
 	    mouseLoc = new System.Drawing.Point(e:X, e:Y). 
		
		
		ContextMenu1:Show(gridAppearances, mouseLoc).
  
		RETURN.

	END METHOD.

    /*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID mnuCellAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		if valid-object(m_CellContext) then
			LaunchAppearancePicker(m_CellContext:Appearance, "CellAppearance").
        RETURN.
	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID mnuRowAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		if valid-object(m_RowContext) then
			LaunchAppearancePicker(m_RowContext:Appearance, "RowAppearance").
    	RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID mnuRowSelectorAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		if valid-object(m_RowContext) then
			LaunchAppearancePicker(m_RowContext:RowSelectorAppearance, "RowSelectorAppearance").
    	
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID mnuRowPreviewAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		if valid-object(m_RowContext) then
			LaunchAppearancePicker(m_RowContext:PreviewAppearance, "Row PreviewAppearance").
    	
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID mnuHeaderAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		if valid-object(m_ColumnHeaderContext) then
			LaunchAppearancePicker(m_ColumnHeaderContext:Appearance, "Column Header Appearance").
    	
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID mnuColCellAppearance_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		if valid-object(m_ColumnContext) then
			LaunchAppearancePicker(m_ColumnContext:CellAppearance, "Column CellAppearance").
    	
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID frmAppearances_FormClosing( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.FormClosingEventArgs ):
		if valid-object(this-object:Owner) then 
	    do:
	        e:Cancel = true.
		    this-object:Visible = false.
		end.
		RETURN.

	END METHOD.
  
END CLASS.