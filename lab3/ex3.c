#include <stdio.h>

unsigned char switch_byte(unsigned char x){
    return x >> 4 | x << 4;
}

unsigned char rotate_left(unsigned char x, int n){
    unsigned char r = x >> (8 - n);

    return x << n | r;
}

int main(){
    printf("0x%02X\n", switch_byte(0xAB));

    printf("0X%02X\n", rotate_left(0x61, 1));
    printf("0X%02X\n", rotate_left(0x61, 2));
    printf("0X%02X\n", rotate_left(0x61, 7));
    
    return 0;
}