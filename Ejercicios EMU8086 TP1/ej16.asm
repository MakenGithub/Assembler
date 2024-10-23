;16.Escriba un programa que cuente la cantidad de bits 1 en las variables dato8 (de 8 bits)
;y dato16 (de 16 bits). Crear dos subrutinas:

;A) contarUnosByte que cuente el número de bits 1 en un byte. El byte debe ser pasado
;en AL y el conteo devuelto en CX. Por ejemplo, SI la subrutina recibe AL = 00101110,
;debe devolver CX = 4.

;B) contarUnosWord que cuente el número de bits 1 en una palabra (2 bytes) invocando
;dos veces a la subrutina escrita en el inciso a (una vez para la parte alta y otra vez
;para la parte baja). La palabra ES pasada en AX y el conteo devuelto en CX.

.model small
.stack 100h

.data
; Variables ------------------
dato8 DB 10111001b            ;5
dato16 DW 1011111100101001b   ;10

; ----------------------------

.code
inicio:
;Inicializacion del segmento de datos
MOV AX, @data
MOV DS, AX

;Codigo principal
MOV AL, dato8

MOV BX, 0
MOV CX, 8

CALL contarUnosByte

;Terminar la ejecucion del programa
MOV AX, 4c00h
INT 21h


contarUnosByte PROC
  ;10111001b
  siguiente:
  SHL AL, 1
  JC valorEncontrado
  LOOP siguiente
  
  JMP fin
  
  valorEncontrado:
  INC BX
  LOOP siguiente
  
  fin:
  MOV CX, BX
  RET
contarUnosByte ENDP


END inicio