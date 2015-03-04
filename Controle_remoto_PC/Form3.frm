VERSION 5.00
Begin VB.Form Form3 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Configurar Tecla"
   ClientHeight    =   1680
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   3375
   Icon            =   "Form3.frx":0000
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1680
   ScaleWidth      =   3375
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   120
      Top             =   1200
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   840
      TabIndex        =   0
      Top             =   1200
      Width           =   1695
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   3135
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Aponte o controle remoto para o receptor e aperte uma tecla para:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   3135
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    Modo = "Config3"
 
    Select Case VarTransfer
        Case 0
            Label2.Caption = "Play"
        Case 1
            Label2.Caption = "Stop"
        Case 2
            Label2.Caption = "Pause"
        Case 3
            Label2.Caption = "Anterior"
        Case 4
            Label2.Caption = "Retroceder"
        Case 5
            Label2.Caption = "Avançar"
        Case 6
            Label2.Caption = "Próximo"
        Case 7 To 16
            Label2.Caption = "Número " & Form2.Cont(VarTransfer).Caption
        Case 17
            Label2.Caption = "+ Vol."
        Case 18
            Label2.Caption = "- Vol."
        Case 19
            Label2.Caption = "Left"
        Case 20
            Label2.Caption = "Up"
        Case 21
            Label2.Caption = "Right"
        Case 22
            Label2.Caption = "Down"
        Case Else
            Label2.Caption = Form2.Cont(VarTransfer).Caption
    End Select
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Modo = "Config2"
End Sub

Private Sub Timer1_Timer()
    Timer1.Enabled = False
    Unload Me
End Sub
