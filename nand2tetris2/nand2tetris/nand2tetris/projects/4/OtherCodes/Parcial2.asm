@SCREEN
D=A
@pantalla
M = D
@R12
AD=D+M
@32
D = A
@contador
M = D 

(LOOP)
    // Leer el teclado
    @KBD
    D=M
    // Comprobar teclas
    @tecla
    M=D

	@dibujarJ
	D = A
	@letra // Guarda la dirección a la que tiene que saltar en caso de que esa sea la letra
	M = D 
	@tecla
	D = M
    @74
    D=D-A
	@borrarLetra
    D;JEQ   // Letra J (código 74)

	@dibujarS
	D = A
	@letra // Guarda la dirección a la que tiene que saltar en caso de que esa sea la letra
	M = D
    @tecla
    D=M
    @83
    D=D-A
	@borrarLetra
    D;JEQ   // Letra S (código 83)

    @dibujarV
	D = A
	@letra // Guarda la dirección a la que tiene que saltar en caso de que esa sea la letra
	M = D
    @tecla
    D=M
    @86
    D=D-A
	@borrarLetra
    D;JEQ   // Letra V (código 86)

	@LOOP
	0; JMP

(borrarLetra)

    @pantalla
    D = M
    @R12
    AD=D+M
	// row 1
	M=0
	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0

	@letra // Va a comprobar que letra se oprimió luego de borrar
	A = M
	D; JMP

(dibujarJ)
	// put bitmap location value in R12
	// put code return address in R13
    @pantalla
    D = A
    @R12
    AD=D+M
	// row 1
	M=0
	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@512 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@512 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@512 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@576 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@576 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	@256 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@256 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	@256 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@320 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@448 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
    @continue
    D; JMP

(dibujarS)
	// put bitmap location value in R12
	// put code return address in R13
    @pantalla
    D = M
    @R12
    AD=D+M
	// row 1
	M=0
	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@64 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@64 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@512 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@512 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	@384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@64 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	@384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@512 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0

    @continue
    D; JMP

(dibujarV)
	// put bitmap location value in R12
	// put code return address in R13
    @pantalla
    D = M
    @R12
    AD=D+M
	// row 1
	@4081 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=A-D // RAM[addr]=-val
	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@24582 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@12300 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@6168 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@3120 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@1632 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	@12300 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@6168 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	@3120 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@1632 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	@384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val

    @continue
    D; JMP


(continue)
	@24031
	D = A
	@pantalla
	D = D - M
	@restart
	D; JEQ


	@contador
	M = M - 1
	D = M
	@pantalla
	M = M + 1

	@bajar
	D; JLE

	(ESPERAR_SOLTAR)
	@KBD
	D=M
	@ESPERAR_SOLTAR
	D;JNE

	@LOOP
	0;JMP   // Volver al bucle principal

(bajar)
	@512
	D = A
	@pantalla
	M = M + D
	@32
	D = A
	@contador
	M = D
	@ESPERAR_SOLTAR
	D; JMP

(restart)
	@16384
	D = A
	@pantalla
	M = D
	@R12
	AD=D+M
	@32
	D = A
	@contador
	M = D
	@ESPERAR_SOLTAR
	D; JMP
