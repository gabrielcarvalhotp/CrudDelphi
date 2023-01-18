object FrmConsultaPReco: TFrmConsultaPReco
  Left = 0
  Top = 0
  Caption = 'Consultar pre'#231'o dos produtos'
  ClientHeight = 599
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 20
    Top = 74
    Width = 126
    Height = 19
    Caption = 'Pesquisar(c'#243'digo)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 50
    Align = alTop
    TabOrder = 0
    object Label6: TLabel
      Left = 20
      Top = 15
      Width = 156
      Height = 25
      Caption = 'Consultar pre'#231'os'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object DBGridConsulta: TDBGrid
    Left = 20
    Top = 129
    Width = 757
    Height = 457
    DataSource = DSProduto
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridConsultaDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'PROD_ID'
        Title.Caption = 'C'#243'digo'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROD_NOME'
        Title.Caption = 'Nome'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROD_QTDESTOQUE'
        Title.Caption = 'Quantidade'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROD_VALORUNI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Valor a Prazo'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorVista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Valor a Vista'
        Width = 180
        Visible = True
      end>
  end
  object EditId: TNumberBox
    Left = 20
    Top = 96
    Width = 165
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChangeValue = EditIdChangeValue
  end
  object DSProduto: TDataSource
    DataSet = FDQProduto
    Left = 640
    Top = 80
  end
  object FDQProduto: TFDQuery
    Active = True
    Connection = MMConexao.FDConnection
    SQL.Strings = (
      
        'select prod_Id, prod_Nome, prod_QtdEstoque, prod_ValorUni, (prod' +
        '_ValorUni * 0.9) as "ValorVista" from produtos')
    Left = 712
    Top = 80
    object FDQProdutoPROD_ID: TIntegerField
      FieldName = 'PROD_ID'
      Origin = 'PROD_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQProdutoPROD_NOME: TStringField
      FieldName = 'PROD_NOME'
      Origin = 'PROD_NOME'
      Size = 50
    end
    object FDQProdutoPROD_QTDESTOQUE: TIntegerField
      FieldName = 'PROD_QTDESTOQUE'
      Origin = 'PROD_QTDESTOQUE'
    end
    object FDQProdutoPROD_VALORUNI: TFMTBCDField
      FieldName = 'PROD_VALORUNI'
      Origin = 'PROD_VALORUNI'
      currency = True
      Precision = 18
      Size = 2
    end
    object FDQProdutoValorVista: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ValorVista'
      Origin = '"ValorVista"'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
end