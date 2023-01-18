unit Financeiro.View.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Financeiro.View.CadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXPanels, Financeiro.Model.Usuarios,
  Financeiro.Controller.Interfaces, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmCadProduto = class(TFrmCadPadrao)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    procedure EditPesquisarChange(Sender: TObject);
    procedure BitBtnIncluirPesquisaClick(Sender: TObject);
    procedure BitBtnSalvarCadastroClick(Sender: TObject);
    procedure BitBtnAlterarPesquisaClick(Sender: TObject);
    procedure BitBtnExcluirPesquisaClick(Sender: TObject);
    procedure BitBtnFecharCadastroClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    ComandosSql: iComandosSQL;
    procedure fazerPesquisa;
  end;

var
  FrmCadProduto: TFrmCadProduto;

implementation

uses
  Financeiro.Model.ComandosSql, System.UITypes;

{$R *.dfm}

procedure TFrmCadProduto.BitBtnAlterarPesquisaClick(Sender: TObject);
begin
  inherited;
  DMConexao.FDQProdutos.Edit;
end;

procedure TFrmCadProduto.BitBtnExcluirPesquisaClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja deletar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    DMConexao.FDQProdutos.Delete;
end;

procedure TFrmCadProduto.BitBtnFecharCadastroClick(Sender: TObject);
begin
  inherited;
  DMConexao.FDQProdutos.Cancel;
end;

procedure TFrmCadProduto.BitBtnIncluirPesquisaClick(Sender: TObject);
begin
  inherited;
  DMConexao.FDQProdutos.Insert;
end;

procedure TFrmCadProduto.BitBtnSalvarCadastroClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja salvar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMConexao.FDQProdutos.Post;
    BitBtnFecharCadastroClick(self);
    fazerPesquisa;
  end;
end;

procedure TFrmCadProduto.EditPesquisarChange(Sender: TObject);

begin
  inherited;
  fazerPesquisa;
end;

procedure TFrmCadProduto.fazerPesquisa;
var
  textoSQlPesquisa, edtext: string;
begin
  edtext := '%'+EditPesquisar.Text+'%';
  textoSQlPesquisa :=
    ' select prod.prod_id, prod.prod_Nome,prod.prod_qtdEstoque, prod.prod_ValorUni, prod.prod_IdTipoProduto,'+ 
    ' tip.tip_nome from produtos as prod left join tipoproduto as tip on tip.tip_id = prod.prod_IdTipoProduto'+
    ' where prod.prod_Nome LIKE :pNome order by prod.prod_Nome';
  TComandoSQL.New.Comandos(DMConexao.FDQProdutos, textoSQlPesquisa, 'pNome', edtext);
end;

procedure TFrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMConexao.FDQProdutos.Close;
end;

end.
