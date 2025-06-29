unit SupDoc.Doc;

{$I 'lib.inc'}

interface

uses
  SupDoc.Props,
  SupDoc.Cols,
  SupDoc.Rows;

type
  TDoc = class abstract(TInterfacedObject)
  strict protected
    function GetCaption: UnicodeString; virtual; abstract;
    procedure SetCaption(const AValue: UnicodeString); virtual; abstract;
    function GetDescription: UnicodeString; virtual; abstract;
    procedure SetDescription(const AValue: UnicodeString); virtual; abstract;
    function GetProps: TProps; virtual; abstract;
    procedure SetProps(const AValue: TProps); virtual; abstract;
  public
    property Caption: UnicodeString
      read GetCaption
      write SetCaption;

    property Description: UnicodeString
      read GetDescription
      write SetDescription;

    property Props: TProps
      read GetProps
      write SetProps;
  end;

  {
  }
  TDocDecorated = class abstract(TDoc)
  strict protected
    FOrigin: TDoc;
    function GetCaption: UnicodeString; override;
    procedure SetCaption(const AValue: UnicodeString); override;
    function GetDescription: UnicodeString; override;
    procedure SetDescription(const AValue: UnicodeString); override;
    function GetProps: TProps; override;
    procedure SetProps(const AValue: TProps); override;
  public
    constructor Create(const AOrigin: TDoc);
    destructor Destroy; override;
  end;

  {
  }
  TDocBase = class(TDoc)
  strict protected
    FCaption: UnicodeString;
    FDescription: UnicodeString;
    FProps: TProps;
    function GetCaption: UnicodeString; override;
    procedure SetCaption(const AValue: UnicodeString); override;
    function GetDescription: UnicodeString; override;
    procedure SetDescription(const AValue: UnicodeString); override;
    function GetProps: TProps; override;
    procedure SetProps(const AValue: TProps); override;
  public
    constructor Create(
      const ACaption: UnicodeString;
      const ADescription: UnicodeString;
      const AProps: TProps
    );
    destructor Destroy; override;
  end;

implementation

uses
  SysUtils;

constructor TDocDecorated.Create(const AOrigin: TDoc);
begin
  inherited Create;
  FOrigin := AOrigin;
end;

destructor TDocDecorated.Destroy;
begin
  FreeAndNil(FOrigin);
  inherited Destroy;
end;

function TDocDecorated.GetCaption: UnicodeString;
begin
  Result := FOrigin.Caption;
end;

procedure TDocDecorated.SetCaption(const AValue: UnicodeString);
begin
  FOrigin.Caption := AValue;
end;

function TDocDecorated.GetDescription: UnicodeString;
begin
  Result := FOrigin.Description;
end;

procedure TDocDecorated.SetDescription(const AValue: UnicodeString);
begin
  FOrigin.Description := AValue;
end;

function TDocDecorated.GetProps: TProps;
begin
  Result := FOrigin.Props;
end;

procedure TDocDecorated.SetProps(const AValue: TProps);
begin
  FOrigin.Props := AValue;
end;

function TDocBase.GetCaption: UnicodeString;
begin
  Result := FCaption;
end;

procedure TDocBase.SetCaption(const AValue: UnicodeString);
begin
  FCaption := AValue;
end;

function TDocBase.GetDescription: UnicodeString;
begin
  Result := FDescription;
end;

procedure TDocBase.SetDescription(const AValue: UnicodeString);
begin
  FDescription := AValue;
end;

function TDocBase.GetProps: TProps;
begin
  Result := FProps;
end;

procedure TDocBase.SetProps(const AValue: TProps);
begin
  if FProps <> AValue then
  begin
    FreeAndNil(FProps);
    FProps := AValue;
  end;
end;

constructor TDocBase.Create(
  const ACaption: UnicodeString;
  const ADescription: UnicodeString;
  const AProps: TProps);
begin
  inherited Create;
  FCaption := ACaption;
  FDescription := ADescription;
  FProps := AProps;
end;

destructor TDocBase.Destroy;
begin
  FCaption := '';
  FDescription := '';
  FreeAndNil(FProps);
  inherited Destroy;
end;

end.

