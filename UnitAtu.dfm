object FormAtu: TFormAtu
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'O que h'#225' de novo'
  ClientHeight = 520
  ClientWidth = 610
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 48
    Top = 16
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
  object SpeedButton1: TSpeedButton
    Left = 0
    Top = 498
    Width = 610
    Height = 22
    Align = alBottom
    Caption = 'Fechar'
    OnClick = SpeedButton1Click
    ExplicitLeft = 64
    ExplicitTop = 368
    ExplicitWidth = 23
  end
  object LogAtu: TRichEdit
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 590
    Height = 478
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    BorderStyle = bsNone
    Color = 15460559
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      'LogAtu')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    StyleElements = []
  end
end
