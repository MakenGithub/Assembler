;15.Reescriba el ejercicio 9 usando una subrutina llamada caracterADecimal para realizar
;la conversi�n. La subrutina debe recibir el car�cter a convertir en AL y devolver el valor
;decimal en AH. SI AL no ES un car�cter v�lido, debe devolver AH = Ffh.

;9. Escriba un programa que convierta un car�cter ASCII a decimal. El car�cter
;est� almacenado en caracter. SI el car�cter ES un n�mero v�lido ("0", "1",
;... , "9"), debe convertirlo a decimal y almacenarlo en la variable digito; en
;caso contrario, debe almacenar FFh en digito.

.model small
.stack 100h
.data
;VARIABLES
noValido DB 0Dh, 0Ah, 'Caracter No Valido$'
;----------------------------------------

.code

inicio:
  
  ;Inicializacion de segmento de datos
  MOV AX, @data
  MOV DS, AX
  ;-----------------------------------
  
  MOV AH, 01h
  INT 21h
  
  CALL caracterADecimal
  
  ;Terminar el programa
  MOV AX, 4C00h
  INT 21h
  
  
  caracterADecimal PROC
  CMP AL, '0'
  JB caracterNoValido
  
  CMP AL, '9'
  JA caracterNoValido
  
  SUB AL, '0'
  MOV AH, AL
  RET
  
  caracterNoValido:
  MOV DX, OFFSET noValido
  MOV AH, 09h
  INT 21h
  
  MOV AH, 0FFh
  RET
  caracterADecimal ENDP
  
END inicio