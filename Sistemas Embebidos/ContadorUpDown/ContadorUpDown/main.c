#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
void delay_200();

int main(void){
	uint8_t up,down;
	int cont=0;
	DDRC=0X00;
	PORTC=0XFF;
	DDRD=0XFF;
	while (1) {
		up = PINC & 0x01;
		down = PINC & 0x02;
		if(up==0x01){
			if(cont>9){
				cont=0;
			}
			else
			cont++;
		}
		if(down==0x02){
			if(cont<0){
				cont=9;
			}
			else
			cont--;
		}
		switch(cont){
			case 0: PORTD=0x3F; break;
			case 1: PORTD=0x06; break;
			case 2: PORTD=0x5B; break;
			case 3: PORTD=0x4F; break;
			case 4: PORTD=0x66; break;
			case 5: PORTD=0x6D; break;
			case 6: PORTD=0x7D; break;
			case 7: PORTD=0x47; break;
			case 8: PORTD=0x7F; break;
			case 9: PORTD=0x67; break;
		}
		delay_200();
	}
}
void delay_200(){
	int i=0;
	for(i=0;i<15;i++)
	_delay_ms(10);
}
