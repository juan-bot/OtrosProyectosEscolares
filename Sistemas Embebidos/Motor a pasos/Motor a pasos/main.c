#define  F_CPU 1000000UL
#include <avr/io.h>
#include <util/delay.h>


int main(void){
	enum {E1 , E2 , E3,E4 , E5 , E6 , E7,E8} estado ;
	uint8_t c1,c0;
	DDRB=0XFF;
	DDRC=0X00;
	estado=E1;
	while(1){
		c0 = PINC & 0X01;
		c1 = PINC & 0X02;
		if(c1==0){
			switch(estado){
				case E1:
					PORTB = 0x01;
					if(c0 == 0)
						estado = E2;
					else
						estado = E8;
				break;
				case E2:
					PORTB = 0x03;
					if(c0 == 0)
						estado = E3;
					else
						estado = E1;
				break;
				case E3:
					PORTB=0x02;
					if(c0==0)
						estado=E4;
					else
						estado=E2;
				break;
				case E4:
					PORTB=0x06;
					if(c0==0)
						estado=E5;
					else
						estado=E3;
				break;
				case E5:
					PORTB=0x04;
					if(c0==0)
						estado=E6;
					else
						estado=E4;
				break;
				case E6:
					PORTB=0x0C;
					if(c0==0)
						estado=E7;
					else
						estado=E5;
				break;
				case E7:
					PORTB=0x08;
					if(c0==0)
						estado=E8;
					else
						estado=E6;
				break;
				case E8:
					PORTB=0x09;
					if(c0==0)
						estado=E1;
					else
						estado=E7;
				break;
			}	
			_delay_ms (100);
		}
	}
	return 0;
}

