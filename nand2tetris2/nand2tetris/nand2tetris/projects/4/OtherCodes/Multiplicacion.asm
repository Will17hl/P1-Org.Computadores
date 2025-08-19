// MULTIPLICACIÓN X * Y = RES, ejemplo 3 * 5 = 15

    @RES
    M = 0

    @i
    M = 0

    @3
    D = A
    @X
    M = D

    @0
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