inherited FrmCadClientes: TFrmCadClientes
  Caption = 'Clientes'
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
        Width = 27
        Height = 19
        Caption = 'CPF'
      end
      object Label3: TLabel [2]
        Left = 20
        Top = 179
        Width = 132
        Height = 19
        Caption = 'Data de nacimento'
      end
      object Label4: TLabel [3]
        Left = 20
        Top = 80
        Width = 50
        Height = 19
        Caption = 'C'#243'digo'
      end
      inherited Panel1: TPanel
        inherited BitBtnFecharCadastro: TBitBtn
          Left = 926
          ExplicitLeft = 926
        end
        inherited BitBtnSalvarCadastro: TBitBtn
          Left = 1029
          Width = 89
          OnClick = BitBtnSalvarCadastroClick
          ExplicitLeft = 1029
          ExplicitWidth = 89
        end
      end
      inherited Panel2: TPanel
        inherited Label6: TLabel
          Width = 161
          Caption = 'Cadastrar Cliente'
          ExplicitWidth = 161
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 220
        Width = 1122
        Height = 243
        Align = alBottom
        DataSource = DMConexao.DSClientes_Contatos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'cliD_id'
            Title.Caption = 'C'#243'digo do Contato'
            Width = 152
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliD_IdMestre'
            ReadOnly = True
            Title.Caption = 'C'#243'digo do Cliente'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliD_Nome'
            Title.Caption = 'Nome do Contato'
            Width = 206
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliD_Celular'
            Title.Caption = 'Celular do Contato'
            Width = 211
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliD_Cidade'
            Title.Caption = 'Cidade do Contato'
            Width = 158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cliD_Endereco'
            Title.Caption = 'Endereco do Contato'
            Width = 215
            Visible = True
          end>
      end
      object DBEdit1: TDBEdit
        Left = 158
        Top = 110
        Width = 246
        Height = 27
        DataField = 'cliM_Nome'
        DataSource = DMConexao.DSClientes
        TabOrder = 3
      end
      object DBEdit2: TDBEdit
        Left = 158
        Top = 143
        Width = 146
        Height = 27
        DataField = 'cliM_CPF'
        DataSource = DMConexao.DSClientes
        MaxLength = 14
        TabOrder = 4
      end
      object DBEdit3: TDBEdit
        Left = 158
        Top = 176
        Width = 146
        Height = 27
        DataField = 'cliM_DataNasc'
        DataSource = DMConexao.DSClientes
        MaxLength = 10
        TabOrder = 5
        OnExit = DBEdit3Exit
      end
      object DBEdit4: TDBEdit
        Left = 158
        Top = 77
        Width = 56
        Height = 27
        Color = clGrayText
        DataField = 'cliM_Id'
        DataSource = DMConexao.DSClientes
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
          DataSource = DMConexao.DSClientes
          Columns = <
            item
              Expanded = False
              FieldName = 'cliM_Id'
              Title.Caption = 'C'#243'digo '
              Width = 254
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cliM_Nome'
              Title.Caption = 'Nome'
              Width = 293
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cliM_CPF'
              Title.Caption = 'CPF'
              Width = 263
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cliM_DataNasc'
              Title.Caption = 'Data de nascimento'
              Width = 270
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
