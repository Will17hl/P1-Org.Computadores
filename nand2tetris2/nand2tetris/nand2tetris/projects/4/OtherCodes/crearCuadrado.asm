// Inicialización
@SCREEN
D=A
@addr
M=D    // addr = 16384 (dirección base de la pantalla)

// Configurar contador para las 16 filas del cuadrado
@16
D=A
@contador
M=D

// Bucle para dibujar el cuadrado
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

    // Decrementar el contador
    @contador
    M=M-1
    D=M

    // Continuar si el contador no es cero
    @DIBUJAR_CUADRADO
    D;JGT

// Bucle infinito para mantener el programa en ejecución
(FIN)
    @FIN
    0;JMP