; escribe  y lee de un archivo
include macr.h
 .model small
 .stack 100h
 .data
  bufer db 81 dup (50)
  aux DB 3 dup(0)
  punto DB 3 dup(0)
  datos DB 16 dup(?),13,10
  handle  dw ?
  filename  db "score.txt",0h
  saltillo db 0
 .code
    main  proc near
      push ds
      sub ax,ax
      push ax
      mov ax,@data
      mov ds,ax
      mov es,ax

      call archivo
      salir
    main endp
    archivo PROC
      call abrir_archivo
      call leer_archivo
      ;call mover_apuntador_archivo
      ;call escribir_archivo
      call cerrar_archivo
      call imprimir_Archivo
      ret
    archivo endp
    nombre_usuario proc
      push si
      mov si,0
      usuario:
          LEER_CARACTER
          CMP al,46
          je exit
          mov datos[si],al
          inc si
      jmp usuario
      exit:
      pop si
      ret
    nombre_usuario endp
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
    imprimir_Archivo proc
      mov si,0
      mov saltillo
      whil:
        cmp bufer[si],'$'
        je exito
        cmp saltillo 16
        je m
        jmp imp
      m:;posiciona columna inicial
        mov saltillo,0
        imp:
        print_caracter bufer
        inc si
      jmp whil
      exito:
      ret
    imprimir_Archivo endp
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

  end main
