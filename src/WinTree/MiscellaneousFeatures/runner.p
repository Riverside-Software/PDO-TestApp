
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

USING WinTree.MiscellaneousFeatures.frmMain .
 
DEFINE VARIABLE form1 AS frmMain NO-UNDO.

form1 = NEW frmMain().
form1:show().
WAIT-FOR System.Windows.Forms.Application:Run(form1).
QUIT.