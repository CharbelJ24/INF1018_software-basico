#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

#define PAGE_START(P) ((intptr_t)(P)&~(pagesize-1))
#define PAGE_END(P)   (((intptr_t)(P)+pagesize-1)&~(pagesize-1))

int execpage(void *ptr, size_t len) {
    int ret;
    const long pagesize = sysconf(_SC_PAGE_SIZE);
    if (pagesize == -1) return -1;
    ret = mprotect((void *)PAGE_START(ptr),
        PAGE_END((intptr_t)ptr + len) - PAGE_START(ptr),
        PROT_READ | PROT_WRITE | PROT_EXEC);
    if (ret == -1) return -1;
    return 0;
}

#undef PAGE_START
#undef PAGE_END

int add(int x) {
    return x + 1;
}

typedef int (*funcp)(int x);

int main() {
    unsigned char codigo[] = {
        0x55,                          /* push %rbp      */
        0x48, 0x89, 0xe5,              /* mov %rsp,%rbp  */
        0xe9, 0x00, 0x00, 0x00, 0x00   /* jmp add        */
    };

    /* jmp começa na pos 4, próxima instrução na pos 9
       deslocamento = endereço de add - endereço de codigo[9]  */
    int32_t deslocamento = (unsigned char *)add - (codigo + 9);
    memcpy(codigo + 5, &deslocamento, 4);

    execpage(codigo, sizeof(codigo));

    funcp f = (funcp)codigo;
    int i = (*f)(10);
    printf("resultado: %d\n", i);
    return 0;
}