#include <stdio.h>

#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))
#define getsig(x)  ((x)>>31 & 1)
#define getexp(x)  ((x)>>23 & 0xff)
#define getfrac(x) ((x) & 0x7fffff)

typedef union { 
  float f;
  unsigned int i;
 } U;

float float2(float f){
    U u; 
    u.f = f;
    unsigned int sign = getsig(u.i);
    unsigned int expo = getexp(u.i);
    unsigned int frac = getfrac(u.i);

    expo += 1;

    u.i = makefloat(sign, expo, frac);

    return u.f;
}

int main(){
    float f = 12.34;

    float res = float2(f);

    printf("resultado: %f\n", res);

    return 0;
}