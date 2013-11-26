 
 /*------------------------------------------------------------------------
    File        : ObjectWrapper
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Wed May 14 16:58:33 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using System.Object.

class WinGrid.SamplesExplorer.ObjectWrapper inherits System.Object   : 
    define public property ProgressObject as Progress.Lang.Object no-undo
    get.
    set.   
    
    constructor ObjectWrapper (obj as Progress.Lang.Object):
        ProgressObject = obj.
    end.  
      
end class.