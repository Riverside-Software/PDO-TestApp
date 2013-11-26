
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

USING WinChart.Composite.DataBind.

define variable dataBind as DataBind no-undo.

dataBind = new DataBind().

wait-for System.Windows.Forms.Application:Run(dataBind).

quit.