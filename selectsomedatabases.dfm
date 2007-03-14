object SelectFromManyDatabases: TSelectFromManyDatabases
  Left = 217
  Top = 105
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = 'Select Databases...'
  ClientHeight = 343
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblSelectDB: TLabel
    Left = 8
    Top = 64
    Width = 87
    Height = 13
    Caption = 'Select Databases:'
  end
  object lblWarning: TLabel
    Left = 48
    Top = 8
    Width = 235
    Height = 39
    Caption = 
      'Found more than 50 Databases on this host. This can take some mi' +
      'nutes to display them all (depending on your network-connection)'
    WordWrap = True
  end
  object imgWarning: TImage
    Left = 8
    Top = 8
    Width = 33
    Height = 33
    Picture.Data = {
      07544269746D617076020000424D760200000000000076000000280000002000
      0000200000000100040000000000000200000000000000000000100000001000
      000000000000000080000080000000808000800000008000800080800000C0C0
      C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00777778888888888888888888888888777777888888888888888888888888
      88877730000000000000000000000008888873BBBBBBBBBBBBBBBBBBBBBBBB70
      88883BBBBBBBBBBBBBBBBBBBBBBBBBB708883BBBBBBBBBBBBBBBBBBBBBBBBBBB
      08883BBBBBBBBBBBB7007BBBBBBBBBBB08873BBBBBBBBBBBB0000BBBBBBBBBB7
      088773BBBBBBBBBBB0000BBBBBBBBBB0887773BBBBBBBBBBB7007BBBBBBBBB70
      8877773BBBBBBBBBBBBBBBBBBBBBBB088777773BBBBBBBBBBB0BBBBBBBBBB708
      87777773BBBBBBBBB707BBBBBBBBB08877777773BBBBBBBBB303BBBBBBBB7088
      777777773BBBBBBBB000BBBBBBBB0887777777773BBBBBBB70007BBBBBB70887
      7777777773BBBBBB30003BBBBBB088777777777773BBBBBB00000BBBBB708877
      77777777773BBBBB00000BBBBB08877777777777773BBBBB00000BBBB7088777
      777777777773BBBB00000BBBB0887777777777777773BBBB00000BBB70887777
      7777777777773BBB70007BBB088777777777777777773BBBBBBBBBB708877777
      77777777777773BBBBBBBBB08877777777777777777773BBBBBBBB7088777777
      777777777777773BBBBBBB0887777777777777777777773BBBBBB70887777777
      7777777777777773BBBBB088777777777777777777777773BBBB708777777777
      77777777777777773BB707777777777777777777777777777333777777777777
      7777}
    Transparent = True
  end
  object btnShowAll: TButton
    Left = 216
    Top = 80
    Width = 105
    Height = 25
    Caption = 'Show all'
    Default = True
    TabOrder = 0
    OnClick = btnShowAllClick
  end
  object CheckListBoxDBs: TCheckListBox
    Left = 8
    Top = 80
    Width = 201
    Height = 257
    OnClickCheck = CheckListBoxDBsClickCheck
    ItemHeight = 13
    TabOrder = 1
  end
  object btnSave: TButton
    Left = 216
    Top = 112
    Width = 105
    Height = 25
    Caption = 'Save'
    Enabled = False
    TabOrder = 2
    OnClick = btnSaveClick
  end
end
