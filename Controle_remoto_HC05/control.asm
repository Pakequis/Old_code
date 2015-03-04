;*****************************************************************************
;*                      Programa de testes                                   *
;*****************************************************************************
;*****************************************************************************
;*          MOR definicao de bytes para a rotina principal                   *
;*****************************************************************************
          org       $07F1
          db        $a0

;          Peso =  1 2 4 8 . 1 2 4 8
;           Bit =  0 1 2 3 . 4 5 6 7
;         Valor =  0 0 0 0 . 0 1 0 1  =  a4

;MOR - Mask Option Register
;
; Bit 0 - 1 = COP watchdog enable - 0 = disabled
; Bit 1 - 1 = Int. ativa em alto e em subida - 0 = apenas por subida
; Bit 2 - 1 = PA0-PA3 enabled as external interrupt pins - 0 = not enabled
; Bit 3 - 1 = Software pulldown control inhibited - 0 = not inhibit
; Bit 4 - 1 = halt mode enabled - 0 = disabled
; Bit 5 - 1 = Oscilator internal resitor enabled - 0 = disabled
; Bit 6 - 1 = Acesso a eprom negado - 0 = disabled (protect bit)
; Bit 7 - 1 = Short oscilator delay enabled - 0 = disabled

;****************************************************************************
;MC68HC705J1A pinagem:
;                   ____________
;  XTAL --> OSC1 --|1    \/   20|-- RESET   (NEG)  <-- Reset
;  XTAL --> OSC2 --|2         19|-- IRQ/VPP (NEG)  <-- VCC
;Output <--  PB5 --|3         18|-- PA0            <--Input
;       -->  PB4 --|4         17|-- PA1            <--
;       -->  PB3 --|5         16|-- PA2            <--
;       -->  PB2 --|6         15|-- PA3            <--
;       -->  PB1 --|7         14|-- PA4            <--
;       -->  PB0 --|8         13|-- PA5            <--
;   VCC -->  VDD --|9         12|-- PA6            <--
;   GND -->  VSS --|10        11|-- PA7            <--
;                   ------------

;*****************************************************************************
;*         Equates e RAM                                                     *
;*****************************************************************************

;**** Equates para I/O:
Porta     equ       $00                 ;Portal A (8 I/O lines)
Portb     equ       $01                 ;Portal B (6 I/O lines)
ddra      equ       $04                 ;1 = Saida
ddrb      equ       $05                 ;0 = entrada
tscr      equ       $08                 ;Timer status & control
tcr       equ       $09                 ;timer control register
iscr      equ       $0a                 ;IRQ status & control
pdra      equ       $10                 ;1 = Pulldown disabled
pdrb      equ       $11                 ;0 = Pulldown enabled

txd       equ       5                   ;pino transmissor de dados
ir_in     equ       0         		;entrada de leitura

;equates para TSCR
tof       equ       7
rtif      equ       6
toie      equ       5
rtie      equ       4
tofr      equ       3
rtifr     equ       2
rt1       equ       1
rt0       equ       0

**** Constantes:
BAUD_SEL  equ       $08                 ;BAUD_SEL   4MHz osc   2MHz osc
                                        ;  $04       19.2K      9600
                                        ;  $08       9600       4800
                                        ;  $10       4800       2400
                                        ;  $20       2400       1200
                                        ;  $40       1200        600
                                        ;  $80        600        300

; Variaveis RAM:
          org       $C0       ;RAM

char      rmb       1         ;dado para SCI
status    rmb       1         ;status geral do software
count     rmb       1         ;contador da interrupcao
time1     rmb       1
time2     rmb       1
indice    rmb       1         ;contador de edges
;tcr_of    rmb       1         ;off-set do tcr
thant2    rmb       1
tlant2    rmb       1
diff      rmb       1         ;diferenca entre os tempos

temp      rmb       1
temp3     rmb       1

code      rmb       0c        ;contem o codigo da mensagem

timp      rmb       18

atraso    rmb       1


;*****************************************************************************
;*    main - programa principal - Loop infinito                              *
;*****************************************************************************

          org       $300                ;inicio da ROM
main      rsp                           ;reseta stack pointer
          jsr       init                ;inicializa portais
          clrx      ;inicializa indexador
          clra
          sta       status    ;inicializa status
          sta       indice    ;inicia no primeiro bit
          sta       code      ;\
          sta       code+1    ; |
          sta       code+2    ; |
          sta       code+3    ; |
          sta       code+4    ; |
          sta       code+5    ; |Inicializa codigo em zero
          sta       code+6    ; |
          sta       code+7    ; |
          sta       code+8    ; |
          sta       code+9    ; |
          sta       code+0a   ; |
          sta       code+0b   ;/

          sta       thant2    ;Zera referencias
          sta       tlant2    ;

prot
;Apos o reset espera 500ms e envia identificacao
          lda       #$fa      ;\
          sta       atraso    ; |Atraso de 500 ms
          jsr       delay     ; |
          jsr       delay     ;/

          lda       #$49      ;\
          sta       char      ; |
          jsr       put_char  ; |Envia identificacao
          lda       #$52      ; |
          sta       char      ; |
          jsr       put_char  ;/

          lda       #$0f      ;\
          sta       atraso    ; |Atraso de 15 ms
          jsr       delay     ;/

m_loop    clr       count               ; |Espera pausa de 16ms
m_thg     brset     ir_in,porta,m_tgp   ; |
          bra       m_loop              ; |
m_tgp     brclr     0,status,m_thg      ;/

          lda       #$02
          jsr       delay_13a ;atraso
          clra

;recebe a mensagem:
m_lp0     ;se a linha cair de 1 para 0 continua:
          brset     ir_in,porta,m_lp0

          clr       count     ;zera time-out
          clr       time1
          clr       time2

;executa medida e calculo do nivel baixo
m_low     brset     0,status,havedata0 ;5  ;verifica mensagem completa

          brset     7,status,m_l1       ;apenas para atraso 5
          brset     7,status,m_l1       ;apenas para atraso 5

          lda       time1 ;3            ;
          inca            ;3            ;incrementa tempo
          sta       time1 ;4            ;
          cmp       #$04  ;2            ;Verifica overflow
          bne       m_l1  ;3            ;10us ateh aqui

          clr       time1 ;5            ;limpa contador 1
          inc       time2               ;Conta Tempo + 1
          bne       m_l1                ;verifica time_out
          bset      0,status            ;indica time_out

m_l1      brclr     ir_in,porta,m_low  ;5 ;verifica nivel alto
          ;se a linha subir de 0 para 1 continua:

          lda       time2     ;
          sub       tlant2    ;Verifica se e diferente do anterior
          bcc       m_lp3     ;
          nega                ;modulo da diferenca

m_lp3     sta       diff      ;
          lda       time2     ;guarda valor do tempo para proxima passagem
          sta       tlant2    ;edge negativo
          bsr       shift_b   ;vai para teste do codigo
          clr       time1     ;
          clr       time2     ;limpa contadores de tempo
          bra       m_high    ;vai para medida de edge positivo

havedata0 jmp       have_data
;executa medida e calculo do nivel alto
m_high    brset     0,status,havedata0  ;verifica time-out

          brset     7,status,m_l1       ;apenas para atraso (5)
          brset     7,status,m_l1       ;apenas para atraso (5)

          lda       time1 ;3            ;
          inca            ;3            ;incrementa tempo
          sta       time1 ;4            ;
          cmp       #$04  ;2            ;Verifica overflow
          bne       m_h1  ;3            ;10us ateh aqui

          clr       time1 ;5            ;limpa contador 1
          inc       time2               ;Conta Tempo + 1
          bne       m_h1                ;verifica time_out
          bset      0,status            ;indica time_out

m_h1      brset     ir_in,porta,m_high  ;verifica nivel alto
          ;se a linha cair de 1 para 0 continua:
          lda       time2     ;
          sub       thant2    ;Verifica se e diferente do anterior
          bcc       m_hp3     ;
          nega                ;Modulo da diferenca

m_hp3     sta       diff      ;
          lda       time2     ;guarda valor do tempo para proxima passagem
          sta       thant2    ;edge positivo
          bsr       shift_b   ;vai para teste do codigo
          clr       time1     ;
          clr       time2     ;limpa contadores de tempo
          bra       m_low     ;vai para medida de edge negativo

;/********************************
;* rotaciona bits e monta codigo *
;********************************/
shift_b   asl       code      ;\
          rol       code+1    ; |
          rol       code+2    ; |
          rol       code+3    ; |
          rol       code+4    ; |
          rol       code+5    ; |Rotaciona bits do codigo
          rol       code+6    ; |
          rol       code+7    ; |
          rol       code+8    ; |
          rol       code+9    ; |
          rol       code+0a   ; |
          rol       code+0b   ;/

rota_c    lda       diff      ;\
          cmp       #$06      ; |Verifica diferenca
          bls       sai_ii    ;/
          bset      0,code

sai_ii    inc       indice    ;atualiza edge counter
          lda       indice    ;
          cmp       #$60      ;verifica se ultrapassou limite 48bits (60H)
          bne       sai_tt    ;
          bset      0,status  ;indica fim de mensagem
sai_tt    rts

;*********** Shift_b end ********************


m_saig_0  jmp       m_saig
;Preparacao da mensagem para enviar
have_data bclr      0,status  ;limpa flag de time_out

          lda       indice
          cmp       #$10      ;minimo de 15 edges senao nao envia
          blo       m_saig_0

;prepara para enviar mensagem
m_cont    sei                 ;desabilita interrupcao

send_d    lda       code      ;\
          and       #$0f
          ora       #$30
          sta       timp

          lda       code
          lsra
          lsra
          lsra
          lsra
          ora       #$30
          sta       timp+1

          lda       code+1      ;\
          and       #$0f
          ora       #$30
          sta       timp+2

          lda       code+1
          lsra
          lsra
          lsra
          lsra
          ora       #$30
          sta       timp+3

          lda       code+2     ;\
          and       #$0f
          ora       #$30
          sta       timp+4

          lda       code+2
          lsra
          lsra
          lsra
          lsra
          ora       #$30
          sta       timp+5

          lda       code+3      ;\
          and       #$0f
          ora       #$30
          sta       timp+6

          lda       code+3
          lsra
          lsra
          lsra
          lsra
          ora       #$30
          sta       timp+7

          lda       code+4      ;\
          and       #$0f
          ora       #$30
          sta       timp+8

          lda       code+4
          lsra
          lsra
          lsra
          lsra
          ora       #$30
          sta       timp+9

          lda       code+5      ;\
          and       #$0f
          ora       #$30
          sta       timp+0a

          lda       code+5
          lsra
          lsra
          lsra
          lsra
          ora       #$30
          sta       timp+0b

          lda       code+6      ;\
          and       #$0f
          ora       #$30
          sta       timp+0c

          lda       code+6
          lsra
          lsra
          lsra
          lsra
          ora       #$30
          sta       timp+0d

          lda       code+7      ;\
          and       #$0f
          ora       #$30
          sta       timp+0e

          lda       code+7
          lsra
          lsra
          lsra
          lsra
          ora       #$30
          sta       timp+0f

          lda       code+8      ;\
          and       #$0f
          ora       #$30
          sta       timp+10

          lda       code+8
          lsra
          lsra
          lsra
          lsra
          ora       #$30
          sta       timp+11

          lda       code+9      ;\
          and       #$0f
          ora       #$30
          sta       timp+12

          lda       code+9
          lsra
          lsra
          lsra
          lsra
          ora       #$30
          sta       timp+13

          lda       code+0a      ;\
          and       #$0f
          ora       #$30
          sta       timp+14

          lda       code+0a
          lsra
          lsra
          lsra
          lsra
          ora       #$30
          sta       timp+15

          lda       code+0b    ;\
          and       #$0f
          ora       #$30
          sta       timp+16

          lda       code+0b
          lsra
          lsra
          lsra
          lsra
          ora       #$30
          sta       timp+17

send_p

m_kht
          lda       timp
          sta       char
          jsr       put_char

          lda       timp+1
          sta       char
          jsr       put_char

          lda       timp+2
          sta       char
          jsr       put_char

          lda       timp+3
          sta       char
          jsr       put_char

          lda       timp+4
          sta       char
          jsr       put_char

          lda       timp+5
          sta       char
          jsr       put_char

          lda       timp+6
          sta       char
          jsr       put_char

          lda       timp+7
          sta       char
          jsr       put_char

          lda       timp+8
          sta       char
          jsr       put_char

          lda       timp+9
          sta       char
          jsr       put_char

          lda       timp+0a
          sta       char
          jsr       put_char

          lda       timp+0b
          sta       char
          jsr       put_char

          lda       timp+0c
          sta       char
          jsr       put_char

          lda       timp+0d
          sta       char
          jsr       put_char

          lda       timp+0e
          sta       char
          jsr       put_char

          lda       timp+0f
          sta       char
          jsr       put_char

          lda       timp+10
          sta       char
          jsr       put_char

          lda       timp+11
          sta       char
          jsr       put_char

          lda       timp+12
          sta       char
          jsr       put_char

          lda       timp+13
          sta       char
          jsr       put_char

          lda       timp+14
          sta       char
          jsr       put_char

          lda       timp+15
          sta       char
          jsr       put_char

          lda       timp+16
          sta       char
          jsr       put_char

          lda       timp+17
          sta       char
          jsr       put_char

m_saig    clra                ;\
          sta       count     ; |inicializa para nova mensagem
          tax                 ;/
          sta       indice
          sta       status
          sta       code      ;\
          sta       code+1    ; |
          sta       code+2    ; |
          sta       code+3    ; |
          sta       code+4    ; |
          sta       code+5    ; |Reseta codigo
          sta       code+6    ; |
          sta       code+7    ; |
          sta       code+8    ; |
          sta       code+9    ; |
          sta       code+0a   ; |
          sta       code+0b   ;/
          sta       thant2    ;
          sta       tlant2    ;
          sta       diff      ;
          cli
m_said    bset      toie,tscr ;timer overflow interrupts disabled
          jmp       m_loop    ;retorna ao loop principal

;**************************************************
;* Interrupcao do timer                           *
;**************************************************
timer_int lda       count     ;
          inca                ;Conta numero de interrupcoes
          sta       count
          cmp       #$50      ;25 ms de timeout
          bne       t_sai     ;Verifica timeout
          bset      0,status  ;indica time_out de 16ms
          bra       t_sai

t_sai     bset      tofr,tscr ;espera nova interrupcao
          rti

;*****************************************************************************
;*   init - inicializa portais para operacao SCI                             *
;*          chamada pela funcao principal                                    *
;*****************************************************************************

init      lda       #$00                ;PA0 - PA3 = Entradas
          sta       ddra                ;PA4 - PA7 = Entradas

          lda       #$20                ;PB0 - PB4 = Entradas
          sta       ddrb                ;      PB5 = Saida

          lda       #$01                ;PA0       = Pulldown
          sta       pdra                ;PA1 - PA7 = No Pulldown

          lda       #$00                ;
          sta       pdrb                ;PB0 - PB5 = No Pulldown

          bclr      txd,portb           ;init txd = 1

          bset      toie,tscr ;timer overflow interrupts enabled
          bclr      rtie,tscr ;Real-time interrupts disabled

          clrx
          clra
          sta       count

          rts

;*****************************************************************************
;*   put_char - transmite um byte de dado pelo pino txd                      *
;*              chamada pela funcao principal                                *
;*****************************************************************************

put_char  ldx       #9                  ;envia 8 bits de dados
          clc                           ;limpa carry para start bit

put_data_bits
          bcc       send_0              ;se carry <> 0, entao
          bclr      txd,portb           ;   envia 1 para a saida
          bra       jmp_bit             ;   termina mandando 1
send_0    bset      txd,portb           ;senao manda 0
          bra       jmp_bit             ;   termina mandando 0
jmp_bit   lda       #2*(BAUD_SEL-1)-1   ;prepara para delay
          bsr       delay_13a           ;executa rotina de delay
          tsta                          ;somente para temporizacao
          ror       char                ;obtem o prox. bit para env.
          decx                          ;decrementa x a cada bit env.
          bne       put_data_bits       ;loop se mais bits para env.
put_stop_bit
          nop                           ;somente para temporizacao
          bclr      txd,portb           ;envia um 1
          lda       #2*(BAUD_SEL-1)     ;prepara para 1 bit delay
          bsr       delay_13a           ;executa rotina de delay

;*   estas duas linhas sao para garantir o envio de dois stop bits:
;*                   lda       #2*(BAUD_SEL-1)+1   ;prepara para 1 bit delay
;*                   bsr       delay_13a           ;executa rotina de delay

          rts                           ;exit

;*****************************************************************************
;*   delay_13a - delay para 13*ACC+12 ciclos                                 *
;*               chamada pela funcao get_char e put_char                     *
;*****************************************************************************

delay_13a nop                           ;este e um loop de 13 ciclos
          nop                           ;
          tsta                          ;
          deca                          ;decremanta contador de loop
          bne       delay_13a           ;loop se count nao for zero
          rts                           ;exit

;************************************************
;* subrotina que gera atraso de n milisegundos  *
;************************************************

delay     ldx       atraso
delay1    decx                          ;
          bne       delay1              ;
          ldx       temp                ;recupera o valor de X
          rts                           ;

;*****************************************************
;Vetores de Interrupcao e reset para rotina principal
;*****************************************************

          org       $07fe
          fdb       main

          org       $07f8
          fdb       timer_int

