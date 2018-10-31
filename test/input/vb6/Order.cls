VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Order"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3AE6101C0347"
Option Base 0
Option Explicit

'Note that the Order Class has its Instancing property set to
'PublicNotCreatable so that it can be created withing
'OrderDll, but not outside from client applications.

'This order class has two properties and one function that are shared by both
'B2B orders and B2C orders. The two properties actually hold the data for both types of orders,
'but the function SaveOrder just acts as an interface definition. The actual code for SaveOrder
'is written in the B2B and B2C Order classes, because the code for each is
'specific to its type of order. But I added the interface for SaveOrder in the
'Order class because both B2B and B2C orders save orders, they just do it different ways.

'##ModelId=3AE613B002F4
Private mOrderID As String

'##ModelId=3AE613B20243
Private mOrderDate As String

'##ModelId=3AE613BF02BA
Public Function SaveOrder() As String
End Function

'##ModelId=3AE614900116
Public Property Let OrderID(ByVal Value As String)
  mOrderID = Value
End Property

'##ModelId=3AE61490012A
Public Property Get OrderID() As String
  OrderID = mOrderID
End Property

'##ModelId=3AE614900152
Public Property Let OrderDate(ByVal Value As String)
  mOrderDate = Value
End Property

'##ModelId=3AE614900166
Public Property Get OrderDate() As String
  OrderDate = mOrderDate
End Property
