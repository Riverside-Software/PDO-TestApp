 
 /*------------------------------------------------------------------------
    File        : LabelManager
    Purpose     : Creates labels on controld with text from the data source's 
                  schema. The data source's meta schema is accessed through
                  the control's databinding and might come from the schema of 
                  the Visual Designer or from the actual data definitions.
                  (See limitations commented in GetColumnLabel method)
    Syntax      : new LabelManager(Form)
                
                 more advanced 
                   mngr = new LabelManager().
                   mngr:<attr> 
                   mngr:ActivateForm(Form)
                  
    Description : The Form's control must be databound before this is called.
                - Instantiate from a Form's load event in the Visual Designer
                  if data binding is done with tools. 
                - If manual databinding ensure the binding is done before this
                  is called. (The data do not need to be fetched) 
                - It is not necessary to keep the manager around after the 
                  labels have been created. 
                - The manager should be kept alive to allow change of label 
                  attributes at runtime.  
                      
    Author(s)   : hdaniels
    Created     : Tue Apr 29 11:19:05 EDT 2008
    Notes       : This is experimental sample code developed to illustrate how 
                  one could merge old ABL behavior with the new Visual Designer 
                  (and possibly get the best of both?). 
                - This could be made into an IExtenderProvider if necessary 
                  as it implements the CanExtend method. 
                - CanExtend needs further refinement to identify the right types
                  of labeled objects.
                - Should also add or change label for check boxes     	
                - RightToLeft is not tested and probably does not work
                  (it should handle this in theory if all attributes are mirrored)            
                - A real implementation might go further:
                    - include all text management for tooltip and help. 
                    - Error status, warnings and mandatory markers or flags and 
                      other status visualization.
                    - The basic approach could be suited for internationalization 
                      support. 
                    - Dynamic's users could implement a label provider that 
                      GetColumnLabel could retrieve the labels from.
                 - A real implementation might be simpler:
                    - One could merge the AddLabel and DrawLabels logic into 
                      one and eliminate the use of a temp-table if one do not
                      need to change label attributes at runtime.    
    Next version : This could have parameters to control which field 
                   it applies to similar to other many native Progress methods 
                   and the pro binding source
                   constructor:
                   Constructor with (Form, columnnames)
                   Constructor with (Form, columnnames, exceptionnames) 
                   Constructor with (columnnames)
                   Constructor with (columnnames, exceptionnames) 
       - Keep in mind that you get labels from the datasource schema 
         for free with the UltraGrid AND that the UltraGrid are able to 
         present data in "viewer" form.                                    
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using System.ComponentModel.IExtenderProvider.
using System.Collections.ArrayList.
using System.Collections.IEnumerator.
using System.ComponentModel.ITypedList.
using System.ComponentModel.PropertyDescriptorCollection.
using System.Windows.Forms.Form.
using System.Windows.Forms.Binding.
using System.Windows.Forms.Control.
using System.Windows.Forms.Control+ControlCollection.
using System.Windows.Forms.ControlBindingsCollection.

class LabelManager.LabelManager /*implements System.ComponentModel.IExtenderProvider*/: 
    
    /* Keep track of controls in form that should not have labels -  added by AddNoLabeledControls*/                      
    define private variable fExceptionList as ArrayList no-undo.
    define private variable fForm          as System.Windows.Forms.Form no-undo.
    
    define private temp-table ttLabel no-undo
        field LabelObj    as Progress.Lang.Object
        field ControlObj  as Progress.Lang.Object
        field LabelText   as character
        field LabelWidth  as integer 
        field LabelRightX as integer 
        index Lbl as unique LabelObj
        index Cntrl ControlObj.
            
    constructor LabelManager():
        super(). 
        session:system-alert-boxes = true. 
    end.     
    
    constructor LabelManager(useForm as System.Windows.Forms.Form):        
        this-object(). 
        ActivateForm(useForm). 
    end.  
    
    /* limits the height so that the label is not positioned vertically 
       centered on a large editor 
       (this should/could be calculated from line height of multiline)*/   
	define public property LabelMaxHeight as integer init 23 no-undo 
	get.    
	set(maxHeight as integer):
	    if valid-object(fForm) then 
            undo, throw new Progress.Lang.AppError("Label Max Height must be set before the Label Manager is activated with a Form").
	    LabelMaxHeight = maxHeight.
	end.  
	
	/* limits the size of vetical centering, so that the label is not 
       positioned vertically centered on a large editor */   
	define public property AlignLeft as logical no-undo 
	get.    
	set(align as logical): 
	    this-object:AlignLeft = align. 
	    DrawLabels().
	end.
	
	define public property Font as System.Drawing.Font no-undo 
	get. 
	set(newFont as System.Drawing.Font):
	    define variable lbl   as Infragistics.Win.Misc.UltraLabel no-undo.
	    define variable cntrl as System.Windows.Forms.Control no-undo.
	    this-object:Font = newFont.
	    RecalculateWidth().
	    DrawLabels(). 
    end.
	
	define public property Foreground as System.Drawing.Color no-undo 
	get.
	set(newForeground as System.Drawing.Color):
        for each ttLabel:
            cast(ttLabel.LabelObj,Infragistics.Win.Misc.UltraLabel):Appearance:ForeColor = newForeground.     
        end.
        this-object:Foreground = newForeground.
    end.    
	
	/* Use colon in labels - default true */
	define public property UseColon as logical init true no-undo 
	get.
	set(useColon as logical):
	    this-object:UseColon = useColon.
	    RecalculateWidth().
	    DrawLabels(). 
    end.
	
    /* implementation of iExtenderProvider.    
       Needs further refinement to identify the right types of labeled objects */ 
	method public logical CanExtend( input obj as System.Object ):
		return type-of(obj,System.Windows.Forms.IBindableComponent).
    end method.
     
    /* Activate from after controls have been added and attributes are set when 
       LabelManager is initiated with empty constructor */
    method public void ActivateForm(mform as Form):
        if valid-object(fForm) then 
            undo, throw new Progress.Lang.AppError("Label Manager is already activated ").
        fForm = mform. 
        if valid-object(mform:Controls) then
        do:          
            ActivateControls(mform:Controls).              
            DrawLabels(). 
        end.           
    end method.    
    
    /* Loops through all controls and creates label if CanExtend and not in 
       exception list */ 
    method protected void ActivateControls (controls as Control+ControlCollection):
        define variable oNumerator as class IEnumerator no-undo.
        define variable oCntrl     as class Control no-undo.
          
        oNumerator = controls:GetEnumerator().
        do while oNumerator:MoveNext():
            oCntrl = cast(oNumerator:current,Control).
            if CanExtend(oCntrl) 
            and (not valid-object(fExceptionList) or not fExceptionList:contains(oCntrl)) then
               AddLabel(oCntrl).
             /* Activate children if any */    
            if valid-object(oCntrl:Controls) then
                ActivateControls(oCntrl:Controls).     
        end.    
    end method.  
    
    /* Add control to avoid creating or delete the current label */  
    method public void AddNoLabeledControl(cntrl as Control):
        if CanExtend(cntrl) then
        do:
            find ttLabel where ttLabel.ControlObj = cntrl no-error.            
            if avail ttLabel then
            do:
                cast(ttLabel.labelObj,System.Windows.Forms.Control):dispose(). 
                delete ttLabel.          
                DrawLabels().   
            end.    
            else do:   
                if not valid-object(fExceptionList) then
                    fExceptionList = new ArrayList().
                fExceptionList:add(cntrl).
            end. 
        end.                 
    end method.    
    
    /* Add a labeled control after the Form is intitiated */
    method public Infragistics.Win.Misc.UltraLabel AddLabeledControl(cntrl as Control):
        define variable labelObj as Infragistics.Win.Misc.UltraLabel no-undo.
        if CanExtend(cntrl) then
        do:
            find ttLabel where ttLabel.ControlObj = cntrl no-error.
            if avail ttLabel then
                return ?.
                           
            if valid-object(fExceptionList) and fExceptionList:contains(cntrl) then
                fExceptionList:remove(cntrl).
            labelObj = AddLabel(cntrl).   
            DrawLabels(). 
            return labelObj.           
        end.           
    end method.   
  
    /* Get the managed label for a control  */
    method public Infragistics.Win.Misc.UltraLabel GetLabel(cntrl as Control):
        find ttLabel where ttLabel.ControlObj = cntrl no-error.            
        if avail ttLabel then 
            return cast(ttLabel.LabelObj,Infragistics.Win.Misc.UltraLabel).
        return ?.  
    end method.
    
  
    /* Add the label to managed labels, read label from source and calculate 
       width  (the width calculation is duplicated in RecalculateWidth)  */
    method protected Infragistics.Win.Misc.UltraLabel AddLabel(cntrl as Control):
        define variable columnName    as character no-undo.
        define variable columnLabel   as character no-undo.
        define variable bindings      as ControlBindingsCollection no-undo.
        define variable binding       as Binding no-undo.
        define variable bindingSource as System.ComponentModel.ITypedList no-undo.
        define variable graphics      as System.Drawing.Graphics no-undo.
        define variable sizef         as System.Drawing.SizeF    no-undo.
        define variable ultraLabel           as Infragistics.Win.Misc.UltraLabel no-undo.
        define variable labeltxt      as char no-undo.
        assign 
            bindings = cntrl:DataBindings
		    binding = bindings:item["Text"]. 
		 /*   binding = bindings:item["Checked"].*/ 
		    
        if valid-object(binding) then
		do:  
		    create ttLabel. 
            assign 
		        bindingSource       = cast(binding:DataSource,System.ComponentModel.ITypedList)  
		        columnName          = binding:BindingMemberInfo:BindingMember    
		        ultraLabel                 = new Infragistics.Win.Misc.UltraLabel() 
		        ttLabel.LabelObj    = ultraLabel       
		        graphics            = cast(ttLabel.LabelObj,Infragistics.Win.Misc.UltraLabel):CreateGraphics()                
                ttLabel.ControlObj  = cntrl
                ttLabel.LabelText   = GetColumnLabel(columnName,bindingSource) 
                /* use the actual label to avoid Null error in MeasureString 
		           when this-object:font is ? */ 
		        ultraLabel:Font = this-object:Font 
		        labeltxt = ttLabel.LabelText + (if UseColon then ":" else "")  
		        /* round up to avoid truncate when going from float to int */  
		        ttLabel.LabelWidth  = int(graphics:MeasureString(labeltxt,ultraLabel:Font):width + 0.5)
		        ttLabel.LabelRightX = cntrl:Location:X.
		end.           
		return ultraLabel.
    end method.
    
    /* Add the labels to the controls parent if necessary and draw them 
       on the left side of the control according to settings like AlignLeft, 
       UseColon, Font  */
    method public void DrawLabels():
        define variable sideLabel as Infragistics.Win.Misc.UltraLabel no-undo.
        define variable cntrl     as System.Windows.Forms.Control no-undo.
        define variable lblWidth  as integer no-undo.            
        
        /* sort on right position and width in order to have the largest 
           width applied to all controls with same right X  */
        for each ttLabel break by LabelRightX by LabelWidth descending:
            assign 
                sideLabel = cast(ttLabel.LabelObj,Infragistics.Win.Misc.UltraLabel)
                cntrl     = cast(ttLabel.ControlObj,System.Windows.Forms.Control).             
            
            /* break by maybe a bit heavy handed, but it saves a LOT of code 
               (try this with collections) */
            if first-of(LabelRightX) then
                lblWidth = ttLabel.LabelWidth.
            
            /* if not drawn add label to parent of the control  */
            if sideLabel:parent = ? then
                cntrl:parent:controls:add(sideLabel).
                        
            assign 
                sideLabel:Text      = ttLabel.LabelText + (if UseColon then ":" else "")
                sideLabel:Font      = this-object:Font 
                sidelabel:ForeColor = this-object:Foreground
                sideLabel:Appearance:TextVAlignAsString = "Middle"
                sideLabel:Appearance:TextHAlignAsString =  (if AlignLeft then "Left" else "Right")
                sideLabel:Width     = lblWidth
                sideLabel:Height    = min(cntrl:Height,LabelMaxHeight)
                sideLabel:Location  = new System.Drawing.Point(cntrl:Location:x - sideLabel:Width,
		                                                       cntrl:Location:y).
	 
		end. 
    end method.    
    
    /* recalculate width from this-object:font and label:text 
       Note: the width calculation is duplicated in AddLabel */
    method protected void RecalculateWidth():
        define variable sideLabel as Infragistics.Win.Misc.UltraLabel no-undo.
        define variable graphics  as System.Drawing.Graphics no-undo.
        define variable labeltxt  as char no-undo.
         
        for each ttLabel:
            assign 
                sideLabel = cast(ttLabel.LabelObj,Infragistics.Win.Misc.UltraLabel)
                sideLabel:Font = this-object:Font   
		        graphics  = cast(ttLabel.LabelObj,Infragistics.Win.Misc.UltraLabel):CreateGraphics()                
                labeltxt  = ttLabel.LabelText + (if UseColon then ":" else "")  
		        /* round up to avoid truncate when going from float to int */  
		        ttLabel.LabelWidth = int(graphics:MeasureString(labeltxt,sideLabel:Font):width + 0.5).
        end.    
    end method.    
        
    /* Fetch the requested columnLabel from the bindingsource. 
       The logic currently expects each table to be bound to a separate 
       Bindingsource manually or with the Visual Designer. 
       It does not support the case when a bindingsource is linked implicitly 
       to multiple tables. It will traverse the child tables if this is the case,
       but the info/logic to decide the table from the control is not implemented.  */
    method private character GetColumnLabel  (columnName as char, bindingSource as System.ComponentModel.ITypedList).   
        define variable propDesc       as System.ComponentModel.PropertyDescriptor no-undo.
        define variable propCollection as System.ComponentModel.PropertyDescriptorCollection no-undo.
        define variable childTable     as System.ComponentModel.ITypedList no-undo.
        define variable columnLabel    as character no-undo.        
        define variable i              as integer no-undo. 
        
        propCollection = bindingSource:GetItemProperties(?).    
        do i = 0 to propCollection:count - 1 :
            propDesc = propCollection:item[i].
            if propDesc:Name = columnName then 
                return propDesc:DisplayName.
           
            if propdesc:PropertyType:toString() eq "Progress.Data.DataSource" then
            do:
                childTable = cast(propDesc:GetValue(?),System.ComponentModel.ITypedList).  
                columnLabel = GetColumnLabel(columnName,childTable). 
                if columnLabel <> ? then
                    return columnLabel.    
            end.
        end.
        return ?.
    end method.
end class.