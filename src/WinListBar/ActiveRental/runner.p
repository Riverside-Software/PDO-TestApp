/*------------------------------------------------------------------------
    File        : runner.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : 
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */



/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

using WinListBar.ActiveRental.ActiveRental.
DEFINE VARIABLE frmActRent AS CLASS ActiveRental NO-UNDO.

frmActRent = NEW ActiveRental().

frmActRent:show().
WAIT-FOR System.Windows.Forms.Application:Run(frmActRent).
QUIT.

