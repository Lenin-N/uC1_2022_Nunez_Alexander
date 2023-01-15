;--------------------------------
    ;@file    P2-Display_7SEG.s
    ;@brief   Representación de valores alfanuméricos(0-9 y A-F) en el display, de números a letras se cambiara si solo si se mantiene presionado el boton del Pic
    ;@date    15/01/2023
    ;@author  Alexander Lenin Nuñez Vilchez
;----------------------------
PROCESSOR 18F57Q84
#include "bits_configuracion.inc"
#include <xc.inc>
#include "retardos.inc"
    
PSECT resetVect, class=code, reloc=2
resetVect: 
    goto Main

PSECT code
Main:
    CALL confi_osc2,1
    CALL confi_port2,1
boton:
    BTFSC   PORTA,3,0
    goto    valores_numeros
valores_letras:
 
  Letra_A:
    MOVLW   00001000B   ; Las indicaciones para representar la letra A en el display 
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSC   PORTA,3,0
    goto valores_numeros
  Letra_B:
    MOVLW   00000011B ; Las indicaciones para representar la B letra en el display 
    MOVWF   0x500,a
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSC   PORTA,3,0
    goto    valores_numeros
  Letra_C:
    MOVLW   01000110B  ; Las indicaciones para representar la letra C en el display 
    MOVWF   0x500,a 
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSC   PORTA,3,0
    goto    valores_numeros
  Letra_D:
    MOVLW   00100001B    ; Las indicaciones para representar la letra A en el display 
    MOVWF   0x500,a
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSC   PORTA,3,0
    goto valores_numeros
  Letra_E:                      
    MOVLW   00000110B   ; Las indicaciones para representar la letra A en el display 
    MOVWF   0x500,a 
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSC   PORTA,3,0
    goto valores_numeros
  Letra_F:
    MOVLW   00001110B   ; Las indicaciones para representar la letra F en el display 
    MOVWF   0x500,a 
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1 
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSC   PORTA,3,0
    goto    valores_numeros
    goto    Letra_A
  
valores_numeros:
 
  Numero_0:
    MOVLW   11000000B ; Las indicaciones para representar el número 0 en el display
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSS   PORTA,3,0  ; Si se presiona el boton -> Representar [A-F] en el display
    goto valores_letras
  Numero_1:
    MOVLW   11111001B  ; Las indicaciones para representar el número 1 en el display
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSS   PORTA,3,0  ; Si se presiona el boton -> Representar [A-F] en el display
    goto valores_letras
  Numero_2:
    MOVLW   10100100B ; Las indicaciones para representar el número 2 en el display
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSS   PORTA,3,0  ; Si se presiona el boton -> Representar [A-F] en el display
    goto valores_letras
  Numero_3:
    MOVLW   10110000B  ; Las indicaciones para representar el número 3 en el display
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSS   PORTA,3,0   ; Si se presiona el boton -> Representar [A-F] en el display
    goto valores_letras
  Numero_4:
    MOVLW   10011001B  ; Las indicaciones para representar el número 4 en el display
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSS   PORTA,3,0  ; Si se presiona el boton -> Representar [A-F] en el display
    goto valores_letras
  Numero_5:
    MOVLW   10010010B  ; Las indicaciones para representar el número 5 en el display
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSS   PORTA,3,0  ; Si se presiona el boton -> Representar [A-F] en el display
    goto valores_letras
  Numero_6:
    MOVLW   10000010B  ; Las indicaciones para representar el número 6 en el display
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
   BTFSS   PORTA,3,0  ; Si se presiona el boton -> Representar [A-F] en el display
    goto valores_letras
  Numero_7:
    MOVLW   11111000B ; Las indicaciones para representar el número 7 en el display
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSS   PORTA,3,0  ; Si se presiona el boton -> Representar [A-F] en el display
    goto valores_letras
  Numero_8:
    MOVLW   10000000B ; Las indicaciones para representar el número 8 en el display
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1  
   BTFSS   PORTA,3,0   ; Si se presiona el boton -> Representar [A-F] en el display
    goto valores_letras
  Numero_9:
    MOVLW   10011000B   ; Las indicaciones para representar el número 9 en el display
    MOVWF   0x500,a
    BANKSEL PORTD
    MOVWF   PORTD,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSS   PORTA,3,0 ; Si se presiona el boton -> Representar [A-F] en el display
    goto valores_letras
    goto    Numero_0
    
confi_osc2:  
    BANKSEL OSCCON1
    MOVLW   0x60 
    MOVWF   OSCCON1,1
    MOVLW   0x02 
    MOVWF   OSCFRQ,1
    RETURN
    
confi_port2:
    ; Conf. de puertos para los leds de corrimiento
    BANKSEL PORTD   
    CLRF    PORTD,1	;PORTC=0
    CLRF    LATD,1	;LATC=1, Leds apagado
    CLRF    ANSELD,1	;ANSELC=0, Digital
    CLRF    TRISD,1     ;puerto  D como salidas
    ;confi button
    BANKSEL PORTA
    CLRF    PORTA,1	;
    CLRF    ANSELA,1	;ANSELA=0, Digital
    BSF	    TRISA,3,1	; TRISA=1 -> entrada
    BSF	    WPUA,3,1	;Activo la reistencia Pull-Up
    RETURN      
    
END resetVect
   


