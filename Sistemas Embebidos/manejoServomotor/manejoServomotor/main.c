//MANEJO DE UN SERVOMOTOR
#define F_CPU 1000000UL
#include <avr/io.h> 
#include <util/delay.h>
int main() {
	DDRB = 0xFF; // Salida en OC1A (PB1)
	ICR1 = 19999; // Valor maaximo , T = 20 mS 
	TCCR1A = 0x82 ; // PWM raapido con modo no invertido 
	TCCR1B = 0x19 ; // Reloj sin preescalador 
	TCCR1C = 0x00 ;
	while(1) { 
		OCR1A = 899; // 0? 
		_delay_ms (200); 
		OCR1A = 1499; // 90? 
		_delay_ms (200); 
		OCR1A = 2099; // 180 ? 
		_delay_ms (200); 
		OCR1A = 1499; // 90? 
		_delay_ms (200); 
	}
}
