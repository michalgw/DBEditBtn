unit dbeditbtnreg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

procedure Register;

implementation

uses
  DBEditBtn;

procedure Register;
begin
  RegisterComponents('Data Controls', [TDBEditButton, TDBCalcEdit]);
end;

end.

