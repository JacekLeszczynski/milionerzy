program milionerzy;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  cmem,
  {$ENDIF}
  Classes, CustApp, ExtParams, cverinfo, Interfaces, Forms,
  {$IFDEF SERVER} main; {$ENDIF}
  {$IFDEF CLIENT} client; {$ENDIF}

{$R milionerzy.res}
{$IFDEF SERVER}
{$R media.res}
{$ENDIF}

type

  { TMilionerzy }

  TMilionerzy = class(TCustomApplication)
  protected
    procedure DoRun; override;
  private
    par: TExtParams;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

{ TMilionerzy }

procedure TMilionerzy.DoRun;
var
  v1,v2,v3,v4: integer;
  go_exit,alfa,beta: boolean;
begin
  inherited DoRun;
  go_exit:=false;
  randomize;

  par:=TExtParams.Create(nil);
  try
    par.Execute;
    if par.IsParam('ver') then
    begin
      alfa:=par.IsParam('alfa');
      beta:=par.IsParam('beta');
      GetProgramVersion(v1,v2,v3,v4);
      if v4>0 then write(v1,'.',v2,'.',v3,'-',v4) else
      write(v1,'.',v2,'.',v3);
      if alfa then write('_alfa') else
      if beta then write('_beta');
      writeln;
      go_exit:=true;
    end;
    //par.ParamsForValues.Add('db');
    //if par.IsParam('db') then sciezka_db:=par.GetValue('db');
    //if par.IsParam('dev') then _DEV_ON:=true;
  finally
    par.Free;
  end;
  if go_exit then
  begin
    terminate;
    exit;
  end;

  {uruchomienie głównej formy}
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  {$IFDEF SERVER} Application.CreateForm(TFServer, FServer); {$ENDIF}
  {$IFDEF CLIENT} Application.CreateForm(TFClient, FClient); {$ENDIF}
  Application.Run;
  {wygaszenie procesu}
  Terminate;
end;

constructor TMilionerzy.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
end;

destructor TMilionerzy.Destroy;
begin
  inherited Destroy;
end;

var
  Application: TMilionerzy;
begin
  Application:=TMilionerzy.Create(nil);
  Application.Title:='Milionerzy';
  Application.Run;
  Application.Free;
end.

