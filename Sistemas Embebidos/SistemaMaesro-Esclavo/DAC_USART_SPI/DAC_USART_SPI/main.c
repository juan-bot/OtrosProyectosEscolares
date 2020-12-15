/////////////////////////////////el bueno//////////////////////
#define F_CPU 1000000UL
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

uint16_t  A=0,aux2=0; //declaracion de variables globales
uint8_t bandera = 0;

ISR(USART_RX_vect){
	
	uint16_t dato;
	dato = UDR0; //recibo el dato transferido en una variable
	
	if (dato >= 0x30 && dato <= 0x39) //encontro un numero
	A = (A*10) + (dato-0x30 );	//transforma los caracteres a un numero

	if(dato==0X0D){
		aux2=A;
		A=0;
		bandera=0;
	}
}
int main(){
	
	uint16_t aux=0;
	uint8_t high , low , extra ;
	
	DDRD = 0x00 ; // Entrada para el interruptor
	
	DDRB = 0x2C; // MOSI, SCK y SS como salidas
	PORTB = 0x04 ; // SS en alto , esclavo deshabilitado
	
	SPCR = 0x50 ; // Habilita la interfaz SPI como Maestro
	SPSR = 0x01 ; // Ajustando para 500 KHz
	
	UBRR0 = 103; // Para 9600 bps con el MCU
	UCSR0A = 0x00 ; // Asincrono normal
	UCSR0B = 0x98 ; // Habilita receptor
	UCSR0C = 0x06 ; // Datos de 8 bits , sin paridad y 1 bit de paro
	
	sei (); // Habilitador global de interrupciones
	
	while (1) {
		
		if(aux2<=8192){
			aux=aux2;
			low = aux ;
			high = aux >> 8;
			high |= 0x10 ; // DAC encendido
			
			if (aux > 4095)
			high |= 0x20 ; // Bit de ganancia en alto
			
			PORTB &= 0xFB; // Habilita al esclavo
			SPDR = high ; // Envia el byte alto
			while (!(SPSR & 1 << SPIF )); // Espera fin de envio
			extra = SPDR; // Para limpiar la bandera SPIF
			SPDR = low ; // Envia el byte bajo
			while (!(SPSR & 1 << SPIF )); // Espera fin de envio
			extra = SPDR; // Para limpiar la bandera SPIF
			PORTB |= 0x04 ; // Deshabilita al esclavo
		}
		
	}
}
