;--------------------------------
    ;@file    P1-Corrimiento_Leds
    ;@brief   Corrimientos de led, con representacion de numeros par e impar en binario, al presionar el boton se detiene el corrimiento.
    ;@date    15/01/2023
    ;@author  Alexander Lenin Nu�ez Vilchez
;----------------------------
PROCESSOR 18F57Q84
#include "bits_configuracion.inc"
#include <xc.inc>
#include "retardos.inc"

PSECT resetVect, class=code, reloc=2
resetVect: 
    GOTO Main

PSECT code
Main:
  CALL confi_osc,1
  CALL confi_port,1 
 OPEN:
    BTFSC   PORTA,3,0; si preionamos PORA=0
    GOTO    APAGADO_INICIAL   
  Leds_on_pares:
    BCF     LATE,0,1
    MOVLW   1
    MOVWF   0X502,a  ; (W)-> f
    
   LOPP:
    
    RLNCF   0x502,f,a  ; izquierda a derecha el sentido de prender las leds
    MOVF    0X502,w,a
    BANKSEL PORTC
    MOVWF   PORTC,1
    BSF     LATE,1,1
    ; Queremos un retardo de 500ms .�. usamos dos Delay de 250ms+250ms=500ms
    CALL    Delay_250ms,1
    CALL    Delay_250ms,1
    BTFSC   PORTA,3,0; si preionamos PORA=0
    GOTO    Continua_par
    GOTO    PARE_1
   Continua_par:
    BTFSC   0x502,7,0
    GOTO    Led_on_impar
    RLNCF   0x502,f,a  ; izquierda a derecha el sentido de prender las leds
    MOVF    0X502,w,a
    GOTO    LOPP
 
  Led_on_impar:
    BCF     LATE,1,1
    MOVLW   1
    MOVWF   0X502,a
   LOPP2:
    BANKSEL PORTC
    MOVWF   PORTC,1
    BSF     LATE,0,1
    CALL    Delay_250ms,1
    BTFSC   PORTA,3,0; si preionamos PORA=0
    GOTO    Continua_impar
    GOTO    PARE_2
   Continua_impar:
    BTFSC   0x502,6,0
    GOTO    Leds_on_pares
    RLNCF   0x502,f,a  ; izquierda a derecha el sentido de prender las leds
    RLNCF   0x502,f,a
    MOVF    0X502,w,a
    GOTO    LOPP2
    
APAGADO_INICIAL:
    CLRF    PORTC,1
    GOTO    OPEN
    
PARE_1:
   RETARDO:
    CALL    Delay_250ms
    CALL    Delay_250ms
    CALL    Delay_250ms
    CALL    Delay_250ms
   CAPTURA:
    MOVF    0X502,w,a
    BANKSEL PORTC
    MOVWF   PORTC,1
    BSF     LATE,1,1
    BTFSC   PORTA,3,0; si preionamos PORA=0
    GOTO    CAPTURA
    GOTO    Continua_par
   
PARE_2:
   RETARDO2:
    CALL    Delay_250ms
    CALL    Delay_250ms
    CALL    Delay_250ms
    CALL    Delay_250ms
   CAPTURA2: 
    MOVF    0X502,w,a
    BANKSEL PORTC
    MOVWF   PORTC,1
    BSF     LATE,0,1
    BTFSC   PORTA,3,0; si preionamos PORA=0
    GOTO    CAPTURA2
    GOTO    Continua_impar
    
  
confi_osc:  
    BANKSEL OSCCON1
    MOVLW   0x60 
    MOVWF   OSCCON1,1
    MOVLW   0x02 
    MOVWF   OSCFRQ,1
    RETURN
    
confi_port:
    ; Conf. de puertos para los leds de corrimiento
    BANKSEL PORTC   
    CLRF    PORTC,1	;PORTC=0
    CLRF    LATC,1	;LATC=0, Leds apagado
    CLRF    ANSELC,1	;ANSELC=0, Digital
    CLRF    TRISC,1	;Todos salidas 
    ; Conf. de leds para visualizar cuando se da el corrimiento par o impar.
    BANKSEL PORTE   
    CLRF    PORTE,1	;PORTC=0
    BCF     LATE,0,1	;LATC=1, Leds apagado
    BCF     LATE,1,1
    CLRF    ANSELE,1	;ANSELC=0, Digital
    CLRF    TRISE,1	;Todos salidas 
    ;confi butom
    BANKSEL PORTA
    CLRF    PORTA,1	;
    CLRF    ANSELA,1	;ANSELA=0, Digital
    BSF	    TRISA,3,1	; TRISA=1 -> entrada
    BSF	    WPUA,3,1	;Activo la reistencia Pull-Up
    return
    END resetVect


