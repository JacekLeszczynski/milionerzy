unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, XMLPropStorage, ComCtrls, TplGaugeUnit, Presentation, UOSEngine,
  UOSPlayer, LiveTimer, NetSocket, ZDataset, lNet;

type

  { TFServer }

  TFServer = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    db_pytanieid: TLargeintField;
    db_pytanieodpowiedz: TLargeintField;
    db_pytanieodp_1: TMemoField;
    db_pytanieodp_2: TMemoField;
    db_pytanieodp_3: TMemoField;
    db_pytanieodp_4: TMemoField;
    db_pytaniepytanie: TMemoField;
    ds_pytanie: TDataSource;
    db_pytanie: TZQuery;
    gl2: TplGauge;
    gl3: TplGauge;
    gl4: TplGauge;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    i10: TLabel;
    i11: TLabel;
    i12: TLabel;
    i13: TLabel;
    i14: TLabel;
    i15: TLabel;
    i16: TLabel;
    i17: TLabel;
    i18: TLabel;
    i19: TLabel;
    i20: TLabel;
    i21: TLabel;
    i8: TLabel;
    i9: TLabel;
    Label1: TLabel;
    i0: TLabel;
    i1: TLabel;
    i2: TLabel;
    i3: TLabel;
    i4: TLabel;
    i5: TLabel;
    i6: TLabel;
    i7: TLabel;
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
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    gl1: TplGauge;
    ser: TNetSocket;
    ps: TXMLPropStorage;
    StatusBar: TStatusBar;
    tSer: TTimer;
    zegar: TLiveTimer;
    lTryb: TLabel;
    Panel1: TPanel;
    pilot: TPresentation;
    play2: TUOSPlayer;
    player: TUOSPlayer;
    RadioGroup1: TRadioGroup;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    tGra: TTimer;
    t50: TTimer;
    tTel: TTimer;
    tInfo: TTimer;
    uos: TUOSEngine;
    play1: TUOSPlayer;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ButtOdpNow(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pilotClick(aButton: integer; var aTestDblClick: boolean);
    procedure pilotClickLong(aButton: integer; aDblClick: boolean);
    procedure RadioGroup1Click(Sender: TObject);
    procedure serCryptString(var aText: string);
    procedure serDecryptString(var aText: string);
    procedure serReceiveString(aMsg: string; aSocket: TLSocket);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure t50StartTimer(Sender: TObject);
    procedure t50Timer(Sender: TObject);
    procedure tGraTimer(Sender: TObject);
    procedure tSerTimer(Sender: TObject);
    procedure tInfoTimer(Sender: TObject);
    procedure tTelStartTimer(Sender: TObject);
    procedure tTelStopTimer(Sender: TObject);
    procedure tTelTimer(Sender: TObject);
  private
    sesje,glosy,glosy2: TStringList;
    procedure music(aNr: integer = 0);
    procedure nomusic;
    procedure sound(aNr: integer = 0; aLoop: boolean = false; aVolume: integer = 100);
    procedure nosound;
    procedure test(aTryb: integer);
    procedure ekran_info(aLp: integer = 0);
    procedure ekran_pytanie(aNr: integer; aLp: integer = -1);
    procedure okno_config;
    procedure aktywacja_odpowiedzi(b: boolean; aIgnoreServ: boolean = false);
    procedure zaznacz_odpowiedz(aNr: integer);
    procedure glosy_wyniki(var a,b,c,d: integer);
    procedure glosy_aktualizacja;
    procedure glosy_clear;
    procedure synchronizuj(aKey: string; aSocket: TLSocket);
  public

  end;

var
  FServer: TFServer;

implementation

uses
  ecode, serwis, config, lcltype, ekran;

{$R *.lfm}

{ TFServer }

procedure TFServer.FormCreate(Sender: TObject);
begin
  sesje:=TStringList.Create;
  sesje.Sorted:=true;
  glosy:=TStringList.Create;
  glosy.Sorted:=true;
  glosy2:=TStringList.Create;
  glosy2.Sorted:=true;
  SetConfDir('milionerzy');
  uos.LibDirectory:=MyDir('uos');
  uos.LoadLibrary;
  dm:=Tdm.Create(self);
  fEkran:=TfEkran.Create(self);
  dm.db.Database:=MyConfDir('db.sqlite');
  dm.db_open;
  ser.Connect;
  ps.FileName:=MyConfDir('server.xml');
  ps.Active:=true;
end;

procedure TFServer.FormDestroy(Sender: TObject);
begin
  sesje.Free;
  glosy.Free;
  glosy2.Free;
  dm.Free;
  fEkran.Free;
  uos.UnLoadLibrary;
end;

procedure TFServer.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  if ON_gra then
  begin
    pilot.Execute(Key);
    Key:=0;
  end else begin
    case Key of
      VK_F9: okno_config;
    end;
  end;
end;

procedure TFServer.pilotClick(aButton: integer; var aTestDblClick: boolean);
var
  litera: integer;

begin
  if (aButton=2) or (aButton=3) then aTestDblClick:=true;
  if ON_pause then exit;
  case aButton of
    1: litera:=1;
    2: litera:=2;
    3: litera:=3;
    4: litera:=4;
    5: litera:=4;
  end;
  case TRYB of
    (* PUSTY EKRAN *)
    0: if litera=1 then test(1);
    (* INFORMACJA *)
    1: if litera=1 then test(2);
    2: if litera=1 then test(3);
    3: if litera=1 then test(4);
    4: if litera=1 then test(5);
    5: if litera=1 then test(6);
    6: if litera=1 then test(7);
    7: if litera=1 then test(8);
    (* PUSTY EKRAN *)
    8: if litera=1 then test(9);
    (* PYTANIE *)
    9: if litera=1 then test(10);
    10: if litera=1 then test(11);
    11: if litera=1 then test(12);
    12: if litera=1 then test(13);
    13: if litera=1 then test(14);
    14: if litera=1 then test(15);
    15: if litera=1 then test(16);
    16: if litera=1 then if g_stop then test(20) else test(17);
    17: if litera=1 then test(18);
    18: if litera=1 then test(19);
    19: if litera=1 then
        begin
          inc(g_pytanie);
          test(8);
        end else if litera=4 then test(20);
    20: if litera=1 then test(21);
  end;
end;

procedure TFServer.pilotClickLong(aButton: integer; aDblClick: boolean);
begin
  if aButton=2 then
  begin
    if aDblClick then pilot.SendKey(ord('6')) else pilot.SendKey(ord('5'));
  end else
  if aButton=3 then
  begin
    if aDblClick then pilot.SendKey(ord('8')) else pilot.SendKey(ord('7'));
  end;
end;

procedure TFServer.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0: fEkran.eOff;
    1: fEkran.eTabInfo;
    2: fEkran.ePytanie;
  end;
end;

procedure TFServer.serCryptString(var aText: string);
begin
  aText:=dm.CryptString(aText);
end;

procedure TFServer.serDecryptString(var aText: string);
begin
  aText:=dm.DecryptString(aText);
end;

procedure TFServer.serReceiveString(aMsg: string; aSocket: TLSocket);
var
  s,s1,key,nkey,kom,w,pom: string;
  b: boolean;
  i: integer;
begin
  { RAMKA: (dużymi literami określam definicje)      Pierwszy pakiet clienta:
    c$KEY$KOMENDA$PARAMETRY - komenda             1. rejestruję się lub loguję
    o$KEY$ODPOWIEDŹ$DANE    - odpowiedź           c$new$register lub c$KEY$login
                                                  2. odpowiadam:
                                                  o$new$register$KEY lub
                                                  o$KEY$login$ok lub o$KEY$register$NEW_KEY
  }
  s:=aMsg;
  s1:=GetLineToStr(s,1,'$');
  if s1<>'c' then exit;
  key:=GetLineToStr(s,2,'$');
  kom:=GetLineToStr(s,3,'$');
  (* rejestracja lub logowanie *)
  if (key='new') and (kom='register') then
  begin
    key:=dm.GetGUID;
    sesje.Add(key);
    ser.SendString('o$new$register$'+key,aSocket);
    synchronizuj(key,aSocket);
  end else
  if kom='login' then
  begin
    b:=sesje.Find(key,i);
    if b and (i>-1) then ser.SendString('o$'+key+'$ok',aSocket) else
    begin
      nkey:=dm.GetGUID;
      sesje.Add(nkey);
      ser.SendString('o$'+key+'$register$'+nkey,aSocket);
      key:=nkey;
    end;
    synchronizuj(key,aSocket);
  end else
  if kom='zaznacz' then
  begin
    w:=GetLineToStr(s,4,'$');
    b:=glosy.Find(key,i);
    if b and (i>-1) then
    begin
      pom:=GetLineToStr(glosy2[i],2,';');
      glosy.Delete(i);
      glosy2.Delete(i);
      if pom='a' then dec(glosowanie_a) else
      if pom='b' then dec(glosowanie_b) else
      if pom='c' then dec(glosowanie_c) else
      if pom='d' then dec(glosowanie_d);
    end;
    glosy.Add(key);
    glosy2.Add(key+';'+w);
    if w='a' then inc(glosowanie_a) else
    if w='b' then inc(glosowanie_b) else
    if w='c' then inc(glosowanie_c) else
    if w='d' then inc(glosowanie_d);
    ser.SendString('o$'+key+'$zaznaczono$'+w,aSocket);
    glosy_aktualizacja;
  end;
end;

procedure TFServer.SpeedButton5Click(Sender: TObject);
begin
  fEkran.ePub(false);
  g_kolo_1:=false;
  aktywacja_odpowiedzi(false,true);
  t50.Enabled:=true;
end;

procedure TFServer.SpeedButton6Click(Sender: TObject);
begin
  g_kolo_2:=false;
  aktywacja_odpowiedzi(false,true);
  GroupBox4.Enabled:=true;
  BitBtn1.Enabled:=false;
  BitBtn2.Enabled:=true;
  fEkran.ePub(true);
end;

procedure TFServer.SpeedButton7Click(Sender: TObject);
begin
  fEkran.ePub(false);
  g_kolo_3:=false;
  aktywacja_odpowiedzi(false,true);
  GroupBox4.Enabled:=true;
  BitBtn1.Enabled:=true;
  BitBtn2.Enabled:=false;
  fEkran.eCzas30;
end;

procedure TFServer.t50StartTimer(Sender: TObject);
begin
  randomize;
  sound(8);
end;

procedure TFServer.t50Timer(Sender: TObject);
var
  i,a,x: integer;
  s,pom: string;
begin
  t50.Enabled:=false;
  sound(1);
  x:=0;
  s:='';
  for i:=0 to 1 do
  begin
    a:=random(3-i)+1;
    while (a=g_odpowiedz) or (a=x) do inc(a);
    x:=a;
    if a=1 then
    begin
      SpeedButton1.Enabled:=false;
      fEkran.Label_a.Visible:=false;
      fEkran.odp_a.Visible:=false;
      s:=s+'a';
    end else
    if a=2 then
    begin
      SpeedButton2.Enabled:=false;
      fEkran.Label_b.Visible:=false;
      fEkran.odp_b.Visible:=false;
      s:=s+'b';
    end else
    if a=3 then
    begin
      SpeedButton3.Enabled:=false;
      fEkran.Label_c.Visible:=false;
      fEkran.odp_c.Visible:=false;
      s:=s+'c';
    end else
    if a=4 then
    begin
      SpeedButton4.Enabled:=false;
      fEkran.Label_d.Visible:=false;
      fEkran.odp_d.Visible:=false;
      s:=s+'d';
    end;
  end;
  aktywacja_odpowiedzi(true,true);
  g_wylaczenie_odpowiedzi:=s;
  ser.SendString('o$all$offkey$'+s);
  (* wywalenie wszystkich niepasujących zaznaczeń *)
  for i:=glosy2.Count-1 downto 0 do
  begin
    pom:=GetLineToStr(glosy2[i],2,';');
    if pos(pom,s)>0 then
    begin
      glosy.Delete(i);
      glosy2.Delete(i);
      if pom='a' then dec(glosowanie_a) else
      if pom='b' then dec(glosowanie_b) else
      if pom='c' then dec(glosowanie_c) else
      if pom='d' then dec(glosowanie_d);
      glosy_aktualizacja;
    end;
  end;
end;

procedure TFServer.tGraTimer(Sender: TObject);
begin
  lTryb.Caption:=IntToStr(TRYB);
  //lTryb.Caption:=IntToStr(g_pytanie);
end;

procedure TFServer.tSerTimer(Sender: TObject);
begin
  StatusBar.Panels[0].Text:='Ilość podłączonych klientów: '+IntToStr(ser.Count);
end;

procedure TFServer.tInfoTimer(Sender: TObject);
begin
  tInfo.Enabled:=false;
  ekran_info(0);
end;

procedure TFServer.tTelStartTimer(Sender: TObject);
begin
  zegar.tag:=0;
  zegar.Start;
end;

procedure TFServer.tTelStopTimer(Sender: TObject);
begin
  zegar.Stop;
  zegar.tag:=0;
  GroupBox4.Enabled:=false;
  fEkran.eCzas30(false);
end;

procedure TFServer.tTelTimer(Sender: TObject);
var
  a,b: integer;
begin
  a:=zegar.GetIndexTime;
  b:=abs(30-(a div 1000));
  Label17.Caption:=IntToStr(b)+' sek.';
  fEkran.Label28.Caption:=IntToStr(b);
  if (a>25000) and (zegar.Tag=0) then
  begin
    zegar.Tag:=1;
    sound(7);
  end else
  if a>30000 then
  begin
    tTel.Enabled:=false;
    sound(1);
    aktywacja_odpowiedzi(true,true);
  end;
end;

procedure TFServer.music(aNr: integer);
var
  mem: TMemoryStream;
  res: TResourceStream;
begin
  try
    mem:=TMemoryStream.Create;
    case aNr of
      0: res:=TResourceStream.Create(hInstance,'PODSTAWA',RT_RCDATA);
      1: res:=TResourceStream.Create(hInstance,'PYTANIE1',RT_RCDATA);
      2: res:=TResourceStream.Create(hInstance,'PYTANIE2',RT_RCDATA);
      3: res:=TResourceStream.Create(hInstance,'PYTANIE3',RT_RCDATA);
      4: res:=TResourceStream.Create(hInstance,'WYGRANA',RT_RCDATA);
      5: res:=TResourceStream.Create(hInstance,'WYGRANA2',RT_RCDATA);
      else begin mem.Free; exit; end;
    end;
    mem.LoadFromStream(res);
  finally
    res.Free;
  end;
  player.Stop;
  while player.Busy do application.ProcessMessages;
  player.Start(mem);
end;

procedure TFServer.nomusic;
begin
  player.Stop;
end;

procedure TFServer.sound(aNr: integer; aLoop: boolean; aVolume: integer);
var
  v: double;
  mem: TMemoryStream;
  res: TResourceStream;
begin
  v:=aVolume/100;
  if v>1 then v:=1;
  try
    mem:=TMemoryStream.Create;
    case aNr of
      0: res:=TResourceStream.Create(hInstance,'BEEP',RT_RCDATA);
      1: res:=TResourceStream.Create(hInstance,'BOOM',RT_RCDATA);
      2: res:=TResourceStream.Create(hInstance,'OK',RT_RCDATA);
      3: res:=TResourceStream.Create(hInstance,'ERROR',RT_RCDATA);
      4: res:=TResourceStream.Create(hInstance,'BRAWA',RT_RCDATA);
      5: res:=TResourceStream.Create(hInstance,'BRAWA_MILION',RT_RCDATA);
      6: res:=TResourceStream.Create(hInstance,'PRZEGRANA',RT_RCDATA);
      7: res:=TResourceStream.Create(hInstance,'ZEGAR',RT_RCDATA);
      8: res:=TResourceStream.Create(hInstance,'STRUNA',RT_RCDATA);
      else begin mem.Free; exit; end;
    end;
    mem.LoadFromStream(res);
  finally
    res.Free;
  end;
  if aLoop then
  begin
    Play2.Volume:=v;
    Play2.Stop;
    Play2.Start(mem);
  end else begin
    Play1.Stop;
    Play1.Start(mem);
  end;
end;

procedure TFServer.nosound;
begin
  play2.Stop(true);
end;

procedure TFServer.test(aTryb: integer);
begin
  TRYB:=aTryb;
  if TRYB=1 then fEkran.eTabInfo;
  if (TRYB>=1) and (TRYB<=7) then ekran_info(TRYB-1);
  if TRYB=8 then begin tInfo.Enabled:=false; fEkran.eOff; end;
  (* PYTANIE *)
  if TRYB=9 then
  begin
    ON_pause:=true;
    fEkran.ePytanie;
    ekran_pytanie(g_pytanie);
    TRYB:=10;
    case g_pytanie of
      1..4: music(1);
      5..9: music(2);
      10..12: music(3);
    end;
  end;
  if (TRYB>=10) and (TRYB<=14) then ekran_pytanie(g_pytanie,TRYB-10);
  if TRYB=14 then TRYB:=15;
  if TRYB=15 then
  begin
    if g_pytanie=12 then g_stop:=true;
    case g_odpowiedz of
      1: begin Label3.Color:=clYellow; Label4.Color:=clYellow; end;
      2: begin Label5.Color:=clYellow; Label6.Color:=clYellow; end;
      3: begin Label7.Color:=clYellow; Label8.Color:=clYellow; end;
      4: begin Label9.Color:=clYellow; Label10.Color:=clYellow; end;
    end;
    aktywacja_odpowiedzi(true);
  end;
  if TRYB=16 then
  begin
    ser.SendString('o$all$godeactive');
    ON_pause:=true;
    if g_udzielona_odpowiedz=g_odpowiedz then
    begin
      dm.oblicz_wygrana(g_pytanie,true,g_wygrana,g_wygrana_gwarantowana);
      sound(2);
      music;
    end else begin
      g_stop:=true;
      dm.oblicz_wygrana(g_pytanie,false,g_wygrana,g_wygrana_gwarantowana);
      case g_udzielona_odpowiedz of
        1: fEkran.Panel1.Color:=clRed;
        2: fEkran.Panel2.Color:=clRed;
        3: fEkran.Panel3.Color:=clRed;
        4: fEkran.Panel4.Color:=clRed;
      end;
      case g_odpowiedz of
        1: fEkran.Panel1.Color:=CL_ZAZNACZENIE;
        2: fEkran.Panel2.Color:=CL_ZAZNACZENIE;
        3: fEkran.Panel3.Color:=CL_ZAZNACZENIE;
        4: fEkran.Panel4.Color:=CL_ZAZNACZENIE;
      end;
      case g_odpowiedz of
        1: fEkran.odp_a.Font.Color:=clBlack;
        2: fEkran.odp_b.Font.Color:=clBlack;
        3: fEkran.odp_c.Font.Color:=clBlack;
        4: fEkran.odp_d.Font.Color:=clBlack;
      end;
      sound(3);
      music;
    end;
    //if g_stop then ON_pause:=false else TRYB:=17;
    if g_stop then TRYB:=20 else TRYB:=17;
    g_blokada_glosowania:=false;
    g_wylaczenie_odpowiedzi:='';
    glosy_clear;
    ser.SendString('o$all$clear');
  end;
  if TRYB=17 then
  begin
    Label14.Caption:=FormatFloat('### ### ##0',g_wygrana)+' zł.';
    Label16.Caption:=FormatFloat('### ### ##0',g_wygrana_gwarantowana)+' zł.';
    fEkran.ePodsumowanie(g_wygrana);
    ON_pause:=false;
  end;
  if TRYB=18 then fEkran.eOff;
  if TRYB=19 then
  begin
    fEkran.eTabInfo;
    case g_pytanie of
       1: fEkran.Shape1.Visible:=true;
       2: fEkran.Shape2.Visible:=true;
       3: fEkran.Shape3.Visible:=true;
       4: fEkran.Shape4.Visible:=true;
       5: fEkran.Shape5.Visible:=true;
       6: fEkran.Shape6.Visible:=true;
       7: fEkran.Shape7.Visible:=true;
       8: fEkran.Shape8.Visible:=true;
       9: fEkran.Shape9.Visible:=true;
      10: fEkran.Shape10.Visible:=true;
      11: fEkran.Shape11.Visible:=true;
      12: fEkran.Shape12.Visible:=true;
    end;
    fEkran.x1.Visible:=not g_kolo_1;
    fEkran.x2.Visible:=not g_kolo_2;
    fEkran.x3.Visible:=not g_kolo_3;
  end;
  if TRYB=20 then
  begin
    Label14.Caption:=FormatFloat('### ### ##0',g_wygrana)+' zł.';
    Label16.Caption:=FormatFloat('### ### ##0',g_wygrana_gwarantowana)+' zł.';
    fEkran.ePodsumowanie(g_wygrana,true);
    if g_wygrana=1000000 then sound(5) else
    if g_wygrana=0 then sound(6) else sound(4);
    if g_wygrana=1000000 then music(5) else music(4);
    ON_pause:=false;
  end;
  if TRYB=21 then fEkran.eOff;
  (* informacja *)
  i0.Font.Bold:=TRYB=0;
  i1.Font.Bold:=TRYB=1;
  i2.Font.Bold:=TRYB=2;
  i3.Font.Bold:=TRYB=3;
  i4.Font.Bold:=TRYB=4;
  i5.Font.Bold:=TRYB=5;
  i6.Font.Bold:=TRYB=6;
  i7.Font.Bold:=TRYB=7;
  i8.Font.Bold:=TRYB=8;
  i9.Font.Bold:=TRYB=9;
  i10.Font.Bold:=TRYB=10;
  i11.Font.Bold:=TRYB=11;
  i12.Font.Bold:=TRYB=12;
  i13.Font.Bold:=TRYB=13;
  i14.Font.Bold:=TRYB=14;
  i15.Font.Bold:=TRYB=15;
  i16.Font.Bold:=TRYB=16;
  i17.Font.Bold:=TRYB=17;
  i18.Font.Bold:=TRYB=18;
  i19.Font.Bold:=TRYB=19;
  i20.Font.Bold:=TRYB=20;
  i21.Font.Bold:=TRYB=21;
end;

procedure TFServer.ekran_info(aLp: integer);
begin
  fEkran.Shape2.Visible:=aLp=1;
  fEkran.Shape7.Visible:=aLp=2;
  fEkran.Shape12.Visible:=aLp=3;
  fEkran.Shape21.Visible:=aLp=4;
  fEkran.Shape22.Visible:=aLp=5;
  fEkran.Shape23.Visible:=aLp=6;
  tInfo.Enabled:=false;
  tInfo.Enabled:=true;
  if aLp>0 then sound;
end;

procedure TFServer.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  dm.db_close;
  player.stop(true);
  play1.Stop(true);
  play2.Stop(true);
  sleep(500);
end;

procedure TFServer.CheckBox1Change(Sender: TObject);
begin
  ON_ekran:=CheckBox1.Checked;
  if ON_ekran then fEkran.Show else fEkran.Hide;
end;

procedure TFServer.ButtOdpNow(Sender: TObject);
begin
  zaznacz_odpowiedz(TSpeedButton(Sender).Tag);
end;

procedure TFServer.BitBtn1Click(Sender: TObject);
begin
  BitBtn1.Enabled:=false;
  BitBtn2.Enabled:=true;
  tTel.Enabled:=true;
end;

procedure TFServer.BitBtn2Click(Sender: TObject);
begin
  if tTel.Enabled then tTel.Enabled:=false else
  begin
    sound(1);
    g_blokada_glosowania:=true;
    ser.SendString('o$all$goblock');
    fEkran.gl1.Progress:=gl1.Progress;
    fEkran.gl2.Progress:=gl2.Progress;
    fEkran.gl3.Progress:=gl3.Progress;
    fEkran.gl4.Progress:=gl4.Progress;
  end;
  aktywacja_odpowiedzi(true,true);
end;

procedure TFServer.CheckBox2Change(Sender: TObject);
begin
  ON_gra:=CheckBox2.Checked;
  if ON_gra then
  begin
    TRYB:=0;
    fEkran.eOff;
    g_pytanie:=1;
    g_odpowiedz:=0;
    music;
  end else begin
    play1.Stop;
    play2.Stop;
    nomusic;
  end;
  tGra.Enabled:=ON_gra;
end;

procedure TFServer.ekran_pytanie(aNr: integer; aLp: integer);
begin
  if aLp=-1 then
  begin
    fEkran.pytanie.Visible:=false;
    fEkran.Label_a.Visible:=false;
    fEkran.Label_b.Visible:=false;
    fEkran.Label_c.Visible:=false;
    fEkran.Label_d.Visible:=false;
    fEkran.odp_a.Visible:=false;
    fEkran.odp_b.Visible:=false;
    fEkran.odp_c.Visible:=false;
    fEkran.odp_d.Visible:=false;
    db_pytanie.ParamByName('id').AsInteger:=aNr;
    db_pytanie.Open;
    fEkran.pytanie.Caption:=db_pytaniepytanie.AsString;
    fEkran.odp_a.Caption:=db_pytanieodp_1.AsString;
    fEkran.odp_b.Caption:=db_pytanieodp_2.AsString;
    fEkran.odp_c.Caption:=db_pytanieodp_3.AsString;
    fEkran.odp_d.Caption:=db_pytanieodp_4.AsString;
    g_odpowiedz:=db_pytanieodpowiedz.AsInteger;
    db_pytanie.Close;
    fEkran.odp_a.Font.Color:=clWhite;
    fEkran.odp_b.Font.Color:=clWhite;
    fEkran.odp_c.Font.Color:=clWhite;
    fEkran.odp_d.Font.Color:=clWhite;
    fEkran.Panel1.Color:=clBlue;
    fEkran.Panel2.Color:=clBlue;
    fEkran.Panel3.Color:=clBlue;
    fEkran.Panel4.Color:=clBlue;
    (* na panelu sterującym *)
    Label2.Color:=clNone;
    Label3.Color:=clNone;
    Label4.Color:=clNone;
    Label5.Color:=clNone;
    Label6.Color:=clNone;
    Label7.Color:=clNone;
    Label8.Color:=clNone;
    Label9.Color:=clNone;
    Label10.Color:=clNone;
    Label2.Caption:='';
    Label4.Caption:='';
    Label6.Caption:='';
    Label8.Caption:='';
    Label10.Caption:='';
  end else begin
    case aLp of
      0: fEkran.pytanie.Visible:=true;
      1: fEkran.odp_a.Visible:=true;
      2: fEkran.odp_b.Visible:=true;
      3: fEkran.odp_c.Visible:=true;
      4: fEkran.odp_d.Visible:=true;
    end;
    fEkran.Label_a.Visible:=fEkran.odp_a.Visible;
    fEkran.Label_b.Visible:=fEkran.odp_b.Visible;
    fEkran.Label_c.Visible:=fEkran.odp_c.Visible;
    fEkran.Label_d.Visible:=fEkran.odp_d.Visible;
    (* na panelu sterującym *)
    case aLp of
      0: Label2.Caption:=fEkran.pytanie.Caption;
      1: Label4.Caption:=fEkran.odp_a.Caption;
      2: Label6.Caption:=fEkran.odp_b.Caption;
      3: Label8.Caption:=fEkran.odp_c.Caption;
      4: Label10.Caption:=fEkran.odp_d.Caption;
    end;
    (* wysłanie do klientów sieciowych *)
    case aLp of
      0: ser.SendString('o$all$title$'+fEkran.pytanie.Caption);
      1: ser.SendString('o$all$odpa$'+fEkran.odp_a.Caption);
      2: ser.SendString('o$all$odpb$'+fEkran.odp_b.Caption);
      3: ser.SendString('o$all$odpc$'+fEkran.odp_c.Caption);
      4: ser.SendString('o$all$odpd$'+fEkran.odp_d.Caption);
    end;
    ON_pause:=false;
  end;
end;

procedure TFServer.okno_config;
begin
  FKonfiguracja:=TFKonfiguracja.Create(self);
  FKonfiguracja.ShowModal;
end;

procedure TFServer.aktywacja_odpowiedzi(b: boolean; aIgnoreServ: boolean);
begin
  ON_pause:=b;
  SpeedButton1.Enabled:=b and fEkran.odp_a.Visible;
  SpeedButton2.Enabled:=b and fEkran.odp_b.Visible;
  SpeedButton3.Enabled:=b and fEkran.odp_c.Visible;
  SpeedButton4.Enabled:=b and fEkran.odp_d.Visible;
  SpeedButton5.Enabled:=b and g_kolo_1;
  SpeedButton6.Enabled:=b and g_kolo_2;
  SpeedButton7.Enabled:=b and g_kolo_3;
  if b and (not aIgnoreServ) then ser.SendString('o$all$goactive');
end;

procedure TFServer.zaznacz_odpowiedz(aNr: integer);
var
  s: string;
begin
  aktywacja_odpowiedzi(false);
  g_udzielona_odpowiedz:=aNr;
  if aNr=g_odpowiedz then
  begin
    s:=' - dobrze';
    Label12.Font.Color:=clBlue;
  end else begin
    s:=' - źle';
    Label12.Font.Color:=clRed;
  end;
  case aNr of
    1: Label12.Caption:='A'+s;
    2: Label12.Caption:='B'+s;
    3: Label12.Caption:='C'+s;
    4: Label12.Caption:='D'+s;
  end;
  case aNr of
    1: fEkran.Panel1.Color:=CL_ZAZNACZENIE;
    2: fEkran.Panel2.Color:=CL_ZAZNACZENIE;
    3: fEkran.Panel3.Color:=CL_ZAZNACZENIE;
    4: fEkran.Panel4.Color:=CL_ZAZNACZENIE;
  end;
  case aNr of
    1: fEkran.odp_a.Font.Color:=clBlack;
    2: fEkran.odp_b.Font.Color:=clBlack;
    3: fEkran.odp_c.Font.Color:=clBlack;
    4: fEkran.odp_d.Font.Color:=clBlack;
  end;
end;

procedure TFServer.glosy_wyniki(var a, b, c, d: integer);
var
  w: integer;
begin
  w:=glosowanie_a+glosowanie_b+glosowanie_c+glosowanie_d;
  a:=round(100*glosowanie_a/w);
  b:=round(100*glosowanie_b/w);
  c:=round(100*glosowanie_c/w);
  d:=round(100*glosowanie_d/w);
end;

procedure TFServer.glosy_aktualizacja;
var
  a,b,c,d: integer;
begin
  glosy_wyniki(a,b,c,d);
  gl1.Progress:=a;
  gl2.Progress:=b;
  gl3.Progress:=c;
  gl4.Progress:=d;
end;

procedure TFServer.glosy_clear;
begin
  glosy.Clear;
  glosy2.Clear;
  glosowanie_a:=0;
  glosowanie_b:=0;
  glosowanie_c:=0;
  glosowanie_d:=0;
  gl1.Progress:=0;
  gl2.Progress:=0;
  gl3.Progress:=0;
  gl4.Progress:=0;
end;

procedure TFServer.synchronizuj(aKey: string; aSocket: TLSocket);
var
  s: string;
  t,a,b,c,d,p,z,bg: string;
  bb: boolean;
  ii: integer;
begin
  z:='';
  t:='';
  a:='';
  b:='';
  c:='';
  d:='';
  p:='0';
  case TRYB of
    10: t:=fEkran.pytanie.Caption;
    11: begin
          t:=fEkran.pytanie.Caption;
          a:=fEkran.odp_a.Caption;
        end;
    12: begin
          t:=fEkran.pytanie.Caption;
          a:=fEkran.odp_a.Caption;
          b:=fEkran.odp_b.Caption;
        end;
    13: begin
          t:=fEkran.pytanie.Caption;
          a:=fEkran.odp_a.Caption;
          b:=fEkran.odp_b.Caption;
          c:=fEkran.odp_c.Caption;
        end;
    14,15: begin
             t:=fEkran.pytanie.Caption;
             a:=fEkran.odp_a.Caption;
             b:=fEkran.odp_b.Caption;
             c:=fEkran.odp_c.Caption;
             d:=fEkran.odp_d.Caption;
             p:='1'
           end;
  end;
  if (TRYB>=14) and (TRYB<=15) then
  begin
    bb:=glosy.Find(aKey,ii);
    if bb and (ii>-1) then z:=GetLineToStr(glosy2[ii],2,';');
  end;
  if g_blokada_glosowania then bg:='1' else bg:='0';
  s:=t+'$'+a+'$'+b+'$'+c+'$'+d+'$'+p+'$'+z+'$'+bg+'$'+g_wylaczenie_odpowiedzi;
  ser.SendString('o$'+aKey+'$synchronizacja$'+s,aSocket);
end;

end.

