
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
USING WinExplorerBar.BasicFeatures.BasicProperties.

DEFINE VARIABLE basicProperties AS BasicProperties NO-UNDO.

basicProperties = NEW BasicProperties().
basicProperties:show().
WAIT-FOR System.Windows.Forms.Application:Run (basicProperties).
QUIT.