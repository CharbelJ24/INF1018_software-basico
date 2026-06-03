#include <stdio.h>

#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))

typedef union { 
  float f;
  unsigned int i;
 } U;

float int2float(int i){
    U u;

    if(i == 0){
        u.i = 0;
        return u.f;
    }

    unsigned int s = 0, e = 0, f = 0;

    unsigned int varAux = i;
    if(i < 0){
        s = 1;
        varAux *= -1;
    }

    int j = 0;
    unsigned int temp = varAux;
    while(temp >>= 1){
        j++;
    }

    e = j + 127;

    unsigned int frac = varAux ^ (1<<j);
    if (j <= 23){
        f = frac << (23 - j);
    } else{
        f = frac >> (j - 23);
    }

    u.i = makefloat(s, e, f);
    return u.f;
}

int main() {
   int i;

   printf("\n******** int2float ****************\n");
   i = 0;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = 1;  
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -1;  
   printf(" %d -> %10.4f\n", i, int2float(i));
   i = 0x7fffffff;  
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -i;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = 12345;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -12345;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   return 0;
}