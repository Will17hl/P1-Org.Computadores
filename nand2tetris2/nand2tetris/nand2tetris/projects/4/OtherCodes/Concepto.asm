// Asignación
// Ej 1: x = 5
// @ uso de registro A, @xxx todo xxx lo va a llevar al registro a menos el bit más significativo.

// @5 // 0 000000000000101
// D=A // 111 0 110000 010 000
// @X // 0 000000000010000
// M=D // 111 1 001100 001 000

// (FIN)
// @FIN
// D;JMP

// Decisión
// x = 5, y = 6
// if (x <= y)
// z = 1
// else
// z = 0



// @3
// D=A
// @X
// M=D

// @3
// D=A
// @Y
// M=D

// @X
// D=M
// @Y


// D = D-M;
// @TRUE
// D; JLE

// @Z
// M=0
// @FIN
// D;JMP

// (TRUE)
// @Z
// M=1
// @FIN
// D;JMP

// (FIN)
// @FIN
// D; JMP



// Iteraciones
// MULTIPLICACIÓN X * Y = RES, ejemplo 3 * 5 = 15

    @RES
    M = 0

    @3
    D = A
    @X
    M = D

    @5
    D = A
    @Y
    M = D

    @X
    D = M
    @Y

    D = D-M;
    @TRUE
    D; JLE

    @Y
    D = M
    @z
    M = D
    @X
    D = M
    @w
    M = D
    @i
    M = 0
    @LOOP
    D;JMP

(TRUE)

    @X
    D = M
    @z
    M = D
    @Y
    D = M
    @w
    M = D
    @i
    M = 0
    @LOOP
    D; JMP

(LOOP)
    @i
    D = M
    @z 
    D = D - M;
    @STOP
    D; JEQ

    @sum
    D = M
    @w
    D = D + M
    @sum
    M = D
    // i++
    @i
    M = M + 1
    //
    @LOOP
    D; JMP

(STOP)
    @STOP
    D; JMP




// Funciones