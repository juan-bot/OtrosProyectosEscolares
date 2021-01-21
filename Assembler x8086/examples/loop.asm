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

    MOV CX,5
CICLO:
    mov dx, offset IN_NUM
    mov ah,09
    int 21h
    LOOP CICLO
    call salir
  INICIO ENDP


  SALIR PROC
    pop ax
    mov ax,4c00h
    int 21h
    RET
  SALIR ENDP

CODESG ENDS
END INICIO
