unit config;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  DBCtrls, StdCtrls, Buttons, DSMaster, ZDataset;

type

  { TFKonfiguracja }

  TFKonfiguracja = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBMemo4: TDBMemo;
    DBMemo5: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    master: TDSMaster;
    ds_pytania: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    pytania: TZQuery;
    pytaniaid: TLargeintField;
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
    procedure ds_pytaniaStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  FKonfiguracja: TFKonfiguracja;

implementation

{$R *.lfm}

{ TFKonfiguracja }

procedure TFKonfiguracja.BitBtn6Click(Sender: TObject);
begin
  close;
end;

procedure TFKonfiguracja.ds_pytaniaStateChange(Sender: TObject);
var
  a,e: boolean;
begin
  a:=pytania.Active;
  e:=pytania.Active and (pytania.State in [dsEdit,dsInsert]);
  BitBtn1.Enabled:=a and (not e);
  BitBtn2.Enabled:=(not e) and (pytania.RecordCount>0);
  BitBtn3.Enabled:=BitBtn2.Enabled;
  BitBtn4.Enabled:=e;
  BitBtn5.Enabled:=BitBtn4.Enabled;
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

procedure TFKonfiguracja.FormShow(Sender: TObject);
begin
  if not pytania.Active then master.Open;
end;

end.

