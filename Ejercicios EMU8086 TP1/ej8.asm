;Escriba un programa que convierta un car�cter ASCII a decimal. El car�cter
;est� almacenado en caracter. SI el car�cter ES un n�mero v�lido ("0", "1",
;... , "9"), debe convertirlo a decimal y almacenarlo en la variable digito; en
;caso contrario, debe almacenar FFh en digito.

.model small
.stack 100h
.data
; Variables ---------
; -------------------

.code
inicio:
;Inicializacion del Segmento de Datos
MOV AX, @data
MOV DS, AX

;Codigo principal


;Terminar ejecucion del programa
MOV AX, 4c00h
INT 21h

END inicio
