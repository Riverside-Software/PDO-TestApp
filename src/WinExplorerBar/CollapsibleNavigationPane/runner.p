
/*------------------------------------------------------------------------
    File        : runner.p
    Purpose     :

    Syntax      :

    Description : 

    Author(s)   : mferrant
    Created     : Thu May 01 18:31:07 EDT 2008
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */



/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

using WinExplorerBar.CollapsibleNavigationPane.frmMain.

DEFINE VARIABLE mainFrame AS frmMain NO-UNDO.

mainFrame = NEW frmMain().
mainFrame:show().
WAIT-FOR System.Windows.Forms.Application:Run(mainFrame).
DELETE OBJECT mainFrame NO-ERROR.
QUIT.