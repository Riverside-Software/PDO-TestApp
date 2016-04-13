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
using Batching.BatchingForm.

define variable myForm as BatchingForm no-undo.

myForm = new BatchingForm().

wait-for System.Windows.Forms.Application:Run(myForm).

quit.