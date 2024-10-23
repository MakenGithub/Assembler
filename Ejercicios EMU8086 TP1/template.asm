.model small
.stack 100h
.data
;VARIABLES
;----------------------------------------

.code

inicio:
  
  ;Inicializacion de segmento de datos
  MOV AX, @data
  MOV DS, AX
  ;-----------------------------------
  
  ;Impresion en pantalla
  ;MOV AH, 09h
  ;INT 21h
  ;---------------------
  
  MOV AX, 4C00h
  INT 21h
  
  
END inicio