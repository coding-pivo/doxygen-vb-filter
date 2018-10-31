VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "B2BOrder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3AE610260388"
Option Base 0
Option Explicit

'This adds the Order class interface to the B2COrder class.
Implements Order

'##ModelId=3AE613CA01ED
Private mB2BCustomer As String

'local superclass object (generated)
'##ModelId=3AE615080335
Private mOrderObject As New Order

'##ModelId=3AE6148F02CD
Public Property Let B2BCustomer(ByVal Value As String)
  mB2BCustomer = Value
End Property

'##ModelId=3AE6148F02EB
Public Property Get B2BCustomer() As String
  B2BCustomer = mB2BCustomer
End Property

'The following properties and function are inherited from the Order class.
'The properties just act as routers for the data to the Order class properties
'which actually hold the value of the data. The Order_SaveOrder function
'holds the save code that is specific to a B2C order. I do this so that
'the client using B2B and B2C Order objects get the same interface for saving
'order data no matter what type of order they are using.

'##ModelId=3AE61509000B
Public Property Get Order_OrderDate() As String
  Order_OrderDate = mOrderObject.OrderDate
End Property

'##ModelId=3AE6150803CB
Public Property Let Order_OrderDate(ByVal Value As String)
  mOrderObject.OrderDate = Value
End Property

'##ModelId=3AE6150803B7
Public Property Get Order_OrderID() As String
  Order_OrderID = mOrderObject.OrderID()
End Property

'##ModelId=3AE61508038F
Public Property Let Order_OrderID(ByVal Value As String)
  mOrderObject.OrderID = Value
End Property

'##ModelId=3AE61508037B
Public Function Order_SaveOrder() As String
  'save B2B order code
  Order_SaveOrder = "B2B Order " & Order_OrderID & " has been saved"
End Function
