
using Progress.Lang.*.
using DataSources.*.      
using DataServices.*. 
 
class DataServices.CategoryItemService inherits DataService : 
 
 /*------------------------------------------------------------------------
    File        : CategoryItemService
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : hdaniels
    Created     : 
    Notes       : Simulates a category item view/report with random data
                 (no database or datasource)
  ----------------------------------------------------------------------*/
   define temp-table Item no-undo before-table  ItemBefore
        field ItemNum as integer label "Item Num" format "zzzzzzzzz9" initial "0"
        field Category1  as character label "Category 1" format "X(10)"
        field Category2  as character label "Category 2" format "X(10)"
        field Price      as decimal label "Price" format ">>,>>9.99" initial "0" decimals 2
        field Qty        as integer label "Qty" format ">>>9" initial "0"
        field Total      as decimal label "Total" format ">>>,>>9.99" initial "0" decimals 2
       index ItemNum is primary unique 
        Itemnum
        . 
      
    define dataset dsItem for Item.   
    
    define private variable NumRecords as integer no-undo.
     
    constructor CategoryItemService(numRecords as int ):
        super(dataset dsItem:handle). 
        this-object:NumRecords = numRecords.    
    end.     
       
    constructor CategoryItemService():
        this-object(20).     
    end.        
   
    method override public void fetchData():
        if not can-find(first Item) then
            populateData(). 
    end.    
    
    /* populate dataset with random data */
    method private void populateData():
        define variable i as integer no-undo.
        define variable c1 as char  extent 3 no-undo initial ["Custom","Vintage","Modern"].
        define variable c2 as char  extent 2 no-undo initial ["Import","Domestic"].
        
        do i = 1 to this-object:NumRecords:
            create Item.  
            assign 
               ItemNum = i
               Category1 = c1[random(1,3)]
               Category2 = c2[random(1,2)] 
               Price = random(19,399)
               Price = Price + (random(1,99) / 100)
               Qty   = random(1,50)
               Total = price * qty.
        end.
    end.     
                        
end class.
 