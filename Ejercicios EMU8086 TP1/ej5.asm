;Continuacion Ej 4
;Usar datos de tipo Word en lugar de Byte

.model small
.stack 100h
.data
;Variables--------
arreglo DW 20 dup(2)
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
ADD AX, DS:[BX]
ADD BX, 2
LOOP iterar

;Terminar el programa
MOV AX, 4c00h
INT 21h

END inicio