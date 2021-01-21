  ;PROGRAMA QUE MUESTRA EL MODO DE VIDEO Y PINTA UN PUNTO
include macv.h
  ; Definicion de stack
  .MODEL small
  .STACK  100
  .DATA
    Modo1 db "Modo Grafico. 40x25. 256 colores. 320x200 pixels. 1 Pagina$", 0
    Modo2 db "Modo Texto. 80x25. 16 colores. 8 Paginas$",0
    Modo3 db "Modo Texto. 40x25. 16 colores. 8 Paginas$", 0
    MODEACT DB ?
    MODE DB ?
    COLOR db ?
    COL DW ?
    REN DW ?
  .CODE
  PRINCI PROC FAR
     push ds
     sub ax,ax
     push ax
     MOV AX,@DATA
     MOV DS,AX
;INICIA PROGRAMA
  	 CALL ACTUAL
  	 MOV MODEACT,AL
;Convetimos al Modo Grafico. 40x25. 256 colores. 320x200 pixels. 1 Pagina
  	 mov MODE, 13h
  	 CALL MODOVIDEO

  	mov dx, offset Modo1
  	mov ah, 9
  	int 21h
  	mov ah, 0
  	int 16h
    PIXEL 04H,160,100 ;invocamos a la macro
  	mov ah, 0
  	int 16h

;RESTAURACI�N DEL MODO DE VIDEO INICIAL
  	MOV AL, MODEACT
  	mov MODE, AL
  	CALL MODOVIDEO
  	ret
  PRINCI ENDP


  ACTUAL PROC
    MOV AH,0Fh
    INT 10H
    RET
  ACTUAL ENDP

  MODOVIDEO PROC
  	mov al, MODE
  	mov ah, 0
  	int 10h
    RET
  MODOVIDEO ENDP

  ESCRIBE PROC
     MOV AH,02
     INT 21H
     RET
  ESCRIBE ENDP

  SALIR_DOS PROC
     MOV AH,4CH
     INT 21H
     RET
  SALIR_DOS ENDP

  LEE PROC
     MOV AH,01
     INT 21H
     RET
  LEE ENDP

  POS_CUR PROC
    PUSH AX
    PUSH BX
    PUSH DX
    MOV AH,02
    MOV BH,0
    MOV DH,05
    MOV DL,20
    INT 10h
    POP DX
    POP BX
    POP AX
    RET
  POS_CUR ENDP


  END PRINCI
