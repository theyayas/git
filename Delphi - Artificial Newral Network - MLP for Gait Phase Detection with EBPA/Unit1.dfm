object Form1: TForm1
  Left = 65
  Top = 30
  Caption = 
    'Artificial Neural Network : MLP for Gait Phase Detection with  E' +
    'BPA'
  ClientHeight = 653
  ClientWidth = 1222
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 16
    Top = 38
    Width = 78
    Height = 13
    Caption = 'Input Layer      :'
  end
  object Label6: TLabel
    Left = 16
    Top = 67
    Width = 79
    Height = 13
    Caption = 'Hidden Layer 1 :'
  end
  object Label7: TLabel
    Left = 16
    Top = 96
    Width = 82
    Height = 13
    Caption = 'Hidden Layer 2 : '
  end
  object Label8: TLabel
    Left = 16
    Top = 125
    Width = 77
    Height = 13
    Caption = 'Output Layer   :'
  end
  object Label9: TLabel
    Left = 183
    Top = 450
    Width = 42
    Height = 13
    Caption = 'Iteration'
  end
  object Label10: TLabel
    Left = 385
    Top = 450
    Width = 24
    Height = 13
    Caption = 'Error'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 153
    Caption = 'ANN Topology'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label4: TLabel
      Left = 164
      Top = 115
      Width = 35
      Height = 16
      Caption = 'Nodes'
    end
    object Label3: TLabel
      Left = 164
      Top = 86
      Width = 35
      Height = 16
      Caption = 'Nodes'
    end
    object Label2: TLabel
      Left = 164
      Top = 58
      Width = 35
      Height = 16
      Caption = 'Nodes'
    end
    object Label1: TLabel
      Left = 164
      Top = 27
      Width = 35
      Height = 16
      Caption = 'Nodes'
    end
    object SpinEdit2: TSpinEdit
      Left = 93
      Top = 52
      Width = 65
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 8
    end
    object SpinEdit1: TSpinEdit
      Left = 93
      Top = 24
      Width = 65
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 2
    end
    object SpinEdit3: TSpinEdit
      Left = 93
      Top = 80
      Width = 65
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 8
    end
    object SpinEdit4: TSpinEdit
      Left = 93
      Top = 108
      Width = 65
      Height = 26
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 239
    Top = 8
    Width = 194
    Height = 153
    Caption = 'Data Recognition'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Topology: TButton
    Left = 447
    Top = 14
    Width = 89
    Height = 25
    Caption = 'Topology Design'
    TabOrder = 2
    OnClick = TopologyClick
  end
  object Initial: TButton
    Left = 447
    Top = 45
    Width = 89
    Height = 25
    Caption = 'Initialization'
    TabOrder = 3
    OnClick = InitialClick
  end
  object Training: TButton
    Left = 447
    Top = 75
    Width = 89
    Height = 25
    Caption = 'ANN Training'
    TabOrder = 4
    OnClick = TrainingClick
  end
  object Recall: TButton
    Left = 447
    Top = 104
    Width = 89
    Height = 25
    Caption = 'Recall'
    TabOrder = 5
    OnClick = RecallClick
  end
  object Button5: TButton
    Left = 447
    Top = 135
    Width = 89
    Height = 25
    Caption = 'Clear'
    TabOrder = 6
  end
  object Memo1: TMemo
    Left = 8
    Top = 167
    Width = 528
    Height = 265
    Lines.Strings = (
      
        'Welcome to Multi Layer Perceptron with Error Back Propagation Al' +
        'gorithm Program disigned by '
      'Muhammad Yasin 07311740000019'
      '')
    ScrollBars = ssVertical
    TabOrder = 7
  end
  object Edit1: TEdit
    Left = 231
    Top = 450
    Width = 121
    Height = 21
    TabOrder = 8
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 415
    Top = 450
    Width = 121
    Height = 21
    TabOrder = 9
    Text = 'Edit2'
  end
  object RadioX: TRadioButton
    Left = 255
    Top = 41
    Width = 90
    Height = 17
    Caption = 'Training X'
    TabOrder = 10
  end
  object RadioA: TRadioButton
    Left = 255
    Top = 64
    Width = 63
    Height = 17
    Caption = 'Training A'
    TabOrder = 11
  end
  object RadioB: TRadioButton
    Left = 255
    Top = 87
    Width = 63
    Height = 17
    Caption = 'Training B'
    TabOrder = 12
  end
  object GroupBox4: TGroupBox
    Left = 542
    Top = 8
    Width = 667
    Height = 463
    Caption = 'Training and Recall Process'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    object Chart5: TChart
      Left = 16
      Top = 27
      Width = 641
      Height = 215
      Legend.CheckBoxes = True
      Title.Font.Color = clTeal
      Title.Font.Height = -13
      Title.Text.Strings = (
        'Gait Phase Input')
      View3D = False
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series11: TBarSeries
        SeriesColor = clRed
        Title = 'Target'
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series8: THorizLineSeries
        SeriesColor = clNavy
        Title = 'Heel'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loNone
        YValues.Name = 'Y'
        YValues.Order = loAscending
      end
      object Series10: THorizLineSeries
        SeriesColor = clYellow
        Title = 'Toe'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loNone
        YValues.Name = 'Y'
        YValues.Order = loAscending
      end
    end
    object Chart6: TChart
      Left = 16
      Top = 248
      Width = 641
      Height = 199
      Legend.CheckBoxes = True
      Title.Font.Color = clTeal
      Title.Font.Height = -13
      Title.Text.Strings = (
        'Gait Phase Output')
      View3D = False
      TabOrder = 1
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series9: TBarSeries
        SeriesColor = clNavy
        Title = 'Target'
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series12: TBarSeries
        SeriesColor = clYellow
        Title = 'Recall'
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
      end
      object Series13: THorizLineSeries
        SeriesColor = clRed
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loNone
        YValues.Name = 'Y'
        YValues.Order = loAscending
      end
      object Series14: THorizLineSeries
        SeriesColor = clLime
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loNone
        YValues.Name = 'Y'
        YValues.Order = loAscending
      end
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 477
    Width = 1201
    Height = 168
    Caption = 'Error and Trehsholds'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    object Chart1: TChart
      Left = 8
      Top = 17
      Width = 570
      Height = 136
      Legend.Visible = False
      Title.Font.Color = clTeal
      Title.Font.Height = -13
      Title.Text.Strings = (
        'Error')
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 0.100000000000000000
      LeftAxis.Minimum = -0.020000000000000000
      View3D = False
      View3DWalls = False
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series1: THorizLineSeries
        SeriesColor = clRed
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loNone
        YValues.Name = 'Y'
        YValues.Order = loAscending
      end
    end
    object Chart4: TChart
      Left = 589
      Top = 17
      Width = 602
      Height = 136
      Title.Font.Color = clTeal
      Title.Font.Height = -13
      Title.Text.Strings = (
        'Thresholds')
      View3D = False
      View3DWalls = False
      TabOrder = 1
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series5: THorizLineSeries
        SeriesColor = 10485760
        Title = 'Threshold 1'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loNone
        YValues.Name = 'Y'
        YValues.Order = loAscending
      end
      object Series6: THorizLineSeries
        SeriesColor = clYellow
        Title = 'Threshold 2'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loNone
        YValues.Name = 'Y'
        YValues.Order = loAscending
      end
      object Series7: THorizLineSeries
        SeriesColor = clRed
        Title = 'Threshold 3'
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loNone
        YValues.Name = 'Y'
        YValues.Order = loAscending
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 328
    Top = 128
  end
end
