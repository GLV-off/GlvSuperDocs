program Test;

{$I 'test.inc'}

uses
  Glv.Testing.App,
  SupDoc.Test,
  SupDoc.Props.Test;

begin
  Glv.Testing.App.Run('Super Docs auto test''s');
{$IFDEF DEBUG}
  ReadLn;
{$ENDIF DEBUG}
end.
