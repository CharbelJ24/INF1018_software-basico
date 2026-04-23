/*
int add (int a, int b, int c) {
  return a+b+c;
}
*/

.text
.globl add
add:
    pushq %rbp
    movq %rsp, %rbp

    movl %edi, %eax     # eax = a
    addl %esi, %eax     # eax = a + b
    addl %edx, %eax     # eax = a + b + c

    leave
    ret
