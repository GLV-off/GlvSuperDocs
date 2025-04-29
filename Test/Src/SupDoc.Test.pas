unit SupDoc.Test;

{$I 'test.inc'}

interface

uses
  Classes,
  SysUtils,
  fpcunit,
  testutils,
  testregistry,
  SupDoc.Xlsx.Doc,
  SupDoc.Fakes;

type
  TXlsxDocTest = class(TTestCase)
  protected
    FDoc: TXlsxDoc;
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestSimulation;
  end;

implementation

procedure TXlsxDocTest.SetUp;
begin
  FDoc := TXlsxDoc.Create(
    TFakeRows.Create,
    TFakeCols.Create
  );
end;

procedure TXlsxDocTest.TearDown;
begin
  FreeAndNil(FDoc);
end;

procedure TXlsxDocTest.TestSimulation;
begin
  FDoc.Rows.Add('first row of text');
  CheckEquals(1, FDoc.Rows.Count);
  CheckEquals('first row of text', FDoc.Rows.Row[0].Value);
end;

initialization

RegisterTest(TXlsxDocTest);

end.

