/*------------------------------------------------------------------------
    File        : runner.p
    Purpose     : 

    Syntax      :

    Description : Runs the BasicMath sample

    Author(s)   : pjudge
    Created     : Thu May 08 10:01:28 EDT 2008
    Notes       :
  ----------------------------------------------------------------------*/
using WinCalcManager.BasicMath.BasicMath.

define variable basicMath as BasicMath no-undo.

basicMath = new BasicMath().

wait-for System.Windows.Forms.Application:Run(basicMath).

/* eof */