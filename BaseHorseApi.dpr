program BaseHorseApi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.BasicAuthentication,
  connection.mysql in 'src\connection\connection.mysql.pas',
  utils.basicauth in 'src\utils\utils.basicauth.pas',
  utils.log in 'src\utils\utils.log.pas',
  utils.startserver in 'src\utils\utils.startserver.pas',
  utils.ini in 'src\utils\utils.ini.pas',
  endpoints.serverinfo in 'src\endpoints\endpoints.serverinfo.pas';

begin
  try
    //Autenticação
    //utils.basicauth.Registry; //DESCOMENTE ESTA LINHA PARA USAR

    //Rotas registradas
    endpoints.serverinfo.Registry;

    //Inicia o servidor
    utils.startserver.Registry;
  except
    on E: Exception do
      Writeln('Falha ao iniciar servidor ' + e.Message);
  end;
end.
