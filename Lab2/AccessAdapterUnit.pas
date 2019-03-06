unit AccessAdapterUnit;

interface

uses
  SysUtils {StrToInt} ,
  Data.DB {TDataSource} ,
  Data.Win.ADODB {TADOQuery} ,
  System.Generics.Collections {TDictionary} ,
  AdaptersUnit;

type
  AccessAdapter = class(TInterfacedObject, Adapters)
  private
    Caption: string;
    ADOConnection: TADOConnection;
    function getAnswerTableName: string;
    function getAnswerTable(answer:string):TList<string>;
    function getQuestTableName:string;
    function getQuestTable(quest:string):TList<string>;
    function getCorrectTableName:string;
    function getCorrectTable (correct:string):TDictionary<integer,integer>;
    function getMenu: TList<string>;
    procedure setTest(Caption: string);
    function getQuest: TList<string>;
    function getAnswer: TList<String>;
    function getCorrect: TDictionary<integer, integer>;
  published
    constructor create;
  end;

implementation

{ AccessAdapter }

constructor AccessAdapter.create;
begin
  ADOConnection := TADOConnection.create(nil);
  with (ADOConnection) do
  begin
    Provider := 'Microsoft.ACE.OLEDB.12.0';
    Mode := cmShareDenyNone;
    LoginPrompt := False;
    ConnectionString := 'Provider=Microsoft.ACE.OLEDB.12.0;' +
      'Data Source=Phisics.accdb;' + 'Persist Security Info=False';
    Connected := true;
  end;
end;

function AccessAdapter.getAnswer: TList<String>;
var
  ADOQuery: TADOQuery;
  answer: string;
begin
    answer:=getAnswerTableName;
    result:=getAnswerTable(answer);
end;

function AccessAdapter.getAnswerTable(answer:string):TList<string>;
var
  ADOQuery: TADOQuery;
begin
  result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.add('SELECT caption FROM ' + answer + ';');
    Open;
    Active := true;
  end;
  while not ADOQuery.Eof do
  begin
    result.add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getAnswerTableName: string;
var
  ADOQuery: TADOQuery;
begin
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.add('SELECT answer FROM Main WHERE caption="' + Self.Caption + '";');
    Open;
    Active := true;
  end;
  ADOQuery.First;
  result := ADOQuery.FieldByName('answer').AsString;
  ADOQuery.Free;
end;

function AccessAdapter.getCorrect: TDictionary<integer, integer>;
var
  correct: string;
begin
  correct:=getCorrectTableName;
  result:=getCorrectTable(correct);
end;

function AccessAdapter.getCorrectTable(
  correct: string): TDictionary<integer, integer>;
var
  ADOQuery:TADOQuery;
begin
  result := TDictionary<integer, integer>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.add('SELECT quest_id, answer_id FROM ' + correct + ';');
    Open;
    Active := true;
  end;
//  ADOQuery.First;
  while not ADOQuery.Eof do
  begin
    result.add(StrToInt(ADOQuery.FieldByName('quest_id').AsString),
      StrToInt(ADOQuery.FieldByName('answer_id').AsString));
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getCorrectTableName: string;
var
  ADOQuery:TADOQuery;
begin
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.add('SELECT correct FROM Main WHERE caption="' + Self.Caption + '";');
    Open;
    Active := true;
  end;
  ADOQuery.First;
  result := ADOQuery.FieldByName('correct').AsString;
  ADOQuery.Free;
end;

function AccessAdapter.getMenu: TList<string>;
var
  ADOQuery: TADOQuery;
  DataSource: TDataSource;
begin
  result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.add('SELECT caption FROM Main;');
    Open;
    Active := true;
  end;
  ADOQuery.First;
  while not ADOQuery.Eof do
  begin
    result.add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getQuest: TList<string>;
var
  ADOQuery: TADOQuery;
  quest: string;
begin
  quest:=getAnswerTableName;
  result:=getAnswerTable(quest);

end;

function AccessAdapter.getQuestTable(quest: string): TList<string>;
var
  ADOQuery: TADOQuery;
begin
  result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.add('SELECT caption FROM ' + quest + ';');
    Open;
    Active := true;
  end;
  ADOQuery.First;
  while not ADOQuery.Eof do
  begin
    result.add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getQuestTableName: string;
var
  ADOQuery: TADOQuery;
begin
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    Close;
    SQL.Clear;
    SQL.add('SELECT quest FROM Main WHERE caption="' + Self.Caption + '";');
    Open;
    Active := true;
  end;
  ADOQuery.First;
  result := ADOQuery.FieldByName('quest').AsString;
  ADOQuery.Free;
end;

procedure AccessAdapter.setTest(Caption: string);
begin
  Self.Caption := Caption;
end;

end.
