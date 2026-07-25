program EFDownloadFTP;



{$R *.dres}

uses
  Vcl.Forms,
  DownloadCaixaLocal in 'DownloadCaixaLocal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  UnitSobre in 'UnitSobre.pas' {FormSobre},
  UnitAtu in 'UnitAtu.pas' {FormAtu},
  ConfigCredenciais in 'ConfigCredenciais.pas',
  ConfigCredenciais_Exemplo in 'ConfigCredenciais_Exemplo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Download FTP Caixa Local';
  TStyleManager.TrySetStyle('Sapphire Kamri');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TFormSobre, FormSobre);
  Application.CreateForm(TFormAtu, FormAtu);
  Application.Run;
end.
