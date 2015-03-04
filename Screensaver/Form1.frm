VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   5775
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7215
   FillColor       =   &H000000FF&
   LinkTopic       =   "Form1"
   ScaleHeight     =   5775
   ScaleWidth      =   7215
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.Timer Timer1 
      Interval        =   50
      Left            =   6120
      Top             =   5040
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim Centerx
Dim Centery
Dim K
Dim I
Const Pi = 3.14159265358979
Dim Kcenterx
Dim Kcentery
Dim Color
Dim Size
Dim Limpa

Private Sub Form_Click()
    Unload Me
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    Unload Me
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
    Unload Me
End Sub

Private Sub Form_Load()
    Limpa = 0
End Sub

Private Sub Timer1_Timer()
    If (Limpa < 200) Then
        Limpa = Limpa + 1
    Else
        Limpa = 0
        Form1.Cls
    End If
 
    Randomize
    Kcenterx = Int(Rnd * Form1.Width)
    Kcentery = Int(Rnd * Form1.Height)
    Color = Int(Rnd * &HFFFFFF)
    Size = Int((1000 - 500 + 1) * Rnd + 500)

    For I = 0 To 150
        K = (Pi / 75) * I
        Centerx = Kcenterx + (Size + 100) * Sin(K)
        Centery = Kcentery + (Size + 100) * Cos(K)
        Form1.Circle (Centerx, Centery), 500, Color
    Next I
End Sub

