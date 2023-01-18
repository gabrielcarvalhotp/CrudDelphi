inherited FrmCadTipoProduto: TFrmCadTipoProduto
  Caption = 'Tipo de Produto'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 19
  inherited CardPanelPrincipal: TCardPanel
    inherited CardCadastro: TCard
      ExplicitLeft = 41
      ExplicitTop = 9
      object Label1: TLabel [0]
        Left = 20
        Top = 113
        Width = 42
        Height = 19
        Caption = 'Nome'
      end
      object Label2: TLabel [1]
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
        inherited Label6: TLabel
          Width = 260
          Caption = 'Cadastrar tipos de produtos'
          ExplicitWidth = 260
        end
      end
      object DBEdit1: TDBEdit
        Left = 76
        Top = 110
        Width = 150
        Height = 27
        DataField = 'tip_Nome'
        DataSource = DMConexao.DSTipoProduto
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 76
        Top = 77
        Width = 60
        Height = 27
        Color = clGrayText
        DataField = 'tip_id'
        DataSource = DMConexao.DSTipoProduto
        ReadOnly = True
        TabOrder = 3
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
          DataSource = DMConexao.DSTipoProduto
          Columns = <
            item
              Expanded = False
              FieldName = 'TIP_ID'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIP_NOME'
              Title.Caption = 'Nome'
              Width = 990
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
