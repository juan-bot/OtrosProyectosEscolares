#include <avr/io.h> 
#include <avr/interrupt.h>
ISR(SPI_STC_vect){ // Fin de transferencia por SPI 
	PORTD = SPDR; // Lee el dato recibido 
}
int main() {
	DDRB = 0x10 ; // MISO como salida 
	DDRD = 0xFF; // Puerto D como salida
	SPCR = 0xC0; // Habilita la interfaz SPI con interrupci´on 
	SPSR = 0x00 ;
	sei (); // Habilitador global de interrupciones
	while (1) // Lazo infinito 
	asm("nop");
}


