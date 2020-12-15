#define  F_CPU 1000000UL//frecuencia a la que operara el delay
#include <avr/pgmspace.h>//libreria para PROGMEM
#include <util/delay.h>//libreria para el delay
#include <avr/io.h>
const uint8_t numero[] PROGMEM ={0x3F,0x06,0x5B,
						0x4F,0x66,0x6D,0x7D
						,0x07,0x7F,0x67}; //arreglo correspondiente a los numeros
											
int main(void) { 
	uint16_t temp;
	DDRD = 0xFF;
	DDRC = 0x00 ; 
	DDRB = 0xFF; 
	ADMUX = 0x00 ;
	ADCSRA = 0xC3; 
	DIDR0 = 0x01 ; 
	while(1) {
		while( !(ADCSRA & 1 << ADIF ) );
		ADCSRA |= 1 << ADIF;
		temp = ((ADCW*4.8875)/10);
		PORTD = pgm_read_byte(&numero[temp%10]);
		PORTB=0X06;
		_delay_ms (5);
		PORTB=0X07;
		PORTD = pgm_read_byte(&numero[(temp%100)/10]);
		PORTB=0X05;
		_delay_ms (5);
		PORTB =0X07;
		PORTD = pgm_read_byte(&numero[temp/100]);
		PORTB=0X03;
		_delay_ms (5);
		PORTB=0X07;
		ADCSRA |= 1 << ADSC;
	}
}
