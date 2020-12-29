unit serwis;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZSqlProcessor, Graphics;

type

  { Tdm }

  Tdm = class(TDataModule)
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
    procedure Decompress(const Buffer; Count: integer; aStream: TStream);
    function Compress(aStream: TStream; var Buffer; Count: integer): integer;
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
  ecode, bzip2lib, rnl;

{$R *.lfm}

function SpacesToPoints(s: string): string;
begin
  result:=StringReplace(trim(s),' ','.',[rfReplaceAll]);
end;

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

procedure Tdm.Decompress(const Buffer; Count: integer; aStream: TStream);
const
  BUFFER_SIZE = 65536;
var
  cc: TRNLCompressorDeflate;
  buf: array [0..BUFFER_SIZE-1] of byte;
  n,nn: integer;
begin
  aStream.WriteBuffer(Buffer,Count);
  exit;
  writeln(6);
  cc:=TRNLCompressorDeflate.Create;
  try
    writeln(7);
    nn:=cc.Decompress(Pointer(Buffer),Count,Pointer(buf[0]),BUFFER_SIZE);
  finally
    writeln(8);
    cc.Free;
  end;
  writeln(9);
  aStream.Write(buf,nn);
  writeln(10);
end;

TYPE
  TTTT = array [0..65536-1] of byte;

function Tdm.Compress(aStream: TStream; var Buffer; Count: integer): integer;
const
  BUFFER_SIZE = 65536;
var
  buf: array [0..BUFFER_SIZE-1] of byte;
  i,n,nn: integer;
var
  cc: TRNLCompressorDeflate;
begin
  result:=aStream.Read(Buffer,Count);
  //WRITELN('KOPIA:'); FOR I:=0 TO RESULT DO WRITE(TTTT(BUFFER)[I],' '); WRITELN;
  exit;
  writeln(1);
  n:=aStream.Read(buf,BUFFER_SIZE);
  WRITELN('ORYGINAŁ:'); FOR I:=0 TO N DO WRITE(BUF[I],' '); WRITELN;
  writeln(2);
  cc:=TRNLCompressorDeflate.Create;
  try
    writeln(3);
    nn:=cc.Compress(Pointer(buf[0]),n,Pointer(Buffer),BUFFER_SIZE);
    WRITELN('KOPIA:'); FOR I:=0 TO NN DO WRITE(TTTT(BUFFER)[I],' '); WRITELN;
    writeln(43);
  finally
    writeln(44);
    cc.Free;
  end;
  writeln(5);
  result:=nn;
end;

end.

