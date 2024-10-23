.model small
.stack 100h

.data
;Variables -----
archivo DB 'Documento.xls', 0
; --------------

.code
inicio:
;Inicializacion Segmento de Datos
MOV AX, @data
MOV DS, AX

;Codigo principal
MOV CX, 0     ;Inicializacion contador de caracteres
MOV BX, OFFSET archivo

iteracion:
;Cargar caracter de BX en AL
MOV AL, [BX]
CMP AL, 0
JE fin

INC BX
INC CX

JMP iteracion

fin:
;Terminar ejecucion del programa
MOV AX, 4c00h
INT 21h

END inicio