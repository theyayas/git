object Form1: TForm1
  Left = 0
  Top = 0
  Caption = '3 Joints (Lower Limb) by Yasin'
  ClientHeight = 694
  ClientWidth = 1334
  Color = clCaptionText
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 377
    Height = 326
    Caption = 'Control Area'
    Color = clTeal
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 110
      Height = 13
      Caption = 'Phi (Transversal Plane)'
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 104
      Height = 13
      Caption = 'Theta (Sagittal Plane)'
    end
    object Label3: TLabel
      Left = 16
      Top = 101
      Width = 66
      Height = 13
      Caption = 'X Position = 4'
    end
    object Label4: TLabel
      Left = 16
      Top = 149
      Width = 66
      Height = 13
      Caption = 'Y position = 5'
    end
    object Label5: TLabel
      Left = 17
      Top = 197
      Width = 76
      Height = 13
      Caption = 'Z Position = -20'
    end
    object SpeedButton1: TSpeedButton
      Left = 137
      Top = 263
      Width = 112
      Height = 41
      Caption = 'CLOSE'
      OnClick = SpeedButton1Click
    end
    object Button1: TButton
      Left = 16
      Top = 263
      Width = 115
      Height = 41
      Caption = 'START'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 143
      Top = 32
      Width = 89
      Height = 21
      TabOrder = 1
      Text = '30'
    end
    object Edit2: TEdit
      Left = 143
      Top = 59
      Width = 89
      Height = 21
      TabOrder = 2
      Text = '30'
    end
    object ScrollBar1: TScrollBar
      Left = 17
      Top = 120
      Width = 193
      Height = 17
      Max = 50
      Min = -50
      PageSize = 0
      Position = 4
      TabOrder = 3
      OnChange = ScrollBar1Change
    end
    object ScrollBar2: TScrollBar
      Left = 17
      Top = 168
      Width = 193
      Height = 17
      Max = 50
      Min = -50
      PageSize = 0
      Position = 5
      TabOrder = 4
      OnChange = ScrollBar2Change
    end
    object ScrollBar3: TScrollBar
      Left = 16
      Top = 216
      Width = 193
      Height = 17
      Max = 50
      Min = -50
      PageSize = 0
      Position = -20
      TabOrder = 5
      OnChange = ScrollBar3Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 340
    Width = 377
    Height = 357
    Caption = 'Chart Indicator'
    Color = clTeal
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object Chart1: TChart
      Left = 16
      Top = 196
      Width = 348
      Height = 149
      Legend.Visible = False
      Title.Font.Color = clBlack
      Title.Text.Strings = (
        'Theta (Sagittal Plane)')
      LeftAxis.Title.Caption = ' Angle (rad)'
      View3D = False
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series1: TLineSeries
        SeriesColor = clTeal
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object Chart2: TChart
      Left = 16
      Top = 23
      Width = 348
      Height = 161
      BackWall.Brush.Gradient.Direction = gdBottomTop
      BackWall.Brush.Gradient.EndColor = clWhite
      BackWall.Brush.Gradient.StartColor = 15395562
      BackWall.Brush.Gradient.Visible = True
      BackWall.Transparent = False
      Foot.Font.Color = clBlue
      Foot.Font.Name = 'Verdana'
      Gradient.Direction = gdBottomTop
      Gradient.EndColor = clWhite
      Gradient.MidColor = 15395562
      Gradient.StartColor = 15395562
      Gradient.Visible = True
      LeftWall.Color = 14745599
      Legend.Font.Name = 'Verdana'
      Legend.Shadow.Transparency = 0
      Legend.Visible = False
      RightWall.Color = 14745599
      Title.Font.Color = clBlack
      Title.Font.Name = 'Verdana'
      Title.Margins.Left = 17
      Title.Margins.Units = maPercentSize
      Title.Text.Strings = (
        'Phi (Transversal Plane)')
      Title.TextAlignment = taLeftJustify
      BottomAxis.Axis.Color = 4210752
      BottomAxis.Grid.Color = 11119017
      BottomAxis.LabelsFormat.Font.Name = 'Verdana'
      BottomAxis.TicksInner.Color = 11119017
      BottomAxis.Title.Caption = 'Sequence'
      BottomAxis.Title.Font.Name = 'Verdana'
      DepthAxis.Axis.Color = 4210752
      DepthAxis.Grid.Color = 11119017
      DepthAxis.LabelsFormat.Font.Name = 'Verdana'
      DepthAxis.TicksInner.Color = 11119017
      DepthAxis.Title.Font.Name = 'Verdana'
      DepthTopAxis.Axis.Color = 4210752
      DepthTopAxis.Grid.Color = 11119017
      DepthTopAxis.LabelsFormat.Font.Name = 'Verdana'
      DepthTopAxis.TicksInner.Color = 11119017
      DepthTopAxis.Title.Font.Name = 'Verdana'
      LeftAxis.Axis.Color = 4210752
      LeftAxis.Grid.Color = 11119017
      LeftAxis.LabelsFormat.Font.Name = 'Verdana'
      LeftAxis.TicksInner.Color = 11119017
      LeftAxis.Title.Caption = ' Angle (rad)'
      LeftAxis.Title.Font.Name = 'Verdana'
      RightAxis.Axis.Color = 4210752
      RightAxis.Grid.Color = 11119017
      RightAxis.LabelsFormat.Font.Name = 'Verdana'
      RightAxis.TicksInner.Color = 11119017
      RightAxis.Title.Font.Name = 'Verdana'
      TopAxis.Axis.Color = 4210752
      TopAxis.Grid.Color = 11119017
      TopAxis.LabelsFormat.Font.Name = 'Verdana'
      TopAxis.TicksInner.Color = 11119017
      TopAxis.Title.Font.Name = 'Verdana'
      View3D = False
      TabOrder = 1
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series2: TLineSeries
        SeriesColor = clTeal
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
  end
  object Panel1: TPanel
    Left = 391
    Top = 8
    Width = 938
    Height = 41
    Caption = '3D Single Pendulum'
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -21
    Font.Name = 'Snap ITC'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 272
    Top = 112
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer2Timer
    Left = 304
    Top = 112
  end
end
