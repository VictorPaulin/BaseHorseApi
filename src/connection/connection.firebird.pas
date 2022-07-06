unit connection.firebird;

interface

uses
  FireDAC.Phys.FB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.IOUtils, FireDAC.Comp.UI,
  FireDAC.Phys.MySQL, Data.DB, System.SysUtils, System.Classes, utils.ini;

type
  TConnectionFB = class
  private
    { Private declarations }
    FDriverLink: TFDPhysFBDriverLink;
    procedure setParams(database: TFDConnection);
    procedure connect(database: TFDConnection);
    function getConnection: TFDConnection;

  public
    { Public declarations }
    procedure closeQuery(query: TFDQuery);
    function getQuery: TFDQuery;
  end;

implementation

{ TdmConnection }

procedure TConnectionFB.closeQuery(query: TFDQuery);
begin
  query.Connection.Close;
  query.Connection.Free;
  query.Free;
end;

procedure TConnectionFB.connect(database: TFDConnection);
begin
  database.Connected := True;
end;

function TConnectionFB.getConnection: TFDConnection;
var
  NewDatabase: TFDConnection;
begin
  NewDatabase := TFDConnection.Create(nil);
  try
    setParams(NewDatabase);

    try
      connect(NewDatabase);
    except
      on E: Exception do
      begin
        raise Exception.Create('Não foi possivel conectar ao banco de dados ' + e.Message);
        Exit;
      end;
    end;

  finally
    Result := NewDatabase;
  end;
end;

function TConnectionFB.getQuery: TFDQuery;
var
  newDb: TFDConnection;
  newQuery: TFDQuery;
begin
  newQuery := TFDQuery.Create(nil);
  try
    newDb := getConnection;
    newQuery.Connection := newDb;
  finally
    Result := newQuery;
  end;

end;

procedure TConnectionFB.setParams(database: TFDConnection);
begin
  database.Params.Values['Server']   := IpServidor;
  database.Params.Values['Database'] := DatabaseName;
  database.Params.Values['Port']     := Porta;
  database.Params.Values['UserName'] := Usuario;
  database.Params.Values['Password'] := Senha;
  database.Params.Values['DriverID'] := 'FB';
  database.LoginPrompt := False;

  if not Assigned(FDriverLink) then
    FDriverLink := TFDPhysFBDriverLink.Create(nil);

  FDriverLink.VendorLib := Driver;
end;

end.

