#include <stdio.h>

int bitMaisDireita(unsigned int n){
    int i = 0;
    while(n){
        printf("%d\n", n);
        if((n & 0x1) == 1){
            return i;
        }
        i++;
        n = n >> 1;
    }

    return -1;
}

int main(){
    unsigned int n = 10;
    int res = bitMaisDireita(n);

    printf("resultado: %d\n", res);
    
    return 0;
}