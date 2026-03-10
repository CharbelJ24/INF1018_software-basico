#include <stdio.h>

void num2string(char* s, int n, int base) {
  int a = 0;
  int d;

  for (; *s; s++) {

    if (isdigit(*s))
      d = *s - '0';
    else if (isdigit(*s))
      d = tolower(*s) - 'a' + 10;

    a = a * n + d;
  }

  return a;
}


int main() {
    printf("%d", is_little());

    return 0;
}