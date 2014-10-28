 
 /*------------------------------------------------------------------------
    File        : TreeSortComparer
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : mferrant
    Created     : Wed Jun 04 17:30:53 EDT 2008
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING System.Collections.IComparer.

USING Infragistics.Win.UltraWinTree.*.

USING WinTree.UltraTreeSorting.*.

CLASS WinTree.UltraTreeSorting.TreeSortComparer IMPLEMENTS IComparer: 

    DEFINE PUBLIC PROPERTY SortType AS INTEGER NO-UNDO GET. SET.

    DEFINE PUBLIC STATIC PROPERTY ByText     AS INTEGER NO-UNDO INITIAL 1 GET.
    DEFINE PUBLIC STATIC PROPERTY ByKey      AS INTEGER NO-UNDO INITIAL 2 GET.
    DEFINE PUBLIC STATIC PROPERTY ByCheckBox AS INTEGER NO-UNDO INITIAL 3 GET.

	/*------------------------------------------------------------------------------
			Purpose:  																	  
			Notes:  																	  
	------------------------------------------------------------------------------*/
	CONSTRUCTOR PUBLIC TreeSortComparer (  ):
		SUPER ().
		SortType = 1.
	END CONSTRUCTOR.

	CONSTRUCTOR PUBLIC TreeSortComparer (INPUT initialSortType AS INTEGER):
		SUPER ().
		SortType = initialSortType.
	END CONSTRUCTOR.

	/*------------------------------------------------------------------------------
		Purpose: The Compare function is part of IComparer. It compares two values
		         and indicates their relation.

		         If it return less than 0, it means X < Y
		         If it returns 0, x=y
		         If it returns greater than 0, it means x>y
		Notes:
	------------------------------------------------------------------------------*/
	METHOD PUBLIC INTEGER Compare( INPUT x AS System.Object, INPUT y AS System.Object ):
        DEFINE VARIABLE ReturnValue AS INTEGER NO-UNDO.

        DEFINE VARIABLE TreeNodeX  AS UltraTreeNode NO-UNDO.
        DEFINE VARIABLE TreeNodeY  AS UltraTreeNode NO-UNDO.
        DEFINE VARIABLE nodeXCheck AS INTEGER       NO-UNDO.
        DEFINE VARIABLE nodeYCheck AS INTEGER       NO-UNDO.

		/*X and Y are passed in as Object. We will use these two variables to cast them into UltraTreeNodes.*/
		ASSIGN TreeNodeX = CAST(X,UltraTreeNode)
		       TreeNodeY = CAST(Y,UltraTreeNode).

	    /*Determine what we are sorting by*/
		CASE SortType:
		    /*Sort by CheckBox*/
            WHEN ByCheckBox THEN
            DO:
			    /*ReturnValue = (int)TreeNodeX.CheckedState - (int)TreeNodeY.CheckedState*/
			    ASSIGN nodeXCheck = INTEGER(TreeNodeX:CheckedState)
					   nodeYCheck = INTEGER(TreeNodeY:CheckedState).

				/*if the checked state differs return that comparison*/
				IF nodeXCheck NE nodeYCheck THEN
				    RETURN nodeXCheck - nodeYCheck.

				/*otherwise return the default comparison*/
				RETURN CAST(TreeNodeX,System.IComparable):CompareTo(TreeNodeY).
			END.

			/*Sort by Node Key*/
			WHEN ByKey THEN
                RETURN System.String:COMPARE(TreeNodeX:KEY, TreeNodeY:Key).

            /*Sort by Node Text*/
		    WHEN ByText THEN
			    RETURN System.String:COMPARE(TreeNodeX:Text, TreeNodeY:Text).
        END CASE.

		RETURN ReturnValue.
	END METHOD.
END CLASS.