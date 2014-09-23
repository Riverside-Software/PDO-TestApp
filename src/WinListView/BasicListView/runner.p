
/*------------------------------------------------------------------------
    File        : run.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : mferrant
    Created     : Sun Apr 27 12:01:02 EDT 2008
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */



/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
using WinListView.BasicListView.*.
 
DEFINE VARIABLE mainFrame AS frmMain NO-UNDO.

mainFrame = NEW frmMain().
mainFrame:show().
WAIT-FOR System.Windows.Forms.Application:Run(mainFrame).
QUIT.