unit client;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, Buttons, XMLPropStorage, NetSocket, ExtMessage, LiveTimer, lNet;

type

  { TFClient }

  TFClient = class(TForm)
    BitBtn1: TBitBtn;
    cli: TNetSocket;
    eImie: TEdit;
    eSkad: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    tCzas: TTimer;
    mess: TExtMessage;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    StatusBar: TStatusBar;
    autorun: TTimer;
    ps: TXMLPropStorage;
    procedure autorunTimer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure cliConnect(aSocket: TLSocket);
    procedure cliCryptString(var aText: string);
    procedure cliDecryptString(var aText: string);
    procedure cliDisconnect(aSocket: TLSocket);
    procedure cliReceiveString(aMsg: string; aSocket: TLSocket);
    procedure cliTimeVector(aTimeVector: integer);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure tCzasStopTimer(Sender: TObject);
    procedure tCzasTimer(Sender: TObject);
  private
    key: string;
    function connect: boolean;
    procedure odp_przyciski(aOn: boolean);
    procedure odp_activate(aOn: boolean);
    procedure offkey(aStr: string);
    procedure clear;
    procedure send(aStr: string; aOdpowiedz: boolean = false);
  public

  end;

var
  FClient: TFClient;
  vczas: integer = 0;

implementation

uses
  ecode, serwis, cverinfo;

{$R *.lfm}

{ TFClient }

function TFClient.connect: boolean;
begin
  result:=true;
  if not cli.Active then
  begin
    if (trim(eImie.Text)='') or (trim(eSkad.Text)='') then
    begin
      mess.ShowWarning('Wypełnij wymagane dane','Zanim się połączysz, wypełnij pola w górnej części ekranu.^Następnie wciśnij przycisk "Połącz" by połączyć się ze zdalnym serwerem.');
      result:=false;
      exit;
    end;
    cli.Connect;
    application.ProcessMessages;
  end;
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
    Label6.Caption:='';
    if Label14.Caption='A' then Label14.Caption:='';
  end;
  if pos('b',aStr)>0 then
  begin
    SpeedButton2.Enabled:=false;
    SpeedButton2.Caption:='';
    Label8.Caption:='';
    if Label14.Caption='B' then Label14.Caption:='';
  end;
  if pos('c',aStr)>0 then
  begin
    SpeedButton3.Enabled:=false;
    SpeedButton3.Caption:='';
    Label9.Caption:='';
    if Label14.Caption='C' then Label14.Caption:='';
  end;
  if pos('d',aStr)>0 then
  begin
    SpeedButton4.Enabled:=false;
    SpeedButton4.Caption:='';
    Label12.Caption:='';
    if Label14.Caption='D' then Label14.Caption:='';
  end;
end;

procedure TFClient.clear;
begin
  Label4.Caption:='';
  Label6.Caption:='';
  Label8.Caption:='';
  Label9.Caption:='';
  Label12.Caption:='';
end;

procedure TFClient.send(aStr: string; aOdpowiedz: boolean);
begin
  if not cli.Active then exit;
  if aOdpowiedz then cli.SendString('o$'+key+'$'+aStr) else cli.SendString('c$'+key+'$'+aStr);
end;

procedure TFClient.cliConnect(aSocket: TLSocket);
begin
  BitBtn1.Visible:=false;
  eImie.Enabled:=false;
  eSkad.Enabled:=false;
  StatusBar.Panels[0].Text:='Connected: OK';
  cli.GetTimeVector;
end;

procedure TFClient.cliCryptString(var aText: string);
begin
  aText:=dm.CryptString(aText);
end;

procedure TFClient.cliDecryptString(var aText: string);
begin
  aText:=dm.DecryptString(aText);
end;

procedure TFClient.BitBtn1Click(Sender: TObject);
begin
  connect;
end;

procedure TFClient.autorunTimer(Sender: TObject);
begin
  autorun.Enabled:=false;
  key:=dm.KeyLoad;
  connect;
end;

procedure TFClient.cliDisconnect(aSocket: TLSocket);
begin
  tCzas.Enabled:=false;
  StatusBar.Panels[1].Text:='Różnica czasu: 0 ms.';
  StatusBar.Panels[0].Text:='Connected: OFF';
  BitBtn1.Visible:=true;
  eImie.Enabled:=true;
  eSkad.Enabled:=true;
  clear;
end;

procedure TFClient.cliReceiveString(aMsg: string; aSocket: TLSocket);
var
  s,s1,s2,odp,w: string;
begin
  s:=aMsg;
  s1:=GetLineToStr(s,1,'$');
  if s1<>'o' then exit;
  s2:=GetLineToStr(s,2,'$');
  if (s2<>key) and (s2<>'all') then exit;
  odp:=GetLineToStr(s,3,'$');
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
  if odp='synchronizacja' then
  begin
    clear;
    Label4.Caption:=GetLineToStr(s,4,'$');
    Label6.Caption:=GetLineToStr(s,5,'$');
    Label8.Caption:=GetLineToStr(s,6,'$');
    Label9.Caption:=GetLineToStr(s,7,'$');
    Label12.Caption:=GetLineToStr(s,8,'$');
    if GetLineToStr(s,9,'$')='1' then odp_activate(true) else odp_activate(false);
    w:=GetLineToStr(s,10,'$');
    if w<>'' then Label14.Caption:=upcase(w);
    if GetLineToStr(s,11,'$')='1' then odp_przyciski(false);
    w:=GetLineToStr(s,12,'$');
    if w<>'' then offkey(w);
  end else
  if odp='title' then Label4.Caption:=GetLineToStr(s,4,'$') else
  if odp='odpa' then Label6.Caption:=GetLineToStr(s,4,'$') else
  if odp='odpb' then Label8.Caption:=GetLineToStr(s,4,'$') else
  if odp='odpc' then Label9.Caption:=GetLineToStr(s,4,'$') else
  if odp='odpd' then Label12.Caption:=GetLineToStr(s,4,'$') else
  if odp='goactive' then odp_activate(true) else
  if odp='godeactive' then odp_activate(false) else
  if odp='goblock' then odp_przyciski(false) else
  if odp='offkey' then offkey(GetLineToStr(s,4,'$')) else
  if odp='clear' then clear else
  if odp='zaznacz' then Label14.Caption:=GetLineToStr(s,4,'$');
end;

procedure TFClient.cliTimeVector(aTimeVector: integer);
begin
  vczas:=aTimeVector;
  StatusBar.Panels[1].Text:='Różnica czasu: '+IntToStr(aTimeVector)+' ms.';
  tCzas.Enabled:=true;
  if (key='') or (key='new') then
  begin
    key:='new';
    send('register');
  end else send('login');
end;

procedure TFClient.FormCreate(Sender: TObject);
var
  v1,v2,v3,v4: integer;
begin
  SetConfDir('milionerzy');
  ps.FileName:=MyConfDir('client.xml');
  ps.Active:=true;
  (* ver *)
  GetProgramVersion(v1,v2,v3,v4);
  if v4>0 then Caption:='Klient Jahu Milionerzy (ver.'+IntToStr(v1)+'.'+IntToStr(v2)+'.'+IntToStr(v3)+'-'+IntToStr(v4)+')' else
  if v3>0 then Caption:='Klient Jahu Milionerzy (ver.'+IntToStr(v1)+'.'+IntToStr(v2)+'.'+IntToStr(v3)+')' else
  if v2>0 then Caption:='Klient Jahu Milionerzy (ver.'+IntToStr(v1)+'.'+IntToStr(v2)+')' else Caption:='Klient Jahu Milionerzy (ver.'+IntToStr(v1)+'.'+IntToStr(v2)+')';
  autorun.Enabled:=true;
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

procedure TFClient.tCzasStopTimer(Sender: TObject);
begin
  StatusBar.Panels[2].Text:='--:--:--';
end;

procedure TFClient.tCzasTimer(Sender: TObject);
begin
  StatusBar.Panels[2].Text:=FormatDateTime('hh:nn:ss',ecode.IntegerToTime(TimeToInteger+vczas));
end;

end.

