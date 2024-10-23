.model small
.stack
.data
numeros DW 15, 22, 37, 46, 00h
resultado DW ?
.code
inicio:
  MOV AX, @data
  MOV DS, AX

  MOV AX, OFFSET numeros    ; Cargar la dirección del array "numeros" en AX
  PUSH AX                   ; Guardar la dirección en la pila
  
  CALL subrutina            ; Llamar a la subrutina que sumará los valores
  
  POP AX                    ; Recuperar la dirección de la pila (limpieza)
  MOV resultado, CX         ; Guardar el resultado final en la variable "resultado"
  MOV AX, 4C00h             ; Terminar el programa
  INT 21h                   ; Interrupción para finalizar
  
subrutina PROC
    PUSH BP                   ; Guardar el puntero de la base anterior
    MOV BP, SP                ; Establecer BP como el nuevo puntero de la base
    MOV BX, SS:[BP + 4]       ; Cargar la dirección del array en BX (primer parámetro en la pila)
    MOV CX, 0                 ; Inicializar el registro CX para la suma
    
    recorrer:
      MOV DX, DS:[BX]         ; Cargar el valor actual del array en DX
      CMP DX, 0               ; Comparar el valor con 0
      JE fin                  ; Si el valor es 0, saltar a "fin"
      ADD CX, DX              ; Sumar el valor en DX a CX
      ADD BX, 2               ; Mover BX a la siguiente palabra (16 bits)
      JMP recorrer            ; Repetir el proceso
    
    fin:
      POP BP                  ; Restaurar el puntero de la base original
      RET                     ; Retornar de la subrutina
  subrutina ENDP
END inicio