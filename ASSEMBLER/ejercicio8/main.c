//Interprete y traduzca este código LEGv8 a C. Variables: a=X0, b=X1, c=X2, d=X3, e=X4
//1 ADD X5 , X0 , X1
//2 SUB X6 , X3 , X4
//3 MUL X7 , X5 , X6
//4 STUR X7 , [ X2 , #0]

#include <stdio.h>

int main() {
    long a, b, d, e;   // a = X0, b = X1, d = X3, e = X4
    long *c;           // c = X2 (puntero)
    
    long X5, X6, X7;   // registros temporales

    long resultado;
    c = &resultado;    // X2 apunta a una dirección en memoria

    // Línea 1: ADD X5, X0, X1  →  X5 = a + b
    X5 = a + b;

    // Línea 2: SUB X6, X3, X4  →  X6 = d - e
    X6 = d - e;

    // Línea 3: MUL X7, X5, X6  →  X7 = X5 * X6
    X7 = X5 * X6;

    // Línea 4: STUR X7, [X2,#0]  →  *c = X7
    *c = X7;

    // Opcional: mostrar resultado
    printf("Resultado almacenado en *c: %ld\n", *c);

    return 0;
}
