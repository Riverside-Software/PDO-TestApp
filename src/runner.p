
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
DEFINE VARIABLE mainForm AS SamplesMain NO-UNDO.

mainForm = NEW SamplesMain().
mainForm:show().
WAIT-FOR System.Windows.Forms.Application:Run(mainForm).
DELETE OBJECT mainForm NO-ERROR.
