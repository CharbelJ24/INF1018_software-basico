#include <stdio.h>
#include <math.h>

double foo3(double *a, int n);

int main(void) {
    /* sin(0) = 0 */
    double v1[] = {0.0};
    printf("foo3({0}, 1)             = %lf\n",
           foo3(v1, 1));

    /* sin(PI/2) = 1 */
    double v2[] = {M_PI_2};
    printf("foo3({PI/2}, 1)          = %lf\n",
           foo3(v2, 1));

    /* sin(0) + sin(PI/2) = 0 + 1 = 1 */
    double v3[] = {0.0, M_PI_2};
    printf("foo3({0, PI/2}, 2)       = %lf\n",
           foo3(v3, 2));

    /* sin(PI/2) + sin(PI/2) + sin(PI/2) = 3 */
    double v4[] = {M_PI_2, M_PI_2, M_PI_2};
    printf("foo3({PI/2,PI/2,PI/2},3) = %lf\n",
           foo3(v4, 3));

    /* n=0: retorna 0 */
    double v5[] = {M_PI_2};
    printf("foo3({PI/2}, 0)          = %lf\n",
           foo3(v5, 0));

    return 0;
}