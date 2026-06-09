#include <stdio.h>
#include <math.h>
 
double foo2(float a, float b);
 
int main(void) {
    printf("foo2(0, 0)         = %lf\n",
           foo2(0.0f, 0.0f));
 
    printf("foo2(PI/2, 0)      = %lf\n",
           foo2((float)M_PI_2, 0.0f));
 
    printf("foo2(0, PI/2)      = %lf\n",
           foo2(0.0f, (float)M_PI_2));
 
    printf("foo2(PI/2, PI)     = %lf\n",
           foo2((float)M_PI_2, (float)M_PI));
 
    printf("foo2(PI/6, PI/3)   = %lf\n",
           foo2((float)(M_PI/6), (float)(M_PI/3)));
 
    return 0;
}