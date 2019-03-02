unit AdaptersUnit;

interface

uses
  System.Generics.Collections {TDictionary};

type
  Adapters = interface
    function getMenu:TList<string>;
    procedure setTest(caption:string);
    function  getQuest:Tlist<string>;
    function  getAnswer:TList<String>;
    function  getCorrect:TDictionary<integer,integer>;
  end;

implementation

end.
