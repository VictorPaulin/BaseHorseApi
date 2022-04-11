unit endpoints.serverinfo;

interface

uses
{$REGION 'Horse'}
  Horse, Horse.BasicAuthentication,
{$ENDREGION}
system.SysUtils,vcl.Dialogs, utils.log;


procedure Registry;

implementation
const EndPointName = '/server-info';

procedure Registry;
var date : String;
begin
  AddLog('Registrando rota ' + EndPointName);

  THorse.Get('/server-info',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      date := DateTimeToStr(now);
      Res.Send('<h1>Servidor Horse Online <br/>' + date + '<h1/>');
    end);
end;
end.
