unit view;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, SynEdit, SynMemo, ExtCtrls, Registry, DB, SynRegExpr;

type
  TfrmView = class(TForm)
    editName: TEdit;
    lblName: TLabel;
    rgAlgorithm: TRadioGroup;
    SynMemoSelect: TSynMemo;
    lblSelect: TLabel;
    btnCancel: TButton;
    btnOK: TButton;
    rgCheck: TRadioGroup;
    btnHelp: TButton;
    procedure btnHelpClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure editNameChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    EditViewName: String;
    DBNode: TTreeNode;
  end;

  
implementation

uses main, helpers, childwin;

{$R *.dfm}


{**
  FormCreate: Restore GUI setup
}
procedure TfrmView.FormCreate(Sender: TObject);
begin
  Width := Mainform.GetRegValue(REGNAME_VIEWWINWIDTH, Width);
  Height := Mainform.GetRegValue(REGNAME_VIEWWINHEIGHT, Height);
  SynMemoSelect.Highlighter := Mainform.ChildWin.SynSQLSyn1;
  SynMemoSelect.Font := Mainform.ChildWin.SynMemoQuery.Font;
end;


{**
  FormDestroy: Save GUI setup
}
procedure TfrmView.FormDestroy(Sender: TObject);
var
  reg : TRegistry;
begin
  reg := TRegistry.Create;
  if reg.OpenKey(REGPATH, False) then begin
    reg.WriteInteger( REGNAME_VIEWWINWIDTH, Width );
    reg.WriteInteger( REGNAME_VIEWWINHEIGHT, Height );
    reg.CloseKey;
  end;
  reg.Free;
  Close;
end;


{**
  FormShow: Fill controls with content in edit mode
}
procedure TfrmView.FormShow(Sender: TObject);
var
  ds: TDataset;
  db: String;
  rx: TRegExpr;
begin
  if EditViewName <> '' then begin
    // Edit mode
    Caption := 'Edit view ...';
    editName.Text := EditViewName;
    if not Assigned(DBNode) then
      db := Mainform.ChildWin.ActiveDatabase
    else
      db := DBNode.Text;
    ds := Mainform.ChildWin.GetResults('SELECT * FROM '+Mainform.mask(DBNAME_INFORMATION_SCHEMA)+'.VIEWS ' +
      'WHERE TABLE_SCHEMA = '+esc(db)+' AND TABLE_NAME = '+esc(EditViewName));
    if ds.RecordCount = 0 then
      raise Exception.Create('Can''t find view definition for "'+EditViewName+'" in '+DBNAME_INFORMATION_SCHEMA);
    // Algorithm is not changeable as we cannot look up its current state!
    rgAlgorithm.Enabled := False;
    rgAlgorithm.ItemIndex := 0;
    rgCheck.ItemIndex := rgCheck.Items.IndexOf(ds.FieldByName('CHECK_OPTION').AsString);
    rgCheck.Enabled := ds.FieldByName('IS_UPDATABLE').AsString = 'YES';

    rx := TRegExpr.Create;
    rx.ModifierG := True;
    rx.ModifierI := True;
    rx.Expression := '\s+WITH\s+\w+\s+CHECK\s+OPTION$';
    SynMemoSelect.Text := rx.Replace(ds.FieldByName('VIEW_DEFINITION').AsString, '');
    rx.Free;
  end else begin
    // Create mode
    Caption := 'Create view ...';
    editName.Text := 'myview';
    rgAlgorithm.Enabled := True;
    rgAlgorithm.ItemIndex := 0;
    rgCheck.Enabled := True;
    rgCheck.ItemIndex := 0;
    SynMemoSelect.Text := 'SELECT ';
  end;
  // Ensure name is validated
  editNameChange(Sender);
end;


{**
  View name has changed: Check for valid naming
}
procedure TfrmView.editNameChange(Sender: TObject);
begin
  btnOK.Enabled := False;
  try
    ensureValidIdentifier( editName.Text );
    editName.Font.Color := clWindowText;
    editName.Color := clWindow;
    btnOK.Enabled := True;
  except
    editName.Font.Color := clRed;
    editName.Color := clYellow;
  end;
end;


{**
  Lookup "Create|Alter View" in SQL help
}
procedure TfrmView.btnHelpClick(Sender: TObject);
var
  keyword: String;
begin
  if EditViewName = '' then
    keyword := 'CREATE VIEW'
  else
    keyword := 'ALTER VIEW';
  Mainform.ChildWin.CallSQLHelpWithKeyword(keyword);
end;


{**
  Apply changes: Compose and execute SQL
}
procedure TfrmView.btnOKClick(Sender: TObject);
var
  sql, viewname, renamed: String;
begin
  // Compose CREATE or ALTER statement
  if EditViewName = '' then begin
    sql := 'CREATE ';
    viewname := editName.Text;
  end else begin
    sql := 'ALTER ';
    viewname := EditViewName;
  end;
  viewname := Mainform.mask(viewname);
  if Assigned(DBNode) then
    viewname := Mainform.mask(DBNode.Text) + '.' + viewname;
  if rgAlgorithm.Enabled and (rgAlgorithm.ItemIndex > -1) then
    sql := sql + 'ALGORITHM = '+Uppercase(rgAlgorithm.Items[rgAlgorithm.ItemIndex])+' ';
  sql := sql + 'VIEW ' + viewname+' AS '+SynMemoSelect.Text+' ';
  if rgCheck.Enabled and (rgCheck.ItemIndex > 0) then
    sql := sql + 'WITH '+Uppercase(rgCheck.Items[rgCheck.ItemIndex])+' CHECK OPTION';

  // Execute query and keep form open in any error case
  try
    Mainform.Childwin.ExecUpdateQuery(sql);
    // Probably rename view
    if (EditViewName <> '') and (EditViewName <> editName.Text) then begin
      renamed := Mainform.mask(editName.Text);
      if Assigned(DBNode) then
        renamed := Mainform.mask(DBNode.Text) + '.' + renamed;
      Mainform.Childwin.ExecUpdateQuery('ALTER TABLE '+viewname
        + ' RENAME '+renamed);
    end;
    if (not Assigned(DBNode)) or (DBNode.Text = Mainform.Childwin.ActiveDatabase) then
      Mainform.ChildWin.MenuRefreshClick( Sender )
    else
      Mainform.ChildWin.PopulateTreeTableList( DBNode, True );
  except
    on E: THandledSQLError do begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      ModalResult := mrNone;
    end;
  end;
end;


end.
