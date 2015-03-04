VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form4 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Configurar Programas"
   ClientHeight    =   5040
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   7530
   Icon            =   "Form4.frx":0000
   LinkTopic       =   "Form4"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5040
   ScaleWidth      =   7530
   StartUpPosition =   1  'CenterOwner
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   120
      Top             =   4440
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      Height          =   4215
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   7335
      Begin VB.ComboBox Combo7 
         Height          =   315
         ItemData        =   "Form4.frx":030A
         Left            =   480
         List            =   "Form4.frx":031A
         Style           =   2  'Dropdown List
         TabIndex        =   32
         Top             =   3720
         Width           =   1935
      End
      Begin VB.ComboBox Combo8 
         Height          =   315
         ItemData        =   "Form4.frx":0336
         Left            =   2640
         List            =   "Form4.frx":0340
         Style           =   2  'Dropdown List
         TabIndex        =   31
         Top             =   3720
         Width           =   1815
      End
      Begin VB.CommandButton Command1 
         Caption         =   "..."
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   6720
         TabIndex        =   26
         Top             =   720
         Width           =   375
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   2640
         TabIndex        =   25
         Text            =   "Localizar..."
         Top             =   720
         Width           =   3975
      End
      Begin VB.ComboBox Combo1 
         Enabled         =   0   'False
         Height          =   315
         ItemData        =   "Form4.frx":0354
         Left            =   480
         List            =   "Form4.frx":0373
         Style           =   2  'Dropdown List
         TabIndex        =   24
         Top             =   720
         Width           =   1935
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Check1"
         Height          =   255
         Left            =   120
         TabIndex        =   23
         Top             =   720
         Width           =   255
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Check1"
         Height          =   255
         Left            =   120
         TabIndex        =   22
         Top             =   1200
         Width           =   255
      End
      Begin VB.ComboBox Combo2 
         Enabled         =   0   'False
         Height          =   315
         ItemData        =   "Form4.frx":03DA
         Left            =   480
         List            =   "Form4.frx":03F9
         Style           =   2  'Dropdown List
         TabIndex        =   21
         Top             =   1200
         Width           =   1935
      End
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   2640
         TabIndex        =   20
         Text            =   "Localizar..."
         Top             =   1200
         Width           =   3975
      End
      Begin VB.CommandButton Command2 
         Caption         =   "..."
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   6720
         TabIndex        =   19
         Top             =   1200
         Width           =   375
      End
      Begin VB.CheckBox Check3 
         Caption         =   "Check1"
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   1680
         Width           =   255
      End
      Begin VB.ComboBox Combo3 
         Enabled         =   0   'False
         Height          =   315
         ItemData        =   "Form4.frx":0460
         Left            =   480
         List            =   "Form4.frx":047F
         Style           =   2  'Dropdown List
         TabIndex        =   17
         Top             =   1680
         Width           =   1935
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   2640
         TabIndex        =   16
         Text            =   "Localizar..."
         Top             =   1680
         Width           =   3975
      End
      Begin VB.CommandButton Command3 
         Caption         =   "..."
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   6720
         TabIndex        =   15
         Top             =   1680
         Width           =   375
      End
      Begin VB.CheckBox Check4 
         Caption         =   "Check1"
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Top             =   2160
         Width           =   255
      End
      Begin VB.ComboBox Combo4 
         Enabled         =   0   'False
         Height          =   315
         ItemData        =   "Form4.frx":04E6
         Left            =   480
         List            =   "Form4.frx":0505
         Style           =   2  'Dropdown List
         TabIndex        =   13
         Top             =   2160
         Width           =   1935
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   2640
         TabIndex        =   12
         Text            =   "Localizar..."
         Top             =   2160
         Width           =   3975
      End
      Begin VB.CommandButton Command4 
         Caption         =   "..."
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   6720
         TabIndex        =   11
         Top             =   2160
         Width           =   375
      End
      Begin VB.CheckBox Check5 
         Caption         =   "Check1"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   2640
         Width           =   255
      End
      Begin VB.ComboBox Combo5 
         Enabled         =   0   'False
         Height          =   315
         ItemData        =   "Form4.frx":056C
         Left            =   480
         List            =   "Form4.frx":058B
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   2640
         Width           =   1935
      End
      Begin VB.TextBox Text5 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   2640
         TabIndex        =   8
         Text            =   "Localizar..."
         Top             =   2640
         Width           =   3975
      End
      Begin VB.CommandButton Command5 
         Caption         =   "..."
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   6720
         TabIndex        =   7
         Top             =   2640
         Width           =   375
      End
      Begin VB.CheckBox Check6 
         Caption         =   "Check1"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   3120
         Width           =   255
      End
      Begin VB.ComboBox Combo6 
         Enabled         =   0   'False
         Height          =   315
         ItemData        =   "Form4.frx":05F2
         Left            =   480
         List            =   "Form4.frx":0611
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   3120
         Width           =   1935
      End
      Begin VB.TextBox Text6 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   2640
         TabIndex        =   4
         Text            =   "Localizar..."
         Top             =   3120
         Width           =   3975
      End
      Begin VB.CommandButton Command6 
         Caption         =   "..."
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   6720
         TabIndex        =   3
         Top             =   3120
         Width           =   375
      End
      Begin VB.Label Label5 
         Caption         =   "Porta:"
         Height          =   255
         Left            =   480
         TabIndex        =   34
         Top             =   3480
         Width           =   495
      End
      Begin VB.Label Label6 
         Caption         =   "Tipo:"
         Height          =   255
         Left            =   2640
         TabIndex        =   33
         Top             =   3480
         Width           =   495
      End
      Begin VB.Label Label1 
         Caption         =   "Habilitar:"
         Height          =   255
         Left            =   120
         TabIndex        =   30
         Top             =   360
         Width           =   735
      End
      Begin VB.Label Label2 
         Caption         =   "Localizar:"
         Height          =   255
         Left            =   6480
         TabIndex        =   29
         Top             =   360
         Width           =   735
      End
      Begin VB.Label Label3 
         Caption         =   "Programa:"
         Height          =   255
         Left            =   1080
         TabIndex        =   28
         Top             =   360
         Width           =   735
      End
      Begin VB.Label Label4 
         Caption         =   "Local:"
         Height          =   255
         Left            =   2640
         TabIndex        =   27
         Top             =   360
         Width           =   495
      End
   End
   Begin VB.CommandButton Command8 
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   6000
      TabIndex        =   1
      Top             =   4440
      Width           =   1455
   End
   Begin VB.CommandButton Command7 
      Caption         =   "OK"
      Enabled         =   0   'False
      Height          =   375
      Left            =   4320
      TabIndex        =   0
      Top             =   4440
      Width           =   1455
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim Temp As String
Dim EndT As Boolean

Private Sub Check1_Click()
    If Check1.Value = 0 Then
        Combo1.Enabled = False
        Command1.Enabled = False
        Combo1.ListIndex = -1
        Text1.Text = "Localizar..."
    Else
        Combo1.Enabled = True
        Command1.Enabled = True
    End If
    Command7.Enabled = True
End Sub

Private Sub Check2_Click()
    If Check2.Value = 0 Then
        Combo2.Enabled = False
        Command2.Enabled = False
        Combo2.ListIndex = -1
        Text2.Text = "Localizar..."
    Else
        Combo2.Enabled = True
        Command2.Enabled = True
    End If
    Command7.Enabled = True
End Sub

Private Sub Check3_Click()
    If Check3.Value = 0 Then
        Combo3.Enabled = False
        Command3.Enabled = False
        Combo3.ListIndex = -1
        Text3.Text = "Localizar..."
    Else
        Combo3.Enabled = True
        Command3.Enabled = True
    End If
    Command7.Enabled = True
End Sub

Private Sub Check4_Click()
    If Check4.Value = 0 Then
        Combo4.Enabled = False
        Command4.Enabled = False
        Combo4.ListIndex = -1
        Text4.Text = "Localizar..."
    Else
        Combo4.Enabled = True
        Command4.Enabled = True
    End If
    Command7.Enabled = True
End Sub
Private Sub Check5_Click()
    If Check5.Value = 0 Then
        Combo5.Enabled = False
        Command5.Enabled = False
        Combo5.ListIndex = -1
        Text5.Text = "Localizar..."
    Else
        Combo5.Enabled = True
        Command5.Enabled = True
    End If
        Command7.Enabled = True
End Sub

Private Sub Check6_Click()
    If Check6.Value = 0 Then
        Combo6.Enabled = False
        Command6.Enabled = False
        Combo6.ListIndex = -1
        Text6.Text = "Localizar..."
    Else
        Combo6.Enabled = True
        Command6.Enabled = True
    End If
        Command7.Enabled = True
End Sub

Private Sub Combo1_DropDown()
    Command7.Enabled = True
End Sub

Private Sub Combo2_DropDown()
    Command7.Enabled = True
End Sub

Private Sub Combo3_DropDown()
    Command7.Enabled = True
End Sub

Private Sub Combo4_DropDown()
    Command7.Enabled = True
End Sub

Private Sub Combo5_DropDown()
    Command7.Enabled = True
End Sub

Private Sub Combo6_DropDown()
    Command7.Enabled = True
End Sub

Private Sub Combo7_DropDown()
    Command7.Enabled = True
End Sub

Private Sub Combo8_DropDown()
    Command7.Enabled = True
End Sub

Private Sub Command1_Click()
    Temp = LocProg()
    If Temp <> "" Then
        Text1.Text = Temp
    End If
End Sub

Private Sub Command2_Click()
    Temp = LocProg()
    If Temp <> "" Then
        Text2.Text = Temp
    End If
End Sub

Private Sub Command3_Click()
    Temp = LocProg()
    If Temp <> "" Then
        Text3.Text = Temp
    End If
End Sub

Private Sub Command4_Click()
    Temp = LocProg()
    If Temp <> "" Then
        Text4.Text = Temp
    End If
End Sub

Private Sub Command5_Click()
    Temp = LocProg()
    If Temp <> "" Then
        Text5.Text = Temp
    End If
End Sub

Private Sub Command6_Click()
    Temp = LocProg()
    If Temp <> "" Then
        Text6.Text = Temp
    End If
End Sub

Private Sub Command7_Click()
    If Command7.Enabled = True Then
        Dim Aux As String
        ProgEnable(0) = Check1.Value
        ProgEnable(1) = Check2.Value
        ProgEnable(2) = Check3.Value
        ProgEnable(3) = Check4.Value
        ProgEnable(4) = Check5.Value
        ProgEnable(5) = Check6.Value
 
        ProgPath(0) = Text1.Text
        ProgPath(1) = Text2.Text
        ProgPath(2) = Text3.Text
        ProgPath(3) = Text4.Text
        ProgPath(4) = Text5.Text
        ProgPath(5) = Text6.Text
 
        ProgType(0) = Combo1.ListIndex
        If ProgType(0) <> -1 Then
            ProgType(0) = " " & ProgType(0)
        End If

        ProgType(1) = Combo2.ListIndex
        If ProgType(1) <> -1 Then
            ProgType(1) = " " & ProgType(1)
        End If

        ProgType(2) = Combo3.ListIndex
        If ProgType(2) <> -1 Then
            ProgType(2) = " " & ProgType(2)
        End If
 
        ProgType(3) = Combo4.ListIndex
        If ProgType(3) <> -1 Then
            ProgType(3) = " " & ProgType(3)
        End If
 
        ProgType(4) = Combo5.ListIndex
        If ProgType(4) <> -1 Then
            ProgType(4) = " " & ProgType(4)
        End If
 
        ProgType(5) = Combo6.ListIndex
        If ProgType(5) <> -1 Then
            ProgType(5) = " " & ProgType(5)
        End If
 
        Rport = Combo7.ListIndex
        RType = Combo8.ListIndex
 
        'Salva configurações
        SaveProgConfig
        ProgRType
    End If
    'dispara timer de conexão
    Form1.Timer1.Interval = 50
    Form1.Timer1.Enabled = True
    Unload Me
End Sub

Private Sub Command8_Click()
    Unload Me
End Sub

Private Function LocProg() As String
    ' Set CancelError is True
    CommonDialog1.CancelError = True
    On Error GoTo ErrHandler
    ' Display the Open dialog box
    CommonDialog1.ShowOpen
    'mostra path do arquivo
    LocProg = CommonDialog1.FileName
    Command7.Enabled = True
    Exit Function
  
ErrHandler:
    'Pressionada tecla de Cancel
    Exit Function
End Function

Private Sub Form_Load()
    'Indica janela ativa
    FormV = True
 
    If Modo <> "NewConfig" Then
        'Em modo de configuração
        Modo = "Config"
    End If
    CommonDialog1.InitDir = App.Path
    CommonDialog1.Filter = "Executáveis (*.exe)|*.exe"
    CommonDialog1.FilterIndex = 1
    CommonDialog1.Flags = cdlOFNHideReadOnly
    CommonDialog1.Flags = cdlOFNFileMustExist

    'Mostra habilitação dos programas:
    Check1.Value = ProgEnable(0)
    Check2.Value = ProgEnable(1)
    Check3.Value = ProgEnable(2)
    Check4.Value = ProgEnable(3)
    Check5.Value = ProgEnable(4)
    Check6.Value = ProgEnable(5)
 
    'Mostra tipos de programas:
    Combo1.ListIndex = ProgType(0)
    Combo2.ListIndex = ProgType(1)
    Combo3.ListIndex = ProgType(2)
    Combo4.ListIndex = ProgType(3)
    Combo5.ListIndex = ProgType(4)
    Combo6.ListIndex = ProgType(5)
 
    'Mostra Paths:
    Text1.Text = ProgPath(0)
    Text2.Text = ProgPath(1)
    Text3.Text = ProgPath(2)
    Text4.Text = ProgPath(3)
    Text5.Text = ProgPath(4)
    Text6.Text = ProgPath(5)
 
    Combo7.ListIndex = Rport
    Combo8.ListIndex = RType
 
    If Modo = "NewConfig" Then
        Command7.Enabled = True
        Command8.Enabled = False
    Else
    Command7.Enabled = False
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    'Indica janela inativa
    FormV = False
    '  If Modo = "NewConfig" Then
    '   Form2.Show
    '  Else
    Modo = "Normal"
    'End If
End Sub



