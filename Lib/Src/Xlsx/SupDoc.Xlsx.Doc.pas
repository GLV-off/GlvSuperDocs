unit SupDoc.Xlsx.Doc;

{$I 'lib.inc'}

interface

uses
  SysUtils,
  Generics.Collections,
  SupDoc.Doc,
  SupDoc.Rows;

type
  TXlsxDoc = class(TDocBase)
  public
  end;

  TXlsxRowsList = class(TObjectList<TRow>)
  public
    constructor Create;
  end;

  TXlsxRows = class(TRows)
  strict protected
    FItems: TXlsxRowsList;
    function GetCount: Int64; override;
    function GetRow(const AIndex: Int64): TRow; override;
  public
    constructor Create(const AItems: TXlsxRowsList);
    destructor Destroy; override;
    procedure Add(const ALine: UnicodeString); override;
  end;

  TXlsxRow = class(TRow)
  strict protected
    FValue: UnicodeString;
    function GetValue: UnicodeString; override;
  public
    constructor Create(const AValue: UnicodeString);
    destructor Destroy; override;
  end;

implementation

constructor TXlsxRowsList.Create;
begin
  inherited Create(True);
end;

{ ==== TXlsxRows ============================================================ }

constructor TXlsxRows.Create(const AItems: TXlsxRowsList);
begin
  inherited Create;
  FItems := AItems;
end;

destructor TXlsxRows.Destroy;
begin
  FreeAndNil(FItems);
  inherited Destroy;
end;

procedure TXlsxRows.Add(const ALine: UnicodeString);
begin
  FItems.Add(
    TXlsxRow.Create(ALine)
  );
end;

{ --------------------------------------------------------------------------- }

function TXlsxRows.GetCount: Int64;
begin
  Result := FItems.Count;
end;

function TXlsxRows.GetRow(const AIndex: Int64): TRow;
begin
  { todo: GLV: check out of bounds }
  Result := Fitems.Items[AIndex];
end;

{ ==== TXlsxRow ============================================================= }

constructor TXlsxRow.Create(const AValue: UnicodeString);
begin
  inherited Create;
  FValue := AValue;
end;

destructor TXlsxRow.Destroy;
begin
  FValue := '';
  inherited Destroy;
end;

function TXlsxRow.GetValue: UnicodeString;
begin
  Result := FValue;
end;

{ =========================================================================== }

end.

