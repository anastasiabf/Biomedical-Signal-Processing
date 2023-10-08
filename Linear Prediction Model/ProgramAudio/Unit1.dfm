object Form1: TForm1
  Left = 289
  Top = 115
  Width = 928
  Height = 657
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 24
    Top = 32
    Width = 384
    Height = 23
    Caption = 'Anastasia Berlianna F/07311940000004'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 24
    Top = 8
    Width = 407
    Height = 23
    Caption = 'Mid Exam Biomodelling - Linear Prediction'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PageControl3: TPageControl
    Left = 232
    Top = 72
    Width = 1049
    Height = 185
    ActivePage = TabSheet3
    TabOrder = 9
    object TabSheet6: TTabSheet
      Caption = 'Input Signal'
      ImageIndex = 1
      object Chart1: TChart
        Left = 0
        Top = 0
        Width = 1041
        Height = 154
        Legend.CheckBoxes = True
        Title.Text.Strings = (
          'Sinyal Rekam')
        View3D = False
        TabOrder = 0
        object Series1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Length = 8
          Marks.Visible = False
          SeriesColor = clFuchsia
          Title = 'Input signal'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
        end
        object Series8: TLineSeries
          Marks.ArrowLength = 8
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Length = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Predicted Signal'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
        end
        object Series12: TLineSeries
          Marks.ArrowLength = 8
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Length = 8
          Marks.Visible = False
          SeriesColor = clYellow
          Title = 'Unpredictable Part'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Output/Reconstruction Signal'
      ImageIndex = 1
      object Chart8: TChart
        Left = 0
        Top = 0
        Width = 1033
        Height = 154
        Legend.CheckBoxes = True
        Title.Text.Strings = (
          'Sinyal Rekonstruksi')
        View3D = False
        TabOrder = 0
        object Series13: TLineSeries
          Marks.ArrowLength = 8
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Length = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'output a(k)'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
        end
        object Series14: TLineSeries
          Marks.ArrowLength = 8
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Length = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'output invers filt'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
        end
        object Series16: TLineSeries
          Marks.ArrowLength = 8
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Length = 8
          Marks.Visible = False
          SeriesColor = clYellow
          Title = 'input'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
        end
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 72
    Width = 161
    Height = 201
    Caption = 'Input Signal'
    TabOrder = 0
    object Shape1: TShape
      Left = 120
      Top = 88
      Width = 25
      Height = 33
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 52
      Height = 13
      Caption = 'Buffer Size'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 59
      Height = 13
      Caption = 'Jumlah Data'
    end
    object Label4: TLabel
      Left = 8
      Top = 64
      Width = 60
      Height = 13
      Caption = 'Sample Rate'
    end
    object Edit1: TEdit
      Left = 80
      Top = 16
      Width = 65
      Height = 21
      TabOrder = 0
      Text = '1024'
    end
    object Edit2: TEdit
      Left = 80
      Top = 40
      Width = 65
      Height = 21
      TabOrder = 1
      Text = '40000'
    end
    object Button1: TButton
      Left = 8
      Top = 96
      Width = 105
      Height = 25
      Caption = 'START'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 160
      Width = 105
      Height = 25
      Caption = 'Plot Signal'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Edit4: TEdit
      Left = 80
      Top = 64
      Width = 65
      Height = 21
      TabOrder = 4
      Text = '11025'
    end
    object Button9: TButton
      Left = 8
      Top = 128
      Width = 105
      Height = 25
      Caption = 'Input File'
      TabOrder = 5
      OnClick = Button9Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 288
    Width = 161
    Height = 137
    Caption = 'Auto Correlation Process'
    TabOrder = 1
    object Label12: TLabel
      Left = 8
      Top = 24
      Width = 24
      Height = 13
      Caption = 'Orde'
    end
    object ScrollBar1: TScrollBar
      Left = 8
      Top = 40
      Width = 105
      Height = 17
      PageSize = 0
      TabOrder = 0
      OnChange = ScrollBar1Change
    end
    object Edit3: TEdit
      Left = 120
      Top = 40
      Width = 33
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object Button4: TButton
      Left = 8
      Top = 64
      Width = 145
      Height = 25
      Caption = 'Auto-Correlation rxx'
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button6: TButton
      Left = 8
      Top = 96
      Width = 145
      Height = 25
      Caption = 'Predictor Coefficient'
      TabOrder = 3
      OnClick = Button6Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 24
    Top = 432
    Width = 161
    Height = 201
    Caption = 'Linear Prediction Process'
    TabOrder = 2
    object Label13: TLabel
      Left = 64
      Top = 88
      Width = 42
      Height = 13
      Caption = 'MSE a(k)'
    end
    object Label14: TLabel
      Left = 56
      Top = 128
      Width = 54
      Height = 13
      Caption = 'MSE Invers'
    end
    object Button7: TButton
      Left = 8
      Top = 24
      Width = 145
      Height = 25
      Caption = 'Prediction Error'
      TabOrder = 0
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 8
      Top = 56
      Width = 145
      Height = 25
      Caption = 'Output LPM'
      TabOrder = 1
      OnClick = Button8Click
    end
    object Edit5: TEdit
      Left = 8
      Top = 104
      Width = 145
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object Button10: TButton
      Left = 8
      Top = 168
      Width = 145
      Height = 25
      Caption = 'Spectral Domain'
      TabOrder = 3
      OnClick = Button10Click
    end
    object Edit6: TEdit
      Left = 8
      Top = 144
      Width = 145
      Height = 21
      TabOrder = 4
      Text = '0'
    end
  end
  object StringGrid4: TStringGrid
    Left = 1064
    Top = 288
    Width = 89
    Height = 161
    FixedCols = 0
    FixedRows = 0
    TabOrder = 3
  end
  object PageControl1: TPageControl
    Left = 232
    Top = 264
    Width = 1025
    Height = 225
    ActivePage = TabSheet5
    TabOrder = 4
    object TabSheet1: TTabSheet
      Caption = 'Auto correlation'
      object Chart2: TChart
        Left = 0
        Top = 0
        Width = 1017
        Height = 193
        Legend.Visible = False
        Title.Text.Strings = (
          'Auto Correlation')
        View3D = False
        TabOrder = 0
        object Series2: TLineSeries
          Marks.ArrowLength = 8
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Length = 8
          Marks.Visible = False
          SeriesColor = clFuchsia
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Predictor Coefficient'
      ImageIndex = 1
      object Label5: TLabel
        Left = 40
        Top = 0
        Width = 54
        Height = 16
        Caption = 'Data rxx'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Swis721 Hv BT'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 272
        Top = 0
        Width = 26
        Height = 16
        Caption = 'RXX'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Swis721 Hv BT'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 552
        Top = 0
        Width = 68
        Height = 16
        Caption = 'Rxx Invers'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Swis721 Hv BT'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 760
        Top = 0
        Width = 19
        Height = 16
        Caption = 'rxx'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Swis721 Hv BT'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 856
        Top = 8
        Width = 107
        Height = 14
        Caption = 'a = Rxx invers x rxx'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Swis721 Hv BT'
        Font.Style = []
        ParentFont = False
      end
      object StringGrid1: TStringGrid
        Left = 136
        Top = 24
        Width = 289
        Height = 161
        Ctl3D = False
        DefaultColWidth = 68
        FixedCols = 0
        FixedRows = 0
        ParentCtl3D = False
        TabOrder = 0
        RowHeights = (
          24
          24
          24
          24
          24)
      end
      object ListBox1: TListBox
        Left = 8
        Top = 24
        Width = 121
        Height = 161
        ItemHeight = 13
        TabOrder = 1
      end
      object StringGrid2: TStringGrid
        Left = 440
        Top = 24
        Width = 265
        Height = 161
        FixedCols = 0
        FixedRows = 0
        TabOrder = 2
      end
      object StringGrid3: TStringGrid
        Left = 728
        Top = 24
        Width = 97
        Height = 161
        FixedCols = 0
        FixedRows = 0
        TabOrder = 3
        RowHeights = (
          24
          24
          24
          24
          24)
      end
      object StringGrid5: TStringGrid
        Left = 848
        Top = 24
        Width = 105
        Height = 161
        FixedCols = 0
        FixedRows = 0
        TabOrder = 4
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Inverse Filter'
      ImageIndex = 3
      object Label11: TLabel
        Left = 56
        Top = 8
        Width = 122
        Height = 16
        Caption = 'a invers transpose'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Swis721 Hv BT'
        Font.Style = []
        ParentFont = False
      end
      object StringGrid6: TStringGrid
        Left = 64
        Top = 32
        Width = 113
        Height = 137
        FixedCols = 0
        FixedRows = 0
        TabOrder = 0
      end
      object Chart7: TChart
        Left = 208
        Top = 8
        Width = 345
        Height = 169
        Legend.Visible = False
        Title.Text.Strings = (
          'Comparison a(k) and a invers transpose')
        View3D = False
        TabOrder = 1
        object Series7: TLineSeries
          Marks.ArrowLength = 8
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Length = 8
          Marks.Visible = False
          SeriesColor = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
        end
        object Series9: TLineSeries
          Marks.ArrowLength = 8
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Length = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Excitation Signal'
      ImageIndex = 4
      object Chart3: TChart
        Left = 32
        Top = 16
        Width = 457
        Height = 169
        Legend.CheckBoxes = True
        Title.Text.Strings = (
          'Prediction Error')
        View3D = False
        TabOrder = 0
        object Series3: TLineSeries
          Marks.ArrowLength = 8
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Length = 8
          Marks.Visible = False
          SeriesColor = clFuchsia
          Title = 'e(m) with a(k)'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
        end
        object Series15: TLineSeries
          Marks.ArrowLength = 8
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Length = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'e(m) invers filter'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
        end
      end
      object Chart4: TChart
        Left = 544
        Top = 16
        Width = 449
        Height = 169
        Title.Text.Strings = (
          'Prediction Signal -> x topi')
        View3D = False
        TabOrder = 1
        object Series4: TLineSeries
          Marks.ArrowLength = 8
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Length = 8
          Marks.Visible = False
          SeriesColor = clFuchsia
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
        end
      end
    end
  end
  object PageControl2: TPageControl
    Left = 232
    Top = 504
    Width = 1025
    Height = 209
    TabOrder = 5
  end
  object Chart5: TChart
    Left = 264
    Top = 512
    Width = 473
    Height = 193
    Legend.CheckBoxes = True
    Title.Text.Strings = (
      'Frequency Response')
    View3D = False
    TabOrder = 6
    PrintMargins = (
      15
      28
      15
      28)
    object Series5: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clBlack
      Title = 'Predictor'
      LinePen.Width = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object Series10: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clFuchsia
      Title = 'Invers Filter'
      LinePen.Color = clFuchsia
      LinePen.Width = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
  end
  object Chart6: TChart
    Left = 776
    Top = 512
    Width = 441
    Height = 194
    Legend.CheckBoxes = True
    Title.Text.Strings = (
      'Magnitude Response')
    View3D = False
    TabOrder = 7
    object Series6: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clBlack
      Title = 'Predictor'
      LinePen.Width = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
    object Series11: TLineSeries
      Marks.ArrowLength = 8
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 8
      Marks.Visible = False
      SeriesColor = clFuchsia
      Title = 'Invers Filter'
      LinePen.Color = clFuchsia
      LinePen.Width = 3
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
    end
  end
  object GroupBox4: TGroupBox
    Left = 24
    Top = 640
    Width = 161
    Height = 97
    Caption = 'Procedure Button'
    TabOrder = 8
    object Button5: TButton
      Left = 8
      Top = 24
      Width = 145
      Height = 25
      Caption = 'Reset'
      TabOrder = 0
      OnClick = Button5Click
    end
    object Button3: TButton
      Left = 8
      Top = 56
      Width = 145
      Height = 25
      Caption = 'Close'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object ALAudioOut1: TALAudioOut
    InputPin.Form = Form1
    InputPin.SourcePin = Form1.ALGenericGen1.OutputPin
    Device.AlternativeDevices = <>
    Device.DeviceName = 'Default'
    Left = 944
    Top = 8
  end
  object ALGenericFilter1: TALGenericFilter
    InputPin.Form = Form1
    InputPin.SourcePin = Form1.ALAudioIn1.OutputPin
    OnProcessData = ALGenericFilter1ProcessData
    Left = 728
    Top = 8
  end
  object ALAudioIn1: TALAudioIn
    Device.AlternativeDevices = <>
    Device.DeviceName = 'Default'
    OutputPin.Form = Form1
    OutputPin.SinkPins = (
      Form1.ALGenericFilter1.InputPin
      Form1.SLGenericReal1.InputPin)
    Left = 1008
    Top = 8
  end
  object ALGenericGen1: TALGenericGen
    OutputPin.Form = Form1
    OutputPin.SinkPins = (
      Form1.ALAudioOut1.InputPin)
    OnGenerate = ALGenericGen1Generate
    Left = 800
    Top = 8
  end
  object SLGenericReal1: TSLGenericReal
    InputPin.Form = Form1
    InputPin.SourcePin = Form1.ALAudioIn1.OutputPin
    Left = 872
    Top = 8
  end
  object Matrix1: TMatrix
    NrOfColumns = 1
    NrOfRows = 1
    Left = 1160
    Top = 16
  end
  object Matrix2: TMatrix
    NrOfColumns = 1
    NrOfRows = 1
    Left = 1184
    Top = 16
  end
  object OpenDialog1: TOpenDialog
    Left = 1240
    Top = 24
  end
  object ALWavePlayer1: TALWavePlayer
    PlaySegment.StopSample = 100
    Left = 200
    Top = 112
  end
end
