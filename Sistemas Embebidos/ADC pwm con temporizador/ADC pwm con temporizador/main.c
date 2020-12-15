#include <avr/io.h>
int main() {
	float aux ;
	DDRB = 0xFF; // Salida en OC1A (PB1)
	ADMUX = 0x00 ; // Selecciona ADC0 y Vref en AREF
	ADCSRA = 0xC3; // inicia conversion y divide/8
	DIDR0 = 0x01; // Anula el buffer digital en ADC0
	TCCR1A = 0x83 ; // PWM modo 7 , modo no invertido
	TCCR1B = 0x09 ;// PWM modo 7
	while(1){
		while( !(ADCSRA & 1 << ADIF ) ); 
		ADCSRA |= 1 << ADIF;  // Limpia la bandera ADIF 
		aux = ADCW; // Calcula el ciclo de trabajo
		OCR1A = aux ; //muestra el resultado en PB1
		ADCSRA |= 1 << ADSC; // Inicia una nueva conversion
	}
}