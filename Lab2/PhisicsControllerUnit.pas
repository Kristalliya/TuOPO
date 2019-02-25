unit PhisicsControllerUnit;

interface

uses
  MenuUnit, MainUnit,
  System.Generics.Collections {TDictionary} ,
  ControllersUnit;

type
  PhisicsController = class(TInterfacedObject, Controllers)
  private
    /// <link>aggregation</link>
    Menu1: Main;
  public
    function getMenu: TList<string>;
  end;

implementation

{ PhisicsController }

function PhisicsController.getMenu: TList<string>;
begin
  result:=TList<String>.Create;
  Menu1:=Menu.Create;
  Result.Add('Test1');
  Result.Add('Test2');
  result:=Menu1.getMenu;
end;

end.
