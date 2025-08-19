// Inicialización
@SCREEN
D=A
@addr
M=D    // addr = 16384 (dirección base de la pantalla)

@KBD
D=A
@24576
D=D-A
@keyboard
M=D   // keyboard = 24576 (dirección del teclado)

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
    // Comprobar si se presiona la tecla de flecha derecha (código 132)
    @KBD
    D=M
    @132
    D=D-A
    @MOVER_DERECHA
    D;JEQ   // Si se presiona la tecla derecha, ir a MOVER_DERECHA

    // Comprobar si se presiona la tecla de flecha izquierda (código 130)
    @KBD
    D=M
    @130
    D=D-A
    @MOVER_IZQUIERDA
    D;JEQ   // Si se presiona la tecla izquierda, ir a MOVER_IZQUIERDA
    
    @LOOP
    0;JMP   // Si no, volver al inicio del bucle

(MOVER_DERECHA)
    // Borrar el cuadrado actual
    @16
    D=A
    @contador
    M=D

    (BORRAR_CUADRADO_DER)
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
        @BORRAR_CUADRADO_DER
        D;JGT

    // Restablecer addr y moverlo una posición a la derecha
    @512
    D=A
    @addr
    M=M-D
    M=M+1  // Mover una posición a la derecha

    @REDIBUJAR
    0;JMP

(MOVER_IZQUIERDA)
    // Borrar el cuadrado actual
    @16
    D=A
    @contador
    M=D

    (BORRAR_CUADRADO_IZQ)
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
        @BORRAR_CUADRADO_IZQ
        D;JGT

    // Restablecer addr y moverlo una posición a la izquierda
    @512
    D=A
    @addr
    M=M-D
    M=M-1  // Mover una posición a la izquierda

(REDIBUJAR)
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