/*------------------------------------------------------------------------
    File        : runner.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : pjudge
    Created     : Wed Jul 09 13:52:51 EDT 2008
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */



/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
using WinGrid.SamplesExplorer.*.

define variable formMain as frmMain no-undo.

formMain = new frmMain().

wait-for System.Windows.Forms.Application:Run(formMain).

quit.