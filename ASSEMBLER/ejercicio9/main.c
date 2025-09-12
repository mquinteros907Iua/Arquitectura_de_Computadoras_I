/*Ejercicio 9.
Dado el siguiente código LEGv8, expréselo en C con las variables f=X0, g=X1.
1 CBZ X0 , End
2 ADD X1 , X1 , X0
3 End :*/

#include <stdio.h>

int main() {
    long f, g;

    if (f != 0) {   // Solo si f no es cero, se ejecuta la suma
        g = g + f;
    }

    return 0;
}
