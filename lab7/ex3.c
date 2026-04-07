#include <stdio.h>

int main(void){
    int i = 1;
    int q;
    while(i != 10){
        q = i * i;
        printf("%d\n", q);
        i++;
    }

    return 0;
}