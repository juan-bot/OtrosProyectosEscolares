  STACKSG segment para stack 'stack'
  DB 20 DUP (0)
  STACKSG ENDS
  DATASG SEGMENT PARA 'DATA'
    SALTO db 13, 10,'$'
    x db 0
    k db 0
  DATASG ENDS

  CODESG SEGMENT PARA 'CODE'
    INICIO PROC FAR
      ASSUME SS:STACKSG, DS:DATASG,CS:CODESG
      PUSH DS
      SUB AX,AX
      PUSH AX
      MOV AX,SEG DATASG
      MOV DS,AX

      mov cx,64
  CICLO:
      cmp k,10
      JE RES
      inc x
      inc k
      mov al,05
      imul x
      mov cx,100
      sub cx,ax
      mov ax,cx
      mov bh,10
      div bh
      mov dl,ah
      call BIN_ASCII
      CALL IMPRIME
      JMP CICLO
  RES:
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
      jmp fin1
      SUMA37: add dl,37h
      fin1: ret
    BIN_ASCII ENDP
  CODESG ENDS
  END INICIO
