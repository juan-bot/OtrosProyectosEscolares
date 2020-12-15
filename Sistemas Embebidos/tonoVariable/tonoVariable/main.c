#include <avr/io.h>
#include <avr/interrupt.h>
uint8_t tono=0;
ISR(INT0_vect){
	if(!(PIND &0X04)){
		TCCR1B=0X09;
		TCCR2B=0X04;
	}
	else{
		PORTB=0X00;
		TCCR1B=0X00;
		TCCR2B=0X00;
		TCNT1=0;
		TCNT2=0;
	}
}
ISR(TIMER2_OVF_vect){
	if(tono==0){
		TCNT1=0;
		OCR1A=567;
		tono=1;
	}
	else{
		OCR1A=1135;
		tono=0;
	}
}
int main(void){
    DDRB = 0x02 ; // Salida para OC1A 
	DDRD = 0x00 ; // Entrada para el boto´n 
	PORTD = 0xFF;
    // Configuracio´n de la interrupcio´n externa 0 
	EICRA = 0x01 ; // Cualquier cambio en PD2 
	EIMSK = 0x01 ;
    // Configuracio´n del temporizador 1 
	OCR1A = 1135; // Iniciar ´a con 440 Hz 
	TCCR1A = 0x40 ; // Respuesta autom´a tica 
	TCCR1B = 0x00 ; // Inicia sin reloj 
	TCCR1C = 0x00 ;
    // Configuracio´n del temporizador 2 
	ASSR = 0x20 ; // Cristal externo de 32.768 KHz 
	TCCR2A = 0x00 ; TCCR2B = 0x00 ; // Inicia sin reloj 
	TIMSK2 = 0x01 ; // Interrupci´on por desbordamiento
    sei ();
    while (1) {
		asm("NOP" );
    }
}

