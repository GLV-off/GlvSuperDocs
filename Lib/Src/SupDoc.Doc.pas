unit SupDoc.Doc;

{$I 'lib.inc'}

interface

uses
  SupDoc.Cols,
  SupDoc.Rows;

type
  TDoc = class abstract(TInterfacedObject)
  strict protected
    function GetRows: TRows; virtual; abstract;
    function GetCols: TCols; virtual; abstract;
  public
    property Cols: TCols read GetCols;
    property Rows: TRows read GetRows;
  end;

  TDocBase = class(TDoc)
  strict protected
    FRows: TRows;
    FCols: TCols;
    function GetRows: TRows; override;
    function GetCols: TCols; override;
  public
    constructor Create(const ARows: TRows; const ACols: TCols); overload;
    destructor Destroy; override;
  end;

implementation

constructor TDocBase.Create(
  const ARows: TRows;
  const ACols: TCols);
begin
  inherited Create;
  FRows := ARows;
  FCols := ACols;
end;

destructor TDocBase.Destroy;
begin
  inherited Destroy;
end;


function TDocBase.GetRows: TRows;
begin
  Result := FRows;
end;

function TDocBase.GetCols: TCols;
begin
  Result := FCols;
end;

end.

