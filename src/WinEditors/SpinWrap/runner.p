
/*------------------------------------------------------------------------
    File        : runner.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : mferrant
    Created     : Fri May 16 18:21:00 EDT 2008
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */



/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
using WinEditors.SpinWrap.FormSpinWrap.
 
DEFINE VARIABLE formSpinWrap AS FormSpinWrap NO-UNDO.

formSpinWrap = NEW FormSpinWrap().
formSpinWrap:show().
WAIT-FOR System.Windows.Forms.Application:Run(formSpinWrap).
QUIT.