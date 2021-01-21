; CREA ARCHIVO
 .model small
 .stack 100h
 .data

nombre  db      "creado.txt",00h    ;especificar directorio del archivo
maneja  dw      ?
.code
  algo  proc near
    mov ax,@data
    mov ds,ax
    mov ah,3ch
    mov cx,00
    lea dx,nombre
    int 21h
    jc salir
    mov maneja,ax
    salir:  mov ax,4c00h
    int 21h
  endp
end     algo
