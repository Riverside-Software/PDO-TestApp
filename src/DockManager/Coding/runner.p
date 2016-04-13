
/*------------------------------------------------------------------------
    File        : runner.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : mferrant
    Created     : Fri May 16 10:51:20 EDT 2008
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */



/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
USING DockManager.Coding.Form1.
 
DEFINE VARIABLE form1 AS Form1 NO-UNDO.

form1 = NEW Form1().
form1:show().
WAIT-FOR System.Windows.Forms.Application:Run(form1).
DELETE OBJECT form1 NO-ERROR.
QUIT.