;Realice un programa que almacene en la variable inv el contenido invertido
;de la variable var, de acuerdo AL siguiente formato:
;var = b7b6b5b4b3b2b1b0 ? inv = b0b1b2b3b4b5b6b7

.model small
.stack 100h
.data
;VARIABLES
  var DB 11000101b
  inv DB ?
;----------------------------------------

.code
inicio:
  
  ;Inicializacion de segmento de datos
  MOV AX, @data
  MOV DS, AX
  ;-----------------------------------
  
  MOV AL, var
  MOV CX, 8
  
siguiente:
  SHR AL, 1
  RCL AH, 1
  
  LOOP siguiente
  
  MOV inv, AH
  
  ;Impresion en pantalla
  ;MOV AH, 09h
  ;INT 21h
  ;---------------------
  
  MOV AH, 4C00h
  INT 21h
  
  
END inicio