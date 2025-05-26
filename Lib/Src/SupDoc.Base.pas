unit SupDoc.Base;

{$I 'lib.inc'}

interface

uses
  Classes,
  SysUtils;

type
  TDocObj = class(TInterfacedObject)
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation
 
constructor TDocObj.Create;
begin
  
end;

destructor TDocObj.Destroy; override;
begin
inherited Destroy;  
end;

end.

