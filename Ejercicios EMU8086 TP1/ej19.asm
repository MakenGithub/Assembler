;Escriba la subrutina longString que recibe la dirección de un string
;terminado en 0 en la pila y devuelve su longitud en AX.

.model small
.stack 100h

.data
; Variables ----------
  cadena DB 'Argentina', 0
; --------------------

.code
inicio:
  ;Inicializacion del Segmento de Datos
  MOV AX, @data
  MOV DS, AX
  
  ;Codigo Principal
  MOV AX, OFFSET cadena
  PUSH AX
  
  CALL longString
  
  
  ;Terminar ejecucion del programa
  MOV AX, 4C00h
  INT 21H
  
  ;Retorna en AX la longitud de una cadena
  longString PROC
    PUSH BP
    MOV BP, SP
    
    MOV CX, 0
    MOV SI, [BP+4]
    
    contar_caracteres:
      MOV DX, [SI]
      CMP DX, 0
      JE fin
      
      INC CX
      ADD SI, 1
      
      JMP contar_caracteres
    
    fin:
    MOV AX, CX
    POP BP
    RET
  longString ENDP
  
END inicio