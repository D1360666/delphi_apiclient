object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 112
    Top = 97
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object memo: TMemo
    Left = 112
    Top = 128
    Width = 345
    Height = 193
    Lines.Strings = (
      'memo')
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 208
    Top = 99
    Width = 289
    Height = 23
    TabOrder = 2
    Text = 'http://179.27.99.4:8888/owl/deudores/movimientos'
  end
  object cnnMysql: TFDConnection
    Params.Strings = (
      'Database=dwh_independencia'
      'User_Name=root'
      'Password=noentrasmas'
      'Server=localhost'
      'DriverID=MySQL')
    Left = 144
    Top = 360
  end
  object cnnPgsql: TFDConnection
    Params.Strings = (
      'Database=dwh_independencia'
      'User_Name=postgres'
      'Password=postgres'
      'CharacterSet=WIN1251'
      'LoginTimeout=30'
      'OidAsBlob=Yes'
      'UnknownFormat=BYTEA'
      'MetaDefSchema=dwh_independencia'
      'Server=localhost'
      'DriverID=PG')
    LoginPrompt = False
    Left = 336
    Top = 352
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Users\Equipo\Downloads\libpq\libpq.dll'
    Left = 216
    Top = 360
  end
end
