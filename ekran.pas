unit ekran;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  XMLPropStorage, LiveTimer, TplGaugeUnit, ZDataset, ueled;

type

  { TfEkran }

  TfEkran = class(TForm)
    gl1: TplGauge;
    gl2: TplGauge;
    gl3: TplGauge;
    gl4: TplGauge;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    livekolo: TLiveTimer;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel9: TPanel;
    tinfokolo: TTimer;
    uELED19: TuELED;
    uELED20: TuELED;
    uELED21: TuELED;
    uELED22: TuELED;
    uELED23: TuELED;
    uELED24: TuELED;
    uELED25: TuELED;
    uELED26: TuELED;
    uELED27: TuELED;
    uELED28: TuELED;
    uELED29: TuELED;
    uELED30: TuELED;
    x1: TLabel;
    x2: TLabel;
    Label3: TLabel;
    x3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label_a: TLabel;
    Label_b: TLabel;
    Label_c: TLabel;
    Label_d: TLabel;
    odp_a: TLabel;
    odp_b: TLabel;
    odp_c: TLabel;
    odp_d: TLabel;
    Panel0: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    pytanie: TLabel;
    podsumowanie: TLabel;
    Shape1: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape2: TShape;
    Shape12: TShape;
    Shape3: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    ps: TXMLPropStorage;
    x4: TLabel;
    x5: TLabel;
    x6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tinfokoloStartTimer(Sender: TObject);
    procedure tinfokoloStopTimer(Sender: TObject);
    procedure tinfokoloTimer(Sender: TObject);
  private
  public
    procedure eOff;
    procedure ePytanie;
    procedure eTabInfo;
    procedure ePodsumowanie(aKwota: integer; aKoniec: boolean = false);
    procedure eCzas30(aPokaz: boolean = true);
    procedure ePub(aPokaz: boolean = true);
    procedure eInfoKola;
  end;

var
  fEkran: TfEkran;

implementation

uses
  serwis, ecode;

{$R *.lfm}

{ TfEkran }

procedure TfEkran.FormCreate(Sender: TObject);
begin
  ps.FileName:=MyConfDir('server.xml');
  ps.Active:=true;
end;

procedure TfEkran.tinfokoloStartTimer(Sender: TObject);
begin
  tinfokolo.Tag:=1;
  livekolo.Tag:=0;
  livekolo.Start;
  Panel12.Left:=1290;
  Panel12.Visible:=true;
  x4.Visible:=not g_kolo_1;
  x5.Visible:=not g_kolo_2;
  x6.Visible:=not g_kolo_3;
end;

procedure TfEkran.tinfokoloStopTimer(Sender: TObject);
begin
  tinfokolo.Tag:=0;
  livekolo.Tag:=0;
  livekolo.Stop;
  Panel12.Visible:=false;
end;

procedure TfEkran.tinfokoloTimer(Sender: TObject);
var
  a,x: integer;
  w: double;
begin
  a:=livekolo.GetIndexTime;
  w:=3000/1216;
  (* przesuwam się do środka *)
  if tinfokolo.Tag=1 then
  begin
    x:=round(a*w);
    if x>1216 then
    begin
      Panel12.Left:=1290-1216;
      tinfokolo.Tag:=2;
      livekolo.Tag:=a;
    end else Panel12.Left:=1290-x;
  end else
  (* czekam określoną ilość czasu *)
  if tinfokolo.Tag=2 then
  begin
    if a>livekolo.Tag+3000 then
    begin
      tinfokolo.Tag:=3;
      livekolo.Tag:=a;
    end;
  end else
  (* przesuwam się dalej w lewo aż do zniknięcia panelu za ekranem *)
  if tinfokolo.Tag=3 then
  begin
    x:=round((a-livekolo.Tag)*w);
    if x>1216 then
    begin
      Panel12.Left:=74-1216;
      tinfokolo.Enabled:=false;
    end else Panel12.Left:=74-x;
  end;
end;

procedure TfEkran.eOff;
begin
  Panel5.Visible:=false;
  Panel6.Visible:=false;
  Panel7.Visible:=false;
  Panel10.Visible:=false;
end;

procedure TfEkran.ePytanie;
begin
  eOff;
  Panel5.Visible:=true;
  pytanie.Visible:=false;
  Label_a.Visible:=false;
  Label_b.Visible:=false;
  Label_c.Visible:=false;
  Label_d.Visible:=false;
  odp_a.Visible:=false;
  odp_b.Visible:=false;
  odp_c.Visible:=false;
  odp_d.Visible:=false;
end;

procedure TfEkran.eTabInfo;
begin
  eOff;
  Panel6.Visible:=true;
  Shape1.Visible:=false;
  Shape2.Visible:=false;
  Shape3.Visible:=false;
  Shape4.Visible:=false;
  Shape5.Visible:=false;
  Shape6.Visible:=false;
  Shape7.Visible:=false;
  Shape8.Visible:=false;
  Shape9.Visible:=false;
  Shape10.Visible:=false;
  Shape11.Visible:=false;
  Shape12.Visible:=false;
  Shape21.Visible:=false;
  Shape22.Visible:=false;
  Shape23.Visible:=false;
  x1.Visible:=false;
  x2.Visible:=false;
  x3.Visible:=false;
end;

procedure TfEkran.ePodsumowanie(aKwota: integer; aKoniec: boolean);
var
  s: string;
begin
  eOff;
  if aKoniec then s:='Na koncie: ' else s:='';
  Panel7.Visible:=true;
  podsumowanie.Caption:=s+SpacesToPoints(FormatFloat('### ### ##0',aKwota))+' '+CL_DIAMENT;
end;

procedure TfEkran.eCzas30(aPokaz: boolean);
begin
  Panel9.Visible:=aPokaz;
end;

procedure TfEkran.ePub(aPokaz: boolean);
begin
  Panel10.Visible:=aPokaz;
end;

procedure TfEkran.eInfoKola;
begin
  tinfokolo.Enabled:=true;
end;

end.

