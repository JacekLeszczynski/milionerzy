unit urzadzenia;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Presentation;

type

  { Tuu }

  TuuMilionerzyTest = procedure(aTryb: integer) of object;
  TuuMilionerzyVar = procedure(var aTryb,aGPytanie: integer; var aOnPause,aGStop: boolean) of object;
  TuuMilionerzySetGPytanie = procedure(aGPytanie: integer) of object;

  Tuu = class(TDataModule)
    mpilot: TPresentation;
    ytplayer: TPresentation;
    procedure mpilotClick(aButton: integer; var aTestDblClick: boolean);
    procedure mpilotClickLong(aButton: integer; aDblClick: boolean);
    procedure ytplayerClick(aButton: integer; var aTestDblClick: boolean);
  private
    FMilionerzySetGPytanie: TuuMilionerzySetGPytanie;
    FMilionerzyVar: TuuMilionerzyVar;
    FMilionerzyTest: TuuMilionerzyTest;
  public
  published
    property OnMilionerzyTest: TuuMilionerzyTest read FMilionerzyTest write FMilionerzyTest;
    property OnMilionerzyVar: TuuMilionerzyVar read FMilionerzyVar write FMilionerzyVar;
    property OnMilionerzySetGPytanie: TuuMilionerzySetGPytanie read FMilionerzySetGPytanie write FMilionerzySetGPytanie;
  end;

var
  uu: Tuu;

implementation

{$R *.lfm}

{ Tuu }

procedure Tuu.mpilotClickLong(aButton: integer; aDblClick: boolean);
begin
  if aButton=2 then
  begin
    if aDblClick then mpilot.SendKey(ord('7')) else mpilot.SendKey(ord('5'));
  end else
  if aButton=3 then
  begin
    if aDblClick then mpilot.SendKey(ord('7')) else mpilot.SendKey(ord('6'));
  end;
end;

procedure Tuu.ytplayerClick(aButton: integer; var aTestDblClick: boolean);
var
  a: integer;
begin
  a:=aButton; if a=5 then a:=4;
  if a=1 then ytplayer.SendKey(ord('9')) else
  if a=2 then ytplayer.SendKey(ord('8')) else
  if a=3 then ytplayer.SendKey(ord('0')) else
  if a=4 then ytplayer.SendKey(ord('`'));
end;

procedure Tuu.mpilotClick(aButton: integer; var aTestDblClick: boolean
  );
var
  litera: integer;
  TRYB,g_pytanie: integer;
  ON_pause,g_stop: boolean;
begin
  FMilionerzyVar(TRYB,g_pytanie,ON_pause,g_stop);
  case aButton of
    1: litera:=1;
    2: litera:=2;
    3: litera:=3;
    4: litera:=4;
    5: litera:=4;
  end;
  if (aButton=2) or (aButton=3) then aTestDblClick:=true;
  if (TRYB=15) and (litera=4) then FMilionerzyTest(20);
  if ON_pause then exit;
  case TRYB of
    (* PUSTY EKRAN *)
    0: if litera=1 then FMilionerzyTest(1);
    (* INFORMACJA *)
    1: if litera=1 then FMilionerzyTest(2);
    2: if litera=1 then FMilionerzyTest(3);
    3: if litera=1 then FMilionerzyTest(4);
    4: if litera=1 then FMilionerzyTest(5);
    5: if litera=1 then FMilionerzyTest(6);
    6: if litera=1 then FMilionerzyTest(7);
    7: if litera=1 then FMilionerzyTest(8);
    (* PUSTY EKRAN *)
    8: if litera=1 then FMilionerzyTest(9);
    (* PYTANIE *)
    9: if litera=1 then FMilionerzyTest(10);
    10: if litera=1 then FMilionerzyTest(11);
    11: if litera=1 then FMilionerzyTest(12);
    12: if litera=1 then FMilionerzyTest(13);
    13: if litera=1 then FMilionerzyTest(14);
    14: if litera=1 then FMilionerzyTest(15);
    15: if litera=1 then FMilionerzyTest(16) else if litera=4 then FMilionerzyTest(20);
    16: if litera=1 then if g_stop then FMilionerzyTest(20) else FMilionerzyTest(17);
    17: if litera=1 then FMilionerzyTest(18);
    18: if litera=1 then FMilionerzyTest(19);
    19: if litera=1 then
        begin
          inc(g_pytanie);
          FMilionerzySetGPytanie(g_pytanie);
          FMilionerzyTest(8);
        end else if litera=4 then FMilionerzyTest(20);
    20: if litera=1 then FMilionerzyTest(21);
  end;
end;

end.

