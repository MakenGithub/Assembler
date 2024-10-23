;Se tiene un arreglo de elementos de tamaño byte. El último elemento del
;arreglo tiene el valor 00h (este valor no se repite en ningún otro elemento,
;sólo en el último). Realice un programa en Assembler que determine la
;longitud del arreglo, sin contar el último elemento, y la almacene en el
;registro DX.

.model small
.stack 100h
.data
; Variables -----------------
arreglo DB 15h, 07h, 22h, 9Ah, 4Dh, 00h ; Datos de prueba
; ---------------------------

.code
inicio:

;Inicializacion del segmento de Datos
MOV AX, @data
MOV DS, AX

;Inicio codigo principal
MOV SI, 0

siguiente:

CMP arreglo[SI], 00h

JE fin
INC SI
JNE siguiente
fin:

MOV DX, SI

MOV AX, 4c00h
INT 21h
RET


END inicio