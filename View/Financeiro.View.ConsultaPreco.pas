unit Financeiro.View.ConsultaPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Financeiro.Model.Usuarios,
  Financeiro.Controller.Interfaces, MainModuleConexao, Vcl.NumberBox;

type
  TFrmConsultaPReco = class(TForm)
    Panel2: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    DSProduto: TDataSource;
    FDQProduto: TFDQuery;
    DBGridConsulta: TDBGrid;
    FDQProdutoPROD_ID: TIntegerField;
    FDQProdutoPROD_NOME: TStringField;
    FDQProdutoPROD_QTDESTOQUE: TIntegerField;
    FDQProdutoPROD_VALORUNI: TFMTBCDField;
    FDQProdutoValorVista: TFMTBCDField;
    EditId: TNumberBox;
    procedure FormCreate(Sender: TObject);
    procedure DBGridConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EditIdChangeValue(Sender: TObject);
  private
    { Private declarations }
    ComandoSql: iComandosSQL;
  public
    { Public declarations }
  end;

var
  FrmConsultaPReco: TFrmConsultaPReco;

implementation

{$R *.dfm}

uses Financeiro.Model.ComandosSQL;

procedure TFrmConsultaPReco.DBGridConsultaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd(DBGridConsulta.DataSource.DataSet.RecNo) then
  begin
    DBGridConsulta.Canvas.Brush.Color := $00D2C8BE;
    DBGridConsulta.DefaultDrawDataCell(Rect, Column.Field, State)
  end;
end;

procedure TFrmConsultaPReco.EditIdChangeValue(Sender: TObject);
begin
  if EditId.Text <> '' then
    FDQProduto.Locate('prod_Id', EditId.Text, [loPartialKey]);
end;

procedure TFrmConsultaPReco.FormCreate(Sender: TObject);
begin
  DBGridConsulta.Columns[4].Width := 180;
end;

end.
