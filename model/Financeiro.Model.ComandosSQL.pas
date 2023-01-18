unit Financeiro.Model.ComandosSQL;

interface

uses
  Financeiro.Controller.Interfaces, FireDAC.Comp.Client;

type
  TComandoSQL = class(TInterfacedObject, iComandosSQL)
    constructor Create;
    destructor Destroy; override;
    class function New: iComandosSQL;
    procedure Comandos(fdquery : TFDQuery; SQL : string); overload;
    procedure Comandos(fdquery : TFDQuery; SQL, NomeParamentro : string; parametroSQL : double); overload;
    procedure Comandos(fdquery : TFDQuery; SQL, NomeParamentro : string; parametroSQL : string); overload;
  end;

implementation

{ TComandoSQL }
uses Vcl.Dialogs;

procedure TComandoSQL.Comandos(fdquery: TFDQuery; SQL: string);
begin
  fdquery.Close;
  fdquery.SQL.Clear;
  fdquery.SQL.add(SQL);
  fdquery.Open;
end;

procedure TComandoSQL.Comandos(fdquery: TFDQuery; SQL, NomeParamentro: string; parametroSQL: double);
begin
   fdquery.Close;
  fdquery.SQL.Clear;
  fdquery.SQL.add(SQL);
  fdquery.ParamByName(NomeParamentro).AsFloat := parametroSQL;
  fdquery.Open;
end;

procedure TComandoSQL.Comandos(fdquery: TFDQuery; SQL, NomeParamentro, parametroSQL: string);
begin
  fdquery.Close;
  fdquery.SQL.Clear;
  fdquery.SQL.add(SQL);
  fdquery.ParamByName(NomeParamentro).Asstring := parametroSQL;
  fdquery.Open;
end;                           
constructor TComandoSQL.Create;
begin

end;

destructor TComandoSQL.Destroy;
begin
  //
  inherited;
end;

class function TComandoSQL.New: iComandosSQL;
begin
  result := Self.Create;
end;

end.
