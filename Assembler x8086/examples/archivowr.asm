.model small
.stack 100h
.data
  nombre  db  "nuevo1.txt",00h
  texto   db  "ABCDEFGHIJKLMNOPQRSTUVWXYZ$",10,13
  maneja  dw  ?
.code algo
proc   near
  mov  ax,@data
  mov  ds,ax
  mov  ah,3ch
  mov  cx,00
  lea  dx,nombre
  int  21h
  jc   salir
  mov  maneja,ax
  mov  cx,10
nuevo:
  push cx
  mov  ah,40h
  mov  bx,maneja
  mov  cx,28
  lea  dx,texto
  int  21h
  pop  cx
  loop nuevo
  mov  ah,3eh
  mov  bx,maneja
  int  21h
salir:
  mov  ax,4c00h
  int  21h
endp
end    algo
