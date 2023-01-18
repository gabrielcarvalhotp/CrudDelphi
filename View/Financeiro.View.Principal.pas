unit Financeiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  Financeiro.Controller.Interfaces, Financeiro.View.Funcionario, Vcl.StdCtrls,
  Vcl.ExtCtrls, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON;

type
  TFrmPrincipal = class(TForm)
    MainMenuPrincipal: TMainMenu;
    MenuCadastros: TMenuItem;
    MenuAjuda: TMenuItem;
    Funcionarios1: TMenuItem;
    Produtos1: TMenuItem;
    TipoProduto1: TMenuItem;
    Clientes1: TMenuItem;
    Sair1: TMenuItem;
    Movimentos1: TMenuItem;
    Vendas1: TMenuItem;
    ConsultarPreos1: TMenuItem;
    FormasDePagamento1: TMenuItem;
    Timer1: TTimer;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Panel2: TPanel;
    Panel1: TPanel;
    lblTimeOfDay: TLabel;
    lblTempNow: TLabel;
    lblTempMax: TLabel;
    lblTempMin: TLabel;
    lblTempDesc: TLabel;
    procedure Funcionarios1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure TipoProduto1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure ConsultarPreos1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure FormasDePagamento1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
  { Private declarations }
    const
    IdToken: String = 'cafa1a21';
    procedure TempOfDay;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  Financeiro.View.Splash, Financeiro.View.Produtos, Financeiro.View.TipoProduto,
  Financeiro.View.Cliente, Financeiro.View.ConsultaPreco,
  Financeiro.View.FormasPgto, Financeiro.View.Venda;

{$R *.dfm}

procedure TFrmPrincipal.ConsultarPreos1Click(Sender: TObject);
begin
  FrmConsultaPReco := TFrmConsultaPReco.Create(self);
  FrmConsultaPReco.show;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  FrmSplash := TFrmSplash.Create(self);
  FrmSplash.MostrarSplash;
  TempOfDay;
end;

procedure TFrmPrincipal.Funcionarios1Click(Sender: TObject);
begin
  FrmCadFuncionario := TFrmCadFuncionario.Create(self);
  FrmCadFuncionario.show;
end;

procedure TFrmPrincipal.FormasDePagamento1Click(Sender: TObject);
begin
  FrmCadFormasPgto := TFrmCadFormasPgto.Create(self);
  FrmCadFormasPgto.show;
end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
begin
  lblTimeOfDay.Caption := 'Hora do dia: '+FormatDateTime('hh:mm:ss', now);
end;

procedure TFrmPrincipal.TempOfDay;
var
  jsonString: TJSONValue;
  jsonArray: TJSONArray;
begin
  RESTClient1.BaseURL := 'https://api.hgbrasil.com/' + 'weather?&array_limit=1&fields=only_results&key=' + IdToken + '&city_name=tres_pontas';
  RESTRequest1.Execute;
  jsonString := RESTRequest1.Response.JSONValue;
  jsonArray := jsonString.GetValue<TJSONArray>('forecast');
  lblTempNow.Caption := ('Temperatura atual: ' + jsonString.GetValue<string>('temp', 'def') + 'º');
  lblTempMax.Caption := ('Temperatura máxima: ' + jsonArray.Get(0).GetValue<string>('max', 'def') + 'º');
  lblTempMin.Caption := ('Temperatura minima: ' + jsonArray.Get(0).GetValue<string>('min', 'def') + 'º');
  lblTempDesc.Caption := ('Descrição do dia: ' + jsonArray.Get(0).GetValue<string>('description', 'def'));
end;

procedure TFrmPrincipal.TipoProduto1Click(Sender: TObject);
begin
  FrmCadTipoProduto := TFrmCadTipoProduto.Create(self);
  FrmCadTipoProduto.show;
end;

procedure TFrmPrincipal.Vendas1Click(Sender: TObject);
begin
  FrmMovVenda := TFrmMovVenda.Create(self);
  FrmMovVenda.show;
end;

procedure TFrmPrincipal.Produtos1Click(Sender: TObject);
begin
  FrmCadProduto := TFrmCadProduto.Create(self);
  FrmCadProduto.show;
end;

procedure TFrmPrincipal.Clientes1Click(Sender: TObject);
begin
  FrmCadClientes := TFrmCadClientes.Create(self);
  FrmCadClientes.show;
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
