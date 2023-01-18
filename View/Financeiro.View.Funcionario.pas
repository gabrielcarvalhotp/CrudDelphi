unit Financeiro.View.Funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Financeiro.View.CadastroPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.WinXPanels, Financeiro.Controller.Interfaces, Vcl.Mask, Vcl.DBCtrls,
  Vcl.WinXCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.Provider, Datasnap.DBClient, Vcl.Dialogs, System.UITypes;

type
  TFrmCadFuncionario = class(TFrmCadPadrao)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edEndereco: TDBEdit;
    edCPF: TDBEdit;
    edCelular: TDBEdit;
    edNome: TDBEdit;
    edSalario: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    procedure BitBtnSalvarCadastroClick(Sender: TObject);
    procedure ValidarDados;
    procedure EditPesquisarChange(Sender: TObject);
    procedure BitBtnIncluirPesquisaClick(Sender: TObject);
    procedure BitBtnFecharCadastroClick(Sender: TObject);
    procedure BitBtnAlterarPesquisaClick(Sender: TObject);
    procedure BitBtnExcluirPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    ComandosSQL: iComandosSQL;
  end;

var
  FrmCadFuncionario: TFrmCadFuncionario;

implementation

uses
  Financeiro.Model.Validacao, Financeiro.Model.Usuarios,
  Financeiro.Model.ComandosSQL;

{$R *.dfm}

procedure TFrmCadFuncionario.BitBtnAlterarPesquisaClick(Sender: TObject);
begin
  inherited;
  DMConexao.FDQFuncionarios.Edit;
end;

procedure TFrmCadFuncionario.BitBtnExcluirPesquisaClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja deletar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    DMConexao.FDQFuncionarios.Delete;
end;

procedure TFrmCadFuncionario.BitBtnFecharCadastroClick(Sender: TObject);
begin
  inherited;
  DMConexao.FDQFuncionarios.Cancel;
end;

procedure TFrmCadFuncionario.BitBtnIncluirPesquisaClick(Sender: TObject);
begin
  inherited;
  DMConexao.FDQFuncionarios.Insert;
end;


procedure TFrmCadFuncionario.BitBtnSalvarCadastroClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja salvar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMConexao.FDQFuncionarios.Post;
    BitBtnFecharCadastroClick(self)
  end;

end;

procedure TFrmCadFuncionario.DBGridPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  inherited;
  DBGridPesquisa.Columns[0].Alignment := taRightJustify; 
end;

procedure TFrmCadFuncionario.EditPesquisarChange(Sender: TObject);
var TextoSQL, edtext : string;
begin
  inherited;
  edtext := '%'+EditPesquisar.Text+'%';
  TextoSQL := 'Select * from Funcionarios where fun_Nome like :pNome order by fun_id'; 
  ComandosSQL.Comandos(DMConexao.FDQFuncionarios, TextoSQL, 'pNome',edtext);
end;

procedure TFrmCadFuncionario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMConexao.FDQFuncionarios.Close;
end;

procedure TFrmCadFuncionario.FormCreate(Sender: TObject);
begin
  inherited; 
  DMConexao.FDQFuncionarios.open;
  ComandosSQL := TComandoSQL.New;
end;


procedure TFrmCadFuncionario.ValidarDados;
begin
  TValidacao.New.ValidarParametros(edNome.Text, edCPF.Text);
end;

end.
