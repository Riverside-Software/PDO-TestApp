
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
USING WinMisc.ShowToolTip.frmShowToolTip.

DEFINE VARIABLE form1 AS frmShowToolTip NO-UNDO.

form1 = NEW frmShowToolTip().
form1:show().
WAIT-FOR System.Windows.Forms.Application:Run(form1).
QUIT.