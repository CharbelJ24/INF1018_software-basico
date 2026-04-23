#include <stdio.h>

void foo(int a[], int n);

int main() {

    int v[8] = {3, 2, 0, 5, 1, 0, 4, 0};

    int i;

    foo(v, 8);

    for (i = 0; i < 8; i++) {
        printf("%d ", v[i]);
    }

    printf("\n");

    return 0;
}