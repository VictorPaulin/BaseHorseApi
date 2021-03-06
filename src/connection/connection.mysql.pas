unit connection.mySql;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.IOUtils, FireDAC.Comp.UI,
  FireDAC.Phys.MySQL, utils.ini;

type
  TConnectionMySQL = class
  private
    { Private declarations }
    FDriverLink: TFDPhysMySQLDriverLink;
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

procedure TConnectionMySQL.closeQuery(query: TFDQuery);
begin
  query.Connection.Close;
  query.Connection.Free;
  query.Free;
end;

procedure TConnectionMySQL.connect(database: TFDConnection);
begin
  database.Connected := True;
end;

function TConnectionMySQL.getConnection: TFDConnection;
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

function TConnectionMySQL.getQuery: TFDQuery;
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

procedure TConnectionMySQL.setParams(database: TFDConnection);
begin
  database.Params.Values['Server']   := IpServidor;
  database.Params.Values['Database'] := DatabaseName;
  database.Params.Values['Port']     := Porta;
  database.Params.Values['UserName'] := Usuario;
  database.Params.Values['Password'] := Senha;
  database.Params.Values['DriverID'] := 'MySQL';
  database.LoginPrompt := False;

  if not Assigned(FDriverLink) then
    FDriverLink := TFDPhysMySQLDriverLink.Create(nil);

  FDriverLink.VendorLib := Driver;
end;

end.
