#include <stdio.h>

int add(int a, int b, int c);

int main() {
    int resultado;

    resultado = add(10, 20, 30);
    
    printf("Resultado = %d\n", resultado);

    return 0;
}