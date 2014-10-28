/* 
ABL example derived from Infragistics source, copyright ©1992-2008 Infragistics, 
Inc., Windsor Corporate Park, 50 Millstone Road, Building 200 Suite 150, East 
Windsor, NJ 08520. All rights reserved.
*/
/*------------------------------------------------------------------------
    File        : ISamplesBase
    Purpose     : 
    Syntax      : 
    Description : copied from infragistics samples
    Author(s)   : 
    Created     : Wed May 14 11:32:26 EDT 2008
    Notes       : This interface needs to be implemented by every sample that
                  is to be launched from the samples explorer.
  ----------------------------------------------------------------------*/
 
using Progress.Lang.*.

interface WinGrid.SamplesExplorer.ISamplesBase:  
	/* Provides a description for the sample. */
	define public property Description as character no-undo get.
	
    /* Name of the sample. */
	define public property SampleName as character  no-undo get.
	
    /* Type of sample. */
	define public property SampleType as character  no-undo get.

	/* Preview Picture for Sample */
	define public property PreviewPicture as System.Drawing.Image  no-undo get. 
	
	/* Hides the sample. */
	method public void HideMe().

	/* Shows the sample.  */
	method public void ShowMe(owner as System.Windows.Forms.Form).
	 
end interface.