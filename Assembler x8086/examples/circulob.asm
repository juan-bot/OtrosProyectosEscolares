include macv.h
.model small
.stack 100h
.data

ybeg dw 180
xbeg dw 180
xend dw 180
y dw 90h
x dw 90h
x1 dw ?        ;posiccion
y1 dw ?
xc dw ?         ;tamaño
yc dw ?         ;tamaño
rad dw 90
pc dw 0
vaux1 dw 1
vincx dw 0
vincy dw 0
vaux2 dw 0
LIM DW ?
CONTR DW 0
REL DW ?
NUMCIR DW ?
COLOR db ?
N DW ?
;bandera dw 0

  .code

          mov ah,0 ;peticion para designar el modo
          mov al,12h ;modo grafico 320x200 256c
          int 10h

          push ds
          mov ax,@data
          mov ds,ax

          MOV LIM,25
          CALL Numero
          MOV N,DX

IMP:      CMP N,00
          JLE SALIR
          CALL GENERAR_VARIABLESCIR
          CMP REL,01
          JE RELLENO
          DEC N
          call circulo
          JMP IMP
relleno: CMP XC,00
          JE IMP
          MOV DX,XC
          DEC DX
          DEC YC
          DEC N
          CALL CIRCULO
          JMP RELLENO


salir:    mov ah,0 ;espera que se pulse una tecla
          int 16h
          pop ds
          mov ah,0 ;regresa al modo 80x25
          mov al,2
          int 10h
          mov ah,4ch ;regresa al so
          int 21h

          circulo proc near
          mov ax,@data
          mov ds,ax
          mov ax,xc
          xor ax,ax
          mov xc,ax
          mov ax,1
          sbb rad,ax ;pc=rad-1
          mov ax,rad
          mov pc,ax
          jmp short a226
a58:      mov bx,pc
          or bx,bx
          jl short a114 ;if pc>0
          inc xc ;xc++
          mov ax,xc
          jmp short a142
a114:     inc xc
          dec yc
          mov ax,xc
          sub ax,yc
a142:     shl ax,1 ;2*xc+1
          inc ax
          sub pc,ax
          call pxp
a226:     mov ax,xc
          cmp ax,yc ;while(xc<yc)
          jl short a58
          ret

          pxp proc near
          mov ax,x1 ;mov cx,x
          add ax,xc ;mov dx,y
          mov cx,ax
          mov ax,y1
          add ax,yc
          mov dx,ax
          call pixel
          mov ax,x1 ;mov cx,x
          sub ax,xc ;mov dx,y
          mov cx,ax
          mov ax,y1
          add ax,yc
          mov dx,ax
          call pixel
          mov ax,x1 ;mov cx,x
          add ax,xc ;mov dx,y
          mov cx,ax
          mov ax,y1
          sub ax,yc
          mov dx,ax
          call pixel
          mov ax,x1 ;mov cx,x
          sub ax,xc ;mov dx,y
          mov cx,ax
          mov ax,y1
          sub ax,yc
          mov dx,ax
          call pixel
          mov ax,x1 ;mov cx,x
          add ax,yc ;mov dx,y
          mov cx,ax
          mov ax,y1
          add ax,xc
          mov dx,ax
          call pixel
          mov ax,x1 ;mov cx,x
          sub ax,yc ;mov dx,y
          mov cx,ax
          mov ax,y1
          add ax,xc
          mov dx,ax
          call pixel
          mov ax,x1 ;mov cx,x
          add ax,yc ;mov dx,y
          mov cx,ax
          mov ax,y1
          sub ax,xc
          mov dx,ax
          call pixel
          mov ax,x1 ;mov cx,x
          sub ax,yc ;mov dx,y
          mov cx,ax
          mov ax,y1
          sub ax,xc
          mov dx,ax
          call pixel
          ret
    pxp endp
circulo endp


pixel proc near
      mov ah,12
      mov al,COLOR
      mov bh,0 ;Pagina
      int 10h
      ret
pixel endp

Numeroc PROC
  SEMILLA
  ALEATORIO
  CALL ESCALANDOC
  ret
numeroc ENDP

ESCALANDOC PROC
  MOV DX,0
  MOV BX,LIM                ;x
  mov bh,0
  DIV BX
  RET
 ESCALANDOC ENDP

 GENERAR_VARIABLESCIR PROC
 PUSH DX
  mov LIM,15
  call numero
  MOV COLOR, dl
  MOV LIM,460
  CALL NUMERO
  MOV x1, DX          ;posicion
  add x1,180
  MOV LIM,300
  CALL NUMERO
  MOV y1, DX
  add y1,180
  MOV LIM,100
  CALL NUMERO
  mov xc,DX           ;tamaño
  mov yc,DX           ;tamaño
  MOV LIM,02
  CALL Numero
  MOV REL,DX
  MOV LIM,15
  CALL Numero
  MOV N,DX
  POP DX
ret
GENERAR_VARIABLESCIR ENDP

end
