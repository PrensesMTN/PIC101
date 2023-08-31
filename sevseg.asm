
;====================================================================
;	display		PORTB PINS
;			b'0gfe dcba'
;	  0	    ->  b'0011 1111'	h'3F'
;	  1	    ->  b'0000 0110'	h'06'
;	  2	    ->  b'0100 1011'	h'5B'
;	  3	    ->  b'0100 1111'	h'4F'
;	  4	    ->  b'0110 0110'	h'66'
;	  5	    ->  b'0110 1101'	h'6D'
;	  6	    ->  b'0111 1101'	h'7D'
;	  7	    ->  b'0000 0111'	h'07'
;	  8	    ->  b'0111 1111'	h'7B'
;	  9	    ->  b'0110 1111'	h'6F'
;====================================================================


#include p16f84a.inc 
               ; Include register definition file
LED	EQU	h'07'
CNT1	EQU	h'0C'	;bank-0
CNT2	EQU	h'0D'
      org	h'000' 
      GOTO	Setup
      
		   
Setup
      bcf	STATUS, RP0 	;goto bant-0
      clrf	PORTB		;verilen file (PORTB) komple 0 yapar
      bsf	STATUS, RP0 	;goto bant-1
      movlw	h'80'	; trisb = b'1000 0000' = h'80'
      movwf 	TRISB
      bcf	STATUS, RP0

Start
      call 	Sifir
      call	Delay
      call	Bir
      call	Delay
      call	Iki
      call	Delay      
      call	Uc
      call	Delay      
      call	Dort
      call	Delay
      call	Bes
      call	Delay
      call	Alti
      call	Delay
      call	Yedi
      call	Delay
      call	Sekiz
      call	Delay
      call	Dokuz
      call	Delay
      goto	Start
      
Sifir
      bcf	STATUS, RP0
      movlw	h'3F'
      movwf	PORTB
      return
Bir
      bcf	STATUS, RP0
      movlw	h'06'
      movwf	PORTB
      return
      
Iki	
      bcf	STATUS, RP0
      movlw	h'5B'
      movwf	PORTB
      return
      
Uc
      bcf	STATUS, RP0
      movlw	h'4F'
      movwf	PORTB
      return
      
Dort
      bcf	STATUS, RP0
      movlw	h'66'
      movwf	PORTB
      return
      
Bes
      bcf	STATUS, RP0
      movlw	h'6D'
      movwf	PORTB
      return
      
Alti
      bcf	STATUS, RP0
      movlw	h'7D'
      movwf	PORTB
      return
      
Yedi
      bcf	STATUS, RP0
      movlw	h'07'
      movwf	PORTB
      return
      
Sekiz
      bcf	STATUS, RP0
      movlw	h'7B'
      movwf	PORTB
      return
      
Dokuz
      bcf	STATUS, RP0
      movlw	h'6F'
      movwf	PORTB
      return
      

      

Delay		; TSS = 3*CNT1*CNT2 + 5*CNT1+4
      movlw	h'FF'	
      movwf	CNT1	
Loop1
      movlw	h'FF'	
      movwf	CNT2	
Loop2
      decfsz	CNT2, f	
      goto	Loop2 	
      decfsz	CNT1, f	
      goto	Loop1	
      return
			
;====================================================================
      END
