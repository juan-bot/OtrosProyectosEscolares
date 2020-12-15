.include <m328pdef.inc>
.def A=R20
LDI R17,0x00;
LDI R18,0xFF;
OUT DDRC,R17;
OUT DDRB,R18;
start:
    inc r16
	IN A,PINC;
	ANDI A,0X07;
	CPI A,0;
	BREQ S0;
	CPI A,1;
	BREQ S1;
	CPI A,2;
	BREQ S2;
	CPI A,3;
	BREQ S3;
	CPI A,4;
	BREQ S4;
	CPI A,5;
	BREQ S5;
	CPI A,6;
	BREQ S6;
	CPI A,7;
	BREQ S7;

	S0:
	LDI R19,0XFE
	OUT PORTB,R19;
	JMP start
	S1:
	LDI R19,0XFD
	OUT PORTB,R19;
	JMP start
	S2:
	LDI R19,0XFB
	OUT PORTB,R19;
	JMP start
	S3:
	LDI R19,0XF7
	OUT PORTB,R19;
	JMP start
	S4:
	LDI R19,0XEF
	OUT PORTB,R19;
	JMP start
	S5:
	LDI R19,0XDF
	OUT PORTB,R19;
	JMP start
	S6:
	LDI R19,0XBF
	OUT PORTB,R19;
	JMP start
	S7:
	LDI R19,0X7F
	OUT PORTB,R19;
	JMP start
