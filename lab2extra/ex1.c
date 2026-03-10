#include <stdio.h>

int is_little() {
    unsigned int n = 1;
    char* c = (char*)&n;
    
    if (*c == 1) {
        return 1;
    }
    else {
        return 0;
    }
}

int main() {
    printf("%d", is_little());

    return 0;
}