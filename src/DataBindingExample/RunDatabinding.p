/* RunDatabinding.p - This sample demonstrates how to use the ProBindingSource
   with several of the Infragistics Controls and requires the Sports2000 db  */
USING System.Windows.Forms.* FROM ASSEMBLY. 
using DataBindingExample.Databinding.

DEFINE VARIABLE myForm AS CLASS Databinding.
DEFINE VARIABLE pbs AS Progress.Data.BindingSource.
DEFINE VARIABLE realForm AS Progress.Windows.Form. 
DEFINE VARIABLE hdsCust AS HANDLE.

DEFINE TEMP-TABLE ttCustomer LIKE customer.
FOR EACH customer  WHERE customer.custnum < 11:
    CREATE ttCustomer.
    BUFFER-COPY customer TO ttCustomer.
END.

DEFINE TEMP-TABLE ttOrder LIKE order.
FOR EACH order WHERE order.custnum < 11:
    CREATE ttorder.
    BUFFER-COPY order TO ttorder.
END.

DEFINE DATASET dsCust FOR ttCustomer, ttOrder
    DATA-RELATION CustOrd FOR ttCustomer, ttOrder
    RELATION-FIELDS(custnum, custnum).

hdsCust = DATASET dsCust:TOP-NAV-QUERY(1).
hdsCust:QUERY-PREPARE("PRESELECT EACH ttCustomer").
hdsCust:QUERY-OPEN.

pbs = NEW Progress.Data.BindingSource(DATASET dsCust:HANDLE).

myForm = NEW Databinding(pbs).

realForm = myForm:FormObject.
WAIT-FOR Application:Run(realForm).

DELETE OBJECT pbs.
DELETE OBJECT myForm.
