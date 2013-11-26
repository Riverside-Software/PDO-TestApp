
/*------------------------------------------------------------------------
    File        : runner.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : mferrant
    Created     : Wed May 21 12:15:52 EDT 2008
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */



/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
USING WinEditors.UltraTrackBar.*.

DEFINE VARIABLE ultraTrackBarForm AS WinEditors.UltraTrackBar.UltraTrackBarForm NO-UNDO.

System.Windows.Forms.Application:EnableVisualStyles().
System.Windows.Forms.Application:SetCompatibleTextRenderingDefault(FALSE).
ultraTrackBarForm = NEW WinEditors.UltraTrackBar.UltraTrackBarForm().

WAIT-FOR System.Windows.Forms.Application:Run(ultraTrackBarForm).
DELETE OBJECT ultraTrackBarForm NO-ERROR.
QUIT.