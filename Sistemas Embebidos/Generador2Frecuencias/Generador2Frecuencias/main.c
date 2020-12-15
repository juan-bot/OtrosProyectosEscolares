#include <avr/io.h> 

int main() {
	DDRD = 0xFF; // Salida en OC0A 
	DDRB = 0xFF; // Salida para OC1A 
	PORTD = 0x00 ; //valores iniciales
	PORTB = 0x00 ; //valores iniciales
	
	// Configuracio´n del temporizador 0 
	OCR0A = 99; // Valor para la comparacion 
	TCCR0A = 0x42 ; // Respuesta automatica y modo CTC 
	TCCR0B = 0x01 ; // Reloj sin preescala
	
	// Configuracio´n del temporizador 1
	OCR1A = 999; // Valor de recarga
	TCCR1A = 0x48 ; // Respuesta autom´a tica y modo CTC 
	TCCR1B = 0x01 ; // Reloj sin preescala
	while(1){
		asm("NOP");
	}
}



