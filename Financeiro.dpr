program Financeiro;

uses
  Vcl.Forms,
  Financeiro.Controller.Interfaces in 'interfaces\Financeiro.Controller.Interfaces.pas',
  Financeiro.View.CadastroPadrao in 'View\Financeiro.View.CadastroPadrao.pas' {FrmCadPadrao},
  Financeiro.View.Principal in 'View\Financeiro.View.Principal.pas' {FrmPrincipal},
  Financeiro.View.Splash in 'View\Financeiro.View.Splash.pas' {FrmSplash},
  Financeiro.View.Funcionario in 'View\Financeiro.View.Funcionario.pas' {FrmCadFuncionario},
  MainModuleConexao in 'model\MainModuleConexao.pas' {MMConexao: TDataModule},
  Financeiro.Model.Validacao in 'model\Financeiro.Model.Validacao.pas',
  Financeiro.View.Produtos in 'View\Financeiro.View.Produtos.pas' {FrmCadProduto},
  Financeiro.Model.ComandosSQL in 'model\Financeiro.Model.ComandosSQL.pas',
  Financeiro.View.TipoProduto in 'View\Financeiro.View.TipoProduto.pas' {FrmCadTipoProduto},
  Financeiro.View.Cliente in 'View\Financeiro.View.Cliente.pas' {FrmCadClientes},
  Financeiro.View.ConsultaPreco in 'View\Financeiro.View.ConsultaPreco.pas' {FrmConsultaPReco},
  Financeiro.View.LookUpPadrao in 'View\Financeiro.View.LookUpPadrao.pas' {FrmPesquisa},
  Financeiro.Model.ChamaCard in 'model\Financeiro.Model.ChamaCard.pas' {/ DataModuleConexao in 'model\DataModuleConexao.pas' {DM},
  Financeiro.Model.Usuarios in 'model\Financeiro.Model.Usuarios.pas' {DMConexao},
  Financeiro.View.FormasPgto in 'View\Financeiro.View.FormasPgto.pas' {FrmCadFormasPgto},
  Financeiro.View.Venda in 'View\Financeiro.View.Venda.pas' {FrmMovVenda},
  Financeiro.View.Relatorio in 'View\Financeiro.View.Relatorio.pas' {FrmRelatorio};

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TMMConexao, MMConexao);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TFrmRelatorio, FrmRelatorio);
  Application.Run;
end.
