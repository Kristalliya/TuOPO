unit MenuUnit;

interface

uses
  AccessAdapterUnit, AdaptersUnit,
MainUnit, System.Generics.Collections {TDictionary};

type
  Menu = class(TInterfacedObject, Main)
  private
    /// <link>aggregation</link>
    Adapter1: adapters;
    function getMenu:TList<string>;
  end;

implementation

{ Menu }

function Menu.getMenu: TList<string>;
begin
  result:=TList<String>.Create;
  Adapter1:=AccessAdapter.Create;
  result:=;
end;

end.
