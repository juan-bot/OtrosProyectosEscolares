
formatea macro arr
  mov arr[1],32
  mov arr[2],32
  mov arr[3],32
  mov arr[4],32
  mov arr[5],32
  mov arr[6],32
  mov arr[7],32
  mov arr[8],32
  mov arr[9],32
  mov arr[10],32
  mov arr[11],32
  mov arr[12],32
  mov arr[13],32
  mov arr[14],32
  mov arr[15],32
endm
calcular_puntaje macro dato,punt,au
  push si
  push bx
  push ax
  push di
  CLC
  mov dato[12],0
  mov dato[13],0
  mov dato[14],0
  mov dato[15],0
  mov punt[2],1
  LEA SI, au+2
  LEA DI, punt+2
  LEA BX, dato+15
  MOV CX,03
  SALTA:
    MOV AH,00
    MOV AL,[SI]
    ADC AL,[DI]
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

salir macro
  mov ax,4c00h
  int 21h
endm

IMPRIME MACRO CADENA
  LEA DX, CADENA ; Donde CADENA es el parametro del MACRO.
  MOV AH,09 ; FunciÃ³n DOS para escribir texto en pantalla
  INT 21H ; Llamar a la interrupciÃ³n del DOS
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
 nombre_usuario macro dat
      push si
      mov si,0
      usuario:
          LEER_CARACTER
          CMP al,46
          je e
          mov dat[si],al
          inc si
      jmp usuario
      e:
      pop si
  endm
