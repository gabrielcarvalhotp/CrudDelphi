unit Financeiro.Controller.Interfaces;

interface

uses
  Vcl.WinXPanels, Vcl.Forms, FireDAC.Comp.Client;

type

  iChamaCard = interface
    ['{7670AD23-6D1D-4053-BD77-323CCC054AA7}']
    procedure Executar(Card: TCardPanel; Value: TCard);
  end;

  iComandosSQL = interface
    ['{3D0E8CF1-007D-4241-AD8A-F67DA8F6FF04}']
    procedure Comandos(fdquery : TFDQuery; SQL : string); overload;
    procedure Comandos(fdquery : TFDQuery; SQL, NomeParamentro : string; parametroSQL : double); overload;
    procedure Comandos(fdquery : TFDQuery; SQL, NomeParamentro : string; parametroSQL : string); overload;
  end;

  iValidacao = interface
    ['{96F0FECD-54A0-4874-A9C2-729B7AE75DD3}']
    function ValidarParametros(Nome, CPF: string): iValidacao;
    function ValidarNome(Nome : string): iValidacao;
    function ValidarCPF(CPF : string) : iValidacao;
  end;

implementation

end.
