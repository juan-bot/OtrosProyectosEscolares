	.model tiny
	.8086

	.data
	
	.code
	org 100h
	.startup
	
	; 440Hz sound
	mov al, 86h
	out 43h, al
	mov ax, (1193180 / 440)
	out 42h, al
	mov al, ah
	out 42h, al 
	in al, 61h
	or al, 00000011b
	out 61h, al

	; Wait 1 second
	xor ax, ax
	mov es, ax
	mov di, 046Ch
	mov ax, es:[di]
	add ax, 18
	.repeat
	.until ax == es:[di]

	; Turn off speaker
	in al, 61h
	and al, 11111100b
	out 61h, al

	.exit
end


El resultado, es un archivo .COM, casi 5 veces mayor que el anterior. Sigue siendo diminuto con sus 47 bytes, de código 100% ensamblador de 16 bits para procesadores 8088 o superiores.
XXXXXXXXXXXXXX