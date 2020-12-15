#define DIR_ESVO 0x50
#include <avr/io.h> 
#include <avr/interrupt.h> 
#include "TWI.h"

void envia_cadena (char cad [ ] ) ;
 
uint8_t escribe_RAM( uint8_t datos [] , uint8_t n, uint8_t dir ); 
uint8_t lee_RAM( uint8_t datos [] , uint8_t n, uint8_t dir );
uint8_t estado = 0; 

// 0 ? Sin actividad , espera comando 
// 1 ? Recibe direcci ´on de lectura 
// 2 ? Recibe el total de datos , lee la RAM y env´?a datos 
// 3 ? Recibe direcci ´on de escritura 
// 4 ? Recibe cadena terminada con ’$ ’ y escribe en la RAM
uint16_t dir = 0 , total = 0; 
uint8_t datos [64] , i = 0;
ISR(USART_RX_vect) { 
	uint8_t dato ;
	dato = UDR0;
	switch( estado ) { 
		case 0: 
			i = 0; 
			if (dato == 'R' || dato == 'r' ) 
				estado = 1; 
			else if (dato == 'W' || dato == 'w' ) 
				estado = 3; 
			else 
				envia_cadena ("Comando no identificado" ); 
			PORTB=0X00;
		break ;
	 
		case 1: 
			PORTB=0X01;
			if (dato >= 0x30 && dato <= 0x39) // Car´acter numerico 
				dir = ( dir *10) + (dato - 0x30 ); 
			else { 
				if ( dir > 255) { 
					envia_cadena ("Fuera de rango"); 
					estado = 0; 
					dir = 0; 
				} 
				else 
					estado = 2; // Direccion lista 
			}
		break ; 
		case 2: 
			PORTB=0X02;
			if (dato >= 0x30 && dato <= 0x39) 
				total = ( total *10) + (dato -0x30 ); // Caracter numerico 
			else { 
				if ( dir + total > 255) 
					envia_cadena ("Fuera de rango" ); 
				else { 
					if (! lee_RAM( datos , total , dir )) // Lectura por TWI 
						envia_cadena ("Error 1" ); 
					else { 
						datos [total] = 0; // Fin de cadena 
						envia_cadena(datos); 
					} 
					estado = 2; 
			
				} 
				dir = total = 0;
				estado = 0; 
			} 
		break ; 
		case 3: 
			PORTB=0X03;
			if (dato >= 0x30 && dato <= 0x39) 
				dir = ( dir * 10) + (dato - 0x30 ); // Caracter numerico 
			else { 
				if ( dir > 255) { 
					envia_cadena ("Fuera de rango" ); 
					estado = 0; 		
				} 
				else 
					estado = 4; // Direcci´on lista 
			} 
		break ; 
	
		case 4: 
			PORTB=0X04;
			if ( dato != '$') { // No es fin de cadena 
				datos [ i ] = dato ;
				i++;
			} 
			else { 
				if (! escribe_RAM( datos , i , dir )) // Escritura por TWI 
				envia_cadena ("Error 2"); 
				estado = 0; 
				dir = 0; 
			} 
		break ; 
	
		default : 
			estado = 0; 
			PORTB=0x00;
			envia_cadena ("Estado inesperado" ); 
	}
}
int main() {
	DDRD = 0x02 ; // RXD es entrada y TXD es salida 
	DDRB = 0x08 ;
	TWI_Config ();
		// Configuraci´on de la USART 
	UBRR0 = 0X0C; // 9600 bps 
	UCSR0A = 0X02; // As´? ncrono a doble velocidad 
	UCSR0B = 0X98; // Interrupci´on por recepci´on 
	UCSR0C = 0X06; // Datos de 8 bits
	sei ();
	while (1) 
		asm("NOP" );
}
void envia_cadena (char cad [] ) { 
	uint8_t j = 0;
	while(cad [j] != '\0' ) { 
		while (!(UCSR0A & 1 << UDRE0)); // Asegura buffer vac?o 
		UDR0 = cad [j] ; j++; 
	} 
	while (!(UCSR0A & 1 << UDRE0)); // Asegura buffer vac?o 
		UDR0 = 0x0D;
}
uint8_t lee_RAM( uint8_t datos [] , uint8_t n, uint8_t dir ) { 
	uint8_t i , edo ;
	edo = TWI_Inicio (); // Condici´on de inicio 
	if (edo != 0x01) { // Si no se consigue 
		TWCR |= (1<<TWINT); // Limpia la bandera 
		return 0x00 ; 
	} 
	edo = TWI_EscByte(DIR_ESVO << 1); // Transmite la SLA+W 
	if (edo != 0x01) { // Ocurre algo inesperado 
		TWI_Paro (); // Libera al bus 
		return 0x00 ; 
	} 
	edo = TWI_EscByte( dir ); // Transmite la direcci ´on 
	if (edo != 0x01) { // Ocurre algo inesperado 
		TWI_Paro (); // Termina las transferencias 
		return 0x00 ; 
	} 
	edo = TWI_Inicio (); // Inicio repetido 
	if (edo != 0x01) { // Si no se consigue 
		TWCR |= (1<<TWINT); // Limpia la bandera 
		return 0x00 ; 
	} 
	edo = TWI_EscByte((DIR_ESVO << 1)+1); // Transmite la SLA+R 
	if (edo != 0x01) { // Ocurre algo inesperado 
		TWI_Paro (); // Libera al bus return 
		0x00 ; 
	} 
	for ( i = 0; i < n - 1; i++ ) { // Recibe n ? 1 datos 
		edo = TWI_LeeByte(&datos [ i ] , 1); // Lee con reconocimiento 
		if (edo != 0x01) { // Ocurre algo inesperado 
			TWI_Paro (); // Termina las transferencias 
			return 0x00 ; 
		} 
	} 
	TWI_LeeByte(&datos [ i ] , 0); // Lee sin reconocimiento 
	TWI_Paro ();
	return 0x01 ; // Regresa con ´e xito
}
uint8_t escribe_RAM( uint8_t datos [] , uint8_t n, uint8_t dir ) { 
	uint8_t i , edo ;
	edo = TWI_Inicio (); // Condici´on de inicio 
	if (edo != 0x01) { // Si no se consigue 
		TWCR |= (1<<TWINT); // Limpia la bandera 
		return 0x00 ; 
	} 
	edo = TWI_EscByte(DIR_ESVO << 1); // Transmite la SLA+W 
	if (edo != 0x01) { // Ocurre algo inesperado 
		TWI_Paro (); // Libera al bus 
		return 0x00 ; 
	} 
	edo = TWI_EscByte( dir ); // Transmite la direcci ´on 
	if (edo != 0x01) { // Ocurre algo inesperado 
		TWI_Paro (); // Termina las transferencias 
		return 0x00 ; 
	} 
	for ( i = 0; i < n; i++ ) { // Transmite los datos 
		edo = TWI_EscByte( datos [ i ] ) ; 
		if (edo != 0x01) { // Ocurre algo inesperado 
			TWI_Paro (); // Termina las transferencias 
			return 0x00 ; 
		} 
	} 
	TWI_Paro ();
	return 0x01 ; // Regresa con ´e xito
}