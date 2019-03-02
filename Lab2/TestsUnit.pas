unit TestsUnit;

interface

uses
System.Generics.Collections {TDictionary};

type
  Tests=interface
    procedure setTest(Caption:string);
    function getQuest:TList<string>;
    function getAnswer:TList<String>;
    function getCorrect:TDictionary<integer,integer>;
  end;
implementation

end.
