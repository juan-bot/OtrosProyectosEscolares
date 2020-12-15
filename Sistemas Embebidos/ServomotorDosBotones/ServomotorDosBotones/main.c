#define F_CPU 1000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
 int grados=1499;
ISR(INT0_vect){
	if(grados==899)
		grados=2099;
	else
		grados=grados-100;
	OCR1A = grados; 
}
ISR(INT1_vect){
	if(grados==2099)
		grados=899;
	else
		grados=grados+100;
	OCR1A = grados; 
}
int main(void){
	DDRB = 0xFF; // Salida en OC1A (PB1)
	EICRA = 0X0A;
	EIMSK = 0X03;
	ICR1 = 19999; // Valor maaximo 
	TCCR1A = 0x82 ; // PWM raapido con modo no invertido
	TCCR1B = 0x19 ; // Reloj sin preescalador
	TCCR1C = 0x00 ;
	OCR1A = 1499; // 90 grados
	sei();
	while(1) {
		asm("NOP");
	}
}