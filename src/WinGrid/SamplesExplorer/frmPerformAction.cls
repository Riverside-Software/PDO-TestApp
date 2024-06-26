 /* 
ABL example derived from Infragistics source, copyright �1992-2008 Infragistics, 
Inc., Windsor Corporate Park, 50 Millstone Road, Building 200 Suite 150, East 
Windsor, NJ 08520. All rights reserved.
*/
 /*------------------------------------------------------------------------
    File        : frmPerformAction
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels - copied/transformed from Infragistic sample
    Created     : Thu May 22 13:54:44 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

using WinGrid.SamplesExplorer.*.
 

CLASS WinGrid.SamplesExplorer.frmPerformAction INHERITS Form implements ISamplesBase : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.


	define public variable Panel1 as System.Windows.Forms.Panel no-undo.
	define public variable chkEnableAlphaBlending as System.Windows.Forms.CheckBox no-undo.
	define public variable lblDescription as System.Windows.Forms.Label no-undo.
	define public variable btnTitle as System.Windows.Forms.Button no-undo.
	define public variable Panel2 as System.Windows.Forms.Panel no-undo.
	define public variable TabControl1 as System.Windows.Forms.TabControl no-undo.
	define public variable PerformAction as System.Windows.Forms.TabPage no-undo.
	define public variable chkSimulateShiftKey as System.Windows.Forms.CheckBox no-undo.
	define public variable chkSimulateControlKey as System.Windows.Forms.CheckBox no-undo.
	define public variable cmdPerform as System.Windows.Forms.Button no-undo.
	define public variable lblCurrentState as System.Windows.Forms.Label no-undo.
	define public variable lstCurrentState as System.Windows.Forms.ListBox no-undo.
	define public variable cboPerformAction as System.Windows.Forms.ComboBox no-undo.
	define public variable lblAction as System.Windows.Forms.Label no-undo.
	define public variable KeyMappings as System.Windows.Forms.TabPage no-undo.
	define public variable cboActionToMap as System.Windows.Forms.ComboBox no-undo.
	define public variable lblActionToMap as System.Windows.Forms.Label no-undo.
	define public variable lblRequiredState as System.Windows.Forms.Label no-undo.
	define public variable lstRequiredState as System.Windows.Forms.ListBox no-undo.
	define public variable lblDisallowedState as System.Windows.Forms.Label no-undo.
	define public variable lstDisallowedState as System.Windows.Forms.ListBox no-undo.
	define public variable cboKeys as System.Windows.Forms.ComboBox no-undo.
	define public variable lblKeys as System.Windows.Forms.Label no-undo.
	define public variable cmdAddKeyMapping as System.Windows.Forms.Button no-undo.
	define public variable UltraGrid1 as Infragistics.Win.UltraWinGrid.UltraGrid no-undo.


	define private variable timer1 as System.Windows.Forms.Timer no-undo.
	
	 /* manual defs */
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
        return System.Drawing.Image:FromFile( SamplesPath:GraphicsPath + "/Previews/GRID.png").
    end.   

		
	CONSTRUCTOR PUBLIC frmPerformAction (  ):
		
		SUPER().
		InitializeComponent ( ).

	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC frmPerformAction ( ):

		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.

	END DESTRUCTOR.

	method private void InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

		this-object:components = new System.ComponentModel.Container().
		this-object:Panel1 = new System.Windows.Forms.Panel().
		this-object:chkEnableAlphaBlending = new System.Windows.Forms.CheckBox().
		this-object:lblDescription = new System.Windows.Forms.Label().
		this-object:btnTitle = new System.Windows.Forms.Button().
		this-object:Panel2 = new System.Windows.Forms.Panel().
		this-object:TabControl1 = new System.Windows.Forms.TabControl().
		this-object:PerformAction = new System.Windows.Forms.TabPage().
		this-object:chkSimulateShiftKey = new System.Windows.Forms.CheckBox().
		this-object:chkSimulateControlKey = new System.Windows.Forms.CheckBox().
		this-object:cmdPerform = new System.Windows.Forms.Button().
		this-object:lblCurrentState = new System.Windows.Forms.Label().
		this-object:lstCurrentState = new System.Windows.Forms.ListBox().
		this-object:cboPerformAction = new System.Windows.Forms.ComboBox().
		this-object:lblAction = new System.Windows.Forms.Label().
		this-object:KeyMappings = new System.Windows.Forms.TabPage().
		this-object:cboActionToMap = new System.Windows.Forms.ComboBox().
		this-object:lblActionToMap = new System.Windows.Forms.Label().
		this-object:lblRequiredState = new System.Windows.Forms.Label().
		this-object:lstRequiredState = new System.Windows.Forms.ListBox().
		this-object:lblDisallowedState = new System.Windows.Forms.Label().
		this-object:lstDisallowedState = new System.Windows.Forms.ListBox().
		this-object:cboKeys = new System.Windows.Forms.ComboBox().
		this-object:lblKeys = new System.Windows.Forms.Label().
		this-object:cmdAddKeyMapping = new System.Windows.Forms.Button().
		this-object:UltraGrid1 = new Infragistics.Win.UltraWinGrid.UltraGrid().
		this-object:timer1 = new System.Windows.Forms.Timer(this-object:components).
		this-object:Panel1:SuspendLayout().
		this-object:Panel2:SuspendLayout().
		this-object:TabControl1:SuspendLayout().
		this-object:PerformAction:SuspendLayout().
		this-object:KeyMappings:SuspendLayout().
		cast(this-object:UltraGrid1, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:SuspendLayout().
		/*  */
		/* Panel1 */
		/*  */
		this-object:Panel1:Controls:Add(this-object:chkEnableAlphaBlending).
		this-object:Panel1:Controls:Add(this-object:lblDescription).
		this-object:Panel1:Controls:Add(this-object:btnTitle).
		this-object:Panel1:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:Panel1:Location = new System.Drawing.Point(0, 0).
		this-object:Panel1:Name = "Panel1".
		this-object:Panel1:Size = new System.Drawing.Size(696, 88).
		this-object:Panel1:TabIndex = 22.
		/*  */
		/* chkEnableAlphaBlending */
		/*  */
		this-object:chkEnableAlphaBlending:Location = new System.Drawing.Point(8, 56).
		this-object:chkEnableAlphaBlending:Name = "chkEnableAlphaBlending".
		this-object:chkEnableAlphaBlending:Size = new System.Drawing.Size(104, 24).
		this-object:chkEnableAlphaBlending:TabIndex = 15.
		this-object:chkEnableAlphaBlending:Text = "AlphaBlending".
		this-object:chkEnableAlphaBlending:UseCompatibleTextRendering = true.
		this-object:chkEnableAlphaBlending:CheckedChanged:subscribe(this-object:chkEnableAlphaBlending_CheckedChanged).
		/*  */
		/* lblDescription */
		/*  */
		this-object:lblDescription:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:lblDescription:Location = new System.Drawing.Point(0, 32).
		this-object:lblDescription:Name = "lblDescription".
		this-object:lblDescription:Size = new System.Drawing.Size(696, 24).
		this-object:lblDescription:TabIndex = 14.
		this-object:lblDescription:Text = "Demonstrates the use of the PerformAction method and the KeyMappings collection".
		this-object:lblDescription:UseCompatibleTextRendering = true.
		/*  */
		/* btnTitle */
		/*  */
		this-object:btnTitle:Dock = System.Windows.Forms.DockStyle:Top.
		this-object:btnTitle:FlatStyle = System.Windows.Forms.FlatStyle:Flat.
		this-object:btnTitle:Font = new System.Drawing.Font("Arial", 14.25, System.Drawing.FontStyle:Bold, System.Drawing.GraphicsUnit:Point, Progress.Util.CastUtil:ToByte(0)).
		this-object:btnTitle:Location = new System.Drawing.Point(0, 0).
		this-object:btnTitle:Name = "btnTitle".
		this-object:btnTitle:Size = new System.Drawing.Size(696, 32).
		this-object:btnTitle:TabIndex = 13.
		this-object:btnTitle:Text = "PerformAction / KeyMappings".
		this-object:btnTitle:TextAlign = System.Drawing.ContentAlignment:MiddleLeft.
		this-object:btnTitle:UseCompatibleTextRendering = true.
		this-object:btnTitle:Click:subscribe(this-object:btnTitle_Click).
		this-object:btnTitle:MouseUp:subscribe(this-object:btnTitle_MouseUp).
		/*  */
		/* Panel2 */
		/*  */
		this-object:Panel2:Controls:Add(this-object:TabControl1).
		this-object:Panel2:Dock = System.Windows.Forms.DockStyle:Left.
		this-object:Panel2:Location = new System.Drawing.Point(0, 88).
		this-object:Panel2:Name = "Panel2".
		this-object:Panel2:Size = new System.Drawing.Size(192, 373).
		this-object:Panel2:TabIndex = 24.
		/*  */
		/* TabControl1 */
		/*  */
		this-object:TabControl1:Controls:Add(this-object:PerformAction).
		this-object:TabControl1:Controls:Add(this-object:KeyMappings).
		this-object:TabControl1:Location = new System.Drawing.Point(8, 8).
		this-object:TabControl1:Name = "TabControl1".
		this-object:TabControl1:SelectedIndex = 0.
		this-object:TabControl1:Size = new System.Drawing.Size(176, 360).
		this-object:TabControl1:TabIndex = 0.
		/*  */
		/* PerformAction */
		/*  */
		this-object:PerformAction:Controls:Add(this-object:chkSimulateShiftKey).
		this-object:PerformAction:Controls:Add(this-object:chkSimulateControlKey).
		this-object:PerformAction:Controls:Add(this-object:cmdPerform).
		this-object:PerformAction:Controls:Add(this-object:lblCurrentState).
		this-object:PerformAction:Controls:Add(this-object:lstCurrentState).
		this-object:PerformAction:Controls:Add(this-object:cboPerformAction).
		this-object:PerformAction:Controls:Add(this-object:lblAction).
		this-object:PerformAction:Location = new System.Drawing.Point(4, 22).
		this-object:PerformAction:Name = "PerformAction".
		this-object:PerformAction:Size = new System.Drawing.Size(168, 334).
		this-object:PerformAction:TabIndex = 0.
		this-object:PerformAction:Text = "PerformAction".
		/*  */
		/* chkSimulateShiftKey */
		/*  */
		this-object:chkSimulateShiftKey:Location = new System.Drawing.Point(8, 241).
		this-object:chkSimulateShiftKey:Name = "chkSimulateShiftKey".
		this-object:chkSimulateShiftKey:Size = new System.Drawing.Size(136, 16).
		this-object:chkSimulateShiftKey:TabIndex = 33.
		this-object:chkSimulateShiftKey:Text = "Simulate Shift Key".
		this-object:chkSimulateShiftKey:UseCompatibleTextRendering = true.
		/*  */
		/* chkSimulateControlKey */
		/*  */
		this-object:chkSimulateControlKey:Location = new System.Drawing.Point(8, 217).
		this-object:chkSimulateControlKey:Name = "chkSimulateControlKey".
		this-object:chkSimulateControlKey:Size = new System.Drawing.Size(136, 16).
		this-object:chkSimulateControlKey:TabIndex = 32.
		this-object:chkSimulateControlKey:Text = "Simulate Control Key".
		this-object:chkSimulateControlKey:UseCompatibleTextRendering = true.
		/*  */
		/* cmdPerform */
		/*  */
		this-object:cmdPerform:Location = new System.Drawing.Point(24, 290).
		this-object:cmdPerform:Name = "cmdPerform".
		this-object:cmdPerform:Size = new System.Drawing.Size(120, 24).
		this-object:cmdPerform:TabIndex = 31.
		this-object:cmdPerform:Text = "Perform Action".
		this-object:cmdPerform:UseCompatibleTextRendering = true.
		this-object:cmdPerform:Click:subscribe(this-object:cmdPerform_Click).
		/*  */
		/* lblCurrentState */
		/*  */
		this-object:lblCurrentState:AutoSize = true.
		this-object:lblCurrentState:Location = new System.Drawing.Point(8, 13).
		this-object:lblCurrentState:Name = "lblCurrentState".
		this-object:lblCurrentState:Size = new System.Drawing.Size(71, 17).
		this-object:lblCurrentState:TabIndex = 28.
		this-object:lblCurrentState:Text = "Current State".
		this-object:lblCurrentState:TextAlign = System.Drawing.ContentAlignment:BottomLeft.
		this-object:lblCurrentState:UseCompatibleTextRendering = true.
		/*  */
		/* lstCurrentState */
		/*  */
		this-object:lstCurrentState:Location = new System.Drawing.Point(8, 32).
		this-object:lstCurrentState:Name = "lstCurrentState".
		this-object:lstCurrentState:Size = new System.Drawing.Size(152, 121).
		this-object:lstCurrentState:TabIndex = 27.
		/*  */
		/* cboPerformAction */
		/*  */
		this-object:cboPerformAction:Location = new System.Drawing.Point(8, 177).
		this-object:cboPerformAction:Name = "cboPerformAction".
		this-object:cboPerformAction:Size = new System.Drawing.Size(152, 21).
		this-object:cboPerformAction:TabIndex = 26.
		/*  */
		/* lblAction */
		/*  */
		this-object:lblAction:AutoSize = true.
		this-object:lblAction:Location = new System.Drawing.Point(8, 158).
		this-object:lblAction:Name = "lblAction".
		this-object:lblAction:Size = new System.Drawing.Size(81, 17).
		this-object:lblAction:TabIndex = 25.
		this-object:lblAction:Text = "UltraGridAction".
		this-object:lblAction:TextAlign = System.Drawing.ContentAlignment:BottomLeft.
		this-object:lblAction:UseCompatibleTextRendering = true.
		/*  */
		/* KeyMappings */
		/*  */
		this-object:KeyMappings:Controls:Add(this-object:cboActionToMap).
		this-object:KeyMappings:Controls:Add(this-object:lblActionToMap).
		this-object:KeyMappings:Controls:Add(this-object:lblRequiredState).
		this-object:KeyMappings:Controls:Add(this-object:lstRequiredState).
		this-object:KeyMappings:Controls:Add(this-object:lblDisallowedState).
		this-object:KeyMappings:Controls:Add(this-object:lstDisallowedState).
		this-object:KeyMappings:Controls:Add(this-object:cboKeys).
		this-object:KeyMappings:Controls:Add(this-object:lblKeys).
		this-object:KeyMappings:Controls:Add(this-object:cmdAddKeyMapping).
		this-object:KeyMappings:Location = new System.Drawing.Point(4, 22).
		this-object:KeyMappings:Name = "KeyMappings".
		this-object:KeyMappings:Size = new System.Drawing.Size(168, 334).
		this-object:KeyMappings:TabIndex = 1.
		this-object:KeyMappings:Text = "KeyMappings".
		this-object:KeyMappings:Visible = false.
		/*  */
		/* cboActionToMap */
		/*  */
		this-object:cboActionToMap:Location = new System.Drawing.Point(8, 72).
		this-object:cboActionToMap:Name = "cboActionToMap".
		this-object:cboActionToMap:Size = new System.Drawing.Size(152, 21).
		this-object:cboActionToMap:TabIndex = 36.
		/*  */
		/* lblActionToMap */
		/*  */
		this-object:lblActionToMap:AutoSize = true.
		this-object:lblActionToMap:Location = new System.Drawing.Point(8, 53).
		this-object:lblActionToMap:Name = "lblActionToMap".
		this-object:lblActionToMap:Size = new System.Drawing.Size(73, 17).
		this-object:lblActionToMap:TabIndex = 35.
		this-object:lblActionToMap:Text = "Action to map".
		this-object:lblActionToMap:TextAlign = System.Drawing.ContentAlignment:BottomLeft.
		this-object:lblActionToMap:UseCompatibleTextRendering = true.
		/*  */
		/* lblRequiredState */
		/*  */
		this-object:lblRequiredState:AutoSize = true.
		this-object:lblRequiredState:Location = new System.Drawing.Point(8, 102).
		this-object:lblRequiredState:Name = "lblRequiredState".
		this-object:lblRequiredState:Size = new System.Drawing.Size(80, 17).
		this-object:lblRequiredState:TabIndex = 35.
		this-object:lblRequiredState:Text = "Required State".
		this-object:lblRequiredState:TextAlign = System.Drawing.ContentAlignment:BottomLeft.
		this-object:lblRequiredState:UseCompatibleTextRendering = true.
		/*  */
		/* lstRequiredState */
		/*  */
		this-object:lstRequiredState:Location = new System.Drawing.Point(8, 121).
		this-object:lstRequiredState:Name = "lstRequiredState".
		this-object:lstRequiredState:SelectionMode = System.Windows.Forms.SelectionMode:MultiExtended.
		this-object:lstRequiredState:Size = new System.Drawing.Size(152, 69).
		this-object:lstRequiredState:TabIndex = 34.
		/*  */
		/* lblDisallowedState */
		/*  */
		this-object:lblDisallowedState:AutoSize = true.
		this-object:lblDisallowedState:Location = new System.Drawing.Point(8, 197).
		this-object:lblDisallowedState:Name = "lblDisallowedState".
		this-object:lblDisallowedState:Size = new System.Drawing.Size(89, 17).
		this-object:lblDisallowedState:TabIndex = 30.
		this-object:lblDisallowedState:Text = "Disallowed State".
		this-object:lblDisallowedState:TextAlign = System.Drawing.ContentAlignment:BottomLeft.
		this-object:lblDisallowedState:UseCompatibleTextRendering = true.
		/*  */
		/* lstDisallowedState */
		/*  */
		this-object:lstDisallowedState:Location = new System.Drawing.Point(8, 216).
		this-object:lstDisallowedState:Name = "lstDisallowedState".
		this-object:lstDisallowedState:SelectionMode = System.Windows.Forms.SelectionMode:MultiExtended.
		this-object:lstDisallowedState:Size = new System.Drawing.Size(152, 69).
		this-object:lstDisallowedState:TabIndex = 29.
		/*  */
		/* cboKeys */
		/*  */
		this-object:cboKeys:Location = new System.Drawing.Point(8, 24).
		this-object:cboKeys:Name = "cboKeys".
		this-object:cboKeys:Size = new System.Drawing.Size(152, 21).
		this-object:cboKeys:TabIndex = 27.
		/*  */
		/* lblKeys */
		/*  */
		this-object:lblKeys:AutoSize = true.
		this-object:lblKeys:Location = new System.Drawing.Point(8, 4).
		this-object:lblKeys:Name = "lblKeys".
		this-object:lblKeys:Size = new System.Drawing.Size(61, 17).
		this-object:lblKeys:TabIndex = 28.
		this-object:lblKeys:Text = "Key to map".
		this-object:lblKeys:TextAlign = System.Drawing.ContentAlignment:BottomLeft.
		this-object:lblKeys:UseCompatibleTextRendering = true.
		/*  */
		/* cmdAddKeyMapping */
		/*  */
		this-object:cmdAddKeyMapping:Location = new System.Drawing.Point(24, 296).
		this-object:cmdAddKeyMapping:Name = "cmdAddKeyMapping".
		this-object:cmdAddKeyMapping:Size = new System.Drawing.Size(120, 24).
		this-object:cmdAddKeyMapping:TabIndex = 0.
		this-object:cmdAddKeyMapping:Text = "Add KeyMapping".
		this-object:cmdAddKeyMapping:UseCompatibleTextRendering = true.
		this-object:cmdAddKeyMapping:Click:subscribe(this-object:cmdAddKeyMapping_Click).
		/*  */
		/* UltraGrid1 */
		/*  */
		this-object:UltraGrid1:Anchor = cast(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Top, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
		this-object:UltraGrid1:Location = new System.Drawing.Point(200, 96).
		this-object:UltraGrid1:Name = "UltraGrid1".
		this-object:UltraGrid1:Size = new System.Drawing.Size(496, 360).
		this-object:UltraGrid1:TabIndex = 25.
		this-object:UltraGrid1:Text = "UltraGrid1".
		this-object:UltraGrid1:InitializeLayout:subscribe(this-object:UltraGrid1_InitializeLayout).
		/*  */
		/* timer1 */
		/*  */
		this-object:timer1:Tick:subscribe(this-object:timer1_Tick).
		/*  */
		/* frmPerformAction */
		/*  */
		this-object:ClientSize = new System.Drawing.Size(696, 461).
		this-object:Controls:Add(this-object:UltraGrid1).
		this-object:Controls:Add(this-object:Panel2).
		this-object:Controls:Add(this-object:Panel1).
		this-object:Name = "frmPerformAction".
		this-object:Text = "frmPerformAction".
		this-object:Load:subscribe(this-object:frmPerformAction_Load).
		this-object:FormClosing:subscribe(this-object:frmPerformAction_FormClosing).
		this-object:Panel1:ResumeLayout(false).
		this-object:Panel2:ResumeLayout(false).
		this-object:TabControl1:ResumeLayout(false).
		this-object:PerformAction:ResumeLayout(false).
		this-object:PerformAction:PerformLayout().
		this-object:KeyMappings:ResumeLayout(false).
		this-object:KeyMappings:PerformLayout().
		cast(this-object:UltraGrid1, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ResumeLayout(false).

	end method.




    /* populate cboPerformAction and cboActionToMap */
    method private void PopulateActionCombos():
	    define variable enumValues as System.Array no-undo.
        define variable enumNames as char extent no-undo.
	    define variable i as integer no-undo.
	    define variable type as System.Type no-undo.
        
	    cboPerformAction:Items:Clear().
        cboActionToMap:Items:Clear().
        
        type = Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinGrid.UltraGridAction").
       
        enumValues = System.Enum:GetValues(type).
        enumNames = System.Enum:GetNames(type).
       
        do i = 1 to extent(enumNames):                                                                                                       
            cboPerformAction:Items:Add(enumNames[i]).	
            cboActionToMap:Items:Add(enumNames[i]).	
        end.
        
        cboPerformAction:Tag = enumValues.
        cboPerformAction:SelectedIndex = 0.
	    
        cboActionToMap:Tag = enumValues.
        cboActionToMap:SelectedIndex = 0.
	end method.
	
	method private void PopulateRequiredAndDisallowedStateListbox():
	    define variable enumValues as System.Array no-undo.
        define variable i as integer no-undo.
	    define variable type as System.Type no-undo.
        
	    lstRequiredState:Items:Clear().
        lstDisallowedState:Items:Clear().
        
        type = Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinGrid.UltraGridState").
       
        enumValues = System.Enum:GetValues(type).
         
        do i = 1 to enumValues:Length:                                                                                                       
            lstDisallowedState:Items:Add(enumValues:GetValue(i - 1)).	
            lstRequiredState:Items:Add(enumValues:GetValue(i - 1)).	
        end.
        
        lstDisallowedState:Tag = enumValues.	    
        lstRequiredState:Tag = enumValues.
	end method.
	
	method private void PopulateKeysCombo():
        define variable enumValues as System.Array no-undo.
        define variable enumNames as char extent no-undo.
	    define variable i as integer no-undo.
	    define variable type as System.Type no-undo.
        
        cboKeys:Items:Clear().
       
        type = Progress.Util.TypeHelper:GetType("System.Windows.Forms.Keys").
       
        enumValues = System.Enum:GetValues(type).
        /* TODO fix to use direct conversion from extent to array when supported.. */           
        enumNames = System.Enum:GetNames(type).
        
        do i = 1 to extent(enumNames):                                                                                                       
            cboKeys:Items:Add(enumNames[i]).	
        end.

        cboKeys:Tag = enumValues.
        cboKeys:SelectedIndex = 0.
	end method.
	
	/* called from timer tick and Button cmdPerform click */
	method private void PopulateCurrentStateListbox():
	    define variable enumValues as System.Array no-undo.
        define variable enumNames as char extent no-undo.
	    define variable i as integer no-undo.
	    define variable type as System.Type no-undo.
        
        type = Progress.Util.TypeHelper:GetType("Infragistics.Win.UltraWinGrid.UltraGridState").
       
        enumValues = System.Enum:GetValues(type).
        enumNames = System.Enum:GetNames(type).
               
        lstCurrentState:Items:Clear().
        do i = 1 to enumValues:Length:                                                    
            if string(Progress.Util.EnumHelper:And(cast(enumValues:GetValue(i - 1),Infragistics.Win.UltraWinGrid.UltraGridState),
                                               UltraGrid1:CurrentState)) <> "0" then
                lstCurrentState:Items:Add(enumNames[i]).
        end.
    end method.
	
	method protected Infragistics.Win.UltraWinGrid.UltraGridState GetDisallowedStateForKeyMapping():
	    define variable gridState as Infragistics.Win.UltraWinGrid.UltraGridState no-undo.
	    define variable i as integer no-undo.
	    
	    do i = 0 to lstDisallowedState:SelectedItems:Count - 1:
	        if i = 0 then 
	            gridState = cast(lstDisallowedState:SelectedItems[0],Infragistics.Win.UltraWinGrid.UltraGridState).
	        else    
	            gridState = cast(Progress.Util.EnumHelper:Or(gridState,cast(lstDisallowedState:SelectedItems[ i ],Infragistics.Win.UltraWinGrid.UltraGridState)),Infragistics.Win.UltraWinGrid.UltraGridState).
		end.
		return gridState.
	end method.
		
	method protected Infragistics.Win.UltraWinGrid.UltraGridState GetRequiredStateForKeyMapping():
	    define variable gridState as Infragistics.Win.UltraWinGrid.UltraGridState no-undo.
	    define variable i as integer no-undo.
	    do i = 0 to lstRequiredState:SelectedItems:Count - 1:
		    if i = 0 then 
	            gridState = cast(lstRequiredState:SelectedItems[ i ],Infragistics.Win.UltraWinGrid.UltraGridState).
	        else    
	            gridState = cast(Progress.Util.EnumHelper:Or(gridState,cast(lstRequiredState:SelectedItems[ i ],Infragistics.Win.UltraWinGrid.UltraGridState)),Infragistics.Win.UltraWinGrid.UltraGridState).
		end.
        return gridState.
	end method.
    
    method protected Progress.Data.BindingSource GetDeptEmployeeSource():   
        if not valid-object(fDeptEmployeeDataSource) then
        do:
            fDeptEmployeeDataSource = new DataServices.DeptEmployeeService().                  
            fDeptEmployeeDataSource:fetchData().                                                 
        end.
        return new Progress.Data.BindingSource(fDeptEmployeeDataSource:DataSetHandle).
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
	METHOD PRIVATE VOID chkEnableAlphaBlending_CheckedChanged( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		/*	enable/disable alphablending */
		if chkEnableAlphaBlending:Checked then
        do: 
		    /*string strGraphicsPath = clsSamplesPath.GraphicsPath; */
			UltraGrid1:DisplayLayout:Appearance:ImageBackground = System.Drawing.Image:FromFile(SamplesPath:GraphicsPath + "/Backgrounds/nasa_saturn_montage.jpg").
			UltraGrid1:DisplayLayout:Appearance:ImageBackgroundOrigin = Infragistics.Win.ImageBackgroundOrigin:Form.
			UltraGrid1:DisplayLayout:Appearance:ImageBackgroundStyle = Infragistics.Win.ImageBackgroundStyle:Tiled.
            UltraGrid1:AlphaBlendMode = Infragistics.Win.AlphaBlendMode:Optimized.
		end.
		else 
		do:
			UltraGrid1:AlphaBlendMode = Infragistics.Win.AlphaBlendMode:Disabled.
			UltraGrid1:DisplayLayout:Appearance:ImageBackground = ?.
		end.	
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID frmPerformAction_Load( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		/* Hide the grid caption by setting the Text to empty string. */
		UltraGrid1:Text = "".

		UltraGrid1:DataSource = GetDeptEmployeeSource().
		UltraGrid1:AlphaBlendMode = Infragistics.Win.AlphaBlendMode:Disabled.
		PopulateActionCombos().
		PopulateRequiredAndDisallowedStateListbox().
		PopulateKeysCombo().
	
		timer1:Enabled = true.
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD Protected VOID timer1_Tick( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
		PopulateCurrentStateListbox( ).
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cmdAddKeyMapping_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	    define variable formKeys as System.Windows.Forms.Keys no-undo.
		define variable action as Infragistics.Win.UltraWinGrid.UltraGridAction no-undo.
		define variable disallowedState as Infragistics.Win.UltraWinGrid.UltraGridState no-undo.
		define variable requiredState as Infragistics.Win.UltraWinGrid.UltraGridState no-undo.
		define variable keyMapping as Infragistics.Win.UltraWinGrid.GridKeyActionMapping no-undo.
		define variable keyValues as System.Array no-undo.
        define variable actionValues as System.Array no-undo.
        
        keyValues = cast(cboKeys:Tag,System.Array).
        actionValues = cast(cboActionToMap:Tag,System.Array).
        formKeys = cast(keyValues:GetValue(cboKeys:SelectedIndex),System.Windows.Forms.Keys).
        action = cast(actionValues:GetValue(cboActionToMap:SelectedIndex),Infragistics.Win.UltraWinGrid.UltraGridAction).
        disallowedState = GetDisallowedStateForKeyMapping().
 		requiredState = GetRequiredStateForKeyMapping(). 
 		
		/*   Add the custom KeyMapping. The constructor for the GridKeyActionMapping class
		     requires the following parameters:
		
		     keyCode: The key to be mapped
		     actionCode: The UltraGridAction that should be performed when the key specified by keyCode is pressed
		     stateDisallowed: One or more UltraGridStates that the control must NOT be in for the key action to be performed
		     stateDisallowed: One or more UltraGridStates that the control MUST be in for the key action to be performed
		     specialKeysDisallowed: The special keys (Alt, Ctrl, Shift) combination that, if pressed, will also disallow the action
		     specialKeysRequired: The special keys (Alt, Ctrl, Shift) combination that must be pressed to perform the action
		
		     Note that we will not use the 2 special key parameters here for the sake of simplicity
		*/
		keyMapping = new Infragistics.Win.UltraWinGrid.GridKeyActionMapping(formKeys,action,disallowedState,requiredState,?,?).
		UltraGrid1:KeyActionMappings:Add(keyMapping).
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID cmdPerform_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
    	define variable action as Infragistics.Win.UltraWinGrid.UltraGridAction no-undo.
        define variable result as logical no-undo.
        define variable actionValues as System.Array no-undo.
        define variable msg as char no-undo.
        actionValues = cast(cboPerformAction:Tag,System.Array).
		action = cast(actionValues:GetValue(cboPerformAction:SelectedIndex),Infragistics.Win.UltraWinGrid.UltraGridAction).
		result = UltraGrid1:PerformAction(action, chkSimulateShiftKey:Checked, chkSimulateControlKey:Checked).
		if not result then
        do: 
            msg = "PerformAction failed. The control's current state does not permit the specified action.".
            System.Windows.Forms.MessageBox:Show(msg, "PerformAction", System.Windows.Forms.MessageBoxButtons:OK, System.Windows.Forms.MessageBoxIcon:Exclamation).
        end.
		PopulateCurrentStateListbox().
	 
		RETURN.

	END METHOD.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID UltraGrid1_InitializeLayout( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinGrid.InitializeLayoutEventArgs ):
		/*  Hide parent columns */
		e:Layout:Bands[1]:Columns["DeptCode"]:Hidden = true.
		e:Layout:Bands[2]:Columns["EmpNum"]:Hidden = true.
		e:Layout:Override:RowAppearance:BackColorAlpha = Infragistics.Win.Alpha:Transparent.

		/*	use the same appearance for alternate rows and the autopreview area */
		e:Layout:Override:RowAlternateAppearance = e:Layout:Override:RowAppearance.

		/*  Set the RowPreviewAppearance */
		e:Layout:Override:RowPreviewAppearance:AlphaLevel = 192.
		e:Layout:Override:RowPreviewAppearance:BackColorAlpha = Infragistics.Win.Alpha:UseAlphaLevel.
		e:Layout:Override:RowPreviewAppearance:BackColor = System.Drawing.SystemColors:Window.
		e:Layout:Override:RowPreviewAppearance:ForeColor = System.Drawing.SystemColors:WindowText.

		e:Layout:Override:CellAppearance:BackColorAlpha = Infragistics.Win.Alpha:UseAlphaLevel.
		e:Layout:Override:CellAppearance:AlphaLevel = 192.

		e:Layout:Override:HeaderAppearance:AlphaLevel = 192.
		e:Layout:Override:HeaderAppearance:BackColorAlpha = Infragistics.Win.Alpha:UseAlphaLevel.
	
		RETURN.

	END METHOD.
	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID frmPerformAction_FormClosing( INPUT sender AS System.Object, INPUT e AS System.Windows.Forms.FormClosingEventArgs ):
		if valid-object(this-object:Owner) then 
	    do:
	        e:Cancel = true.
		    this-object:Visible = false.
		end.
		RETURN.

	END METHOD.
	
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

 
END CLASS.