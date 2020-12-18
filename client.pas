unit client;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, Buttons, XMLPropStorage, NetSocket, ExtMessage, lNet;

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
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
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
    procedure cliDisconnect(aSocket: TLSocket);
    procedure cliTimeVector(aTimeVector: integer);
    procedure FormCreate(Sender: TObject);
  private
    function connect: boolean;
  public

  end;

var
  FClient: TFClient;
  vczas: integer = 0;

implementation

uses
  ecode;

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

procedure TFClient.cliConnect(aSocket: TLSocket);
begin
  BitBtn1.Visible:=false;
  StatusBar.Panels[0].Text:='Connected: OK';
  cli.GetTimeVector;
end;

procedure TFClient.BitBtn1Click(Sender: TObject);
begin
  connect;
end;

procedure TFClient.autorunTimer(Sender: TObject);
begin
  autorun.Enabled:=false;
  connect;
end;

procedure TFClient.cliDisconnect(aSocket: TLSocket);
begin
  StatusBar.Panels[1].Text:='Różnica czasu: 0 ms.';
  StatusBar.Panels[0].Text:='Connected: OFF';
end;

procedure TFClient.cliTimeVector(aTimeVector: integer);
begin
  vczas:=aTimeVector;
  StatusBar.Panels[1].Text:='Różnica czasu: '+IntToStr(aTimeVector)+' ms.';
end;

procedure TFClient.FormCreate(Sender: TObject);
begin
  SetConfDir('milionerzy');
  ps.FileName:=MyConfDir('client.xml');
  ps.Active:=true;
  autorun.Enabled:=true;
end;

end.

