unit UnitSobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, UnitAtu;


  function PegarVersaoEXE: string;

type
  TFormSobre = class(TForm)
    memoTextos: TMemo;
    btnFechar: TBitBtn;
    pnlFundo: TPanel;
    imgFundo: TImage;
    Panel1: TPanel;
    Memo1: TMemo;
    Panel2: TPanel;
    Image1: TImage;
    btnMudancas: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnMudancasClick(Sender: TObject);
    procedure btnFecharChangelogClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSobre: TFormSobre;

implementation

{$R *.dfm}

function PegarVersaoEXE: string;
var
  Size, Handle: DWORD;
  Buffer: TBytes;
  FileInfo: PVSFixedFileInfo;
begin
  Result := '1.1.4.0'; // Retorno padrão caso dê erro


  Size := GetFileVersionInfoSize(PChar(Application.ExeName), Handle);
  if Size > 0 then
  begin
    SetLength(Buffer, Size);

    if GetFileVersionInfo(PChar(Application.ExeName), Handle, Size, Buffer) then
    begin
      if VerQueryValue(Buffer, '\', Pointer(FileInfo), Size) then
      begin
        Result := Format('%d.%d.%d.%d',
          [HiWord(FileInfo^.dwFileVersionMS), LoWord(FileInfo^.dwFileVersionMS),
           HiWord(FileInfo^.dwFileVersionLS), LoWord(FileInfo^.dwFileVersionLS)]);
      end;
    end;
  end;
end;



procedure TFormSobre.btnFecharChangelogClick(Sender: TObject);
begin
  // oculta o painel, devolvendo o usuário para a tela inicial
end;

procedure TFormSobre.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormSobre.btnMudancasClick(Sender: TObject);
begin
  // Cria o formulário de atualização em memória
  FormAtu := TFormAtu.Create(Self);
  try
    FormAtu.Label1.Caption := 'O que há de novo';

// 1. Limpa qualquer texto que tenha ficado salvo no design
    FormAtu.LogAtu.Lines.Clear;

    // --- VERSÃO ATUAL ---
    FormAtu.LogAtu.SelAttributes.Style := [fsBold];
    FormAtu.LogAtu.Lines.Add('VERSÃO ATUAL: ' + PegarVersaoEXE); // Puxa a versão do Delphi
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.SelAttributes.Style := [fsBold];
    FormAtu.LogAtu.Lines.Add('(CORREÇÕES E EVOLUÇÕES):');


    FormAtu.LogAtu.SelAttributes.Style := [];
    FormAtu.LogAtu.Lines.Add('--------------------------------------------------');
    FormAtu.LogAtu.Lines.Add('');


    FormAtu.LogAtu.Lines.Add('> AUTO-ATUALIZAÇÃO DO SISTEMA: Implementada rotina de atualização automática via FTP. Ao abrir, o sistema verifica de forma rápida (utilizando a mesma conexão) se há uma nova versão disponível na pasta de suporte. Se houver, exibe um aviso para o usuário atualizar (ou força de forma automática se configurado), baixa o novo executável, realiza a substituição limpa em memória sem uso de scripts .bat (evitando bloqueios de antivírus como o BitDefender), e reinicia a aplicação nova;');
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.Lines.Add('');


    FormAtu.LogAtu.Lines.Add('> VERIFICAÇÃO DE AMBIENTE DE USO: ao abrir, o app verifica se está sendo executado no Cloud ou no ambiente da Empresa Fácil. Se sim, não pede senha - e permite fazer upload sem precisar de tecla de atalho;');
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.Lines.Add('');







    // --- VERSÕES ANTERIORES  ---
    FormAtu.LogAtu.SelAttributes.Style := [fsBold];
    FormAtu.LogAtu.Lines.Add('VERSÕES ANTERIORES:');
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.SelAttributes.Style := [fsBold];
    FormAtu.LogAtu.Lines.Add('(v1.1.5.0):');

    FormAtu.LogAtu.SelAttributes.Style := [];
    FormAtu.LogAtu.Lines.Add('--------------------------------------------------');
    FormAtu.LogAtu.Lines.Add('');


      //
    FormAtu.LogAtu.Lines.Add('> ENVIO DE ARQUIVOS: Criada função restrita com senha para envio de arquivos ao FTP. É possível enviar vários arquivos de uma vez arrastando e soltando com o mouse ou usando CTRL+V. Trava a tela durante as transferências para evitar cliques acidentais, não permite envio de . exe / .bat / .php, e em caso de falha, tenta 3 vezes e pergunta se deseja continuar;');
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.Lines.Add('');



    FormAtu.LogAtu.Lines.Add('> BLOQUEIO DE INATIVIDADE: Implementado mais um mecanismo de segurança, para usos em empresas. Após 10 minutos de ociosidade, a interface trava automaticamente, ocultando os dados e exigindo a senha do suporte para retomada; Além disso se ocorrer erro de rede e o PC ficar abandonado, após 10 minutos na tela de mensagem ''parada'' o aplicativo fecha a mensagem de erro sozinho, exclui o fragmento corrompido (.part) do disco e entra em modo de segurança protegido por senha; para evitar uso indevido do aplicativo;');
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.Lines.Add('');


    FormAtu.LogAtu.Lines.Add('> FALHA DE DOWNLOAD: Agora a aplicação tenta se reconectar caso tenha alguma falha de rede/internet/ftp. Após 5 tentativas pergunta se quer tentar novamente ou nao ; se sim, tenta mais 5 vezes. Se conseguir se reconectar, tenta continuar o download de onde parou;');
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.Lines.Add('');



    //
    FormAtu.LogAtu.Lines.Add('> USO DO SUPORTE: ao abrir, se digitada senha da pasta de backup, o app conecta na pasta "BACKUP", e não na pasta "CAIXA LOCAL", que antes era fixa;');
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.Lines.Add('');

    //
    FormAtu.LogAtu.Lines.Add('> MELHORIAS DE ESTABILIDADE: Mesmo em uso, durante um upload, ou download, a conexão podia ficar ''ociosa'' e gerar erro, se demorasse muito. Implementada rotina para permanecer com a conexão ativa, a fim de evitar erros;');
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.Lines.Add('');

    //
    FormAtu.LogAtu.Lines.Add('> CONEXÃO: O sistema já inicia conectando ao servidor em segundo plano, economizando seu tempo de espera na tela inicial;');
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.Lines.Add('');





    FormAtu.LogAtu.SelAttributes.Style := [fsBold];
    FormAtu.LogAtu.Lines.Add('(v1.0.3.0):');

    FormAtu.LogAtu.SelAttributes.Style := [];
    FormAtu.LogAtu.Lines.Add('--------------------------------------------------');


    FormAtu.LogAtu.Lines.Add('> DOWNLOAD FLUIDO: O processo de download dos arquivos roda em segundo plano, garantindo que a tela do aplicativo nunca congele ou fique ''Não Respondendo'' durante o download.');
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.Lines.Add('> ARQUIVOS DLLs: A aplicação não depende do técnico copiar arquivos DLLs para a pasta em que será executado; ele descompacta as duas DLLs necessárias na pasta ''TEMP'' do Windows, e depois as exclui.');
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.Lines.Add('');
            //
    FormAtu.LogAtu.Lines.Add('> EXECUTÁVEL AUTO-ASSINADO: Executável assinado digitalmente para evitar bloqueios do Windows Defender, SmartScreen e Smart App Control, bastando seguir os mesmos passos atualmente pro ''Efw.exe'';');
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.Lines.Add('');

     //
    FormAtu.LogAtu.Lines.Add('> SENHA INICIAL: O aplicativo agora exige uma senha de acesso exclusiva do suporte logo ao ser aberto. Mas a conexão com o FTP é mantida em segundo plano, enquanto a senha ainda é digitada;');
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.Lines.Add('');

    //
    FormAtu.LogAtu.Lines.Add('> EXCLUSÃO DE ARQUIVOS DO FTP: Adicionado o atalho oculto "Ctrl + Delete" na lista de arquivos. Ele permite que o suporte exclua arquivos diretamente do FTP - protegido por senha para evitar exclusões acidentais ou acessos indevidos;');
    FormAtu.LogAtu.Lines.Add('');
    FormAtu.LogAtu.Lines.Add('');


    // --- FORÇA O TOPO DA PÁGINA ---
    FormAtu.LogAtu.SelStart := 0;
    FormAtu.LogAtu.SelLength := 0;
    FormAtu.LogAtu.Perform(EM_SCROLLCARET, 0, 0);

        // 3. Exibe a janela travando a tela "Sobre" no fundo
    FormAtu.ShowModal;

  finally
    // 4. Ao fechar no "X" ou botão fechar, destrói o formulário da memória
    FreeAndNil(FormAtu);
  end;
end;

procedure TFormSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; // Libera da memória automaticamente
  // AVISA O SISTEMA QUE A TELA MORREU!
  // Na próxima vez que clicar no botão, o "Assigned" vai dar falso e recriar a tela.
  FormSobre := nil;
end;

procedure TFormSobre.FormCreate(Sender: TObject);
begin

  Memo1.Lines.Clear;
  memoTextos.Lines.Clear;

  // Alimenta o Memo1 usando a função dinâmica
  Memo1.Lines.Add('');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('Download FTP');


  Memo1.Lines.Add('Versão ' + PegarVersaoEXE + ' - ' + FormatDateTime('dd/mm/yyyy', FileDateToDateTime(FileAge(Application.ExeName))));

  Memo1.Lines.Add('| By Alexandre Batista');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('---');
  Memo1.Lines.Add('Aplicativo auxiliar desenvolvido para simplificar e agilizar o download de bases locais');
end;



end.