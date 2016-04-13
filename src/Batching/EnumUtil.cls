 
 /*------------------------------------------------------------------------
    File        : EnumUtil
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : Wed Aug 20 01:58:44 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

using System.Windows.Forms.ComboBox. 
using Infragistics.Win.UltraWinEditors.UltraComboEditor.
using Progress.Util.TypeHelper.

class Batching.EnumUtil   : 
    
    
    method public static void LoadEnumCombo(comboBox as ComboBox, enumTypeName as char ):
		define var enumTypes as System.Array no-undo.
		define var type as System.Type no-undo.
		define var i as integer no-undo.
		
		type = Progress.Util.TypeHelper:GetType(enumTypeName). 
		enumTypes = System.Enum:GetValues( type ).
		comboBox:Items:Clear( ).
		comboBox:Items:AddRange(enumTypes).
		/*
		do i = 0 to enumTypes:Length - 1:
		    ultraCombo:Items:Add( enumTypes[i]).
		end.
		*/
	end method.
 
    method public static void LoadEnumCombo(ultraCombo as UltraComboEditor, enumTypeName as char ):
		define var enumTypes as System.Array no-undo.
		define var type as System.Type no-undo.
		define var i as integer no-undo.
		
		type = Progress.Util.TypeHelper:GetType(enumTypeName). 
		enumTypes = System.Enum:GetValues( type ).
        ultraCombo:Items:Clear( ).
		do i = 0 to enumTypes:Length - 1:
		    ultraCombo:Items:Add( enumTypes:GetValue(i)).
		end.
	end method.
    
    method protected static void clearCombo(combo as UltraComboEditor):
        combo:Items:Clear( ).   
    end.    
    
    method protected static void clearCombo(combo as ComboBox):
        combo:Items:Clear( ).
    end.    
    
end class.