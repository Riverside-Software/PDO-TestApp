  
 /*------------------------------------------------------------------------
    File        : CustomerForm
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Fri May 02 15:23:44 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

using LabelManager.*.
using DataServices.CustomerService.

CLASS LabelManager.CustomerForm INHERITS Form   : 
	
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer.


	define private variable ultraTextEditor1 as Infragistics.Win.UltraWinEditors.UltraTextEditor no-undo.
	define private variable ultraTextEditor2 as Infragistics.Win.UltraWinEditors.UltraTextEditor no-undo.
	define private variable ultraTextEditor3 as Infragistics.Win.UltraWinEditors.UltraTextEditor no-undo.
	define private variable ultraTextEditor4 as Infragistics.Win.UltraWinEditors.UltraTextEditor no-undo.
	define private variable ultraTextEditor5 as Infragistics.Win.UltraWinEditors.UltraTextEditor no-undo.

    define private variable fCustomerBinding as Progress.Data.BindingSource no-undo.		
    define private variable fCustomerSource  as CustomerService no-undo.  
     
	CONSTRUCTOR PUBLIC CustomerForm (  ):
		SUPER().
		InitializeComponent ( ).
        fCustomerSource = new CustomerService().
        fCustomerSource:fetchData().
        BindUI(fCustomerSource:DatasetHandle). 
        new LabelManager(this-object).
        
	END CONSTRUCTOR.

	DESTRUCTOR PUBLIC CustomerForm ( ):
		IF VALID-OBJECT(components) THEN DO:
			CAST(components, System.IDisposable):Dispose().
		END.
	END DESTRUCTOR.

	method private void InitializeComponent ( ):

/* 		NOTE: The following method is generated by the OpenEdge Advanced GUI Visual Designer.

		We strongly suggest that the contents of this method only be modified using the
		Visual Designer to avoid any incompatible modifications.

		Modifying the contents of this method using a code editor will invalidate any support for this file. */

		this-object:ultraTextEditor1 = new Infragistics.Win.UltraWinEditors.UltraTextEditor().
		this-object:ultraTextEditor2 = new Infragistics.Win.UltraWinEditors.UltraTextEditor().
		this-object:ultraTextEditor3 = new Infragistics.Win.UltraWinEditors.UltraTextEditor().
		this-object:ultraTextEditor4 = new Infragistics.Win.UltraWinEditors.UltraTextEditor().
		this-object:ultraTextEditor5 = new Infragistics.Win.UltraWinEditors.UltraTextEditor().
		cast(this-object:ultraTextEditor1, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraTextEditor2, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraTextEditor3, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraTextEditor4, System.ComponentModel.ISupportInitialize):BeginInit().
		cast(this-object:ultraTextEditor5, System.ComponentModel.ISupportInitialize):BeginInit().
		this-object:SuspendLayout().
		/*  */
		/* ultraTextEditor1 */
		/*  */
		this-object:ultraTextEditor1:Location = new System.Drawing.Point(103, 12).
		this-object:ultraTextEditor1:Name = "ultraTextEditor1".
		this-object:ultraTextEditor1:Size = new System.Drawing.Size(85, 21).
		this-object:ultraTextEditor1:TabIndex = 0.
		this-object:ultraTextEditor1:Tag = " ".
		this-object:ultraTextEditor1:Text = " ".
		/*  */
		/* ultraTextEditor2 */
		/*  */
		this-object:ultraTextEditor2:Location = new System.Drawing.Point(103, 39).
		this-object:ultraTextEditor2:Name = "ultraTextEditor2".
		this-object:ultraTextEditor2:Size = new System.Drawing.Size(181, 21).
		this-object:ultraTextEditor2:TabIndex = 1.
		this-object:ultraTextEditor2:Text = "  ".
		/*  */
		/* ultraTextEditor3 */
		/*  */
		this-object:ultraTextEditor3:Location = new System.Drawing.Point(103, 66).
		this-object:ultraTextEditor3:Name = "ultraTextEditor3".
		this-object:ultraTextEditor3:Size = new System.Drawing.Size(181, 21).
		this-object:ultraTextEditor3:TabIndex = 2.
		this-object:ultraTextEditor3:Text = "  ".
		/*  */
		/* ultraTextEditor4 */
		/*  */
		this-object:ultraTextEditor4:Location = new System.Drawing.Point(103, 93).
		this-object:ultraTextEditor4:Name = "ultraTextEditor4".
		this-object:ultraTextEditor4:Size = new System.Drawing.Size(181, 21).
		this-object:ultraTextEditor4:TabIndex = 3.
		this-object:ultraTextEditor4:Text = " ".
		/*  */
		/* ultraTextEditor5 */
		/*  */
		this-object:ultraTextEditor5:Location = new System.Drawing.Point(103, 120).
		this-object:ultraTextEditor5:Name = "ultraTextEditor5".
		this-object:ultraTextEditor5:Size = new System.Drawing.Size(181, 21).
		this-object:ultraTextEditor5:TabIndex = 4.
		this-object:ultraTextEditor5:Text = " ".
		/*  */
		/* CustomerForm */
		/*  */
		this-object:ClientSize = new System.Drawing.Size(312, 168).
		this-object:Controls:Add(this-object:ultraTextEditor5).
		this-object:Controls:Add(this-object:ultraTextEditor4).
		this-object:Controls:Add(this-object:ultraTextEditor3).
		this-object:Controls:Add(this-object:ultraTextEditor2).
		this-object:Controls:Add(this-object:ultraTextEditor1).
		this-object:Name = "CustomerForm".
		this-object:Text = "Customer".
		cast(this-object:ultraTextEditor1, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraTextEditor2, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraTextEditor3, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraTextEditor4, System.ComponentModel.ISupportInitialize):EndInit().
		cast(this-object:ultraTextEditor5, System.ComponentModel.ISupportInitialize):EndInit().
		this-object:ResumeLayout(false).
		this-object:PerformLayout().
	end method.

    method private void BindUI(datasetHandle as Handle): 
        fCustomerBinding = new Progress.Data.BindingSource().     
        fCustomerBinding:Handle = datasetHandle.
        ultraTextEditor1:DataBindings:Add(new System.Windows.Forms.Binding("Text", fCustomerBinding, "CustNum", true)).
        ultraTextEditor2:DataBindings:Add(new System.Windows.Forms.Binding("Text", fCustomerBinding, "Name", true)).
        ultraTextEditor3:DataBindings:Add(new System.Windows.Forms.Binding("Text", fCustomerBinding, "Address", true)).
        ultraTextEditor4:DataBindings:Add(new System.Windows.Forms.Binding("Text", fCustomerBinding, "Address2", true)).
        ultraTextEditor5:DataBindings:Add(new System.Windows.Forms.Binding("Text", fCustomerBinding, "City", true)).
    end. 
 
END CLASS.