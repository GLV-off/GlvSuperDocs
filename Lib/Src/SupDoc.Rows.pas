unit SupDoc.Rows;

{$I 'lib.inc'}

interface

type
  TRow = class abstract(TInterfacedObject)
  strict protected
    function GetValue: UnicodeString; virtual; abstract;
  public
    property Value: UnicodeString read GetValue;
  end;

  TRows = class abstract(TInterfacedObject)
  strict protected
    function GetRow(const AIndex: Int64): TRow; virtual; abstract;
    function GetCount: Int64; virtual; abstract;
  public
    procedure Add(const ALine: UnicodeString); virtual; abstract;
    property Row[const AIndex: Int64]: TRow read GetRow;
    property Count: Int64 read GetCount;
  end;

implementation

end.

