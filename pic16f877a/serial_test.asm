/*
 * File:   main.c
 * Author: prems
 *
 * 
 * 
 * 
 * Created on 31 A?ustos 2023 Per?embe, 20:33
 */

#pragma config FOSC     = HS
#pragma config WDTE     = OFF
#pragma config PWRTE    = OFF
#pragma config CP       = OFF

#include <xc.h>
#include <stdint.h>

#define _XTAL_FREQ 4000000L

void serialBegin();
void serialWriteByte(char data);
void serialPrint(char *str);



void serialBegin(){
    TRISC = 0b10000000;
    TXSTA = 0b00100100;
    RCSTA = 0b10010000;
    SPBRG = 25;
    TXREG = 0x00;
}

void serialWriteByte(char data){
    while(!TRMT);
    TXREG = data;
}

void serialPrint(char *str){
    for(int i=0; str[i]!='\0'; i++){
        serialWriteByte(str[i]);
    }
}

void main(void) {
    serialBegin();
    for(;;){
        serialPrint("Selam dunya\r\n");
        RC0 = ~RC0;
        __delay_ms(1000);
    }
    return;
}