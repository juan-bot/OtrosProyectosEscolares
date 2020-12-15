#include <avr/io.h> 
#include <avr/interrupt.h>
uint8_t envia_SPI ( uint8_t dato , uint8_t esvo );
ISR(PCINT1_vect) { 
	uint8_t sel , dato ;
	if ( !(PINC & 0x04) ) { // Boton presionado 
		sel = PINC & 0x03 ; 
		dato = PIND;
		if ( sel < 3)			// Esclavos 0, 1 o 2 
			envia_SPI (dato , sel ); // Env?a el dato 
		else {					  // Difusion 
			envia_SPI (dato , 0); // Esclavo 0 
			envia_SPI (dato , 1); // Esclavo 1 
			envia_SPI (dato , 2); // Esclavo 2 
		}
	}
}

int main() { // Programa principal
	DDRD = 0x00 ; // Entrada de datos 
	DDRB = 0x2F; // MOSI, SCK y SS(s) como salidas 
	DDRC = 0x00 ; // Puerto C como entrada 
	PORTD = 0xFF; // Pull?up 
	PORTC = 0x07 ; PORTB = 0x07 ; // Esclavos deshabilitados
	
	SPCR = 0x50 ; // Habilita la interfaz SPI como maestro 
	SPSR = 0x01 ; // Ajustando para 500 KHz 
	
	PCMSK1 = 0x04 ; // Interrupcion por cambios en PC2 
	PCICR = 0x02 ; // Habilita la interrupci´on
	sei (); // Habilitador global de interrupciones 
	while (1) // Lazo infinito 
		asm("NOP");
}
uint8_t envia_SPI ( uint8_t dato , uint8_t esvo ) { 
	uint8_t aux ;
	aux = 1 << esvo ; 
	PORTB &= ~aux ; // Habilita al esclavo 
	SPDR = dato ; // Inicia el envio 
	while (!(SPSR & 1 << SPIF )); // Espera fin de envio 
	PORTB |= aux ; // Deshabilita al esclavo
	return SPDR; // Regresa la respuesta
}
