//Para la siguiente instrucción en C, escriba el código ensamblador LEGv8 correspondiente. Suponga
//que las variables i,j están asignadas a los registros X3 y X4, respectivamente. Suponga que las
//direcciones base de los arreglos A y B están en los registros X6 y X7, respectivamente.
//1 B [8] = A [i - j

	    .data
A:   .dword 0,1,2,3,4,5,6,7,8,9   // Arreglo A
B:   .dword 0,0,0,0,0,0,0,0,0,0   // Arreglo B
i:   .dword 8
j:   .dword 3

    .text
    .global _start
_start:

    // Cargar direcciones de i y j
    LDR X3, =i
    LDR X4, =j
    LDR X6, =A          // Base de A
    LDR X7, =B          // Base de B

    // Obtener los valores de i y j (porque LDR X3,=i trae la dirección)
    LDUR X3, [X3]        // X3 = valor de i
    LDUR X4, [X4]        // X4 = valor de j

    // Calcular i - j
    SUB X8, X3, X4      // X8 = i - j

    // Calcular desplazamiento en bytes para A[i-j]
    LSL X9, X8, #3      // X9 = (i-j) * 8

    // Cargar A[i-j]
    LDR X10, [X6, X9]   // X10 = A[i-j]

    // Calcular dirección de B[8] (8*8 = 64 bytes)
    MOVZ X11, #64       // X11 = 64

    // Guardar en B[8]
    STR X10, [X7, X11]  // B[8] = A[i-j]

infloop: 
    B infloop           // loop infinito (para debug)
