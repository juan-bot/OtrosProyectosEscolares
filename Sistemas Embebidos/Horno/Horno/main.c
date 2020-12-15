#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>

ISR(INT0_vect){
	PORTB = 0X00;
}
ISR(INT1_vect){
	PORTB = 0X01;
}
int main(void){
	DDRD=0X00;
	PORTD=0XFF;//habilita pull-up
	DDRB=0XFF;
	EICRA=0X0F;//flanco de subida
	EIMSK=0X03;//activa int1, int0
	PORTB=0X00;
	sei();
    while (1) {
		asm("NOP");
	}
}

