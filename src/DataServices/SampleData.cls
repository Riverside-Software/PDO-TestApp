 
 /*------------------------------------------------------------------------
    File        : SampleData
    Purpose     : Primitive dataset generator.
                  
    Syntax      : new SampleData(numTables, numColumns, datatype, numRecords)
                  
                  numTables - num tables (each table is child of previous)
                  numColumns - number of columns in each table (keys exclusive)
                  datatype  - datatype of fields
                  numRecords - Number of records per node (number of children 
                               per parent for secondary tables)
                               numTables 3 and numrecords 5 will give
                                 5 - 25 - 125 number of records 
                               
    Description : 
    Author(s)   : hdaniels
    Created     :      
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using DataSources.*.      
 
 
class DataServices.SampleData  : 
    define private variable NumColumns as int  no-undo.     
    define private variable NumTables as int  no-undo.     
    define private variable UseFieldName as char no-undo init "Column".     
    define private variable UseTableName as char no-undo init "Table".   
    define private variable DataType  as char no-undo init "character".     
    define private variable NumRecords as int no-undo.     
    
    define public property DatasetHandle as handle no-undo
    get.
    set. 
    
    define public property NextKeyValue as integer no-undo extent 
    get (i as integer):
        NextKeyValue[i] = NextKeyValue[i] + 1.
        return NextKeyValue[i].
    end.    
    set. 
    
    constructor SampleData():
        this-object(2,9,'INTEGER',5).  
    end constructor.        
    
    constructor SampleData(numTables as int, numColumns as int, datatype as char , numRecords  as int):
        this-object:NumColumns = numColumns.
        this-object:NumTables = numTables.
        this-object:DataType = dataType.
        this-object:NumRecords = numRecords.
        extent(NextKeyValue) = numTables.
        createDataset().
    end constructor.   
    
    method private void createTables():
        def var i as integer no-undo.
        define variable tableHandle as handle no-undo.       
        do i = 1 to NumTables:
            if i = 1 then
                addTable(UseTableName + String(i)).
            else    
                addChildTable(UseTableName + String(i),UseTableName + String(i -  1)).
        end.    
    end.    
    
    method private void addChildTable(tableName as char,parentName as char):
        define variable tableHandle as handle no-undo.
        tableHandle = CreateTable(tableName + "Key").
        tableHandle:add-new-field(parentName + "Key","integer",0,?,0,"ParentKey" ).
        
        PrepareTable(tableHandle,tableName).
        addRelation(parentName,tableName).   
    end. 
    
    method private handle CreateTable(keyField as char):
        define variable tableHandle as handle no-undo.
        create temp-table tableHandle.
        tableHandle:add-new-field(keyField,"integer",0,?,0,"Key" ).
        createFields(tableHandle).
        tableHandle:add-new-index("idx",true,true).
        tableHandle:add-index-field("idx",keyField).                      
        return tableHandle.
    end.
    
    method private void PrepareTable(tableHandle as handle, tableName as char): 
        tableHandle:temp-table-prepare(tableName).
        DatasetHandle:add-buffer(tableHandle:default-buffer-handle).  
    end method.
    
    
    method private void AddTable(tableName as char):
        define variable tableHandle as handle no-undo.
        tableHandle = CreateTable(tableName + "Key").
        PrepareTable(tableHandle,tableName).
    end. 
    
    method private void AddRelation(tableName1 as char, tablename2 as char):
        define variable fieldPairs as char no-undo.
        fieldPairs = DatasetHandle:get-buffer-handle(tableName1):keys.
        fieldPairs = fieldPairs + "," + fieldPairs.
        DatasetHandle:add-relation(DatasetHandle:get-buffer-handle(tableName1),DatasetHandle:get-buffer-handle(tableName2),fieldPairs).           
    end. 
    
    method private void createDataset():
        create dataset DatasetHandle.   
        createTables().
    end.    
    
    method private void createFields(tableHdl as handle):
        def var i as integer no-undo.      
        do i = 1 to NumColumns:
            tableHdl:add-new-field(UseFieldName + string(i),DataType,0,?,?, UseFieldName + " " + string(i) ).
       end.  
    end.    
      
    method public void fetchData():      
        populateBuffer(1).
    end method.
    
    method private void populateBuffer(tableNum as int):
         populateBuffer(tableNum,?,?).
    end.
    
    method private void populateBuffer(tableNum as int,parentKey as char,parentValue as int):
        def var ifield as integer no-undo.
        def var iRow   as integer no-undo.
        def var iChild as integer no-undo.
        def var fieldHandle as handle no-undo.
        def var bufferHandle as handle no-undo.
        def var keyValue     as integer no-undo.
        bufferHandle = DatasetHandle:get-buffer-handle(tableNum).
        if valid-handle(bufferHandle) then
        do iRow = 1 to NumRecords: 
            bufferHandle:buffer-create().
            
            do iField = 1 to bufferHandle:num-fields:
                fieldHandle = bufferHandle:buffer-field(iField).
                if fieldHandle:name = parentKey then 
                    fieldHandle:buffer-value = parentValue. 
                else if fieldHandle:name = bufferHandle:keys then
                do:
                    keyValue = NextKeyValue[tableNum].
                    fieldHandle:buffer-value = keyValue.
                end.    
                else      
                    fieldHandle:buffer-value = random(1,NumRecords).
            end.
            populateBuffer(tableNum + 1,bufferHandle:keys,keyvalue).              
        end.  
        
    end method.
                        
end class.
 