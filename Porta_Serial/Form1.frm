VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3840
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5055
   LinkTopic       =   "Form1"
   ScaleHeight     =   3840
   ScaleWidth      =   5055
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Send"
      Height          =   375
      Left            =   3600
      TabIndex        =   2
      Top             =   3360
      Width           =   615
   End
   Begin VB.TextBox Text2 
      Height          =   405
      Left            =   120
      TabIndex        =   1
      Top             =   3360
      Width           =   3375
   End
   Begin VB.TextBox Text1 
      Height          =   2535
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   360
      Width           =   4815
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   4440
      Top             =   3120
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
      BaudRate        =   1200
   End
   Begin VB.Label Label2 
      Caption         =   "Mensagens Recebidas:"
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   120
      Width           =   2295
   End
   Begin VB.Label Label1 
      Caption         =   "Escreva aqui a mensagem que será enviada:"
      Height          =   255
      Left            =   240
      TabIndex        =   3
      Top             =   3000
      Width           =   3375
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'**********************************************
'**                                          **
'**    Exemplo de uso do Controle MSCOMM     **
'**               By VOYAGER                 **
'**                                          **
'**********************************************

'' *********************************
'' ATENÇÃO: ESSE EXEMPLO É DE UM TERMINAL SERIAL
'' É NECESSÁRIO OUTRO COMPUTADOR LIGADO VIA PORTA
'' SERIAL ENVIANDO E RECEBENDO DADOS TAMBÉM!!!!

Dim Inbox As String   'Variável que conterá os dados recebidos
Dim Outbox As String  'Variavel que conterá os dados a serem enviados
Dim aux As String
Dim teste As Integer

Private Sub Command1_Click()
    'MSComm1.Output = Text2.Text    'Transmite o conteudo da
                                    'caixa de texto 2 pela serial
End Sub

Private Sub Form_Load()
    'Iniciamos aqui as propriedades do controle MSCOMM
    'Essas configurações podem ser feitas diretamente na
    'Janela Properties do VB. Só fiz aqui para poder explicar
    'cada uma delas nos comentários.
    MSComm1.CommPort = 1    'Define a COM1 como porta a ser usada
    MSComm1.RThreshold = 4  'Define quantos bytes serão recebidos
                            'até que ocorra um evento oncom.
                            'Para 0 o evento ocorrerá com qualquer
                            'quantidade de bytes recebidos
    MSComm1.PortOpen = True 'Abre a porta serial para comunicar
                            'Caso a porta já esteja aberta irá gerar
                            'um erro que pode ser evitado com o uso
                            'de um comando On error goto. Nesse caso
                            'Nào usei o tratamento de erros.
                        
    MSComm1.Settings = "1200,n,8,1"
    'MSComm1.RTSEnable = True
                        
    'Nesse ponto inicializamos as funções básicas para
    'que a serial funcione. Não usei controle de fluxo
    'de hardware aqui pois é mais usado com Modems.
End Sub

Private Sub MSComm1_OnComm()
    'Esse evento é gerado quando o controle MSCOMM recebe
    'o número de bytes especificados na propriedade RThreshold
    aux = MSComm1.Input
    Inbox = aux
    'teste = Hex(aux)
    'Inbox = MSComm1.Input  'Recebe os dados da serial. Guardamos
                            'na variavel Inbox porque após ler uma
                            'vez o buffer da serial ele é apagado
                      
    Text1.Text = Text1.Text & Inbox 'Atualiza a tela de mensagens
                                    'recebidas
End Sub
