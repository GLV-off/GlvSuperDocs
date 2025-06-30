unit SupDoc.Glyph;

{$I 'lib.inc'}

interface

uses
  Generics.Collections;

type
  TGlyph = class(TInterfacedObject)
  public

  end;

  TGlyphs = class(TInterfacedObject)
  public
    procedure Add(const AGlyph: TGlyph); virtual; abstract;
  end;

  TBaseGlyph = class(TGlyph)
  public
  end;

  TBaseGlyphs = class(TGlyphs)
  strict private
    FItems: TObjectList<TGlyph>;
  public
    constructor Create(const AItems: TObjectList<TGlyph>);
    destructor Destroy; override;
    procedure Add(const AGlyph: TGlyph); override;
  end;

implementation

uses
  SysUtils;

constructor TBaseGlyphs.Create(const AItems: TObjectList<TGlyph>);
begin
  inherited Create;
  FItems := Aitems;
end;

destructor TBaseGlyphs.Destroy;
begin
  FreeAndNil(FItems);
  inherited Destroy;
end;

procedure TBaseGlyphs.Add(const AGlyph: TGlyph);
begin
  FItems.Add(AGlyph);
end;

end.

