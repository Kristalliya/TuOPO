unit ControllersUnit;

interface

uses
  System.Generics.Collections {TDictionary};

type
  Controllers = interface
    function getMenu: TList<string>;
  end;

implementation

end.
