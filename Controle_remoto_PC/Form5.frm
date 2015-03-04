VERSION 5.00
Begin VB.Form Form5 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Sobre"
   ClientHeight    =   4095
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5415
   Icon            =   "Form5.frx":0000
   LinkTopic       =   "Form5"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4095
   ScaleWidth      =   5415
   StartUpPosition =   1  'CenterOwner
   Begin VB.Frame Frame1 
      Height          =   2895
      Left            =   240
      TabIndex        =   2
      Top             =   480
      Width           =   4935
      Begin VB.Image Image1 
         Height          =   480
         Left            =   360
         Picture         =   "Form5.frx":030A
         Top             =   240
         Width           =   480
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Caption         =   "Copyright © 2003 - Voyager"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   240
         Width           =   4455
      End
      Begin VB.Line Line1 
         BorderColor     =   &H80000010&
         X1              =   240
         X2              =   4680
         Y1              =   2280
         Y2              =   2280
      End
      Begin VB.Line Line2 
         BorderColor     =   &H80000014&
         X1              =   240
         X2              =   4680
         Y1              =   2295
         Y2              =   2295
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   1920
      TabIndex        =   0
      Top             =   3600
      Width           =   1575
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      Caption         =   "VGControl Versão 1.0"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   120
      Width           =   4935
   End
End
Attribute VB_Name = "Form5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    FormV = True
End Sub

Private Sub Form_Unload(Cancel As Integer)
    FormV = False
End Sub
