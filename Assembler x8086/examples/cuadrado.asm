;PROGRAMA menu QUE MUESTRA figuras aleatoria
include macv.h
  .MODEL small
  .STACK  100
  .DATA
  MENU db 'Ingresa una opcion valida: 1: lineas,2: cuadrados,3 o 4 $'
    MODEACT DB ?
    MODE DB ?
    COLOR db ?
    COL Dw ?
    REN DW ?
    cont dw 0
    cont2 dw 0
    cont3 dw 0
    aux2 dw 0
    aux3 dw 0
    aux dw 0
    dir db 0
    num dw 0
    opc db 0
    relleno db 0
  .CODE
  PRINCI PROC FAR
     push ds
     sub ax,ax
     push ax
     MOV AX,@DATA
     MOV DS,AX

     LIMPIA_PANTALLA
     POSICIONA_CURSOR
     imprime menu
     LEER_CARACTER
     mov opc,al
     ACTUAL
     MOV MODEACT,AL
     mov MODE, 13h
     MODOVIDEO
     mov num,150
     call numero
     mov aux,dx
  ciclo_nCuadros:
      cmp aux,0
      je exit1
      sub aux,1
      call GENERAR_VARIABLES
      mov num,100
      call numero
      mov cont2,dx
      mov ax,cont2
      mov bx,col
      l1:
       cmp cont2,0
       je l2
       call pixel
       sub cont2,1
       inc col
      jmp l1
    l2:  mov cont2,ax
      ll2:
       cmp cont2,0
       je l3
       call pixel
       sub cont2,1
       inc ren
       jmp ll2
    l3:  mov cont2,ax
      ll3:
       cmp cont2,0
       je l4
       call pixel
       sub cont2,1
       sub col,1
       jmp ll3
      exit1: jmp exit
    l4:  mov cont2,ax
      ll4:
       cmp cont2,0
       je ciclo_nCuadros
       call pixel
       sub cont2,1
       sub ren,1
       jmp ll4

  exit:
      call salir
  PRINCI ENDP
  Numero PROC
    SEMILLA
    ALEATORIO
    CALL ESCALANDO
    ret
  numero ENDP

GENERAR_VARIABLES PROC
  mov num,15d
  call numero
  MOV COLOR, dl
  mov num,220
  call numero
  mov ren,dx
  call numero
  mov col,dx
  mov num,2
  call NUMERO
  mov relleno,dl
  mov num,3
  call NUMERO
  RET
GENERAR_VARIABLES ENDP
  ESCALANDO PROC
    MOV DX,0
    MOV BX,num
    mov bh,0
    DIV BX
    RET
   ESCALANDO ENDP
  SALIR_DOS PROC
    MOV AH,4CH
    INT 21H
    RET
  SALIR_DOS ENDP

  PIXEL PROC
    push ax
    push cx
    push bx
    MOV AH,0CH
    MOV AL,COLOR
    MOV BH,0
    MOV CX,COL
    MOV DX,REN
    INT 10H
    pop cx
    pop bx
    pop ax
    RET
  PIXEL ENDP
  salir PROC
    mov ah, 0
    int 16h
    MOV AL, MODEACT
    mov MODE, AL
    MODOVIDEO
    call SALIR_DOS
  salir ENDP
  END PRINCI
