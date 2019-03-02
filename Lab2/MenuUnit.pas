unit MenuUnit;

interface

uses
  AccessAdapterUnit, AdaptersUnit,
  MainUnit, System.Generics.Collections {TDictionary};

type
  Menu = class(TInterfacedObject, Main)
  private
    /// <link>aggregation</link>
    Adapter1: Adapters;
    function getMenu: TList<string>;
  end;

implementation

{ Menu }

function Menu.getMenu: TList<string>;
begin
  result := TList<String>.Create;
  Adapter1 := AccessAdapter.Create;
  result := Adapter1.getMenu;
end;

end.
