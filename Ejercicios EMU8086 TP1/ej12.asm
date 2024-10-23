;Escriba la subrutina mayor que, dados dos números enteros de 16 bits
;recibidos en los registros BX y CX, devuelva en AX el mayor de los dos.

.model small
.stack 100h
.data
;VARIABLES
;----------------------------------------

.code

inicio:
  
  ;Inicializacion de segmento de datos
  MOV AX, @data
  MOV DS, AX
  ;-----------------------------------
  
  MOV BX, 23
  MOV CX, 22
  
  CALL mayor
  
  MOV AX, 4C00h
  INT 21h
  
  
;Subrutina devuelve mayor en AX
  mayor PROC
    CMP BX, CX
    JG bx_mayor
    MOV AX, CX
  RET
    
    bx_mayor:
    MOV AX, BX
    
  RET
  mayor ENDP
END inicio