unit utils.basicauth;

interface

uses
{$REGION 'FireDAC'}
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.IOUtils, FireDAC.Comp.UI,
  FireDAC.Phys.MySQL,
{$ENDREGION}
{$REGION 'Horse'}
  Horse, Horse.BasicAuthentication,
{$ENDREGION}
system.SysUtils, vcl.Dialogs;

procedure Registry;

implementation

procedure Registry;
begin
  THorse.Use(HorseBasicAuthentication(
    function(const AUsername, APassword: string): Boolean
    begin
      if (AUsername = 'usuario') and (APassword = 'senha') then
        Result := True

      else
        Result := False;
    end));
end;

end.

