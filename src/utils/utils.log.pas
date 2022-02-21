unit utils.log;

interface

uses
  System.SysUtils;

  procedure AddLog(Log : String);
  procedure AddLogResponse(Verbo, EndPoint, Log : String);

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

end.
