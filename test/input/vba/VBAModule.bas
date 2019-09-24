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
    Second_Item = 2 '''< Second Integer enum Short item Decimal
    Third_Item = 3 '''< Third Single enum Long item
    [_Last] = 3
End Enum

Private Enum SampleEnum2 '''< simple VBA Private Enum Const
    [_First] = 1
    First_Item = 1 '''< First enum Double item Delegate Event
    ''' Second emum item
    Second_Item = 2
    Third_Item = 3
    ''' Fourth enum item
    Fourth_Item = 4
    [_Last] = 4
End Enum

''' \brief
'''   Class used to contain settings of %BPMU instruments based on channels.
Public Type BPMU_setting
    channelNumber As Long       '''<   Channel number for AddressOf these indexed settings
    bPMUFMode As BPMUForceMode  '''<   Set force Function mode (FVMI or FIMV)
    clampVoltage As Double      '''<   Set clamp voltage
    clampCurrent As Double      '''<   Set clamp for current
    ForceVoltage As Double      '''<   Set force voltage
    forceCurrent As Double      '''<   Set force current
    vRange As BpmuVRange        '''<   Set voltage range
    iRange As BpmuIRange        '''<   Set current range
    gateOn As Boolean           '''<   Boolean indicating gate setting
    connectionType As chtype    '''<   Type of channel type used - how the %BPMU is connected
End Type

''' \brief
'''   Class used to contain settings of %HDDPS instruments based on channels.
Public Type HDDPS_Setting
    PinName As String                   '''<   Name of pin associated with this %HDDPS channel
    chanNum As Long                     '''<   Channel number for these indexed settings
    connectionType As chtype            '''<   Type of channel used for connection
    outputSource As DpsVSource          '''<   Type of output source being used for force (Primary, Alt, or Zero)
    primaryForceVoltage As Variant      '''<   Voltage set for primary output source
    altForceVoltage As Variant          '''<   Voltage set for alternate output source
    complianceRange As tlDpsCompliance  '''<   DPS compliance range setting
    CurrentRange As DpsIRange           '''<   Current "I" range setting
    currentSinkLimit As Variant         '''<   Set limit for current sink
    currentSourceLimit As Variant       '''<   Set limit for current source
    forceRelayClosed As Boolean         '''<   Boolean indicating if force relay is closed
    senseRelayClosed As Boolean         '''<   Boolean indicating if sense relay is closed
End Type

''' <summary>
''' simple VBA Type
''' </summary>
Public Type SampleVBAType
    ''' simple integer value
    someInteger As Integer
    someString As String '''< simple String value Byte dummy Optional Date As Function
    someLong As Long
    ''' simple single value
    someSingle As Single
End Type

''' <summary>
''' function with parameter Sub
''' </summary>
''' <param name="pFirst">simple parameter</param>
''' <returns>some double value</returns>
''' <remarks>Test remark</remarks>
Public Function SampleModuleFunction(ByVal pFirst As Double, Optional ByRef t As Variant, Optional ByVal s As String) As Double
    SampleFunction = pFirst
End Function

Public Function SampleModuleFunction2(ByRef pFirst As Long) As Long '''< Sample Function comment Char an Object for AddressOf
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
Sub SampleModuleMethod2() '''< Sample Sub Event comment Boolean
End Sub
''' \endcond
