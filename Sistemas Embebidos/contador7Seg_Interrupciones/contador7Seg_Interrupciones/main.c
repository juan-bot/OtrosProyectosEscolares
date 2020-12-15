#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>

const uint8_t tabla [] PROGMEM ={0X3F,0X06,0X5B,0X4F,0X66,0X6D,0X7D,0X07,0X7F,0X67};
uint8_t Conta=0;

ISR(INT0_vect){
	Conta = (Conta <9)? Conta +1: 0;
	PORTB = pgm_read_byte(&tabla[Conta]);
} 
ISR(INT1_vect){
	Conta = (Conta > 0)? Conta-1: 9;
	PORTB = pgm_read_byte(&tabla[Conta]);
}
int main(void){
	DDRD = 0X00;
	PORTD = 0XFF;
	DDRB = 0XFF;
	
	EICRA = 0X0A;
	EIMSK = 0X03;
	PORTB = 0X3F;
	sei();
    while (1) {
		asm("NOP");
    }
}

