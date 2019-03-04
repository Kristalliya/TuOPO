unit TestTest1Unit;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, AdaptersUnit, System.Generics.Collections, Test1Unit, TestsUnit,
  AccessAdapterUnit;

type
  // Test methods for class Test1

  TestTest1 = class(TTestCase)
  strict private
    Fest1: Test1;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestsetTest;
    procedure TestgetQuest;
    procedure TestgetAnswer;
    procedure TestgetCorrect;
  end;

implementation

procedure TestTest1.SetUp;
begin
  Fest1 := Test1.Create;
end;

procedure TestTest1.TearDown;
begin
//  Fest1.Free;
  Fest1 := nil;
end;

procedure TestTest1.TestsetTest;
var
  caption: string;
begin
  // TODO: Setup method call parameters
  Caption:='�������� � ���������� ����������';
  Fest1.setTest(caption);
  CheckEquals(caption,'�������� � ���������� ����������');
  // TODO: Validate method results
end;

procedure TestTest1.TestgetQuest;
var
  ReturnValue: TList<string>;
begin
  Fest1.SetTest('�������� � ���������� ����������');
  ReturnValue := Fest1.getQuest;
  CheckNotEquals(returnValue.Items[0],'aaa');
  CheckEquals(ReturnValue.First,'����� ����������� ������������ �����.');
  CheckNotEquals(ReturnValue.First, ' ');
  // TODO: Validate method results
end;

procedure TestTest1.TestgetAnswer;
var
  ReturnValue1: TList<string>;
  ReturnValue2: TList<string>;
begin
  Fest1.SetTest('�������� � ���������� ����������');
  ReturnValue1:= Fest1.getQuest;
  ReturnValue2 := Fest1.getAnswer;
  CheckNotEquals(returnValue1.Items[0],'aaa');
  CheckEquals(ReturnValue2.Items[0],'����������� ������ (������), �� ������� ��������, �� ���������� ������� ����������������');
  CheckEquals(ReturnValue2.Items[1],'��� ����������, ������� ����� �� � ������ ������ �������');
  CheckNotEquals(ReturnValue1.Items[1],'nnnn');
  CheckEquals(ReturnValue1.Count,23);
  CheckNotEquals(ReturnValue1.Count,24);
  CheckEquals(ReturnValue2.Count,10);
  CheckNotEquals(ReturnValue2.Count,11);
  // TODO: Validate method results
end;

procedure TestTest1.TestgetCorrect;
var
  ReturnValue: TDictionary<integer,integer>;
  ReturnValue1: TList<string>;
  ReturnValue2: TList<string>;
begin
  Fest1.SetTest('�������� � ���������� ����������');
  ReturnValue1:= Fest1.getQuest;
  ReturnValue2 := Fest1.getAnswer;
  ReturnValue := Fest1.getCorrect;
  // TODO: Validate method results
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTest1.Suite);
end.

