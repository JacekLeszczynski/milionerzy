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
    function GetGUID: string;
  end;

const
  CL_ZAZNACZENIE = clLime;

var
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
  pytanie: integer = 1;

implementation

{$R *.lfm}

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
      2: kwota:=1000;
      3: kwota:=2000;
      4: kwota:=5000;
      5: kwota:=10000;
      6: kwota:=20000;
      7: kwota:=40000;
      8: kwota:=75000;
      9: kwota:=125000;
      10: kwota:=250000;
      11: kwota:=500000;
      12: kwota:=1000000;
    end;
    if (aPytanie=2) or (aPytanie=7) or (aPytanie=12) then gwarantowana:=kwota;
  end else kwota:=gwarantowana;
end;

function Tdm.GetGUID: string;
var
  error: integer;
  a: TGUID;
  s: string;
begin
  error:=CreateGUID(a);
  if error=0 then
  begin
    s:=GUIDToString(a);
    result:=s;
  end else result:='';
end;

end.

