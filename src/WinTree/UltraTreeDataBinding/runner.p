
/*------------------------------------------------------------------------
    File        : runner.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : mferrant
    Created     : Wed May 21 12:15:52 EDT 2008
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */



/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
using WinTree.UltraTreeDataBinding.ultraTreeDatabindingForm.

DEFINE VARIABLE ultraTreeDatabindingForm AS UltraTreeDatabindingForm NO-UNDO.

ultraTreeDatabindingForm = NEW UltraTreeDatabindingForm().
ultraTreeDatabindingForm:show().
WAIT-FOR System.Windows.Forms.Application:Run(ultraTreeDatabindingForm).
QUIT.