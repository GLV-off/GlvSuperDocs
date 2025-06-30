unit SupDoc.Test;

{$I 'test.inc'}

interface

uses
  SysUtils,
  Classes,
  fpcunit,
  testregistry,
  SupDoc.Xlsx.Doc,
  SupDoc.Props,
  SupDoc.Rows,
  SupDoc.Fakes;

type
  TXlsxRowsTest = class(TTestCase)
  protected
    FRows: TRows;
    procedure Setup; override;
    procedure TearDown; override;
  published
    procedure TestRowsCount;
    procedure TestRowsAdd;
  end;

  TXlsxRowTest = class(TTestCase)
  published

  end;

  TPropsTest = class(TTestCase)
  strict protected
    FProps: TProps;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestAfterConstructionCountIzZero;
  end;

implementation

{ ==== TXlsxRowsTest ======================================================== }

procedure TXlsxRowsTest.Setup;
begin
  FRows := TXlsxRows.Create(
    TXlsxRowsList.Create()
  );
end;

procedure TXlsxRowsTest.TearDown;
begin
  FreeAndNil(FRows);
end;

procedure TXlsxRowsTest.TestRowsCount;
begin
  CheckEquals(0, FRows.Count);
end;

procedure TXlsxRowsTest.TestRowsAdd;
begin
  FRows.Add('simple dimple');
  CheckEquals(1, FRows.Count);
end;

{ ==== TPropsTest =========================================================== }

procedure TPropsTest.SetUp;
begin
  FProps := TDefProps.Create();
end;

procedure TPropsTest.TearDown;
begin
  FreeAndNil(FProps);
end;

procedure TPropsTest.TestAfterConstructionCountIzZero;
begin
  CheckEquals(0, FProps.Count);
end;

{ =========================================================================== }

initialization

RegisterTest(TPropsTest);
RegisterTest(TXlsxRowsTest);

end.

