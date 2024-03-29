unit utils.ini;

interface

uses IniFiles, sysutils, Vcl.Dialogs;
procedure SetVariaveis;
procedure LerIni;
procedure GravarIni;

var
  NomeArquivo  : string;

  //Servi�o
  PortaRest    : string;

  //Banco de dados
  IpServidor   : string;
  Driver       : string;
  DatabaseName : string;
  Protocolo    : String;
  Porta        : string;
  Usuario      : string;
  Senha        : string;


implementation

procedure ExecuteLeituraIni;
begin
  SetVariaveis;
  LerIni;
  GravarIni;
end;

procedure SetVariaveis;
begin
  PortaRest    := '4814';

  IpServidor   := '127.0.0.1';
  Driver       := 'C:\libmysql.dll';
  DatabaseName := 'BaseHorseApi';
  Porta        := '3306';
  Usuario      := 'ODBC';
  Senha        := 'root';
end;

procedure LerIni;
var
  ini: TIniFile;
begin
  NomeArquivo := StringReplace(ExtractFileName(ParamStr(0)), '.exe', '', [rfReplaceAll]);
  NomeArquivo := ExtractFilePath(ParamSTR(0)) + NomeArquivo + '.ini';

  ini          := TIniFile.Create(NomeArquivo);

  PortaRest    := ini.ReadString('Rest','Porta',             PortaRest);
  IpServidor   := ini.ReadString('BancoDados','IpServidor',  IpServidor);
  Driver       := ini.ReadString('BancoDados','Driver',      Driver);
  DatabaseName := ini.ReadString('BancoDados','DatabaseName',DatabaseName);
  Porta        := ini.ReadString('BancoDados','Porta',       Porta);
  Usuario      := ini.ReadString('BancoDados','Usuario',     Usuario);
  Senha        := ini.ReadString('BancoDados','Senha',       Senha);

  ini.Free;
end;

procedure GravarIni;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(NomeArquivo);

  ini.WriteString('Rest','Porta',        PortaRest);
  ini.WriteString('BancoDados', 'IpServidor',   IpServidor);
  ini.WriteString('BancoDados', 'Driver',       Driver);
  ini.WriteString('BancoDados', 'DatabaseName', DatabaseName);
  ini.WriteString('BancoDados', 'Porta',        Porta);
  ini.WriteString('BancoDados', 'Usuario',      Usuario);
  ini.WriteString('BancoDados', 'Senha',        Senha);

  ini.Free;
end;


initialization
ExecuteLeituraIni;

end.



