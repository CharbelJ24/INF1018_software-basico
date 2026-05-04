/*int f(int x);

void map2 (int* um, int * outro, int n) {
  int i;
  for (i=0; i<n; i++) {
    *(outro+i) = f(*(um+i));
  }
}

for (i=0; i<n; i++)
i = 0
while(i<n){
    *(outro+i) = f(*(um+i)); ==>
==> paux = um + i
    param1 = *paux
    temp = f(param1)
    paux = outro + i
    *paux = temp

    i++;
}
*/
/*
rdi  = um
rsi  = outro
edx  = n
ecx  = i
paux = rbx
*/

.text
.globl map2
map2:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp

    # salvar callee-saved
    movq %rbx, -8(%rbp)

    # i = 0
    movl $0, %ecx

loop:
    cmpl %edx, %ecx
    jge fim

    # paux = um + i * 4
    movq %rdi, %rbx
    movslq %ecx, %rax
    imulq $4, %rax           # rax = i * 4
    addq %rax, %rbx          # rbx = um + i*4  →  paux aponta p/ um[i]

    # salvar registradores caller-saved antes de chamar f
    movq %rdi, -16(%rbp)
    movq %rsi, -24(%rbp)
    movl %edx, -28(%rbp)
    movl %ecx, -32(%rbp)

    # param1 = *paux  →  chama f(*(um+i))
    movl (%rbx), %edi
    call f
    # eax = f(*(um+i))

    # restaurar registradores
    movq -16(%rbp), %rdi
    movq -24(%rbp), %rsi
    movl -28(%rbp), %edx
    movl -32(%rbp), %ecx

    # paux = outro + i * 4
    movq %rsi, %rbx          # rbx = outro
    movslq %ecx, %rcx
    imulq $4, %rcx           # rcx = i * 4
    addq %rcx, %rbx          # rbx = outro + i*4  →  paux aponta p/ outro[i]
    movslq -32(%rbp), %rcx   # restaura ecx corretamente após imulq

    # *paux = temp (eax)
    movl %eax, (%rbx)

    # i++
    incl %ecx
    jmp loop

fim:
    movq -8(%rbp), %rbx
    leave
    ret
