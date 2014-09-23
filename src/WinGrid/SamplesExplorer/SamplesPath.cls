 
 /*------------------------------------------------------------------------
    File        : SamplesPath
    Purpose     : Static class for path management 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     :  
    Notes       : Avoids hardcoded paths in code. 
                - This static class avoids unnecessary propath searches for the 
                  images as the file-info only is accessed in the static 
                  constructor.   
                - Imagelists and IconManagers might be a better way to resolve
                  similar issues ( some )   
------------------------------------------------------------------------*/
using Progress.Lang.*.
using System.Windows.Forms.Application.
using System.IO.DirectoryInfo.

class WinGrid.SamplesExplorer.SamplesPath:     
    define private static variable GRAPHIC_PATH as character no-undo init "Graphics".
    define private static variable WINGRID_PATH as character no-undo init "WinGrid/SamplesExplorer".
   
    define public static property GraphicsPath as character no-undo
    get.
    private set.

    constructor static SamplesPath():
        GraphicsPath = GetDirectory(GRAPHIC_PATH). 
    end constructor.
        
    method private static character GetDirectory(directory as character):
	    file-info:file-name = WINGRID_PATH + "/" + directory. 
        return file-info:full-pathname.
    end method.
end class.