unit model.dao.generic;

interface

uses
  connection.firebird, connection.mysql, System.JSON, System.SysUtils,
  DataSet.Serialize, FireDAC.Comp.Client, utils.log, Vcl.Clipbrd;


//ESCOLHA SEU BANCO DE DADOS
type
//TGenericDAO = class(TConnectionFB)
  TGenericDAO = class(TConnectionMySQL)
    function  NewId(Table, PK_Name : string) : Integer;
    procedure DeleteRow(Table, PK, Value: string);
    procedure ExecSQL(Query : TFDQuery);
    procedure OpenTable(Query : TFDQuery);
  end;

implementation

{ TGenericDAO }

procedure TGenericDAO.DeleteRow(Table, PK, Value: string);
var QDelete : TFDQuery;
begin
  QDelete := getQuery;
  try
    QDelete.SQL.Text :=
    'DELETE FROM :TABLE '+
    'WHERE :PK = :VALUE';
    QDelete.ParamByName('TABLE').AsString := Table;
    QDelete.ParamByName('PK').AsString    := PK;
    QDelete.ParamByName('VALUE').AsString := Value;

    QDelete.ExecSQL;
  finally
    closeQuery(QDelete);
  end;
end;

procedure TGenericDAO.ExecSQL(Query: TFDQuery);
begin
  try
    Query.ExecSQL;
  except on E: Exception do
    AddLog(e.Message);
  end;
end;

function TGenericDAO.NewId(Table, PK_Name: string): Integer;
var QSelect : TFDQuery;
begin
  QSelect := getQuery;
  try
    QSelect.SQL.Text :=
    'SELECT MAX('+PK_Name+') + 1 AS ID FROM '+Table;

    OpenTable(QSelect);

    if QSelect.FieldByName('ID').AsInteger = 0 then
      Result := 1

    else
      Result := QSelect.FieldByName('ID').AsInteger;
  finally
    closeQuery(QSelect);
  end;
end;

procedure TGenericDAO.OpenTable(Query: TFDQuery);
begin
  try
    Query.Open;
  except on E: Exception do
    AddLog(e.Message);
  end;
end;

end.
