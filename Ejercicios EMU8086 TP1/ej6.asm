;Sea Numeros un arreglo de bytes, cuya longitud está almacenada en la
;variable Long (de tamaño word). Escriba un programa que copie todos los
;elementos en el arreglo Copia. (Asegúrese de declarar Copia reservando
;espacio suficiente para poder almacenar todos los elementos de Numeros).

.model small
.stack 100h
.data
; Variables ---------
numeros DB 1, 2, 3, 4, 5
long DW 5
copia DB 5 dup(?)

; -------------------

.code
inicio:
;Inicializacion segmento de datos
MOV AX, @data
MOV DS, AX

;Codigo principal
MOV CX, long
MOV SI, 0

iterar:
MOV DL, numeros[SI]
MOV copia[SI], DL
INC SI

loop iterar

fin:
MOV AX, 4c00h
INT 21h

END inicio