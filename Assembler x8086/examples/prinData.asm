  STACKSG segment para stack 'stack'
  DB 20 DUP (0)
  STACKSG ENDS
  DATASG SEGMENT PARA 'DATA'
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
      call LEER_CARACTER
      call ASCII_BIN
      mov si,110
      mov [si],al
      mov si,110
      mov dl,[si]
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

    BIN_ASCII PROC
      cmp dl,9h
      jg SUMA37
      add dl,30h
      jmp fin
      SUMA37: add dl,37h
      fin: ret
    BIN_ASCII ENDP

    SALIR PROC
      pop ax
      mov ax,4c00h
      int 21h
      RET
    SALIR ENDP
    LEER_CARACTER PROC
      mov ah,01
      int 21h
      RET
    LEER_CARACTER ENDP
    ASCII_BIN PROC
      cmp al,30h
      jl ERROR
      cmp al,39h
      jg LETRA
      sub al,30h
      jmp FIN1
    LETRA:
      cmp al,41h
      jl ERROR
      cmp al,46h
      jg ERROR
      sub al,37h
      jmp FIN1
    ERROR:
      mov al,0
    FIN1:
      RET
    ASCII_BIN ENDP
  CODESG ENDS
  END INICIO
