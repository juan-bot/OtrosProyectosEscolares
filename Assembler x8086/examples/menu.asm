  STACKSG segment para stack 'stack'
  DB 20 DUP (0)
  STACKSG ENDS
  DATASG SEGMENT PARA 'DATA'
    MENU db 'Ingresa una opcion valida: 1,2,3 o 4 (5:salir)$'
    MEN1 DB 'Ingresa la cadena$'
    men3 db   'Presiona [enter]$'
    NUMEROS DB'Numeros ingresados :$'
    IN_NUM DB'Ingresa la cantidad de numeros:$'
    LETRAS DB' Letras ingresadas :$'
    men2 DB'Ingresa el numero de datos a leer:$'
    IN_NUM2 DB'Ingresa el numero:$'
    comas db ' $'
    men4 DB' Total pares :$'
    npares db'Numeros pares: $'
    cont db 0
    n db 0
    SALTO db 13, 10,'$'
    x db 0
    k db 0
    l db 0
    n1 db 0
  DATASG ENDS
  CODESG SEGMENT PARA 'CODE'
    INICIO PROC FAR
      ASSUME SS:STACKSG, DS:DATASG,CS:CODESG
      PUSH DS
      SUB AX,AX
      PUSH AX
      MOV AX,SEG DATASG
      MOV DS,AX

  MOSTRAR_MENU:
      call LIMPIA_PANTALLA
      call POSICIONA_CURSOR
      mov dx, offset MENU
      mov ah,09
      int 21h
      mov dx, offset SALTO
      mov ah,09
      int 21h
      CALL LEER_CARACTER
      mov dx, offset SALTO
      mov ah,09
      int 21h
      CMP al,49
      JE OPC1
      CMP al,50
      JE OPC_22
      CMP al,51
      JE OPC_3
      CMP al,52
      JE OPC_4
      cmp al,53
      je res2
      jmp MOSTRAR_MENU

OPC1:

          mov dx, offset men2
          mov ah,09
          int 21h
          mov dx, offset salto
          mov ah,09
          int 21h
          Call Empaqueta
          mov cont,al
          mov si,110
          mov n1,0
        CICLO:
          mov dx, offset salto
          mov ah,09
          int 21h
          cmp cont,0
          je IMPRIME_PARES1
          sub cont,1
          mov dx, offset IN_NUM2
          mov ah,09
          int 21h
          mov dx, offset salto
          mov ah,09
          int 21h
          Call Empaqueta
          mov ch,al
          mov bh,02
          div bh
          cmp ah,0
          je PAR
          jmp CICLO
          opc_2:
  res2: jmp res
  opc_22 : jmp opc_222
  OPC_4: jmp opc4
  IMPRIME_PARES1:jmp IMPRIME_PARES
  OPC_3:
          mov k,0
          mov x,0
        CICLO2:
          mov dx, offset salto
          mov ah,09
          int 21h
          cmp k,10
          Jg RES1
          inc x
          inc k
          mov al,05
          imul x
          mov cx,100
          sub cx,ax
          mov ax,cx
          mov bh,10
          div bh
          mov dl,ah
          call BIN_ASCII
          CALL IMPRIME
          JMP CICLO2
        RES:
          call salir
        res1:
          mov dx, offset salto
          mov ah,09
          int 21h
          mov dx, offset men3
          mov ah,09
          int 21h
          mov dl,n1
          call desempaqueta
          mov dx, offset salto
          mov ah,09
          int 21h
          jmp MOSTRAR_MENU
        PAR:
          mov dl,ch
          call desempaqueta2
          inc n
          inc n1
          jmp CICLO
        IMPRIME_PARES:

          mov si,110


        while:
          cmp n,0
          je res1
          sub n,1
          mov dl,[si]
          call BIN_ASCII
          CALL IMPRIME
          inc si
          mov dl,[si]
          call BIN_ASCII
          CALL IMPRIME
          mov dx, offset comas
          mov ah,09
          int 21h
          inc si
          jmp while
    opc_222:jmp opc2
    OPC4:
        mov n,0
        mov l,0
        mov dx, offset MEN1
        mov ah,09
        int 21h
        mov dx, offset SALTO
        mov ah,09
        int 21h
        mov cl,00
        mov ch,00
    LEER:
        CALL LEER_CARACTER
        CMP al,46
        je exit
        CMP al,57
        JLE COMPARA_NUM
        CMP al,90
        JLE COMPARA_LETRA
        CMP al,122
        JLE COMPARA_LETRAmayuscula
        jmp LEER
    COMPARA_LETRAmayuscula:
      CMP al,97
      JGE CONT_LETRA
      jmp LEER
    COMPARA_LETRA:
      CMP al,65
      JGE CONT_LETRA
      jmp LEER
    COMPARA_NUM:
        CMP al,48
        JGE CONT_NUM
        jmp LEER
    CONT_NUM:
        inc n1
        jmp LEER
    CONT_LETRA:
        inc l
        jmp LEER
    exit:
      mov dx, offset SALTO
      mov ah,09
      int 21h
      mov dx, offset NUMEROS
      mov ah,09
      int 21h
      mov dl,n1
    CALL  DESEMPAQUETA

      mov dx, offset SALTO
      mov ah,09
      int 21h
      mov dx, offset LETRAS
      mov ah,09
      int 21h
      mov dh,l
    call DESEMPAQUETA

      call res1
opc2:
      mov bx,0
      mov cx,0
      mov dx,0
    ciclon:
      cmp cx,100
      je print
      inc cx
      mov ax,cx
      mov bh,02
      div bh
      cmp ah,0
      je PAR2
      jmp ciclon
print:
      mov bx,dx
      mov dl,bh
      call desempaqueta
      mov dl,bl
      call desempaqueta
      mov dx, offset salto
      mov ah,09
      int 21h
      mov dx, offset men3
      mov ah,09
      int 21h
      CALL LEER_CARACTER
      jmp MOSTRAR_MENU
  par2:
      add dx,cx
      jmp ciclon

    INICIO ENDP
      IMPRIME PROC
        push ax
        mov ah,02
        int 21h
        pop ax
        RET
      IMPRIME ENDP
      LEER_CARACTER PROC
        mov ah,01
        int 21h
        RET
      LEER_CARACTER ENDP
      SALIR PROC
        pop ax
        mov ax,4c00h
        int 21h
        RET
      SALIR ENDP
      BIN_ASCII PROC
        cmp dl,9h
        jg SUMA37
        add dl,30h
        jmp fin1
    SUMA37: add dl,37h
    fin1: ret
    BIN_ASCII ENDP
    ASCII_BIN PROC
      cmp al,30h
      jl ERROR
      cmp al,39h
      jg LETRA
      sub al,30h
      jmp FIN
    LETRA:
      cmp al,41h
      jl ERROR
      cmp al,46h
      jg ERROR
      sub al,37h
      jmp FIN
    ERROR:
      mov al,0
    FIN:
      RET
    ASCII_BIN ENDP
    Empaqueta PROC
      Push cx
      Call LEER_CARACTER
      Call ASCII_BIN
      Mov cl,04
      Shl al,cl
      Mov ch,al
      Call LEER_CARACTER
      Call ASCII_BIN
      Add al,ch
      Pop cx
      RET
    Empaqueta ENDP
    DESEMPAQUETA PROC
      Push dx
      Push cx
      Mov dh,dl
      Mov cl,4
      Shr dl,cl
      Call BIN_ASCII
      Call IMPRIME
      Mov dl,dh
      And dl,0Fh
      Call BIN_ASCII
      Call IMPRIME
      Pop cx
      Pop dx
      RET
    desempaqueta ENDP
    DESEMPAQUETA2 PROC
      Push dx
      Push cx
      Mov dh,dl
      Mov cl,4
      Shr dl,cl
      mov [si],dl
      inc si
      Mov dl,dh
      And dl,0Fh
      mov [si],dl
      inc si
      Pop cx
      Pop dx
      RET
    desempaqueta2 ENDP
    LIMPIA_PANTALLA PROC
      PUSH AX
      PUSH BX
      PUSH CX
      PUSH DX
      MOV AX,0600h
      MOV BH,03h
      MOV CX,0000h
      MOV DX,184Fh
      INT 10H
      POP DX
      POP CX
      POP BX
      POP AX
      RET
    LIMPIA_PANTALLA ENDP
    POSICIONA_CURSOR PROC
      PUSH AX
      PUSH BX
      PUSH DX
      MOV AH,02h
      MOV BH,0
      MOV DH,0
      MOV DL,0
      INT 10H
      POP DX
      POP BX
      POP AX
      RET
    POSICIONA_CURSOR ENDP
  CODESG ENDS
  END INICIO
