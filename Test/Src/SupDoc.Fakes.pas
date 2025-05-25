unit SupDoc.Fakes;

{$I 'test.inc'}

interface

uses
  SysUtils,
  SupDoc.Cols,
  SupDoc.Rows;

type
  TFakeCols = class(TCols)
  public
  end;

  TFakeRow = class(TRow)
  strict protected
    function GetValue: UnicodeString; override;
  public

  end;

  TFakeRows = class(TRows)
  strict protected
    FRow: TRow;
    FInserted: Boolean;
    function GetRow(const AIndex: Int64): TRow; override;
    function GetCount: Int64; override;
  public
    constructor Create(const ARow: TRow);
    destructor Destroy; override;
    procedure Add(const Avalue: UnicodeString); override;
  end;

implementation

function TFakeRow.GetValue: UnicodeString;
begin
  Result := '';
end;

function TFakeRows.GetRow(const AIndex: Int64): TRow;
begin
  if not FInserted then
    raise Exception.Create('no element''s in rows!');
  Result := FRow;
end;

function TFakeRows.GetCount: Int64;
begin
  if FInserted then
    Result := 1
  else
    Result := 0;
end;

constructor TFakeRows.Create(const ARow: TRow);
begin
  inherited Create;
  FRow := ARow;
  FInserted := False;
end;

destructor TFakeRows.Destroy;
begin
  FreeAndNil(FRow);
  inherited Destroy;
end;

procedure TFakeRows.Add(const Avalue: UnicodeString);
begin
  FInserted := True;

end;

end.

