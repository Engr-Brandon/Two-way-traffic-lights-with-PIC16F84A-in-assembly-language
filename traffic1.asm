        list p=16f84, f=inhx8m, r=dec
		#include "p16f84.inc"
		__config _CP_OFF &_WDT_OFF &_XT_OSC &_PWRTE_OFF
;----------------------------------------	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
COUNT1  equ 08h
COUNT2  equ 09h
;=========================================
;-----------------------------------------
          org	0x0000
          goto 	start 	; go to beginning of program
;
start     bsf    STATUS,RP0      ;Bank 1
          movlw  b'00000000'     ;set all portB as output
          movwf    TRISB         
          bcf    STATUS,RP0      ;Bank 0     
          goto      MAIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
delay   
loop1   decfsz  COUNT1,1      ;declare my sub-routine
        goto    loop1
        decfsz  COUNT2,1
        goto    loop1
        return
;--------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;--------------------------------------------
MAIN   movlw   b'00010100'
       movwf   PORTB
;---------------------------------------------
       call    delay
       call    delay
       call    delay     ; x5 delay
      call    delay
       call    delay
         call    delay
       call    delay
      call      delay      ;  x5 delay
      call    delay
       call    delay
;
       bsf    PORTB,3
       bcf    PORTB,2
       call    delay     ; x2 delay
       call    delay
        call    delay
;==============================================
       movlw   b'10100000'
       movwf   PORTB
;
       call    delay
       call    delay
       call    delay    ; x5 delay
       call    delay
       call    delay
         call    delay
      call    delay
      call    delay     ; x5 delay
       call    delay
       call    delay
;
       bsf    PORTB,6
       bcf    PORTB,5
       call    delay     ; x2 delay
      call    delay
         call    delay
;----------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       goto   MAIN
       END
