VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form2 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Configurar controle"
   ClientHeight    =   5340
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6390
   Icon            =   "Form2.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5340
   ScaleWidth      =   6390
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command5 
      Caption         =   "Salvar"
      Height          =   375
      Left            =   1440
      TabIndex        =   41
      Top             =   4800
      Width           =   1095
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   720
      Top             =   4440
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Aplicar"
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   40
      Top             =   4800
      Width           =   1095
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Limpar"
      Height          =   375
      Left            =   3840
      TabIndex        =   39
      Top             =   4800
      Width           =   1095
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   150
      Left            =   240
      Top             =   4440
   End
   Begin VB.Frame Frame1 
      Height          =   4575
      Left            =   120
      TabIndex        =   2
      Top             =   0
      Width           =   6135
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "4"
         BeginProperty Font 
            Name            =   "Webdings"
            Size            =   14.25
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Index           =   0
         Left            =   240
         TabIndex        =   38
         ToolTipText     =   "Escolher tecla para Play"
         Top             =   600
         Width           =   615
      End
      Begin VB.Label Label6 
         Caption         =   "Controles Básicos:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2160
         TabIndex        =   37
         Top             =   240
         Width           =   1695
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   16
         Left            =   960
         TabIndex        =   36
         ToolTipText     =   "Escolher tecla para 0"
         Top             =   3000
         Width           =   495
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "7"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   13
         Left            =   240
         TabIndex        =   35
         ToolTipText     =   "Escolher tecla para 7"
         Top             =   2520
         Width           =   495
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "8"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   14
         Left            =   960
         TabIndex        =   34
         ToolTipText     =   "Escolher tecla para 8"
         Top             =   2520
         Width           =   495
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "2"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   8
         Left            =   960
         TabIndex        =   33
         ToolTipText     =   "Escolher tecla para 2"
         Top             =   1560
         Width           =   495
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "9"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   15
         Left            =   1680
         TabIndex        =   32
         ToolTipText     =   "Escolher tecla para 9"
         Top             =   2520
         Width           =   495
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "6"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   12
         Left            =   1680
         TabIndex        =   31
         ToolTipText     =   "Escolher tecla para 6"
         Top             =   2040
         Width           =   495
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   7
         Left            =   240
         TabIndex        =   30
         ToolTipText     =   "Escolher tecla para 1"
         Top             =   1560
         Width           =   495
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "4"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   10
         Left            =   240
         TabIndex        =   29
         ToolTipText     =   "Escolher tecla para 4"
         Top             =   2040
         Width           =   495
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "5"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   11
         Left            =   960
         TabIndex        =   28
         ToolTipText     =   "Escolher tecla para 5"
         Top             =   2040
         Width           =   495
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "3"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   9
         Left            =   1680
         TabIndex        =   27
         ToolTipText     =   "Escolher tecla para 3"
         Top             =   1560
         Width           =   495
      End
      Begin VB.Label Label8 
         Alignment       =   2  'Center
         Caption         =   "Controles Numéricos:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   26
         Top             =   1200
         Width           =   1935
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "On\Off"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   29
         Left            =   2880
         TabIndex        =   25
         ToolTipText     =   "Escolher tecla para Power"
         Top             =   3960
         Width           =   855
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   17
         Left            =   240
         TabIndex        =   24
         ToolTipText     =   "Escolher tecla para Vol+"
         Top             =   3960
         Width           =   615
      End
      Begin VB.Label Label25 
         Alignment       =   2  'Center
         Caption         =   "Volume:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   840
         TabIndex        =   23
         Top             =   3600
         Width           =   855
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "<"
         BeginProperty Font 
            Name            =   "Webdings"
            Size            =   14.25
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Index           =   1
         Left            =   1080
         TabIndex        =   22
         ToolTipText     =   "Escolher tecla para Stop"
         Top             =   600
         Width           =   615
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   ";"
         BeginProperty Font 
            Name            =   "Webdings"
            Size            =   14.25
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Index           =   2
         Left            =   1920
         TabIndex        =   21
         ToolTipText     =   "Escolher tecla para Pause"
         Top             =   600
         Width           =   615
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "7"
         BeginProperty Font 
            Name            =   "Webdings"
            Size            =   14.25
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Index           =   4
         Left            =   3600
         TabIndex        =   20
         ToolTipText     =   "Escolher tecla para Retrocesso"
         Top             =   600
         Width           =   615
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "8"
         BeginProperty Font 
            Name            =   "Webdings"
            Size            =   14.25
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Index           =   5
         Left            =   4440
         TabIndex        =   19
         ToolTipText     =   "Escolher tecla para Avanço"
         Top             =   600
         Width           =   615
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "9"
         BeginProperty Font 
            Name            =   "Webdings"
            Size            =   14.25
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Index           =   3
         Left            =   2760
         TabIndex        =   18
         ToolTipText     =   "Escolher tecla para Anterior"
         Top             =   600
         Width           =   615
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   ":"
         BeginProperty Font 
            Name            =   "Webdings"
            Size            =   14.25
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Index           =   6
         Left            =   5280
         TabIndex        =   17
         ToolTipText     =   "Escolher tecla para Próximo"
         Top             =   600
         Width           =   615
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "4"
         BeginProperty Font 
            Name            =   "Webdings"
            Size            =   14.25
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Index           =   21
         Left            =   4920
         TabIndex        =   16
         ToolTipText     =   "Escolher tecla para Right"
         Top             =   2040
         Width           =   615
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "3"
         BeginProperty Font 
            Name            =   "Webdings"
            Size            =   14.25
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Index           =   19
         Left            =   3480
         TabIndex        =   15
         ToolTipText     =   "Escolher tecla para Left"
         Top             =   2040
         Width           =   615
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "5"
         BeginProperty Font 
            Name            =   "Webdings"
            Size            =   14.25
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Index           =   20
         Left            =   4200
         TabIndex        =   14
         ToolTipText     =   "Escolher tecla para Up"
         Top             =   1560
         Width           =   615
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "6"
         BeginProperty Font 
            Name            =   "Webdings"
            Size            =   14.25
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   375
         Index           =   22
         Left            =   4200
         TabIndex        =   13
         ToolTipText     =   "Escolher tecla para Down"
         Top             =   2520
         Width           =   615
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Enter"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   24
         Left            =   3960
         TabIndex        =   12
         ToolTipText     =   "Escolher tecla para Enter"
         Top             =   3240
         Width           =   855
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "---"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   30
         Left            =   3960
         TabIndex        =   11
         ToolTipText     =   "Escolher tecla para"
         Top             =   3960
         Width           =   855
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Sound"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   26
         Left            =   2880
         TabIndex        =   10
         ToolTipText     =   "Escolher tecla para Sound"
         Top             =   3600
         Width           =   855
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Size"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   23
         Left            =   2880
         TabIndex        =   9
         ToolTipText     =   "Escolher tecla para Size"
         Top             =   3240
         Width           =   855
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Menu"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   27
         Left            =   3960
         TabIndex        =   8
         ToolTipText     =   "Escolher tecla para"
         Top             =   3600
         Width           =   855
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "Subtitle"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   25
         Left            =   5040
         TabIndex        =   7
         ToolTipText     =   "Escolher tecla para Subtitle"
         Top             =   3240
         Width           =   855
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "-"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   18
         Left            =   1560
         TabIndex        =   6
         ToolTipText     =   "Escolher tecla para Vol-"
         Top             =   3960
         Width           =   615
      End
      Begin VB.Label Label34 
         Alignment       =   2  'Center
         Caption         =   "Controles Direcionais:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   3600
         TabIndex        =   5
         Top             =   1200
         Width           =   1935
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "---"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   28
         Left            =   5040
         TabIndex        =   4
         ToolTipText     =   "Escolher tecla para"
         Top             =   3600
         Width           =   855
      End
      Begin VB.Label Cont 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "---"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   31
         Left            =   5040
         TabIndex        =   3
         ToolTipText     =   "Escolher tecla para"
         Top             =   3960
         Width           =   855
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Abrir"
      Height          =   375
      Left            =   2640
      TabIndex        =   1
      Top             =   4800
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Sair"
      Height          =   375
      Left            =   5160
      TabIndex        =   0
      Top             =   4800
      Width           =   1095
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Temporario para path do arquivo de configuracao
Dim TempDir As String

Private Sub Command1_Click()
    Unload Me
End Sub

'Carrega arquivo de configuração
Private Sub Command2_Click()
    Dim Trash As String
    TempDir = LocProg2()
    If TempDir <> "" Then
        On Error GoTo ErrF
        Open TempDir For Input As #1
        Line Input #1, Trash
        
        For Ix = 0 To 31
            Line Input #1, IrCTemp(Ix)
        Next Ix
        Close
    End If
Exit Sub
 
ErrF:
    MsgBox "Arquivo de Configuração Inválido", vbCritical, "Falha"
    TempDir = RProg
End Sub

Private Sub Command3_Click()
    For Ix = 0 To 31
    DoEvents
        IrCTemp(Ix) = "Not"
    Next Ix
End Sub

Private Sub Command4_Click()
    'Transfere para definitivo
    For Ix = 0 To 31
        IRControl(Ix) = IrCTemp(Ix)
    Next Ix
    
    RProg = TempDir
    'Grava valores no arquivo
    SaveProgConfig
    ProgRType
    Command4.Enabled = False
End Sub

Private Sub Command5_Click()
    TempDir = LocProg3
    
    On Error GoTo ErrGT
    Open TempDir For Output As #1
    Print #1, "1"
    
    For Ix = 0 To 31
        Print #1, IrCTemp(Ix)
    Next Ix
    
    Close
Exit Sub

ErrGT:
    ' MsgBox "Erro ao Salvar Arquivo", vbCritical, "Falha"
    TempDir = RProg
End Sub

Private Sub Cont_DblClick(Index As Integer)
    'Mostra form3
    Command4.Enabled = True
    VarTransfer = Index
    Form3.Show 1
End Sub

Private Sub Form_Load()
    'Indica janela ativa
    FormV = True
    Modo = "Config2"
 
    TempDir = RProg
    'Transfere para temporario
    For Ix = 0 To 31
        IrCTemp(Ix) = IRControl(Ix)
    Next Ix
 
    ' Configurações de commondialog
    CommonDialog1.InitDir = App.Path
    CommonDialog1.Filter = "Arquivos de Configuração (*.rcc)|*.rcc"
    CommonDialog1.FilterIndex = 1
    CommonDialog1.Flags = cdlOFNHideReadOnly
    CommonDialog1.Flags = cdlOFNFileMustExist
End Sub

Private Sub Form_Unload(Cancel As Integer)
    'Indica janela inativa
    FormV = False
    Modo = "Normal"
End Sub

Private Sub Timer1_Timer()
    Cont(VarTransfer2).BackColor = &H0&
    Timer1.Enabled = False
End Sub

Private Function LocProg2() As String
    CommonDialog1.Flags = cdlOFNFileMustExist
    ' Set CancelError is True
    CommonDialog1.CancelError = True
    On Error GoTo ErrHandler
    ' Display the Open dialog box
    CommonDialog1.ShowOpen
    'mostra path do arquivo
    LocProg2 = CommonDialog1.FileName
    Command4.Enabled = True
Exit Function
  
ErrHandler:
    'Pressionada tecla de Cancel
    Command4.Enabled = False
    Exit Function
End Function

Private Function LocProg3() As String
    ' Set CancelError is True
    CommonDialog1.CancelError = True
    On Error GoTo ErrHandlerx
    ' Display the Open dialog box
    CommonDialog1.ShowSave
    'mostra path do arquivo
    LocProg3 = CommonDialog1.FileName
Exit Function
  
ErrHandlerx:
    'Pressionada tecla de Cancel
    Exit Function
End Function

