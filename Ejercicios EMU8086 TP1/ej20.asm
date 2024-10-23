;Realice una subrutina llamada contarPalabras que reciba la dirección de
;un string terminado en 0 en la pila y devuelva en AX la cantidad de
;palabras que contiene el string.

.model small
.stack 100h

.data
; Variables -----------------------
  cadena DB 'El lado misterioso de la isla', 0
; ---------------------------------

.code
inicio:
  ;Inicializacion del Segmento de Datos
  MOV AX, @data
  MOV DS, AX
  
  ;Codigo principal
  MOV AX, OFFSET cadena
  PUSH AX
  
  ;Llamar a subrutina
  CALL contarPalabras
  ;Devuelve en AX la cantidad de palabras
  
  ;Finalizar ejecucion del programa
  MOV AX, 4C00h
  INT 21h
  
  
  contarPalabras PROC
    PUSH BP     ;Guardar valor de BP
    MOV BP, SP
    
  ; ---- Espacio = 20h -------------
    MOV CX, 0
    MOV SI, [BP+4]
    
    verificar:
    MOV DL, [SI]
    CMP DL, 0
    JE fin
    INC SI
    CMP DL, 20h
    JNE verificar
    
    
    INC CX
    
    
    JMP verificar
    
    
    fin:
    INC CX
    MOV AX, CX
    POP BP
    RET
  contarPalabras ENDP
  

  
END inicio