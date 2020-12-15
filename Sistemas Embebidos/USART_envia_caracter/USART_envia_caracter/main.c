#include <avr/io.h> 
#include <avr/interrupt.h>
uint8_t dato = 0x20; // Primer dato a enviar
ISR(INT0_vect) { // Boton presionado
	while (!( UCSR0A & 1 << UDRE0 ));		// Asegura buffer vacio 
	UDR0 = dato ;							// Envia el dato
	dato = (dato == 0x7E)? 0x20 : dato+1;	// Prepara el siguiente
}
ISR(USART_RX_vect) {	// Recibe un caracter
	PORTB = UDR0;		// Lo ubica en el Puerto B
}
int main (){
	DDRD = 0x02 ;				// RXD e INT0 son entradas , TXD es salida 
	PORTD = 0x04 ;				// Pullup en INT0
	DDRB = 0xFF;				// Puerto B como salida
	EICRA = 0x02 ;				// INT0 por flanco de bajada 
	EIMSK = 0x01 ;				// Habilita la INT0
	UBRR0 = 12;					// Para 4800 
	UCSR0A = 0x00 ;				// Modo asincrono normal 
	UCSR0B = 0x98 ;				// Habilita transmisor y receptor 
	
	// con interrupcion por recepcion 
	
	UCSR0C = 0x06 ;				// Datos de 8 bits , sin paridad , 1 bit de paro
	sei ();						// Habilitador global de interrupciones 
	while (1){ 
		asm("NOP");
	}
}
