//AFINADOR DE GUITARRA
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
int bandera=0;
ISR(PCINT1_vect) { // Cambios en el Puerto C

	if (!(PINC & 0x01 )) { // Boton presionado
		if(bandera==0){
			TCCR1B = 0x09 ; // Modo 4 (CTC) , reloj sin preescala
			OCR1A = 379; // Valor de recarga
			bandera=1;
		}
		else{
			PORTB = 0x00 ; // Sin carga
			TCCR1B = 0x00 ; // Sin reloj
		}
		
	}
	else if (!(PINC & 0x02 )) { // Boton presionado
		if(bandera==0){
			TCCR1B = 0x09 ; // Modo 4 (CTC) , reloj sin preescala
			OCR1A = 506; // Valor de recarga
			bandera=1;
		}
		else{
			PORTB = 0x00 ; // Sin carga
			TCCR1B = 0x00 ; // Sin reloj
		}
		
	}
	else if (!(PINC & 0x04 )) { // Boton presionado
		if(bandera==0){
			TCCR1B = 0x09 ; // Modo 4 (CTC) , reloj sin preescala
			OCR1A = 638; // Valor de recarga
			bandera=1;
		}
		else{
			PORTB = 0x00 ; // Sin carga
			TCCR1B = 0x00 ; // Sin reloj
		}
		
	}
	else if (!(PINC & 0x08 )) { // Boton presionado
		if(bandera==0){
			TCCR1B = 0x09 ; // Modo 4 (CTC) , reloj sin preescala
			OCR1A = 852; // Valor de recarga
			bandera=1;
		}
		else{
			PORTB = 0x00 ; // Sin carga
			TCCR1B = 0x00 ; // Sin reloj
		}
		
	}
	else if (!(PINC & 0x10 )) { // Boton presionado
		if(bandera==0){
			TCCR1B = 0x09 ; // Modo 4 (CTC) , reloj sin preescala
			OCR1A = 1136; // Valor de recarga
			bandera=1;
		}
		else{
			PORTB = 0x00 ; // Sin carga
			TCCR1B = 0x00 ; // Sin reloj
		}
		
	}
	else if (!(PINC & 0x20 )) { // Boton presionado
		if(bandera==0){
			TCCR1B = 0x09 ; // Modo 4 (CTC) , reloj sin preescala
			OCR1A = 1517; // Valor de recarga
			bandera=1;
		}
		else{
			PORTB = 0x00 ; // Sin carga
			TCCR1B = 0x00 ; // Sin reloj
		}
		
	}

	else { // Botones liberados
		bandera=0;
		PORTB = 0x00 ; // Sin carga
		TCCR1B = 0x00 ; // Sin reloj
	}

}
int main() {
	DDRC = 0x00 ; // Entrada para los botones
	PORTC = 0x3F ; // Pull?up
	DDRB = 0xFF; // Salida para OC1A
	PCMSK1 = 0x3F ; // Mascara para los seis botones
	PCICR = 0x02 ; // Habilita la interrupcion
	// Configuracion del temporizador 1
	OCR1A = 0x00; // Valor de recarga
	TCCR1A = 0x40 ; // Respuesta automatica
	TCCR1B = 0x00 ; // Inicia sin reloj
	TCCR1C = 0x00 ; 
	sei (); // Habilitador global de interrupciones
	while (1) {// Lazo infinito , permanece ocioso a
		asm("NOP" );
	}
}
