unit SupDoc.Factory;

{$I 'lib.inc'}

interface

uses 
  SupDoc.Doc;

type
  TDocumentFactory = class abstract(TInterfacedObject)
  public
    function NewDocument: TDoc; virtual; abstract;
  end;

implementation

end.
