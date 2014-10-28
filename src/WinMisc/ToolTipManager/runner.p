
/*------------------------------------------------------------------------
    File        : runner.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : mferrant
    Created     : Thu May 15 17:43:24 EDT 2008
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */



/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
using WinMisc.ToolTipManager.frmUltraToolTipsBasicFeatures.

DEFINE VARIABLE form1 AS frmUltraToolTipsBasicFeatures NO-UNDO.

form1 = NEW frmUltraToolTipsBasicFeatures().
form1:show().
WAIT-FOR System.Windows.Forms.Application:Run(form1).
QUIT.