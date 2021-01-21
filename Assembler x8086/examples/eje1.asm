include bifun.asm
.model small
  extrn leer_car_con_eco:near
  extrn leer_car_sin_eco:near
  extrn escribe_car:near
  extrn escribe_cadena:near
  extrn alimentar_linea: near
  extrn SALIR : near
.stack 64
.data
  MEN1 DB ' HOLA MUNDO SOY ESTUDIANTE DE INGENIERIA DE LA UTM$'
  SALTA db 13, 10,'$'
  MEN2 DB 'ADIOS$'
.code

PRINCI PROC FAR
;PROTOCOLO
  push ds
  sub ax,ax
  push ax
  MOV AX,@DATA
  MOV DS,AX

    LEA DX, MEN1
    CALL ESCRIBE_CADENA
    CALL LEER_CAR_CON_ECO
    call salir

  PRINCI ENDP
END PRINCI
