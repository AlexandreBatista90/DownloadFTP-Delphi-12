# Aplicatido de Download FTP (VCL)  

Aplicativo utilitário desenvolvido em **Delphi 12 CE** para otimizar o download de bases locais via servidor FTP, para os técnicos da empresa.


## Sobre o Projeto
Projeto feito para aprendizado e ao mesmo tempo auxiliar os técnicos de suporte da empresa. A ferramenta gerencia a comunicação de rede de forma assíncrona, proporcionando uma boa experiência de usuário.

##  Principais Funcionalidades

* **Abertura do APP:** O sistema já inicia conectando ao servidor em segundo plano, economizando seu tempo de espera na tela inicial;
 
* **Conexão Assíncrona (Threads):** Processo de conexão, listagem de diretórios e download de arquivos ocorrem em segundo plano. A interface nunca fica com o status de "Não Respondendo".

* **Trava de Acesso:** Exigência de senha de suporte assim que o software é aberto, mascarando a aplicação para o usuário final, com bloqueio até a validação.

* **Tratamento de falha de Download:** A aplicação tenta se reconectar caso tenha alguma falha de rede/internet/ftp. Após 5 tentativas pergunta se quer tentar novamente ou nao ; se sim, tenta mais 5 vezes. Se conseguir se reconectar, tenta continuar o download de onde parou;
  
* **Exclusão:** Permite a exclusão de arquivos obsoletos diretamente no servidor FTP através de atalho oculto de teclado (`Ctrl + Delete`), condicionado a validação de senha.

* **Independência de DLLs:** A aplicação descompacta e consome as bibliotecas dinâmicas necessárias (OpenSSL) na pasta `TEMP` do Windows em tempo de execução, excluindo-as logo após o uso.




##  Tecnologias e Componentes
* **Linguagem:** Object Pascal / Delphi
* **IDE:** Delphi 12 Community Edition
* **Framework Visual:** VCL (Visual Component Library)
* **Rede:** Protocolos baseados na biblioteca Indy (`TIdFTP`)


##  Como Compilar
1. Realize o clone deste repositório no seu ambiente local.
2. Este repositório utiliza um arquivo `.gitignore` rígido. Para compilar, você precisará criar localmente a sua própria `UnitCredenciais.pas` declarando as constantes de Host, Login e Senha para o seu servidor, podendo utilizar o 'ConfigCredenciais_Exemplo.pas' renomeando para o nome correto.
3. Abra o `.dproj` no Delphi 12 e execute o Build.

---
*Desenvolvido por Alexandre Batista*

<img width="593" height="499" alt="image" src="https://github.com/user-attachments/assets/0accf191-7303-4056-8ef1-c0adbd4b7a43" />
<img width="593" height="499" alt="image" src="https://github.com/user-attachments/assets/2d5ed3f6-6c31-4081-be99-77d572755b4d" />
<img width="590" height="495" alt="image" src="https://github.com/user-attachments/assets/9a87f363-a08d-4400-bbb1-4cfa4fca046b" />
<img width="588" height="494" alt="image" src="https://github.com/user-attachments/assets/512ebede-c44e-478b-8832-b517eb5a4db8" />
<img width="589" height="492" alt="image" src="https://github.com/user-attachments/assets/7d78855e-4c61-4a98-82c5-ab5afe3ff37b" />
