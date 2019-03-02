unit PhisicsControllerUnit;

interface

uses
  Test1Unit, TestsUnit,
  MenuUnit, MainUnit,
  System.Generics.Collections {TDictionary} ,
  ControllersUnit;

type
  PhisicsController = class(TInterfacedObject, Controllers)
  private
    Test: Tests;
    /// <link>aggregation</link>
    Menu1: Main;
  public
    procedure setTest(Caption: string);
    function getMenu: TList<string>;
    function getQuest: TList<string>;
    function getAnswer: TList<string>;
    function getCorrect: TDictionary<integer, integer>;
  end;

implementation

{ PhisicsController }

function PhisicsController.getAnswer: TList<string>;
begin
  result := TList<String>.Create;
  result := Test.getAnswer;
end;

function PhisicsController.getCorrect: TDictionary<integer, integer>;
begin
  result := TDictionary<integer, integer>.Create;
  result := Test.getCorrect;
end;

function PhisicsController.getMenu: TList<string>;
begin
  result := TList<String>.Create;
  Menu1 := Menu.Create;
  result := Menu1.getMenu;
end;

function PhisicsController.getQuest: TList<string>;
begin
  result := TList<String>.Create;
  result := Test.getQuest;
end;

procedure PhisicsController.setTest(Caption: string);
begin
  Test := Test1.Create;
  Test.setTest(caption);
end;

end.
