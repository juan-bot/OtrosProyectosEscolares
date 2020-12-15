#include <avr/io.h>
#include <avr/interrupt.h>
uint16_t A = 0 , B = 0 , Res,operacion;//declaracion de variables globales
uint8_t bandera = 0;
void envia_numero ( uint16_t num);	//prototipo de funcion
void envia_cadena (char cad [ ] ) ;	//prototipo de funcion
ISR(USART_RX_vect){
	uint8_t dato;
	dato = UDR0; //recibo el dato transferido en una variable
	if (bandera == 0) { // condicion para leer el primer numero
		if (dato >= 0x30 && dato <= 0x39) //encontro un numero
			A = (A*10) + (dato-0x30 );	//transforma los caracteres a un numero
		else
			bandera = 1; //asegura que no leea el primer numero si no lo introdujo
	}
	else {	// condicion para leer el segundo numero
		if (dato >= 0x30 && dato <= 0x39)//encontro un numero
		B = (B*10) + (dato-0x30 );
		else { // condicion para leer el operador
			if ((dato == 0x2A || dato == 0x2B || dato == 0x2D) && bandera==1){
				operacion=dato;//guarda el codigo del operador
				bandera=2; //asegura que ya no lea otro operador despues de encontrar uno 
			}
			else if(bandera==2){//si ya se tiene la operacion a hacer
				envia_numero (A);//envia el primer operando para transformarlo
				if(operacion==0x2A){//si la operacion es multiplicacion
					envia_cadena (" * ");//envia el caracter * para transformarlo
					Res = A * B; //calcula el resultado de la operacion
				}
				if(operacion==0x2B){//si la operacion es suma
					envia_cadena (" + ");//envia el caracter + para transformarlo
					Res = A + B;//calcula el resultado de la operacion
				}
				if(operacion==0x2D){//si la operacion es resta
					envia_cadena (" - ");//envia el caracter - para transformarlo
					Res = A - B;//calcula el resultado de la operacion
				}
				envia_numero (B);//envia el segundo operando para transformarlo
				envia_cadena (" = ");//envia = para transformarlo
				envia_numero (Res);//imprime el resultado de la operacion
				while (!(UCSR0A & 1<<UDRE0));// Asegura buffer vacio
				UDR0 = '\n' ;				 // Nueva linea
				while (!(UCSR0A & 1<<UDRE0));// Asegura buffer vacio
				UDR0 = '\r' ;				 // Comienzo de linea
				A =B=bandera=operacion=0;	 //setea todas las variables ya que mando el resultado
			}
		}
	}
}
int main(void){
	DDRD = 0x02 ; // RXD es entrada y TXD es salida
	UBRR0 = 103; // Para 9600 bps con el MCU
	// trabajando a 16 MHz
	UCSR0A = 0x00 ; // Asincrono normal
	UCSR0B = 0x98 ; // Habilita transmisor y receptor
	UCSR0C = 0x06 ; // Datos de 8 bits , sin paridad y 1 bit de paro
	sei (); // Habilitador global de interrupciones
	while (1)
	asm("NOP");
}


void envia_numero ( uint16_t num) {//funcion para tratar y enviar numeros
	uint8_t aux ;
	if (num >= 10)
	envia_numero (num/10); // Llamada recursiva
	aux = num % 10;
	while (!(UCSR0A & 1 << UDRE0)); // Asegura buffer vacio
	UDR0 = aux + 0x030 ;//envia el numero correcto
}
void envia_cadena (char cad [ ] ) {//funcion para tratar y enviar caracteres
	uint8_t i=0;
	while(cad[i]!='\0') {//recorre la cadena hasta encontrar el caracter de fin
		while (!(UCSR0A & 1 << UDRE0)); // Asegura buffer vacío
		UDR0 = cad [i] ; // Envia un caracter a la vez
		i++;			//incrementa el indice para evaluar el sig caracter
	}
}