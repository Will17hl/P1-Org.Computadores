// Inicialización
@SCREEN
D=A
@addr
M=D    // addr = 16384 (dirección base de la pantalla)

// Dibujar el cuadrado inicial
@16     // Contador para las 16 filas del cuadrado
D=A
@contador
M=D

(DIBUJAR_CUADRADO)
    // Dibujar una línea horizontal de 16 píxeles
    @addr
    A=M
    M=-1   // -1 en binario es 1111111111111111

    // Mover a la siguiente línea
    @32    // 32 palabras = 512 píxeles = 1 línea completa
    D=A
    @addr
    M=M+D  // Mover el puntero a la siguiente línea

    // Decrementar el contador y continuar si no es cero
    @contador
    M=M-1
    D=M
    @DIBUJAR_CUADRADO
    D;JGT

// Restablecer addr a la posición inicial del cuadrado
@512   // 16 * 32 = 512
D=A
@addr
M=M-D

// Bucle principal
(LOOP)
    // Leer el teclado
    @KBD
    D=M
    @tecla
    M=D    // Guardar el valor de la tecla

    // Comprobar teclas
    @tecla
    D=M

    @131
    D=D-A
    @MOVER_ARRIBA
    D;JEQ   // Flecha arriba (código 131)

    @tecla
    D=M
    @133
    D=D-A
    @MOVER_ABAJO
    D;JEQ   // Flecha abajo (código 133)

    @tecla
    D=M
    @130
    D=D-A
    @MOVER_IZQUIERDA
    D;JEQ   // Flecha izquierda (código 130)

    @tecla
    D=M
    @132
    D=D-A
    @MOVER_DERECHA
    D;JEQ   // Flecha derecha (código 132)

    @LOOP
    0;JMP   // Si no hay tecla, volver al inicio del bucle

(MOVER_ARRIBA)
    @512
    D=-A
    @MOVER
    0;JMP

(MOVER_ABAJO)
    @512
    D=A
    @MOVER
    0;JMP

(MOVER_IZQUIERDA)
    @1
    D=-A
    @MOVER
    0;JMP

(MOVER_DERECHA)
    @1
    D=A
    @MOVER
    0;JMP

(MOVER)
    // D contiene el desplazamiento a aplicar
    @desplazamiento
    M=D    // Guardar el desplazamiento

    // Borrar el cuadrado actual
    @16
    D=A
    @contador
    M=D

    (BORRAR_CUADRADO)
        @addr
        A=M
        M=0   // Borrar la línea

        // Mover a la siguiente línea
        @32
        D=A
        @addr
        M=M+D

        // Decrementar el contador y continuar si no es cero
        @contador
        M=M-1
        D=M
        @BORRAR_CUADRADO
        D;JGT

    // Restablecer addr y aplicar el movimiento
    @512
    D=A
    @addr
    M=M-D
    @desplazamiento
    D=M    // Recuperar el desplazamiento
    @addr
    M=M+D  // Aplicar el desplazamiento

    // Dibujar el nuevo cuadrado
    @16
    D=A
    @contador
    M=D

    (REDIBUJAR_CUADRADO)
        @addr
        A=M
        M=-1   // Dibujar la línea

        // Mover a la siguiente línea
        @32
        D=A
        @addr
        M=M+D

        // Decrementar el contador y continuar si no es cero
        @contador
        M=M-1
        D=M
        @REDIBUJAR_CUADRADO
        D;JGT

    // Restablecer addr a la posición inicial del nuevo cuadrado
    @512
    D=A
    @addr
    M=M-D

    // Esperar a que se suelte la tecla
    (ESPERAR_SOLTAR)
        @KBD
        D=M
        @ESPERAR_SOLTAR
        D;JNE
    
    @LOOP
    0;JMP   // Volver al bucle principal