#include <stdio.h>
 
int main(void) {
    double a = 5.0;
    float b = 3.0;
 
    printf("a = %lf, b = %f\n", a, b);
    printf("foo(%lf, %f) = %f\n", a, b, foo(a, b));
 
    return 0;
}
 
