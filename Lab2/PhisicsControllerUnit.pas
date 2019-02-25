unit PhisicsControllerUnit;

interface

uses
  System.Generics.Collections {TDictionary} ,
  ControllersUnit;

type
  PhisicsController = class(TInterfacedObject, Controllers)
  public
    function getMenu: TList<string>;
  end;

implementation

{ PhisicsController }

function PhisicsController.getMenu: TList<string>;
begin
  result:=TList<String>.Create;
  Result.Add('Test1');
  Result.Add('Test2');
end;

end.
