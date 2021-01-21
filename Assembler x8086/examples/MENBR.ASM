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
    ybeg dw 180
    xbeg dw 180
    xend dw 180
    y3 dw 90h
    x3 dw 90h
    x1 dw ?        ;posiccion
    y1 dw ?
    xc dw ?         ;tamaño
    yc dw ?         ;tamaño
    rad dw 90
    pc dw 0
    vaux1 dw 1
    vincx dw 0
    vincy dw 0
    vaux2 dw 0
    LIM DW ?
    CONTR DW 0
    REL DW ?
    NUMCIR DW ?
    COLOR2 db ?
    N DW ?
    ;bandera dw 0

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
     mov num,150
     call numero
     mov aux,dx
     cmp opc,1
     je lineas
     cmp opc,3
     je rectangulo
     cmp opc,4
     jmp circulos
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

circulos:  MOV LIM,25
          CALL Numeroc
          MOV N,DX

IMP:      CMP N,00
          JLE exit
          CALL GENERAR_VARIABLESCIR
          CMP REL,01
          JE RELLENOC
          DEC N
          call circulo
          JMP IMP
rellenoc:  CMP XC,00
          JE IMP
          MOV DX,XC
          DEC DX
          DEC YC
          DEC N
          CALL CIRCULO
          JMP RELLENOC

          circulo proc near
          mov ax,@data
          mov ds,ax
          mov ax,xc
          xor ax,ax
          mov xc,ax
          mov ax,1
          sbb rad,ax ;pc=rad-1
          mov ax,rad
          mov pc,ax
          jmp short a226
a58:      mov bx,pc
          or bx,bx
          jl short a114 ;if pc>0
          inc xc ;xc++
          mov ax,xc
          jmp short a142
a114:     inc xc
          dec yc
          mov ax,xc
          sub ax,yc
a142:     shl ax,1 ;2*xc+1
          inc ax
          sub pc,ax
          call pxp
a226:     mov ax,xc
          cmp ax,yc ;while(xc<yc)
          jl short a58
          ret

          pxp proc near
          mov ax,x1 ;mov cx,x
          add ax,xc ;mov dx,y
          mov cx,ax
          mov ax,y1
          add ax,yc
          mov dx,ax
          call pixel
          mov ax,x1 ;mov cx,x
          sub ax,xc ;mov dx,y
          mov cx,ax
          mov ax,y1
          add ax,yc
          mov dx,ax
          call pixel
          mov ax,x1 ;mov cx,x
          add ax,xc ;mov dx,y
          mov cx,ax
          mov ax,y1
          sub ax,yc
          mov dx,ax
          call pixel
          mov ax,x1 ;mov cx,x
          sub ax,xc ;mov dx,y
          mov cx,ax
          mov ax,y1
          sub ax,yc
          mov dx,ax
          call pixel
          mov ax,x1 ;mov cx,x
          add ax,yc ;mov dx,y
          mov cx,ax
          mov ax,y1
          add ax,xc
          mov dx,ax
          call pixel
          mov ax,x1 ;mov cx,x
          sub ax,yc ;mov dx,y
          mov cx,ax
          mov ax,y1
          add ax,xc
          mov dx,ax
          call pixel
          mov ax,x1 ;mov cx,x
          add ax,yc ;mov dx,y
          mov cx,ax
          mov ax,y1
          sub ax,xc
          mov dx,ax
          call pixel
          mov ax,x1 ;mov cx,x
          sub ax,yc ;mov dx,y
          mov cx,ax
          mov ax,y1
          sub ax,xc
          mov dx,ax
          call pixel
          ret
    pxp endp
circulo endp


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

GENERAR_VARIABLESCIR PROC
PUSH DX
 mov LIM,15
 call numero
 MOV COLOR2, dl
 MOV LIM,460
 CALL NUMERO
 MOV x1, DX          ;posicion
 add x1,180
 MOV LIM,300
 CALL NUMERO
 MOV y1, DX
 add y1,180
 MOV LIM,100
 CALL NUMERO
 mov xc,DX           ;tamaño
 mov yc,DX           ;tamaño
 MOV LIM,02
 CALL Numero
 MOV REL,DX
 MOV LIM,15
 CALL Numero
 MOV N,DX
 POP DX
ret
GENERAR_VARIABLESCIR ENDP

  ESCALANDO PROC
    MOV DX,0
    MOV BX,num
    mov bh,0
    DIV BX
    RET
   ESCALANDO ENDP

   Numeroc PROC
     SEMILLA
     ALEATORIO
     CALL ESCALANDOC
     ret
   numeroc ENDP

   ESCALANDOC PROC
     MOV DX,0
     MOV BX,LIM                ;x
     mov bh,0
     DIV BX
     RET
    ESCALANDOC ENDP

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
