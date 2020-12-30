unit serwis;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZSqlProcessor, Graphics, RNL,
  systemtimer;

const
  KOMUNIKACJA_LAST = 5;
  BUFFER_SIZE = 100000;
  BUFFER_SIZE_COMPRESSED = 65536;

type
  TBufferNetwork = array [0..BUFFER_SIZE-1] of byte;

type

  { TKompresjaRamek }

  TKompresjaRamekAlgorithm = (acNone, acDeflate,acLZBRRC,acBRRC);
  TKompresjaRamekMode = (moCompress,moDecompress);

  TKompresjaRamek = class
  private
    fAlg: TKompresjaRamekAlgorithm;
    fAutoClear: boolean;
    fCount: integer;
    fMode: TKompresjaRamekMode;
    fNag: boolean;
    stream: TMemoryStream;
    function wCompress(const iBuffer; iCount: integer; out oBuffer; oMaxCount: integer): integer;
    function wDecompress(const iBuffer; iCount: integer; out oBuffer; oMaxCount: integer): integer;
  public
    constructor Create(aMode: TKompresjaRamekMode = moCompress; aDodawajNaglowki: boolean = false);
    destructor Destroy; override;
    procedure Clear;
    function Add(iStream: TStream; iCount: integer = 0): integer;
    function Add(const iBuffer; iCount: integer): integer;
    function Test: boolean;
    function Execute(oStream: TStream): integer;
    function Execute(out oBuffer): integer;
  published
    property Mode: TKompresjaRamekMode read fMode default moCompress;
    property Naglowek: boolean read fNag default false;
    property Algorithm: TKompresjaRamekAlgorithm read fAlg write fAlg default acNone;
    property Count: integer read fCount;
    property AutoClear: boolean read fAutoClear write fAutoClear default false;
  end;

  { Tdm }

  Tdm = class(TDataModule)
    db: TZConnection;
    cr: TZSQLProcessor;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
  public
    rc,rd: TKompresjaRamek;
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
  CL_SPACE = '                    ';
  CL_ZAZNACZENIE = clGray;
  //CL_KOLO_0 = '○';
  CL_KOLO_0 = '';
  CL_KOLO_1 = '◉';
  CL_DIAMENT = '♦';

var (* program *)
  dm: Tdm;
  xx: TStopWatch;
  ON_ekran: boolean = false;
  ON_gra: boolean = false;
  ON_pause: boolean = false;
  TRYB: integer = 0;
  g_pytanie: integer = 1;
  g_odpowiedz: integer = 0;
  g_udzielona_odpowiedz: integer = 0;
  g_wygrana: integer = 0;
  g_wygrana_gwarantowana: integer = 0;
  g_stop: boolean = false;
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

{ TKompresjaRamek }

function TKompresjaRamek.wCompress(const iBuffer; iCount: integer; out oBuffer;
  oMaxCount: integer): integer;
var
  c1: TRNLCompressorDeflate;
  c2: TRNLCompressorLZBRRC;
  c3: TRNLCompressorBRRC;
  n: integer;
begin
  if fAlg=acDeflate then begin c1:=TRNLCompressorDeflate.Create; try n:=c1.Compress(@iBuffer,iCount,@oBuffer,oMaxCount) finally c1.Free end; end else
  if fAlg=acLZBRRC then begin c2:=TRNLCompressorLZBRRC.Create; try n:=c2.Compress(@iBuffer,iCount,@oBuffer,oMaxCount) finally c2.Free end; end else
  if fAlg=acBRRC then begin c3:=TRNLCompressorBRRC.Create; try n:=c3.Compress(@iBuffer,iCount,@oBuffer,oMaxCount) finally c3.Free end; end;
  result:=n;
end;

function TKompresjaRamek.wDecompress(const iBuffer; iCount: integer; out
  oBuffer; oMaxCount: integer): integer;
var
  c1: TRNLCompressorDeflate;
  c2: TRNLCompressorLZBRRC;
  c3: TRNLCompressorBRRC;
  n: integer;
begin
  if fAlg=acDeflate then begin c1:=TRNLCompressorDeflate.Create; try n:=c1.Decompress(@iBuffer,iCount,@oBuffer,oMaxCount) finally c1.Free end; end else
  if fAlg=acLZBRRC then begin c2:=TRNLCompressorLZBRRC.Create; try n:=c2.Decompress(@iBuffer,iCount,@oBuffer,oMaxCount) finally c2.Free end; end else
  if fAlg=acBRRC then begin c3:=TRNLCompressorBRRC.Create; try n:=c3.Decompress(@iBuffer,iCount,@oBuffer,oMaxCount) finally c3.Free end; end;
  result:=n;
end;

constructor TKompresjaRamek.Create(aMode: TKompresjaRamekMode;
  aDodawajNaglowki: boolean);
begin
  stream:=TMemoryStream.Create;
  fMode:=aMode;
  fNag:=aDodawajNaglowki;
  fAlg:=acNone;
  fCount:=0;
  fAutoClear:=false;
end;

destructor TKompresjaRamek.Destroy;
begin
  stream.Free;
  inherited Destroy;
end;

procedure TKompresjaRamek.Clear;
begin
  stream.Clear;
  fCount:=0;
end;

function TKompresjaRamek.Add(iStream: TStream; iCount: integer): integer;
var
  buf: TBufferNetwork;
  c,n: integer;
begin
  stream.Position:=stream.Size;
  if iCount=0 then c:=iStream.Size else c:=iCount;
  n:=iStream.Read(buf,c);
  fCount:=fCount+stream.Write(buf,n);
  result:=fCount;
end;

function TKompresjaRamek.Add(const iBuffer; iCount: integer): integer;
begin
  stream.Position:=stream.Size;
  fCount:=fCount+stream.Write(iBuffer,iCount);
  result:=fCount;
end;

function TKompresjaRamek.Test: boolean;
var
  a: integer;
  s: string;
begin
  if fNag then
  begin
    SetLength(s,5);
    stream.Read(s[1],5);
    a:=HexToDec(s);
    result:=stream.Size>=a;
  end else result:=true;
end;

function TKompresjaRamek.Execute(oStream: TStream): integer;
var
  buf,buf2: TBufferNetwork;
  a,n,n2: integer;
  s: string;
begin
  if fAlg=acNone then
  begin
    stream.Position:=0;
    result:=oStream.CopyFrom(stream,stream.Size);
    if fAutoClear then Clear;
    exit;
  end;
  stream.Position:=0;
  n:=stream.Read(buf,stream.Size);
  if fMode=moCompress then
  begin
    n2:=wCompress(buf,n,buf2,BUFFER_SIZE_COMPRESSED);
    if fNag then
    begin
      s:=IntToHex(n2+5,5);
      oStream.Write(s[1],5);
    end;
    oStream.Write(buf2,n2);
    if fAutoClear then Clear;
    if fNag then result:=n2+5 else result:=n2;
  end else begin
    if fNag then
    begin
      SetLength(s,5);
      s[1]:=chr(buf[0]);
      s[2]:=chr(buf[1]);
      s[3]:=chr(buf[2]);
      s[4]:=chr(buf[3]);
      s[5]:=chr(buf[4]);
      a:=HexToDec(s);
      if a>n then
      begin
        result:=-1;
        exit;
      end;
      n2:=wDecompress(buf[5],a-5,buf2,BUFFER_SIZE);
      if n>a then
      begin
        stream.Clear;
        stream.Write(buf[a],n-a);
      end else if fAutoClear then Clear;
      oStream.Write(buf2,n2);
    end else begin
      n2:=wDecompress(buf,n,buf2,BUFFER_SIZE);
      oStream.Write(buf2,n2);
    end;
    result:=n2;
  end;
end;

function TKompresjaRamek.Execute(out oBuffer): integer;
var
  buf: TBufferNetwork;
  a,n,n2: integer;
  s: string;
begin
  if fAlg=acNone then
  begin
    stream.Position:=0;
    result:=stream.Read(oBuffer,BUFFER_SIZE_COMPRESSED);
    if fAutoClear then Clear;
    exit;
  end;
  stream.Position:=0;
  n:=stream.Read(buf,stream.Size);
  if fMode=moCompress then
  begin
    if fNag then
    begin
      n2:=wCompress(buf,n,TBufferNetwork(oBuffer)[5],BUFFER_SIZE_COMPRESSED);
      s:=IntToHex(n2+5,5);
      TBufferNetwork(oBuffer)[0]:=ord(s[1]);
      TBufferNetwork(oBuffer)[1]:=ord(s[2]);
      TBufferNetwork(oBuffer)[2]:=ord(s[3]);
      TBufferNetwork(oBuffer)[3]:=ord(s[4]);
      TBufferNetwork(oBuffer)[4]:=ord(s[5]);
    end else n2:=wCompress(buf,n,oBuffer,BUFFER_SIZE_COMPRESSED);
    if fAutoClear then Clear;
    if fNag then result:=n2+5 else result:=n2;
  end else begin
    if fNag then
    begin
      SetLength(s,5);
      s[1]:=chr(buf[0]);
      s[2]:=chr(buf[1]);
      s[3]:=chr(buf[2]);
      s[4]:=chr(buf[3]);
      s[5]:=chr(buf[4]);
      a:=HexToDec(s);
      if a>n then
      begin
        result:=-1;
        exit;
      end;
      n2:=wDecompress(buf[5],a-5,oBuffer,BUFFER_SIZE);
      if n>a then
      begin
        stream.Clear;
        stream.Write(buf[a],n-a);
      end else if fAutoClear then Clear;
    end else n2:=wDecompress(buf,n,oBuffer,BUFFER_SIZE);
    result:=n2;
  end;
end;

{ Tdm }

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  rc:=TKompresjaRamek.Create(moCompress,true);
  rd:=TKompresjaRamek.Create(moDecompress,true);
  rc.AutoClear:=true;
  rd.AutoClear:=true;
  rc.Algorithm:=acNone; //(default: acNone, acDeflate,acLZBRRC,acBRRC);
  rd.Algorithm:=rc.Algorithm;
end;

procedure Tdm.DataModuleDestroy(Sender: TObject);
begin
  rc.Free;
  rd.Free;
end;

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
    case aPytanie of
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
  result:=EncryptString(aStr,'ghs673uh7d8sd68y32euyeuhe287hujhd');
end;

function Tdm.DecryptString(aStr: string): string;
begin
  result:=ecode.DecryptString(aStr,'ghs673uh7d8sd68y32euyeuhe287hujhd');
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

