#include <stdio.h>
#include <stdint.h>
#include <string.h>

int add(int x) {
    return x + 1;
}

typedef int (*funcp)(int x);

int main() {
    unsigned char codigo[] = {
        0x55,                           /* push %rbp     (pos 0) */
        0x48, 0x89, 0xe5,              /* mov %rsp,%rbp (pos 1) */
        0xe8, 0x00, 0x00, 0x00, 0x00,  /* call add      (pos 4) */
        0xc9,                           /* leave         (pos 9) */
        0xc3                            /* ret           (pos a) */
    };

    /* deslocamento = endereço de add - endereço de codigo[9] */
    int32_t deslocamento = (unsigned char *)add - (codigo + 9);
    memcpy(codigo + 5, &deslocamento, 4);

    funcp f = (funcp)codigo;
    int i = (*f)(10);
    printf("resultado: %d\n", i);
    return 0;
}