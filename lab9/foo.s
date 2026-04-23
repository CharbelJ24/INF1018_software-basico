/*
void foo (int a[], int n) {
  int i;
  int s = 0;
  for (i=0; i<n; i++) {
    s += a[i];
    if (a[i] == 0) {
      a[i] = s;
      s = 0;
*/

.text 
.globl foo
foo:
    push %rbp
    movq %rsp, %rbp

    subq $16, %rsp
    movl $0, -4(%rbp)       # i = 0
    movl $0, -8(%rbp)       # s = 0

loop:
    # if (i >= n)
    movl -4(%rbp), %eax
    cmpl %esi, %eax
    jge fim

    # calcular endereço a[i]
    movl -4(%rbp), %eax
    imull $4, %eax

    movq %rdi, %rcx
    addq %rax, %rcx

    # s += a[i]
    movl (%rcx), %edx
    addl %edx, -8(%rbp)

    movl $0, -8(%rbp)       # s = 0

continua:
    addl $1, -4(%rbp)       # i++

    jmp loop

fim:
    leave
    ret
