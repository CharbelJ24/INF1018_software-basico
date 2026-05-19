/*
int novonum(void) {
  int minhalocal;
  printf("numero: ");
  scanf("%d",&minhalocal);
  return minhalocal;
}
*/
.data
s1: .string "numero: "
s2: .string "%d"

.text
.globl novonum
novonum:
    pushq %rbp
    movq %rsp, %rbp

    subq $16, %rsp

    movq $s1, %rdi
    movl $0, %eax
    call printf

    movq $s2, %rdi
    leaq -4(%rbp), %rsi
    movl $0, %eax
    call scanf

    movl -4(%rbp), %eax

    leave
    ret    
