/*
struct X {
  int val;
  struct X *next;
};

int add (struct X *x) {
  int a = 0;
  for (; x != NULL; x = x->next)
    a += x->val;
  return a;
}
*/

.text
.globl add

add:
  pushq %rbp
  movq %rsp, %rbp

  # int a = 0
  movl $0, %eax

loop:
  #while (x != NULL)
  cmpq $0, %rdi
  je fim

  # a += x->val
  movl 0(%rdi), %edx
  addl %edx, %eax

  # x = x->next

  movq 8(%rdi), %rdi

  jmp loop

fim:
  leave
  ret
