.model small
.stack
.data
  men1 db 'a > b$'
  men2 db 'a < b$'
  men3 db 'son iguales$'
  .code
  inicio:
    mov ax,@data
    mov ds,ax
    mov ax,4
    mov bx,4
    cmp ax,bx
    jg mayor
    jl menor
    je iguales
    
    mayor:
      lea dx,men1
      call imprimir
      jmp fin

    menor:
      lea dx,men2
      call imprimir
      jmp fin

    iguales:
      lea dx,men3
      call imprimir
      jmp fin

    imprimir:
      mov ah,9h
      int 21h
      ret

    fin:
      mov ax,4c00h
      int 21h

      mov ax,4c00h
      int 21h

    end inicio
