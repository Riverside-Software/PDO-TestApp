
/*------------------------------------------------------------------------
    File        : runner.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : mferrant
    Created     : Thu Jun 05 10:21:03 EDT 2008
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */



/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE VARIABLE form1 AS WinToolbar.BasicFeatures.Form1 NO-UNDO.

form1 = NEW WinToolbar.BasicFeatures.Form1().
form1:show().
WAIT-FOR System.Windows.Forms.Application:Run(form1).
DELETE OBJECT form1 NO-ERROR.
QUIT.