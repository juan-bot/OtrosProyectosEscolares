; Programa que COMPARA CADENAS,DE DOS EN DOS, USO DE CMPSB Y CMPSW
include macv.h
.model small
.stack 100h
.data
  SALTO DB 13,10,'$'
  espacio db ' $'
  men1 db 'Ingresa la primer palabra$'
  men2 db 'Ingresa la segunda palabra$'
  men3 db 'Ingresa la tercer palabra$'
  men4 db '    GANASTE !!!! $'
  men5 db 'ADIVINA LA PALABRA$'
  men6 db '   PERDISTE !!!! $'
  cad1 db 30 dup(0), '$'
  cadAux db 30 dup(0), '$'
  cad2 db 30 dup(0), '$'
  cad3 db 30 dup(0), '$'
  aux db 30 dup(0), '$'
  contCAD1 db 0
  contCAD2 db 0
  contCAD3 db 0
  cont db 0
  cont2 db 0
  tam db 0
  tam2 db 0
  error db 0
  MODEACT DB ?
  MODE DB ?
.code
inicio proc far
;PROTOCOLO
  PUSH DS
  SUB AX,AX
  PUSH AX
  MOV AX,@data
  MOV DS,AX ; DS=ES
  MOV ES,AX
  ACTUAL
  MOV MODEACT,AL
  mov MODE, 12h
  MODOVIDEO
  LIMPIA_PANTALLA
  MOV DH,0
  POSICIONA_CURSOR
  call INGRESA_CADENAS
  LIMPIA_PANTALLA
  POSICIONA_CURSOR 0
  IMPRIME men5
  inicializa_cad aux
  Numero_aleatorio 3
  cmp dx,1
  je c1
  cmp dx,2
  je c2
  call cadena3
  c1: call cadena1
  c2: call cadena2
INICIO endp

cadena1 PROC
  IMPRIME SALTO
  COPIAR_CADENA cad1,cadAux
  mov cl,contCAD1
  call verifica
  ret
endp

cadena2 PROC
  IMPRIME SALTO
  COPIAR_CADENA cad2,cadAux
  mov cl,contCAD2
  call verifica
  ret
endp

cadena3 PROC
  IMPRIME SALTO
  COPIAR_CADENA cad3,cadAux
  mov cl,contCAD3
  call verifica
  ret
endp

verifica PROC
  mov cont2,cl
  mov tam2,0
  leer:
    POSICIONA_CURSOR
    IMPRIME men5
    MOV DH,3
    POSICIONA_CURSOR
    cmp error,3
    je p
    mov si,0
    imprimeCad cont2,aux
    mov cl,cont2
    cmp tam2,cl
    je GANO
    LEER_CARACTER
    IMPRIME SALTO
    mov cl,cont2
    mov si,0
    mov cont,0
   ciclo:
    cmp cont,cl
    je aumenta
    cmp al,cadAux[si]
    je e1
    inc si
    inc cont
    jmp ciclo
  p: jmp perdio
    e1:
      cmp aux[si],95
      je guarda
      inc si
      jmp ciclo
    guarda:
      inc tam2
      mov aux[si],al
      jmp leer
    aumenta:
      inc ERROR
      jmp leer
  GANO:
    MOV DH,7
    POSICIONA_CURSOR
    IMPRIME men4
    jmp m
  perdio:
    MOV DH,7
    POSICIONA_CURSOR
    IMPRIME men6
  m:
  FINISH
  ret
verifica ENDP
ir proc
  mov MODE, 12h
  MODOVIDEO
  MODOVIDEO
  ret
ir endp
INGRESA_CADENAS PROC
  IMPRIME MEN1
  MOV DH,3
  POSICIONA_CURSOR
  call INGRESA
  mov al,cont
  mov contCAD1,al
  COPIAR_CADENA aux,cad1
  MOV DH,6
  POSICIONA_CURSOR
  IMPRIME men2
  MOV DH,9
  POSICIONA_CURSOR
  call INGRESA
  mov al,cont
  mov contCAD2,al
  COPIAR_CADENA aux,cad2
  MOV DH,12
  POSICIONA_CURSOR
  IMPRIME men3
  MOV DH,15
  POSICIONA_CURSOR
  call INGRESA
  mov al,cont
  mov contCAD3,al
  COPIAR_CADENA aux,cad3
  call ir
  ret
INGRESA_CADENAS ENDP

COMPARA_CADENAS proc
  CLD
  MOV CX,06
  LEA DI,aux
  LEA SI,cadAux
  REPE CMPSW
  JNE no
  IMPRIME MEN4
  call salir
  no:
    call salir
   RET
COMPARA_CADENAS ENDP

INGRESA PROC
   mov si,0
   mov cont,0
   cicl:
     LEER_CARACTER
     cmp al,46
     je termina
     mov aux[si],al
     inc si
     inc cont
   jmp cicl
   termina:
      mov si,0
   ret
INGRESA ENDP
video PROC
  ACTUAL
  MOV MODEACT,AL
  mov MODE, 13h
  MODOVIDEO
  ret
video ENDP
salir PROC
  mov ah, 0
  int 16h
  MOV AL, MODEACT
  mov MODE, AL
  MODOVIDEO
  call SALIR_DOS
salir ENDP
SALIR_DOS PROC
  MOV AH,4CH
  INT 21H
  RET
SALIR_DOS ENDP
end  inicio
