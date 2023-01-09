;--------------------------------
    ;@file    Retardos.inc
    ;@brief   Libreria para retardos
    ;@date    06/01/2023
    ;@author  Alexander Lenin Nuñez Vilchez
    ;Frecuencia = 4MHz
    ;TCY = 1us
    ;----------------------------
    
    
PSECT udata_acs
Comando1: DS 1      ;reserva un 1 Byte en access ram
Comando2: DS 1      ;reserva un 1 Byte en access ram
  
PSECT code


    ;; Retardo1(10us), T=(6+4a1)*TCY = (6+4(1))us = 10us
Delay_10us:                  ;  2TCY---CALL
    MOVLW  1                 ;  1TCY
    MOVWF  Comando1,0        ;  1TCY
Loop_a:   
    NOP                      ;  a1*TCY
    DECFSZ Comando1,1,0      ; (a1-1) + 3*TCY
    GOTO   Loop_a            ;  (a1-1)*2TCY
    RETURN                   ;  2*TCY
    
    ;; Retardo2(25us),  T=(6+4a1)*TCY =  (6+4(5))us = 26us
Delay_25us:                  ;  2TCY---CALL
    MOVLW  5                 ;  1TCY
    MOVWF  Comando1,0        ;  1TCY
Loop_b:   
    NOP                      ;  a1*TCY
    DECFSZ Comando1,1,0      ;  (a1-1) + 3*TCY
    GOTO   Loop_b            ;  (a1-1)*2TCY
    RETURN                   ;  2*TCY
    


    ;; Retardo3(50us), T=(6+4a1)*TCY = (6+4(11))us = 50us 
Delay_50us:                  ;  2TCY---CALL  
    MOVLW  11                ;  1TCY
    MOVWF  Comando1,0        ;  1TCY
Loop_c:
    NOP                      ;  a1*TCY
    DECFSZ Comando1,1,0      ;  (a1-1) + 3*TCY
    GOTO   Loop_c            ;  (a1-1)*2TCY
    RETURN                   ;  2*TCY
                                  
                                  
    ;; Retardo4(100us),  T=(6+4a1)*TCY = (6+4(24))us = 100us
Delay_100us:                 ;  2TCY---CALL
    MOVLW  24                ;  1TCY
    MOVWF  Comando1,0        ;  1TCY
Loop_d:
    NOP                      ;  a1*TCY
    DECFSZ Comando1,1,0      ;  (a1-1) + 3*TCY
    GOTO   Loop_d            ;  (a1-1)*2TCY
    RETURN                   ;  2*TCY

      
    ;; Retardo5(200us,    T=(6+4a1)*TCY = (6+4(49))us = 200us
Delay_200us:                 ;  2TCY---CALL
    MOVLW  49                ;  1TCY
    MOVWF  Comando1,0        ;  1TCY
Loop_e:
    NOP                      ;  a1*TCY
    DECFSZ Comando1,1,0      ;  (a1-1) + 3*TCY
    GOTO   Loop_e            ;  (a1-1)*2TCY
    RETURN                   ;  2TCY

 
    ;; Retardo6(250us),    T=(6+4a1)*TCY = (6+4(61))us = 250us
Delay_250us:                 ;  2TCY---CALL
    MOVLW  61                ;  1TCY
    MOVWF  Comando1,0        ;  1TCY
Loop_f:
    NOP                      ;  a1*TCY
    DECFSZ Comando1,1,0      ;  (a1-1) + 3*TCY
    GOTO   Loop_f            ;  (a1-1)*2TCY
    RETURN                   ;  2TCY

    
    ;; Retardo7(500us),     T=(6+4a1)*TCY = (6+4(124))us = 500us
Delay_500us:                 ;   2TCY---CALL
    MOVLW  124               ;   1TCY
    MOVWF  Comando1,0        ;   1TCY
Loop_g:
    NOP                      ;   a1*TCY
    DECFSZ Comando1,1,0      ;   (a1-1) + 3*TCY
    GOTO   Loop_g            ;   (a1-1)*2TCY
    RETURN                   ;   2*TCY
    
    
    ;; Retardo8(1ms),       T= (a2*(6+4(a1)us))+a2*(1us)+ 6*(1us)= (a2*(6+4(249)us))+ a2*(1us)+ 6us = 1*(1ms)+ 1(1us)+ 6us = 1.007ms
      
Delay_1ms:                    ;  2TCY---Call
    MOVLW  1                  ;  1TCY
    MOVWF  Comando2,0         ;  1TCY
      ; T= (6+4a1)us= (6+4*(249))= 1ms 
Loop_Ext_1:  
    MOVLW  249                ;  a2*TCY
    MOVWF  Comando1,0         ;  a2*TCY
Loop_Int_1:
    Nop                       ;  a2*a1*TCY
    DECFSZ Comando1,1,0       ;  a2*((a1-1) + 3*TCY)
    GOTO   Loop_Int_1         ;  a2((a1-1)*2TCY)
    DECFSZ Comando2,1,0       ;  (a2-1) + 3*TCY
    GOTO   Loop_Ext_1         ;  (a2-1)*2TCY
    RETURN                    ;  2*TCY

  
    ;; Retardo9(5ms),       T= (a2*(6+4(a1)us))+a2*(1us)+ 6*(1us)= (a2*(6+4(249)us))+ a2*(1us)+ 6us = 5*(1ms)+ 5(1us)+ 6us = 5.011ms
      
Delay_5ms:                    ;  2TCY---Call
    MOVLW  5                  ;  1TCY
    MOVWF  Comando2,0         ;  1TCY
      ; T= (6+4a1)us= (6+4*(249))= 1ms 
Loop_Ext_2:  
    MOVLW  249                ;  a2*TCY
    MOVWF  Comando1,0         ;  a2*TCY
Loop_Int_2:
    Nop                       ;  a2*a1*TCY
    DECFSZ Comando1,1,0       ;  a2*((a1-1) + 3*TCY)
    GOTO   Loop_Int_2         ;  a2((a1-1)*2TCY)
    DECFSZ Comando2,1,0       ;  (a2-1) + 3*TCY
    GOTO   Loop_Ext_2         ;  (a2-1)*2TCY
    RETURN                    ;  2*TCY
    
    
    ;; Retardo10(10ms),     T= (a2*(6+4(a1)us))+a2*(1us)+ 6*(1us)= (a2*(6+4(249)us))+ a2*(1us)+ 6us = 10*(1ms)+ 10(1us)+ 6us = 10.016ms
Delay_10ms:                   ;  2TCY---Call
    MOVLW  10                 ;  1TCY
    MOVWF  Comando2,0         ;  1TCY
      ; T= (6+4a1)us= (6+4*(249))= 1ms 
Loop_Ext_3:  
    MOVLW  249                ;  a2*TCY
    MOVWF  Comando1,0         ;  a2*TCY
Loop_Int_3:
    Nop                       ;  a2*a1*TCY
    DECFSZ Comando1,1,0       ;  a2*((a1-1) + 3*TCY)
    GOTO   Loop_Int_3         ;  a2((a1-1)*2TCY)
    DECFSZ Comando2,1,0       ;  (a2-1) + 3*TCY
    GOTO   Loop_Ext_3         ;  (a2-1)*2TCY
    RETURN   
    
   
    ;; Retardo11(25ms),      T= (a2*(6+4(a1)us))+a2*(1us)+ 6*(1us)= (a2*(6+4(249)us))+ a2*(1us)+ 6us = 25*(1ms)+ 25(1us)+ 6us = 25.031ms
Delay_25ms:                   ;  2TCY---Call
    MOVLW  25                 ;  1TCY
    MOVWF  Comando2,0         ;  1TCY
      ; T= (6+4a1)us= (6+4*(249))= 1ms 
Loop_Ext_4:  
    MOVLW  249                ;  a2*TCY
    MOVWF  Comando1,0         ;  a2*TCY
Loop_Int_4:
    Nop                       ;  a2*a1*TCY
    DECFSZ Comando1,1,0       ;  a2*((a1-1) + 3*TCY)
    GOTO   Loop_Int_4         ;  a2((a1-1)*2TCY)
    DECFSZ Comando2,1,0       ;  (a2-1) + 3*TCY
    GOTO   Loop_Ext_4         ;  (a2-1)*2TCY
    RETURN                    ;  2*TCY
    
    
    ;; Retardo12(50ms),       T= (a2*(6+4(a1)us))+a2*(1us)+ 6*(1us)= (a2*(6+4(249)us))+ a2*(1us)+ 6us = 50*(1ms)+ 50(1us)+ 6us = 50.056ms
Delay_50ms:                   ;  2TCY---Call
    MOVLW  50                 ;  1TCY
    MOVWF  Comando2,0         ;  1TCY
      ; T= (6+4a1)us= (6+4*(249))= 1ms 
Loop_Ext_5:  
    MOVLW  249                ;  a2*TCY
    MOVWF  Comando1,0         ;  a2*TCY
Loop_Int_5:
    Nop                       ;  a2*a1*TCY
    DECFSZ Comando1,1,0       ;  a2*((a1-1) + 3*TCY)
    GOTO   Loop_Int_5         ;  a2((a1-1)*2TCY)
    DECFSZ Comando2,1,0       ;  (a2-1) + 3*TCY
    GOTO   Loop_Ext_5         ;  (a2-1)*2TCY
    RETURN                    ;  2*TCY
                                  
                                   
    ;; Retardo13(100ms),      T= (a2*(6+4(a1)us))+a2*(1us)+ 6*(1us)= (a2*(6+4(249)us))+ a2*(1us)+ 6us = 100*(1ms)+ 100(1us)+ 6us = 100.106ms
Delay_100ms:                  ;  2TCY---Call
    MOVLW  100                 ;  1TCY
    MOVWF  Comando2,0         ;  1TCY
      ; T= (6+4a1)us= (6+4*(249))= 1ms 
Loop_Ext_6:  
    MOVLW  249                ;  a2*TCY
    MOVWF  Comando1,0         ;  a2*TCY
Loop_Int_6:
    Nop                       ;  a2*a1*TCY
    DECFSZ Comando1,1,0       ;  a2*((a1-1) + 3*TCY)
    GOTO   Loop_Int_6         ;  a2((a1-1)*2TCY)
    DECFSZ Comando2,1,0       ;  (a2-1) + 3*TCY
    GOTO   Loop_Ext_6         ;  (a2-1)*2TCY
    RETURN                    ;  2*TCY
                                  
   
    
    ;; Retardo14(200ms),      T= (a2*(6+4(a1)us))+a2*(1us)+ 6*(1us)= (a2*(6+4(249)us))+ a2*(1us)+ 6us = 200*(1ms)+ 200(1us)+ 6us = 200.106ms   
Delay_200ms:                  ;  2TCY---Call
    MOVLW  200                ;  1TCY
    MOVWF  Comando2,0         ;  1TCY
      ; T= (6+4a1)us= (6+4*(249))= 1ms 
Loop_Ext_7:  
    MOVLW  249                ;  a2*TCY
    MOVWF  Comando1,0         ;  a2*TCY
Loop_Int_7:
    Nop                       ;  a2*a1*TCY
    DECFSZ Comando1,1,0       ;  a2*((a1-1) + 3*TCY)
    GOTO   Loop_Int_7         ;  a2((a1-1)*2TCY)
    DECFSZ Comando2,1,0       ;  (a2-1) + 3*TCY
    GOTO   Loop_Ext_7         ;  (a2-1)*2TCY
    RETURN                    ;  2*TCY
    
    ;; Retardo15(250ms),      T= (a2*(6+4(a1)us))+a2*(1us)+ 6*(1us)= (a2*(6+4(249)us))+ a2*(1us)+ 6us = 250*(1ms)+ 250(1us)+ 6us = 250.256ms  
Delay_250ms:                  ;  2TCY---Call
    MOVLW  250                ;  1TCY
    MOVWF  Comando2,0         ;  1TCY
      ; T= (6+4a1)us= (6+4*(249))= 1ms 
Loop_Ext_8:  
    MOVLW  249                ;  a2*TCY
    MOVWF  Comando1,0         ;  a2*TCY
Loop_Int_8:
    Nop                       ;  a2*a1*TCY
    DECFSZ Comando1,1,0       ;  a2*((a1-1) + 3*TCY)
    GOTO   Loop_Int_8         ;  a2((a1-1)*2TCY)
    DECFSZ Comando2,1,0       ;  (a2-1) + 3*TCY
    GOTO   Loop_Ext_8         ;  (a2-1)*2TCY
    RETURN                    ;  2*TCY





