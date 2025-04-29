{ This file was automatically created by Typhon IDE. Do not edit!
  This source is only used to compile and install the package.
 }

unit GlvSuperDocs;

{$warn 5023 off : no warning about unused units}
interface

uses
  SupDoc.Doc,
  SupDoc.Rows,
  SupDoc.Cols,
  SupDoc.Xlsx.Doc,
  TyphonPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('GlvSuperDocs', @Register);
end.
