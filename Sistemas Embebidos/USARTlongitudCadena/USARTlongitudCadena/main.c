#include <avr/io.h>
#include <avr/interrupt.h>
uint8_t longitud=0; 
ISR(USART_RX_vect) {	// Recibe un caracter
	if(UDR0==0x24){		//compara cuando si introdujo '$'
		while (!( UCSR0A & 1 << UDRE0 ));	// Asegura buffer vacio
		UDR0 = longitud ;	// Envia la longitud de la cadena
		longitud=0;			//setea el contador de caracteres			
	}
	else
		longitud++; //incrementa cuando no ha encontrado '$'
}
int main (){
	DDRD = 0x02 ;				// RXD entrada , TXD es salida
	UBRR0 = 12;					// Para 4800
	UCSR0A = 0x00 ;				// Modo asincrono normal
	UCSR0B = 0x98 ;				// Habilita transmisor y receptor
	// configura interrupcion por recepcion
	UCSR0C = 0x06 ;				// Datos de 8 bits , sin paridad , 1 bit de paro
	sei ();						// Habilitador global de interrupciones
	while (1){
		asm("NOP");
	}
}

