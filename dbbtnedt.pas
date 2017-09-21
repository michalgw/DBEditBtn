{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit dbbtnedt;

{$warn 5023 off : no warning about unused units}
interface

uses
  DBEditBtn, dbeditbtnreg, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('dbeditbtnreg', @dbeditbtnreg.Register);
end;

initialization
  RegisterPackage('dbbtnedt', @Register);
end.
