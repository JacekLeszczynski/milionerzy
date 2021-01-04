unit main;

{$mode objfpc}{$H+}
{ $define DEBUG}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, XMLPropStorage, ComCtrls, Menus, TplGaugeUnit, Presentation,
  UOSEngine, UOSPlayer, LiveTimer, NetSocket, ZDataset, lNet, ueled, pipes, Types;

type

  { TFServer }

  TFServer = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckTest: TCheckBox;
    AlgCompressionSteaming: TComboBox;
    dbpyttrudnosc: TLargeintField;
    dbpytuzyte: TMemoField;
    gl5: TplGauge;
    gl6: TplGauge;
    gl7: TplGauge;
    gl8: TplGauge;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
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
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    PopupMenu1: TPopupMenu;
    ppodsumowanie: TLabel;
    Label_a: TLabel;
    Label_b: TLabel;
    Label_c: TLabel;
    Label_d: TLabel;
    odp_b: TLabel;
    odp_c: TLabel;
    odp_d: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    ppytanie: TLabel;
    odp_a: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    PublicGame: TCheckBox;
    GameLastModePlay: TCheckBox;
    dbpytid: TLargeintField;
    dbpytodpowiedz: TLargeintField;
    dbpytodp_1: TMemoField;
    dbpytodp_2: TMemoField;
    dbpytodp_3: TMemoField;
    dbpytodp_4: TMemoField;
    dbpytpytanie: TMemoField;
    dspyt: TDataSource;
    dbpyt: TZQuery;
    gl2: TplGauge;
    gl3: TplGauge;
    gl4: TplGauge;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
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
    Shape1: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape2: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    StatusBar: TStatusBar;
    todpowiedz: TTimer;
    tpings: TTimer;
    tSer: TTimer;
    uELED1: TuELED;
    led_null_screen: TuELED;
    led_rozgrywka: TuELED;
    uELED10: TuELED;
    uELED11: TuELED;
    uELED12: TuELED;
    uELED13: TuELED;
    uELED14: TuELED;
    uELED15: TuELED;
    uELED16: TuELED;
    uELED2: TuELED;
    uELED3: TuELED;
    uELED4: TuELED;
    uELED5: TuELED;
    uELED6: TuELED;
    uELED7: TuELED;
    uELED8: TuELED;
    uELED9: TuELED;
    x1: TLabel;
    x2: TLabel;
    x3: TLabel;
    zegar: TLiveTimer;
    lInfo: TLabel;
    Panel1: TPanel;
    play2: TUOSPlayer;
    player: TUOSPlayer;
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
    procedure AlgCompressionSteamingChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ButtOdpNow(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      ARect: TRect; State: TOwnerDrawState);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure serCryptString(var aText: string);
    procedure serDecryptString(var aText: string);
    procedure serReceiveString(aMsg: string; aSocket: TLSocket);
    procedure serStatus(aActive, aCrypt: boolean);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure t50StartTimer(Sender: TObject);
    procedure t50Timer(Sender: TObject);
    procedure tGraTimer(Sender: TObject);
    procedure todpowiedzTimer(Sender: TObject);
    procedure tpingsTimer(Sender: TObject);
    procedure tSerTimer(Sender: TObject);
    procedure tInfoTimer(Sender: TObject);
    procedure tTelStartTimer(Sender: TObject);
    procedure tTelStopTimer(Sender: TObject);
    procedure tTelTimer(Sender: TObject);
    procedure uELED1Click(Sender: TObject);
  private
    nasluch: boolean;
    mic,glosnik: TUOSPlayer;
    sesje,nazwy,glosy,glosy2: TStringList;
    sokety: TList;
    key_muse: string;
    soket_muse: TLSocket;
    muse_full: TMemoryStream;
    muse_in,muse2_in: TOutputPipeStream;
    muse_out,muse2_out: TInputPipeStream;
    muse_on: boolean;
    mmmm: TMemoryStream;
    procedure wybor_gracza;
    procedure wProcessMessage;
    procedure eOff;
    procedure ePytanie;
    procedure eTabInfo;
    procedure ePodsumowanie(aKwota: integer; aKoniec: boolean = false);
    procedure eCzas30(aPokaz: boolean = true);
    procedure ePub(aPokaz: boolean = true);
    procedure _get_var_1(var aTryb,aGPytanie: integer; var aOnPause,aGStop: boolean);
    procedure _set_g_pytanie(aGPytanie: integer);
    procedure music(aNr: integer = 0);
    procedure nomusic;
    procedure sound(aNr: integer = 0; aLoop: boolean = false; aVolume: integer = 100);
    procedure nosound;
    procedure synchronizuj(aSocket: TLSocket; const aKey: string);
    procedure test(aTryb: integer; aZmiana: boolean = false);
    procedure test_info(aPytanie: integer);
    procedure ekran_info(aLp: integer = 0);
    procedure ekran_pytanie(aNr: integer; aLp: integer = -1);
    procedure okno_config;
    procedure zysk_i_strata;
    procedure aktywacja_odpowiedzi(b: boolean; aIgnoreServ: boolean = false);
    procedure zaznacz_odpowiedz(aNr: integer);
    procedure glosy_wyniki(var a,b,c,d: integer);
    procedure glosy_aktualizacja;
    procedure glosy_clear;
    procedure users_add(const aImie,aKey: string);
    procedure users_edit(const aImie,aKey: string);
    procedure pings_add(const aKey: string);
    function user2key(aItemIndex: integer; var aKey: string): boolean;
    function user2socket(aItemIndex: integer; var aImie, aKey: string; var aSocket: TLSocket): boolean;
    function user2socket(aItemIndex: integer; var aSocket: TLSocket): boolean;
    function user2socket(aKey: string; var aSocket: TLSocket): boolean;
    function user2send(aItemIndex: integer; const aStr: string): boolean;
    function user2send(aItemIndex: integer; const aStr: string; var aSocket: TLSocket): boolean;
    function user2send(aItemIndex: integer; const aStr: string; var aKey: string; var aSocket: TLSocket): boolean;
    function user2disconnect(aItemIndex: integer): boolean;
    procedure odpowiedz(aStr: string);
    procedure przelicz;
    procedure wyslij_liste_graczy(aSynchronizacja: boolean = false);
  public

  end;

var
  FServer: TFServer;

implementation

uses
  ecode, serwis, config, lcltype, ekran, urzadzenia;

{$R *.lfm}

{ TFServer }

procedure TFServer.FormCreate(Sender: TObject);
begin
  randomize;
  mmmm:=TMemoryStream.Create;
  sesje:=TStringList.Create;
  sokety:=TList.Create;
  nazwy:=TStringList.Create;
  glosy:=TStringList.Create;
  glosy.Sorted:=true;
  glosy2:=TStringList.Create;
  glosy2.Sorted:=true;
  nasluch:=false;
  muse_on:=false;
  //imie_muse:='';
  key_muse:='';
  SetConfDir('milionerzy');
  uos.LibDirectory:=MyDir('uos');
  uos.LoadLibrary;
  dm:=Tdm.Create(self);
  fEkran:=TfEkran.Create(self);
  dm.db.Database:=MyConfDir('db.sqlite');
  dm.db_open;
  uu:=Tuu.Create(self);
  uu.OnMilionerzyTest:=@test;
  uu.OnMilionerzyVar:=@_get_var_1;
  uu.OnMilionerzySetGPytanie:=@_set_g_pytanie;
  ps.FileName:=MyConfDir('server.xml');
  ps.Active:=true;
end;

procedure TFServer.FormDestroy(Sender: TObject);
begin
  mmmm.Free;
  if nasluch then
  begin
    mic.Free;
    glosnik.Free;
  end;
  sesje.Free;
  sokety.Free;
  nazwy.Free;
  glosy.Free;
  glosy2.Free;
  dm.Free;
  uu.Free;
  fEkran.Free;
  uos.UnLoadLibrary;
end;

procedure TFServer.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  case Key of
    VK_F9: okno_config;
    else if CheckBox4.Checked then uu.mpilot.Execute(Key) else uu.ytplayer.Execute(Key);
  end;
  Key:=0;
end;

procedure TFServer.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  ARect: TRect; State: TOwnerDrawState);
var
  a: integer;
  s,key: string;
begin
  user2key(Index,key);
  if key=g_przyjaciel_key then ListBox1.Canvas.Font.Color:=clGreen else
  if key=g_gracz_key then ListBox1.Canvas.Font.Color:=clBlue else
  ListBox1.Canvas.Font.Color:=clBlack;
  a:=StringToItemIndex(ListBox2.Items,ListBox1.Items[Index]);
  if a>-1 then ListBox1.Canvas.Font.Bold:=true else ListBox1.Canvas.Font.Bold:=false;
  ListBox1.Canvas.TextOut(ARect.Left+4,ARect.Top+4,ListBox1.Items[Index]);
end;

procedure TFServer.MenuItem1Click(Sender: TObject);
begin
  user2send(ListBox1.ItemIndex,'ping');
end;

procedure TFServer.MenuItem2Click(Sender: TObject);
begin
  user2disconnect(ListBox1.ItemIndex);
end;

procedure TFServer.MenuItem5Click(Sender: TObject);
begin
  if user2key(ListBox1.ItemIndex,g_gracz_key) then
  begin
    ListBox1.Repaint;
    MenuItem5.Enabled:=false;
    StatusBar.Panels[1].Text:='';
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
  s,s1,key,nkey,kom,w,w1,w2,pom,pom2,s3: string;
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
  {$IFDEF DEBUG} writeln('server.ramka: ',s); {$ENDIF}
  s1:=GetLineToStr(s,1,'$');
  if s1<>'c' then exit;
  key:=GetLineToStr(s,2,'$');
  kom:=GetLineToStr(s,3,'$');
  (* rejestracja lub logowanie *)
  if (key='new') and (kom='register') then
  begin
    pom:=GetLineToStr(s,4,'$');
    key:=ser.GetGUID;
    sesje.Add(key);
    sokety.Add(aSocket);
    nazwy.Add(pom);
    users_add(pom,key);
    ser.SendString('o$new$register$'+key,aSocket);
    synchronizuj(aSocket,key);
  end else
  if kom='login' then
  begin
    pom:=GetLineToStr(s,4,'$');
    i:=StringToItemIndex(sesje,key);
    if i>-1 then
    begin
      sokety[i]:=aSocket;
      nazwy.Delete(i);
      nazwy.Insert(i,pom);
      users_edit(pom,key);
      ser.SendString('o$'+key+'$ok',aSocket);
    end else begin
      nkey:=ser.GetGUID;
      sesje.Add(nkey);
      sokety.Add(aSocket);
      nazwy.Add(pom);
      users_add(pom,nkey);
      ser.SendString('o$'+key+'$register$'+nkey,aSocket);
      key:=nkey;
    end;
    synchronizuj(aSocket,key);
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
  end else if kom='ping' then pings_add(key) else
  if kom='przyjaciel' then
  begin
    g_przyjaciel_key:=GetLineToStr(s,4,'$');
    ListBox1.Repaint;
    BitBtn1.Enabled:=true;
  end else
  if kom='przyjacielodpowiada' then
  begin
    w1:=GetLineToStr(s,4,'$');
    w2:=GetLineToStr(s,5,'$');
    ser.SendString('o$all$przyjacielodpowiada$'+w1+'$'+w2);
    s3:='000';
    if w2='0' then begin s3[1]:='0'; s3[2]:='0'; s3[3]:='0'; end else
    if w2='1' then begin s3[1]:='1'; s3[2]:='0'; s3[3]:='0'; end else
    if w2='2' then begin s3[1]:='1'; s3[2]:='1'; s3[3]:='0'; end else
    begin s3[1]:='1'; s3[2]:='1'; s3[3]:='1'; end;
    if w1='1' then
    begin
      uELED7.Active:=s3[1]='1';
      uELED6.Active:=s3[2]='1';
      uELED5.Active:=s3[3]='1';
      fEkran.uELED19.Active:=uEled7.Active;
      fEkran.uELED20.Active:=uEled6.Active;
      fEkran.uELED21.Active:=uEled5.Active;
    end else
    if w1='2' then
    begin
      uELED8.Active:=s3[1]='1';
      uELED9.Active:=s3[2]='1';
      uELED10.Active:=s3[3]='1';
      fEkran.uELED22.Active:=uEled8.Active;
      fEkran.uELED23.Active:=uEled9.Active;
      fEkran.uELED24.Active:=uEled10.Active;
    end else
    if w1='3' then
    begin
      uELED11.Active:=s3[1]='1';
      uELED12.Active:=s3[2]='1';
      uELED13.Active:=s3[3]='1';
      fEkran.uELED25.Active:=uEled11.Active;
      fEkran.uELED26.Active:=uEled12.Active;
      fEkran.uELED27.Active:=uEled13.Active;
    end else
    if w1='4' then
    begin
      uELED14.Active:=s3[1]='1';
      uELED15.Active:=s3[2]='1';
      uELED16.Active:=s3[3]='1';
      fEkran.uELED28.Active:=uEled14.Active;
      fEkran.uELED29.Active:=uEled15.Active;
      fEkran.uELED30.Active:=uEled16.Active;
    end;
  end;
end;

procedure TFServer.serStatus(aActive, aCrypt: boolean);
begin
  if aCrypt then uELED1.Color:=clRed else uELED1.Color:=clGreen;
  uELED1.Active:=aActive;
end;

procedure TFServer.SpeedButton5Click(Sender: TObject);
begin
  ePub(false);
  fEkran.ePub(false);
  ser.SendString('o$all$puboff');
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
  ePub(true);
  fEkran.ePub(true);
  ser.SendString('o$all$pubon');
end;

procedure TFServer.SpeedButton7Click(Sender: TObject);
begin
  sound(10);
  ePub(false);
  fEkran.ePub(false);
  ser.SendString('o$all$puboff');
  g_kolo_3:=false;
  aktywacja_odpowiedzi(false,true);
  GroupBox4.Enabled:=true;
  BitBtn1.Enabled:=false;
  BitBtn2.Enabled:=false;
  eCzas30;
  fEkran.eCzas30;
  ser.SendString('o$all$telon');
  (* wysyłka podłączonej aktualnie listy graczy *)
  wyslij_liste_graczy;
end;

procedure TFServer.t50StartTimer(Sender: TObject);
begin
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
      Label_a.Visible:=false; fEkran.Label_a.Visible:=false;
      odp_a.Visible:=false; fEkran.odp_a.Visible:=false;
      s:=s+'a';
    end else
    if a=2 then
    begin
      SpeedButton2.Enabled:=false;
      Label_b.Visible:=false; fEkran.Label_b.Visible:=false;
      odp_b.Visible:=false; fEkran.odp_b.Visible:=false;
      s:=s+'b';
    end else
    if a=3 then
    begin
      SpeedButton3.Enabled:=false;
      Label_c.Visible:=false; fEkran.Label_c.Visible:=false;
      odp_c.Visible:=false; fEkran.odp_c.Visible:=false;
      s:=s+'c';
    end else
    if a=4 then
    begin
      SpeedButton4.Enabled:=false;
      Label_d.Visible:=false; fEkran.Label_d.Visible:=false;
      odp_d.Visible:=false; fEkran.odp_d.Visible:=false;
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
  lInfo.Caption:=IntToStr(g_bledy);
  //lInfo.Caption:=IntToStr(TRYB);
  if g_rezygnacja then
  begin
    uELED3.Active:=not uELED3.Active;
    uELED4.Active:=not uELED3.Active;
  end;
end;

var
  komunikacja: array [1..2,1..10] of integer;

procedure TFServer.todpowiedzTimer(Sender: TObject);
begin
  todpowiedz.Enabled:=false;
  StatusBar.Panels[1].Text:='';
end;

procedure TFServer.tpingsTimer(Sender: TObject);
begin
  if ListBox2.Count>0 then ListBox2.Items.Delete(0);
  if ListBox2.Count=0 then tpings.Enabled:=false;
  ListBox1.Repaint;
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
  ser.SendString('o$all$tel30start$'+IntToStr(zegar.GetIndexStartTime));
end;

procedure TFServer.tTelStopTimer(Sender: TObject);
begin
  zegar.Stop;
  zegar.tag:=0;
  GroupBox4.Enabled:=false;
  ser.SendString('o$all$userprzyjacielstop');
  ser.SendString('o$all$tel30stop');
end;

procedure TFServer.tTelTimer(Sender: TObject);
var
  a,b: integer;
begin
  a:=zegar.GetIndexTime;
  b:=abs(30-(a div 1000));
  Label17.Caption:=IntToStr(b)+' sek.';
  Label77.Caption:=IntToStr(b);
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

procedure TFServer.uELED1Click(Sender: TObject);
begin
  if ser.Active then ser.Disconnect else ser.Connect;
end;

procedure TFServer.wybor_gracza;
begin
  StatusBar.Panels[1].Text:='Status: WYBOR GRACZA';
end;

procedure TFServer.wProcessMessage;
begin
  application.ProcessMessages;
end;

procedure TFServer.eOff;
begin
  Panel4.Visible:=false;
  Panel3.Visible:=false;
  Panel10.Visible:=false;
  Panel12.Visible:=false;
end;

procedure TFServer.ePytanie;
begin
  eOff;
  Panel4.Visible:=true;
  ppytanie.Visible:=false;
  Label_a.Visible:=false;
  Label_b.Visible:=false;
  Label_c.Visible:=false;
  Label_d.Visible:=false;
  odp_a.Visible:=false;
  odp_b.Visible:=false;
  odp_c.Visible:=false;
  odp_d.Visible:=false;
end;

procedure TFServer.eTabInfo;
begin
  eOff;
  Panel3.Visible:=true;
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

procedure TFServer.ePodsumowanie(aKwota: integer; aKoniec: boolean);
var
  s: string;
begin
  eOff;
  if aKoniec then s:='Na koncie: ' else s:='';
  Panel10.Visible:=true;
  ppodsumowanie.Caption:=s+SpacesToPoints(FormatFloat('### ### ##0',aKwota))+' '+CL_DIAMENT;
end;

procedure TFServer.eCzas30(aPokaz: boolean);
begin
  Panel14.Visible:=aPokaz;
end;

procedure TFServer.ePub(aPokaz: boolean);
begin
  Panel12.Visible:=aPokaz;
end;

procedure TFServer._get_var_1(var aTryb, aGPytanie: integer; var aOnPause,
  aGStop: boolean);
begin
  aTryb:=TRYB;
  aGPytanie:=g_pytanie;
  aOnPause:=ON_pause;
  aGStop:=g_stop;
end;

procedure TFServer._set_g_pytanie(aGPytanie: integer);
begin
  g_pytanie:=aGPytanie;
end;

procedure TFServer.music(aNr: integer);
var
  mem: TMemoryStream;
  res: TResourceStream;
begin
  try
    mem:=TMemoryStream.Create;
    case aNr of
       0: res:=TResourceStream.Create(hInstance,'M_PODSTAWA',RT_RCDATA);
       1: res:=TResourceStream.Create(hInstance,'M_PYTANIE1',RT_RCDATA);
       2: res:=TResourceStream.Create(hInstance,'M_PYTANIE2',RT_RCDATA);
       3: res:=TResourceStream.Create(hInstance,'M_PYTANIE3',RT_RCDATA);
       4: res:=TResourceStream.Create(hInstance,'M_WYGRANA',RT_RCDATA);
       5: res:=TResourceStream.Create(hInstance,'M_WYGRANA2',RT_RCDATA);
      11: res:=TResourceStream.Create(hInstance,'M_MUSIC01',RT_RCDATA);
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
       2: res:=TResourceStream.Create(hInstance,'BRAWA1',RT_RCDATA);
       3: res:=TResourceStream.Create(hInstance,'ERROR',RT_RCDATA);
       4: res:=TResourceStream.Create(hInstance,'BRAWA2',RT_RCDATA);
       5: res:=TResourceStream.Create(hInstance,'BRAWA3',RT_RCDATA);
       //6: res:=TResourceStream.Create(hInstance,'PRZEGRANA',RT_RCDATA);
       7: res:=TResourceStream.Create(hInstance,'ZEGAR',RT_RCDATA);
       8: res:=TResourceStream.Create(hInstance,'UWAGA',RT_RCDATA);
       9: res:=TResourceStream.Create(hInstance,'CHOR',RT_RCDATA);
      10: res:=TResourceStream.Create(hInstance,'KOLO_TELEFON',RT_RCDATA);
      11: res:=TResourceStream.Create(hInstance,'UDZIELONA_ODPOWIEDZ',RT_RCDATA); //GONG
      12: res:=TResourceStream.Create(hInstance,'WYGRANA',RT_RCDATA);
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

procedure TFServer.synchronizuj(aSocket: TLSocket; const aKey: string);
var
  s: string;
  s0,s1,s2,s3,s4: string;
  s5,s6: string;
  uo,o,ok,glos,aks,czy_blad: string;
  b: boolean;
  a: integer;
begin
  s0:=ppytanie.Caption;
  s1:=odp_a.Caption;
  s2:=odp_b.Caption;
  s3:=odp_c.Caption;
  s4:=odp_d.Caption;
  uo:=IntToStr(g_udzielona_odpowiedz);
  o:=IntToStr(g_odpowiedz);
  s5:=ppodsumowanie.Caption;
  s6:='000';
  if g_kolo_1 then s6[1]:='1';
  if g_kolo_2 then s6[2]:='1';
  if g_kolo_3 then s6[3]:='1';
  ok:='';
  if TRYB=15 then
  begin
    if not odp_a.Visible then ok:='a';
    if not odp_b.Visible then ok:=ok+'b';
    if not odp_c.Visible then ok:=ok+'c';
    if not odp_d.Visible then ok:=ok+'d';
  end;
  glos:='';
  b:=glosy.Find(aKey,a);
  if b and (a>-1) then glos:=GetLineToStr(glosy2[a],2,';');
  case AlgCompressionSteaming.ItemIndex of
    0: aks:='none';
    1: aks:='deflate';
    2: aks:='lzbrrc';
    3: aks:='brrc';
  end;
  if g_blad then czy_blad:='1' else czy_blad:='0';
  s:=IntToStr(TRYB)+'$'+IntToStr(g_pytanie)+'$'+s0+'$'+s1+'$'+s2+'$'+s3+'$'+s4+'$'+uo+'$'+o+'$'+s5+'$'+s6+'$'+ok+'$'+glos+'$'+aks+'$'+IntToStr(g_bledy)+'$'+czy_blad;
  ser.SendString('o$'+aKey+'$synchronizacja$'+s,aSocket);
  if TRYB=15 then
  begin
    (* telefon do przyjaciela *)
    if Panel14.Visible then
    begin
      ser.SendString('o$all$telon');
      if g_przyjaciel_key='' then if aKey=g_gracz_key then wyslij_liste_graczy;
      if tTel.Enabled then
      begin
        if aKey=g_gracz_key then ser.SendString('o$'+aKey+'$userblock',aSocket);
        if aKey=g_przyjaciel_key then ser.SendString('o$'+aKey+'$userprzyjacielstart',aSocket);
        ser.SendString('o$'+aKey+'$tel30start$'+IntToStr(zegar.GetIndexStartTime),aSocket);
        if aKey=g_przyjaciel_key then
        begin
          s:='0000';
          if uELED7.Active then s[1]:='1';
          if uELED6.Active then s[1]:='2';
          if uELED5.Active then s[1]:='3';
          if uELED8.Active then s[2]:='1';
          if uELED9.Active then s[2]:='2';
          if uELED10.Active then s[2]:='3';
          if uELED11.Active then s[3]:='1';
          if uELED12.Active then s[3]:='2';
          if uELED13.Active then s[3]:='3';
          if uELED14.Active then s[4]:='1';
          if uELED15.Active then s[4]:='2';
          if uELED16.Active then s[4]:='3';
          ser.SendString('o$'+aKey+'$telupdate$'+s);
        end;
      end;
    end;
  end;
end;

procedure TFServer.test(aTryb: integer; aZmiana: boolean);
var
  s: string;
  a: integer;
begin
  TRYB:=aTryb;
  {* lecimy *}
  if TRYB=1 then
  begin
    //music;
    eTabInfo;
    fEkran.eTabInfo;
    test_info(0);
    ser.SendString('o$all$ogolne$'+IntToStr(TRYB)+'$'+IntToStr(g_pytanie));
  end;
  if (TRYB>=1) and (TRYB<=7) then
  begin
    ekran_info(TRYB-1);
    ser.SendString('o$all$ogolne$'+IntToStr(TRYB)+'$'+IntToStr(g_pytanie));
  end;
  if TRYB=8 then
  begin
    g_blad:=false;
    tInfo.Enabled:=false; eOff; fEkran.eOff;
    ser.SendString('o$all$ogolne$'+IntToStr(TRYB)+'$'+IntToStr(g_pytanie));
  end;
  (* PYTANIE *)
  if TRYB=9 then
  begin
    g_odpowiedz:=0;
    g_udzielona_odpowiedz:=0;
    ON_pause:=true;
    ePytanie;
    fEkran.ePytanie;
    ekran_pytanie(g_pytanie);
    ser.SendString('o$all$ogolne$'+IntToStr(TRYB)+'$'+IntToStr(g_pytanie));
    TRYB:=10;
    case g_pytanie of
      1..4: music(1);
      5..9: music(2);
      10..12: music(3);
    end;
  end;
  if TRYB=10 then zysk_i_strata;
  if (TRYB>=10) and (TRYB<=14) then
  begin
    ekran_pytanie(g_pytanie,TRYB-10);
    ser.SendString('o$all$ogolne$'+IntToStr(TRYB)+'$'+IntToStr(g_pytanie));
  end;
  if TRYB=14 then
  begin
    ON_pause:=true;
    TRYB:=15;
  end;
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
      if not g_rezygnacja then sound(2);
      music;
    end else begin
      ser.SendString('o$all$ogolne_zaznacz$'+IntToStr(g_odpowiedz)+'$'+IntToStr(g_udzielona_odpowiedz));
      g_stop:=(not GameLastModePlay.Checked) and (not g_rezygnacja);
      if GameLastModePlay.Checked and (not g_rezygnacja) then
      begin
        g_blad:=true;
        inc(g_bledy);
      end;
      dm.oblicz_wygrana(g_pytanie,GameLastModePlay.Checked or g_rezygnacja,g_wygrana,g_wygrana_gwarantowana);
      case g_udzielona_odpowiedz of
        1: begin Panel6.Color:=clRed; fEkran.Panel1.Color:=clRed; end;
        2: begin Panel7.Color:=clRed; fEkran.Panel2.Color:=clRed; end;
        3: begin Panel8.Color:=clRed; fEkran.Panel3.Color:=clRed; end;
        4: begin Panel9.Color:=clRed; fEkran.Panel4.Color:=clRed; end;
      end;
      case g_odpowiedz of
        1: begin Panel6.Color:=CL_ZAZNACZENIE; fEkran.Panel1.Color:=CL_ZAZNACZENIE; end;
        2: begin Panel7.Color:=CL_ZAZNACZENIE; fEkran.Panel2.Color:=CL_ZAZNACZENIE; end;
        3: begin Panel8.Color:=CL_ZAZNACZENIE; fEkran.Panel3.Color:=CL_ZAZNACZENIE; end;
        4: begin Panel9.Color:=CL_ZAZNACZENIE; fEkran.Panel4.Color:=CL_ZAZNACZENIE; end;
      end;
      case g_odpowiedz of
        1: begin odp_a.Font.Color:=clBlack; fEkran.odp_a.Font.Color:=clBlack; end;
        2: begin odp_b.Font.Color:=clBlack; fEkran.odp_b.Font.Color:=clBlack; end;
        3: begin odp_c.Font.Color:=clBlack; fEkran.odp_c.Font.Color:=clBlack; end;
        4: begin odp_d.Font.Color:=clBlack; fEkran.odp_d.Font.Color:=clBlack; end;
      end;
      sound(3);
      music;
    end;
    //if g_stop then ON_pause:=false else TRYB:=17;
    if g_stop or g_rezygnacja then TRYB:=21 else TRYB:=17;
    g_blokada_glosowania:=false;
    g_wylaczenie_odpowiedzi:='';
    glosy_clear;
    ser.SendString('o$all$clear');
  end;
  if TRYB=17 then
  begin
    Label14.Caption:=SpacesToPoints(FormatFloat('### ### ##0',g_wygrana))+' '+CL_DIAMENT;
    Label16.Caption:=SpacesToPoints(FormatFloat('### ### ##0',g_wygrana_gwarantowana))+' '+CL_DIAMENT;
    ePodsumowanie(g_wygrana);
    fEkran.ePodsumowanie(g_wygrana);
    ON_pause:=false;
    ser.SendString('o$all$ogolne$'+IntToStr(TRYB)+'$'+IntToStr(g_pytanie)+'$'+ppodsumowanie.Caption);
  end;
  if TRYB=18 then
  begin
    eOff;
    fEkran.eOff;
    ser.SendString('o$all$ogolne$'+IntToStr(TRYB)+'$'+IntToStr(g_pytanie));
  end;
  if TRYB=19 then
  begin
    if g_blad then a:=g_bledy-1 else a:=g_bledy;
    if a<0 then a:=0;
    eTabInfo;
    fEkran.eTabInfo;
    test_info(g_pytanie);
    x1.Visible:=not g_kolo_1;
    x2.Visible:=not g_kolo_2;
    x3.Visible:=not g_kolo_3;
    fEkran.x1.Visible:=x1.Visible;
    fEkran.x2.Visible:=x2.Visible;
    fEkran.x3.Visible:=x3.Visible;
    s:='000';
    if g_kolo_1 then s[1]:='1';
    if g_kolo_2 then s[2]:='1';
    if g_kolo_3 then s[3]:='1';
    ser.SendString('o$all$ogolne$'+IntToStr(TRYB)+'$'+IntToStr(g_pytanie)+'$'+s+'$'+IntToStr(a));
    if not g_blad then TRYB:=20;
  end;
  if TRYB=20 then
  begin
    if g_blad then
    begin
      przelicz;
      s:='000';
      if g_kolo_1 then s[1]:='1';
      if g_kolo_2 then s[2]:='1';
      if g_kolo_3 then s[3]:='1';
      ser.SendString('o$all$ogolne$'+IntToStr(TRYB)+'$'+IntToStr(g_pytanie)+'$'+s+'$'+IntToStr(g_bledy));
    end;
  end;
  if TRYB=21 then
  begin
    Label14.Caption:=SpacesToPoints(FormatFloat('### ### ##0',g_wygrana))+' '+CL_DIAMENT;
    Label16.Caption:=SpacesToPoints(FormatFloat('### ### ##0',g_wygrana_gwarantowana))+' '+CL_DIAMENT;
    ePodsumowanie(g_wygrana,true);
    fEkran.ePodsumowanie(g_wygrana,true);
    ser.SendString('o$all$ogolne$'+IntToStr(TRYB)+'$'+IntToStr(g_pytanie)+'$'+ppodsumowanie.Caption);
    if g_wygrana=0 then sound(4) else sound(5);
    if g_wygrana=0 then music(4) else music(5);
    ON_pause:=false;
  end;
  if TRYB=22 then
  begin
    eOff;
    fEkran.eOff;
    ser.SendString('o$all$ogolne$'+IntToStr(TRYB)+'$'+IntToStr(g_pytanie));
  end;
  (* informacja *)
  led_null_screen.Active:=(TRYB=0) or (TRYB=8) or (TRYB=18);
  led_rozgrywka.Active:=(TRYB>=9) and (TRYB<=15);
end;

procedure TFServer.test_info(aPytanie: integer);
begin
  if aPytanie>=1 then Label55.Caption:=CL_KOLO_1 else Label55.Caption:=CL_KOLO_0;
  if aPytanie>=2 then Label54.Caption:=CL_KOLO_1 else Label54.Caption:=CL_KOLO_0;
  if aPytanie>=3 then Label53.Caption:=CL_KOLO_1 else Label53.Caption:=CL_KOLO_0;
  if aPytanie>=4 then Label52.Caption:=CL_KOLO_1 else Label52.Caption:=CL_KOLO_0;
  if aPytanie>=5 then Label51.Caption:=CL_KOLO_1 else Label51.Caption:=CL_KOLO_0;
  if aPytanie>=6 then Label50.Caption:=CL_KOLO_1 else Label50.Caption:=CL_KOLO_0;
  if aPytanie>=7 then Label49.Caption:=CL_KOLO_1 else Label49.Caption:=CL_KOLO_0;
  if aPytanie>=8 then Label48.Caption:=CL_KOLO_1 else Label48.Caption:=CL_KOLO_0;
  if aPytanie>=9 then Label47.Caption:=CL_KOLO_1 else Label47.Caption:=CL_KOLO_0;
  if aPytanie>=10 then Label46.Caption:=CL_KOLO_1 else Label46.Caption:=CL_KOLO_0;
  if aPytanie>=11 then Label45.Caption:=CL_KOLO_1 else Label45.Caption:=CL_KOLO_0;
  if aPytanie>=12 then Label44.Caption:=CL_KOLO_1 else Label44.Caption:=CL_KOLO_0;
  if aPytanie>=1 then fEkran.Label35.Caption:=CL_KOLO_1 else fEkran.Label35.Caption:=CL_KOLO_0;
  if aPytanie>=2 then fEkran.Label36.Caption:=CL_KOLO_1 else fEkran.Label36.Caption:=CL_KOLO_0;
  if aPytanie>=3 then fEkran.Label37.Caption:=CL_KOLO_1 else fEkran.Label37.Caption:=CL_KOLO_0;
  if aPytanie>=4 then fEkran.Label38.Caption:=CL_KOLO_1 else fEkran.Label38.Caption:=CL_KOLO_0;
  if aPytanie>=5 then fEkran.Label39.Caption:=CL_KOLO_1 else fEkran.Label39.Caption:=CL_KOLO_0;
  if aPytanie>=6 then fEkran.Label40.Caption:=CL_KOLO_1 else fEkran.Label40.Caption:=CL_KOLO_0;
  if aPytanie>=7 then fEkran.Label41.Caption:=CL_KOLO_1 else fEkran.Label41.Caption:=CL_KOLO_0;
  if aPytanie>=8 then fEkran.Label42.Caption:=CL_KOLO_1 else fEkran.Label42.Caption:=CL_KOLO_0;
  if aPytanie>=9 then fEkran.Label43.Caption:=CL_KOLO_1 else fEkran.Label43.Caption:=CL_KOLO_0;
  if aPytanie>=10 then fEkran.Label44.Caption:=CL_KOLO_1 else fEkran.Label44.Caption:=CL_KOLO_0;
  if aPytanie>=11 then fEkran.Label45.Caption:=CL_KOLO_1 else fEkran.Label45.Caption:=CL_KOLO_0;
  if aPytanie>=12 then fEkran.Label46.Caption:=CL_KOLO_1 else fEkran.Label46.Caption:=CL_KOLO_0;
  case aPytanie of
     1: Shape1.Visible:=true;
     2: Shape2.Visible:=true;
     3: Shape3.Visible:=true;
     4: Shape4.Visible:=true;
     5: Shape5.Visible:=true;
     6: Shape6.Visible:=true;
     7: Shape7.Visible:=true;
     8: Shape8.Visible:=true;
     9: Shape9.Visible:=true;
    10: Shape10.Visible:=true;
    11: Shape11.Visible:=true;
    12: Shape12.Visible:=true;
  end;
  case aPytanie of
     1:  fEkran.Shape1.Visible:=true;
     2:  fEkran.Shape2.Visible:=true;
     3:  fEkran.Shape3.Visible:=true;
     4:  fEkran.Shape4.Visible:=true;
     5:  fEkran.Shape5.Visible:=true;
     6:  fEkran.Shape6.Visible:=true;
     7:  fEkran.Shape7.Visible:=true;
     8:  fEkran.Shape8.Visible:=true;
     9:  fEkran.Shape9.Visible:=true;
    10:  fEkran.Shape10.Visible:=true;
    11:  fEkran.Shape11.Visible:=true;
    12:  fEkran.Shape12.Visible:=true;
  end;
end;

procedure TFServer.ekran_info(aLp: integer);
begin
  Shape2.Visible:=aLp=1;
  fEkran.Shape2.Visible:=aLp=1;
  Shape7.Visible:=aLp=2;
  fEkran.Shape7.Visible:=aLp=2;
  Shape12.Visible:=aLp=3;
  fEkran.Shape12.Visible:=aLp=3;
  Shape21.Visible:=aLp=4;
  fEkran.Shape21.Visible:=aLp=4;
  Shape22.Visible:=aLp=5;
  fEkran.Shape22.Visible:=aLp=5;
  Shape23.Visible:=aLp=6;
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
  led_null_screen.Active:=ON_ekran;
end;

procedure TFServer.ButtOdpNow(Sender: TObject);
begin
  sound(11); sleep(500);
  zaznacz_odpowiedz(TSpeedButton(Sender).Tag);
end;

procedure TFServer.BitBtn1Click(Sender: TObject);
var
  soket,soket2: TLSocket;
begin
  user2socket(g_gracz_key,soket);
  user2socket(g_przyjaciel_key,soket2);
  ser.SendString('o$'+g_gracz_key+'$userblock',soket);
  ser.SendString('o$'+g_przyjaciel_key+'$userprzyjacielstart',soket2);
  BitBtn1.Enabled:=false;
  BitBtn2.Enabled:=false;
  tTel.Enabled:=true;
end;

procedure TFServer.AlgCompressionSteamingChange(Sender: TObject);
begin
  dm.SetAlgCompression(AlgCompressionSteaming.ItemIndex);
  case AlgCompressionSteaming.ItemIndex of
    0: ser.SendString('o$all$algcompression$none');
    1: ser.SendString('o$all$algcompression$deflate');
    2: ser.SendString('o$all$algcompression$lzbrrc');
    3: ser.SendString('o$all$algcompression$brrc');
  end;
end;

procedure TFServer.BitBtn2Click(Sender: TObject);
begin
  if tTel.Enabled then tTel.Enabled:=false else
  begin
    sound(1);
    g_blokada_glosowania:=true;
    ser.SendString('o$all$goblock');
    gl5.Progress:=gl1.Progress;
    gl6.Progress:=gl2.Progress;
    gl7.Progress:=gl3.Progress;
    gl8.Progress:=gl4.Progress;
    fEkran.gl1.Progress:=gl1.Progress;
    fEkran.gl2.Progress:=gl2.Progress;
    fEkran.gl3.Progress:=gl3.Progress;
    fEkran.gl4.Progress:=gl4.Progress;
    GroupBox4.Enabled:=false;
    ser.SendString('o$all$glosowanie$'+IntToStr(gl1.Progress)+'$'+IntToStr(gl2.Progress)+'$'+IntToStr(gl3.Progress)+'$'+IntToStr(gl4.Progress));
  end;
  aktywacja_odpowiedzi(true,true);
end;

procedure TFServer.BitBtn5Click(Sender: TObject);
var
  s: string;
begin
  s:='000';
  if g_kolo_1 then s[1]:='1';
  if g_kolo_2 then s[2]:='1';
  if g_kolo_3 then s[3]:='1';
  fEkran.eInfoKola;
  ser.SendString('o$all$showinfo$'+s);
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
    wybor_gracza;
  end else begin
    play1.Stop;
    play2.Stop;
    nomusic;
  end;
  tGra.Enabled:=ON_gra;
end;

procedure TFServer.ekran_pytanie(aNr: integer; aLp: integer);
var
  a,b,i,o: integer;
  s,s1,s2,s3,s4: string;
begin
  if aLp=-1 then
  begin
    ppytanie.Visible:=false; fEkran.pytanie.Visible:=false;
    Label_a.Visible:=false;  fEkran.Label_a.Visible:=false;
    Label_b.Visible:=false;  fEkran.Label_b.Visible:=false;
    Label_c.Visible:=false;  fEkran.Label_c.Visible:=false;
    Label_d.Visible:=false;  fEkran.Label_d.Visible:=false;
    odp_a.Visible:=false;    fEkran.odp_a.Visible:=false;
    odp_b.Visible:=false;    fEkran.odp_b.Visible:=false;
    odp_c.Visible:=false;    fEkran.odp_c.Visible:=false;
    odp_d.Visible:=false;    fEkran.odp_d.Visible:=false;

    case aNr of
        1..3: begin a:=1; b:=1; end;
        4..6: begin a:=1; b:=2; end;
       7..10: begin a:=2; b:=2; end;
      11..12: begin a:=2; b:=3; end;
    end;
    dbpyt.ParamByName('t1').AsInteger:=a;
    dbpyt.ParamByName('t2').AsInteger:=b;
    dbpyt.Open;

    a:=dbpyt.RecordCount;
    b:=random(a);
    for i:=1 to b do if not dbpyt.EOF then dbpyt.Next;
    s:=dbpytpytanie.AsString;
    s1:=dbpytodp_1.AsString;
    s2:=dbpytodp_2.AsString;
    s3:=dbpytodp_3.AsString;
    s4:=dbpytodp_4.AsString;
    o:=dbpytodpowiedz.AsInteger;
    if CheckTest.Checked then
    begin
      s:='[TEST] Poprawna odpowiedź to odpowiedź druga!';
      s1:='Odpowiedź pierwsza';
      s2:='Odpowiedź druga';
      s3:='Odpowiedź trzecia';
      s4:='Odpowiedź czwarta';
      o:=2;
    end;
    ser.SendString('o$all$dane$'+s+'$'+s1+'$'+s2+'$'+s3+'$'+s4);
    ppytanie.Caption:=s; fEkran.pytanie.Caption:=s;
    odp_a.Caption:=s1;   fEkran.odp_a.Caption:=s1;
    odp_b.Caption:=s2;   fEkran.odp_b.Caption:=s2;
    odp_c.Caption:=s3;   fEkran.odp_c.Caption:=s3;
    odp_d.Caption:=s4;   fEkran.odp_d.Caption:=s4;
    g_odpowiedz:=o;
    if CheckBox3.Checked then
    begin
      dbpyt.Edit;
      dbpytuzyte.AsString:=FormatDateTime('yyyy-mm-dd hh:nn:ss',now);
      dbpyt.Post;
    end;
    dbpyt.Close;

    odp_a.Font.Color:=clWhite; fEkran.odp_a.Font.Color:=clWhite;
    odp_b.Font.Color:=clWhite; fEkran.odp_b.Font.Color:=clWhite;
    odp_c.Font.Color:=clWhite; fEkran.odp_c.Font.Color:=clWhite;
    odp_d.Font.Color:=clWhite; fEkran.odp_d.Font.Color:=clWhite;
    Panel6.Color:=clBlue;      fEkran.Panel1.Color:=clBlue;
    Panel7.Color:=clBlue;      fEkran.Panel2.Color:=clBlue;
    Panel8.Color:=clBlue;      fEkran.Panel3.Color:=clBlue;
    Panel9.Color:=clBlue;      fEkran.Panel4.Color:=clBlue;

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
      0: begin ppytanie.Visible:=true; fEkran.pytanie.Visible:=true; end;
      1: begin odp_a.Visible:=true;    fEkran.odp_a.Visible:=true; end;
      2: begin odp_b.Visible:=true;    fEkran.odp_b.Visible:=true; end;
      3: begin odp_c.Visible:=true;    fEkran.odp_c.Visible:=true; end;
      4: begin odp_d.Visible:=true;    fEkran.odp_d.Visible:=true; end;
    end;
    Label_a.Visible:=odp_a.Visible; fEkran.Label_a.Visible:=fEkran.odp_a.Visible;
    Label_b.Visible:=odp_b.Visible; fEkran.Label_b.Visible:=fEkran.odp_b.Visible;
    Label_c.Visible:=odp_c.Visible; fEkran.Label_c.Visible:=fEkran.odp_c.Visible;
    Label_d.Visible:=odp_d.Visible; fEkran.Label_d.Visible:=fEkran.odp_d.Visible;
    (* na panelu sterującym *)
    case aLp of
      0: Label2.Caption:=fEkran.pytanie.Caption;
      1: Label4.Caption:=fEkran.odp_a.Caption;
      2: Label6.Caption:=fEkran.odp_b.Caption;
      3: Label8.Caption:=fEkran.odp_c.Caption;
      4: Label10.Caption:=fEkran.odp_d.Caption;
    end;
    ON_pause:=false;
  end;
end;

procedure TFServer.okno_config;
begin
  if CheckBox3.Checked then exit;
  FKonfiguracja:=TFKonfiguracja.Create(self);
  FKonfiguracja.ShowModal;
end;

procedure TFServer.zysk_i_strata;
var
  a,b,c: integer;
begin
  dm.zysk_i_strata(g_pytanie-g_bledy,a,b,c);
  Label29.Caption:=IntToStr(g_pytanie)+'/12';
  Label30.Caption:=SpacesToPoints(FormatFloat('### ### ##0',a))+' '+CL_DIAMENT;
  Label25.Caption:=SpacesToPoints(FormatFloat('### ### ##0',b))+' '+CL_DIAMENT;
  Label26.Caption:=SpacesToPoints(FormatFloat('### ### ##0',c))+' '+CL_DIAMENT;
end;

procedure TFServer.aktywacja_odpowiedzi(b: boolean; aIgnoreServ: boolean);
begin
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
  ON_pause:=false;
  if Panel14.Visible then
  begin
    eCzas30(false);
    fEkran.eCzas30(false);
  end;
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
    1: begin Panel6.Color:=CL_ZAZNACZENIE; fEkran.Panel1.Color:=CL_ZAZNACZENIE; end;
    2: begin Panel7.Color:=CL_ZAZNACZENIE; fEkran.Panel2.Color:=CL_ZAZNACZENIE; end;
    3: begin Panel8.Color:=CL_ZAZNACZENIE; fEkran.Panel3.Color:=CL_ZAZNACZENIE; end;
    4: begin Panel9.Color:=CL_ZAZNACZENIE; fEkran.Panel4.Color:=CL_ZAZNACZENIE; end;
  end;
  case aNr of
    1: begin odp_a.Font.Color:=clBlack; fEkran.odp_a.Font.Color:=clBlack; end;
    2: begin odp_b.Font.Color:=clBlack; fEkran.odp_b.Font.Color:=clBlack; end;
    3: begin odp_c.Font.Color:=clBlack; fEkran.odp_c.Font.Color:=clBlack; end;
    4: begin odp_d.Font.Color:=clBlack; fEkran.odp_d.Font.Color:=clBlack; end;
  end;
  ser.SendString('o$all$ogolne_zaznacz$'+IntToStr(aNr));
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

procedure TFServer.users_add(const aImie, aKey: string);
begin
  ListBox1.Items.Add(aImie+CL_SPACE+aKey);
end;

procedure TFServer.users_edit(const aImie, aKey: string);
var
  i: integer;
  s: string;
begin
  for i:=0 to ListBox1.Items.Count-1 do
  begin
    s:=ListBox1.Items[i];
    if pos(aKey,s)>0 then
    begin
      ListBox1.Items.Delete(i);
      break;
    end;
  end;
  ListBox1.Items.Add(aImie+CL_SPACE+aKey);
end;

procedure TFServer.pings_add(const aKey: string);
var
  i: integer;
  s,imie: string;
begin
  i:=StringToItemIndex(sesje,aKey);
  if i=-1 then exit;
  imie:=nazwy[i];
  for i:=0 to ListBox2.Items.Count-1 do
  begin
    s:=ListBox2.Items[i];
    if pos(aKey,s)>0 then
    begin
      ListBox2.Items.Delete(i);
      break;
    end;
  end;
  ListBox2.Items.Add(imie+CL_SPACE+aKey);
  if (ListBox2.Count>0) and (not tpings.Enabled) then tpings.Enabled:=true;
  ListBox1.Repaint;
end;

function TFServer.user2key(aItemIndex: integer; var aKey: string): boolean;
var
  a: integer;
  key: string;
begin
  key:=ListBox1.Items[aItemIndex];
  a:=pos('{',key);
  delete(key,1,a-1);
  if key='' then result:=false else
  begin
    aKey:=key;
    result:=true;
  end;
end;

function TFServer.user2socket(aItemIndex: integer; var aImie, aKey: string;
  var aSocket: TLSocket): boolean;
var
  a: integer;
  key: string;
begin
  key:=ListBox1.Items[aItemIndex];
  aImie:=trim(GetLineToStr(key,1,'{'));
  a:=pos('{',key);
  delete(key,1,a-1);
  a:=StringToItemIndex(sesje,key);
  if a>-1 then
  begin
    aKey:=key;
    aSocket:=TLSocket(sokety[a]);
    if aSocket.Handle=-1 then result:=false else result:=true;
  end else result:=false;
end;

function TFServer.user2socket(aItemIndex: integer; var aSocket: TLSocket
  ): boolean;
var
  imie,key: string;
begin
  result:=user2socket(aItemIndex,imie,key,aSocket);
end;

function TFServer.user2socket(aKey: string; var aSocket: TLSocket): boolean;
var
  a: integer;
begin
  a:=StringToItemIndex(sesje,aKey);
  if a>-1 then
  begin
    aSocket:=TLSocket(sokety[a]);
    if aSocket.Handle=-1 then result:=false else result:=true;
  end else result:=false;
end;

function TFServer.user2send(aItemIndex: integer; const aStr: string): boolean;
var
  key: string;
  socket: TLSocket;
begin
  result:=user2send(aItemIndex,aStr,key,socket);
end;

function TFServer.user2send(aItemIndex: integer; const aStr: string;
  var aSocket: TLSocket): boolean;
var
  key: string;
begin
  result:=user2send(aItemIndex,aStr,key,aSocket);
end;

function TFServer.user2send(aItemIndex: integer; const aStr: string;
  var aKey: string; var aSocket: TLSocket): boolean;
var
  b: boolean;
  imie,key: string;
  a: TLSocket;
begin
  b:=user2socket(aItemIndex,imie,key,a);
  if b then
  begin
    aKey:=key;
    aSocket:=a;
    ser.SendString('o$'+key+'$'+aStr,a);
    result:=true;
  end else result:=false;
end;

function TFServer.user2disconnect(aItemIndex: integer): boolean;
var
  b: boolean;
  imie,key: string;
  a: TLSocket;
begin
  result:=true;
  b:=user2socket(aItemIndex,imie,key,a);
  if b then a.Disconnect else result:=false;
end;

procedure TFServer.odpowiedz(aStr: string);
begin
  StatusBar.Panels[2].Text:='Informacja: '+aStr;
  todpowiedz.Enabled:=true;
end;

procedure TFServer.przelicz;
begin
  Label56.Caption:=Label57.Caption;
  Label57.Caption:=Label58.Caption;
  Label58.Caption:=Label59.Caption;
  Label59.Caption:=Label60.Caption;
  Label60.Caption:=Label61.Caption;
  Label61.Caption:=Label62.Caption;
  Label62.Caption:=Label63.Caption;
  Label63.Caption:=Label64.Caption;
  Label64.Caption:=Label65.Caption;
  Label65.Caption:=Label66.Caption;
  Label66.Caption:=Label67.Caption;
  Label67.Caption:='0';
  fEkran.Label2.Caption:=fEkran.Label14.Caption;
  fEkran.Label14.Caption:=fEkran.Label15.Caption;
  fEkran.Label15.Caption:=fEkran.Label16.Caption;
  fEkran.Label16.Caption:=fEkran.Label17.Caption;
  fEkran.Label17.Caption:=fEkran.Label18.Caption;
  fEkran.Label18.Caption:=fEkran.Label19.Caption;
  fEkran.Label19.Caption:=fEkran.Label20.Caption;
  fEkran.Label20.Caption:=fEkran.Label21.Caption;
  fEkran.Label21.Caption:=fEkran.Label22.Caption;
  fEkran.Label22.Caption:=fEkran.Label23.Caption;
  fEkran.Label23.Caption:=fEkran.Label24.Caption;
  fEkran.Label24.Caption:='0 ♦';
end;

procedure TFServer.wyslij_liste_graczy(aSynchronizacja: boolean);
var
  i: integer;
  soket,pom: TLSocket;
  pom1,pom2: string;
begin
  if user2socket(g_gracz_key,soket) then
  begin
    ser.SendString('o$'+g_gracz_key+'$userbegin',soket);
    for i:=0 to ListBox1.Count-1 do if user2socket(i,pom1,pom2,pom) then if pom2<>g_gracz_key then if pom.Handle<>-1 then ser.SendString('o$'+g_gracz_key+'$user$'+ListBox1.Items[i],soket);
    if not aSynchronizacja then StatusBar.Panels[1].Text:='Status: Lista potencjalnych przyjaciół wysłana.';
  end;
end;

end.

