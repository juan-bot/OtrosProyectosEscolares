
//********************************************************************
//
// Funciones para el manejo de la Interfaz TWI como maestro.
// Las funciones de esta biblioteca NO usan interrupciones.
//
//********************************************************************

#include  <avr/io.h>

//********************************************************************
// Configuraci�n de la Interfaz
//********************************************************************

void TWI_Config() {
	
	TWBR = 0x02;		// Frecuencia del MCU entre 20
	TWSR = 0x00;		// Factor de preescala en 1
	TWCR = 1<<TWEN;		// Habilita a la interfaz
}
//********************************************************************
// TWI_Inicio:	Genera una condici�n de inicio
// Regresa:  	0x01 - Sin problemas
//           	Edo	- No se consigui� ganar el bus
//********************************************************************

uint8_t TWI_Inicio() {
uint8_t edo;
	
	TWCR = (1<<TWINT)|(1<<TWEN)|(1<<TWSTA); // Condici�n de inicio
	while(!(TWCR & (1<<TWINT)));            // Espera la bandera TWINT
	edo = TWSR & 0xF8;                      // Obtiene el estado
											// 2 posibilidades de �xito:
	if( edo == 0x08 ||                      // 1. Condici�n de INICIO
	    edo == 0x10 )						// 2. INICIO REPETIDO
		   return 0x01;
	
	return edo;						        // Situaci�n no esperada
}



//********************************************************************
// TWI_EscByte: Escribe un dato (o una SLA + W/R) por la interfaz TWI
// Recibe:	El dato de 8 bits a enviar
// Regresa:	0x01 - Sin problemas (Env�o con reconocimiento)
//         	Edo - Si el dato no se env�o como se esperaba
//********************************************************************

uint8_t TWI_EscByte(uint8_t dato) {
uint8_t  edo;
	
	TWDR = dato;						// Carga el dato
	TWCR = (1<<TWEN)|(1<<TWINT);		// Inicia el env�o
	while(!(TWCR & (1<<TWINT)));	    // Espera la bandera TWINT
	edo = TWSR & 0xF8;					// Obtiene el estado
										// 3 posibilidades de �xito:
	if( edo == 0x18 ||					// Transmiti� una SLA + W con ACK
	    edo == 0x28 ||					// Transmiti� una SLA + R con ACK
	    edo == 0x40 )					// Transmiti� un dato con ACK
			return 0x01;

	return edo;							// Situaci�n no esperada
}

//********************************************************************
// TWI_LeeByte: Lee un dato por la interfaz TWI
// Recibe:	Referencia para ubicar el dato le�do
//			Indicaci�n de reconocimiento
// Regresa:	0x01 - Si no hubo problema
//      	Edo - Si el dato no se env�o como se esperaba
//********************************************************************

uint8_t TWI_LeeByte(uint8_t *dato, uint8_t ack){
uint8_t  edo;

	if(ack)
		TWCR |= (1<<TWEA);          // Lectura con ACK
	else
		TWCR &= (~(1<<TWEA));		// Lectura con nACK
	
	TWCR |= (1<<TWINT);				// Inicia la lectura
	while(!(TWCR & (1<<TWINT)));    // Espera la bandera TWINT
	edo = TWSR & 0xF8;              // Obtiene el estado
									// Dos posibilidades de �xito
	if( edo == 0x58 ||              // Dato le�do con ACK
	    edo == 0x50 ) {             // Dato le�do con nACK
		   *dato = TWDR;            // Ubica el dato le�do
		   return 0x01;
	}

	return edo;						// Situaci�n no esperada
}

//********************************************************************
// TWI_Paro: Genera una condici�n de paro
//********************************************************************

void TWI_Paro() {
	
   TWCR=(1<<TWINT)|(1<<TWEN)|(1<<TWSTO);  // Condicion de paro                                                  
   while(TWCR & 1<<TWSTO);                // El bit se limpia por HW
}
