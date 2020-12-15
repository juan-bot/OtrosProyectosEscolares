
#define F_CPU 16000000UL
#include <avr/io.h>
#include <util/delay.h>

void delay_200();

int main(void)
{
	DDRC=0XFF;//configura el puerto como salida
    while (1) 
    {
		PORTC=0X00;
		delay_200();
		PORTC=0X01;
		delay_200();
		PORTC=0X02;
		delay_200();
		PORTC=0X04;
		delay_200();
		PORTC=0X08;
		delay_200();
		PORTC=0X10;
		delay_200();
		PORTC=0X20;
		delay_200();
		PORTC=0X20;
		delay_200();
		PORTC=0X10;
		delay_200();
		PORTC=0X08;
		delay_200();
		PORTC=0X04;
		delay_200();
		PORTC=0X02;
		delay_200();
		PORTC=0X01;
		delay_200();
		PORTC=0X00;
		delay_200();
    }
}
void delay_200(){
	int i=0;
	for(i=0;i<20;i++)
		_delay_ms(10);
}

