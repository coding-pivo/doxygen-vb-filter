VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "B2COrder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3AE61031018F"
Option Base 0
Option Explicit

'This adds the Order class interface to the B2COrder class.
Implements Order

'##ModelId=3AE613E003A8
Private mB2CCustomer As String

'local superclass object (generated)
'##ModelId=3AE61509014C
Private mOrderObject As New Order

'the B2CCustomer property is a property that could be specific to a B2C Order (this is all hypathetical)
'so it is only defined in the B2COrder sub class and not in the Order super class
'##ModelId=3AE6148F03E5
Public Property Let B2CCustomer(ByVal Value As String)
  mB2CCustomer = Value
End Property

'##ModelId=3AE614900011
Public Property Get B2CCustomer() As String
  B2CCustomer = mB2CCustomer
End Property

'The following properties and function are inherited from the Order class.
'The properties just act as routers for the data to the Order class properties
'which actually hold the value of the data. The Order_SaveOrder function
'holds the save code that is specific to a B2C order. I do this so that
'the client using B2B and B2C Order objects get the same interface for saving
'order data no matter what type of order they are using.

'##ModelId=3AE6150901F6
Public Property Get Order_OrderDate() As String
  Order_OrderDate = mOrderObject.OrderDate()
End Property

'##ModelId=3AE6150901D8
Public Property Let Order_OrderDate(ByVal Value As String)
  mOrderObject.OrderDate = Value
End Property

'##ModelId=3AE6150901BA
Public Property Get Order_OrderID() As String
  Order_OrderID = mOrderObject.OrderID()
End Property

'##ModelId=3AE61509019C
Public Property Let Order_OrderID(ByVal Value As String)
  mOrderObject.OrderID = Value
End Property

'##ModelId=3AE615090188
Public Function Order_SaveOrder() As String
  'save B2C order code
  Order_SaveOrder = "B2C Order " & Order_OrderID & " has been saved"
End Function
