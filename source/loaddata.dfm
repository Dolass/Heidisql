object loaddataform: Tloaddataform
  Left = 212
  Top = 111
  Caption = 'Import text file'
  ClientHeight = 494
  ClientWidth = 454
  Color = clBtnFace
  Constraints.MinHeight = 530
  Constraints.MinWidth = 470
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    454
    494)
  PixelsPerInch = 96
  TextHeight = 13
  object btnImport: TButton
    Left = 290
    Top = 461
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Import!'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 6
    OnClick = btnImportClick
  end
  object btnCancel: TButton
    Left = 371
    Top = 461
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 7
  end
  object grpFilename: TGroupBox
    Left = 8
    Top = 8
    Width = 438
    Height = 84
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Input file'
    TabOrder = 0
    DesignSize = (
      438
      84)
    object lblFilename: TLabel
      Left = 10
      Top = 27
      Width = 46
      Height = 13
      Caption = 'Filename:'
      FocusControl = editFilename
    end
    object lblEncoding: TLabel
      Left = 10
      Top = 54
      Width = 47
      Height = 13
      Caption = 'Encoding:'
    end
    object editFilename: TButtonedEdit
      Left = 88
      Top = 24
      Width = 340
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Images = MainForm.ImageListMain
      RightButton.ImageIndex = 51
      RightButton.Visible = True
      TabOrder = 0
      Text = 'editFilename'
      OnChange = editFilenameChange
      OnDblClick = btnOpenFileClick
      OnRightButtonClick = btnOpenFileClick
    end
    object comboEncoding: TComboBox
      Left = 88
      Top = 51
      Width = 340
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      DropDownCount = 16
      TabOrder = 1
      OnSelect = comboEncodingSelect
    end
  end
  object grpChars: TGroupBox
    Left = 199
    Top = 98
    Width = 247
    Height = 135
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Control characters'
    TabOrder = 2
    DesignSize = (
      247
      135)
    object lblFieldTerminater: TLabel
      Left = 10
      Top = 26
      Width = 97
      Height = 13
      Caption = 'Fields terminated by'
    end
    object lblFieldEncloser: TLabel
      Left = 10
      Top = 51
      Width = 87
      Height = 13
      Caption = 'Fields enclosed by'
    end
    object lblFieldEscaper: TLabel
      Left = 10
      Top = 75
      Width = 85
      Height = 13
      Caption = 'Fields escaped by'
    end
    object lblLineTerminator: TLabel
      Left = 10
      Top = 100
      Width = 94
      Height = 13
      Caption = 'Lines terminated by'
    end
    object editFieldEscaper: TEdit
      Left = 124
      Top = 72
      Width = 49
      Height = 21
      TabOrder = 3
      Text = '"'
    end
    object editFieldEncloser: TEdit
      Left = 124
      Top = 48
      Width = 49
      Height = 21
      TabOrder = 1
      Text = '"'
    end
    object editFieldTerminator: TEdit
      Left = 124
      Top = 23
      Width = 49
      Height = 21
      TabOrder = 0
      Text = ';'
    end
    object chkFieldsEnclosedOptionally: TCheckBox
      Left = 179
      Top = 50
      Width = 65
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'optionally'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object editLineTerminator: TEdit
      Left = 124
      Top = 97
      Width = 49
      Height = 21
      TabOrder = 4
      Text = '\r\n'
    end
  end
  object grpOptions: TGroupBox
    Left = 8
    Top = 98
    Width = 185
    Height = 135
    Caption = 'Options'
    TabOrder = 1
    DesignSize = (
      185
      135)
    object lblIgnoreLinesCount: TLabel
      Left = 143
      Top = 26
      Width = 21
      Height = 13
      Caption = 'lines'
    end
    object lblIgnoreLines: TLabel
      Left = 10
      Top = 26
      Width = 54
      Height = 13
      Caption = 'Ignore first'
    end
    object updownIgnoreLines: TUpDown
      Left = 121
      Top = 23
      Width = 16
      Height = 21
      Associate = editIgnoreLines
      Max = 32767
      Position = 1
      TabOrder = 1
    end
    object editIgnoreLines: TEdit
      Left = 88
      Top = 23
      Width = 33
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object chkLowPriority: TCheckBox
      Left = 10
      Top = 51
      Width = 172
      Height = 31
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Low priority, avoid high server load'
      Checked = True
      State = cbChecked
      TabOrder = 2
      WordWrap = True
    end
    object chkLocalNumbers: TCheckBox
      Left = 10
      Top = 86
      Width = 172
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = 
        'Input file contains local formatted numbers, e.g. 1.234,56 in Ge' +
        'rmany'
      TabOrder = 3
      WordWrap = True
    end
  end
  object grpDuplicates: TRadioGroup
    Left = 8
    Top = 239
    Width = 185
    Height = 123
    Caption = 'Handling of duplicate rows'
    ItemIndex = 2
    Items.Strings = (
      'INSERT (may throw errors)'
      'INSERT IGNORE (duplicates)'
      'REPLACE (duplicates)')
    TabOrder = 3
  end
  object grpParseMethod: TRadioGroup
    Left = 8
    Top = 368
    Width = 185
    Height = 87
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'Method'
    ItemIndex = 0
    Items.Strings = (
      'Server parses file contents (LOAD DATA)'
      'Client parses file contents')
    TabOrder = 4
    WordWrap = True
    OnClick = grpParseMethodClick
  end
  object grpDestination: TGroupBox
    Left = 199
    Top = 239
    Width = 247
    Height = 216
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Destination'
    TabOrder = 5
    DesignSize = (
      247
      216)
    object lblDatabase: TLabel
      Left = 10
      Top = 24
      Width = 50
      Height = 13
      Caption = 'Database:'
    end
    object lblTable: TLabel
      Left = 10
      Top = 48
      Width = 30
      Height = 13
      Caption = 'Table:'
    end
    object lblColumns: TLabel
      Left = 10
      Top = 72
      Width = 44
      Height = 13
      Caption = 'Columns:'
    end
    object comboDatabase: TComboBox
      Left = 64
      Top = 21
      Width = 173
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnChange = comboDatabaseChange
    end
    object comboTable: TComboBox
      Left = 64
      Top = 45
      Width = 173
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnChange = comboTableChange
    end
    object chklistColumns: TCheckListBox
      Left = 10
      Top = 91
      Width = 198
      Height = 116
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 2
    end
    object ToolBarColMove: TToolBar
      Left = 214
      Top = 91
      Width = 23
      Height = 44
      Align = alNone
      Anchors = [akTop, akRight]
      AutoSize = True
      Caption = 'ToolBarColMove'
      Images = MainForm.ImageListMain
      TabOrder = 3
      object btnColUp: TToolButton
        Left = 0
        Top = 0
        Caption = 'btnColUp'
        ImageIndex = 74
        Wrap = True
        OnClick = btnColMoveClick
      end
      object btnColDown: TToolButton
        Left = 0
        Top = 22
        Caption = 'btnColDown'
        ImageIndex = 75
        OnClick = btnColMoveClick
      end
    end
  end
end
