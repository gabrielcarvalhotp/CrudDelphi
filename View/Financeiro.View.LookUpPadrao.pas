unit Financeiro.View.LookUpPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, MainModuleConexao;

type
  TFrmPesquisa = class(TForm)
    edPesquisaId: TEdit;
    Label1: TLabel;
    DBGridPesquisa: TDBGrid;
    DSLookUp: TDataSource;
    FDQLookUp: TFDQuery;
    Label2: TLabel;
    edPesquisaNome: TEdit;
    procedure DBGridPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edPesquisaIdChange(Sender: TObject);
    procedure DBGridPesquisaCellClick(Column: TColumn);
    procedure edPesquisaNomeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id: string;
    nome: string;
  end;

var
  FrmPesquisa: TFrmPesquisa;

implementation

{$R *.dfm}

procedure TFrmPesquisa.DBGridPesquisaCellClick(Column: TColumn);
begin
  id := DBGridPesquisa.Columns[0].Field.Value;
  nome := DBGridPesquisa.Columns[1].Field.Value;
  edPesquisaId.Text := '';
  edPesquisaNome.Text := '';
  self.Close;
end;

procedure TFrmPesquisa.DBGridPesquisaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(DBGridPesquisa.DataSource.DataSet.RecNo) then
  begin
    // DBGridPesquisa.Canvas.Font.Color:= clWhite;
    DBGridPesquisa.Canvas.Brush.Color := $00D2C8BE;
    DBGridPesquisa.DefaultDrawDataCell(Rect, Column.Field, State)
  end;
end;

procedure TFrmPesquisa.edPesquisaIdChange(Sender: TObject);
var
  nomeDaColuna: string;
begin
  edPesquisaNome.Text := '';
  nomeDaColuna := DBGridPesquisa.Columns[0].FieldName;
  if edPesquisaId.Text <> '' then
    FDQLookUp.Locate(nomeDaColuna, edPesquisaId.Text, [loPartialKey]);
end;

procedure TFrmPesquisa.edPesquisaNomeChange(Sender: TObject);
var
  nomeDaColuna: string;
begin
  edPesquisaId.Text := '';
  nomeDaColuna := DBGridPesquisa.Columns[1].FieldName;
  if edPesquisaNome.Text <> '' then
    FDQLookUp.Locate(nomeDaColuna, edPesquisaNome.Text, [loPartialKey]);
end;

end.
