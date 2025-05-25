program Test;

{$I 'test.inc'}

uses
  Classes,
  consoletestrunner,
  fpcunittestinsight,
  SupDoc.Test;

type
  TMyTestRunner = class(TTestRunner)
  protected
    // override the protected methods
    // of TTestRunner to customize its behavior
  end;

var
  Application: TMyTestRunner;

begin
  DefaultRunAllTests:=True;
  DefaultFormat:=fPlain;
  Application := TMyTestRunner.Create(nil);
  Application.Initialize;
  Application.Title := 'FPCUnit Console test runner';
  Application.Run;
  Application.Free;
{$IFDEF DEBUG}
  ReadLn;
{$ENDIF DEBUG}
end.
