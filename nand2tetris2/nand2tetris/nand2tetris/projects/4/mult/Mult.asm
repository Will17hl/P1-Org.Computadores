// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.

// MULTIPLICACIÓN X * Y = RES, ejemplo 3 * 5 = 15

    @i
    M = 0

    @RES
    M = 0

(LOOP)
    @RES
    D = M
    @R2
    M = D
    @i
    D = M
    @R1 
    D = D - M;
    @STOP
    D; JEQ

    @RES
    D = M
    @R0
    D = D + M
    @RES
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