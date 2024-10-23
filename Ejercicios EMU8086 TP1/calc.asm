;Calculadora con operaciones aritméticas básicas

.model small
.stack 100h

;Macro copied from emu8086.inc ------------------------
;This macro prints a char in AL and advances
;the current cursor position:

PUTC    MACRO   char
        PUSH    AX
        MOV     AL, char
        MOV     AH, 0Eh
        INT     10h     
        POP     AX
ENDM
;------------------------------------------------------

.data
;VARIABLES


msg_inicio DB 'Calculadora básica', 0Ah, 0Dh, '$'
msg_final DB 'All rights reserved ahre', '$'
msg_op1 DB 'Primer valor: ', '$'
msg_op2 DB 'Segundo valor: ', '$'
msg_operador DB ' + sumar', 0Ah, 0Dh, ' - restar', 0Ah, 0Dh
             DB ' * multiplicar', 0Ah, 0Dh, ' / dividir', 0Ah, 0Dh
             DB ' Q para salir', 0Ah, 0Dh, '$'
msg_resultado DB 'Resultado: ', '$'

op_1 DW 0
op_2 DW 0
operador DB ?


;---------
.code

main PROC
  
  ;INICIALIZACION DE DATOS
  MOV AX, @data
  MOV DS, AX
  ;-----------------------
  
  ;Código principal ------
  MOV DX, OFFSET msg_inicio
  MOV AH, 09h
  INT 21h
  inicio:
  
  ;PRIMER VALOR
  MOV DX, OFFSET msg_op1
  INT 21h
  
  ;Ingreso del primer valor
  MOV AH, 01h
  INT 21h
  
  ;Newline
putc 0Dh
putc 0Ah
  
  ;OPERADOR
  ;Impresión en pantalla
  MOV AH, 09h
  MOV DX, OFFSET msg_operador
  INT 21h
  
  MOV AH, 01h
  INT 21h
  MOV operador, AL
  
  ;Newline
putc 0Dh
putc 0Ah
  
  ;Comparar operador
  CMP operador, 'q'
  JE salir

  CMP operador, '+'
  JE suma
  
  CMP operador, '-'
  JE resta
  
  CMP operador, '*'
  JE multiplicacion
  
  CMP operador, '%'
  JE division
  

  

  ;SEGUNDO VALOR
  
  suma:
  MOV AX, op_1
  ADD AX, op_2
  CALL num_to_string
  
  MOV DX, AX
  MOV AH, 09h
  INT 21h

  JMP salir
  
  resta:
  multiplicacion:
  division:
  
  
  salir:
  MOV DX, OFFSET msg_final
  MOV AH, 09h
  INT 21h
  
  MOV AX, 4C00h
  INT 21h
  
  RET
ENDP main


;PROCEDIMIENTOS ---------------------------------------

  ; Rutina para convertir un número en AX a una cadena ASCII
num_to_string PROC
    MOV CX, 0        ; Contador de dígitos
    MOV BX, 10       ; Divisor para obtener dígitos

convert_loop:
    XOR DX, DX       ; Limpiar DX
    DIV BX           ; Dividir AX entre 10, cociente en AX, residuo en DX
    PUSH DX          ; Apilar el dígito
    INC CX           ; Incrementar contador de dígitos
    TEST AX, AX      ; Verificar si AX es 0
    JNZ convert_loop ; Repetir si AX no es 0

    ; Convertir dígitos apilados a ASCII
    pop_loop:
    POP DX           ; Recuperar dígito de la pila
    ADD DL, '0'      ; Convertir a ASCII
    MOV [SI], DL     ; Guardar en el buffer
    INC SI           ; Mover al siguiente espacio en el buffer
    LOOP pop_loop    ; Repetir para todos los dígitos

    MOV BYTE PTR [SI], '$' ; Terminador de cadena
    RET
num_to_string ENDP