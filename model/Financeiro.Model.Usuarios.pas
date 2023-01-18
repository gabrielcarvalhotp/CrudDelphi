unit Financeiro.Model.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr, MainModuleConexao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, FireDAC.Comp.UI, FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Phys.SQLiteVDataSet;

type
  TDMConexao = class(TForm)
    FDQProdutos: TFDQuery;
    FDTransaction1: TFDTransaction;
    DSClientes_Contatos: TDataSource;
    DSClientes: TDataSource;
    FDTClientes: TFDTable;
    FDTClientes_Contatos: TFDTable;
    FDTClientescliM_Id: TFDAutoIncField;
    FDTClientescliM_Nome: TStringField;
    FDTClientescliM_CPF: TStringField;
    FDTClientescliM_DataNasc: TDateField;
    DSFuncionario: TDataSource;
    DSTipoProduto: TDataSource;
    FDQTipoProduto: TFDQuery;
    DSProduto: TDataSource;
    FDQProdutosprod_id: TFDAutoIncField;
    FDQProdutosprod_Nome: TStringField;
    FDQProdutosprod_qtdEstoque: TIntegerField;
    FDQProdutosprod_ValorUni: TFMTBCDField;
    FDQProdutosprod_IdTipoProduto: TIntegerField;
    FDQProdutostip_nome: TStringField;
    FDTClientes_ContatoscliD_id: TFDAutoIncField;
    FDTClientes_ContatoscliD_IdMestre: TIntegerField;
    FDTClientes_ContatoscliD_Nome: TStringField;
    FDTClientes_ContatoscliD_Celular: TStringField;
    FDTClientes_ContatoscliD_Cidade: TStringField;
    FDTClientes_ContatoscliD_Endereco: TStringField;
    DSFormaPgto: TDataSource;
    FDQFormaPgto: TFDQuery;
    DSVenda: TDataSource;
    DSVenda_produtos: TDataSource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQTipoProdutoTIP_ID: TIntegerField;
    FDQTipoProdutoTIP_NOME: TStringField;
    FDQFormaPgtoPGTO_ID: TIntegerField;
    FDQFormaPgtoPGTO_NOME: TStringField;
    FDQContagem: TFDQuery;
    DSContagem: TDataSource;
    FDQFuncionarios: TFDQuery;
    FDQFuncionarios_pesquisa: TFDQuery;
    DSFuncionarios_pesquisa: TDataSource;
    FDQClientes_pesquisa: TFDQuery;
    DSClientes_pesquisa: TDataSource;
    FDQFuncionarios_pesquisaFUN_ID: TIntegerField;
    FDQFuncionarios_pesquisaFUN_NOME: TStringField;
    FDQFuncionarios_pesquisaFUN_CELULAR: TStringField;
    FDQFuncionarios_pesquisaFUN_CPF: TStringField;
    FDQFuncionarios_pesquisaFUN_ENDERECO: TStringField;
    FDQFuncionarios_pesquisaFUN_SALARIO: TFMTBCDField;
    FDQClientes_pesquisaCLIM_ID: TIntegerField;
    FDQClientes_pesquisaCLIM_NOME: TStringField;
    FDQClientes_pesquisaCLIM_CPF: TStringField;
    FDQClientes_pesquisaCLIM_DATANASC: TDateField;
    FDQContagemcontagem: TIntegerField;
    FDQContagemValorVista: TFMTBCDField;
    FDQContagemValorPrazo: TFMTBCDField;
    FDQFuncionariosFUN_ID: TIntegerField;
    FDQFuncionariosFUN_NOME: TStringField;
    FDQFuncionariosFUN_CELULAR: TStringField;
    FDQFuncionariosFUN_CPF: TStringField;
    FDQFuncionariosFUN_ENDERECO: TStringField;
    FDQFuncionariosFUN_SALARIO: TFMTBCDField;
    FDQVenda: TFDQuery;
    FDQVendaVEN1_ID: TIntegerField;
    FDQVendaVEN1_FUNCIONARIOID: TIntegerField;
    FDQVendaVEN1_CLIENTEID: TIntegerField;
    FDQVendaVEN1_FORMAPGTOID: TIntegerField;
    FDQVendaVEN1_DATA: TDateField;
    FDQVendaVEN1_OBSERVACOES: TStringField;
    FDQVendaFUN_NOME: TStringField;
    FDQVendaCLIM_NOME: TStringField;
    FDQVendaPGTO_NOME: TStringField;
    FDQVenda_Produtos: TFDQuery;
    FDQVenda_ProdutosVEN2_ID: TIntegerField;
    FDQVenda_ProdutosVEN2_MESTREID: TIntegerField;
    FDQVenda_ProdutosVEN2_NRITEM: TIntegerField;
    FDQVenda_ProdutosVEN2_PRODUTOID: TIntegerField;
    FDQVenda_ProdutosVEN2_QTDEPRODUTO: TIntegerField;
    FDQVenda_ProdutosVEN2_VALORPRAZO: TFMTBCDField;
    FDQVenda_ProdutosVEN2_VALORVISTA: TFMTBCDField;
    FDQVenda_ProdutosVEN2_NOMEPRODUTO: TStringField;
    procedure FDQVenda1BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConexao: TDMConexao;

implementation

{$R *.dfm}


procedure TDMConexao.FDQVenda1BeforePost(DataSet: TDataSet);
begin
 FDQVenda.FieldByName('ven1_Data').asdateTime := now; 
end;

end.