;PROGRAMA menu QUE MUESTRA figuras aleatoria
include macv.h
  .MODEL small
  .STACK  100
  .DATA
  MENU db 'Ingresa una opcion valida: 1: lineas  2: cuadrados 3: rectangulos  4: circulos  5: salir  ...$'
    MODEACT DB ?
    MODE DB ?
    COLOR db ?
    COL Dw ?
    REN DW ?
    cont dw 0
    cont2 dw 0
    cont3 dw 0
    cont4 dw 0
    cont5 dw 0
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
     ACTUAL
     MOV MODEACT,AL
     mov MODE, 13h
     MODOVIDEO
ciclom:
     mov ah, 0
     int 16h
     MOV AL, MODEACT
  	 mov MODE, AL
  	 MODOVIDEO
     POSICIONA_CURSOR
     imprime menu
     LEER_CARACTER
     ASCII_BIN
     mov opc,al
     mov MODE, 13h
     MODOVIDEO
     mov MODE, 13h
     MODOVIDEO
     mov num,350
     call numero
     mov aux,dx
     cmp opc,1
     je lineas
     cmp opc,3
     je rectangulo
     cmp opc,5
     je  exit1
  ciclo_nCuadros:
      cmp aux,0
      je c4
      sub aux,1
      call GENERAR_VARIABLES
      mov bx,col
      mov num,2
      call numero
      mov relleno,dl
      cmp relleno,1
      je c5
      jmp lineCuadro
c4: jmp ciclom
  lineCuadro:
    mov num,100
    call numero
    mov cont2,dx
    mov ax,cont2
    l1:
     cmp cont2,0
     je l2
     call pixel
     sub cont2,1
     inc col
    jmp l1
  c1: jmp ciclo_nCuadros
  rectangulo: jmp ciclo_rectangulos
  c5 : jmp cuadro_relleno
  lineas: jmp lineas1
    exit1: jmp exit
  l2: mov cont2,ax
    ll2:
     cmp cont2,0
     je l3
     call pixel
  sub cont2,1
     inc ren
     jmp ll2
  c2: jmp c1
  l3:  mov cont2,ax
    ll3:
     cmp cont2,0
     je l4
     call pixel
  sub cont2,1
     sub col,1
     jmp ll3
  l4:  mov cont2,ax
    ll4:
     cmp cont2,0
     je c1
     call pixel
     sub cont2,1
     sub ren,1
     jmp ll4
ciclo: jmp ciclom
cuadro_relleno:
  mov num,100
  call numero
  mov cont2,dx
  mov ax,cont2
    n_renCuadro:
      cmp cont2,0
      je c2
      mov col,bx
      mov cont3,ax
    n_columCuadro:
       cmp cont3,0
       je x
       call pixel
       sub cont3,1
       inc col
      jmp n_columCuadro
   x: sub cont2,1
      inc ren
      jmp n_renCuadro
ex1: jmp ciclom
  lineas1:
      cmp aux,0
      je ciclo
      sub aux,1
      call GENERAR_VARIABLES
      mov bx,col
      mov num,3
      call numero
      cmp dx,1
      je vertical
      cmp dx,2
      je horizontal
      jmp diagonal
   vertical:
       mov num,250
       call numero
       mov cx,dx
     p_ver:
       call pixel
       inc ren
       loop p_ver
       jmp lineas1
  ex: jmp ex1
    horizontal:
        mov num,100d
        call numero
        mov cx,dx
     p_hor:
       call pixel
       inc col
       loop p_hor
       jmp lineas1
    diagonal:
        mov num,2d
        call numero
        cmp dx,1
        je pos
        jmp negativo
      pos:
        mov num,66d
        call numero
        mov cx,dx
        ci1:
        call pixel
        inc COL
        inc REN
        loop ci1
        jmp lineas1
      negativo:
         mov num,66d
         call numero
         mov cx,dx
         ci2:
         call pixel
         sub COL,1
         inc REN
         loop ci2
         jmp lineas1

   ciclo_rectangulos:
              cmp aux,0
              je ex
              sub aux,1
               call GENERAR_VARIABLES
               mov num,150
               call numero
               mov num,dx
               call numero
               mov cont2,dx
               mov cont4,dx
               mov num,200
               call numero
               mov num,dx
               call numero
               mov cont3,dx
               mov cont5,dx
               mov num,2
               call numero
               mov opc,dl
               cmp opc,1
               je rectangulo_relleno
           rectangulo_hueco:
             l111:
                cmp cont2,0
                je l112
                call pixel
                sub cont2,1
                inc col
               jmp l111
           c7: jmp ciclo_rectangulos
             l112:
                cmp cont3,0
                je l113
                call pixel
                sub cont3,1
                inc ren
                jmp l112
         c8: jmp ciclo_rectangulos

             l113:
                cmp cont4,0
                je l114
                call pixel
                sub cont4,1
                sub col,1
                jmp l113
             l114:
                cmp cont5,0
                je c8
                call pixel
                sub cont5,1
                sub ren,1
                jmp l114
           rectangulo_relleno:
               mov num,100
                call numero
                mov cont2,dx
                mov ax,cont2
              n_renRectangulo:
                cmp cont2,0
                je c8
                mov col,bx
                mov cont3,ax
               n_columRectangulo:
                 cmp cont3,0
                 je y
                 call pixel
                 sub cont3,1
                 inc col
                 jmp n_columRectangulo
                 y: sub cont2,1
                    inc ren
                    jmp n_renRectangulo
    exit: call salir
  PRINCI ENDP

  video PROC
    ACTUAL
    MOV MODEACT,AL
    mov MODE, 13h
    MODOVIDEO
    ret
  video ENDP
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
    MOV AX,DX
    add ax,1
    RET
   ESCALANDO ENDP
  SALIR_DOS PROC
    MOV AH,4CH
    INT 21H
    RET
  SALIR_DOS ENDP

  salir PROC
    mov ah, 0
    int 16h
    MOV AL, MODEACT
    mov MODE, AL
    MODOVIDEO
    call SALIR_DOS
  salir ENDP
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
  END PRINCI
