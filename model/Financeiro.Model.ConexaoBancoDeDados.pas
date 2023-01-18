unit Financeiro.Model.ConexaoBancoDeDados;

interface

uses
  Financeiro.Controller.Interfaces, System.Generics.Collections, System.Classes,
  FireDAC.Comp.Client, Vcl.Dialogs;

type

  TConexaoBancoDeDados = class(TInterfacedObject, iConexao)

  private
    FConnection: TFDConnection;
    ParametroNome: string;
    ParametroValor: String;
    ListaParametros: TStringList;
    procedure CarregarConfiguracoes;
    procedure ArquivoExiste;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iConexao;
    function Conexao(aConexao: TFDConnection): iConexao;
    procedure Conectar;
    procedure Desconectar;

  const
    ARQUIVOFINANCEIRO = 'ProjetoHPSMySql.txt';
  end;

implementation

uses
  System.SysUtils;

{ TConexaoMySql }

constructor TConexaoBancoDeDados.Create;
begin;
  ListaParametros := TStringList.Create;
end;

destructor TConexaoBancoDeDados.Destroy;
begin
  ListaParametros.Free;
  inherited;
end;

class function TConexaoBancoDeDados.New: iConexao;
begin
  result := self.Create;
end;

function TConexaoBancoDeDados.Conexao(aConexao: TFDConnection): iConexao;
begin
  FConnection := aConexao;
  result := self;
end;

procedure TConexaoBancoDeDados.Conectar;
begin
  ArquivoExiste;
  FConnection.Connected := true;
end;

procedure TConexaoBancoDeDados.ArquivoExiste;
begin
  if not FileExists(ARQUIVOFINANCEIRO) then
    raise Exception.Create('Arquivo de Configura��o n�o encontrado!')
  else
    ListaParametros.LoadFromFile(ARQUIVOFINANCEIRO);
  CarregarConfiguracoes;
end;

procedure TConexaoBancoDeDados.CarregarConfiguracoes;
var
  contador: integer;
begin
  FConnection.Params.Clear;
  for contador := 0 to Pred(ListaParametros.Count) do
  begin
    ParametroNome := ListaParametros[contador].Split(['='])[0].Trim;
    ParametroValor := ListaParametros[contador].Split(['='])[1].Trim;
    FConnection.Params.Add(ParametroNome + '=' + ParametroValor);
  end;
end;

procedure TConexaoBancoDeDados.Desconectar;
begin
  FConnection.Connected := false;
end;

end.
