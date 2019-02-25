unit Unit1;

interface

uses
  System.Generics.Collections {TDictionary} ,
  PhisicsControllerUnit {PhisicsController} ,
  ControllersUnit {Controllers} ,
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    /// <link>aggregation</link>
    Controller1: Controllers;
    procedure CreatePanels(list: TList<string>);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CreatePanels(list: TList<string>);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Controller1 := PhisicsController.Create;
  CreatePanels(Controller1.getMenu);
end;

end.
