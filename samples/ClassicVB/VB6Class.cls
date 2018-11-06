VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "VB6Class"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Option Base 0
'\class VB6Class
'\brief A brief class description
'\details A detailed description of this class



    '\brief External function to write ini files
    Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" ( _
        ByVal strSection As String, _
        ByVal strKey As String, _
        ByVal strString As String, _
        ByVal strFileNameName As String) As Long
    
    
    
    '\brief Enum definition example
    Private Enum SampleClassEnum
        [_First] = 0
        enumItem1 = 0 'First enum item
        enumItem2 = 1 'Second enum item
        enumItem3 = 2 'Third enum item
        [_Last] = 2
    End Enum
    
    
    
    '\brief Type definition example
    Private Type SampleClassType
        typeItem1 As Long
        typeItem2 As Double
    End Type
    
    
    
    Private someInteger As Integer ' Simple private integer value
    Public someString As String    ' Simple public string value
    Private someObject As Object   ' Some private object
    
    
    
    '\brief
    '    Simple property
    '
    '\returns
    '    Some string
    Public Property Let StringProperty(value As String)
        someString = value
    End Property
    Public Property Get StringProperty() As String
        StringProperty = someString
    End Property
    
    
    
    '\brief
    '    Read-only property
    '
    '\returns
    '    Some integer value
    Public Property Get IntegerProperty() As Integer
        IntegerProperty = someInteger
    End Property
    
    
    
    '\brief
    '    Reference property
    '
    '\returns
    '    Some object
    Public Property Set ObjectProperty(value As Object)
        Set someObject = value
    End Property
    Public Property Get ObjectProperty() As Object
        ObjectProperty = someObject
    End Property
    
    
    
    '\brief
    '    Not working property
    '
    '\remarks
    '    This property will be seen as read-only by the Doxygen vbfilter
    '    because set does not precede get!
    Public Property Get TestProperty() As Object
        ObjectProperty = someObject
    End Property
    Public Property Set TestProperty(value As Object)
        Set someObject = value
    End Property
    
    
    
    '\brief
    '    Function with parameter
    '
    '\param[in] pFirst
    '    simple parameter
    '
    '\returns
    '    Some double value
    Public Function SampleClassFunction1(ByVal pFirst As Double) As Double
        SampleClassFunction1 = pFirst
    End Function
    
    
    
    '\brief
    '    Function with an array as parameter
    '
    '\param[in] arg1
    '    Simple long parameter
    '\param[in] arg2
    '    String array
    '\returns
    '    A long value
    Public Function SampleClassFunction2(ByVal arg1 As Long, ByRef arg2() As String) As Long
        SampleClassFunction2 = arg1
    End Function
    
    
    
    '\brief
    '    Function with an array as result
    '
    '\param[in] arg1
    '    A simple long parameter
    '
    '\returns
    '    Long array
    Public Function SampleClassFunction3(arg1 As Long) As Long()
        Dim i(1) As Long
        SampleClassFunction3 = i
    End Function
    
    
    
    '\brief A simple method
    Sub SampleClassMethod()
    End Sub
    
    '\brief
    '    A simple method with parameters
    '
    '\param[in] pFirst
    '    Simple parameter
    '\param[in] pPointer
    '    Pointer
    '
    '\remarks
    '    Some remarks for this simple method
    Public Sub SampleClassMethodWithParams(ByVal pFirst As String, ByRef pPointer As Integer)
    End Sub
    
    
    
    '\brief Simple constructor
    Private Sub Class_Initialize()
    End Sub
    
    
    
    '\brief
    '    Some event
    '\details
    '    Details about this famous event
    '
    '\param[in] Sender
    '    Sender of object type
    '
    '\remarks
    '    Some remarks for this event
    Public Event OnSomeEvent(ByVal Sender As Object)
    
    
    
    '\brief Destruction event
    Event Destroy()
    
    
    
    '\brief Simple destructor
    '\remarks Raises Destroy event
    Private Sub Class_Terminate()
        RaiseEvent Destroy
    End Sub
