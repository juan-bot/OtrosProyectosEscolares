STACKSG segment para stack 'stack'
DB 20 DUP (0)
STACKSG ENDS
DATASG SEGMENT PARA 'DATA'
  IN_NUM DB'Ingresa el numero:$'
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
    MOV CX,7

CICLO:
    mov dx, offset IN_NUM
    mov ah,09
    int 21h
    mov dx, offset SALTO
    mov ah,09
    int 21h
    Call Empaqueta
    Mov dl,al
    LOOP CICLO
    Call desempaqueta
    call salir



  INICIO ENDP
  Empaqueta PROC
    Push cx
    Call LEER_CARACTER
    Call ASCII_BIN
    Mov cl,04
    Shl al,cl
    Mov ch,al
    Call LEER_CARACTER
    Call ASCII_BIN
    Add al,ch
    Pop cx
    RET
  Empaqueta ENDP
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
    ASCII_BIN PROC
      cmp al,30h
      jl ERROR
      cmp al,39h
      jg LETRA
      sub al,30h
      jmp FIN
    LETRA:
      cmp al,41h
      jl ERROR
      cmp al,46h
      jg ERROR
      sub al,37h
      jmp FIN
    ERROR:
      mov al,0
    FIN:
      RET
    ASCII_BIN ENDP
    DESEMPAQUETA PROC
      Push dx
      Push cx
      Mov dh,dl
      Mov cl,4
      Shr dl,cl
      Call BIN_ASCII
      Call IMPRIME
      Mov dl,dh
      And dl,0Fh
      Call BIN_ASCII
      Call IMPRIME
      Pop cx
      Pop dx
      RET
    desempaqueta ENDP
    BIN_ASCII PROC
      cmp dl,9h
      jg SUMA37
      add dl,30h
      jmp fin1
      SUMA37: add dl,37h
      fin1: ret
    BIN_ASCII ENDP
    IMPRIME PROC
      push ax
      mov ah,02
      int 21h
      pop ax
      RET
    IMPRIME ENDP
  CODESG ENDS
  END INICIO
