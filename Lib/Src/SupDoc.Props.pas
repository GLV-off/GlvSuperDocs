unit SupDoc.Props;

{$I 'lib.inc'}

interface

uses
  SysUtils,
  Generics.Collections;

type
  {
  }
  TPropsDict = TDictionary<UnicodeString, UnicodeString>;

  {
  }
  TProps = class abstract(TInterfacedObject)
  strict protected
    function GetCount: Int64; virtual; abstract;
    function GetProp(const AKey: UnicodeString): UnicodeString; virtual; abstract;
  public
    {}
    function Change(
      const AKey: UnicodeString;
      const AValue: UnicodeString): TProps; virtual; abstract;

    {}
    function Add(
      const AKey: UnicodeString;
      const AValue: UnicodeString): TProps; virtual; abstract;

    {}
    property Prop[const AKey: UnicodeString]: UnicodeString read GetProp;
    property Count: Int64 read GetCount;
  end;

  {
  }
  TBaseProps = class(TProps)
  strict protected
    FItems: TPropsDict;

    {
    }
    function GetCount: Int64; override;

    {
    }
    function GetProp(const AKey: UnicodeString): UnicodeString; override;
  public
    constructor Create;
    destructor Destroy; override;

    {}
    function Change(
      const AKey: UnicodeString;
      const AValue: UnicodeString): TProps; override;

    {}
    function Add(
      const AKey: UnicodeString;
      const AValue: UnicodeString): TProps; override;
  end;

  {
  }
  TDefProps = class(TBaseProps)
  end;

implementation

constructor TBaseProps.Create;
begin
  inherited Create;
  FItems := TPropsDict.Create;
end;

destructor TBaseProps.Destroy;
begin
  FreeAndNil(FItems);
  inherited Destroy;
end;

function TBaseProps.GetCount: Int64;
begin
  Result := FItems.Count;
end;

function TBaseProps.GetProp(const AKey: UnicodeString): UnicodeString;
begin
  { TODO: GLV-off:
    #1 Проверка на наличие свойства?
    #2 Бросать исключения при попытке обращения
       к несуществующему свойству? }
  Result := FItems[AKey];
end;

function TBaseProps.Change(
  const AKey: UnicodeString;
  const AValue: UnicodeString): TProps;
begin
  if FItems.ContainsKey(AKey) then
    FItems[AKey] := AValue;
  Result := Self;
end;

function TBaseProps.Add(
  const AKey: UnicodeString;
  const AValue: UnicodeString): TProps;
begin
  if not FItems.ContainsKey(AKey) then
    FItems.AddOrSetValue(AKey, AValue);
  Result := Self;
end;

end.

