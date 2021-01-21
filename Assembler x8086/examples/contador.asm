STACKSG segment para stack 'stack'
DB 20 DUP (0)
STACKSG ENDS
DATASG SEGMENT PARA 'DATA'
  var db 64
DATASG ENDS

CODESG SEGMENT PARA 'CODE'
  INICIO PROC FAR
    ASSUME SS:STACKSG, DS:DATASG,CS:CODESG
    PUSH DS
    SUB AX,AX
    PUSH AX
    MOV AX,SEG DATASG
    MOV DS,AX

    mov dl,var
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

  CODESG ENDS
  END INICIO
