/*
void boo (struct X *px, int n, int val) {
  while (n--) {
    px->val2 = f(px->val1, val);
    px++;
  }
}
*/

.text
.globl boo

boo:

    # prologo
    pushq %rbp
    movq %rsp, %rbp

    pushq %rbx        # salva rbx

    movq %rdi, %rbx   # rbx = px
    movl %esi, %r8d   # r8d = n
    movl %edx, %r9d   # r9d = val

loop:

    # while (n--)
    cmpl $0, %r8d
    je fim

    subl $1, %r8d

    # f(px->val1, val)

    movl 0(%rbx), %edi   # arg1 = px->val1
    movl %r9d, %esi      # arg2 = val

    call f

    # px->val2 = retorno

    movl %eax, 4(%rbx)

    # px++

    addq $8, %rbx

    jmp loop

fim:

    popq %rbx

    leave
    ret