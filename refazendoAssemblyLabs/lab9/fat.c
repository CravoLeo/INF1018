#include <stdio.h>

int fat(int n); 

int main(void) {
    int n = 5;
    int resultado = fat(n);
    printf("fat(%d) = %d\n", n, resultado);
    return 0;
}