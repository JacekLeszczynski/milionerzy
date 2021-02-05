unit config;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  DBCtrls, StdCtrls, Buttons, XMLPropStorage, DSMaster, DBGridPlus, ZQueryPlus,
  ExtMessage, ZDataset;

type

  { TFKonfiguracja }

  TFKonfiguracja = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    mess: TExtMessage;
    HideUseing: TCheckBox;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBMemo4: TDBMemo;
    DBMemo5: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    ExtDBGrid1: TDBGridPlus;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    master: TDSMaster;
    ds_pytania: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ps: TXMLPropStorage;
    pytania: TZQueryPlus;
    pytaniac_odpowiedz: TStringField;
    pytaniaid: TLargeintField;
    pytaniaignore: TLargeintField;
    pytaniaodpowiedz: TLargeintField;
    pytaniaodp_1: TMemoField;
    pytaniaodp_2: TMemoField;
    pytaniaodp_3: TMemoField;
    pytaniaodp_4: TMemoField;
    pytaniapytanie: TMemoField;
    pytaniatrudnosc: TLargeintField;
    pytaniauzyte: TMemoField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure HideUseingChange(Sender: TObject);
    procedure ds_pytaniaDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pytaniaBeforeOpen(DataSet: TDataSet);
    procedure pytaniaCalcFields(DataSet: TDataSet);
  private

  public

  end;

var
  FKonfiguracja: TFKonfiguracja;

implementation

uses
  ecode, lcltype;

{$R *.lfm}

{ TFKonfiguracja }

procedure TFKonfiguracja.BitBtn6Click(Sender: TObject);
begin
  close;
end;

procedure TFKonfiguracja.BitBtn7Click(Sender: TObject);
var
  a,b,c,d: integer;
  s1,s2,s3,s4: string;
  o: integer;
begin
  a:=random(4)+1;
  while true do
  begin
    b:=random(4)+1;
    if a<>b then break;
  end;
  while true do
  begin
    c:=random(4)+1;
    if (a<>c) and (b<>c) then break;
  end;
  while true do
  begin
    d:=random(4)+1;
    if (a<>d) and (b<>d) and (c<>d) then break;
  end;
  s1:=pytaniaodp_1.AsString;
  s2:=pytaniaodp_2.AsString;
  s3:=pytaniaodp_3.AsString;
  s4:=pytaniaodp_4.AsString;
  o:=pytaniaodpowiedz.AsInteger;
  pytania.Edit;
  case a of
    1: pytaniaodp_1.AsString:=s1;
    2: pytaniaodp_1.AsString:=s2;
    3: pytaniaodp_1.AsString:=s3;
    4: pytaniaodp_1.AsString:=s4;
  end;
  case b of
    1: pytaniaodp_2.AsString:=s1;
    2: pytaniaodp_2.AsString:=s2;
    3: pytaniaodp_2.AsString:=s3;
    4: pytaniaodp_2.AsString:=s4;
  end;
  case c of
    1: pytaniaodp_3.AsString:=s1;
    2: pytaniaodp_3.AsString:=s2;
    3: pytaniaodp_3.AsString:=s3;
    4: pytaniaodp_3.AsString:=s4;
  end;
  case d of
    1: pytaniaodp_4.AsString:=s1;
    2: pytaniaodp_4.AsString:=s2;
    3: pytaniaodp_4.AsString:=s3;
    4: pytaniaodp_4.AsString:=s4;
  end;
  if o=a then pytaniaodpowiedz.AsInteger:=1 else
  if o=b then pytaniaodpowiedz.AsInteger:=2 else
  if o=c then pytaniaodpowiedz.AsInteger:=3 else
  if o=d then pytaniaodpowiedz.AsInteger:=4;
  pytania.Post;
end;

procedure TFKonfiguracja.BitBtn8Click(Sender: TObject);
begin
  if mess.ShowConfirmationYesNo('Czy usunąć wybraną pozycję?') then pytania.Delete;
end;

procedure TFKonfiguracja.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then close;
end;

procedure TFKonfiguracja.HideUseingChange(Sender: TObject);
begin
  ExtDBGrid1.Columns[8].Visible:=not HideUseing.Checked;
  ExtDBGrid1.AutoScaleColumns;
  pytania.Close;
  pytania.Open;
end;

procedure TFKonfiguracja.ds_pytaniaDataChange(Sender: TObject; Field: TField);
var
  a,ne,e: boolean;
begin
  master.State(ds_pytania,a,ne,e);
  BitBtn1.Enabled:=a;
  BitBtn2.Enabled:=not e;
  BitBtn3.Enabled:=BitBtn2.Enabled;
  BitBtn7.Enabled:=BitBtn2.Enabled;
  BitBtn8.Enabled:=BitBtn2.Enabled;
  BitBtn4.Enabled:=e;
  BitBtn5.Enabled:=BitBtn4.Enabled;
  Label6.Caption:='Wgranych rekordów: '+IntToStr(pytania.RecordCount);
end;

procedure TFKonfiguracja.BitBtn1Click(Sender: TObject);
begin
  pytania.Append;
end;

procedure TFKonfiguracja.BitBtn2Click(Sender: TObject);
begin
  pytania.Edit;
end;

procedure TFKonfiguracja.BitBtn3Click(Sender: TObject);
begin
  pytania.Edit;
  pytaniauzyte.Clear;
  pytania.Post;
end;

procedure TFKonfiguracja.BitBtn4Click(Sender: TObject);
begin
  pytania.Post;
end;

procedure TFKonfiguracja.BitBtn5Click(Sender: TObject);
begin
  pytania.Cancel;
end;

procedure TFKonfiguracja.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  CloseAction:=caFree;
end;

procedure TFKonfiguracja.FormCreate(Sender: TObject);
begin
  randomize;
  ps.FileName:=MyConfDir('server.xml');
  ps.Active:=true;
  ExtDBGrid1.AutoScaleCols:=true;
end;

procedure TFKonfiguracja.FormShow(Sender: TObject);
begin
  if not pytania.Active then master.Open;
end;

procedure TFKonfiguracja.pytaniaBeforeOpen(DataSet: TDataSet);
begin
  pytania.ClearDefs;
  if HideUseing.Checked then pytania.AddDef('--notuzyte','and uzyte is null');
end;

procedure TFKonfiguracja.pytaniaCalcFields(DataSet: TDataSet);
begin
  case pytaniaodpowiedz.AsInteger of
    1: pytaniac_odpowiedz.AsString:='A';
    2: pytaniac_odpowiedz.AsString:='B';
    3: pytaniac_odpowiedz.AsString:='C';
    4: pytaniac_odpowiedz.AsString:='D';
    else pytaniac_odpowiedz.AsString:='';
  end;
end;

end.

