VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   720
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   2250
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   720
   ScaleWidth      =   2250
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   700
      Left            =   1800
      Top             =   120
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   1320
      Top             =   120
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   840
      Top             =   120
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   120
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   0   'False
      RThreshold      =   2
      RTSEnable       =   -1  'True
   End
   Begin VB.Menu PopupControl 
      Caption         =   "PopupControl"
      Begin VB.Menu ConfProg 
         Caption         =   "Configurar Programas"
      End
      Begin VB.Menu ConfControl 
         Caption         =   "Configurar Controle"
      End
      Begin VB.Menu Barra2 
         Caption         =   "-"
      End
      Begin VB.Menu About 
         Caption         =   "Sobre"
      End
      Begin VB.Menu Barra 
         Caption         =   "-"
      End
      Begin VB.Menu Sair 
         Caption         =   "Sair"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Dim teste As String
'Dim teste2(7) As String

' Systray = Vishal Kulkarni
Private Type NOTIFYICONDATA
        cbSize As Long
        hwnd As Long
        uId As Long
        uFlags As Long
        uCallBackMessage As Long
        hIcon As Long
        szTip As String * 64
End Type
Private Const NIM_ADD = &H0
Private Const NIM_MODIFY = &H1
Private Const NIM_DELETE = &H2
Private Const WM_MOUSEMOVE = &H200
Private Const NIF_MESSAGE = &H1
Private Const NIF_ICON = &H2
Private Const NIF_TIP = &H4
Private Const WM_LBUTTONDBLCLK = &H203   'Duplo Clique
'Private Const WM_LBUTTONDOWN = &H201     'Button down
'Private Const WM_LBUTTONUP = &H202       'Button up
'Private Const WM_RBUTTONDBLCLK = &H206   'Duplo Clique
'Private Const WM_RBUTTONDOWN = &H204     'Button down
Private Const WM_RBUTTONUP = &H205       'Button up

Private Declare Function Shell_NotifyIcon Lib "shell32" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, pnid As NOTIFYICONDATA) As Boolean
Private Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long

Dim nid As NOTIFYICONDATA

Private Sub About_Click()
    If FormV = False Then
        Form5.Show
    End If
End Sub

Private Sub ConfControl_Click()
    If FormV = False Then
        Form2.Show
    End If
End Sub

Private Sub ConfProg_Click()
    If FormV = False Then
        Form4.Show
    End If
End Sub

Private Sub Form_Load()
    'Se o aplicativo não tiver uma instancia carrega o form
    'evita carregar o mesmo form duas vezes (duplo icone na barra)
    If App.PrevInstance = False Then
        nid.cbSize = Len(nid)
        nid.hwnd = Form1.hwnd
        nid.uId = vbNull
        nid.uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
        nid.uCallBackMessage = WM_MOUSEMOVE
        nid.hIcon = Form1.Icon
        nid.szTip = "Controle Remoto" & vbNullChar
        Shell_NotifyIcon NIM_ADD, nid
    End If

    Form1.Visible = False 'Coloca o form como invisivel

    Modo = "NoConfig"
    RecStatus = False
    'carrega configuracoes
    Erro = False
    LoadProgConfig
    If Erro = True Then
        Unload Me
    End If

    Erro = False
    'carrega comandos
    LoadControlConfig
    If Erro = True Then
        Unload Me
    End If

    'Nenhuma janela ativa
    FormV = False

    If Modo = "NewConfig" Then
        Form4.Show
    End If

    'Só conecta se estiver configurado
    If Modo = "Normal" Then
        ConnectIR
    End If
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim lMsg As Long
  
    lMsg = X / Screen.TwipsPerPixelX
    Select Case lMsg
    'Verifica eventos de mouse
        'Case WM_LBUTTONDOWN
        
        'Case WM_LBUTTONUP
       
        Case WM_LBUTTONDBLCLK
            'Form2.Show
        
        'Case WM_RBUTTONDOWN

        Case WM_RBUTTONUP
            If FormV = False Then
                DoEvents
                SetForegroundWindow (Me.hwnd)
                Me.PopupMenu PopupControl 'mostra menu popup
            End If
       'Case WM_RBUTTONDBLCLK
    End Select
 End Sub

Private Sub Form_Unload(Cancel As Integer)
    'Remove o incone da barra (systray)
    Shell_NotifyIcon NIM_DELETE, nid
    MSComm1.RTSEnable = False 'desliga Receptor
End Sub

Private Sub MSComm1_OnComm()
    Dim Buffer2(5) As String
    Buffer = MSComm1.Input

    Select Case MSComm1.RThreshold
        'Inicio das comunicações
        Case 2
            'Receptor Voyager
            If Buffer = "IR" Then
                Timer3.Enabled = False
                MsgBox "Receptor Voyager Encontrado na Porta Com " & Rport + 1, vbInformation, "Receptor Encontrado"
                MSComm1.RThreshold = 24
                RecStatus = True
            End If
  
            'Receptor IRMan
            If Buffer = "OK" Then
                Timer3.Enabled = False
                MsgBox "Receptor IRMan Encontrado na Porta Com " & Rport + 1, vbInformation, "Receptor Encontrado"
                MSComm1.RThreshold = 6
                RecStatus = True
            End If
  
        'Modo normal com o IRMan
        Case 6
            For Ix = 1 To 6
                Buffer2(Ix - 1) = Asc(Mid(Buffer, Ix, 1))
            Next Ix
            Buffer = Buffer2(0) & Buffer2(1) & Buffer2(2) & Buffer2(3) & Buffer2(4) & Buffer2(5)
            MensProcess (Buffer)
  
        'Modo normal com Voyager
        Case 24
            MensProcess (Buffer)
        End Select
 
        Buffer = ""
End Sub

Private Sub Sair_Click()
    Unload Form2
    Unload Form3
    Unload Form4
    Unload Form5
    Unload Form6
    Unload Me
End Sub

Public Sub ConnectIR()
    Dim CErro As String

    On Error GoTo ComErro
    If MSComm1.PortOpen = True Then
        MSComm1.PortOpen = False
    End If

    'Configura Porta
    MSComm1.CommPort = Rport + 1
    'Configura para contato
    MSComm1.RThreshold = 2

    MSComm1.PortOpen = True

    MSComm1.RTSEnable = False
    MSComm1.DTREnable = False

    Tcont = False
    Timer2.Enabled = True
    
    While Tcont = False
        DoEvents
    Wend

    'Libera alimentação para o microcontrolador
    MSComm1.RTSEnable = True
    MSComm1.DTREnable = True

    'Se for IRMan envia pedido
    If RType = 0 Then
        MSComm1.Output = "IR"
    End If

    Timer3.Enabled = True
Exit Sub

ComErro:
    '8005 Port already open
    '8002 Invalid Port Number
    CErro = Err.Number
    MsgBox "Porta de Comunicação em Uso ou Inexistente", vbCritical, "Falha"
    Form4.Show
End Sub

'Após sair da configuração dispara timer para reconectar
Private Sub Timer1_Timer()
    ConnectIR
    Timer1.Enabled = False
End Sub

Private Sub Timer2_Timer()
    Timer2.Enabled = False
    Tcont = True
End Sub

Private Sub Timer3_Timer()
    MsgBox "Receptor não encontrado. Favor verificar o número da Porta e o tipo de receptor", vbCritical, "Falha"
    Timer3.Enabled = False
    RecStatus = False
End Sub
