; escribe  y lee de un archivo
include macr.h
 .model small
 .stack 100h
 .data
    frecuencia dw 0
    tiempo db 0
 .code
    main  proc near
      push ds
      sub ax,ax
      push ax
      mov ax,@data
      mov ds,ax
      mov es,ax

      call tono
      salir
main endp
  monedas PROC
    mov frecuencia,1777
    call tono
    ret
  monedas endp
  sonido_fondo PROC
    mov cx,20
    ciclo:
      mov tiempo,5
      mov frecuencia,2666
      call sonido
      mov tiempo,2
      mov frecuencia,5666
      call sonido
    loop ciclo
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
  end main
