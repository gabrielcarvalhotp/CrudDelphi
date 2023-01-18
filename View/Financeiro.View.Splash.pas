unit Financeiro.View.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Financeiro.Controller.Interfaces;

type
  TFrmSplash = class(TForm)
    PanelSplash: TPanel;
    Image2: TImage;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    LabelStatus: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MostrarSplash;
  end;

var
  FrmSplash: TFrmSplash;

implementation

{$R *.dfm}
{ TFormSplash }

procedure TFrmSplash.MostrarSplash;
begin
  try
    FrmSplash.ShowModal;
    Timer1Timer(self);
  finally
    FreeAndNil(FrmSplash)
  end;
end;

procedure TFrmSplash.Timer1Timer(Sender: TObject);
begin
  if ProgressBar1.Position <= 100 then
  begin
    ProgressBar1.StepIt;
    case ProgressBar1.Position of
      1:
        LabelStatus.Caption := 'Carregando Depend�ncias...';
      25:
        LabelStatus.Caption := 'Conectando ao Banco de Dados...';
      50:
        LabelStatus.Caption := 'Carregando Usu�rio...';
      75:
        LabelStatus.Caption := 'Iniciando o Sistema...';
      100:
        self.Close;
    end;
  end;
end;

end.
