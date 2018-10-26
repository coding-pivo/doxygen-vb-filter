VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "VBAClass1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
    ''' <summary>
    ''' VBA class example
    ''' </summary>
    ''' \file VBAClass1.cls
    ''' \remarks The original unfiltered source of this file: <A HREF="https://github.com/sevoku/doxygen-vb-filter/blob/master/test/input/vba/VBAClass1.cls">VBAClass1.cls</A>
    
    ''' External declaration for win32 function
    Private Declare Function GetPrivateProfileStringA Lib "kernel32" ( _
        ByVal strSection As String, _
        ByVal strKey As String, _
        ByVal strDefault As String, _
        ByVal strReturnedString As String, _
        ByVal lngSize As Long, _
        ByVal strFileNameName As String) As Long
        
    ''' External declaration for win32 function
    Private Declare Function SafeArrayGetDim Lib "oleaut32.dll" (ByRef pArray() As Any) As Long
