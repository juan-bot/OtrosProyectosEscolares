; multiplicacion y division de dos números de un solo dígito BCD
include macv.h
.model small
.stack 64
.data
  SALTO db 13, 10,'$'
  a db 'ingresa a: $'
  b db 'ingresa b: $'
  men1 db ' division: $'
  men2 db ' multiplicacion: $'
  men3 db ' residuo : $'
  men4 db '   cociente : $'
  men5 db '        resultados:$'
  x db 0
  y db 0
.code
PRINCI PROC FAR
  push ds
  sub ax,ax
  push ax
  MOV AX,@DATA
  MOV DS,AX

  imprime a
  sub ah,ah
  LEER_CARACTER
  and al,0fh
  mov bl,al
  mov x,al
  imprime SALTO
  imprime b
  LEER_CARACTER
  and al,0fh
  mov y,al
  mov cl,al
  imprime SALTO
  imprime men5
  imprime SALTO
  imprime men1
  imprime SALTO
  call division
  imprime SALTO
  imprime SALTO
  mov cl,x
  mov al,y
  imprime men2
  call multiplicacion
  call salir
PRINCI ENDP
  division PROC
    LODSB
    sub ah,ah
    mov al,bl
    aad
    div cl
    STOSB
    or  ax,3030h
    mov bx,ax
    ;impresion parte alta
    imprime men3
    mov dl,bh
    call IMPRIME1
    ;impresion parte baja
    imprime men4
    mov dl,bl
    call IMPRIME1
    ret
  division ENDP

  multiplicacion proc
    mul cl
    aam
    or  ax,3030h
    mov bx,ax
    ;impresion parte alta
    mov dl,bh
    call IMPRIME1
    ;impresion parte baja
    mov dl,bl
    call IMPRIME1
    ret
  multiplicacion endp
  IMPRIME1 PROC
    push ax
    mov ah,02
    int 21h
    pop ax
    RET
  IMPRIME1 ENDP
  SALIR PROC
    pop ax
    mov ax,4c00h
    int 21h
    RET
  SALIR ENDP

END PRINCI
