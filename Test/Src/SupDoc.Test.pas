unit SupDoc.Test;

{$I 'test.inc'}

interface

uses
  SysUtils,
  Classes,
  Glv.Testing.Cross,
  SupDoc.Xlsx.Doc,
  SupDoc.Props,
  SupDoc.Rows,
  SupDoc.Fakes;

type
  TXlsxRowsTest = class(TCrossTestCase)
  protected
    FRows: TRows;
    procedure Setup; override;
    procedure TearDown; override;
  published
    procedure TestRowsCount;
    procedure TestRowsAdd;
  end;

  TXlsxRowTest = class(TCrossTestCase)
  published

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

initialization

CrossRegTest(TXlsxRowsTest);

end.

