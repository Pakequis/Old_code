Attribute VB_Name = "Funcoes"
Option Explicit

Public Erro As Boolean
Public I As Integer
Public Ix As Integer
Public Indicador As Integer
Public AuxString As String

'Buffer da serial
Public Buffer As String

'Indica o modo em que o software está
'Noconfig - Ainda não configurado
'Normal - Sistema pronto
'NewConfig - Nova configuração
'Config - Em Configuração
Public Modo As String

Public Tcont As Boolean
'indica receptor ok
Public RecStatus As Boolean
Public VarTransfer As Integer
Public VarTransfer2 As Integer

'Indica que já existe uma janela ativa
Public FormV As Boolean

'Variaveis de configuracao de Softwares
Public ProgEnable(5) As String 'Habilitacao do programa
Public ProgType(5) As String  'Tipo do Programa
Public ProgPath(5) As String   'Local do programa
Public Rport As String 'Porta de comunicacao
Public RType As String 'Tipo do receptor
Public RProg As String 'Path do arquivo de configuração

' Variaveis do Controle
Public IRControl(31) As String

Public IrCTemp(31) As String

Sub LoadProgConfig()
    Dim CfgPath As String 'Local do arquivo de configuracao
    Dim Timp As String
    'Seta local do arquivo de configuracao
    CfgPath = App.Path & "\Prglc.cfg"
    'Seta tratamento de erros
    On Error GoTo ErroOpen
    'Abre o arquivo de configuração
    Open CfgPath For Input As #1
    'Carrega linhas de configuração

    'Sistema normal, já pode receber dados
    Modo = "Normal"
    GoTo CarregaP

    'sai da sub
    Exit Sub

'Entra aqui caso o arquivo de configuracao nao existir
ErroOpen:
    On Error GoTo ErroOpen2

    Open CfgPath For Output As #1
    Timp = "0 " & App.Path & "\Default.rcc"
    Print #1, Timp
    Timp = "0 -1 Localizar..."
    Print #1, Timp
    Print #1, Timp
    Print #1, Timp
    Print #1, Timp
    Print #1, Timp
    Print #1, Timp
    Close

    On Error GoTo ErroOpen2
    'Abre o arquivo de configuração
    Open CfgPath For Input As #1
    'Carrega linhas de configuração

    'Primeira Configuração
    Modo = "NewConfig"

CarregaP:
    Line Input #1, Rport
    Line Input #1, ProgPath(0)
    Line Input #1, ProgPath(1)
    Line Input #1, ProgPath(2)
    Line Input #1, ProgPath(3)
    Line Input #1, ProgPath(4)
    Line Input #1, ProgPath(5)
    Close

    RProg = Mid(Rport, 3)
    Rport = Mid(Rport, 1, 1)

    'Carrega Habilitação dos programas
    ProgEnable(0) = Mid(ProgPath(0), 1, 1)
    ProgEnable(1) = Mid(ProgPath(1), 1, 1)
    ProgEnable(2) = Mid(ProgPath(2), 1, 1)
    ProgEnable(3) = Mid(ProgPath(3), 1, 1)
    ProgEnable(4) = Mid(ProgPath(4), 1, 1)
    ProgEnable(5) = Mid(ProgPath(5), 1, 1)

    'Carrega Tipo do programa
    ProgType(0) = Mid(ProgPath(0), 3, 2)
    ProgType(1) = Mid(ProgPath(1), 3, 2)
    ProgType(2) = Mid(ProgPath(2), 3, 2)
    ProgType(3) = Mid(ProgPath(3), 3, 2)
    ProgType(4) = Mid(ProgPath(4), 3, 2)
    ProgType(5) = Mid(ProgPath(5), 3, 2)

    'Carrega Path do programa
    ProgPath(0) = Mid(ProgPath(0), 6)
    ProgPath(1) = Mid(ProgPath(1), 6)
    ProgPath(2) = Mid(ProgPath(2), 6)
    ProgPath(3) = Mid(ProgPath(3), 6)
    ProgPath(4) = Mid(ProgPath(4), 6)
    ProgPath(5) = Mid(ProgPath(5), 6)

    Exit Sub

'Caso o arquivo não possa ser criado ou houver falha ao
'abrir o arquivo, mostra mensagem de erro e sai do programa
ErroOpen2:
    MsgBox "Falha ao abrir o arquivo de configuração", vbCritical, "Falha"
    'Gera erro para sair do programa
    Erro = True
End Sub

Sub SaveProgConfig()
    Dim CfgPath As String 'Local do arquivo de configuracao
    Dim Timp(6) As String
    'Seta local do arquivo de configuracao
    CfgPath = App.Path & "\Prglc.cfg"
    Timp(0) = Rport & " " & RProg
    Timp(1) = ProgEnable(0) & " " & ProgType(0) & " " & ProgPath(0)
    Timp(2) = ProgEnable(1) & " " & ProgType(1) & " " & ProgPath(1)
    Timp(3) = ProgEnable(2) & " " & ProgType(2) & " " & ProgPath(2)
    Timp(4) = ProgEnable(3) & " " & ProgType(3) & " " & ProgPath(3)
    Timp(5) = ProgEnable(4) & " " & ProgType(4) & " " & ProgPath(4)
    Timp(6) = ProgEnable(5) & " " & ProgType(5) & " " & ProgPath(5)

    On Error GoTo ErroOpen3
    Open CfgPath For Output As #1
    Print #1, Timp(0)
    Print #1, Timp(1)
    Print #1, Timp(2)
    Print #1, Timp(3)
    Print #1, Timp(4)
    Print #1, Timp(5)
    Print #1, Timp(6)
    Close

    Exit Sub

ErroOpen3:
    MsgBox "Falha ao salvar arquivo de configuração", vbCritical, "Falha"
End Sub

'Carrega comandos do controle
Sub LoadControlConfig()
    AuxString = RProg
    On Error GoTo Erro4
    Open AuxString For Input As #1

    Line Input #1, RType
    'carrega comandos no buffer
    For I = 0 To 31
        Line Input #1, IRControl(I)
    Next I

    Close
    Exit Sub

'Arquivo nao encontrado
Erro4:
    On Error GoTo Erro5
    Open AuxString For Output As #1
        AuxString = "Not"
    Print #1, "1"

    For I = 1 To 32
        Print #1, AuxString
    Next I
    Close
    AuxString = RProg
    On Error GoTo Erro5
    Open AuxString For Input As #1

    Line Input #1, RType
    'carrega comandos no buffer
    For I = 0 To 31
        Line Input #1, IRControl(I)
    Next I
    Close
    Exit Sub

'Caso o arquivo não possa ser criado ou houver falha ao
'abrir o arquivo, mostra mensagem de erro e sai do programa
Erro5:
    MsgBox "Falha ao abrir o arquivo de configuração", vbCritical, "Falha"
    'Gera erro para sair do programa
    Erro = True
End Sub

'Salva comandos
Sub ProgRType()
    AuxString = RProg
    On Error GoTo Erro6
    Open AuxString For Output As #1
    Print #1, RType

    For I = 0 To 31
        Print #1, IRControl(I)
    Next I

    Close
    Exit Sub

Erro6:
    MsgBox "Falha ao salvar arquivo de configuração", vbCritical, "Falha"
End Sub
