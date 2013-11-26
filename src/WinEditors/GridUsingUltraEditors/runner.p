
/*------------------------------------------------------------------------
    File        : runner.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : mferrant
    Created     : Thu May 15 14:17:06 EDT 2008
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */



/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

using WinEditors.GridUsingUltraEditors.Form1.

DEFINE VARIABLE form1 AS Form1 NO-UNDO.

form1 = NEW Form1().
form1:show().
WAIT-FOR System.Windows.Forms.Application:Run(form1).
QUIT.