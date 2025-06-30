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
  TPropsFilterCondition = function(
    const AKey: UnicodeString;
    const AValue: UnicodeString): Boolean of object;

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

    function Filter(
      const ACondition: TPropsFilterCondition): TProps; virtual; abstract;

    {}
    property Prop[const AKey: UnicodeString]: UnicodeString
      read GetProp;
    property Count: Int64
      read GetCount;
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
    constructor Create(const AItems: TPropsDict); overload;
    constructor Create; overload;
    destructor Destroy; override;

    {}
    function Change(
      const AKey: UnicodeString;
      const AValue: UnicodeString): TProps; override;

    function Filter(
      const ACondition: TPropsFilterCondition): TProps; override;

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

constructor TBaseProps.Create(const AItems: TPropsDict);
begin
  inherited Create;
  FItems := Aitems;
end;

constructor TBaseProps.Create;
begin
  Self.Create(TPropsDict.Create());
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
  FItems.TryGetValue(AKey, Result);
end;

function TBaseProps.Change(
  const AKey: UnicodeString;
  const AValue: UnicodeString): TProps;
begin
  if FItems.ContainsKey(AKey) then
    FItems[AKey] := AValue;
  Result := Self;
end;

function TBaseProps.Filter(const ACondition: TPropsFilterCondition): TProps;
var
  Key: UnicodeString;
  Value: UnicodeString;
begin
  Result := TBaseProps.Create();
  for Key in FItems.Keys do
  begin
    Value := FItems[Key];
    if Assigned(ACondition) and ACondition(Key, Value) then
      Result.Add(Key, Value);
  end;
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

