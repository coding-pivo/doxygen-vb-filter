Attribute VB_Name = "VBAModule"
''' <summary>VBA Module Example</summary>
''' <remarks>The original unfiltered source of this file: <A HREF="http://trac.sevo.org/projects/doxyvb/browser/trunk/samples/ClassicVB/VBAModule.bas">VBAModule.bas</A></remarks>

Public Declare Function GetTickCount Lib "kernel32.dll" () As Long

Public Declare Function WritePrivateProfileStringA Lib "kernel32" ( _
    ByVal strSection As String, _
    ByVal strKey As String, _
    ByVal strString As String, _
    ByVal strFileNameName As String) As Long

''' Global variable example
Public gl_test As Double

''' <summary>
''' simple VBA Public Enum
''' </summary>
Public Enum SampleEnum1
    [_First] = 1
    ''' First enum item
    First_Item = 1
    Second_Item = 2 '''< Second enum item
    Third_Item = 3 '''< Third enum item
    [_Last] = 3
End Enum

Private Enum SampleEnum2 '''< simple VBA Private Enum
    [_First] = 1
    First_Item = 1 '''< First enum item
    ''' Second emum item
    Second_Item = 2
    Third_Item = 3
    ''' Fourth enum item
    Fourth_Item = 4
    [_Last] = 4
End Enum

''' <summary>
''' simple VBA Type
''' </summary>
Public Type SampleVBAType
    ''' simple integer value
    someInteger As Integer
    someString As String '''< simple string value
    someLong As Long
    ''' simple single value
    someSingle As Single
End Type

''' <summary>
''' function with parameter
''' </summary>
''' <param name="pFirst">simple parameter</param>
''' <returns>some double value</returns>
''' <remarks>Test remark</remarks>
Public Function SampleModuleFunction(ByVal pFirst As Double) As Double
    SampleFunction = pFirst
End Function

Public Function SampleModuleFunction2(ByRef pFirst As Long) As Long '''< Sample function comment
    SampleFunction2 = pFirst
End Function

''' \cond DEVELOPMENT
''' <summary>
''' simple method
''' </summary>
''' <remarks>Test remark</remarks>
Sub SampleModuleMethod()

End Sub
''' \endcond

''' \cond DEVELOPMENT
Sub SampleModuleMethod2() '''< Sample sub comment
End Sub
''' \endcond
