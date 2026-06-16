#include <stdio.h>

struct X1 {
    int   vi;
    float vf;
};

double foo(double vd, int vi) {
    return vd * vi;
}

extern double pack1(struct X1 *px, int n);

static double pack1_ref(struct X1 *px, int n) {
    double acc = 0;
    int i;
    for (i = 0; i < n; i++)
        acc += foo(px[i].vf, px[i].vi);
    return acc;
}

int main(void) {
    /* Array com 4 elementos:
     *   [0]: vi=2,  vf=3.5f  -> foo = 7.0
     *   [1]: vi=5,  vf=1.0f  -> foo = 5.0
     *   [2]: vi=-1, vf=4.0f  -> foo = -4.0
     *   [3]: vi=10, vf=0.25f -> foo = 2.5
     *   soma esperada = 10.5
     */
    struct X1 arr[] = {
        {  2, 3.5f  },
        {  5, 1.0f  },
        { -1, 4.0f  },
        { 10, 0.25f }
    };
    int n = 4;

    double r_asm = pack1(arr, n);
    double r_ref = pack1_ref(arr, n);

    printf("=== Teste de pack1 (assembly) ===\n");
    printf("Assembly  : %.6f\n", r_asm);
    printf("Referencia: %.6f\n", r_ref);
    printf("%s\n", r_asm == r_ref ? "PASSOU" : "FALHOU");

    /* n=0: deve retornar 0.0 */
    double r0 = pack1(arr, 0);
    printf("\n--- n=0 (esperado 0.0) ---\n");
    printf("Assembly: %.6f  |  %s\n", r0, r0 == 0.0 ? "PASSOU" : "FALHOU");

    /* n=1 */
    double r1 = pack1(arr, 1);
    double e1 = pack1_ref(arr, 1);
    printf("\n--- n=1 (esperado %.1f) ---\n", e1);
    printf("Assembly: %.6f  |  %s\n", r1, r1 == e1 ? "PASSOU" : "FALHOU");

    return 0;
}