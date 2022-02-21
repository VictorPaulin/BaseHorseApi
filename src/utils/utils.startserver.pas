unit utils.startserver;

interface

uses
{$REGION 'Horse'}
  Horse, Horse.BasicAuthentication,
{$ENDREGION}
utils.ini, utils.log, system.SysUtils;

procedure Registry;

implementation

procedure Registry;
begin
  AddLog('Servidor ouvindo na porta ' + PortaRest);
  THorse.Listen(StrToInt(PortaRest));
end;

end.

