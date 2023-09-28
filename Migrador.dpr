program Migrador;

uses
  Vcl.Forms,
  uMigrador in 'uMigrador.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
