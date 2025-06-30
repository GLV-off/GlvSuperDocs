unit SupDoc.Props.Test;

{$I 'test.inc'}

interface

uses
  Glv.Testing.Cross,
  SupDoc.Props;

type
  TPropsTest = class(TCrossTestCase)
  strict protected
    FProps: TProps;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestAddingTwoSameKeysIsCountAsOne;
    procedure TestAfterAddingPropertyCountChanged;
    procedure TestAddingProperties;
    procedure TestAccessNotExistedProperty;
    procedure TestAfterConstructionCountIzZero;
    procedure TestChangingProperty;
    procedure TestChangingNotExistentProperty;
  end;

implementation

uses
  SysUtils;

{ ==== TPropsTest =========================================================== }

procedure TPropsTest.SetUp;
begin
  FProps := TDefProps.Create();
end;

procedure TPropsTest.TearDown;
begin
  FreeAndNil(FProps);
end;

procedure TPropsTest.TestAddingTwoSameKeysIsCountAsOne;
begin
  FProps.Add('a','b');
  FProps.Add('a','c');
  CheckEquals(1, FProps.Count);
end;

procedure TPropsTest.TestAfterAddingPropertyCountChanged;
begin
  FProps.Add('foo', 'bar');
  CheckEquals(1, FProps.Count);
end;

procedure TPropsTest.TestAddingProperties;
begin
  FProps.Add('foo', 'bar');
  CheckEquals('bar', FProps.Prop['foo']);

  FProps.Add('', 'dar');
  CheckEquals('dar', FProps.Prop['']);

  FProps.Add('a a', 'b');
  CheckEquals('b', FProps.Prop['a a']);
end;

procedure TPropsTest.TestAccessNotExistedProperty;
begin

end;

procedure TPropsTest.TestAfterConstructionCountIzZero;
begin
  CheckEquals(0, FProps.Count);
end;

procedure TPropsTest.TestChangingProperty;
begin
  FProps.Add('a','b');
  FProps.Change('a', 'c');
  CheckEquals('c', FProps.Prop['a']);
end;

procedure TPropsTest.TestChangingNotExistentProperty;
begin
  FProps.Change('empty','new');
  CheckEquals('', FProps.Prop['empty']);
end;

{ =========================================================================== }


initialization

CrossRegTest(TPropsTest);

end.

