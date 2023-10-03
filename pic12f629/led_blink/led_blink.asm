*#include p12f629.inc                ; Include register definition file
      
    ; Konfigürasyon bitleri
      __CONFIG _INTRC_OSC_NOCLKOUT & _MCLRE_OFF & _CP_OFF & _WDTE_OFF & _BODEN_OFF & _WRT_OFF

; I/O pin'ler için takma adları tanımlayın
LED_PIN   EQU h'0'  ;GPIO0	; LED'in bağlandığı I/O pini GPIO0 olarak belirleyin

; Sabitleri tanımlayın
DELAY_COUNT EQU 1000	; LED'in yanıp sönme hızını ayarlamak için bu değeri değiştirin

; Değişkenler
COUNT1 EQU 0x20	; COUNT1'i Genel Amaçlı Kayıt Dosyasındaki bir değişken olarak tanımlayın
; Dahili osilatör ayarları

; Ana program
      ORG 0x0000
      GOTO Main

; Gecikme alt programı
Delay:
   MOVLW 	DELAY_COUNT
   MOVWF 	COUNT1
   
DelayLoop:
   DECFSZ 	COUNT1, F
   GOTO 	DelayLoop
   RETURN

; Ana döngü
Main:

   BSF 		STATUS, RP0 ; Bank1'e geçiş yap
   CLRF 	GPIO ; LED'i söndürmek için GPIO'yu sıfırla
   BCF 		STATUS, RP0 ; Bank0'a geçiş yap
   CALL 	Delay

LoopOn:
   BSF 		STATUS, RP0 ; Bank1'e geçiş yap
   BSF 		GPIO, LED_PIN ; LED'i yakmak için GPIO'yu ayarla
   BCF 		STATUS, RP0 ; Bank0'a geçiş yap
   CALL 	Delay

   BSF 		STATUS, RP0 ; Bank1'e geçiş yap
   BCF 		GPIO, LED_PIN ; LED'i söndürmek için GPIO'yu sıfırla
   BCF 		STATUS, RP0 ; Bank0'a geçiş yap
   CALL 	Delay
   GOTO LoopOn ; Döngüyü tekrarla

   END
