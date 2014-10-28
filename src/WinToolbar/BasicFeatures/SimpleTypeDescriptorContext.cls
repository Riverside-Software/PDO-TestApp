 
 /*------------------------------------------------------------------------
    File        : SimpleTypeDescriptorContext
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Tue Jun 10 11:43:32 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING System.ComponentModel.ITypeDescriptorContext.

USING WinToolbar.BasicFeatures.*.

CLASS WinToolbar.BasicFeatures.SimpleTypeDescriptorContext IMPLEMENTS ITypeDescriptorContext  : 
	
	DEFINE PUBLIC PROPERTY Instance AS  System.Object 
	GET. PRIVATE SET.
	DEFINE PUBLIC PROPERTY Container AS  System.ComponentModel.IContainer 
	GET: RETURN ?. END GET.
	DEFINE PUBLIC PROPERTY PropertyDescriptor AS  System.ComponentModel.PropertyDescriptor 
	GET: RETURN ?. END GET.

	/*------------------------------------------------------------------------------
			Purpose:
			Notes:
	------------------------------------------------------------------------------*/
	CONSTRUCTOR PUBLIC SimpleTypeDescriptorContext (INPUT newInstance AS System.Object):
		SUPER ().
        Instance = newInstance.
	END CONSTRUCTOR.
	
	METHOD PUBLIC VOID OnComponentChanged(  ):
	END METHOD.

	METHOD PUBLIC LOGICAL OnComponentChanging(  ):
        RETURN FALSE.
	END METHOD.
 
    METHOD PUBLIC System.Object GetService (serviceType AS CLASS System.Type):
    END METHOD.
 
END CLASS.