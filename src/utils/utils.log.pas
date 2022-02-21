unit utils.log;

interface

uses
  System.SysUtils;

  procedure AddLog(Log : String);
  procedure AddLogResponse(Verbo, EndPoint, Log : String);
  procedure BoasVindas;

implementation

procedure AddLog(Log : String);
begin
  Writeln('LOG ' + DateTimeToStr(now));
  Writeln('  ' + Log);
end;

procedure AddLogResponse(Verbo, EndPoint, Log : String);
begin
  Writeln('LOG ' + DateTimeToStr(now));
  Writeln('  ' + VERBO + EndPoint);
  Writeln('  ' + Log);
end;

procedure BoasVindas;
var txt : string;
begin
  txt :=  '********************************************************************' + sLineBreak +
          '*                           Bem-Vindo ao                           *' + sLineBreak +
          '*                             Alma-API                             *' + sLineBreak +
          '*                         Fatec Ourinhos - SP                      *' + sLineBreak +
          '********************************************************************';

  Writeln(txt);
end;

end.
