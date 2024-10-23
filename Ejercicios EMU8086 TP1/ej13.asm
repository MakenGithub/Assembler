;Reescriba la subrutina mayor pero recibiendo como parámetros las direcciones de los
;valores en SI y DI
.model small
.stack 100h
.data
;Variables ---------------
num1 DW 100
num2 DW 200
resultado DW ?
; ------------------------

.code
inicio:
;Inicializacion del Segmento de Datos
  MOV AX, @data
  MOV DS, AX
  
  ;Código principal
  MOV SI, OFFSET num1
  MOV DI, OFFSET num2
  
  CALL mayor
  
  MOV resultado, AX
  
  ;Terminar el programa
  MOV AX, 4c00h
  INT 21h
  
  mayor PROC
    MOV BX, [SI]
    MOV CX, [DI]
    
    CMP BX, CX
    
    JG bx_mayor
    
    MOV AX, CX
    RET
    
    
    bx_mayor:
    MOV AX, BX
    
    RET
  mayor ENDP

END inicio