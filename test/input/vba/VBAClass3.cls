VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "VBAClass3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
    ''' <summary>
    ''' VBA class example
    ''' </summary>
    ''' \file VBAClass3.cls
    ''' \remarks The original unfiltered source of this file: <A HREF="https://github.com/sevoku/doxygen-vb-filter/blob/master/samples/ClassicVB/VBAClass3.cls">VBAClass3.cls</A>
    
    Private Type SampleType1
        typeItem1 As Long
        typeItem2 As Double
    End Type
    
    Private Enum SampleEnum
        [_First] = 0
        enumItem1 = 0
        enumItem2 = 1
        enumItem3 = 2
        [_Last] = 2
    End Enum
