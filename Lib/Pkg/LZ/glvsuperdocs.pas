{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit GlvSuperDocs;

{$warn 5023 off : no warning about unused units}
interface

uses
  SupDoc.Cols, SupDoc.Doc, SupDoc.Rows, SupDoc.Xlsx.Doc, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('GlvSuperDocs', @Register);
end.
