unit serwis;

{$mode objfpc}{$H+}

{
serwis.pas(9,16) Fatal:
  Nie można znaleźć CompressionFlyUnit used by serwis,
  incompatible ppu=/home/tao/Projekty/components/extlazarus/lib/x86_64-linux/compressionflyunit.ppu,
  pakiet ExtLazarus
}

interface

uses
  Classes, SysUtils, ZConnection, ZSqlProcessor, Graphics, RNL,
  systemtimer, CompressionFlyUnit;

  {NetSocket, lNet, UOSEngine, UOSPlayer,
  pipes, {StdCtrls,} ExtCtrls;}

const
  BUFFER_SIZE = 100000;
  BUFFER_SIZE_COMPRESSED = 65536;
  KOMUNIKACJA_LAST = 10;

type
  TBufferNetwork = array [0..BUFFER_SIZE-1] of byte;


type

  { TSTelefon }

  {TSTelefon = class(TThread)
  private
    muse: TNetSocket;
    muse_on: boolean;
    muse_in,muse2_in: TOutputPipeStream;
    muse_out,muse2_out: TInputPipeStream;
    uos: TUOSEngine;
    mic,glosnik: TUOSPlayer;
    rc,rd: TCompressionFly;
    loop: TTimer;
    procedure museReceive(aSocket: TLSocket);
    procedure wOnTimer(Sender: TObject);
  protected
    procedure Execute; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
  end;}

  { Tdm }

  Tdm = class(TDataModule)
    rd: TCompressionFly;
    rc: TCompressionFly;
    db: TZConnection;
    cr: TZSQLProcessor;
  private
  public
    procedure db_open;
    procedure db_close;
    procedure oblicz_wygrana(aPytanie: integer; aWygrana: boolean; var kwota,gwarantowana: integer);
    procedure zysk_i_strata(aPytanie: integer; var gra_o,zysk,strata: integer);
    procedure KeySave(aKey: string);
    function KeyLoad: string;
    function CryptString(aStr: string): string;
    function DecryptString(aStr: string): string;
    procedure SetAlgCompression(aAlg: integer);
  end;

const
  CL_SPACE = '                                                  ';
  CL_ZAZNACZENIE = clGray;
  //CL_KOLO_0 = '○';
  CL_KOLO_0 = '';
  CL_KOLO_1 = '◉';
  CL_DIAMENT = '♦';

var (* program *)
  licznik_zegarowy: integer = 0;
  dm: Tdm;
  xx: TStopWatch;
  ON_ekran: boolean = false;
  ON_gra: boolean = false;
  ON_pause: boolean = false;
  TRYB: integer = 0;
  g_gracz_key: string = '';
  g_przyjaciel_key: string = '';
  g_tel_a: integer = 0;
  g_tel_b: integer = 0;
  g_tel_c: integer = 0;
  g_tel_d: integer = 0;
  g_pytanie: integer = 1;
  g_bledy: integer = 0;
  g_blad: boolean = false;
  g_odpowiedz: integer = 0;
  g_udzielona_odpowiedz: integer = 0;
  g_wygrana: integer = 0;
  g_wygrana_gwarantowana: integer = 0;
  g_stop: boolean = false;
  g_rezygnacja: boolean = false;
  g_kolo_1: boolean = true;
  g_kolo_2: boolean = true;
  g_kolo_3: boolean = true;
  g_blokada_glosowania: boolean = false;
  g_wylaczenie_odpowiedzi: string = '';
  pytanie: integer = 1;

var
  glosowanie_a: integer = 0;
  glosowanie_b: integer = 0;
  glosowanie_c: integer = 0;
  glosowanie_d: integer = 0;

function SpacesToPoints(s: string): string;

implementation

uses
  ecode;

{$R *.lfm}

function SpacesToPoints(s: string): string;
begin
  result:=StringReplace(trim(s),' ','.',[rfReplaceAll]);
end;

{ TSTelefon }

{procedure TSTelefon.museReceive(aSocket: TLSocket);
var
  n1,n2,i: integer;
  buf: TBufferNetwork;
begin
  n1:=aSocket.Get(buf,BUFFER_SIZE);
  if n1=0 then exit;
  if not muse_on then exit;
  if (not glosnik.Busy) and (not glosnik.Starting) then glosnik.Start(TMemoryStream(muse_out));
  n1:=rd.Add(buf,n1);
  n2:=rd.Execute(muse_in);
end;

procedure TSTelefon.wOnTimer(Sender: TObject);
var
  cc,n1,n2: integer;
  buf: TBufferNetwork;
  a,b,i: integer;
begin
  //application.ProcessMessages;
  cc:=muse2_out.NumBytesAvailable;
  if cc=0 then exit;
  if cc>BUFFER_SIZE then cc:=BUFFER_SIZE;
  n1:=rc.Add(muse2_out,cc); //dodanie strumienia
  n2:=rc.Execute(buf); //kompresja strumienia
  if n2>0 then muse.SendBinary(buf,n2);
end;

procedure TSTelefon.Execute;
begin
  while not terminated do
  begin

    //ProcessMessage;
    sleep(100);
  end;
end;

constructor TSTelefon.Create;
begin
  inherited Create(true);
  uos:=TUOSEngine.Create(nil);
  uos.DriversLoad:=[dlPortAudio,dlSndAudio];
  uos.LoadLibrary;
  rc:=TCompressionFly.Create(nil);
  rc.AutoClear:=true;
  rc.Mode:=moCompress;
  rc.Taging:=true;
  rd:=TCompressionFly.Create(nil);
  rd.AutoClear:=true;
  rd.Mode:=moDecompress;
  rd.Taging:=true;
  muse:=TNetSocket.Create(nil);
  muse.BinaryMode:=true;
  muse.Host:='127.0.0.1';
  muse.Mode:=smServer;
  muse.Port:=4681;
  muse.Protocol:=spUDP;
  muse.ReuseAddress:=true;
  muse.OnReceive:=@museReceive;
  CreatePipeStreams(muse_out,muse_in);
  CreatePipeStreams(muse2_out,muse2_in);
  mic:=TUOSPlayer.Create(nil);
  mic.DeviceEngine:=uos;
  mic.DeviceIndex:=0;
  mic.Mode:=moRecord;
  glosnik:=TUOSPlayer.Create(nil);
  glosnik.DeviceEngine:=uos;
  glosnik.DeviceIndex:=1;
  glosnik.Mode:=moPlay;
  glosnik.PlayRawMode:=true;
  loop:=TTimer.Create(nil);
  loop.Enabled:=false;
  loop.Interval:=150;
  loop.OnTimer:=@wOnTimer;
  muse.Connect;
  Start;
end;

destructor TSTelefon.Destroy;
begin
  glosnik.Stop;
  mic.Stop;
  loop.Enabled:=false;
  loop.Free;
  mic.Free;
  glosnik.Free;
  muse.Disconnect;
  sleep(250);
  muse_in.Free;
  muse_out.Free;
  muse2_in.Free;
  muse2_out.Free;
  muse.Free;
  rc.Free;
  rd.Free;
  uos.UnLoadLibrary;
  uos.Free;
  inherited Destroy;
end;}

{ Tdm }

procedure Tdm.db_open;
var
  b: boolean;
begin
  b:=not FileExists(db.Database);
  db.Connect;
  if b then cr.Execute;
end;

procedure Tdm.db_close;
begin
  db.Disconnect;
end;

procedure Tdm.oblicz_wygrana(aPytanie: integer; aWygrana: boolean; var kwota,
  gwarantowana: integer);
begin
  if aWygrana then
  begin
    case aPytanie-g_bledy of
      1: kwota:=500;
      2: kwota:=1000; //gwarantowane
      3: kwota:=2000;
      4: kwota:=5000;
      5: kwota:=10000;
      6: kwota:=20000;
      7: kwota:=40000; //gwarantowane
      8: kwota:=75000;
      9: kwota:=125000;
      10: kwota:=250000;
      11: kwota:=500000;
      12: kwota:=1000000;
    end;
    if (aPytanie=2) or (aPytanie=7) or (aPytanie=12) then gwarantowana:=kwota;
  end else kwota:=gwarantowana;
end;

procedure Tdm.zysk_i_strata(aPytanie: integer; var gra_o, zysk, strata: integer
  );
begin
  case aPytanie of
     1: begin gra_o:=500; zysk:=500; strata:=0; end;
     2: begin gra_o:=1000; zysk:=500; strata:=500; end;
     3: begin gra_o:=2000; zysk:=1000; strata:=0; end;
     4: begin gra_o:=5000; zysk:=3000; strata:=1000; end;
     5: begin gra_o:=10000; zysk:=5000; strata:=4000; end;
     6: begin gra_o:=20000; zysk:=10000; strata:=9000; end;
     7: begin gra_o:=40000; zysk:=20000; strata:=19000; end;
     8: begin gra_o:=75000; zysk:=35000; strata:=0; end;
     9: begin gra_o:=125000; zysk:=50000; strata:=35000; end;
    10: begin gra_o:=250000; zysk:=125000; strata:=85000; end;
    11: begin gra_o:=500000; zysk:=250000; strata:=210000; end;
    12: begin gra_o:=1000000; zysk:=500000; strata:=460000; end;
  end;
end;

procedure Tdm.KeySave(aKey: string);
var
  f: text;
begin
  assignfile(f,MyConfDir('key.txt'));
  rewrite(f);
  writeln(f,aKey);
  closefile(f);
end;

function Tdm.KeyLoad: string;
var
  f: text;
  plik,s: string;
begin
  plik:=MyConfDir('key.txt');
  if not FileExists(plik) then result:='' else
  begin
    assignfile(f,plik);
    reset(f);
    readln(f,s);
    closefile(f);
    result:=s;
  end;
end;

function Tdm.CryptString(aStr: string): string;
begin
  result:=EncryptString(aStr,'ghs673utrytrh7d8sd68y32euyeuhe287hujhd');
end;

function Tdm.DecryptString(aStr: string): string;
begin
  result:=ecode.DecryptString(aStr,'ghs673utrytrh7d8sd68y32euyeuhe287hujhd');
end;

procedure Tdm.SetAlgCompression(aAlg: integer);
begin
  case aAlg of
    0: rc.Algorithm:=acNone;
    1: rc.Algorithm:=acDeflate;
    2: rc.Algorithm:=acLZBRRC;
    3: rc.Algorithm:=acBRRC;
  end;
  rd.Algorithm:=rc.Algorithm;
end;

initialization
  xx:=TStopWatch.Create;

end.

