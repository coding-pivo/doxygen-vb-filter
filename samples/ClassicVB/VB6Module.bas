Attribute VB_Name = "VB6Module"
Option Explicit
Option Base 0
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'\brief
'    A simple VB6 module example
'\details
'    This is a detailed description of the VB6 module
'\version
'    1.0, John Doe (A0123456), 25-Nov-2018
'    - This is simply a change of a change of a change of a change to generate
'      a really long change description with an even longer description of the
'      change of a change just to demonstrate a line break when the change
'      description is really long
'    - Change2
'\version
'    2.0, Jon Doe (A0123456), 26-Nov-2018
'    - Change1
'    - Change2
'\pre
'    Wake up
'\pre
'    Power up your computer
'\post
'    Shutdown your computer
'\bug
'    There is always a bug
'\bug
'    And probably a second one as well
'\warning
'    Improper use can crash your application
'\attention
'    Attention, attention!
'\copyright
'    GNU Public License
'\todo
'    There is one thing to do
'\todo
'    There is a second thing to do
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'\brief
'    External function to read ini files
'\details
'    With this function we can read content of ini files by using
'    section/key pairs
'
'\param strSection
'    The name of the section containing the key name
'\param strKey
'    The name of the key whose associated string is to be retrieved
'\param strDefault
'    A default string. If the strKey key cannot be found in the ini file,
'    GetPrivateProfileString copies the default string to the strReturnedString
'\param strReturnedString
'    The string to be received
'\param lngSize
'    Size of the returned string
'\param strFileNameName
'    name of the ini file
'
'\return
'    A long value
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Declare Function GetPrivateProfileString Lib "kernel32" Alias _
    "GetPrivateProfileStringA" ( _
    ByVal strSection As String, _
    ByVal strKey As String, _
    ByVal strDefault As String, _
    ByVal strReturnedString As String, _
    ByVal lngSize As Long, _
    ByVal strFileNameName As String) As Long



Public gl_test As Boolean 'A global variable to enable/disable test mode



'\brief
'    A global variable to enable/disable logging
'\details
'    With this variable you can enable or disable logging to get useful
'    debug information
Public gl_log As Boolean



'\brief A simple VB6/VBA private enum example
Private Enum SampleEnum
    [_First] = 1
    First_Item = 1 'First enum item
    Second_Item = 2 'Second emum item
    Third_Item = 3
    '\brief Fourth enum item
    '\details These are the details for this enum item
    Fourth_Item = 4
    [_Last] = 4
End Enum



'\brief A simple VB6 structure example
Public Structure SampleVB6Structure
    '\brief Simple private integer value
    Private someInteger As Integer
    ''' Simple public string value
    Public someString As String
    Public someLong As Long ' Simple public long value
End Structure



'\brief
'    A simple VBA/VB6 type declaration
'\details
'    A detailed description of a simple VBA/VB6 type
Public Type SampleVBAType
    ''' A simple integer value
    someInteger As Integer
    someString As String ' A simple string value
    someLong As Long
    '\brief A simple single value
    '\details Some details about this simple single value
    someSingle As Single
End Type



'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'\brief
'    A function with parameters
'\details
'    This function will just return the second given parameter
'
'\param pFirst
'    A simple parameter
'\param aSecond
'    Another simple array parameter
'
'\return
'    A long array
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Function SampleModuleFunction(ByVal pFirst As Double, ByRef aSecond() As Long) As Long()
    SampleModuleFunction = aSecond
End Function



'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'\brief
'    A simple method without parameter
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub SampleModuleMethod()
End Sub
