	include macro.txt
  ;PROGRAMA imprime lineas aleatorias
  include macv.h
  .MODEL small
  .STACK  100
  .DATA
  temp1 dw ?
	temp2 dw ?
	temp3 dw ?
  relleno db ?
    MODEACT DB ?
    MODE DB ?
    COLOR db ?
    COL DW ?
    REN DW ?
    cont dw 0
    y db ?
    x db ?
    xx dw ?
    yy dw ?
    r db ?
    rr dw ?
    maxim dw ?
    xi dw ?
    yi dw ?
  .CODE
  PRINCI PROC FAR
     ;PROTOCOLO
     push ds
     sub ax,ax
     push ax
     MOV AX,@DATA
     MOV DS,AX
     ACTUAL
    MOV MODEACT,AL
    mov MODE, 13h
    MODOVIDEO
    MOV COLOR, 04H
    MOV COL, 10
    MOV REN, 200
    mov cx,dx
    mov r,29
    mov x,29
    call circulo
    mov ah, 0
    int 16h
    MOV AL, MODEACT
    mov MODE, AL
    MODOVIDEO
    ret
  PRINCI ENDP

  	circulo proc
  		push ax
  		push dx
  		push bx
  		push cx
  		mov y,0
  		while1:
  			cmp x,00
  			je fint
  			mov ah,r
  			cmp y,ah ;y<=r
  			jg fint
  			while2:
  			    pot x,xx
  			    pot y,yy
  			    pot r,rr ;MACRO DE LA POTENCIA
  				mov ax,xx
  				add ax,yy
  				;mov resta,ax
  				inc rr
  				sub ax ,rr
  				cmp ax,1
  				jle incy
  				mov ax,xx
  				add ax,yy
  				inc ax
  				dec rr
  				sub ax,rr
  				cmp ax,1
  				jle incy
  				dec x
  				jmp while2
  		        fint:jmp fin
  			 incy:
  			    dibuja
  			   inc y
  			   jmp while1
  		fin:
  			pop cx
  			pop bx
  			pop dx
  			pop ax
  		ret
  	circulo endp



  END PRINCI
