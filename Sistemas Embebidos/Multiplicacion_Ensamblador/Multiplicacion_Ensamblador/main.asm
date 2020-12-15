.include<m328pdef.inc>
.def A=R19
.def B=R20
.def res=R21
LDI R17,0X00;
LDI R18,0XFF;
OUT DDRB,R17;
OUT DDRD,R18;
OUT PORTB, R18;
start:
	inc R16;
	IN A,PINB;
	MOV B,A;
	ANDI B,0X0F;
	LSR A
	LSR A
	LSR A
	LSR A
	CLR res;
 suma:
	CPI B,0;
	BREQ EXIT;
	ADD res,A;
	DEC B;
	JMP suma;
 EXIT:
	OUT PORTD,res;
    rjmp start
