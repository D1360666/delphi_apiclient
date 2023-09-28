unit uMigrador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, System.JSON;

type
  TForm1 = class(TForm)
    cnnMysql: TFDConnection;
    cnnPgsql: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    Button1: TButton;
    memo: TMemo;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
  var
    resultado  : String;
    jsv, LItem : TJSONValue;
    LJSonArr   : TJSONArray;
    tabla      : String;
    http : TIdHTTP;
    JsonStreamEnvio : TStringStream;
begin
     memo.Lines.Clear;
try
try
  http := TIdHTTP.Create(nil);
  http.ReadTimeout := 5000;
  //Creo lista de parámetros

  JsonStreamEnvio := TStringStream.Create('{"idTipoAux":1,'+
                                          '"id":1,'+
                                          '"idMoneda":1,'+
                                          '"actualizar":0,'+
                                          '"estado":"",'+
                                          '"tope":0,'+
                                          '"saldo":0}');

  //resultado := http.Get('http://localhost:8080/owl/mercaderia/actualizar');
  //resultado := http.Get('http://localhost:8080/owl/deudores');
  http.Request.Clear;
  http.Request.ContentType := 'application/json';
  http.Request.CharSet := 'UTF-8';
//  resultado := http.Post('http://localhost:8888/owl/deudores/movimientos', JsonStreamEnvio);
  resultado := http.Post('http://179.27.99.4:8888/owl/deudores/movimientos', JsonStreamEnvio);
  // memo.Lines.Text := resultado;
  LJSONArr := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(resultado),0) as TJSONArray;
  for jsv in LJSONArr do
    begin
    for LItem in TJSONArray(jsv) do
      begin
        memo.Lines.Add(TJSONPAIR(LItem).JsonString.Value + ' : ' + TJSONPAIR(LItem).JsonValue.ToString);
      end;
    end;

Except On ex: Exception Do
  begin
    memo.Lines.Text := 'Error: ' + ex.Message;
  end;
end;
finally
   http.Free;
   LJSonArr.Free;
end;


end;

end.
