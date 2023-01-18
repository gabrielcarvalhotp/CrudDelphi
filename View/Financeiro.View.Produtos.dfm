inherited FrmCadProduto: TFrmCadProduto
  Caption = 'FrmCadProduto'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 19
  inherited CardPanelPrincipal: TCardPanel
    inherited CardCadastro: TCard
      object Label1: TLabel [0]
        Left = 20
        Top = 113
        Width = 42
        Height = 19
        Caption = 'Nome'
      end
      object Label2: TLabel [1]
        Left = 20
        Top = 146
        Width = 81
        Height = 19
        Caption = 'Quantidade'
      end
      object Label3: TLabel [2]
        Left = 20
        Top = 179
        Width = 37
        Height = 19
        Caption = 'Valor'
      end
      object Label4: TLabel [3]
        Left = 20
        Top = 213
        Width = 93
        Height = 19
        Caption = 'Tipo Produto'
      end
      object Label5: TLabel [4]
        Left = 20
        Top = 80
        Width = 50
        Height = 19
        Caption = 'C'#243'digo'
      end
      inherited Panel1: TPanel
        inherited BitBtnSalvarCadastro: TBitBtn
          OnClick = BitBtnSalvarCadastroClick
        end
      end
      inherited Panel2: TPanel
        TabOrder = 5
        inherited Label6: TLabel
          Width = 201
          Caption = 'Cadastro de Produtos'
          ExplicitWidth = 201
        end
      end
      object DBEdit1: TDBEdit
        Left = 119
        Top = 110
        Width = 150
        Height = 27
        DataField = 'prod_Nome'
        DataSource = DMConexao.DSProduto
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 119
        Top = 143
        Width = 45
        Height = 27
        DataField = 'prod_QtdEstoque'
        DataSource = DMConexao.DSProduto
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 119
        Top = 176
        Width = 85
        Height = 27
        DataField = 'prod_ValorUni'
        DataSource = DMConexao.DSProduto
        TabOrder = 3
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 119
        Top = 209
        Width = 150
        Height = 27
        DataField = 'prod_IdTipoProduto'
        DataSource = DMConexao.DSProduto
        KeyField = 'tip_id'
        ListField = 'TIP_NOME'
        ListSource = DMConexao.DSTipoProduto
        TabOrder = 4
      end
      object DBEdit4: TDBEdit
        Left = 119
        Top = 77
        Width = 60
        Height = 27
        Color = clGrayText
        DataField = 'prod_id'
        DataSource = DMConexao.DSProduto
        ReadOnly = True
        TabOrder = 6
      end
    end
    inherited CardPesquisa: TCard
      inherited PanelFooter: TPanel
        inherited BitBtnExcluirPesquisa: TBitBtn
          OnClick = BitBtnExcluirPesquisaClick
        end
      end
      inherited PanelGrid: TPanel
        inherited DBGridPesquisa: TDBGrid
          DataSource = DMConexao.DSProduto
          Columns = <
            item
              Expanded = False
              FieldName = 'prod_id'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'prod_Nome'
              Title.Caption = 'Nome do Produto'
              Width = 293
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'prod_qtdEstoque'
              Title.Caption = 'Quantidade'
              Width = 182
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'prod_ValorUni'
              Title.Caption = 'Valor'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tip_nome'
              Title.Caption = 'Tipo do produto'
              Width = 434
              Visible = True
            end>
        end
      end
      inherited PanelPesquisa: TPanel
        inherited EditPesquisar: TEdit
          OnChange = EditPesquisarChange
        end
      end
    end
  end
end
