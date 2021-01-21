  include macpac.h
  .model small
  .stack 100h
  .data
      ;************************************************************************
      ;        2   4   6   8   10  12  14  16  18  20  22  24  26  28  30  32  34  36  38  40  42  44  46  48  50  52
  level1  dw 3,2,2,2,2,2,2,2,2,3,2,3,2,2,2,2,2,3,3,3,3,3,2,3,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
          dw 3,2,2,2,2,2,2,2,2,3,2,3,0,0,0,0,0,3,0,0,0,0,0,0,3,0,0,0,0,0,0,3,3,3,3,3,0,0,0,0,0,0,0,3,3,3,3,3,3,0,0,0,2  ;2
          dw 3,2,2,2,2,2,2,2,2,3,3,3,0,0,0,0,0,3,3,0,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2
          dw 3,2,2,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2  ;4
          dw 3,3,3,3,0,0,0,0,0,3,3,3,0,0,0,3,3,3,0,0,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,5,5,5,5,0,0,0,0,0,5,5,5,5,0,0,0,0,3
          dw 2,2,3,3,0,0,0,0,0,3,0,3,0,0,0,3,0,3,0,0,4,2,2,2,2,2,2,2,2,2,2,2,4,0,0,5,2,2,2,5,0,0,0,5,2,2,2,5,0,0,3,3,3  ;6
          dw 2,2,2,3,0,0,0,0,0,3,0,3,0,0,0,3,0,3,0,0,4,4,4,4,4,4,2,4,4,4,4,4,4,0,0,5,2,2,2,2,5,5,5,2,2,2,2,5,0,0,3,0,2
          dw 2,2,2,3,0,0,0,0,0,3,0,3,0,0,0,3,0,3,0,0,0,0,0,0,0,4,2,4,0,0,0,0,0,0,0,5,2,5,2,2,2,2,2,2,2,5,2,5,0,0,3,0,2  ;8
          dw 3,3,3,3,0,0,0,0,0,3,0,3,0,0,0,3,0,3,0,0,0,0,0,0,0,4,2,4,0,0,0,0,0,0,0,5,2,5,5,2,2,2,2,2,5,5,2,5,0,0,3,0,2
          dw 2,0,0,0,0,0,0,0,0,3,0,3,0,0,0,3,0,3,0,0,0,0,0,0,0,4,2,4,0,0,0,0,0,0,0,5,2,5,0,5,2,2,2,5,0,5,2,5,0,0,0,0,2  ;10
          dw 2,2,2,3,0,0,0,0,0,3,0,3,0,0,0,3,0,3,0,3,3,3,0,0,0,4,2,4,0,0,0,3,0,0,0,5,2,5,0,5,5,5,5,0,0,5,2,5,0,0,0,0,2
          dw 2,2,2,3,0,3,3,0,0,3,0,3,0,0,0,3,0,3,0,0,0,0,0,0,0,4,2,4,0,0,0,3,0,0,0,5,2,5,0,0,0,0,0,0,0,5,2,5,0,3,3,0,2  ;12
          dw 2,2,2,3,0,0,0,0,0,3,0,3,0,0,0,3,0,3,0,0,3,3,3,3,0,4,2,4,0,0,0,3,0,0,0,5,2,5,0,0,0,0,0,0,0,5,2,5,0,3,0,0,2
          dw 2,2,2,3,0,3,3,3,0,3,0,3,0,3,3,3,0,3,0,0,0,0,0,0,0,4,2,4,0,3,3,3,0,0,0,5,2,5,0,0,0,0,0,0,0,5,2,5,0,3,0,0,2  ;14
          dw 2,2,2,3,0,0,0,0,0,3,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,4,2,4,0,3,0,0,0,0,0,5,2,5,0,0,0,0,0,0,0,5,2,5,0,3,0,0,2
          dw 2,2,2,3,0,0,0,0,0,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,4,4,4,0,3,0,0,0,0,0,5,5,5,0,0,0,0,0,0,0,5,5,5,0,0,0,0,2  ;16
          dw 2,2,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2
          dw 2,2,2,3,0,0,0,0,0,0,3,3,0,0,0,0,0,0,0,3,3,3,3,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2  ;18
          dw 3,3,3,3,0,0,0,0,0,0,3,0,0,3,0,0,0,0,3,0,0,0,0,0,0,0,0,0,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2
          dw 3,0,0,0,0,0,0,0,0,0,3,3,3,3,3,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,0,3,3,3,3,3,0,0,2 ;20
          dw 3,0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,3,0,0,2
          dw 3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,3,2,2,2,2,3,3,3,3,3,0,0,0,0,0,0,3,0,3,0,0,0,0,0,0,0,3,3,0,0,0,0,0,2  ;22
          dw 3,0,0,0,3,3,3,0,3,3,0,3,3,3,3,0,0,3,0,3,2,2,2,3,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,3,0,3,0,0,0,0,3,0,0,2
          dw 3,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,2,2,3,0,0,0,3,0,3,0,0,0,0,0,0,3,0,3,0,0,0,0,3,0,3,0,0,3,3,0,0,0,2  ;24
          dw 3,0,0,0,3,0,3,3,3,0,0,3,3,3,0,3,0,0,3,0,3,2,3,0,0,3,2,3,2,3,0,0,0,0,0,0,3,2,3,0,0,0,0,0,0,3,0,0,3,0,0,0,2
          dw 3,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,3,0,0,0,3,0,3,3,0,3,0,3,0,0,0,0,0,0,3,0,3,0,0,0,0,3,3,3,0,3,0,0,0,0,0,2  ;26
          dw 3,0,0,0,3,3,3,3,0,3,3,3,0,3,3,0,0,3,0,3,0,3,0,0,3,0,3,0,3,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2
          dw 3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2  ;28
          dw 3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2
          dw 3,3,3,3,2,2,2,2,3,2,2,2,2,2,2,3,3,3,2,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,2,3,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2  ;30 x53

  fantasma1 db 0,0,0,0,1,1,1,0,0,0,0,0
            db 0,0,1,1,1,1,1,1,1,0,0,0
            db 0,0,1,1,1,1,1,1,1,1,0,0
            db 0,1,1,0fh,0fh,1,1,1,0fh,0fh,1,0
            db 0,1,0fh,0bh,0bh,0fh,1,0fh,0bh,0bh,0fh,0
            db 1,1,0fh,0bh,0bh,0fh,1,0fh,0bh,0bh,0fh,1
            db 1,1,1,0fh,0fh,1,1,1,0fh,0fh,1,1
            db 1,1,1,1,1,1,1,1,1,1,1,1
            db 1,1,1,1,1,1,1,1,1,1,1,1
            db 1,1,1,1,1,1,1,1,1,1,1,1
            db 1,1,1,1,1,1,1,1,1,1,1,1
            db 0,1,1,0,0,1,1,1,0,0,1,0 ;12x12

  pospacman dw 974 ;(ren-1)*tam+col
  posf1 dw  3052    ;
  posf2 dw   362    ;
  posf3  dw  1814    ;
   XB DW 00
   YB DW 00
  color db 04
  ren  dw 270      ;270+530
  col dw 320     ;640x480 ;80x60
  salto db 10,13,'$'
  maximo dw 0
  maxim dw  ?
  nomouse db 'No se detecto el mouse$'
  mensaje1 db 'S','c','o','r','e',':','$'
  menganaste db 2,' ',2,' G A N A S T E ',2,' ',2,' ','!','!','$'
  menperdiste db 1,' ',1,' P E R D I S T E ',1,' ',1,' ','!','!','$'
  advertencia db 'Para terminar de ingresar el nombre presione . seguido de la tecla [enter] $'
  menvidas  db 'Vidas:        $'
  gamename db ' P A C M A N $'
  letrero db '***** JUGADOR    PUNTAJE *****$'
  colc db 0
  renc db 0
  a0 db ?
  a1 db ?
  a2 db ?
  a3 db ?
  vidas db 3
  colorfantasma db ?
  puntosactuales dw 0
  puntostotales dw 150
  puntaje dw  0
  puntos dw  0
  muevete db ?
  sentido dw 4 ;hacia abajo
  sentidof1 dw ?
  sentidof2 dw ?
  sentidof3 dw ?
  vacio db '                                                                     $'
  x db 8
  y db 0
  r db 8
  xx dw ?
  yy dw ?
  rr dw ?
  xi dw  126  ;columna 10 para el pacman
  yi  dw 186 ;renglon 10 para el pacman
  rastrof1 db 0
  rastrof2 db 0
  rastrof3 db 0
  fy dw ?
  fx dw  ?
  f1y dw  396 ;336   ; renglon 29
  f1x dw 504  ;  columna 43
  f2y dw   96;36  ;  renglon 4
  f2x dw 264  ;  columna 23
  f3y dw  264 ;204   ; renglon 18
  f3x dw 72  ;  columna 7
  relleno db 1
  temp2 dw ?
  temp1 dw ?
  act db ?
  mode db ?
  come db 0
  MEN1 DB 'Mouse no disponible...$'
  teclact db ?
  men_jugador db 'Ingresa nombre del jugador: $'
  menjuega db 'J U G A R $'
  mensal db 'S A L I R $'
  ;-----variables para archivos
  filename  db "score.txt",0h
    bufer db 81 dup (50)
    aux DB 3 dup(9)
    punto DB 3 dup(0)
    datos DB 16 dup(?),13,10
    handle  dw ?
      saltillo db 0
  ;-----
   ;-----  sonido
  frecuencia dw 0
  tiempo db 0
  .CODE
  MAIN PROC  near
    PUSH DS
    SUB AX,AX
    PUSH AX
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX

     call actual
    mov mode,12h
    CALL modovideo ;ESTABLECE EL MODO video INT 10 SERV.00
      continua:
        formatea datos
        call lectura_mouse
        cmp ah,1
        jne finp
    ;----pedir datos
        call limpia
        mov renc,0
        mov colc,0
        call pos_cur
        lea dx,advertencia
        call escribemen
        mov renc,5
        mov colc,25
        call pos_cur
        lea dx,vacio
        call escribemen
        mov renc,5
        mov colc,25
        call pos_cur
        lea dx,men_jugador
        call escribemen
        mov renc,7
        mov colc,35
        call pos_cur
        nombre_usuario datos
        jmp filecontinua
      finp: jmp finprograma
      filecontinua:
    ;-----end pide datos----------------
        mov ah,01
        int 21h
         call limpia
         call fondo
         call juego
         call limpia
         add datos[12],30h
         add datos[13],30h
         add datos[14],30h
         add datos[15],30h
         ;calcular_puntaje datos,punto,aux
         call mover_apuntador_archivo
         call escribir_archivo
         call cerrar_archivo
       jmp continua
    finprograma:

    mov al,act
    mov mode,al
    call modovideo
  ;+++termina el programa
    salir
    ret
main endp
  imprime_nombre proc
    push cx
    push si
    mov cx,12
    mov si,0
    mov renc,0
    mov colc,0
    call pos_cur
    impri:
    print_caracter datos
    inc si
    loop impri
    pop si
    pop cx
    ret
  imprime_nombre endp
  imprimir_Archivo proc
    push si
    mov si,0
    mov saltillo,0
    mov renc,4
    mov colc,45
    call pos_cur
    whil:
      cmp bufer[si],'$'
      je exito
      cmp saltillo,17
      je saltoo
      print_caracter bufer
      inc si
      inc saltillo
      jmp whil
      saltoo:
      mov colc,45
      inc renc
      call pos_cur
      print_caracter bufer
      inc si
      mov saltillo,0
    jmp whil
    exito:
    pop si
    ret
  imprimir_Archivo endp

  escribir_archivo proc
    push cx
    push ax
    push bx
    push dx
    mov ah,40h
    mov bx,handle
    mov cx,18
    mov dx,offset datos
    int 21h
    pop dx
    pop bx
    pop ax
    pop cx
    ret
  escribir_archivo endp

  leer_archivo proc
    push cx
    push ax
    push bx
    push dx
    mov ah,3Fh ;Código para leer archivo
    mov bx,handle ;Identificador
    mov cx,79h ;Tamaño deseado
    mov dx,offset bufer ;Dirección búfer
    int 21h
    mov bx,ax
    add bx,offset bufer
    mov byte ptr[bx],'$'
    ;Desplegar cadena leída
    ;mov dx,offset bufer
    ;mov ah,09h
    ;int 21h
    pop dx
    pop bx
    pop ax
    pop cx
    ret
  leer_archivo endp

  abrir_archivo proc
    push ax
    push bx
    MOV AH,3DH
    mov al,02h
    mov dx,offset filename
    int 21h
    mov handle,ax
    pop bx
    pop ax
    ret
  abrir_archivo endp

  mover_apuntador_archivo proc
    push cx
    push ax
    push bx
    push dx
    mov ah,42h
    mov al,02h ;final del archivo
    lea bx,handle
    mov cx,00
    mov dx,1024 ;desplazamiento
    int 21h
    pop dx
    pop bx
    pop ax
    pop cx
    ret
  mover_apuntador_archivo endp

  cerrar_archivo proc
    push ax
    push bx
    mov ah,3Eh
    mov bx,handle
    int 21h
    pop bx
    pop ax
    ret
  cerrar_archivo endp
  ;****************limpia pantalla
  limpia proc near
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    MOV AX,0600h
    MOV BH,00h
    MOV CX,0000h
    MOV DX,204Fh
    INT 10H
    POP DX
    POP CX
    POP BX
    POP AX
    RET
  limpia endp
  ;****************************** | controlador del juego  |************************
  juego proc near
    push si
    push bx
    push cx
    push xi
    push yi
    push pospacman
    push posf1
    push posf2
    push posf3
    push f1y
    push f1x
    push f2y
    push f2x
    push f3y
    push f3x
    mov ren,5
    mov col,200
    	mov color,06h
      call rectangulo
     mov col,290
      call rectangulo
      mov renc,1
      mov colc,30
      call pos_cur
      lea dx,gamename
      call escribemen
    call imprime_nombre
    mov renc,2
    mov colc,0
    call pos_cur
    lea dx,menvidas
    call escribemen
    call dibvidas
    sig:;------------modificacion---------------------
      mov tiempo,5
      mov frecuencia,2666
      call sonido
      mov tiempo,2
      mov frecuencia,5666
      call sonido
       call leepacman
       mov cx,pospacman
       cmp cx,posf1
       je perdiste
       cmp cx,posf2
       je perdiste
       cmp cx,posf3
       je perdiste
       call retraso
       call leefantasma1
       cmp cx,posf1
       je perdiste
       call retraso
       call leefantasma2
       cmp cx,posf2
       je perdiste
       call retraso
       call leefantasma3
       cmp cx,posf3
       je perdiste
        call retraso
       mov cx,puntosactuales
       cmp cx,puntostotales
       je ganaste
    cmp sentido,7
    jne sig
    jmp finjuego
    ganaste:
    	lea dx,menganaste
    	mov renc,16
    	mov colc,30
    	call pos_cur
    	call escribemen
    	jmp finjuego
    perdiste:
        dec vidas
        cmp vidas,0
        je nomasvidas
        cmp vidas,1
        je menvida
        cmp vidas,2
        lea dx,menvidas
        mov renc,2
        mov colc,0
        call pos_cur
        call escribemen
         call dibvidas
    jmp sig
        menvida:
        lea dx,menvidas
        mov renc,2
        mov colc,0
        call pos_cur
        call escribemen
        call dibvidas
        jmp sig
      nomasvidas:
        lea dx,menvidas
        mov renc,1
        mov colc,0
        call pos_cur
        call escribemen
        lea dx,menperdiste
    	mov renc,16
    	mov colc,30
    	call pos_cur
    	call escribemen
      call sonido_perdiste
    finjuego:
    push si
    lea dx,level1
    mov si,0
    mov cx,30
    deshaciendocambio:
    push cx
    mov cx,53
    deshacer:
    cmp level1[bx][si],1
    jne estabien
     mov level1[bx][si],0
    estabien:
    inc si
    inc si
    loop deshacer
    pop cx
    loop deshaciendocambio
    pop si
    mov ah,08
    int 21h
    mov vidas,3
    mov puntosactuales,0
    mov puntaje,0
    mov puntos,0
    mov sentido,4
    pop f3x
    pop f3y
    pop f2x
    pop f2y
    pop f1x
    pop f1y
    pop posf3
    pop posf2
    pop posf1
    pop pospacman
    pop yi
    pop xi
    pop cx
    pop bx
    pop si
    ret
  juego endp

  escribemen proc near
    push ax
    mov ah,09
    int 21h
    pop ax
    ret
  escribemen endp
  dibvidas proc near
     mov colc,7
     call pos_cur
     mov ah,09
     mov al,3
     mov bh,0
     mov bl,04
     mov ch,0
     mov cl,vidas
     int 10h
     ret
  dibvidas endp
  ;**************************************************************| FANTASMITA 1 |********
  fantasmita1 proc near
    push cx
    push xi
    push yi
    push bx
    push si
    push pospacman
    push sentido
    lea bx,level1
    ;f1x,f1y son las cordenadas del fantasma
    mov ax,f1x
    mov xi,ax
    mov col,ax
    mov ax,f1y
    mov yi,ax
    mov ren,ax
    mov cx,12
    borrandof1:
    mov color,00
    push cx
    push col
    mov cx,12
    borrandof12:
    call pixel
    inc col
    loop borrandof12
    pop col
    pop cx
    inc ren
    loop borrandof1
    cmp rastrof1,1
       je nohabiapunto
    call bloques
    nohabiapunto:
      cmp sentidof1,1
      je f1derecha
      cmp sentidof1,2
      je f1izquierda
      cmp sentidof1,3
      je f1abajo
      cmp sentidof1,4
      je f1arriba
      jmp finfantasmita1
      ;posf1 ubicacion del fantasma en la matriz
    f1arriba:
        sub f1y,12
        jmp finfantasmita1
    f1derecha:
        add f1x,12
        jmp finfantasmita1
    f1izquierda:
        sub f1x,12
        jmp finfantasmita1
    f1abajo:
        add f1y,12
    finfantasmita1:
    mov colorfantasma,0ch
    mov ax,f1y
    mov fy,ax
    mov ax,f1x
    mov fx,ax
    call dib_fantasma1
    ;comparar el sebtido
    pop sentido
    pop pospacman
    pop si
    pop bx
    pop yi
    pop xi
    pop cx
    ret
  fantasmita1 endp
  ;**************************************************************| FANTASMITA 2 |********
  fantasmita2 proc near
    push cx
    push xi
    push yi
    push bx
    push si
    push pospacman
    push sentido
    lea bx,level1
    ;f2x,f2y son las cordenadas del fantasma
    mov ax,f2x
    mov xi,ax
    mov col,ax
    mov ax,f2y
    mov yi,ax
    mov ren,ax
    mov cx,12
    borrandof2:
    mov color,00
    push cx
    push col
    mov cx,12
    borrandof22:
    call pixel
    inc col
    loop borrandof22
    pop col
    pop cx
    inc ren
    loop borrandof2
    cmp rastrof2,1
       je nohabiapunto1
    call bloques
    nohabiapunto1:
      cmp sentidof2,1
      je f2derecha
      cmp sentidof2,2
      je f2izquierda
      cmp sentidof2,3
      je f2abajo
      cmp sentidof2,4
      je f2arriba
      jmp finfantasmita2
      ;posf1 ubicacion del fantasma en la matriz
    f2arriba:
        sub f2y,12
        jmp finfantasmita2
    f2derecha:
        add f2x,12
        jmp finfantasmita2
    f2izquierda:
        sub f2x,12
        jmp finfantasmita2
    f2abajo:
        add f2y,12
    finfantasmita2:

    mov ax,f2y
    mov fy,ax
    mov ax,f2x
    mov fx,ax

    mov colorfantasma,0dh
    call dib_fantasma1
    ;comparar el sebtido
    pop sentido
    pop pospacman
    pop si
    pop bx
    pop yi
    pop xi
    pop cx
    ret
  fantasmita2 endp
  ;**************************************************************| FANTASMITA 3 |********
  fantasmita3 proc near
    push cx
    push xi
    push yi
    push bx
    push si
    push pospacman
    push sentido
    lea bx,level1
    ;f3x,f3y son las cordenadas del fantasma
    mov ax,f3x
    mov xi,ax
    mov col,ax
    mov ax,f3y
    mov yi,ax
    mov ren,ax
    mov cx,12
    borrandof3:
    mov color,00
    push cx
    push col
    mov cx,12
    borrandof32:
    call pixel
    inc col
    loop borrandof32
    pop col
    pop cx
    inc ren
    loop borrandof3
    cmp rastrof3,1
       je nohabiapunto3
    call bloques
    nohabiapunto3:
      cmp sentidof3,1
      je f3derecha
      cmp sentidof3,2
      je f3izquierda
      cmp sentidof3,3
      je f3abajo
      cmp sentidof3,4
      je f3arriba
      jmp finfantasmita3
      ;posf1 ubicacion del fantasma en la matriz
    f3arriba:
        sub f3y,12
        jmp finfantasmita3
    f3derecha:
        add f3x,12
        jmp finfantasmita3
    f3izquierda:
        sub f3x,12
        jmp finfantasmita3
    f3abajo:
        add f3y,12
    finfantasmita3:
    mov ax,f3y
    mov fy,ax
    mov ax,f3x
    mov fx,ax

    mov colorfantasma,0bh
    call dib_fantasma1
    ;comparar el sebtido
    pop sentido
    pop pospacman
    pop si
    pop bx
    pop yi
    pop xi
    pop cx
    ret
  fantasmita3 endp
  ;************************************ | PACMAN | *******************************
  PACMAN proc near
    PUSH AX
    PUSH CX
    cmp sentido,5
    je nopintaa
    mov color,00h
    mov r,6
    mov x,6
    mov y,0
    call circulo
    cmp sentido,1
    je avanza1x
    cmp sentido,2
    je retrocede1x
    cmp sentido,3
    je avanza1y
      sub yi,12
      jmp terminado
      avanza1x:

      add xi,12
      jmp terminado
      retrocede1x:
      sub xi,12
      jmp terminado
      avanza1y:
      add yi,12
     terminado:
    mov color,0Eh
    mov r,6
    mov x,6
    mov y,0
    call circulo
    cmp come,1
    je pinta
    mov come,1
    jmp nopinta
    nopintaa:
    jmp nopinta
    pinta:
    cmp sentido,1
    je triangulo11
    cmp sentido,2
    je triangulo21
    cmp sentido,3
    je triangulo31
    call triangulo4 ;subiendo
    mov come,0
    jmp nopinta
    triangulo11:
    call triangulo1 ;avanzando
    mov come,0
    jmp nopinta
    triangulo21:
    call triangulo2 ;retrocediendo
    mov come,0
    jmp nopinta
    triangulo31:
    call triangulo3 ;bajando
    mov come,0
    nopinta:
    POP CX
    POP AX
    RET
  PACMAN ENDP
  ;********************************* | TRIANGULOS |************
  triangulo1 proc near
    push cx
    mov color,00h
    mov ax,yi
    mov ren,ax
    mov ax,xi
    add ax,6
    mov col,ax
    mov cx,6
    push ren
    t11:
    push cx
    push col
    t21:
    call pixel
    dec col
    loop t21
    pop col
    pop cx
    dec ren
    loop t11
    pop ren
    mov cx,6
    t121:
    push cx
    push col
    t211:
    call pixel
    dec col
    loop t211
    pop col
    pop cx
    inc ren
    loop t121
    pop cx
    ret
  triangulo1 endp
  ;-_-_-_-_-_-_-_-_-_-_-_
  triangulo2 proc near
    push cx
    mov color,00h
    mov ax,yi
    mov ren,ax
    mov ax,xi
    sub ax,6
    mov col,ax
    mov cx,6
    push ren
    t1:
    push cx
    push col
    t2:
    call pixel
    inc col
    loop t2
    pop col
    pop cx
    dec ren
    loop t1
    pop ren
    mov cx,6
    t12:
    push cx
    push col
    t22:
    call pixel
    inc col
    loop t22
    pop col
    pop cx
    inc ren
    loop t12
    pop cx
    ret
  triangulo2 endp
  ;_-_-_-_-_-_-_-_-_-_-_-_---
  triangulo3 proc near
    push cx
    mov color,00h
    mov ax,yi
    add ax,6
    mov ren,ax
    mov ax,xi
    mov col,ax
    mov cx,6
    push ren
      t13:
      push cx
      push col
      t23:
        call pixel
         dec col
      loop t23
      pop col
      pop cx
      dec ren
      loop t13
    pop ren
    mov cx,6
      t131:
      push cx
      push col
      t231:
        call pixel
         inc col
      loop t231
      pop col
      pop cx
      dec ren
      loop t131
    pop cx
    ret
  triangulo3 endp
  ;-_-_-_____-_----------------_
  triangulo4 proc near
    push cx
    mov color,00h
    mov ax,yi
    sub ax,6
    mov ren,ax
    mov ax,xi
    mov col,ax
    mov cx,6
    push ren
      t14:
      push cx
      push col
      t24:
        call pixel
         dec col
      loop t24
      pop col
      pop cx
      inc ren
      loop t14
    pop ren
    mov cx,6
      t141:
      push cx
      push col
      t241:
        call pixel
         inc col
      loop t241
      pop col
      pop cx
      inc ren
      loop t141
    pop cx
    ret
  triangulo4 endp
  ;*********************************| dib fantasmita1 |****************************
  dib_fantasma1 proc near
    push cx
    push bx
    push di
    mov ax,fy
    mov ren,ax
    mov ax,fx
    mov col,ax

    mov cx,12
    sub bx,bx
    mov di,0
    lea bx,fantasma1
    PARED13 :
    push cx
      mov cx,12
      push col
      pared23:
         mov dl,fantasma1[di]
         cmp dl,1
         je f1cuerpo
         mov color,dl
         jmp f1pinta
         f1cuerpo:
         mov dl,colorfantasma
         mov color,dl
         f1pinta:
         call pixel
         inc di
         inc col
      loop pared23
      pop col
    pop cx
    inc ren
    loop PARED13
    pop di
    pop bx
    pop cx
    ret
  dib_fantasma1 endp

  respacman proc near
      cmp sentido,1
        je decpospacman
        cmp sentido,2
        je incpospacman
        cmp sentido,3
        je decpospacman53
          ;sentido 4
          add pospacman,106
          jmp nosemovio
          decpospacman:
            dec pospacman
            dec pospacman
           jmp nosemovio
            incpospacman:
            inc pospacman
            inc pospacman
           jmp nosemovio
            decpospacman53:
           sub pospacman,106
        nosemovio:
        ret
  respacman endp
  ;********************************************* |   controla todos    |*********************
  ;********************************************* |   controla pacman   |*********************

  leepacman proc near
    push dx
    push ax
    push si
    push bx
     testt:

       call revisapuntaje
       lea bx,level1
       mov si,pospacman
       mov dx,level1[bx][si]
       cmp dl,1
       jle muevepacman
          call respacman
          jmp nosemueve
       muevepacman:
       cmp level1[bx][si],0
       jne marcado
         inc puntosactuales
         inc puntos
         call monedas;------come puntos--
         cmp puntos,10
         jne falta
          inc puntaje
          mov puntos,0
         falta:
       mov level1[bx][si],1
       marcado:
       call pacman
        nosemueve:
       mov dl,0ffh
       mov ah,06h ;Comprueba el estado del teclado
       int 21h
    jz nohayevento ;Si es cero, sigue esperando
    cmp al,'0'
    je leeend  ;termina cuando se presiona un cero es para prueba
     mov dl,0ffh
     mov ah,06h ;Comprueba el estado del teclado
     int 21h
     jz finlectura
     mov teclact,al
     call ajustasentido
    jmp finlectura
    nohayevento:
    call ajustasentido
    jmp finlectura
    leeend:
    mov sentido,7
    finlectura:
    pop bx
    pop si
    pop ax
    pop dx
    ret
  leepacman endp
  ;************************** | revision del puntaje |
  revisapuntaje proc near
    push cx
    push ax
    push dx

      mov renc,1
      mov colc,0
      call POS_CUR
      lea dx,mensaje1
      call escribemen
      mov colc,10
      call POS_CUR
      mov ah,0
      mov cx,puntaje ;tengo los 8 nibles, usar clc
      mov al,cl ;primer nible
      and al,0fh
      mov dl,al
      cmp dl,9
      jle a0notienacarreo
      mov ah,1
      add dl,6
      and dl,0fh
   a0notienacarreo:
   mov datos[15],dl
     call escribe
     mov al,cl  ;2do nible
     mov cl,4
     shr al,cl
     mov dl,aL
     add dl,ah
      mov ah,0
     cmp dl,9
     jle a1notienacarreo
      mov ah,01
      add dl,6
      and dl,0fh
   a1notienacarreo:
     dec colc
     call pos_cur
     mov datos[14],dl
     call escribe
     mov al,ch ;3er nible
     and al,0fh
     mov dl,aL
     add dl,ah
       mov ah,0
     cmp dl,9
     jle a2notienacarreo
      mov ah,01
      add dl,6
      and dl,0fh

   a2notienacarreo:
      dec colc
     call pos_cur
     mov datos[13],dl
     call escribe
     mov aL,ch ;4to nible
     mov cL,4
     shr aL,cl
     mov dl,al
     add dl,ah
     mov ah,0
     cmp dl,9
     jle a3notienacarreo
      mov ah,01
      add dl,6
      and dl,0fh
   a3notienacarreo:
      dec colc
     call pos_cur
     mov datos[12],dl
     call escribe
    pop dx
    pop ax
    pop cx
    ret
  revisapuntaje endp

  escribe proc near
    push ax
    push dx
    add dl,30h
    mov ah,02
    int 21h
    pop dx
    pop ax
    ret
  escribe endp
  ;********************************************* | controla fantasma3  |****************************
  leefantasma3 proc near
    push cx
    push bx
    push si
    push pospacman
    push sentido
    push xi
    push yi
    mov ax,posf3
    mov pospacman,ax
    mov ax,sentidof3
    mov sentido,ax
     ;testt:
       lea bx,level1
       mov si,pospacman ;tengo que verificar si se puede mover en la nueva direccion
       mov dx,level1[bx][si]
          ;add dl,30h
          ;call POS_CUR
          ;mov ah,02
       	   ;int 21h
          ;mov si,pospacman
          ;mov dl,level1[bx][si]
       cmp dl,1
       jle muevefantasma3
              call respacman ;deshace los cambios
               mov si,pospacman
              mov ax,level1[bx][si] ;
              mov rastrof3,al
             jmp nosemuevef3
          ;******valida posicion del pacman

       muevefantasma3:
       mov ax,level1[bx][si] ;
       mov rastrof3,al
       call fantasmita3
        call retraso
        nosemuevef3:
       ;mov dl,0ffh
       ;mov ah,06h ;Comprueba el estado del teclado
       ;int 21h
       ;jz nohayeventof1 ;Si es cero, sigue esperando
       ;cmp al,'0'
       ;je finfantasma3  ;termina cuando se presiona un cero es para prueba
       ;mov dl,0ffh
        ;mov ah,06h ;Comprueba el estado del teclado
       ;int 21h
       ;jz leefantasma1fin;
        mov maxim,4
        call generaaleat
        mov sentido,ax
        cmp  sentido,4
        je arribaf3
        cmp  sentido,2
     je  izquierdaf3
      cmp  sentido,1
      je derechaf3
      mov sentido,3
      add pospacman,106   ;ajusto la nueva posicion de pacman en la matriz
      jmp leefantasma3fin
      arribaf3:
      mov sentido,4
      sub pospacman,106 ;ajusto la posicion del pacman
      jmp leefantasma3fin
      izquierdaf3:
          dec pospacman
          dec pospacman
        mov sentido,2
       jmp leefantasma3fin
      derechaf3:
      mov sentido,1
      inc pospacman
      inc pospacman
      jmp leefantasma3fin
    jmp leefantasma3fin
     finfantasma3:
     mov sentidof3,7
     jmp fantasma2listo
    leefantasma3fin:
    mov ax,sentido
    mov sentidof3,ax
    fantasma3listo:
    mov ax,pospacman
    mov posf3,ax

    pop yi
    pop xi
    pop sentido
    pop pospacman
    pop si
    pop bx
    pop cx
    ret
  leefantasma3 endp
  ;********************************************* | controla fantasma2  |****************************
  leefantasma2 proc near
    push cx
    push bx
    push si
    push pospacman
    push sentido
    push xi
    push yi
    mov ax,posf2
    mov pospacman,ax
    mov ax,sentidof2
    mov sentido,ax
     ;testt:
       lea bx,level1
       mov si,pospacman
       mov dx,level1[bx][si]
       cmp dl,1
       jle muevefantasma2
              call respacman ;deshace los cambios
              mov si,pospacman
              mov ax,level1[bx][si] ;
              mov rastrof2,al
             jmp nosemuevef2
          ;******valida posicion del pacman

       muevefantasma2:
       mov ax,level1[bx][si] ;
       mov rastrof2,al
       call fantasmita2
        call retraso
        nosemuevef2:

        mov maxim,4
        call generaaleat
        mov sentido,ax
        cmp  sentido,4
        je arribaf2
        cmp  sentido,2
     je  izquierdaf2
      cmp  sentido,1
      je derechaf2
      mov sentido,3
      add pospacman,106   ;ajusto la nueva posicion de pacman en la matriz
      jmp leefantasma2fin
      arribaf2:
      mov sentido,4
      sub pospacman,106 ;ajusto la posicion del pacman
      jmp leefantasma2fin
      izquierdaf2:
          dec pospacman
          dec pospacman
        mov sentido,2
       jmp leefantasma2fin
      derechaf2:
      mov sentido,1
      inc pospacman
      inc pospacman
      jmp leefantasma2fin

    jmp leefantasma2fin
     finfantasma2:
     mov sentidof2,7
     jmp fantasma2listo
    leefantasma2fin:
    mov ax,sentido
    mov sentidof2,ax
    fantasma2listo:
    mov ax,pospacman
    mov posf2,ax
    pop yi
    pop xi
    pop sentido
    pop pospacman
    pop si
    pop bx
    pop cx
    ret
  leefantasma2 endp
  ;********************************************* | controla fantasma1  |****************************
  leefantasma1 proc near
    push cx
    push bx
    push si
    push pospacman
    push sentido
    push xi
    push yi
    mov ax,posf1
    mov pospacman,ax
    mov ax,sentidof1
    mov sentido,ax
       mov si,pospacman
       mov dx,level1[bx][si]
       cmp dl,1
       jle muevefantasma1
              call respacman ;deshace los cambios
              mov si,pospacman
              mov ax,level1[bx][si] ;
              mov rastrof1,al
             jmp nosemuevef1
          ;******valida posicion del pacman

       muevefantasma1:
       mov ax,level1[bx][si] ;
       mov rastrof1,al
       call fantasmita1
        call retraso
        nosemuevef1:

        mov maxim,4
        call generaaleat
        mov sentido,ax
        cmp  sentido,4
        je arribaf1
        cmp  sentido,2
     je  izquierdaf1
      cmp  sentido,1
      je derechaf1
      mov sentido,3
      add pospacman,106   ;ajusto la nueva posicion de pacman en la matriz
      jmp leefantasma1fin
      arribaf1:
      mov sentido,4
      sub pospacman,106 ;ajusto la posicion del pacman
      jmp leefantasma1fin
      izquierdaf1:
          dec pospacman
          dec pospacman
        mov sentido,2
       jmp leefantasma1fin
      derechaf1:
      mov sentido,1
      inc pospacman
      inc pospacman
      jmp leefantasma1fin
     finfantasma:
     mov sentidof1,7
     jmp fantasma1listo
    leefantasma1fin:
    mov ax,sentido
    mov sentidof1,ax
    fantasma1listo:
    mov ax,pospacman
    mov posf1,ax

    pop yi
    pop xi
    pop sentido
    pop pospacman
    pop si
    pop bx
    pop cx
    ret
  leefantasma1 endp
  ;*****************************| retraso |**************
  retraso proc near
    push cx
    mov cx,0000000011111111b
    cicl1:
      push cx
      mov cx,0000000000111111b
      cicl12:
      loop cicl12
      pop cx
    loop cicl1
    pop cx
    ret
  retraso endp
  ;************************| ajusta sentido |***************
  ajustasentido proc near
    cmp  teclact,'H'
     je arriba
     cmp  teclact,'K'
     je  izquierda
      cmp  teclact,'M'
      je derecha
      mov sentido,3
      add pospacman,106   ;ajusto la nueva posicion de pacman en la matriz
      jmp sentidoajustado
      arriba:
      mov sentido,4
      sub pospacman,106 ;ajusto la posicion del pacman
      jmp sentidoajustado
      izquierda:
          dec pospacman
          dec pospacman
        mov sentido,2
       jmp sentidoajustado
      derecha:
      mov sentido,1
      inc pospacman
      inc pospacman
     sentidoajustado:
    ret
  ajustasentido endp
  ;************************************ | FONDO | *******************************
  fondo proc near
    push si
    push bx
    push xi
    push yi
    mov xi,0
    mov yi,60
    lea bx,level1
    mov si,0
    mov cx,30
     fond1:
     push cx
     mov cx,53
     fond12:
     push cx
     push xi
     push yi
      mov dx,level1[bx][si]
      cmp dl,0
      je camino
      cmp dl,2
      je next1
      mov color,dl
      call limites
      jmp next1
      camino:
      call bloques
      jmp next1

        next1:
      pop yi
     pop xi
      add xi,12
      inc si
      inc si
      pop cx
      loop fond12
       pop cx
       ;add si,44
       add yi,12
       mov xi,0
    loop fond1

    pop yi
    pop xi
    pop bx
    pop si
    ret
  fondo endp
  ;******************************| lineas |*****************
  limites proc near
    push cx
    mov ax,xi
    mov col,ax
    mov ax,yi
    mov ren,ax
    mov cx,12
    line122:
    push cx
    push col
     mov cx,12
     line1223:
     mov color,cl
     call pixel
    inc col
     loop line1223
    pop col
    pop cx
    inc ren
    loop line122
    pop cx
    ret
  limites endp
  ;******************************| Bloques |*****************
  bloques proc near
    push cx
    add xi,6
    add yi,6
    mov r,2
    mov x,2
    mov y,0
    mov color,9ch
    call circulo
    nomore:
    pop cx
    ret
  bloques endp
  ;***************________________________________________________*************
  rectangulo proc near
    push ren
    push col
    mov cx,33
    rectangulo1:
    	push cx
    	push col
    	mov cx,100
    	rectangulo2:

    		call pixel
    		inc col
    	loop rectangulo2
    	pop col
    	pop cx
    	inc ren
    loop rectangulo1
    pop col
    pop ren
    ret
  rectangulo endp
  ;******************* |   MENU  	|
   menu proc near

    mov ren,5
    mov col,150
    	mov color,06h
      call rectangulo
     mov col,100
      call rectangulo
      mov renc,1
      mov colc,15
      call pos_cur
      lea dx,gamename
      call escribemen
      	mov color,04h
     mov ren,72
     mov col,150
     call rectangulo
     mov ren,183
     call rectangulo
     mov renc,5
     mov colc,20
     call pos_cur
     lea dx,menjuega
     call escribemen
     mov renc,12
     call pos_cur
     lea dx,mensal
     call escribemen
     call abrir_archivo
     call leer_archivo
     mov renc,1
     mov colc,38
     call pos_cur
     lea dx,letrero
     call escribemen
     call imprimir_Archivo
     ret
    menu endp
  ;*********************** control del mouse ******************
  lectura_mouse proc near
   CALL Inicia_MOUSE   		 	;servicion 00 incicializa/deshabilita mouse
     CMP AX,00      			;devuelve 00 si no esta disponible
     JE ERROR
     ;call fija_limite_hor
     ;call fija_limite_ver
     CALL DESP_MOUSE  		;servicio 01 int 33h muestra le puntero
     call menu
     mov renc,2
     mov colc,10
     OTRO:            		;servicio 01 int 33h lo oculta
     CALL ESTADO_MOUSE    	; SERVICIO 03 lee estado de los botones BX, CX->X, DX->Y
     mov colc,10
     mov renc,0
     cmp XB,150
     jl otro
     cmp xb,250
     jg otro
     cmp yb,72
     jl otro
     cmp yb,216
     jg otro
     cmp yb,103
     jle jugarselect
     cmp yb,183
     jge salirselect
   JMP OTRO
   jugarselect:
   cmp bx,1
   jne otro
   mov ah,1  ;aqui poner seleccion en 1
   jmp exit
   salirselect:
   cmp bx,1
   jne otro
    mov ah,2 ;aqui poner se seleccionosali
   jmp exit
    ERROR: LEA DX,MEN1
    CALL escribemen
    mov ah,3
    mov ah,01
    int 21h
    EXIT:
    CALL oculta_MOUSE
    ret
  lectura_mouse endp
  ;****************** inicia mouse *******

  Inicia_MOUSE PROC NEAR
    MOV AX,00
    INT 33H
    RET
  Inicia_MOUSE ENDP

  DESP_MOUSE PROC NEAR
    PUSH AX
    MOV AX,01H
    INT 33H
    POP AX
    RET
  DESP_MOUSE ENDP
  oculta_MOUSE PROC NEAR
    PUSH AX
    MOV AX,02H
    INT 33H
    POP AX
    RET
  oculta_MOUSE ENDP

  ESTADO_MOUSE PROC NEAR
   ;La subrutina devuelve XB,YB
   MOV AX,03 ;RETORNA BX = Edo DE LOS BOTONES Y
   INT 33H ;RETORNA CX= COORD X, DX= COORD Y
   MOV XB,CX ;REFRESCO DE COORDENADAS
   MOV YB,DX
  	RET
  ESTADO_MOUSE ENDP
  ;***************************************| posc. cursor |******************
  POS_CUR PROC near
    PUSH AX
    PUSH BX
    PUSH DX
    MOV AH,02
    MOV BH,0
    MOV DH,renc
    MOV DL,colc
    INT 10h
    POP DX
    POP BX
    POP AX
    RET
  POS_CUR ENDP

  ;*******************************  MODOVIDEO ************************

  modovideo PROC NEAR
    PUSH AX
    MOV AH,00H
    MOV AL,mode
    INT 10H
    POP AX
    RET
  modovideo ENDP
  ;******************************_____________________________-**************************


  ;******************************_____RESTABLECE MODO VIDEO_______-**************************
  actual proc near
    push ax
    MOV AH,0Fh
    INT 10H
    mov act,al
    pop ax
    ret
  actual endp
  ;************************| ALEATORIO |*********
  generaaleat proc near
     CALL SEMILLA
     CALL ALEATORIO
     cALL ESCALANDO
     ret
  generaaleat endp

  ALEATORIO PROC near
    ; XN+1=(2053*XN + 13849)MOD (2**16-1)
    ; RETORNA EL NUMERO PSEUDOALEATORIO EN AX
    MOV AX,DX ;CARGANDO A AX EL NUMERO SEMILLA tomado de la int 21 serv 2CH
    MOV DX,0  ;CARGANDO CERO EN LA POSICION MAS SIGNIFICATIVA DEL MULTIPLICANDO
    MOV BX,2053 ; MULTIPLICADOR
    MUL BX
    MOV BX,13849 ;CARGA EN BX LA CONSTANTE ADITIVA
    CLC
    ADD AX,BX ; ax PARTES MENOS SIGNIFICATIVAS DEL RESULTADO
    ADC DX,0 ; ax EL ACARREO SI ES NECESARIO
    MOV BX,0FFFFH   ; CARGAR LA CONSTANTE 2**16-1
    DIV BX
    MOV AX,DX  ;MUEVE EL RESIDUO  AX
    RET
  ALEATORIO ENDP

  ;*******************************************************
  ;******************************_____SEMILLA______-**************************

  SEMILLA PROC near
    PUSH AX
    MOV AH,2CH
    INT 21H  ; RETORNA CH=HORAS, EN FORMATO 00-23, MEDIANOCHE=0
             ; CL MINUTOS 00-59
             ;DH SEGUNDOS 00-59
             ;DL CENTESIMAS DE SEGUNDO 00-99
    POP AX
    RET
  SEMILLA ENDP

  ;**********************************************************
  ;******************************____ESCALANDO__-**************************

  ESCALANDO PROC near
     ; ESCALANDO EL NUMERO PSEUDOALEATORIO OBTENIDO
     MOV DX,0
     MOV BX,maxim ;NUMEROS ALEATORIOS ENTRE 1 Y maximo
     DIV BX
     MOV AX,DX
     add ax,1
     RET
  ESCALANDO ENDP
  ;*************************************************************

  ;****************| Circulo |****************
  circulo proc   near
    push ax
    push dx
    push bx
    push cx

    while1:
      cmp x,00
      je fin
      mov ah,r
      cmp y,ah; y<=r
      jg fin
      while2:
        mov ax,0
        mov al,x
        call pot
        mov xx,ax;x^2
        mov al,y
        call pot
        mov yy,ax;y^2
        mov al,r
        call pot
        mov rr,ax;r^2
        mov ax,xx
        add ax,yy
        ;mov resta,ax
        inc rr
        sub ax ,rr
        cmp ax,1
        jle incy
        mov ax,xx
        add ax,yy
        inc ax
        dec rr
        sub ax,rr
        cmp ax,1
        jle incy
        dec x
        jmp while2
       incy:
         call dibuja
         inc y
         jmp while1
    fin:
      pop cx
      pop bx
      pop dx
      pop ax
    ret
  circulo endp
  ;******************************__________DIBUJA__________-**************************

  dibuja proc near
    push ax
    push bx
         mov bh,0
        ;**°| [centro[1]+y][centro[0]+x]=1 |**
      mov ax,xi
      mov bl,x
      add ax,bx
      mov col,ax
      mov temp2,ax
      mov ax,yi
      mov bl,y
      add ax,bx
      mov ren,ax
      call pixel

      ;*************************************
      mov ax,xi
      mov bl,x
      sub ax,bx
      mov col,ax
      mov temp1,ax
      mov ax,yi
      mov bl,y
      add ax,bx
      mov ren,ax
     call pixel

      mov ax,temp2
      mov bx,temp1
      sub ax,bx
      mov cx,ax
      llena1:
      mov col,bx
       call pixel
      inc bx
      loop llena1
       mov bx,temp1
      mov cx,ax
      inc cx
      mov ah,0
        mov al,y
      sub ren,ax
      sub ren,ax
      llena2:
       mov col,bx
      call pixel
       inc bx
      loop llena2

      pop bx
    pop ax
    ret
  dibuja endp
  ;******************************__________PIXEL_____________-**************************

  PIXEL PROC near
    push ax
    push cx
    push bx
    ;Subrutina píxel
    MOV AH,0CH
    MOV AL,COLOR
    MOV BH,0
    MOV CX,col
    MOV DX,ren
    INT 10H
    pop bx
    pop cx
    pop ax
    RET
  PIXEL ENDP

  pot proc near
    push bx
    mov bl,al
    mul bl
    pop bx
    ret
  pot endp

  sonido_fondo PROC
    push cx
    mov cx,20
    ciclo:
      mov tiempo,5
      mov frecuencia,2666
      call sonido
      mov tiempo,2
      mov frecuencia,5666
      call sonido
    loop ciclo
    pop cx
    ret
  sonido_fondo endp

  sonido_perdiste proc
    push dx
    mov cx,10
    c2:
      mov tiempo,2
      mov frecuencia,1900
      call sonido
      mov tiempo,2
      mov frecuencia,4800
      call sonido
    loop c2
    mov tiempo,4
    mov frecuencia,900
    call sonido
    mov tiempo,2
    mov frecuencia,4800
    call sonido
    pop cx
    ret
  sonido_perdiste endp

  sonido proc
    c:
    cmp tiempo,0
    je s
    call tono
    sub frecuencia,75
    dec tiempo
    jmp c
    s:ret
  sonido endp

  tono proc
    push cx
    push ax
    push bx
    push dx
    mov al,182
    out 43h,al
    mov ax,frecuencia
    ;1777
    ; 100 monedas
    ; 177
    ;1777
    out 42h,al
    mov al,ah
    out 42h,al
    in al,61h
    or al,00000011b
    out 61h,al
    mov bx,1
    pausa1:
    mov cx,65535
    pausa2:
    dec cx
    jne pausa2
    dec bx
    jne pausa1
    in al,61h
    and al,11111100b
    out 61h,al
    pop dx
    pop bx
    pop ax
    pop cx
    ret
  tono endp
  monedas PROC
    mov frecuencia,1777
    call tono
    ret
  monedas endp
  end main
