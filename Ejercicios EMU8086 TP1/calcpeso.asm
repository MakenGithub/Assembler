.model small
.stack 100h
.data
;VARIABLES
msg_nombre DB 'Ingrese su nombre: $'
msg_peso DB 'Ingrese su peso en Kilos: $'
newline DB 0Dh, 0Ah, '$'

saludo DB 'Hola: $'
peso_calc DB 0Dh, 0Ah, 'Tu peso es: $'


peso DB 10
     DB ?
     DB 10 dup('$')
       
nombre DB 20               ;Tamaño máximo del buffer
       DB ?                ;Caracteres leídos
       DB 20 dup('$')  ;Espacio reservado para los caracteres leídos
;----------------------------------------

.code

inicio:
  
  ;Inicializacion de segmento de datos
  MOV AX, @data
  MOV DS, AX
  ;-----------------------------------
  
  ;Solicitar nombre
  MOV DX, OFFSET msg_nombre
  MOV AH, 09h
  INT 21h
  
  ;Almacenar nombre
  MOV AH, 0Ah
  LEA DX, nombre
  INT 21h
  
  ;Salto de linea
  MOV DX, OFFSET newline
  MOV AH, 09h
  INT 21h
  
  ;Solicitar peso
  MOV DX, OFFSET msg_peso
  INT 21h
  
  ;Almacenar peso
  MOV AH, 0Ah
  LEA DX, peso
  INT 21h
  
  ;Salto de linea
  MOV DX, OFFSET newline
  MOV AH, 09h
  INT 21h
  
  ;Completar mensaje:
  ;Salto de linea
  MOV DX, OFFSET newline
  MOV AH, 09h
  INT 21h
  
  MOV DX, OFFSET saludo
  INT 21h
  
  LEA DX, peso+2
  INT 21h
  
  MOV DX, OFFSET peso_calc
  INT 21h
  
  LEA DX, nombre+2
  INT 21h
  
  
  ;---------------------
  
  MOV AX, 4C00h
  INT 21h
  
  
END inicio