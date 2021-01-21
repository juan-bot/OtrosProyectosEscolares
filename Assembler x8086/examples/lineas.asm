  ;PROGRAMA imprime lineas aleatorias
include macv.h
  .MODEL small
  .STACK  100
  .DATA
    MODEACT DB ?
    MODE DB ?
    COLOR db ?
    COL DW ?
    REN DW ?
    cont dw 0
  .CODE
  PRINCI PROC FAR
     ;PROTOCOLO
     push ds
     sub ax,ax
     push ax
     MOV AX,@DATA
     MOV DS,AX
     ACTUAL
    MOV MODEACT,AL
    mov MODE, 13h
    MODOVIDEO
    MOV COLOR, 04H
    call n
    MOV COL, dx
    call n
    MOV REN, dx
    call n
    mov cx,dx
  ciclo:
    pixel color,col,ren
    inc col
    inc ren
    loop ciclo
    mov ah, 0
    int 16h
    call n
    MOV COL, dx
    call n
    MOV REN, dx
    mov cx,20
    ciclo2:
      pixel color,col,ren
      inc col
      inc ren
      loop ciclo2
      mov ah, 0
      int 16h
    MOV AL, MODEACT
    mov MODE, AL
    MODOVIDEO
    ret
  PRINCI ENDP

  N PROC
    SEMILLA
    ALEATORIO
    CALL ESCALANDO
    ret
  n ENDP

  ESCALANDO PROC   ; ESCALANDO EL NUMERO PSEUDOALEATORIO OBTENIDO
    MOV DX,0
    MOV BX,200d ;NUMEROS ALEATORIOS ENTRE 0 Y 9
    DIV BX
    RET
   ESCALANDO ENDP


  SALIR_DOS PROC
    MOV AH,4CH
    INT 21H
    RET
  SALIR_DOS ENDP

  END PRINCI
