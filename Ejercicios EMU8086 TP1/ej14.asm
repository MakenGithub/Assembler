;Dadas dos variables enteras de 16 bits, n1 y n2, se quiere almacenar la mayor de
;ambas en la variable max. Realice dos programas, uno con cada una de las versiones
;de la subrutina mayor de los puntos anteriores.

.model small
.stack 100h
.data
;VARIABLES
num1 DW 100
num2 DW 200
max DW ?

;----------------------------------------

.code

inicio:
  
  ;Inicializacion de segmento de datos
  MOV AX, @data
  MOV DS, AX
  ;-----------------------------------
  
  MOV SI, OFFSET num1
  MOV DI, OFFSET num2
  
  CALL mayor
  
  MOV AX, max
  
  MOV AX, 4C00h
  INT 21h
  
  mayor PROC
    MOV BX, [SI]
    MOV CX, [DI]
    
    CMP BX, CX
    JG num1_mayor
    
    MOV max, CX
    RET
    
    num1_mayor:
    MOV max, BX
    RET
  mayor ENDP
  
  ;Impresion en pantalla
  ;MOV AH, 09h
  ;INT 21h
  ;---------------------
  
  
END inicio