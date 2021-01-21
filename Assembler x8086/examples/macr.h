calcular_puntaje macro dato,punt,au
  push si
  push bx
  push ax
  push di
  CLC
  mov punt[2],1
  LEA SI, au+2
  LEA DI, punt+2
  LEA BX, dato+15
  MOV CX,03
  SALTA:
    MOV AH,00
    MOV AL,[SI]
    ADC AL,[bx]
    AAA
    MOV [BX], AL
    DEC SI
    DEC DI
    DEC BX
  LOOP SALTA
    MOV [BX],AH
    LEA BX,dato+15
    MOV CX,04
  SALTAR:
    OR BYTE PTR [BX],30h
    DEC BX
  LOOP SALTAR
  pop di
  pop ax
  pop bx
  pop si
endm

IMPRIME MACRO CADENA
  LEA DX, CADENA ; Donde CADENA es el parametro del MACRO.
  MOV AH,09 ; Función DOS para escribir texto en pantalla
  INT 21H ; Llamar a la interrupción del DOS
ENDM
leer_cadena macro c
  push dx
  push ax
  MOV AH,0ah
  lea dx,c
  INT 21H
  pop ax
  pop dx
endm
LEER_CARACTER macro
  mov ah,01
  int 21h
 ENDm
 print_caracter macro d
   push ax
   push dx
   mov ah,02
   mov dl,d[si]
   int 21h
   pop dx
   pop ax
 endm
 salir macro
   mov ax,4c00h
   int 21h
 endm
