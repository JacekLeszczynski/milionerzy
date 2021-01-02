unit client;

{$mode objfpc}{$H+}
{$define DEBUG}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, Buttons, XMLPropStorage, Menus, TplGaugeUnit, NetSocket, ExtMessage,
  LiveTimer, UOSEngine, UOSPlayer, lNet, ueled, pipes;

type

  { TFClient }

  TFClient = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Autoconnect: TCheckBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    cli: TNetSocket;
    eImie: TEdit;
    gl5: TplGauge;
    gl6: TplGauge;
    gl7: TplGauge;
    gl8: TplGauge;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
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
    Label5: TLabel;
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
    Label6: TLabel;
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
    Label7: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label8: TLabel;
    Label_a: TLabel;
    Label_b: TLabel;
    Label_c: TLabel;
    Label_d: TLabel;
    lInfo: TLabel;
    ListBox1: TListBox;
    muse: TNetSocket;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    tmuse: TTimer;
    tloop: TTimer;
    uELED1: TuELED;
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
    uELED4: TuELED;
    z1: TLiveTimer;
    t30: TTimer;
    tconn: TTimer;
    tping: TTimer;
    uELED2: TuELED;
    uELED3: TuELED;
    uos: TUOSEngine;
    zegar: TLiveTimer;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    odp_a: TLabel;
    odp_b: TLabel;
    odp_c: TLabel;
    odp_d: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    ppodsumowanie: TLabel;
    ppytanie: TLabel;
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
    tCzas: TTimer;
    mess: TExtMessage;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    StatusBar: TStatusBar;
    autorun: TTimer;
    ps: TXMLPropStorage;
    tInfo: TTimer;
    x1: TLabel;
    x2: TLabel;
    x3: TLabel;
    procedure AutoconnectChange(Sender: TObject);
    procedure autorunTimer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure cliConnect(aSocket: TLSocket);
    procedure cliCryptString(var aText: string);
    procedure cliDecryptString(var aText: string);
    procedure cliDisconnect;
    procedure cliProcessMessage;
    procedure cliReceiveString(aMsg: string; aSocket: TLSocket);
    procedure cliTimeVector(aTimeVector: integer);
    procedure eImieKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure museDisconnect;
    procedure museReceive(aSocket: TLSocket);
    procedure RadioGroup1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure t30StartTimer(Sender: TObject);
    procedure t30StopTimer(Sender: TObject);
    procedure t30Timer(Sender: TObject);
    procedure tconnTimer(Sender: TObject);
    procedure tmuseTimer(Sender: TObject);
    procedure tCzasStopTimer(Sender: TObject);
    procedure tCzasTimer(Sender: TObject);
    procedure tInfoTimer(Sender: TObject);
    procedure tloopTimer(Sender: TObject);
    procedure tpingStartTimer(Sender: TObject);
    procedure tpingStopTimer(Sender: TObject);
    procedure tpingTimer(Sender: TObject);
  private
    key: string;
    nasluch: boolean;
    mic,glosnik: TUOSPlayer;
    muse_in,muse2_in: TOutputPipeStream;
    muse_out,muse2_out: TInputPipeStream;
    muse_on: boolean;
    procedure wProcessMessage;
    procedure eOff;
    procedure ePytanie;
    procedure eTabInfo(aBledy: integer = 0);
    procedure ePodsumowanie(const aText: string);
    procedure eCzas30(aPokaz: boolean = true);
    procedure ePub(aPokaz: boolean = true);
    procedure test_info(aPytanie: integer);
    procedure ekran_info(aLp: integer = 0);
    procedure ekran_pytanie(aNr: integer; aLp: integer = -1);
    procedure synchronizuj(const aCiag: string);
    procedure set_ogolne(aTryb,aPytanie: integer; aPom: string = ''; aBledy: integer = 0);
    procedure set_dane(const aPytanie,aOdp1,aOdp2,aOdp3,aOdp4: string);
    procedure set_zaznacz(aN1,aN2: integer);
    procedure connect;
    procedure odp_przyciski(aOn: boolean);
    procedure odp_activate(aOn: boolean);
    procedure offkey(aStr: string);
    procedure clear;
    procedure send(const aStr: string; aOdpowiedz: boolean = false);
    procedure przelicz(aBledy: integer);
    function user2key(aItemIndex: integer; var aKey: string): boolean;
  public

  end;

var
  FClient: TFClient;
  vczas: integer = 0;

implementation

uses
  ecode, serwis, cverinfo, about;

{$R *.lfm}

{ TFClient }

procedure TFClient.connect;
begin
  if trim(eImie.Text)='' then
  begin
    Autoconnect.Checked:=false;
    mess.ShowWarning('Wypełnij wymagane dane','Zanim się połączysz, wypełnij pole IMIĘ w górnej części ekranu.^Następnie wciśnij przycisk "Połącz" by połączyć się ze zdalnym serwerem.');
    exit;
  end;
  cli.Connect;
  application.ProcessMessages;
end;

procedure TFClient.odp_przyciski(aOn: boolean);
begin
  SpeedButton1.Enabled:=aOn;
  SpeedButton2.Enabled:=aOn;
  SpeedButton3.Enabled:=aOn;
  SpeedButton4.Enabled:=aOn;
  if aOn then
  begin
    SpeedButton1.Caption:='A';
    SpeedButton2.Caption:='B';
    SpeedButton3.Caption:='C';
    SpeedButton4.Caption:='D';
  end else begin
    SpeedButton1.Caption:='';
    SpeedButton2.Caption:='';
    SpeedButton3.Caption:='';
    SpeedButton4.Caption:='';
  end;
end;

procedure TFClient.odp_activate(aOn: boolean);
begin
  odp_przyciski(aOn);
  if not aOn then Label14.Caption:='';
end;

procedure TFClient.offkey(aStr: string);
begin
  if pos('a',aStr)>0 then
  begin
    SpeedButton1.Enabled:=false;
    SpeedButton1.Caption:='';
    if Label14.Caption='A' then Label14.Caption:='';
    Label_a.Visible:=false;
    odp_a.Visible:=false;
  end;
  if pos('b',aStr)>0 then
  begin
    SpeedButton2.Enabled:=false;
    SpeedButton2.Caption:='';
    if Label14.Caption='B' then Label14.Caption:='';
    Label_b.Visible:=false;
    odp_b.Visible:=false;
  end;
  if pos('c',aStr)>0 then
  begin
    SpeedButton3.Enabled:=false;
    SpeedButton3.Caption:='';
    if Label14.Caption='C' then Label14.Caption:='';
    Label_c.Visible:=false;
    odp_c.Visible:=false;
  end;
  if pos('d',aStr)>0 then
  begin
    SpeedButton4.Enabled:=false;
    SpeedButton4.Caption:='';
    if Label14.Caption='D' then Label14.Caption:='';
    Label_d.Visible:=false;
    odp_d.Visible:=false;
  end;
end;

procedure TFClient.clear;
begin
  eOff;
  t30.Enabled:=false;
  zegar.Stop;
  eCzas30(false);
  linfo.Caption:='';
  SpeedButton1.Caption:='';
  SpeedButton2.Caption:='';
  SpeedButton3.Caption:='';
  SpeedButton4.Caption:='';
  SpeedButton1.Enabled:=false;
  SpeedButton2.Enabled:=false;
  SpeedButton3.Enabled:=false;
  SpeedButton4.Enabled:=false;
  Label14.Caption:='';
  Panel3.Enabled:=false;
  RadioGroup1.ItemIndex:=0;
  RadioGroup2.ItemIndex:=0;
  RadioGroup3.ItemIndex:=0;
  RadioGroup4.ItemIndex:=0;
  Label4.Enabled:=false;
  ListBox1.Clear;
  ListBox1.Enabled:=false;
end;

procedure TFClient.send(const aStr: string; aOdpowiedz: boolean);
begin
  if not cli.Active then exit;
  if aOdpowiedz then cli.SendString('o$'+key+'$'+aStr) else cli.SendString('c$'+key+'$'+aStr);
end;

procedure TFClient.przelicz(aBledy: integer);
var
  i: integer;
begin
  Label56.Caption:='MILION';
  Label57.Caption:='500.000';
  Label58.Caption:='250.000';
  Label59.Caption:='125.000';
  Label60.Caption:='75.000';
  Label61.Caption:='40.000';
  Label62.Caption:='20.000';
  Label63.Caption:='10.000';
  Label64.Caption:='5.000';
  Label65.Caption:='2.000';
  Label66.Caption:='1.000';
  Label67.Caption:='500';
  for i:=1 to aBledy do
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
  end;
end;

function TFClient.user2key(aItemIndex: integer; var aKey: string): boolean;
var
  a: integer;
  vkey: string;
begin
  vkey:=ListBox1.Items[aItemIndex];
  a:=pos('{',vkey);
  delete(vkey,1,a-1);
  if vkey='' then result:=false else
  begin
    aKey:=vkey;
    result:=true;
  end;
end;

procedure TFClient.cliCryptString(var aText: string);
begin
  aText:=dm.CryptString(aText);
end;

procedure TFClient.cliDecryptString(var aText: string);
begin
  aText:=dm.DecryptString(aText);
end;

procedure TFClient.cliDisconnect;
begin
  tCzas.Enabled:=false;
  uELED1.Active:=false;
  StatusBar.Panels[1].Text:='Różnica czasu: 0 ms.';
  StatusBar.Panels[0].Text:='Connected: OFF';
  Menuitem3.Enabled:=true;
  Menuitem4.Enabled:=false;
  BitBtn1.Enabled:=true;
  BitBtn2.Enabled:=false;
  eImie.Enabled:=true;
  clear;
  tconn.Enabled:=Autoconnect.Checked;
end;

procedure TFClient.cliProcessMessage;
begin
  application.ProcessMessages;
end;

procedure TFClient.autorunTimer(Sender: TObject);
begin
  autorun.Enabled:=false;
  key:=dm.KeyLoad;
  tconn.Enabled:=Autoconnect.Checked;
  if Autoconnect.Checked then connect;
end;

procedure TFClient.AutoconnectChange(Sender: TObject);
begin
  tconn.Enabled:=Autoconnect.Checked and (not cli.Active);
end;

procedure TFClient.BitBtn1Click(Sender: TObject);
begin
  connect;
end;

procedure TFClient.BitBtn2Click(Sender: TObject);
begin
  cli.Disconnect;
  Autoconnect.Checked:=false;
end;

procedure TFClient.BitBtn3Click(Sender: TObject);
begin
  send('ping');
end;

procedure TFClient.BitBtn4Click(Sender: TObject);
begin
  muse.Disconnect;
end;

procedure TFClient.cliConnect(aSocket: TLSocket);
begin
  tconn.Enabled:=false;
  Menuitem3.Enabled:=false;
  Menuitem4.Enabled:=true;
  BitBtn1.Enabled:=false;
  BitBtn2.Enabled:=true;
  eImie.Enabled:=false;
  StatusBar.Panels[0].Text:='Connected: OK';
  cli.GetTimeVector;
  uELED1.Active:=true;
end;

procedure TFClient.cliReceiveString(aMsg: string; aSocket: TLSocket);
var
  s,s1,s2,odp,w,w1,w2: string;
  s3: string;
begin
  s:=aMsg;
  {$IFDEF DEBUG} writeln('client.ramka: ',s); {$ENDIF}
  s1:=GetLineToStr(s,1,'$');
  if s1<>'o' then exit;
  s2:=GetLineToStr(s,2,'$');
  if (s2<>key) and (s2<>'all') then exit;
  odp:=GetLineToStr(s,3,'$');
  (* żądanie wysłania ramki danych *)
  if (odp='cansend') then muse.SendCanSendMessage(aSocket,'server') else
  (* rejestracja lub logowanie *)
  if odp='register' then
  begin
    key:=GetLineToStr(s,4,'$');
    dm.KeySave(key);
  end else
  if odp='login' then
  begin
    w:=GetLineToStr(s,4,'$');
    if w<>'ok' then
    begin
      mess.ShowError('ERROR LOGIN!');
      close;
    end;
  end else
  if odp='synchronizacja' then synchronizuj(s) else
  if odp='telupdate' then
  begin
    w:=GetLineToStr(s,4,'$');
    RadioGroup1.ItemIndex:=StrToInt(w[1]);
    RadioGroup2.ItemIndex:=StrToInt(w[2]);
    RadioGroup3.ItemIndex:=StrToInt(w[3]);
    RadioGroup4.ItemIndex:=StrToInt(w[4]);
  end else
  if odp='goactive' then odp_activate(true) else
  if odp='godeactive' then odp_activate(false) else
  if odp='goblock' then odp_przyciski(false) else
  if odp='offkey' then offkey(GetLineToStr(s,4,'$')) else
  if odp='clear' then clear else
  if odp='zaznacz' then Label14.Caption:=GetLineToStr(s,4,'$') else
  if odp='glosowanie' then
  begin
    gl5.Progress:=StrToInt(GetLineToStr(s,4,'$','0'));
    gl6.Progress:=StrToInt(GetLineToStr(s,5,'$','0'));
    gl7.Progress:=StrToInt(GetLineToStr(s,6,'$','0'));
    gl8.Progress:=StrToInt(GetLineToStr(s,7,'$','0'));
  end else
  if odp='ogolne' then set_ogolne(StrToInt(GetLineToStr(s,4,'$','0')),StrToInt(GetLineToStr(s,5,'$','0')),GetLineToStr(s,6,'$'),StrToInt(GetLineToStr(s,7,'$','0'))) else
  if odp='dane' then set_dane(GetLineToStr(s,4,'$'),GetLineToStr(s,5,'$'),GetLineToStr(s,6,'$'),GetLineToStr(s,7,'$'),GetLineToStr(s,8,'$')) else
  if odp='ogolne_zaznacz' then set_zaznacz(StrToInt(GetLineToStr(s,4,'$','0')),StrToInt(GetLineToStr(s,5,'$','0'))) else
  if odp='puboff' then ePub(false) else
  if odp='pubon' then ePub(true) else
  if odp='teloff' then eCzas30(false) else
  if odp='telon' then eCzas30(true) else
  if odp='tel30start' then
  begin
    zegar.Tag:=StrToInt(GetLineToStr(s,4,'$','0'));
    t30.Enabled:=true;
  end else
  if odp='tel30stop' then t30.Enabled:=false else
  if odp='ping' then tping.Enabled:=true else
  if odp='muse' then
  begin
    w:=GetLineToStr(s,4,'$');
    {$IFDEF DEBUG} writeln('client.receive.muse: ',w); {$ENDIF}
    if w='connect' then
    begin
      if uELED4.Active then
      begin
        tmuse.Tag:=1;
        tmuse.Enabled:=true;
      end else send('muse$connect$nosound');
    end else
    if w='on' then begin tmuse.Tag:=2; tmuse.Enabled:=true; end else
    if w='start' then begin tmuse.Tag:=3; tmuse.Enabled:=true; muse.SendCanSendMessage(aSocket,'server'); end else
    if w='disconnect' then muse.Disconnect else
    if w='algcompression' then
    begin
      w:=GetLineToStr(s,4,'$');
      if w='none' then dm.SetAlgCompression(0) else
      if w='deflate' then dm.SetAlgCompression(1) else
      if w='lzbrrc' then dm.SetAlgCompression(2) else
      if w='brrc' then dm.SetAlgCompression(3);
    end;
  end else
  if odp='userbegin' then
  begin
    ListBox1.Clear;
    Label4.Enabled:=true;
    ListBox1.Enabled:=true;
  end else
  if odp='user' then ListBox1.Items.Add(GetLineToStr(s,4,'$')) else
  if odp='userblock' then
  begin
    Label4.Enabled:=false;
    ListBox1.Enabled:=false;
  end else
  if odp='userend' then
  begin
    ListBox1.Clear;
  end else
  if odp='userprzyjacielstart' then Panel3.Enabled:=true else
  if odp='userprzyjacielstop' then Panel3.Enabled:=false else
  if odp='przyjacielodpowiada' then
  begin
    w1:=GetLineToStr(s,4,'$','0');
    w2:=GetLineToStr(s,5,'$','0');
    s3:='000';
    if w2='0' then begin s3[1]:='0'; s3[2]:='0'; s3[3]:='0'; end else
    if w2='1' then begin s3[1]:='1'; s3[2]:='0'; s3[3]:='0'; end else
    if w2='2' then begin s3[1]:='1'; s3[2]:='1'; s3[3]:='0'; end else
    begin s3[1]:='1'; s3[2]:='1'; s3[3]:='1'; end;
    if w1='1' then
    begin
      uELED19.Active:=s3[1]='1';
      uELED20.Active:=s3[2]='1';
      uELED21.Active:=s3[3]='1';
    end else
    if w1='2' then
    begin
      uELED22.Active:=s3[1]='1';
      uELED23.Active:=s3[2]='1';
      uELED24.Active:=s3[3]='1';
    end else
    if w1='3' then
    begin
      uELED25.Active:=s3[1]='1';
      uELED26.Active:=s3[2]='1';
      uELED27.Active:=s3[3]='1';
    end else
    if w1='4' then
    begin
      uELED28.Active:=s3[1]='1';
      uELED29.Active:=s3[2]='1';
      uELED30.Active:=s3[3]='1';
    end;
  end;
end;

procedure TFClient.cliTimeVector(aTimeVector: integer);
begin
  vczas:=aTimeVector;
  zegar.Correction:=aTimeVector;
  StatusBar.Panels[1].Text:='Różnica czasu: '+IntToStr(aTimeVector)+' ms.';
  tCzas.Enabled:=true;
  if (key='') or (key='new') then
  begin
    key:='new';
    send('register$'+eImie.Text);
  end else send('login$'+eImie.Text);
end;

procedure TFClient.eImieKeyPress(Sender: TObject; var Key: char);
begin
  if Key in ['$',';',','] then Key:=#9;
end;

procedure TFClient.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if cli.Active then
  begin
    cli.Disconnect;
    sleep(250);
  end;
end;

procedure TFClient.FormCreate(Sender: TObject);
var
  v1,v2,v3,v4: integer;
begin
  SetConfDir('milionerzy');
  dm:=Tdm.Create(self);
  ps.FileName:=MyConfDir('client.xml');
  ps.Active:=true;
  nasluch:=false;
  muse_on:=false;
  (* uos *)
  if DirectoryExists(MyDir('uos')) then
  begin
    uos.Tag:=1;
    uos.LibDirectory:=MyDir('uos');
  end;
  if uos.Tag=1 then uELED4.Active:=uos.LoadLibrary;
  (* ver *)
  GetProgramVersion(v1,v2,v3,v4);
  if v4>0 then Caption:='Klient Jahu Milionerzy (ver.'+IntToStr(v1)+'.'+IntToStr(v2)+'.'+IntToStr(v3)+'-'+IntToStr(v4)+')' else
  if v3>0 then Caption:='Klient Jahu Milionerzy (ver.'+IntToStr(v1)+'.'+IntToStr(v2)+'.'+IntToStr(v3)+')' else
  Caption:='Klient Jahu Milionerzy (ver.'+IntToStr(v1)+'.'+IntToStr(v2)+')';
  autorun.Enabled:=true;
end;

procedure TFClient.FormDestroy(Sender: TObject);
begin
  if uELED4.Active then uos.UnLoadLibrary;
  dm.Free;
end;

procedure TFClient.ListBox1Click(Sender: TObject);
var
  i: integer;
  s: string;
begin
  i:=ListBox1.ItemIndex;
  if i=-1 then exit;
  if user2key(i,s) then send('przyjaciel$'+s);
end;

procedure TFClient.MenuItem3Click(Sender: TObject);
begin
  connect;
end;

procedure TFClient.MenuItem4Click(Sender: TObject);
begin
  cli.Disconnect;
end;

procedure TFClient.MenuItem5Click(Sender: TObject);
begin
  close;
end;

procedure TFClient.MenuItem9Click(Sender: TObject);
begin
  FAbout:=TFAbout.Create(self);
  FAbout.ShowModal;
end;

procedure TFClient.museDisconnect;
begin
  if not muse_on then exit;
  muse_on:=false;
  send('muse$disconnect');
  BitBtn4.Enabled:=false;
  uELED2.Color:=clRed;
  mic.Stop;
  glosnik.Stop;
  tloop.Enabled:=false;
  sleep(250);
  (* zwalniam obiekty *)
  if nasluch then
  begin
    mic.Free;
    glosnik.Free;
    nasluch:=false;
  end;
  muse_in.Free;
  muse_out.Free;
  muse2_in.Free;
  muse2_out.Free;
  muse.Disconnect;
  (* ustawiam kontrolki *)
  uELED2.Active:=false;
  StatusBar.Panels[3].Text:='Buforowanie:';
end;

procedure TFClient.museReceive(aSocket: TLSocket);
var
  n1,n2,i: integer;
  buf: TBufferNetwork;
begin
  inc(licznik_zegarowy);
  n1:=aSocket.Get(buf,BUFFER_SIZE);
  if n1=0 then exit;
  if not muse_on then exit;
  if (not glosnik.Busy) and (not glosnik.Starting) then glosnik.Start(TMemoryStream(muse_out));
  n1:=dm.rd.Add(buf,n1);
  n2:=dm.rd.Execute(muse_in);
end;

procedure TFClient.RadioGroup1Click(Sender: TObject);
var
  i: integer;
  a: TRadioGroup;
begin
  i:=TRadioGroup(Sender).Tag;
  case i of
    1: a:=RadioGroup1;
    2: a:=RadioGroup2;
    3: a:=RadioGroup3;
    4: a:=RadioGroup4;
  end;
  send('przyjacielodpowiada$'+IntToStr(i)+'$'+IntToStr(a.ItemIndex));
end;

procedure TFClient.SpeedButton1Click(Sender: TObject);
begin
  Label14.Caption:='A';
  if cli.Active then send('zaznacz$a');
end;

procedure TFClient.SpeedButton2Click(Sender: TObject);
begin
  Label14.Caption:='B';
  if cli.Active then send('zaznacz$b');
end;

procedure TFClient.SpeedButton3Click(Sender: TObject);
begin
  Label14.Caption:='C';
  if cli.Active then send('zaznacz$c');
end;

procedure TFClient.SpeedButton4Click(Sender: TObject);
begin
  Label14.Caption:='D';
  if cli.Active then send('zaznacz$d');
end;

procedure TFClient.t30StartTimer(Sender: TObject);
begin
  zegar.Start(zegar.Tag);
end;

procedure TFClient.t30StopTimer(Sender: TObject);
begin
  zegar.Stop;
end;

procedure TFClient.t30Timer(Sender: TObject);
var
  a,b: integer;
begin
  a:=zegar.GetIndexTime;
  b:=abs(30-(a div 1000));
  Label77.Caption:=IntToStr(b);
  if a>30000 then t30.Enabled:=false;
end;

procedure TFClient.tconnTimer(Sender: TObject);
begin
  connect;
end;

procedure TFClient.tmuseTimer(Sender: TObject);
begin
  tmuse.Enabled:=false;
  if tmuse.Tag=1 then
  begin
    {$IFDEF DEBUG} writeln('client.tmuse.1'); {$ENDIF}
    BitBtn4.Enabled:=true;
    uELED2.Color:=clRed;
    dm.rc.Clear;
    dm.rd.Clear;
    uELED2.Active:=muse.Connect;
    if uELED2.Active then send('muse$connect$ok') else send('muse$connect$error');
  end else
  if tmuse.Tag=2 then
  begin
    {$IFDEF DEBUG} writeln('client.tmuse.2'); {$ENDIF}
    nasluch:=true;
    mic:=TUOSPlayer.Create(self);
    mic.DeviceEngine:=uos;
    mic.DeviceIndex:=0;
    mic.Mode:=moRecord;
    glosnik:=TUOSPlayer.Create(self);
    glosnik.DeviceEngine:=uos;
    glosnik.DeviceIndex:=1;
    glosnik.Mode:=moPlay;
    glosnik.SleepForPlay:=2;
    glosnik.Option:=[soRaw];
    glosnik.OnProcessMessage:=@wProcessMessage;
    CreatePipeStreams(muse_out,muse_in);
    CreatePipeStreams(muse2_out,muse2_in);
    muse_on:=true;
    tloop.Enabled:=true;
    mic.Start(TMemoryStream(muse2_in));
    send('muse$on$ok');
  end else
  if tmuse.Tag=3 then
  begin
    {$IFDEF DEBUG} writeln('client.tmuse.3'); {$ENDIF}
    uELED2.Color:=clBlue;
  end;
end;

procedure TFClient.tCzasStopTimer(Sender: TObject);
begin
  StatusBar.Panels[2].Text:='--:--:--';
end;

procedure TFClient.tCzasTimer(Sender: TObject);
begin
  StatusBar.Panels[2].Text:=FormatDateTime('hh:nn:ss',ecode.IntegerToTime(TimeToInteger+vczas));
end;

procedure TFClient.tInfoTimer(Sender: TObject);
begin
  tInfo.Enabled:=false;
  ekran_info(0);
end;

var
  komunikacja: array [1..2,1..10] of integer;

procedure TFClient.tloopTimer(Sender: TObject);
var
  cc,n1,n2: integer;
  buf: TBufferNetwork;
  a,b,i: integer;
begin
  cc:=muse2_out.NumBytesAvailable;
  if cc=0 then exit;
  if cc>BUFFER_SIZE then cc:=BUFFER_SIZE;
  n1:=dm.rc.Add(muse2_out,cc); //dodanie strumienia
  n2:=dm.rc.Execute(buf); //kompresja strumienia
  if n2>0 then muse.SendBinary(buf,n2);
  (* bufory *)
  for i:=2 to KOMUNIKACJA_LAST do
  begin
    komunikacja[1,i-1]:=komunikacja[1,i];
    komunikacja[2,i-1]:=komunikacja[2,i];
  end;
  komunikacja[1,KOMUNIKACJA_LAST]:=round(100*n1/BUFFER_SIZE_COMPRESSED);
  komunikacja[2,KOMUNIKACJA_LAST]:=round(100*n2/BUFFER_SIZE_COMPRESSED);
  a:=0;
  b:=0;
  for i:=1 to KOMUNIKACJA_LAST do
  begin
    a:=a+komunikacja[1,i];
    b:=b+komunikacja[2,i];
  end;
  a:=round(a/KOMUNIKACJA_LAST);
  b:=round(b/KOMUNIKACJA_LAST);
  StatusBar.Panels[3].Text:='Buforowanie: '+IntToStr(a)+'/'+IntToStr(b)+' (%)';
end;

procedure TFClient.tpingStartTimer(Sender: TObject);
begin
  tping.Tag:=0;
  z1.Start;
end;

procedure TFClient.tpingStopTimer(Sender: TObject);
begin
  z1.Stop;
  uELED3.Active:=false;
end;

procedure TFClient.tpingTimer(Sender: TObject);
var
  a,b: integer;
begin
  a:=z1.GetIndexTime;
  b:=tping.Tag+1;
  tping.Tag:=b;
  if b mod 1 = 0 then uELED3.Active:=true;
  if b mod 2 = 0 then uELED3.Active:=false;
  if a>3000 then tping.Enabled:=false;
end;

procedure TFClient.wProcessMessage;
begin
  application.ProcessMessages;
end;

procedure TFClient.eOff;
begin
  Panel5.Visible:=false;
  Panel17.Visible:=false;
  Panel11.Visible:=false;
  Panel13.Visible:=false;
end;

procedure TFClient.ePytanie;
begin
  eOff;
  Panel5.Visible:=true;
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

procedure TFClient.eTabInfo(aBledy: integer);
begin
  eOff;
  przelicz(aBledy);
  Panel17.Visible:=true;
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

procedure TFClient.ePodsumowanie(const aText: string);
begin
  eOff;
  Panel11.Visible:=true;
  ppodsumowanie.Caption:=aText;
end;

procedure TFClient.eCzas30(aPokaz: boolean);
begin
  Panel15.Visible:=aPokaz;
end;

procedure TFClient.ePub(aPokaz: boolean);
begin
  Panel13.Visible:=aPokaz;
end;

procedure TFClient.test_info(aPytanie: integer);
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
end;

procedure TFClient.ekran_info(aLp: integer);
begin
  Shape2.Visible:=aLp=1;
  Shape7.Visible:=aLp=2;
  Shape12.Visible:=aLp=3;
  Shape21.Visible:=aLp=4;
  Shape22.Visible:=aLp=5;
  Shape23.Visible:=aLp=6;
  tInfo.Enabled:=false;
  tInfo.Enabled:=true;
end;

procedure TFClient.ekran_pytanie(aNr: integer; aLp: integer);
begin
  if aLp=-1 then
  begin
    ppytanie.Visible:=false;
    Label_a.Visible:=false;
    Label_b.Visible:=false;
    Label_c.Visible:=false;
    Label_d.Visible:=false;
    odp_a.Visible:=false;
    odp_b.Visible:=false;
    odp_c.Visible:=false;
    odp_d.Visible:=false;
    odp_a.Font.Color:=clWhite;
    odp_b.Font.Color:=clWhite;
    odp_c.Font.Color:=clWhite;
    odp_d.Font.Color:=clWhite;
    Panel7.Color:=clBlue;
    Panel8.Color:=clBlue;
    Panel9.Color:=clBlue;
    Panel10.Color:=clBlue;
  end else begin
    case aLp of
      0: ppytanie.Visible:=true;
      1: odp_a.Visible:=true;
      2: odp_b.Visible:=true;
      3: odp_c.Visible:=true;
      4: odp_d.Visible:=true;
    end;
    Label_a.Visible:=odp_a.Visible;
    Label_b.Visible:=odp_b.Visible;
    Label_c.Visible:=odp_c.Visible;
    Label_d.Visible:=odp_d.Visible;
  end;
end;

procedure TFClient.synchronizuj(const aCiag: string);
var
  a,vTryb,vPytanie,vLBledow,vBlad: integer;
  s0,s1,s2,s3,s4: string;
  vOdpowiedz,vUdzielonaOdpowiedz: integer;
  vPodsumowanie,vKola,pol: string;
  vGlos,vAlgCompression: string;
begin
TRY
  clear;
  vTryb:=StrToInt(GetLineToStr(aCiag,4,'$','0'));
  vPytanie:=StrToInt(GetLineToStr(aCiag,5,'$','0'));
  if vTryb>=1 then set_ogolne(1,vPytanie);
  if vTryb>=2 then set_ogolne(2,vPytanie);
  if vTryb>=3 then set_ogolne(3,vPytanie);
  if vTryb>=4 then set_ogolne(4,vPytanie);
  if vTryb>=5 then set_ogolne(5,vPytanie);
  if vTryb>=6 then set_ogolne(6,vPytanie);
  if vTryb>=7 then set_ogolne(7,vPytanie);
  if vTryb>=8 then set_ogolne(8,vPytanie);
  if vTryb>=9 then
  begin
    s0:=GetLineToStr(aCiag,6,'$');
    s1:=GetLineToStr(aCiag,7,'$');
    s2:=GetLineToStr(aCiag,8,'$');
    s3:=GetLineToStr(aCiag,9,'$');
    s4:=GetLineToStr(aCiag,10,'$');
    set_ogolne(9,vPytanie);
    set_dane(s0,s1,s2,s3,s4);
  end;
  if vTryb>=10 then set_ogolne(10,vPytanie);
  if vTryb>=11 then set_ogolne(11,vPytanie);
  if vTryb>=12 then set_ogolne(12,vPytanie);
  if vTryb>=13 then set_ogolne(13,vPytanie);
  if vTryb>=14 then set_ogolne(14,vPytanie);
  if vTryb>=15 then
  begin
    pol:=GetLineToStr(aCiag,15,'$');
    vGlos:=GetLineToStr(aCiag,16,'$');
    vUdzielonaOdpowiedz:=StrToInt(GetLineToStr(aCiag,11,'$','0'));
    odp_activate(true);
    if pol<>'' then offkey(pol);
    Label14.Caption:=UpCase(vGlos);
    set_zaznacz(vUdzielonaOdpowiedz,0);
  end;
  if vTryb>=16 then
  begin
    vOdpowiedz:=StrToInt(GetLineToStr(aCiag,12,'$','0'));
    odp_activate(false);
    if vOdpowiedz<>vUdzielonaOdpowiedz then set_zaznacz(vOdpowiedz,vUdzielonaOdpowiedz);
  end;
  if vTryb>=17 then
  begin
    vPodsumowanie:=GetLineToStr(aCiag,13,'$');
    set_ogolne(17,vPytanie,vPodsumowanie);
  end;
  if vTryb>=18 then set_ogolne(18,vPytanie);
  (* błędy - begin *)
  vLBledow:=StrToInt(GetLineToStr(aCiag,18,'$','0'));
  vBlad:=StrToInt(GetLineToStr(aCiag,19,'$','0'));
  if vBlad=1 then a:=vLBledow-1 else a:=vLBledow;
  if a<0 then a:=0;
  (* błędy - end *)
  if vTryb>=19 then
  begin
    vKola:=GetLineToStr(aCiag,14,'$');
    set_ogolne(19,vPytanie,vKola,a);
  end;
  if vTryb>=20 then
  begin
    vKola:=GetLineToStr(aCiag,14,'$');
    set_ogolne(20,vPytanie,vKola,vLBledow);
  end;
  if vTryb>=21 then set_ogolne(21,vPytanie,vPodsumowanie);
  if vTryb>=22 then set_ogolne(22,vPytanie);
  vAlgCompression:=GetLineToStr(aCiag,17,'$');
  if vAlgCompression='none' then dm.SetAlgCompression(0) else
  if vAlgCompression='deflate' then dm.SetAlgCompression(1) else
  if vAlgCompression='lzbrrc' then dm.SetAlgCompression(2) else
  if vAlgCompression='brrc' then dm.SetAlgCompression(3);
  (* Wolna pozycja = 20 *)
EXCEPT
  on E: Exception do mess.ShowError('Wystąpił błąd:^  TRYB='+IntToStr(vTryb)+', RUNDA='+IntToStr(vPytanie)+'^  Treść błędu: '+E.Message);
END;
end;

procedure TFClient.set_ogolne(aTryb, aPytanie: integer; aPom: string;
  aBledy: integer);
begin
  if aTryb=1 then
  begin
    linfo.Caption:='';
    eTabInfo;
    test_info(0);
  end;
  if (aTryb>=1) and (aTryb<=7) then ekran_info(aTryb-1);
  if aTryb=8 then begin tInfo.Enabled:=false; eOff; end;
  if aTryb=9 then
  begin
    linfo.Caption:=IntToStr(aPytanie);
    ePytanie;
    ekran_pytanie(aPytanie);
  end;
  if (aTryb>=10) and (aTryb<=14) then ekran_pytanie(g_pytanie,aTryb-10);
  if aTryb=17 then ePodsumowanie(aPom);
  if aTryb=18 then eOff;
  if aTryb in [19,20] then
  begin
    eTabInfo(aBledy);
    test_info(aPytanie);
    x1.Visible:=aPom[1]='0';
    x2.Visible:=aPom[2]='0';
    x3.Visible:=aPom[3]='0';
  end;
  if aTryb=21 then ePodsumowanie(aPom);
  if TRYB=22 then eOff;
end;

procedure TFClient.set_dane(const aPytanie, aOdp1, aOdp2, aOdp3, aOdp4: string);
begin
  ppytanie.Caption:=aPytanie;
  odp_a.Caption:=aOdp1;
  odp_b.Caption:=aOdp2;
  odp_c.Caption:=aOdp3;
  odp_d.Caption:=aOdp4;
end;

procedure TFClient.set_zaznacz(aN1, aN2: integer);
begin
  if Panel15.Visible then
  begin
    ListBox1.Clear;
    eCzas30(false);
  end;
  case aN1 of
    1: Panel7.Color:=CL_ZAZNACZENIE;
    2: Panel8.Color:=CL_ZAZNACZENIE;
    3: Panel9.Color:=CL_ZAZNACZENIE;
    4: Panel10.Color:=CL_ZAZNACZENIE;
  end;
  case aN1 of
    1: odp_a.Font.Color:=clBlack;
    2: odp_b.Font.Color:=clBlack;
    3: odp_c.Font.Color:=clBlack;
    4: odp_d.Font.Color:=clBlack;
  end;
  case aN2 of
    1: Panel7.Color:=clRed;
    2: Panel8.Color:=clRed;
    3: Panel9.Color:=clRed;
    4: Panel10.Color:=clRed;
  end;
  case aN2 of
    1: odp_a.Font.Color:=clBlack;
    2: odp_b.Font.Color:=clBlack;
    3: odp_c.Font.Color:=clBlack;
    4: odp_d.Font.Color:=clBlack;
  end;
end;

end.

