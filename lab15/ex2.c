#include <stdio.h>
#include <math.h>
 
float foo1(float a, float b);
 
int main(void) {
    /* sin(0) + 1.0 = 0 + 1 = 1 */
    printf("foo1(0, 1.0)       = %f\n",
           foo1(0.0f, 1.0f));
 
    /* sin(PI/2) + 0.0 = 1 + 0 = 1 */
    printf("foo1(PI/2, 0.0)    = %f\n",
           foo1((float)M_PI_2, 0.0f));
 
    /* sin(PI) + 2.0 ~= 0 + 2 = 2 */
    printf("foo1(PI, 2.0)      = %f\n",
           foo1((float)M_PI, 2.0f));
 
    /* sin(PI/6) + 1.0 = 0.5 + 1.0 = 1.5 */
    printf("foo1(PI/6, 1.0)    = %f\n",
           foo1((float)(M_PI/6), 1.0f));
 
    return 0;
}
 
