def input parameter ipCustNum as int no-undo.
def output parameter opName as char no-undo.

find first customer where customer.custnum = ipcustnum no-lock no-error.
assign opName = customer.name.

