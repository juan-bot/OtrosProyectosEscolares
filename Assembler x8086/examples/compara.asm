STACKSG segment para stack 'stack'
DB 20 DUP (0)
STACKSG ENDS
DATASG SEGMENT PARA 'DATA'
  MEN DB 'Ingresa la cadena$'
  NUMEROS DB'Numeros ingresados :$'
  LETRAS DB'Letras ingresadas :$'
  SALTO db 13, 10,'$'
DATASG ENDS

CODESG SEGMENT PARA 'CODE'
  INICIO PROC FAR
    ASSUME SS:STACKSG, DS:DATASG,CS:CODESG
    PUSH DS
    SUB AX,AX
    PUSH AX
    MOV AX,SEG DATASG
    MOV DS,AX

    mov dx, offset MEN
    mov ah,09
    int 21h
    mov dx, offset SALTO
    mov ah,09
    int 21h
    mov cl,00
    mov ch,00
LEER:
    CALL LEER_CARACTER
    CMP al,46
    je exit
    CMP al,57
    JLE COMPARA_NUM
    CMP al,90
    JLE COMPARA_LETRA
    CMP al,122
    JLE COMPARA_LETRAmayuscula
    jmp LEER
COMPARA_LETRAmayuscula:
  CMP al,97
  JGE CONT_LETRA
  jmp LEER
COMPARA_LETRA:
  CMP al,65
  JGE CONT_LETRA
  jmp LEER
COMPARA_NUM:
    CMP al,48
    JGE CONT_NUM
    jmp LEER
CONT_NUM:
    inc ch
    jmp LEER
CONT_LETRA:
    inc cl
    jmp LEER
exit:
  mov dx, offset SALTO
  mov ah,09
  int 21h
  mov dx, offset NUMEROS
  mov ah,09
  int 21h
  mov dl,ch
  call BIN_ASCII
  CALL IMPRIME
  mov dx, offset SALTO
  mov ah,09
  int 21h
  mov dx, offset LETRAS
  mov ah,09
  int 21h
  mov dl,cl
  call BIN_ASCII
  CALL IMPRIME
  CALL SALIR

INICIO ENDP
  IMPRIME PROC
    push ax
    mov ah,02
    int 21h
    pop ax
    RET
  IMPRIME ENDP

  LEER_CARACTER PROC
    mov ah,01
    int 21h
    RET
  LEER_CARACTER ENDP

  SALIR PROC
    pop ax
    mov ax,4c00h
    int 21h
    RET
  SALIR ENDP
  BIN_ASCII PROC
    cmp dl,9h
    jg SUMA37
    add dl,30h
    jmp fin
SUMA37: add dl,37h
fin: ret
  BIN_ASCII ENDP
CODESG ENDS ;Fin segemento de c�dico
END INICIO
