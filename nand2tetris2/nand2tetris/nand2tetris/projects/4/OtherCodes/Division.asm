// DIVISIÓN X / Y = RES, ejemplo 10 / 2 = 5

    @RES
    M = 0

    // Dividendo
    @20
    D = A
    @X
    M = D

    // Divisor
    @0
    D = A
    @Y
    M = D
    @STOP
    D; JEQ


    @X
    D = M
    @residuo
    M = D
    @LOOP
    D;JMP

(LOOP)
    @Y
    D = D - M;
    @STOP
    D; JLT

    @residuo
    M = D
    @RES
    M = M + 1
    @LOOP
    D; JMP

(STOP)
    @STOP
    D; JMP