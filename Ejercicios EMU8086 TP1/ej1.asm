.model small
.stack 100h
.data
; Variables ------------
nombre DB 'Marcos$'
apellido DB 'Meni�o$'
iniciales DB '  $' ; Espacio para dos caracteres y el delimitador $
; ----------------------

.code
main PROC
    ; Inicializaci�n de segmento de datos
    MOV AX, @data
    MOV DS, AX
    
    ; C�digo principal
    MOV AL, nombre    ; Cargar el primer caracter del nombre
    MOV iniciales[0], AL ; Guardar en el primer lugar de iniciales
    
    MOV AH, apellido   ; Cargar el primer caracter del apellido
    MOV iniciales[1], AH ; Guardar en el segundo lugar de iniciales
    
    ; Mostrar en pantalla las iniciales
    MOV DX, OFFSET iniciales
    MOV AH, 09h
    INT 21h
    
    ; Terminar programa
    MOV AX, 4C00h
    INT 21h
    RET
main ENDP
END main