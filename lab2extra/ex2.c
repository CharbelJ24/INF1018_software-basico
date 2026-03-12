#include <stdio.h>

void num2string(char *s, int num, int base) {
  int i = 0;
  int r;

  while (num > 0) {
    r = num % base;

    if (r < 10)
      s[i++] = '0' + r;
    else
      s[i++] = 'a' + (r - 10);

    num /= base;
  }

  s[i] = '\0';

  int j;
  char tmp;
  for (j = 0; j < i/2; j++) {
    tmp = s[j];
    s[j] = s[i-1-j];
    s[i-1-j] = tmp;
  }
}

int main() {
  char buffer[50];

  num2string(buffer, 1234, 10);
  printf("%s\n", buffer);

  num2string(buffer, 1234, 16);
  printf("%s\n", buffer);

  num2string(buffer, 1234, 2);
  printf("%s\n", buffer);

  return 0;
}