#define  F_CPU 1000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
const uint8_t arr[] PROGMEM ={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x47,0x7F,0x67};
volatile uint8_t unidades=0,decenas=0;
 
ISR(PCINT2_vect){
	if(!(PIND & 0x01)){
		unidades=0;
		decenas=0;
	}
	else if(!(PIND & 0x02)){
		unidades=9;
		decenas=9;
	}	
}
ISR(INT0_vect){
	if(unidades<9)
		unidades++;
	else{
		unidades=0;
		if(decenas<9)
			decenas++;
		else
			decenas=0;
	}
}
ISR(INT1_vect){
	if(unidades<0){
		unidades=9;
		if(decenas<0)
			decenas=9;
		else
			decenas--;
	}
	else
		unidades--;
}
int main(void){
	DDRD=0X00;
	DDRB=0XFF;
	DDRC=0XFF;
	PORTD=0XFF;//habilita pull-up
	PCMSK2=0x03;//mascara para las interrupciones 16 y 17
	PCICR=0X04;//habilita las interrupciones por cambios en el puerto D
	EICRA=0X0A;//int0,int1, nivel bajo
	EIMSK=0X03;//habilita la int0 , int1
	PORTB=0X00;//valor inicial de cero a la salidas
    sei();
	while (1) {
		PORTB = pgm_read_byte(&arr[unidades]);
		PORTC=0X01;
		_delay_ms (5);
		PORTC=0X03;
		PORTB = pgm_read_byte(&arr[decenas]);
		PORTC=0X02;
		_delay_ms (5);
		PORTC=0X03;
    }
}
