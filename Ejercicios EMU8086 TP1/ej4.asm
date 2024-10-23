;Escribir un programa en Assembler que sume los números contenidos en un
;arreglo de 20 elementos de un byte cada uno que comienza en la posición
;de memoria almacenada en el registro BX, y guarde la suma en AL.
;(Declare un arreglo en el segmento de datos y asigne la dirección inicial en
;BX AL comenzar el programa).

.model small
.stack 100h
.data
;Variables--------
arreglo DB 20 dup(2)
;-----------------
.code

inicio:
;Inicializacion Segmento de Datos
MOV AX, @data
MOV DS, AX

;Codigo principal
MOV BX, OFFSET arreglo
MOV CX, 20
MOV AL, 0

iterar:
ADD AL, DS:[BX]
INC BX
LOOP iterar

;Terminar el programa
MOV AX, 4c00h
INT 21h

END inicio