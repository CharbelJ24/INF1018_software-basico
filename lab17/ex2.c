#include <stdio.h>

double foo(double a, int b);

int main(void) {
    struct { double a; int b; double expected; const char *desc; } tests[] = {
        {  2.0,   3,   -6.0,  "2.0  * (-3)       = -6.0"  },
        { -4.5,   2,    9.0,  "-4.5 * (-2)       =  9.0"  },
        {  1.0,   0,    0.0,  "1.0  * (-0)       =  0.0"  },
        {  0.0,   5,   -0.0,  "0.0  * (-5)       = -0.0"  },
        {  3.14, -2,    6.28, "3.14 * (-(-2))    =  6.28" },
        { -1.0,  -1,   -1.0,  "-1.0 * (-(-1))    = -1.0"  },
        {  1e10,  3,  -3e10,  "1e10 * (-3)       = -3e10" },
    };
    int n = sizeof(tests) / sizeof(tests[0]), pass = 0;
    for (int i = 0; i < n; i++) {
        double got = foo(tests[i].a, tests[i].b);
        int ok = (got == tests[i].expected);
        pass += ok;
        printf("%-28s  resultado=%12.6g  esperado=%12.6g  %s\n",
               tests[i].desc, got, tests[i].expected, ok ? "✓" : "✗");
    }
    printf("\n%d/%d testes passaram\n", pass, n);
    return pass == n ? 0 : 1;
}