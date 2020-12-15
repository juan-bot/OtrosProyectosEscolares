
#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>

int main(void){
	uint8_t a,b;
	DDRC=0X00;//configura el puerto como entrada
	DDRD=0X00;//configura el puerto como entrada
	DDRB=0XFF;//configura el puerto como salida
	PORTB=0X00;//configura el puerto como entrada
	while (1){
		a=PINC & 0x0F;//enmascara los bits que necesitamos
		b=PIND & 0x0F;//enmascara los bits que necesitamos
		if(a>b){
			PORTB=0X01;
		}
		else if(a==b){
			PORTB=0X02;
		}	
		else{
			PORTB=0X04;	
		}
			
	}
}


