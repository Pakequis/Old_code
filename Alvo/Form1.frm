VERSION 5.00
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   5535
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6960
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5535
   ScaleWidth      =   6960
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   4680
      Top             =   5040
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Exit"
      Height          =   375
      Left            =   5880
      TabIndex        =   1
      Top             =   5040
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   5040
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim X As Integer
Dim Y As Integer
Const Pi = 3.1415926 '5358979
Dim CentroX, CentroY, I As Integer
Dim LX1, LX2, LY1, LY2 As Integer
Dim K
Const color = &H0&

Private Sub Command1_Click()
    CentroX = Form1.Width / 2
    CentroY = Form1.Height / 2
    Form1.Circle (CentroX, CentroY), 100, color
  
    For I = 0 To 16
        K = (Pi / 8) * I

        LX1 = CentroX + (2000) * Sin(K)
        LY1 = CentroY + (2000) * Cos(K)
 
        LX2 = CentroX + (2150) * Sin(K)
        LY2 = CentroY + (2150) * Cos(K)

        Form1.Line (LX1, LY1)-(LX2, LY2), color
 
        'CentroX = Form1.Width / 2
        'CentroY = Form1.Height / 2
    Next I

    For I = 0 To 128
        K = (Pi / 64) * I

        LX1 = CentroX + (2000) * Sin(K)
        LY1 = CentroY + (2000) * Cos(K)
 
        LX2 = CentroX + (2050) * Sin(K)
        LY2 = CentroY + (2050) * Cos(K)

        Form1.Line (LX1, LY1)-(LX2, LY2), color
    Next I
 
    For I = 0 To 4
        K = (Pi / 2) * I

        LX1 = CentroX + (1900) * Sin(K)
        LY1 = CentroY + (1900) * Cos(K)
 
        LX2 = CentroX + (2200) * Sin(K)
        LY2 = CentroY + (2200) * Cos(K)

        Form1.Line (LX1, LY1)-(LX2, LY2), color
    Next I
End Sub

Private Sub Command2_Click()
    Unload Me
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    CentroX = X
    CentroY = Y
End Sub

Private Sub Timer1_Timer()
    Form1.Cls
    Form1.Circle (CentroX, CentroY), 100, color
  
    For I = 0 To 16
        K = (Pi / 8) * I

        LX1 = CentroX + (2000) * Sin(K)
        LY1 = CentroY + (2000) * Cos(K)
 
        LX2 = CentroX + (2150) * Sin(K)
        LY2 = CentroY + (2150) * Cos(K)

        Form1.Line (LX1, LY1)-(LX2, LY2), color
 
        'CentroX = Form1.Width / 2
        'CentroY = Form1.Height / 2
    Next I

    For I = 0 To 128
        K = (Pi / 64) * I

        LX1 = CentroX + (2000) * Sin(K)
        LY1 = CentroY + (2000) * Cos(K)
 
        LX2 = CentroX + (2050) * Sin(K)
        LY2 = CentroY + (2050) * Cos(K)

        Form1.Line (LX1, LY1)-(LX2, LY2), color
    Next I
 
    For I = 0 To 4
        K = (Pi / 2) * I

        LX1 = CentroX + (1900) * Sin(K)
        LY1 = CentroY + (1900) * Cos(K)
 
        LX2 = CentroX + (2200) * Sin(K)
        LY2 = CentroY + (2200) * Cos(K)

        Form1.Line (LX1, LY1)-(LX2, LY2), color
    Next I
  
    For I = 0 To 4
        K = (Pi / 2) * I

        LX1 = CentroX + (100) * Sin(K)
        LY1 = CentroY + (100) * Cos(K)
 
        LX2 = CentroX + (200) * Sin(K)
        LY2 = CentroY + (200) * Cos(K)

        Form1.Line (LX1, LY1)-(LX2, LY2), color
    Next I
End Sub
