#include <stdio.h>

/* ------------------------------------------------------------------ */
/* Definição da struct                                                  */
/* ------------------------------------------------------------------ */
struct X {
    int    vi;
    double vd;
    struct X *next;
};

/* ------------------------------------------------------------------ */
/* foo – implementação de referência em C                              */
/* (supõe que foo já foi testada; aqui ela serve como "oráculo")       */
/* ------------------------------------------------------------------ */
double foo(double vd, int vi) {
    return vd * vi;          /* ajuste se sua foo fizer outra coisa   */
}

/* ------------------------------------------------------------------ */
/* Declaração da função pack escrita em assembly                        */
/* ------------------------------------------------------------------ */
extern double pack(struct X *px);

/* ------------------------------------------------------------------ */
/* Referência em C pura para verificação                               */
/* ------------------------------------------------------------------ */
static double pack_ref(struct X *px) {
    double acc = 0.0;
    while (px != NULL) {
        acc += foo(px->vd, px->vi);
        px = px->next;
    }
    return acc;
}

/* ------------------------------------------------------------------ */
/* main                                                                 */
/* ------------------------------------------------------------------ */
int main(void) {
    /* Lista com 4 nós:
     *   nó0: vi=2,  vd=3.5   -> foo = 7.0
     *   nó1: vi=5,  vd=1.0   -> foo = 5.0
     *   nó2: vi=-1, vd=4.0   -> foo = -4.0
     *   nó3: vi=10, vd=0.25  -> foo = 2.5
     *   soma esperada = 7.0 + 5.0 + (-4.0) + 2.5 = 10.5
     */
    struct X n3 = { 10, 0.25, NULL };
    struct X n2 = { -1, 4.0,  &n3  };
    struct X n1 = {  5, 1.0,  &n2  };
    struct X n0 = {  2, 3.5,  &n1  };

    double resultado_asm = pack(&n0);
    double resultado_ref = pack_ref(&n0);

    printf("=== Teste de pack (assembly) ===\n");
    printf("Resultado assembly : %.6f\n", resultado_asm);
    printf("Resultado referência (C): %.6f\n", resultado_ref);

    if (resultado_asm == resultado_ref)
        printf("PASSOU: os resultados coincidem.\n");
    else
        printf("FALHOU: diferença = %.6f\n", resultado_asm - resultado_ref);

    /* Teste com lista de um elemento */
    struct X so_um = { 3, 2.0, NULL };   /* foo = 6.0 */
    double r1 = pack(&so_um);
    double e1 = pack_ref(&so_um);
    printf("\n--- Lista com 1 elemento (esperado %.1f) ---\n", e1);
    printf("Assembly: %.6f  |  %s\n", r1, r1 == e1 ? "PASSOU" : "FALHOU");

    /* Teste com lista vazia */
    double r0 = pack(NULL);
    printf("\n--- Lista vazia (esperado 0.0) ---\n");
    printf("Assembly: %.6f  |  %s\n", r0, r0 == 0.0 ? "PASSOU" : "FALHOU");

    return 0;
}