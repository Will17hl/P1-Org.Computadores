// Creado por
// Juan Jose Vasquez Gomez
// Valeria Cardona
// Santiago Alvarez

// Inicializamos la dirección base de la pantalla
@SCREEN
D=A
@pantalla
M = D
@R12
AD=D+M

// Creamos el contador que controla el cambio de linea.
@32
D = A
@contadorBajar
M = D

// Inicializamos el contador de inversión y la variable que controla si se debe imprimir invertido o no.
@invert
M = 0
@contadorInvert
M = 1

(LOOP)
    // Leer el teclado
    @KBD
    D=M
    // Comprobar teclas
    @tecla
    M=D

	// Si invert es 0 no se invertiran las letras, de lo contrario si.
	@invert
	D = M
	@invertidas
	D; JNE

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

	(invertidas) // Lo mismo que lo anterior pero con las letras invertidas

	@dibujarInvJ
	D = A
	@letra
	M = D
	@tecla
	D = M
    @74
    D=D-A
	@borrarLetra
    D;JEQ   // Letra J (código 74)

	@dibujarInvS
	D = A
	@letra
	M = D
    @tecla
    D=M
    @83
    D=D-A
	@borrarLetra
    D;JEQ   // Letra S (código 83)

    @dibujarInvV
	D = A
	@letra
	M = D
    @tecla
    D=M
    @86
    D=D-A
	@borrarLetra
    D;JEQ   // Letra V (código 86)


	@LOOP
	0; JMP

(borrarLetra) // Función que se encarga de borrar el espacio en el cual se va a imprimir la letra.

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

(dibujarInvJ)
	// put bitmap location value in R12
	// put code return address in R13
    @pantalla
    D = M
    @R12
    AD=D+M
	// row 1
	M=0
	M = !M

	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@512 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M	
	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@512 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@512 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@576 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@576 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	M = !M

	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	@256 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	M = !M

	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@256 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	@256 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@320 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@448 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val}
	M = !M

	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	M = !M

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

(dibujarInvS)
	// put bitmap location value in R12
	// put code return address in R13
    @pantalla
    D = M
    @R12
    AD=D+M
	// row 1
	M=0
	M = !M
	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@64 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@64 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@512 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@512 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	M = !M

	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	M = !M

	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	@384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@64 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	@384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@512 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	M = !M


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

(dibujarInvV)
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
	M = !M

	// row 2
	D=A // D holds previous addr
	@32
	AD=D+A
	@24582 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 3
	D=A // D holds previous addr
	@32
	AD=D+A
	@12300 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 4
	D=A // D holds previous addr
	@32
	AD=D+A
	@6168 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 5
	D=A // D holds previous addr
	@32
	AD=D+A
	@3120 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 6
	D=A // D holds previous addr
	@32
	AD=D+A
	@1632 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 7
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 8
	D=A // D holds previous addr
	@32
	AD=D+A
	@384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 9
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	M = !M

	// row 10
	D=A // D holds previous addr
	@32
	AD=D+A
	M=0
	M = !M
	// row 11
	D=A // D holds previous addr
	@32
	AD=D+A
	@12300 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 12
	D=A // D holds previous addr
	@32
	AD=D+A
	@6168 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 13
	D=A // D holds previous addr
	@32
	AD=D+A
	@3120 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 14
	D=A // D holds previous addr
	@32
	AD=D+A
	@1632 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 15
	D=A // D holds previous addr
	@32
	AD=D+A
	@960 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

	// row 16
	D=A // D holds previous addr
	@32
	AD=D+A
	@384 // A holds val
	D=D+A // D = addr + val
	A=D-A // A=addr + val - val = addr
	M=D-A // RAM[addr] = val
	M = !M

    @continue
    D; JMP


(continue) // Verifica si se tiene que invertir o no
	@16
	D = A
	@contadorInvert
	D = M - D
	@invertir
	D; JGE

(continue2)

	// Verifica si ya se llego al final de memoria para volver a saltar al valor base de pantalla y volver a iniciar
	@24031
	D = A
	@pantalla
	D = D - M
	@restart
	D; JEQ

	// Se suma el contador de inversión
	@contadorInvert
	M = M + 1

	// Se le resta al contador que controla si hay que bajar o no
	@contadorBajar
	M = M - 1
	D = M
	// Se suma 1 a pantalla para mover hacia la derecha
	@pantalla
	M = M + 1

	// Si contadorBajar es 0, se invoca la función bajar
	@bajar
	D; JLE

	(ESPERAR_SOLTAR)
	@KBD
	D=M
	@ESPERAR_SOLTAR
	D;JNE

	@LOOP
	0;JMP   // Volver al bucle principal

(bajar) // Bajar suma a la pantalla 512 y baja completamente 16 lineas
	@512
	D = A
	@pantalla
	M = M + D

	// Reiniciamos los contadores de inversión
	@contadorInvert
	M = 1

	@invert
	M = 0

	// Reiniciamos el contador de bajar
	@32
	D = A
	@contadorBajar
	M = D
	@ESPERAR_SOLTAR
	D; JMP

(restart) // Esta función se encarga de reiniciar todo a los valores base para volver a empezar
	@16384
	D = A
	@pantalla
	M = D
	@R12
	AD=D+M

	@contadorInvert
	M = 1

	@invert
	M = 0

	@32
	D = A
	@contadorBajar
	M = D
	@ESPERAR_SOLTAR
	D; JMP


(invertir) // Esta función se encarga de poner el valor de invert en 1 para comenzar a invertir
@invert
M = 1
@continue2
D; JMP

