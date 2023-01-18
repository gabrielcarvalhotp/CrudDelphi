object MMConexao: TMMConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 290
  Width = 367
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Financeiro\DB\FINANCEIRO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=127.0.0.1'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files\Firebird\Firebird_3_0\WOW64\fbclient.dll'
    Embedded = True
    Left = 40
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 152
  end
end
