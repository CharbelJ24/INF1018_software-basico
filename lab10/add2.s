/*
int add2 (struct X *x) {
  if (x == NULL) return 0;
  else return x->val + add2(x->next);
}
*/

.text
.globl add2

add2:
    pushq %rbp
    movq %rsp, %rbp

    #if (x==NULL)
    cmpq $0, %rdi
    je base

    # salva x -> val
    movl 0(%rdi), %eax
    pushq %rax

    # add2(x->next)
    movq 8(%rdi), %rdi
    call add2

    # recupera x->val
    popq %rdx

    # x->val + add2(x->next)
    addl %edx, %eax

    jmp fim

base:
    movl $0, %eax

fim:
    leave
    ret
