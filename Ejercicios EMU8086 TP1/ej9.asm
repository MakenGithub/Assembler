;Escriba un programa que convierta un carácter ASCII a decimal. El carácter
;está almacenado en caracter. SI el carácter ES un número válido ("0", "1",
;... , "9"), debe convertirlo a decimal y almacenarlo en la variable digito; en
;caso contrario, debe almacenar FFh en digito.


.model small
.stack 100h

.data
;Variables -----
caracter DB '8'
digito DB ?
; --------------

.code
inicio:
;Inicializacion Segmento de Datos
  MOV AX, @data
  MOV DS, AX
  
  ;Codigo principal
  MOV AL, caracter
  
  CMP AL, '0'
  JL noEsDigito
  
  CMP AL, '9'
  JG noEsDigito
  
  SUB AL, '0'   ;Resta para convertir a digito
  MOV digito, AL
  JMP fin


noEsDigito:
  MOV digito, 0ffh


fin:
;Terminar ejecucion del programa
MOV AX, 4c00h
INT 21h

END inicio