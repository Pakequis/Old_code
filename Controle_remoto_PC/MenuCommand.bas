Attribute VB_Name = "MenuCommand"
Option Explicit

'Processa as mensagens recebidas pela serial
Public Function MensProcess(EntMens As String)
    If RecStatus = True Then
        'Verifica em que modo está
        Select Case Modo
            '*******************************************
            'Form 2 ativo
            Case "Config2"
                CForm2 (EntMens)
  
            '********************************************
            'Form3 ativo
            Case "Config3"
                CForm3 (EntMens)
            Case "Config4"
                CForm3 (EntMens)
  
            '*******************************************
            'Modo de configuração
            Case "Config"

            '*******************************************
            'Modo desconfigurado
            Case "NoConfig"
    
            '*******************************************
            'Modo de Nova configuração
            Case "NewConfig"
  
            '********************************************
            '* Modo Normal - Gerenciamento de Programas *
            '********************************************
            Case "Normal"
                LigaMenu (EntMens)

            Case "Menu"
                MenuControl (EntMens)
        End Select
    End If
End Function

'Controla Menu de Programas
Sub MenuControl(MenuA As String)
    Select Case MenuA
        'Tecla 1
        Case IRControl(7)
            Indicador = 1
   
        'Tecla 2
        Case IRControl(8)
            Indicador = 2
   
        'Tecla 3
        Case IRControl(9)
            Indicador = 3

        'Tecla 4
        Case IRControl(10)
            Indicador = 4
   
        'Tecla 5
        Case IRControl(11)
            Indicador = 5

        'Tecla 6
        Case IRControl(12)
            Indicador = 6

        'Tecla 7
        Case IRControl(13)
            Indicador = 7

        'Enter
        Case IRControl(24)
  
        'Up
        Case IRControl(20)
        If Indicador > 1 Then
            Indicador = Indicador - 1
        End If
        'Down
        Case IRControl(22)
        If Indicador < 7 Then
            Indicador = Indicador + 1
        End If
        'On-Off
        Case IRControl(29)
            Unload Form6
            FormV = False
            Modo = "Normal"
    End Select
    Paint6
End Sub

Sub Paint6()
    Form6.Label1(0).BackColor = &H0&
    Form6.Label1(1).BackColor = &H0&
    Form6.Label1(2).BackColor = &H0&
    Form6.Label1(3).BackColor = &H0&
    Form6.Label1(4).BackColor = &H0&
    Form6.Label1(5).BackColor = &H0&
    Form6.Label1(6).BackColor = &H0&
    
    If Indicador <> 0 Then
        Form6.Label1(Indicador - 1).BackColor = &HFF0000
    End If
End Sub

'Aciona Acesso aos Programas
Sub LigaMenu(MenuC As String)
    Select Case MenuC
        'Verifica se é comando de Power, se for aciona Menu
        Case IRControl(29)
            FormV = True
            Modo = "Menu"
            Form6.Show 1
            'Form6.Show 1
            
        'Verifica se é primeiro Programa
        Case IRControl(7)
        
        'Verifica se é segundo Programa
        Case IRControl(8)
        
        'Verifica se é terceiro Programa
        Case IRControl(9)
        
        'Verifica se é Quarto Programa
        Case IRControl(10)
        
        'Verifica se é quinto Programa
        Case IRControl(11)
        
        'Verifica se é Sexto Programa
        Case IRControl(12)
        
        'Verifica se é Windows
        Case IRControl(13)
        
    End Select
End Sub

'Verifica e executa comandos
Sub CForm2(CEntry As String)
    For I = 0 To 31
        DoEvents
        If IrCTemp(I) = CEntry Then
            Form2.Cont(I).BackColor = &HFF&
            Form2.Timer1.Enabled = True
            VarTransfer2 = I
            Exit For
        End If
    Next I
End Sub

Sub CForm3(CEntry As String)
    Dim TestaT As Boolean
    If Modo = "Config3" Then
        TestaT = False
        For I = 0 To 31
            If CEntry = IrCTemp(I) Then
                TestaT = True
                Exit For
            End If
        Next I
    
        If TestaT Then
            Form3.Label1.Caption = "A Tecla escolhida já está em uso, favor escolher outra."
            Form3.Label2.Visible = False
        Else
            Form3.Label1.Caption = "Pressione a tecla novamente"
            Form3.Label2.Visible = False
            AuxString = CEntry
            Modo = "Config4"
        End If
    Else
        If AuxString = CEntry Then
            IrCTemp(VarTransfer) = CEntry
            Form3.Timer1.Enabled = True
        End If
    End If
End Sub
