;Manejo de la pila
;Instrucciones PUSH y POP

;Escriba la subrutina mayorArreglo que encuentre el mayor de los números
;de un arreglo de words. La dirección del arreglo y su longitud se reciben en
;la pila. El mayor número debe ser devuelto en AX.

.model small
.stack 100h
.data
; Variables ------------
arreglo DW 1, 15, 200, 500, 433, 33
long DW 6

; ----------------------
.code
inicio:
  ;Inicializacion del segmento de datos
  MOV AX, @data
  MOV DS, AX
  
  ;Codigo principal
  ;Empujar los parámetros a la pila
  MOV AX, OFFSET arreglo
  PUSH AX
  
  MOV AX, long
  PUSH AX
  
  ;Llamada a la subrutina
  CALL mayorArreglo
  ;Ahora AX tiene el mayor valor del arreglo
  
  ;Terminar ejecucion del programa
  MOV AX, 4C00h
  INT 21h
  

  mayorArreglo PROC
    PUSH BP       ;Guardar BP
    MOV BP, SP    ;BP = SP (Configurar el marco de pila)
    
    ;Obtener los parámetros de la pila
    MOV CX, [BP+4]
    MOV SI, [BP+6]
    
    ;Inicializar el primer elemento del arreglo como el mayor
    MOV AX, [SI]
    ADD SI, 2
    
    ;Bucle para recorrer el arreglo
    DEC CX    ;Reducir en 1 porque ya consideramos el primer elemento
    JZ fin_bucle
    
    comparar:
      MOV DX, [SI]  ;DX = el siguiente valor del arreglo
      CMP AX, DX
      JGE no_cambiar
      MOV AX, DX
      
      
    no_cambiar:
      ADD SI, 2     ;Avanzar al siguiente elemento del arreglo
      LOOP comparar
      
    
    
    fin_bucle:
    POP BP          ;Restaurar BP
    RET             ;Regresar (AX contiene el mayor elemento)
    
  mayorArreglo ENDP
  
END inicio