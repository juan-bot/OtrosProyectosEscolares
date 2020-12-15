#define F_CPU 1000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <string.h>//biblioteca para la funcion atoi y memset
#include <stdio.h>
#include "LCD.h"
void  imprime_LCD(uint16_t,int,char[20]);
uint16_t teclado();
char validaTecla(uint8_t);
void Operacion(uint16_t ,uint16_t ,uint8_t ,char[20]);
int main(void){
	uint8_t tecla,operacion=0;
	uint16_t n1=0,n2=0; //se almacenaran
	char num1[20],num2[7];//se almacenara la secuencia de la operacion para imprimirla y los operandos en cadenas
	int conta=0,conta2=0,bandera=0;
	DDRB = 0x0F;			// Puerto B como entrada/salida (Teclado)
	PORTB = 0xF0;			// Pull - Up en las entradas
	DDRC = 0xFF;	// Salida para el LCD
	DDRD = 0x00;    // Entrada para los botones
	PORTD = 0xFF;	// Pull-up
	LCD_reset();	// Inicializa al LCD
	while (1){//lazo infinito
		tecla = teclado();//obtiene el numero correspondiente a la tecla presionada 
		if( tecla != 0xFF ){
			if(tecla==15){//si se ha presionado la tecla de reset, se setean las variables a un estado
				bandera=0;
				n1=0;
				n2=0;
				conta=0;
				conta2=0;
				memset(num1, 0, 20);// vacia las cadenas 
				memset(num2, 0, 7);
				LCD_clear();		//limpiamos la pantalla
			}
			else if(bandera==0){			//inicia el estado para obtener el primer valor de la tecla presionada
				if((tecla>=1 && tecla<=3) || (tecla>=5 && tecla<=7) || (tecla>=9 && tecla<=11) || tecla==14){//recibe el primer valor
					if(n1<65535){			//si el valor cabe en 16 bits
						num1[conta]= validaTecla(tecla);	//asignamos el valor de la tecla como caracter en el arreglo
						n1 = atoi(num1);					//convierte la cadena a entero y la almacena en n1 para su manejo
						LCD_cursor(0x01);					//posiciona el cursor al inicio del display
						LCD_write_cad(num1, 20);			//imprime en el display los numeros que se estan ingresando
						_delay_ms(200);						//retraso de 200 ms
						conta++;							//incrementamos la posicion para almacenar el siguiente caracter
					}
					
				}
				else{
					bandera=1;	//si ya termino de ingresar el operando 1 se pasa al siguiente estado 
				}
			}
			else {
				if((tecla==0 ||tecla==4 ||tecla==8 ||tecla==12) && bandera==1){	//recibe el operador a realizar
					operacion=tecla;					//almacena la operacion que se desea hacer
					num1[conta]= validaTecla(tecla);	//asignamos el valor de la tecla como caracter en el arreglo
					bandera=2;							//garantiza que ya no pueda recibir otro operadory pase al siguiente estado 
					LCD_cursor(0x01);					//posiciona el cursor al inicio del display
					LCD_write_cad(num1, 20);			//imprime en el display la secuencia de operacion que se estan ingresando
					_delay_ms(200);						//retraso de 200 ms
					
				}
				else if(bandera==2){
					if((tecla>=1 && tecla<=3) || (tecla>=5 && tecla<=7) || (tecla>=9 && tecla<=11) || tecla==14){
						if(n1<65535){					//si el valor cabe en 16 bits
							conta++;					//incrementamos la posicion para almacenar el siguiente caracter
							num1[conta]= validaTecla(tecla);//asignamos el valor de la tecla como caracter en el arreglo
							num2[conta2]=num1[conta];	//almacena en el segundo valor en el arreglo
							n2 = atoi(num2);			//convierte la cadena a entero y la almacena en n1 para su manejo
							conta2++;					//contador auxiliar para almacenar en num2 en el arreglo
							LCD_cursor(0x01);			//posiciona el cursor al inicio del display
							LCD_write_cad(num1, 20);	//imprime en el display la secuencia de operacion que se estan ingresando
							_delay_ms(200);				//retraso de 200 ms
						}
					}
					else{
						bandera=3;		//si ya termino de ingresar el segundo numero 
						conta++;		//incrementa el contador para almacenar el signo = si se presiona para mostrarlo en pantalla
					}
				}
				else if(bandera==3)		//estado para recibir el signo =
				if(tecla==13){			//si se presiono el signo = se procede a realizar la operacion y mostrarla en pantalla
					num1[conta]= validaTecla(tecla);//asignamos el valor de la tecla como caracter en el arreglo
					LCD_cursor(0x01);				//posiciona el cursor al inicio del display
					LCD_write_cad(num1, 20);		//imprime en el display la secuencia de operacion que se estan ingresando
					_delay_ms(200);					//retraso de 200 ms
					Operacion(n1,n2,operacion,num1);//manda las variables a la funcion que procesara los datos para la operacion
					bandera=4;						//estado oscioso en donde ignorara las teclas presionadas
				}
			}
		}
		
	}
}

void Operacion(uint16_t n1,uint16_t n2,uint8_t operacion,char op[20]){ //funcion que se encarga de realizar la operacion requerida
	uint16_t res=0,ban=0;
	switch(operacion){	//valida la operacion de acuerdo a el valor de la tecla
		case 0:	//si es una division
			res=n1/n2;
		break;
		case 4:	//si es una multiplicacion
			res=n1*n2;
		break;
		case 8:	//si es una resta
		if(n1>=n2) 
			res=n1-n2;
		else{	//si el resultado es negativo
			res=n2-n1;
			ban=1; //activa bandera de resultado negativo
		}
		break;
		case 12:	//si es una suma
			res=n1+n2;
		break;
	}
	imprime_LCD(res,ban,op);
}
void imprime_LCD(uint16_t n,int band, char num1[20]) {
	uint8_t  u,d, c,um,dm;
	
	
	
	LCD_cursor(0x01);			//posiciona el cursor al inicio del display
	LCD_write_cad(num1, 20);	//imprime en el display la secuencia de operacion que se estan ingresando
	LCD_cursor(0x16);			//posiciona el cursor en el segundo renglon
	if(band==1)					//si el resultado es negativo imprime el signo
		LCD_write_cad("-",1);
	
	//se valida el numero de digitos para imprimir los exactamente y en orden
	// separa los digitos en variables 
	if(n<10){
		u = n ;
		LCD_write_data(u + 0x30);
	}
	else if(n>=10 && n<100){
		u = n % 10;
		d = (n/10)%10;
		LCD_write_data(d + 0x30);
		LCD_write_data(u + 0x30);
	}
	else if(n>=100 && n<1000){
		u = n % 10;
		d = (n/10)%10;
		c = n/100;
		LCD_write_data(c + 0x30);
		LCD_write_data(d + 0x30);
		LCD_write_data(u + 0x30);
	}
	else if(n>=1000 && n<10000){
		u = n % 10;
		d = (n/10)%10;
		c = (n/100)%10;
		um = (n/1000)%10;
		LCD_write_data(um + 0x30);
		LCD_write_data(c + 0x30);
		LCD_write_data(d + 0x30);
		LCD_write_data(u + 0x30);
	}
	else if(n>=10000 && n<65536){
		u = n % 10;
		d = (n/10)%10;
		c = (n/100)%10;
		um = (n/1000)%10;
		dm = n/10000;
		LCD_write_data(dm + 0x30);
		LCD_write_data(um + 0x30);
		LCD_write_data(c + 0x30);
		LCD_write_data(d + 0x30);
		LCD_write_data(u + 0x30);
	}
}
uint16_t teclado() { //funcion que se encarga de calcular el valor numerico de la posicion del teclado
	uint16_t   sal[4] = { 0xFE, 0xFD, 0xFB, 0xF7 };
	uint16_t   i, ren, ent;
	for( i = 0, ren = 0; i < 4; i++, ren += 4 ) {
		PORTB = sal[i];
		asm("nop");
		ent = PINB & 0xF0;
		if( ent != 0xF0 ) {
			switch( ent ) {
				case	0xE0:	return  ren;
				case	0xD0:	return  ren + 1;
				case	0xB0:	return  ren + 2;
				case	0x70:	return  ren + 3;
			}
		}
	}

	return   0xFF;
}
char validaTecla(uint8_t tecla){//valor que se encarga de regresar el caracter correspondiente al el valor de la tecla
	char c;
	switch(tecla){
		case 0:
			c= '/';
		break;
		
		case 1:
			c= '9';
		break;
		
		case 2:
			c= '8';
		break;
		
		case 3:
			c= '7';
		break;
		
		case 4:
			c= 'x';
		break;
		
		case 5:
			c= '6';
		break;
		
		case 6:
			c= '5';
		break;
		
		case 7:
			c= '4';
		break;
		
		case 8:
			c= '-';
		break;
		
		case 9:
			c= '3';
		break;
		
		case 10:
			c= '2';
		break;
		
		case 11:
			c= '1';
		break;
		case 12:
			c= '+';
		break;
		
		case 13:
			c= '=';
		break;
		
		case 14:
			c= '0';
		break;
	}
	return c;
}