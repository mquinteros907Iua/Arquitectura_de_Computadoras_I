#include <stdio.h>

int main(void) {
    long y = 5;       // X1 = 5   (variable y)
    long n = 3;       // X2 = 3   (variable n)
    long *x;          // X0 = puntero donde guardar el resultado
    long destino;
    x = &destino;     // X0 apunta a destino

    long acumulador = 0;  
    // MOVZ X3, #0   → X3 = 0 (acumulador inicializado a cero)

    long i = 0;
    for (i = 0; i < n; ++i) {
        // --- Inicio del Loop: ---
        if (n == 0) { 
            // CBZ X2, End   → si n == 0 saltar al final
            break;
        }

        acumulador += y;  
        // ADD X3, X3, X1  → X3 = X3 + y

    }

    *x = acumulador;  
    // STUR X3, [X0, #0] → guardar el acumulador (X3) en la dirección apuntada por X0 (es decir, *x)

    printf("Resultado = %ld\n", *x); // salida final

    return 0;
}